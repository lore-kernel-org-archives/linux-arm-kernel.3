Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B30ECFD65E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utTQM12vp3HfC7wPK2LBUo4jmtAYzgNAcmtNUG5Yv4o=; b=UgK9sz1fIqIK3IttwfZjnXHdaH
	n2nEiaeRdv3y1K4YzMlqlZyGlaBcEFP1ny7JQS/uNtvz/9IO84zANuXZxSYhvNIMtXfcEEBvUtB6A
	IxUaHiU/WlZF9FdlNspJ0ZVZYUAM6h2v/w51JqMxHzsmGYys8EO8igegp09jyPLHyOY6Nd+/3qPgG
	GCp3Ayh7KTIcqzFd0O2WZ3xTVTZHBQ4hg47bqZFCCOxcMmy7EIa/TUi8GZjDw+HRE1IGYzs8C/6Vf
	Sm9XgBjER7EPe0WzqK61HwNbsoQ4qoImAXpFgTYTmggVAPNbgu97fB7M6N+wEcvPzXBNzpY2CyHMf
	srFuYxWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPd-0000000FHmE-2fRA;
	Wed, 07 Jan 2026 16:29:33 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPZ-0000000FHke-1O1C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:29:31 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so1066233f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 08:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1767803366; x=1768408166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utTQM12vp3HfC7wPK2LBUo4jmtAYzgNAcmtNUG5Yv4o=;
        b=pDigqQkk2FJ86xB5UtHZnIaeZ3n8huNsyB1spzqU4Tm+7R3EtBe3Bl7mtI9kZBBI+7
         X8c+H1NgPPIf5+GU7242nk7gOQ+EaRG4Bdw49UnwMjeea1yUX5Z/bWy4NRtrTuzw+xUR
         48TV4vehjfKGB9qaP6BtX+MstX/VTATx2ttoCpYjn5+9n52UONq91uMRAQxqsvZolE5u
         F52Cq2yxV8psVQ2xZAvCfjVcoN4f3aT2scvqaR0mjn0BN3KSQat3yNPTzF6T9e8nFBRh
         8erwZhXZwpRRQXm5psE4PVl2o2F+KAfoRuNcbMdO6XMOMZ61rwVXfRwpFnz/Z2lcKL4p
         cwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803366; x=1768408166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=utTQM12vp3HfC7wPK2LBUo4jmtAYzgNAcmtNUG5Yv4o=;
        b=iy14KGl7Tm+IjfcvbsdokjY9ObRPHxufIVGj263tX4x7Zo4XKTYoshRSequO0fGCWC
         FZIW5/2K341sgVwsiMdEYmIHN5AuNpEDNMiCAQfVJiC0HDB3qBAJgjA0F95m7fwia4Tx
         sP0dfokE2zKQqUxKfv3QB+TcaGQuXgZ15LTt3p9mByeMBf4wMmvVXrqGflGjdxqml4Ip
         FocDLS8TVa+efcdCHjckFqZbUOQreVFGp4T+yk8u2TqQrOsqUgP592ey0/JR1vZEcPzB
         mHqTnckF8lpvyS62fcuqCzTrTUkqd6H9Cif1HBz2sQVzSFG/H7ry71NDauO0+6JekHG8
         rjxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWrUrQPC03pu13r6nLSbM4F8T885Z2I8tfTWqoHybPuJbEWd7w38XEtoRe2ls1t46RfDpwLx2FLXjbR1cwZWSJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxekSzBKUW54X2DpkQSXai3i1Yt9rXiC4/gYCaZiP+DIzZBJO6i
	rFrmNEocYSBDy0pLPHShIDjzzzxcxJ1EUDRMFnIriFrrZNqN6TWEY0JqIGkrnU2Wt0ic
X-Gm-Gg: AY/fxX5hxLIVWl3HEKQGthwZVBCwyRqvQY7vJrkEe0W/1+fqGjwCHAVjbM9EE5UtqQT
	zezR3y2peurhWyiGPkmtvtZxh0vBaNRfphyhBIN80js3lVsESMea80HGhGwVcPF5y7x4ZlShPIl
	geTPeLhGnNY/8DpnGgj5TUSou+2TKrUoU3PSRLF6r+eQuyOxjjVHf/FEc5ZaLL1lbeDRoDOuRX0
	Cg4iZivQOaCYqQCUJIopF4/IKEZwfAKZUv1ndqRe3hxg8xeEpTS3VQfn3/ffaDDAyM4H7Y5QB0B
	NMpkipXqPa8/GBtdl2fjeTnB686oPD3khXfdvKP5mFNOGPiJmmOwUWXrK9XM/0PNcA0sYx3r9bD
	Wum2IIWjEEbf7rWM6ON/4KeDjgvDwUnlrO11o8sqy1JQpBZaajeV01m1mBCdgo0kc7UyKAG0eBN
	b9d21cdOc58/THssRYfQ==
X-Google-Smtp-Source: AGHT+IEsJtA8N1N6cQme/xrsmcYvUfGO3yfitzXA9dloqZIoULK1bllqhEJTvQbGnSNhB8OYA3C0wg==
X-Received: by 2002:a05:6000:2085:b0:431:104:6dc2 with SMTP id ffacd0b85a97d-432c362811cmr3267285f8f.8.1767803366422;
        Wed, 07 Jan 2026 08:29:26 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:4a3c:13be:a1c0:7b9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm11117030f8f.42.2026.01.07.08.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:29:26 -0800 (PST)
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
Subject: [PATCH v2 0/6] virt: Add Bao hypervisor IPC and I/O dispatcher drivers
Date: Wed,  7 Jan 2026 16:28:23 +0000
Message-ID: <20260107162829.416885-1-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224135217.25350-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082929_583508_14C5AC58 
X-CRM114-Status: GOOD (  11.48  )
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

This series introduces support for Bao hypervisor guest-side drivers
under drivers/virt/bao, along with the associated Device Tree bindings,
UAPI headers, and MAINTAINERS entries.

Bao is a lightweight static-partitioning hypervisor for embedded and
safety-critical systems. This series adds:
- Bao IPC shared memory driver: Enables Linux guests to communicate
with each other via shared memory regions.
- Bao I/O Dispatcher driver: Allows Bao VMs to share I/O devices using
device paravirtualization (VirtIO).

Key updates in this version to align with upstream requirements:
1. Switched to misc device API: Removed all cdev, class, and
alloc_chrdev_region code in favor of misc_register() for simpler,
standard device management.
2. Clean kernel style and formatting: All code passes checkpatch.pl,
with consistent variable declaration, function naming, and comment style.
3. Architecture abstraction: Consolidated ARM, ARM64, and RISC-V hypercall
logic into architecture-specific headers, removing in-driver #ifdefs.
4. Commit messages: Now concise and Linux-kernel-style, describing
behavior and impact clearly.
5. Device Tree compliance: Fixed all make dt_binding_check errors to
ensure DT binding correctness.

This series has been validated on Linux guests running under Bao
hypervisor, confirming correct initialization, IPC shared-memory
read/write operations, and I/O Dispatcher functionality for
backend VMs.

Feedback and review from maintainers of virtualization,
architecture-specific code (ARM, ARM64, RISC-V), Device Tree
bindings, and UAPI are welcome.

João Peixoto (6):
  dt-bindings: Add Bao IPC shared memory driver binding
  virt: bao: Add Bao IPC shared memory driver
  dt-bindings: Add Bao I/O dispatcher driver binding
  virt: bao: Add Bao I/O dispatcher driver
  virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common header
  MAINTAINERS: Add entries for Bao hypervisor drivers, headers, and DT
    bindings

 .../bindings/bao/bao,io-dispatcher.yaml       |  75 ++++
 .../devicetree/bindings/bao/bao,ipcshmem.yaml |  82 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |  13 +
 arch/arm/include/asm/bao.h                    |  60 +++
 arch/arm64/include/asm/bao.h                  |  60 +++
 arch/riscv/include/asm/bao.h                  |  60 +++
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/Makefile                         |   2 +
 drivers/virt/bao/Kconfig                      |   5 +
 drivers/virt/bao/Makefile                     |   4 +
 drivers/virt/bao/io-dispatcher/Kconfig        |  15 +
 drivers/virt/bao/io-dispatcher/Makefile       |   4 +
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 361 ++++++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 405 ++++++++++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       | 185 ++++++++
 drivers/virt/bao/io-dispatcher/intc.c         |  64 +++
 drivers/virt/bao/io-dispatcher/io_client.c    | 405 ++++++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 179 ++++++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 323 ++++++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 314 ++++++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |   8 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 252 +++++++++++
 include/linux/bao.h                           |  44 ++
 include/uapi/linux/bao.h                      |  98 +++++
 27 files changed, 3027 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
 create mode 100644 Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
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
 create mode 100644 drivers/virt/bao/io-dispatcher/intc.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_client.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_dispatcher.c
 create mode 100644 drivers/virt/bao/io-dispatcher/ioeventfd.c
 create mode 100644 drivers/virt/bao/io-dispatcher/irqfd.c
 create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
 create mode 100644 drivers/virt/bao/ipcshmem/Makefile
 create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c
 create mode 100644 include/linux/bao.h
 create mode 100644 include/uapi/linux/bao.h

-- 
2.43.0


