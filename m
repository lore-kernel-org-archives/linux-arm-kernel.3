Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F47AC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7SQjgG6U13+uAQOBhn9HhQeG3VGEtTdqOEuDMKUhZ7o=; b=mu2T1jkJ4vfI/Rm1rOBI+rVzzX
	MmiSontouao0pxuBBokUYjK4PB8hMdWX5gCW1YNbfeJ3dvxuEVWVQg9YYrKBf9bp8fy9v4/FENwTO
	zrcIi2RS0P/CYANaefgX8OHk1j4CPb47FoouypZPFiSRHuxcsZQIAyTNMXSXssd7QvE6IkB1JyC/k
	pjhayladpvZa8Hv634bKfEvNamtbRZN+SeFB2SaLj8KAWRjTiFQwbDp95+YJmmeDtVIZi2bwh7tdG
	ysrWHbI1z9D3RLY3Cy0TZb8Dxi9BPicaB0JS82yhHnNeuixmIqpFXB7oSYQnI63wh9tZ2KI8myaLY
	7wnlhfzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpolO-00000008Bcp-40U2;
	Wed, 05 Mar 2025 13:26:18 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoSQ-000000087o9-2n55
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:06:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-abfe7b5fbe8so455929966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 05:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180000; x=1741784800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SQjgG6U13+uAQOBhn9HhQeG3VGEtTdqOEuDMKUhZ7o=;
        b=lAZ00sb9DZPLDoUdpByPENmVW2UJTLbDbe/ZiNWg9eaYzPHl0pPH7ZSAmKVwAkS2xw
         YcyrjXF4xxp1IyZlkS/lQuBMZenZafx79tNJ108NvyI+EqgMOGJdOuVqYM8uXPRobtAF
         rbIgIySbBdTQoRO+33uuMMte3K6W/J9H0Bj8hc1YcWypBQ+wTa/ymmsYnzrPmf4/fxWP
         1mQA8/V7jwdgXLiMOxeL9JovIA5wJcxRuNPpJYcpWoI9KLRbcJz2V+65FHbM/NCsfDvM
         wZ2RAvpTGTrCrPoG60CbXPwiB3WDwFosZ5p7MNpe7UQIOsbLbcXNSdNw51vvY+MlOeLD
         8/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180000; x=1741784800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SQjgG6U13+uAQOBhn9HhQeG3VGEtTdqOEuDMKUhZ7o=;
        b=PdyJWsYhcObTgo9FTsudbZbQuoku1l2ZW+cwYkNVetNjA4T706CpzzV+8uz4SKsHCa
         aw7Lr7NLJX459ogNvtUq7FHxQyVoyrjiwohxftu0+bLJRUxc4o8mRQsmj67jo1MN84yV
         5UJnQqUTtrDfME8LypD20C8CNpBiTdseCVDsZbXP84PJie+GbdVzcNRakQHvqhjlajyb
         6CS91j6vZorvROxrusOwyAWaSBrPz4nHT9/KDnYAsixwIhDIdcexhen+G2enYFkEfzRy
         VYWlAqK3OhXtCP9pE20fMpm3q622XR5MJ18yENUpcRYuSEp174SPGOMJYkCgUIOclUZ/
         epnw==
X-Forwarded-Encrypted: i=1; AJvYcCXng9t79jdV6ro1wz1VTTWf7S0P5/FrkXYcCjz+/sPcjR5i5AWzLsnNAzIUg7VCpYj3uWAywyK1gc+wQduer3JI@lists.infradead.org
X-Gm-Message-State: AOJu0YyC6rpEvKmZnkMtM1NoWXX296s4+ler1LSh4zqsrqlH6mrYE3D8
	1KGuPtV58fd+ebRzZLYk9tOcYo5pPlmzkAo1PZ51HrVtUQQhOW9POGDt/dvIuM0=
X-Gm-Gg: ASbGncvK1jxsUcfdcgVsB7Ts9xs6lQzBapqvUhIcGlpLiTzjKEs+MaDUVNkFABbI0AE
	CLMwu4gukOQYAlKOONZ20iFL0htTl7oUnI9wM28CssuDtP9c4Izu68TlNSu6KvrmRj9AMlJkyUO
	4UeU0yEBrN9rnUY+LMx2TsnOqYNxWvZN0OUX65K6Es55F0gUNmEHudzABKdxok9XEDUus+eCbYd
	FmOFx70DWr0uPlZV6NBB+XF8Zuvw+yw5/TRg0rb612Co/fKslTXEd6V+zsoCFZ8LRv5sdh7zQYr
	q1RLzQRtGBoJNkR8cU5kDy5oiz11PHpayp5mT0IrqOCqa89lpoA2X3yk0R/aQCcE9m5t3s81A9m
	/YsCVV7q9RsVJeB/yLyagDg==
X-Google-Smtp-Source: AGHT+IHuCz71jYp7eU0HTiLFptbPk6lrg0W55Lpw1DSz92hnpN7BGzAC+85g1xWfhNsyzgUyDK+bpg==
X-Received: by 2002:a05:6402:13cd:b0:5dc:74fd:abf1 with SMTP id 4fb4d7f45d1cf-5e59f3ee29amr7186053a12.15.1741180000374;
        Wed, 05 Mar 2025 05:06:40 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:06:39 -0800 (PST)
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
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 00/10] TEE subsystem for restricted dma-buf allocations
Date: Wed,  5 Mar 2025 14:04:06 +0100
Message-ID: <20250305130634.1850178-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_050642_713039_9044C02F 
X-CRM114-Status: GOOD (  25.59  )
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

This patch set allocates the restricted DMA-bufs from a DMA-heap
instantiated from the TEE subsystem.

The TEE subsystem handles the DMA-buf allocations since it is the TEE
(OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QTEE) which sets up the
restrictions for the memory used for the DMA-bufs.

The DMA-heap uses a restricted memory pool provided by the backend TEE
driver, allowing it to choose how to allocate the restricted physical
memory.

The allocated DMA-bufs must be imported with a new TEE_IOC_SHM_REGISTER_FD
before they can be passed as arguments when requesting services from the
secure world.

Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
Recording) has been identified so far to serve as examples of what can be
expected. The use-cases has predefined DMA-heap names,
"restricted,secure-video", "restricted,trusted-ui", and
"restricted,secure-video-record". The backend driver registers restricted
memory pools for the use-cases it supports.

Each use-case has it's own restricted memory pool since different use-cases
requires isolation from different parts of the system. A restricted memory
pool can be based on a static carveout instantiated while probing the TEE
backend driver, or dynamically allocated from CMA and made restricted as
needed by the TEE.

This can be tested on a RockPi 4B+ with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml \
        -b prototype/sdp-v6
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
into restricted DMA-bufs which are consumed by the kmssink.

The primitive QEMU tests from previous patch set can be tested on RockPi
in the same way with:
xtest --sdp-basic

The primitive test are tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v6
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

Jens Wiklander (9):
  tee: tee_device_alloc(): copy dma_mask from parent device
  optee: pass parent device to tee_device_alloc()
  optee: account for direction while converting parameters
  optee: sync secure world ABI headers
  tee: implement restricted DMA-heap
  tee: add tee_shm_alloc_cma_phys_mem()
  optee: support restricted memory allocation
  optee: FF-A: dynamic restricted memory allocation
  optee: smc abi: dynamic restricted memory allocation

 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/call.c          |  10 +-
 drivers/tee/optee/core.c          |   1 +
 drivers/tee/optee/ffa_abi.c       | 194 +++++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 +-
 drivers/tee/optee/optee_msg.h     |  65 ++++-
 drivers/tee/optee/optee_private.h |  55 +++-
 drivers/tee/optee/optee_smc.h     |  71 ++++-
 drivers/tee/optee/rpc.c           |  31 +-
 drivers/tee/optee/rstmem.c        | 329 +++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 190 ++++++++++--
 drivers/tee/tee_core.c            | 147 +++++++---
 drivers/tee/tee_heap.c            | 470 ++++++++++++++++++++++++++++++
 drivers/tee/tee_private.h         |   7 +
 drivers/tee/tee_shm.c             | 199 ++++++++++++-
 include/linux/tee_core.h          |  67 +++++
 include/linux/tee_drv.h           |  10 +
 include/uapi/linux/tee.h          |  29 ++
 19 files changed, 1781 insertions(+), 123 deletions(-)
 create mode 100644 drivers/tee/optee/rstmem.c
 create mode 100644 drivers/tee/tee_heap.c


base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
-- 
2.43.0


