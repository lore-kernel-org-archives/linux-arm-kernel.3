Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8171FD69113
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lx8FUbil1lq4BtoAebbj8qif3q0b2Rsp7fvYReP+0O4=; b=1kH9d+PibFXMS9RWveZL1mOhAC
	OTRTm2yvS64SRNFM9NkHsUHpn9dvHzLiWhH2r0u3XmsK9K1Yqd1y7j9XKlZSO78T2c/LKVLFpMzWP
	ELtqp3kjV0uwIWyOUyOa9/LtgpKsgRLP5xM4Ok8Rx+S+sD7H+Mju4gmGnSAbeirxkd5wkqbwWHJf3
	fgYwPa+/Fpd7iLc9TxMWKsvQMY/UPTDGM4dzNk6YlEh3eoyQcPhIQtdR4fZWkO1Rpdj5kVPf+gKF4
	BCMsHvzrwunEW75XOlnEZ2h09NEZLtCf+m1PRElcPQlgSCHqxLKqonAO9go9LS35CjvAFECcwOTGe
	qCTae3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgAE-0000000Fq9f-1Bkj;
	Thu, 28 Nov 2024 15:10:42 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGg9F-0000000Fps8-04ni
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:09:42 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso116265466b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 07:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732806579; x=1733411379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lx8FUbil1lq4BtoAebbj8qif3q0b2Rsp7fvYReP+0O4=;
        b=hY6+0yoQrDiOrtgYRx275qm8Y3vWiC+XmKa32vxeiNWmIyxKt/XtG5VX06WnK8vKwH
         vDigrHfdjX+mKaxuwYNolxtxkyqRhyb7FUtUwCvkCkPwgkoq2ZgBQriDKdDn/1laWoD9
         ZdcnIKLGafQacJIwOiJ9WfEXfKFOm6CxLxTofpaJv7UaWt6gOrOGqUBe02iXca/hyADq
         YSRYcmbqzFG2v7sCctTne6px2H+INZQhkXPCZ33sIlVlgK11PmPYeHznde3C3aTfHP51
         Mhcs8zj+gpHCRLZ1Tstrz5ch1HTHEQHjC2yku+Fkt9ZA+tSfxDgkSz93XW95zajwmrpp
         7iCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732806579; x=1733411379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lx8FUbil1lq4BtoAebbj8qif3q0b2Rsp7fvYReP+0O4=;
        b=U05jO/kvcEjuPvLV+5CwGIA37OGjiNOb1yW5n0WE/dvKdFBNh/Q1qqIEbEJtjVWvX4
         fhVp5LWEYsjzCreTR9wO4iGLc9q/jBB+MdZXFrip1ouEzUYHTLHXbog6GUHJHn17dG7I
         yXsR+3j5sYGfD7Wc1N+dNIH+M8XOKMiDhBtHNlKxYCFC8Qegl44X64wDkf155/jh6Mfd
         kEHghjqsaNAmnzZIqgGN1AA902GvNI3392NPsiPPHxyRKgp6sgJJJrpsxHmrsBo4bh7K
         qWDlT9ZVjk76/mZplsOv9pJ8WvoZBcQ58WpRCJXG8/EMKB56583CDNyIqtXOARs1euyN
         zVuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs/hRp6eqF3iWW7WG1LzZH4gMy+btZbHAAVvjkp6zW73u4YUYpYn/GTN2TvwNgLI13TheChfLPZ0JEH2/astqG@lists.infradead.org
X-Gm-Message-State: AOJu0YzjirSMbLwCWX317P/MbtK/4jkY8Izag6IHS+EnCAPaMYiRpBjj
	WE0YWiJOryXotAQXncEJrT7ynTuGAU/+QkTDezYfukQshJmKBkkGgvCzbjnDDro=
X-Gm-Gg: ASbGncuHi1Qmy1hm2Oal9HtFMuPG54EjTD7fOEwPHN3y3jNwAJ6wA8I0Av80Onm546p
	1wkY/eiK8lftd6ytSKmHvCXN0u56RfYtd5ivyAa93uj8K+B6LTSvrOsT8SQuf3hLfStbdizmh18
	O1aSnfQbYLEZftOVMylT0SS+4Jrf8w9sATC9BJiW5k827wC3X8Sk6fBugMZiiHwYr1H+8vKszCf
	lponFF+dyjjjJ0iya9Xlx8X61oIpfC1pvD8oQaTJq1+W2UXePWFbssML6qE3vfowlqFQRn4WOJ0
	lP4oEAI1LFF95LZjVRrE7eo6
X-Google-Smtp-Source: AGHT+IErM6pO63m4fDk26WsSCnoRuNdeklZdOejyiYshrc8elr0SpIMuHzrJ+hXYJB8Y4wtZl7A20A==
X-Received: by 2002:a17:906:3d22:b0:aa5:50b6:a600 with SMTP id a640c23a62f3a-aa581028af3mr520735266b.44.1732806578748;
        Thu, 28 Nov 2024 07:09:38 -0800 (PST)
Received: from rayden.urgonet (h-79-136-84-141.A175.priv.bahnhof.se. [79.136.84.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm75711366b.163.2024.11.28.07.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:09:38 -0800 (PST)
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
Subject: [PATCH v3 0/4] TEE subsystem for restricted dma-buf allocations
Date: Thu, 28 Nov 2024 16:09:00 +0100
Message-ID: <20241128150927.1377981-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_070941_054056_549E0738 
X-CRM114-Status: GOOD (  20.34  )
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
This a big update compared to the previous patch set [1].

The TEE subsystem handles the DMA-buf allocations since it is the TEE
(OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QTEE) which sets up the
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
        -b prototype/sdp-v3
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

[1] https://lore.kernel.org/lkml/20241015101716.740829-1-jens.wiklander@linaro.org/

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

Jens Wiklander (4):
  tee: add restricted memory allocation
  optee: account for direction while converting parameters
  optee: sync secure world ABI headers
  optee: support restricted memory allocation

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
 drivers/tee/optee/rstmem.c        | 380 ++++++++++++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 214 +++++++++++++++--
 drivers/tee/tee_core.c            |  37 ++-
 drivers/tee/tee_private.h         |   2 +
 drivers/tee/tee_rstmem.c          | 201 ++++++++++++++++
 drivers/tee/tee_shm.c             |   2 +
 drivers/tee/tee_shm_pool.c        |  69 +++++-
 include/linux/tee_core.h          |  15 ++
 include/linux/tee_drv.h           |   4 +-
 include/uapi/linux/tee.h          |  37 ++-
 20 files changed, 1344 insertions(+), 77 deletions(-)
 create mode 100644 drivers/tee/optee/rstmem.c
 create mode 100644 drivers/tee/tee_rstmem.c

-- 
2.43.0


