Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E233CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MWFT9m6GN4GxrZYX8Rpent2wFQfA0PjR3otNOfevNYU=; b=ZqNTn/xrjMrzudnB41xh9K9HW4
	0vZblVlD3NnRsgn/JdaCTYjEkkl77c6nc9pvRox7MUDOtZ9xxYB3AN6igD7rn3VZ+VoRveoh9ukW7
	qiViZ+2lmIvDZA0P9AVPemdvyi3APVIYcY/Bo0Iu9rzo4Jur6n23hvgOs5QQtI1G0K25TE/O+Lerk
	SkXqbGq3s7UyJ3tSGoUCLBMwfaYHsuoQGdyYgntm/U5YKZdXoeGzAkCSTtoy40O9++lbelCAI+mj4
	2KA9gcRpSSWhd9Z/htLodtCw4y2U7Q0t9P4Hmb2eOMa9KR7OrbUA9bcsjFCcrl8IpO86yPkxkOVh6
	/wpeQbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOil-00000008Znt-0Qpi;
	Tue, 18 Feb 2025 14:37:11 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOhG-00000008ZJ6-281u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 14:35:40 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so51199111fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 06:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739889336; x=1740494136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MWFT9m6GN4GxrZYX8Rpent2wFQfA0PjR3otNOfevNYU=;
        b=GS4IDYE6AF1timAEqAMelkGmK6HhGt+k7c9UjD5YXj/4gGF1KQJRlYMR7/VsSB+gyE
         EG1pGHnt5TRaXHBBGburvaJpR60ipKMBkSheMiqR64dqscu43b5gwzJ2DopOqImiT+fG
         gWc4u56S89xNkROu56TcACcbhuxV44QvirNLElwSyjjo5v6PUAzE8pVqRA06tKUW83uV
         zL2Tbud/lpZChItAB5U1sb6TTf3MwaHXJNRqmjC5aAEL05QHWBUgb5WqXYGHZX/WscER
         JJpBdMMyPy8Q0wG9D3BbdTz3/oE8UVnTvR3roaV5aN2dbpvg9w6qpjVbRohM94hTOe1d
         jlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739889336; x=1740494136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWFT9m6GN4GxrZYX8Rpent2wFQfA0PjR3otNOfevNYU=;
        b=jcZGl03v4IdhgyZuIxpQF0OjvmM2sqeeUxOSikTzcJNoEE5ZMY+p3ywj16vFJeExNW
         heM6pTtV5tZN/8KsnQOR+Sf/kG1LGWafrrAa5CqC9y2HXgnJSHvmZB3nA+yKPTprdu5J
         xvWbJKLlYtAlvhJ/8qv1RZBzTX4h5UfWA5kdBfE2HFxtbGvTDsJSIkzuWc+CGpgA//31
         42xcaOomUKsI3FY9JqKTfUxWJttYu01m0uYh28mkYRVDf/dqJ+2zsPFMIUUTPqtDzvqV
         t4BatP8K96k49SWjyyE/VOVm9baHVgFVUYpFUxQOPia4OP7FxxAPvCMSt1I5/7N9Br4B
         9tvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZPRRNOSnuaKdJ8EUbzaclg9l9mS4yEAwe0GK3IzYHfZpg0+D8GUnz58ddbuK0l5/KKLEvu18fgJr7CPXK92UL@lists.infradead.org
X-Gm-Message-State: AOJu0YzG0/4NSk1/Kh6kFWUqxhSNIQCB9uuC76iH6zmYWGajWajiG7iP
	EHdmQDrqAssSRYlZuasR6HJGHBXubjPgTlllNZSv+pxNDekvq2gP1Hc9JbH2SQI=
X-Gm-Gg: ASbGnct24Bc6yaTp+eLc+JYNjuK/JKOOYzilo/Moh1Vx2WkTXuY3NF3Q9GMNEn6w0Ul
	oh+kvR70GGnVjl1iyOV0xFbrN8+VCscDUoToOq00S8dHLS0CmS2z3NDqtp3NZ6iEunw87Tg21uE
	4HIPRldfiUvytbPPPT7UMqf5MoYaPjkJ4vWse2GQnb4eUnqP8PildGtuq56QDlh/S3VUargR10C
	QziWFMUheZ4Ac8PV7wnh+2xsuqNNIJX7pWJKFBnsJgX0j2TgIPxhUdOI2PpoWd67z6uYtjnQxAi
	8sGnNYE9qKLviC599huh/HzeqOaccZ7o2kiHjFvMEGpK5HZetLljU1ZNu+f5gM2v6Rvc
X-Google-Smtp-Source: AGHT+IGRQRyenVlztaodJXNdRWoqSHnEiV6CAyLZN/0VHpW+LYtybqKnx2XoHGvKGUJTmzr2eF8qRg==
X-Received: by 2002:a2e:885a:0:b0:309:251a:df12 with SMTP id 38308e7fff4ca-30927aa59ecmr37278251fa.19.1739889336018;
        Tue, 18 Feb 2025 06:35:36 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309311777a8sm12360831fa.25.2025.02.18.06.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 06:35:34 -0800 (PST)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 0/7] TEE subsystem for restricted dma-buf allocations
Date: Tue, 18 Feb 2025 15:34:49 +0100
Message-ID: <20250218143527.1236668-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_063538_548880_657432C9 
X-CRM114-Status: GOOD (  24.87  )
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

[Now with a Gstreamer demo, see below.]

This patch set allocates the restricted DMA-bufs via the TEE subsystem.

The TEE subsystem handles the DMA-buf allocations since it is the TEE
(OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
restrictions for the memory used for the DMA-bufs.

I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
how to allocate the restricted physical memory.

TEE_IOC_RSTMEM_ALLOC takes in addition to a size and flags parameters also
a use-case parameter. This is used by the backend TEE driver to decide on
allocation policy and which devices should be able to access the memory.

Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
Recording) has been identified so far to serve as examples of what can be
expected. More use-cases can be added in userspace ABI, but it's up to the
backend TEE drivers to provide the implementation.

Each use-case has it's own restricted memory pool since different use-cases
requires isolation from different parts of the system. A restricted memory
pool can be based on a static carveout instantiated while probing the TEE
backend driver, or dynamically allocated from CMA and made restricted as
needed by the TEE.

This can be tested on a RockPi 4B+ with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml \
        -b prototype/sdp-v5
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
        -b prototype/sdp-v5
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

Jens Wiklander (7):
  tee: add restricted memory allocation
  tee: add TEE_IOC_RSTMEM_FD_INFO
  optee: account for direction while converting parameters
  optee: sync secure world ABI headers
  optee: support restricted memory allocation
  optee: FF-A: dynamic restricted memory allocation
  optee: smc abi: dynamic restricted memory allocation

 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/call.c          |  10 +-
 drivers/tee/optee/core.c          |   1 +
 drivers/tee/optee/ffa_abi.c       | 179 +++++++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 ++-
 drivers/tee/optee/optee_msg.h     |  65 ++++-
 drivers/tee/optee/optee_private.h |  75 ++++--
 drivers/tee/optee/optee_smc.h     |  71 +++++-
 drivers/tee/optee/rpc.c           |  31 ++-
 drivers/tee/optee/rstmem.c        | 389 ++++++++++++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 215 +++++++++++++++--
 drivers/tee/tee_core.c            |  69 +++++-
 drivers/tee/tee_private.h         |   4 +
 drivers/tee/tee_rstmem.c          | 188 +++++++++++++++
 drivers/tee/tee_shm.c             |   2 +
 drivers/tee/tee_shm_pool.c        |  69 +++++-
 include/linux/tee_core.h          |  15 ++
 include/linux/tee_drv.h           |   2 +
 include/uapi/linux/tee.h          |  71 +++++-
 20 files changed, 1409 insertions(+), 76 deletions(-)
 create mode 100644 drivers/tee/optee/rstmem.c
 create mode 100644 drivers/tee/tee_rstmem.c


base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
-- 
2.43.0


