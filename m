Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7447AE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AYCRMSX++86+KnqMpmtjVu7Tiu/JgIj/lkT3HzDUCoc=; b=II6rKERESJL4fqRhDgiZm3jcfM
	3DQ+C+SNhWn1G+op3+0jEYJbY1LTnu25hHvhjaPNN3+CoIEuyZs94efRcwleVUvuqz8LS24ulD0uA
	K/XW6GD+l0uzRCgdLBs585lImsxbVXnD5LzBAVp4LwNtgqGPuqR+G8hSNg79+5rokoYhDxjj+vzqy
	o3kSXaZAhAO9sBtxCgwVYvxoYnxBujfcfvuKuPv1En4RXqT8QfXVmc1mIf8nJXRl7I8f3ZRHcakFp
	ESNJY+NKpRB9Sn9KtzZIw7KfEmNrG8cAmZsOeWyI6t1t/FoxXKhfu9Fv8VoLyf2C8aLMZqWlB8LLB
	dwjQZZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUZD-0000000D545-1kZV;
	Tue, 17 Dec 2024 10:12:39 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUV2-0000000D3kY-1Afj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 10:08:21 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3023c51146cso50308401fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 02:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734430098; x=1735034898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AYCRMSX++86+KnqMpmtjVu7Tiu/JgIj/lkT3HzDUCoc=;
        b=Qx660fbdyVoL6yNgZt0HTo00qfzQENbFGMtP+C6pw3hdFFT77xuVqyVrMpcIcf3BlC
         8CezCWuOri4++RDJ7V1sBnlQZxSaqSN6EHicuUhZmAqOHV6EwJP2RzbxbUKCvvZWfUPi
         SUB3CFonkHbQor+QkoOd294fl8FjCvlMoWCjDUomOSxGV5o8d5JdWLaPwe8sXWfubpgM
         htJixs24D5QbFR7CnF1mYLwA43ZeS8SxYnaj6nfK4DcviHzcUaVCgZvqC9YBG/3cQ4tb
         2Tc8m2HBS/Q1Tk2n/ixk7/yJ/l4WBtyDl8wxN+Qkhd22wrloIOUix6I1QzOT8JGKLWqU
         updw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734430098; x=1735034898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYCRMSX++86+KnqMpmtjVu7Tiu/JgIj/lkT3HzDUCoc=;
        b=bL6a+Lf8DK+MLSrCc7c38b7ap8otIkSY4Xz4UkOACbqmzPyqYxYcTP8IeY6MdIj0n6
         JzX1eGjUzQYeF7pp4kVZkpg72I6+sYJPpbsVVZfHa2pEfu4XLzm4TIjRFYIo5Qc0qUoN
         +whNUWF0I1HQRTucOVOPJgtoNHwdetrwhgiMIwur9Svqj5va77zayPJDv1dKy8+DhiaW
         5+aodsYX2b6tbMZQ+Ob505ACecK/dwXfRYQkXZVy3tad/pItJ/F8ra5I+YlUI1qW7SYT
         8pphYwBKt7AIhuFFRxkmVHfqEYaV6iKX1roFbWYLT6ef7YEoi9lAEZMaWwWRAr8EFsaL
         P9OQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgRY1ykqPoDTLAceE6WOmN3EHnzNPsy5FZOwzm2wwiVt3dhD2ZZDh9zAUT2sVzokaIlOuKhf8OsBBk87SZtwgR@lists.infradead.org
X-Gm-Message-State: AOJu0YxKb4Yk4a27rVx+N2mnXQ2kOPcttxQ+libRiJs39Nq6RkvhJ/xp
	fbxg43pNB78UGMi87s5CJDTfk5FeDyJqhxXTtmCuhNrqjD5l0/BcIlr1Q/LZMNw=
X-Gm-Gg: ASbGncuWNs3X3ADnsD23uqIoQ4jymw7H5YXgl67g51c87MHcC0iscwJyI4doBInN3nB
	gR+QIWI9BCn/e38DRrzauNm3VIPovcCESsnvFeLlzsiPbh0mQuDSStPxuOuI6lfcdeHdTgWgnrC
	+WaTzdR6JOUl2jVBSJx8U1hpKeDu91NoqYHYm6Rp1QUIcASVQdGj5r7ZEmaxVZ+GW4WW5W33YVZ
	8IXFx0zi94El0znXYqLPSFCTNS4cSjnzJ1u5xwI3PK/ZCKNrM7C6/5OeJWnRdK7czWzYBRmMEFc
	e8Sq7+TnbqWlXBKYI4oomAfx9WqzMQ7DMQ==
X-Google-Smtp-Source: AGHT+IHZU/IgRazPzMt1BTv+XPB01kJYHZQYFJnvwgpeo9BxmS7vAECnkhvSmQ/NjPskK0oQHygtHA==
X-Received: by 2002:a2e:a546:0:b0:300:3307:389f with SMTP id 38308e7fff4ca-304441a4d58mr7622151fa.0.1734430097840;
        Tue, 17 Dec 2024 02:08:17 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441a69ecsm12122681fa.111.2024.12.17.02.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 02:08:17 -0800 (PST)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Date: Tue, 17 Dec 2024 11:07:36 +0100
Message-ID: <20241217100809.3962439-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_020820_332774_2922BEC4 
X-CRM114-Status: GOOD (  21.38  )
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

This can be tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v4
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

Jens Wiklander (6):
  tee: add restricted memory allocation
  optee: account for direction while converting parameters
  optee: sync secure world ABI headers
  optee: support restricted memory allocation
  optee: FF-A: dynamic restricted memory allocation
  optee: smc abi: dynamic restricted memory allocation

 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/call.c          |  10 +-
 drivers/tee/optee/core.c          |   1 +
 drivers/tee/optee/ffa_abi.c       | 178 +++++++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 ++-
 drivers/tee/optee/optee_msg.h     |  65 ++++-
 drivers/tee/optee/optee_private.h |  75 ++++--
 drivers/tee/optee/optee_smc.h     |  71 +++++-
 drivers/tee/optee/rpc.c           |  31 ++-
 drivers/tee/optee/rstmem.c        | 388 ++++++++++++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 213 ++++++++++++++--
 drivers/tee/tee_core.c            |  38 ++-
 drivers/tee/tee_private.h         |   2 +
 drivers/tee/tee_rstmem.c          | 201 ++++++++++++++++
 drivers/tee/tee_shm.c             |   2 +
 drivers/tee/tee_shm_pool.c        |  69 +++++-
 include/linux/tee_core.h          |  15 ++
 include/linux/tee_drv.h           |   2 +
 include/uapi/linux/tee.h          |  44 +++-
 20 files changed, 1358 insertions(+), 76 deletions(-)
 create mode 100644 drivers/tee/optee/rstmem.c
 create mode 100644 drivers/tee/tee_rstmem.c


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.43.0


