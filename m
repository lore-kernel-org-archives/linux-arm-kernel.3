Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B946DC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 10:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7s0K4WHliGKFdPFhl8MQS72UtHPv10vOZ0g0k2aEl9I=; b=c4DjFwQDJFYoBK1zS2nYvN2BVI
	3/RcboPZhdLnp5tLpkIuvI7tORYMzax8ZVcFruMEccrWd2/YUeP829iRrem/IzKS1+hxCCOXgUGLK
	2jNwggPvD4mhIgCsAY/evAMKJC1BdumiBlWh2wdHC4ZWSsuQPcRT5cUGRLZGb3IZcHeWfnU0Tmaae
	dlraDhMhyUtJIP+/hP8VvgOiwdeJUpf7Ltuowmd0sb7Bp5NjIngVFzRmY4UixRp+jQ6bbb9AhRAWN
	/GSJ53HazSfpf17mSpzKjUDy4GPnb9uWL49U1hsSS+3SPyXg+/H+RjwJxVts7w99Hdp8SyfJWLtlQ
	fIQ2iOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnER-00000001TJa-2ec3;
	Fri, 02 May 2025 10:02:59 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnCR-00000001Se1-128s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 10:00:56 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac7bd86f637so541855966b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 03:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180053; x=1746784853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7s0K4WHliGKFdPFhl8MQS72UtHPv10vOZ0g0k2aEl9I=;
        b=ORPBPQ3/REJk02PGYsuI6n4CyjvHn2Mp/1nwSLwiPr9+T7I3NBgQcnvUMw23hKBaUR
         wXkeARVP8sJV5jOg7ywjSIcjYHl2qQ+7AYYI/LsP+ro6jmnAD2RfhsInWvI0frIfNTar
         wlJtBYuRR93oaLxhruE4wW2iBzG3emmlUUxiOzkKP6praPQA9YIzbVwp16gswWp498Uo
         XfZ7QGWcuIPymUMnOx6kUjWMzuYlIh9+7srpOpOLcKSxotcLwKsnJja4DNjiUJe1yWvy
         qHHCJBJG2TE22nQ6bjSFMlE4B6n5bz8KJ3pLXRgl91ymhWDNf9EMnqzLb6B4dwt5/OCf
         l4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180053; x=1746784853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7s0K4WHliGKFdPFhl8MQS72UtHPv10vOZ0g0k2aEl9I=;
        b=meMl6uI/xUJ6vKm1xVpioVlCug1pHk3STwiSOvZg8FWtgNnZ3JDGAvqP457SeCu196
         HfAdw+AmyGPYT1wn1X4tWV11U6ZbnOueMNp7sEhNCaEeHLrv1O9LDJd5jMDbaQV2V3HR
         X9EmdV5K0FjjhovYeFswIcwYAM+9dHd646lXsvnfIpv3DfS37RpXu0k2blvCjzJU4NHv
         8pQlY4Omx4mZe7LSyCu57gojeHHk3jKopCOgjGEpRwT7TOw8D9RbHEtJpHiI0ex7xrhf
         630w1n5ETTgUpiFPSa1FukLLkRrv6ryfC+QKio0cXmxv9gZPO1r4JCx38RZLSEJF+Dq0
         bCEA==
X-Forwarded-Encrypted: i=1; AJvYcCVx+I5HU0zi/1wPNODTQ552RGOyUZKwatJy5zgufBcjx9O9ttBWhk/Tw3w1Jjg/70arJBxlSc5bCPFPweZzblvq@lists.infradead.org
X-Gm-Message-State: AOJu0YwKUQWnaLo0C3rl8MKw4QNqi8O9DK1rX3TW3RcP+/EysOUW/Uo2
	jeyDlkbk79fyZfpFqM1S6NzIgp01rbZsX0FxfdTW5kQCFvUvUS8LwEtDskdHvXGYxRcffznXkLW
	3SD4=
X-Gm-Gg: ASbGnctBW3g22bMwkFxTMeca5J5rYL+lKmQ1HMR1P4SVwCcxPvhhw4JSqaxYTFCgufi
	ZWkis1lzV5W8iK95iKFk5Zwxkblf1B6oUYU4PUmSoquJ+6WzQQ0RThsv2cnQZqmCiVNQtzSrDc3
	N1QHy9Ghrb2w3kVIeCEjSootUzGhJzu6ho0YK7IXewZE3n/YA53JIZd5fBweqsIJ72CVgs2LOc8
	YyKj4SfzvWU4WPhayXsi7t8XE7MyKTZTIuk6W1k8uf4/yCwtnS4RdSuivCn/8zH0qtqBXKwLXsd
	ouoGhuh+i4dqsD3BXsaFgm5SAebb4v7hhX0IEv4UFPS+Ro6bteVlUBcV/U/hZaYUDhm1PJaL/KQ
	KZImW+u8i9cNr2FRtuHjXhiNaN8py
X-Google-Smtp-Source: AGHT+IFVQ05Wy19uhQgm3WGFHmkjNDkU/CkOZ/JefCJgyEqixW3GP1YNcmydW/OHUj5KILxYfZoE8Q==
X-Received: by 2002:a17:907:6e87:b0:ace:4ed9:a8c3 with SMTP id a640c23a62f3a-ad17ad876e4mr209631266b.7.1746180052767;
        Fri, 02 May 2025 03:00:52 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:00:52 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v8 00/14] TEE subsystem for protected dma-buf allocations
Date: Fri,  2 May 2025 11:59:14 +0200
Message-ID: <20250502100049.1746335-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_030055_312051_803680FF 
X-CRM114-Status: GOOD (  28.67  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

This patch set allocates the protected DMA-bufs from a DMA-heap
instantiated from the TEE subsystem.

The TEE subsystem handles the DMA-buf allocations since it is the TEE
(OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QTEE) which sets up the
protection for the memory used for the DMA-bufs.

The DMA-heap uses a protected memory pool provided by the backend TEE
driver, allowing it to choose how to allocate the protected physical
memory.

The allocated DMA-bufs must be imported with a new TEE_IOC_SHM_REGISTER_FD
before they can be passed as arguments when requesting services from the
secure world.

Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
Recording) has been identified so far to serve as examples of what can be
expected. The use-cases has predefined DMA-heap names,
"protected,secure-video", "protected,trusted-ui", and
"protected,secure-video-record". The backend driver registers protected
memory pools for the use-cases it supports.

Each use-case has it's own protected memory pool since different use-cases
requires isolation from different parts of the system. A protected memory
pool can be based on a static carveout instantiated while probing the TEE
backend driver, or dynamically allocated from CMA and made protected as
needed by the TEE.

This can be tested on a RockPi 4B+ with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml \
        -b prototype/sdp-v8
repo sync -j8
cd build
make toolchains -j$(nproc)
make all -j$(nproc)
# Copy ../out/rockpi4.img to an SD card and boot the RockPi from that
# Connect a monitor to the RockPi
# login and at the prompt:
gst-launch-1.0 videotestsrc ! \
        aesenc key=1f9423681beb9a79215820f6bda73d0f \
                iv=e9aa8e834d8d70b7e0d254ff670dd718 serialize-iv=true ! \
        aesdec key=1f9423681beb9a79215820f6bda73d0f ! \
        kmssink

The aesdec module has been hacked to use an OP-TEE TA to decrypt the stream
into protected DMA-bufs which are consumed by the kmssink.

The primitive QEMU tests from previous patch set can be tested on RockPi
in the same way with:
xtest --sdp-basic

The primitive test are tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v8
repo sync -j8
cd build
make toolchains -j$(nproc)
make SPMC_AT_EL=1 all -j$(nproc)
make SPMC_AT_EL=1 run-only
# login and at the prompt:
xtest --sdp-basic

The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
S-EL1 inside OP-TEE. The parameter can be changed into SPMC_AT_EL=n to test
without FF-A using the original SMC ABI instead. Please remember to do
%rm -rf ../trusted-firmware-a/build/qemu
for TF-A to be rebuilt properly using the new configuration.

https://optee.readthedocs.io/en/latest/building/prerequisites.html
list dependencies needed to build the above.

The tests are pretty basic, mostly checking that a Trusted Application in
the secure world can access and manipulate the memory. There are also some
negative tests for out of bounds buffers etc.

Thanks,
Jens

Changes since V7:
* Adding "dma-buf: dma-heap: export declared functions",
  "cma: export cma_alloc() and cma_release()", and
  "dma-contiguous: export dma_contiguous_default_area" to export the symbols
  needed to keep the TEE subsystem as a load module.
* Removing CONFIG_TEE_DMABUF_HEAP and CONFIG_TEE_CMA since they aren't
  needed any longer.
* Addressing review comments in "optee: sync secure world ABI headers"
* Better align protected memory pool initialization between the smc-abi and
  ffa-abi parts of the optee driver.

Changes since V6:
* Restricted memory is now known as protected memory since to use the same
  term as https://docs.vulkan.org/guide/latest/protected.html. Update all
  patches to consistently use protected memory.
* In "tee: implement protected DMA-heap" add the hidden config option
  TEE_DMABUF_HEAP to tell if the DMABUF_HEAPS functions are available
  for the TEE subsystem
* Adding "tee: refactor params_from_user()", broken out from the patch
  "tee: new ioctl to a register tee_shm from a dmabuf file descriptor"
* For "tee: new ioctl to a register tee_shm from a dmabuf file descriptor":
  - Update commit message to mention protected memory
  - Remove and open code tee_shm_get_parent_shm() in param_from_user_memref()
* In "tee: add tee_shm_alloc_cma_phys_mem" add the hidden config option
  TEE_CMA to tell if the CMA functions are available for the TEE subsystem
* For "tee: tee_device_alloc(): copy dma_mask from parent device" and
  "optee: pass parent device to tee_device_alloc", added
  Reviewed-by: Sumit Garg <sumit.garg@kernel.org>

Changes since V5:
* Removing "tee: add restricted memory allocation" and
  "tee: add TEE_IOC_RSTMEM_FD_INFO"
* Adding "tee: implement restricted DMA-heap",
  "tee: new ioctl to a register tee_shm from a dmabuf file descriptor",
  "tee: add tee_shm_alloc_cma_phys_mem()",
  "optee: pass parent device to tee_device_alloc()", and
  "tee: tee_device_alloc(): copy dma_mask from parent device"
* The two TEE driver OPs "rstmem_alloc()" and "rstmem_free()" are replaced
  with a struct tee_rstmem_pool abstraction.
* Replaced the the TEE_IOC_RSTMEM_ALLOC user space API with the DMA-heap API

Changes since V4:
* Adding the patch "tee: add TEE_IOC_RSTMEM_FD_INFO" needed by the
  GStreamer demo
* Removing the dummy CPU access and mmap functions from the dma_buf_ops
* Fixing a compile error in "optee: FF-A: dynamic restricted memory allocation"
  reported by kernel test robot <lkp@intel.com>

Changes since V3:
* Make the use_case and flags field in struct tee_shm u32's instead of
  u16's
* Add more description for TEE_IOC_RSTMEM_ALLOC in the header file
* Import namespace DMA_BUF in module tee, reported by lkp@intel.com
* Added a note in the commit message for "optee: account for direction
  while converting parameters" why it's needed
* Factor out dynamic restricted memory allocation from
  "optee: support restricted memory allocation" into two new commits
  "optee: FF-A: dynamic restricted memory allocation" and
  "optee: smc abi: dynamic restricted memory allocation"
* Guard CMA usage with #ifdef CONFIG_CMA, effectively disabling dynamic
  restricted memory allocate if CMA isn't configured

Changes since the V2 RFC:
* Based on v6.12
* Replaced the flags for SVP and Trusted UID memory with a u32 field with
  unique id for each use case
* Added dynamic allocation of restricted memory pools
* Added OP-TEE ABI both with and without FF-A for dynamic restricted memory
* Added support for FF-A with FFA_LEND

Changes since the V1 RFC:
* Based on v6.11
* Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_ALLOC

Changes since Olivier's post [2]:
* Based on Yong Wu's post [1] where much of dma-buf handling is done in
  the generic restricted heap
* Simplifications and cleanup
* New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
  support"
* Replaced the word "secure" with "restricted" where applicable



Etienne Carriere (1):
  tee: new ioctl to a register tee_shm from a dmabuf file descriptor

Jens Wiklander (13):
  tee: tee_device_alloc(): copy dma_mask from parent device
  optee: pass parent device to tee_device_alloc()
  optee: account for direction while converting parameters
  optee: sync secure world ABI headers
  dma-buf: dma-heap: export declared functions
  tee: implement protected DMA-heap
  tee: refactor params_from_user()
  cma: export cma_alloc() and cma_release()
  dma-contiguous: export dma_contiguous_default_area
  tee: add tee_shm_alloc_cma_phys_mem()
  optee: support protected memory allocation
  optee: FF-A: dynamic protected memory allocation
  optee: smc abi: dynamic protected memory allocation

 drivers/dma-buf/dma-heap.c        |   3 +
 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/call.c          |  10 +-
 drivers/tee/optee/core.c          |   1 +
 drivers/tee/optee/ffa_abi.c       | 198 ++++++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 +-
 drivers/tee/optee/optee_msg.h     |  83 +++++-
 drivers/tee/optee/optee_private.h |  55 +++-
 drivers/tee/optee/optee_smc.h     |  69 ++++-
 drivers/tee/optee/protmem.c       | 330 +++++++++++++++++++++
 drivers/tee/optee/rpc.c           |  31 +-
 drivers/tee/optee/smc_abi.c       | 191 ++++++++++--
 drivers/tee/tee_core.c            | 157 +++++++---
 drivers/tee/tee_heap.c            | 470 ++++++++++++++++++++++++++++++
 drivers/tee/tee_private.h         |  16 +
 drivers/tee/tee_shm.c             | 164 ++++++++++-
 include/linux/tee_core.h          |  70 +++++
 include/linux/tee_drv.h           |  10 +
 include/uapi/linux/tee.h          |  31 ++
 kernel/dma/contiguous.c           |   1 +
 mm/cma.c                          |   2 +
 22 files changed, 1789 insertions(+), 132 deletions(-)
 create mode 100644 drivers/tee/optee/protmem.c
 create mode 100644 drivers/tee/tee_heap.c


base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
-- 
2.43.0


