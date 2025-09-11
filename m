Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E051CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JtDMUhbai62kxq3n8kKo67cCRGiyz/FmvNZNSwA/DhQ=; b=1fLwCaEBvibCyG7UJ8csKnmzAJ
	jNJb+R7KxZ7fgBzh7r0S8gZTrKb24Ne++L0vO2DxjkYP0SlhDorly7HFpK/xiX1fDT5zo4A0ccMMs
	tSPfhrOD7N2PC5d3bnyPN0NCxNxfBLsE6LhsLaTKR7OFmEzv7NWMJTfZc5yupNKQ+aVy4PTkhLdWL
	1gVgfeezjOKxf8Qt47dRP2irmzyzQmLpvK/fXkwklLWJcV7A/klj6HDy7VbTRFu7+zFNl5yP2eVCb
	0biyi5bqeYNj8HdlAWK/nEpES6JVpTTlLPzcjQsbJut8rxBQdYsrDqnHtJmLsp1VHEZQmxU/5jZws
	4t6/zonA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgq-00000003Lso-0DWR;
	Thu, 11 Sep 2025 13:50:20 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgn-00000003Lq6-2Sho
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:50:19 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e96e5535fcdso1767102276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757598616; x=1758203416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JtDMUhbai62kxq3n8kKo67cCRGiyz/FmvNZNSwA/DhQ=;
        b=niLO1d4WpfVrHJXkU5FOPDegdgrv3Bn6XbTdTdZ7Wr30e9qsCCUFkJw0nojGwaksuS
         qTXy/dwTuVZS/gL3qYUljM8xjcRwNHmURFzhRr0d0269iQ69u+EWGOH1qHlW/maOIp4e
         Adg+ruR4U2UFnGlpYThLt27UNjHxCinKKGHYMWe987kPnEgv/SwyrDDmpAUs3xVVrNNW
         2ZISOxjw/LJxaVvkFr5ieOEQdyeyST5gWKxOvlyVkhszB3nn0bZM8PPQBA9U4+WFciUc
         cBhptjojXF0xotyg8u3j+VSQFDoNvuvBMIHflwv4ikBBoc+HoidngcFvVpEVmJgs4FFQ
         u88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598616; x=1758203416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtDMUhbai62kxq3n8kKo67cCRGiyz/FmvNZNSwA/DhQ=;
        b=eWwff7OE5fUQTISHnaHZdtXJJ2wdLf/caAsP9FbYp7c02EYLmFEZYDp3MeAEh+3esz
         Ka2EJnSWWcvJ40EcsUnMDGhOPPmb01ZIDw2fZUnh8N2XW4xzCoJusUHo4kJ9W+4pMpKt
         zz5cNdAT0PzVc0EQQXhso6lvUVghE1i0onlfbuIIVcapizBIYt8ZWnaUnn3IRyx8I+pb
         3eG/1QX/QJhSVKguxNu7gifAOSfNoYumpLcOOwIncxLK62KnBYVnMTjfaMUiu5oDnfKX
         lqa+3mnHZOB1dF56yErnTryU4rH6O/4jzzjDtlddqe52Xs+2z9IB+sLtA7ODT0qHBoN4
         Za/g==
X-Forwarded-Encrypted: i=1; AJvYcCXxth6KT4Yb582nZRgWfB4qVUEvMZRdvEcaFTz3NtjX08dYIPU4u/5YBo7fgvdz5kuloaHQvI31+joGL/p/CZ1G@lists.infradead.org
X-Gm-Message-State: AOJu0YwF7EPDeSvEpOt3KxpEwWoWA03QFrZin6NW7904NGBp4gITXGcv
	PvKpKCJ5cErQm+DA+fFZJxuC+AOLYPTj2iFIKbr2KMOQOR1/n2RbS3+YzVz1D3JMIa8=
X-Gm-Gg: ASbGncuvS9afE7qfHORIQDM/Sp4EgSDFrfGcFIhj/oTSP8HV3auzPjQH6ybPRU5gGz8
	kY2o8PVSR7zW7LxP2a3HpjSV0tLSZlmGeEQ30fNw/qHZpDoZJLqqnQsNu2GOVSs4W1DqPIOTqV+
	XquJ/4FquAVcWhjrTXCrYDlk1vB5hvybBjRwiKgHqCBU4yuOIugMbTfBTofQ4V1UcvofNAUyNoL
	nGhRETmX0nnOB7Bj4Qv3QnSSYd0kqrc3kBb85WG2L1l1Ei/f2DEIeerxe0oAxS7meRDCYd24Uep
	hwPumFWGAz1LroSHQp3OXOSoqEhwg7+gSY9vJiQgHlywFgnVE0qqgTwUbTX+511nDofgqmxG2+5
	lN/bw/Ez2a+HmvRmWzcUOafTzwRN4CUs8KYrjmovp9Z885bQQpo6nI9yh2pVpKPF8eZalDuw9ST
	7MoxgUM0ZEC9VPJjB+b0JI
X-Google-Smtp-Source: AGHT+IHbfoA81dXA4GxjWQ56zMxLZWMAIRCEmHjjVIDkGG/G1uhNR5mpx/anEbv76JrIjHUHGGPFSQ==
X-Received: by 2002:a05:690e:1553:10b0:622:66fb:f243 with SMTP id 956f58d0204a3-6233c3b9cedmr2754702d50.13.1757598616061;
        Thu, 11 Sep 2025 06:50:16 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:50:14 -0700 (PDT)
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
	robin.murphy@arm.com,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v12 0/9] TEE subsystem for protected dma-buf allocations
Date: Thu, 11 Sep 2025 15:49:41 +0200
Message-ID: <20250911135007.1275833-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_065017_671736_1129085D 
X-CRM114-Status: GOOD (  32.54  )
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
Recording) have been identified so far to serve as examples of what can be
expected. The use-cases have predefined DMA-heap names,
"protected,secure-video", "protected,trusted-ui", and
"protected,secure-video-record". The backend driver registers protected
memory pools for the use-cases it supports.

Each use-case has its own protected memory pool since different use-cases
require isolation from different parts of the system. A protected memory
pool can be based on a static carveout instantiated while probing the TEE
backend driver, or dynamically allocated from CMA (dma_alloc_pages()) and
made protected as needed by the TEE.

This can be tested on a RockPi 4B+ with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml \
        -b prototype/sdp-v12
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

The primitive QEMU tests from previous patch sets can be tested on RockPi
in the same way using:
xtest --sdp-basic

The primitive tests are tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v12
repo sync -j8
cd build
make toolchains -j$(nproc)
make SPMC_AT_EL=1 all -j$(nproc)
make SPMC_AT_EL=1 run-only
# login and at the prompt:
xtest --sdp-basic

The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
S-EL1 inside OP-TEE. The parameter can be changed to SPMC_AT_EL=n to test
without FF-A using the original SMC ABI instead. Please remember to do
%make arm-tf-clean
for TF-A to be rebuilt properly using the new configuration.

https://optee.readthedocs.io/en/latest/building/prerequisites.html
list dependencies required to build the above.

The primitive tests are pretty basic, mostly checking that a Trusted
Application in the secure world can access and manipulate the memory. There
are also some negative tests for out of bounds buffers, etc.

Thanks,
Jens

Changes since V11:
* In "dma-buf: dma-heap: export declared functions":
  - use EXPORT_SYMBOL_NS_GPL()
  - Added TJ's R-B and Sumit's Ack
* In "tee: implement protected DMA-heap", import the namespaces "DMA_BUF"
  and "DMA_BUF_HEAP" as needed.

Changes since V10:
* Changed the new ABI OPTEE_MSG_CMD_GET_PROTMEM_CONFIG to report a list
  of u32 memory attributes instead of u16 endpoints to make room for both
  endpoint and access permissions in each entry.
* In "tee: new ioctl to a register tee_shm from a dmabuf file descriptor",
  remove the unused path for DMA-bufs allocated by other means than the on
  in the TEE SS.
* In "tee: implement protected DMA-heap", handle unloading of the
  backend driver module implementing the heap. The heap is reference
  counted and also calls tee_device_get() to guarantee that the module
  remains available while the heap is instantiated.
* In "optee: support protected memory allocation", use
  dma_coerce_mask_and_coherent() instead of open-coding the function.
* Added Sumit's R-B to
  - "optee: smc abi: dynamic protected memory allocation"
  - "optee: FF-A: dynamic protected memory allocation"
  - "optee: support protected memory allocation"
  - "tee: implement protected DMA-heap"
  - "dma-buf: dma-heap: export declared functions"

Changes since V9:
* Adding Sumit's R-B to "optee: sync secure world ABI headers"
* Update commit message as requested for "dma-buf: dma-heap: export
  declared functions".
* In "tee: implement protected DMA-heap":
  - add the hidden config option TEE_DMABUF_HEAPS to tell if the TEE
    subsystem can support DMA heaps
  - add a pfn_valid() to check that the passed physical address can be
    used by __pfn_to_page() and friends
  - remove the memremap() call, the caller is should do that instead if
    needed
* In "tee: add tee_shm_alloc_dma_mem()" guard the calls to
  dma_alloc_pages() and dma_free_pages() with TEE_DMABUF_HEAPS to avoid
  linking errors in some configurations
* In "optee: support protected memory allocation":
  - add the hidden config option OPTEE_STATIC_PROTMEM_POOL to tell if the
    driver can support a static protected memory pool
  - optee_protmem_pool_init() is slightly refactored to make the patches
    that follow easier
  - Call devm_memremap() before calling tee_protmem_static_pool_alloc()

Changes since V8:
* Using dma_alloc_pages() instead of cma_alloc() so the direct dependency on
  CMA can be removed together with the patches
  "cma: export cma_alloc() and cma_release()" and
  "dma-contiguous: export dma_contiguous_default_area". The patch
* Renaming the patch "tee: add tee_shm_alloc_cma_phys_mem()" to
  "tee: add tee_shm_alloc_dma_mem()"
* Setting DMA mask for the OP-TEE TEE device based on input from the secure
  world instead of relying on the parent device so following patches are
  removed: "tee: tee_device_alloc(): copy dma_mask from parent device" and
  "optee: pass parent device to tee_device_alloc()".
* Adding Sumit Garg's R-B to "tee: refactor params_from_user()"
* In the patch "tee: implement protected DMA-heap", map the physical memory
  passed to tee_protmem_static_pool_alloc().

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
* Removing the patch "optee: account for direction while converting parameters"

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

Jens Wiklander (8):
  optee: sync secure world ABI headers
  dma-buf: dma-heap: export declared functions
  tee: implement protected DMA-heap
  tee: refactor params_from_user()
  tee: add tee_shm_alloc_dma_mem()
  optee: support protected memory allocation
  optee: FF-A: dynamic protected memory allocation
  optee: smc abi: dynamic protected memory allocation

 drivers/dma-buf/dma-heap.c        |   4 +
 drivers/tee/Kconfig               |   5 +
 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Kconfig         |   5 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/core.c          |   7 +
 drivers/tee/optee/ffa_abi.c       | 146 ++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 +-
 drivers/tee/optee/optee_msg.h     |  84 ++++-
 drivers/tee/optee/optee_private.h |  15 +-
 drivers/tee/optee/optee_smc.h     |  37 ++-
 drivers/tee/optee/protmem.c       | 335 ++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 141 ++++++++-
 drivers/tee/tee_core.c            | 158 +++++++---
 drivers/tee/tee_heap.c            | 500 ++++++++++++++++++++++++++++++
 drivers/tee/tee_private.h         |  14 +
 drivers/tee/tee_shm.c             | 157 +++++++++-
 include/linux/tee_core.h          |  59 ++++
 include/linux/tee_drv.h           |  10 +
 include/uapi/linux/tee.h          |  31 ++
 20 files changed, 1670 insertions(+), 67 deletions(-)
 create mode 100644 drivers/tee/optee/protmem.c
 create mode 100644 drivers/tee/tee_heap.c


base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
-- 
2.43.0


