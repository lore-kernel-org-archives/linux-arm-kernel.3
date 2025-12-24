Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B046CE75453
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DmuPTBK1+j/xQcR53nZlLGqYmcBMfxzHRcOOd3xh0JY=; b=r9ljXZuPx6gWQk0DJ8Q5ktve1L
	QmdeKlBDAJ6cn76JFBY/mFDIRjxwNqNsi5+QI9WC0KnIMU+Q6WTb06TOhs6z80GzfpnAVaDG65hIW
	LDlN9w/ZMQuKKSkPLhrdiMTZUdLIeAi/25Vlm5R2p6bK9TTMSHnXOi204yKd+/ilVrNjmXNEn42WW
	962FcemtpTVh7DI6hDQcMgIaAby41x0X0/Ub2oXiuJVc7jpW8EisvmdnXaXA8p9ITi1aT7rf5XpXS
	FR+3YXoc1Kg5O0eVJpMRddcDwEesC+u6psp2S9GQ46VVBTxHUgRGDw+u/uqEBwnOCLq+tpk5pcQbB
	sn0pS/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPIS-0000000GvV4-1LZs;
	Wed, 24 Dec 2025 13:53:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPIO-0000000GvTA-1Ck5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 13:52:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43277900fb4so69655f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 05:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1766584373; x=1767189173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DmuPTBK1+j/xQcR53nZlLGqYmcBMfxzHRcOOd3xh0JY=;
        b=Y0kNAiN9zB8FooflWiD5FPMgWkPuw6sg0IS/0P5LFuYKuswv7eon5EMFrInVssTrVW
         G1TXJzVjrZuqg5Jt89R2iaCiOd3DnQIoYjzLxIVxHx311CC3YzU+P3fvprYcvw7cRbdb
         1nfQ5PcvsPKybhTT4EOv62LZCuO0wKnuhW3HBQg187NLwv0RFdYjxEIzj+mAyasodAZk
         lT5jt+jcaPac/4eWPasHppILmoTKI2d6bDGuPNSGOmaASTKRTQ3DQXlzWx60Ds9szY54
         syb+V3ZjnLR5cecwSS85HKCqva14FJv2IGZ+Gydke/DRt5y6ywfilw4kVrCeNkLaEOWV
         xkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766584373; x=1767189173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmuPTBK1+j/xQcR53nZlLGqYmcBMfxzHRcOOd3xh0JY=;
        b=D+xgqn7GPGd3sVYZV5H5JRbTJzN/8D+uzKlxLJQb1vrOk2nTAjSK7l0wTDGBrzabXJ
         ZCB83VKwL/Rx1D/FQjjK4DoCrgkE1Z4Rp1xQWEoHkTOC4+fNf2sPL+2QTdWKzyAJd+wz
         d5rVtoQMf9WzvsaXm5bPL9TFHicG7SUm69qKkBOvGZJJTUf3ubWRwzBrFEd+bWYF2SFu
         4eFSWjqtcG2s4HaeBVnJZm2z5Q8EDL0SOPXwPctGbEVkDujGS1UrVw+5Ko0+txBNqfSD
         ApeNovi+nkQMvDmQ5SzQ9QOEAYpRdam6GGPyeJZJgqrldgK3/gPIBcO3SrYEwVQTZ4aH
         SIYw==
X-Forwarded-Encrypted: i=1; AJvYcCXVELkUIzhRHLk1RgbWzqFWdK61sZG3ujsF/xdAJ+u6mFV8KWjur7M6bB+LwXhtXSeI3Vxy6N34etIxBk43z2Z5@lists.infradead.org
X-Gm-Message-State: AOJu0YxPq3OMxK7AI1xnVUBLar2ljnCbUJ2oXTVL8kUQZj0KkfLbo91A
	dIrEBUBl7AkS7mKwlegAubt+qYPTuVFRVj58XHaAt9czXxUl8msHhvgqt4k3LB1QwoQu
X-Gm-Gg: AY/fxX5XmFtiH6YZR2yT+u06OTkiR5Ov/zfbEYO5mTXjlBHFpFOhrKvKRocAkF5z1ce
	Bzv69BEJ08cjIIyh46ATZMCwpJCcH7bHW4YufzsRlQtJkJu/tnYQZdueiaqc3yA+1J/URKqup04
	HiQ1uylgljt5r8QtrpEQjQQBhgDK2GIhsIaLOzVhfFlFX6OqPIYpPpqCETAoIqG2fPlAQThHClB
	IQ5hgNP12k4415+ZLgCN4o4T4zHF6bZSwrdQh1kHmXH2i9R4byRTR9SkFnJAfNDk4uWdxmaOCar
	rrjagNPnOLnBA9HTDRM8NlBzzX5BQs36kYA+gkqt122c5b6YAgd4/nK9D+tcO9+b+W2x7iVmr7P
	hRKuT1mQiTSjMOKj1PjcTSRCe3mUKXfB1k9jsbasq8ZLI+pa7R8x3tAJsZZsVUnR9z6VZt+1Gdq
	DLtyxu+LYXfAcFzsEEmg==
X-Google-Smtp-Source: AGHT+IHoJrb07B1cdykCE7qYkiqA5eIOoSQMy9mbNo39VeuUJ9/LLv9crUrYThO0HyLNCGIS21PtnA==
X-Received: by 2002:a5d:5d02:0:b0:431:66a:cbda with SMTP id ffacd0b85a97d-4324425829amr25725416f8f.0.1766584372997;
        Wed, 24 Dec 2025 05:52:52 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:39e4:e84d:192a:5c5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm34494677f8f.35.2025.12.24.05.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:52:52 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 0/5] virt: Add Bao hypervisor IPC and I/O dispatcher drivers
Date: Wed, 24 Dec 2025 13:52:12 +0000
Message-ID: <20251224135217.25350-1-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_055256_599080_FBC760E1 
X-CRM114-Status: GOOD (  12.85  )
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

From: João Peixoto <joaopeixoto@osyx.tech>

This series introduces support for the Bao hypervisor guest-side drivers
under drivers/virt/bao and the associated Device Tree bindings, UAPI,
and MAINTAINERS entries.

Bao is a lightweight static-partitioning hypervisor for embedded and
safety-critical systems. This series adds:
- The Bao IPC shared memory driver, which enables Linux guests to
  communicate with each other through shared memory regions.
- The Bao I/O Dispatcher driver, which allows Bao's VMs to share I/O
  devices using device paravirtualization (VirtIO).

Patch overview:

1. dt-bindings: Add Bao IPC shared memory driver binding
   - Provides a standardized DT description for Bao IPC shared memory
     devices used for inter-VM communication.

2. virt: add Bao IPC shared memory driver
   - Character device driver that maps shared-memory regions and
     communicates with the hypervisor via architecture-specific hypercalls
     (SMC/HVC on ARM, SBI ecall on RISC-V).

3. dt-bindings: Add Bao I/O dispatcher driver binding
   - DT binding for the Bao I/O Dispatcher, describing memory regions,
     interrupts, and compatible strings for backend VMs.

4. virt: add Bao I/O dispatcher driver
   - Implements the I/O Dispatcher kernel module bridging Bao Remote I/O
     with VirtIO backend devices.
   - Includes architecture-specific headers for ARM, ARM64, and RISC-V,
     driver framework files, UAPI headers, Kconfig/Makefile integration,
     and ioctl documentation.

5. MAINTAINERS: Add entries for Bao hypervisor drivers
   - Registers maintainers for all Bao hypervisor components to ensure
     proper kernel review and notifications.

This series has been validated on Linux guests running under Bao hypervisor,
ensuring correct initialization, read/write operations for IPC shared
memory, and proper I/O Dispatcher functionality for backend VMs.

Feedback and review from maintainers of virtualization, architecture-specific
code (ARM, ARM64, RISC-V), Device Tree bindings, and UAPI are welcome.

João Peixoto (5):
  dt-bindings: Add Bao IPC shared memory driver binding
  virt: add Bao IPC shared memory driver
  dt-bindings: Add Bao I/O dispatcher driver binding
  virt: add Bao I/O dispatcher driver
  MAINTAINERS: Add entries for Bao hypervisor drivers, headers, and DT
    bindings

 .../bindings/bao/io-dispatcher.yaml           |  67 +++
 .../devicetree/bindings/bao/ipcshmem.yaml     |  99 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |  12 +
 arch/arm/include/asm/bao.h                    |  62 ++
 arch/arm64/include/asm/bao.h                  |  62 ++
 arch/riscv/include/asm/bao.h                  |  61 ++
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/Makefile                         |   2 +
 drivers/virt/bao/Kconfig                      |   5 +
 drivers/virt/bao/Makefile                     |   4 +
 drivers/virt/bao/io-dispatcher/Kconfig        |  16 +
 drivers/virt/bao/io-dispatcher/Makefile       |   4 +
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 386 +++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 330 +++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       | 348 +++++++++++
 drivers/virt/bao/io-dispatcher/hypercall.h    |  30 +
 drivers/virt/bao/io-dispatcher/intc.c         |  68 +++
 drivers/virt/bao/io-dispatcher/io_client.c    | 435 ++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 207 +++++++
 drivers/virt/bao/io-dispatcher/ioctls.c       | 145 +++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 336 +++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 341 +++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |   9 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 539 ++++++++++++++++++
 include/uapi/linux/bao.h                      | 124 ++++
 28 files changed, 3701 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/io-dispatcher.yaml
 create mode 100644 Documentation/devicetree/bindings/bao/ipcshmem.yaml
 create mode 100644 arch/arm/include/asm/bao.h
 create mode 100644 arch/arm64/include/asm/bao.h
 create mode 100644 arch/riscv/include/asm/bao.h
 create mode 100644 drivers/virt/bao/Kconfig
 create mode 100644 drivers/virt/bao/Makefile
 create mode 100644 drivers/virt/bao/io-dispatcher/Kconfig
 create mode 100644 drivers/virt/bao/io-dispatcher/Makefile
 create mode 100644 drivers/virt/bao/io-dispatcher/bao_drv.h
 create mode 100644 drivers/virt/bao/io-dispatcher/dm.c
 create mode 100644 drivers/virt/bao/io-dispatcher/driver.c
 create mode 100644 drivers/virt/bao/io-dispatcher/hypercall.h
 create mode 100644 drivers/virt/bao/io-dispatcher/intc.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_client.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_dispatcher.c
 create mode 100644 drivers/virt/bao/io-dispatcher/ioctls.c
 create mode 100644 drivers/virt/bao/io-dispatcher/ioeventfd.c
 create mode 100644 drivers/virt/bao/io-dispatcher/irqfd.c
 create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
 create mode 100644 drivers/virt/bao/ipcshmem/Makefile
 create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c
 create mode 100644 include/uapi/linux/bao.h

-- 
2.43.0


