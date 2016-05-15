# based on ubuntu
FROM gcc:4.9

# install cmake
RUN git clone --depth 1 https://github.com/Kitware/CMake.git /usr/src/cmake && \
    cd /usr/src/cmake && \
    ./bootstrap && make && make install

# https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends libtool autoconf automake g++ pkg-config unzip

ENTRYPOINT ["/bin/bash"]

# usage:
# cd neovim-path && docker run -it -v "$PWD":/usr/src/neovim docker-image-tag
