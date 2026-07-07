#!/bin/bash

set -e

conda create -y -n ultrashape python=3.10

# Activate conda environment inside script
eval "$(conda shell.bash hook)"
conda activate ultrashape

conda install -y -c nvidia/label/cuda-12.8.0 \
  cuda-compiler cuda-cudart-dev cuda-libraries-dev

pip install torch==2.7.0 torchvision==0.22.0 torchaudio==2.7.0 --index-url https://download.pytorch.org/whl/cu128
pip install -r requirements.txt
pip install diso==0.1.4 --no-build-isolation
pip install flash_attn==2.8.3 --no-build-isolation
pip install deepspeed --no-build-isolation
pip install sageattention==1.0.6 --no-build-isolation
pip install git+https://github.com/ashawkey/cubvh --no-build-isolation

pip install --no-build-isolation "git+https://github.com/facebookresearch/pytorch3d.git@stable"
pip install torch-cluster -f https://data.pyg.org/whl/torch-2.7.0+cu128.html
