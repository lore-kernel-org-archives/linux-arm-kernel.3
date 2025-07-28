Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A82CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8yreLd+QpacId3F3pRUlLCmWTAXUiBp3fqE2+4w1mPs=; b=wvYn4Ijen5t5yRh/2jQmyYbkJr
	MRIuml10qmhWR97tMt0lAVXxqODzUFf3/G2D0CSY5cDP9JlfiEtLUlXkCibmKA4nrclgwDLJG73oA
	jr8jI7P8dw2+9AfgIZlZlv+pjEj4aq7PzXu8Of8TumLBs7nGgmheY8xtembilmLzZ9J7Kp+DZ1kPK
	4iGOEvZPIDGqq76UQxoh12RRtcJjTlp9DD0sDwtOxUhLFxtnTM1oMIPYA8igK1gZmQKiJEQ90kz3b
	ANKlBGRD3kr4XmUgmh0eHbiDHhEeNSK6A9sOf2u1FOeHbQFT+l8QhWGGj2XPUKTQwaiiifye5DKy6
	XbMx4tBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTib-0000000FHmO-3NEa;
	Mon, 28 Jul 2025 19:41:05 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2X-0000000F8q4-0lPE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:34 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3b78c983014so378571f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725211; x=1754330011; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8yreLd+QpacId3F3pRUlLCmWTAXUiBp3fqE2+4w1mPs=;
        b=nRAN0a4jdBlxiZ6OD1MAKyEV56jNWMSpG9xT8EEjYh4jqoati6o0SJZcn08YYMBLXG
         gOQN8cGlFCsQnVpZvp6O5NKrVHKoqMFz8NtF4CGcdw+rgQiv+cN9FCbLpUF1iDzNS2sF
         hKFY7mrwspFvG8WYobaxhIUl8KdGMSMYW0qQqtrln51vdNCDT6jxujMBdmUOsFRsPSoH
         IcnhX2ZdBmEHk+IC7eLpHJpuyQuD6fKku/kMpUwGzqofAMnKlX79QRQMvZ++4hf5LmDo
         zBoCBhptO2Su0Ew2bxG/9tn6X10WiV5qrHzIEeq+G6TzRPIyd8+5wrxphrMduFRSd2dI
         36yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725211; x=1754330011;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8yreLd+QpacId3F3pRUlLCmWTAXUiBp3fqE2+4w1mPs=;
        b=f0Dv/sV2ITK8oj6J9pCMY5bn129iltpKU2DX+er+WEAgdqvX8Oa69do462wHYsLsLv
         EjUZJlbrCG6dFSxDq4NGPSY5y0b+1LwAxRp5t6gTMJXQOtojKjZ7s/NN4ue3+KhhYqeF
         Ob20W5NfTOs5+G7n4Id0O4I1kEwVsNnGsd5c2soRQGruaRzjYqqw8ym6MjHsSx1sXW5Z
         UdPF5ZbgobcI/UZMMnWO9/E35a+7WgmbVokKYQ13gbpTvpCvr5djyO+zK7t4SyOxW9rw
         7W1/uwOpRaCzOKDFzc/b5q093lwVS5A2wtFBypzQwKP8n/QugpsvqvUjM5a573BUW44h
         xyRA==
X-Forwarded-Encrypted: i=1; AJvYcCUVAgrYzTF6GNLPgfQcNej/Gd+DbHjdk5v/YsVEUDaJLprRcd4QHBa4CYqdvShrtRZWew3GeU8ip8qIU+WGXrPz@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf/RggxBzazfRxP8hlbZ+ihZRAvSo0WEYkd7MsgUadwXzkUK1x
	UdnVij7/UW3MQKhO+i5cSFpcek6BJDikJ7CM5Dhf9Mn6L6kubj87sJhON0ziH/VGgth+egSkjGj
	MDjayhToW05BJzg==
X-Google-Smtp-Source: AGHT+IHdGQE2wwXM49+MVAqJUkEY8InyH8twrQm1c7DxW3HjRHCRjNGwP+usERmU6WFHjlMI/yRPQ1WqhtAlzg==
X-Received: from wmco2.prod.google.com ([2002:a05:600c:a302:b0:455:e7d7:cae9])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2410:b0:3b7:8b88:e3a2 with SMTP id ffacd0b85a97d-3b78b88e59fmr1783148f8f.58.1753725210911;
 Mon, 28 Jul 2025 10:53:30 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:52:47 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-1-smostafa@google.com>
Subject: [PATCH v3 00/29] KVM: arm64: SMMUv3 driver for pKVM
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_105333_232909_6555D827 
X-CRM114-Status: GOOD (  27.46  )
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

This is v3 of the support for DMA isolation with SMMUv3 on pKVM.
v2: https://lore.kernel.org/kvmarm/20241212180423.1578358-1-smostafa@google.com/
v1: https://lore.kernel.org/kvmarm/20230201125328.2186498-1-jean-philippe@linaro.org/

Main changes (see design section for details):
- This version applies directly to upstream with no out of tree pKVM
  dependencies and is not an RFC
- This version adds minimum support for DMA isolation by identity
  mapping the SMMU S2 as opposed to the paravirtual interface in the
  previous versions.
- This version has much more code re-use as a new shared file (and
  structs, macros) for hyp-kernel smmu-v3 code, which makes the
  hyp SMMUv3 specific code smaller.

pKVM overview:
=============
The pKVM hypervisor arm64, provides a separation of privileges
between the host and hypervisor parts of KVM, where the hypervisor
is trusted by guests but the host is not [1][2]. The host is initially
trusted during boot, but its privileges are reduced after KVM is
initialized so that, if an adversary later gains access to the large
attack surface of the host, it cannot access guest data.

Currently with pKVM, the host can still instruct DMA-capable devices
like the GPU to access guest and hypervisor memory, which undermines
this isolation. Preventing DMA attacks requires an IOMMU, owned by the
hypervisor.

This series adds a hypervisor driver for the Arm SMMUv3 IOMMU. Since the
hypervisor part of pKVM (called nVHE here) is minimal, moving the whole
host SMMU driver into nVHE isn't really an option. It is too large and
complex and requires infrastructure from all over the kernel. We add a
reduced nVHE driver that deals with populating the SMMU tables and the
command queue, and the host driver still deals with probing and some
Initialization.

Most of SMMUv3 specific source code would still be shared through common source files.

Patches overview
================
The patches are split as follows:

Patches 01-03: Core hypervisor: Add donation for NC, dealing with MMIO,
               and arch timer abstraction.
Patches 04-13: SMMUv3 driver split: Split the SMMUv3 driver to 3 parts
               (shared kernel, shared hyp, driver specific) and io-pgtable-arm
               to 2 parts (shared hyp, driver specific)
               Most of these patches are better viewed with --color-moved
Patches 14-17: Hypervisor IOMMU core: two hypercall to enable/disable
               devices, IOMMU pagetable management
Patches 18-25: Hypervisor KVM SMMUv3 driver: Setup shadow pgtables, STEs...
Patches 26-29 Kernel KVM SMMUv3 driver: Probe of devices, and populating
              info to the hypervisor, IOMMU ops

A development branch is available at:
https://android-kvm.googlesource.com/linux/+log/refs/heads/for-upstream/pkvm-smmu-v3

Design and future work
===============
This patch series is designed to be minimal and include patches only
required for functionality.

The hypervisor SMMUv3 driver will load early before KVM initialises
and registers itself as a KVM IOMMU driver; if it finds SMMUv3 on the platform.

Then after KVM initialises and before it de-privileges it will initialise
the kernel part of the driver, that will probe the SMMUs, initialise some
of the HW and populate a list of SMMUs to the hypervisor part to deal with.
The kernel driver exposes an IOMMU driver to the kernel that only supports
IDENTITY domains.

Then the hypervisor part of the driver will initialise before de-privilege
which then take over the shared structs, cmdq and create a shadow page table
for the SMMU.

In addition to the patches in this series, I am working on part-2 which adds
more features (EVTQ support for debuggability and RPM and possibly some
optimizations such as sharing page tables, split block unmap logic...)
https://android-kvm.googlesource.com/linux/+log/refs/heads/for-upstream/pkvm-smmu-v3-part-2

After that I plan to post 2 RFCs which adds support for translating
domains, one with paravirtual interface(similar to V2) and one with SMMUv3
emulation (similar to[3])

This series is tested on Morello board and Qemu.

[1] https://lore.kernel.org/kvmarm/20220519134204.5379-1-will@kernel.org/
[2] https://www.youtube.com/watch?v=9npebeVFbFw
[3] https://android-kvm.googlesource.com/linux/+log/refs/heads/smostafa/android15-6.6-smmu-nesting-wip-2


Jean-Philippe Brucker (11):
  iommu/io-pgtable-arm: Split initialization
  iommu/arm-smmu-v3: Move some definitions to a new common file
  iommu/arm-smmu-v3: Extract driver-specific bits from probe function
  iommu/arm-smmu-v3: Move some functions to arm-smmu-v3-common.c
  iommu/arm-smmu-v3: Move firmware probe to arm-smmu-v3-common
  iommu/arm-smmu-v3: Move IOMMU registration to arm-smmu-v3-common.c
  iommu/arm-smmu-v3-kvm: Add SMMUv3 driver
  iommu/arm-smmu-v3-kvm: Initialize registers
  iommu/arm-smmu-v3-kvm: Reset the device
  iommu/arm-smmu-v3-kvm: Add host driver for pKVM
  iommu/arm-smmu-v3-kvm: Pass a list of SMMU devices to the hypervisor

Mostafa Saleh (18):
  KVM: arm64: Add a new function to donate memory with prot
  KVM: arm64: Donate MMIO to the hypervisor
  KVM: arm64: pkvm: Add pkvm_time_get()
  iommu/io-pgtable-arm: Split the page table driver
  iommu/arm-smmu-v3: Move queue and table allocation to
    arm-smmu-v3-common.c
  iommu/arm-smmu-v3: Split cmdq code with hyp
  iommu/arm-smmu-v3: Move TLB range invalidation into a macro
  KVM: arm64: iommu: Introduce IOMMU driver infrastructure
  KVM: arm64: iommu: Shadow host stage-2 page table
  KVM: arm64: iommu: Add a memory pool
  KVM: arm64: iommu: Add enable/disable hypercalls
  iommu/arm-smmu-v3-kvm: Setup command queue
  iommu/arm-smmu-v3-kvm: Setup stream table
  iommu/arm-smmu-v3-kvm: Support io-pgtable
  iommu/arm-smmu-v3-kvm: Shadow the CPU stage-2 page table
  iommu/arm-smmu-v3-kvm: Add enable/disable device HVCs
  iommu/arm-smmu-v3-kvm: Allocate structures and reset device
  iommu/arm-smmu-v3-kvm: Add IOMMU ops

 arch/arm64/include/asm/kvm_asm.h              |   2 +
 arch/arm64/include/asm/kvm_host.h             |  14 +
 arch/arm64/kvm/Makefile                       |   3 +-
 arch/arm64/kvm/arm.c                          |   8 +-
 arch/arm64/kvm/hyp/include/nvhe/iommu.h       |  23 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   3 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   2 +
 arch/arm64/kvm/hyp/nvhe/Makefile              |  10 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  19 +
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c         | 129 +++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         |  80 +-
 arch/arm64/kvm/hyp/nvhe/setup.c               |  17 +
 arch/arm64/kvm/hyp/nvhe/timer-sr.c            |  33 +
 arch/arm64/kvm/hyp/pgtable.c                  |   9 +-
 arch/arm64/kvm/iommu.c                        |  65 ++
 arch/arm64/kvm/pkvm.c                         |   1 +
 drivers/iommu/Makefile                        |   2 +-
 drivers/iommu/arm/Kconfig                     |   9 +
 drivers/iommu/arm/arm-smmu-v3/Makefile        |   6 +
 .../arm/arm-smmu-v3/arm-smmu-v3-common-hyp.c  | 114 +++
 .../arm/arm-smmu-v3/arm-smmu-v3-common.c      | 700 ++++++++++++++
 .../arm/arm-smmu-v3/arm-smmu-v3-common.h      | 624 ++++++++++++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 393 ++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 904 +-----------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 532 +----------
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 676 +++++++++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |  51 +
 .../arm/arm-smmu-v3/pkvm/io-pgtable-arm.c     | 115 +++
 drivers/iommu/io-pgtable-arm-common.c         | 694 ++++++++++++++
 drivers/iommu/io-pgtable-arm.c                | 870 +----------------
 drivers/iommu/io-pgtable-arm.h                | 274 +++++-
 31 files changed, 4102 insertions(+), 2280 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/iommu.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
 create mode 100644 arch/arm64/kvm/iommu.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-hyp.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.h
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c
 create mode 100644 drivers/iommu/io-pgtable-arm-common.c

-- 
2.50.1.552.g942d659e1b-goog


