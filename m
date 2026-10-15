Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA885CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aW04Fxw6QOvKQXXCTwvZLbew+4xaP2fETNEReXYyrUI=; b=MY0VKWzInH/PQ/fFVESjocvYsT
	ojhy+dooqOXJO95YHw27uwL6R/nCSn/cbD/xAGL/1ohrHG62KOyS+iGKz/iocwW+qeHKmSKigDIKb
	RF2A6/UOEbx1IWjAZgEJ2LWfgAdLoQ2IiQyNnijzURkohMBIWi7edtpQJ1JbxFfEeRG5y5EBdQkPj
	MoDhTz7hZjJdiasIRJcP0IvqaR39Nf4kJqSHClWjSp+mu1YIyh4dFqQ+l/6gqRfUIo8zhUH7gDmJ3
	fjo60pitBTSDWfXJTEYPWIIm0PoSjH6k9jdm4pbaoRqUaIRAoCEzlQ4iz23tDN5wbsIMIDagcbM+y
	sApCZoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPK-00000000M87-0Djj;
	Thu, 15 Oct 2026 14:26:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPH-00000000M7A-1TcM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:26:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CC911477;
	Thu, 15 Oct 2026 07:26:00 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.2.198.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6F6B3F871;
	Thu, 15 Oct 2026 07:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792074363; bh=nRMhCWv1VYJE0ooCA755xJ6dFPiezH5+ScPUC6Dphts=;
	h=From:To:Cc:Subject:Date:From;
	b=QcG0e46uz/7hlMfHpaXW1ozPdaqgTVqNUy1PeqfN2lkSTvz+SkpiTinzKAox+EXrg
	 W5meia0bwgyrfC9AS0HoJ9neI2kdDzSj5qtgQAsmYJNv3ddD/rPgPHM7kPSfjc15/J
	 oEU9YCoUQojOnp17pewfxUDuFTan4gdxPZ/GD0Mc=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 00/15] Arm Core Local Accelerator Driver
Date: Thu, 15 Oct 2026 15:25:34 +0100
Message-ID: <20261015142552.4128028-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_072607_488314_61B40418 
X-CRM114-Status: GOOD (  22.92  )
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

Hi All,

This is v2 of an RFC to introduce a driver for the Arm Core Local Accelerator
(CLA), a CPU-local interface for programming attached accelerators. While the
interface is agnostic to the accelerator type, the initial (and currently only)
target is a compute engine.

The RFC aims to engage the community and get feedback on some key aspects. This
will help plan our approach for eventual upstreaming. Based on feedback from
Will and Marc in RFCv1, the driver now supports both bare metal and virtualized
environments. I also have commitments to publish the CLA spec, a supporting FVP
and a representaive user space, all to support upstreaming the driver, as per
Will's feedback.

For now you can find documentation included with patch 1, which describes the HW
and driver design. Note that the CLA is not part of the Arm Architecture.

Patch 1 documents the hardware and driver design, and adds a driver skeleton.
Patches 2-5 initialize and probe the device. Patches 6-9 add context management
for switching the device between different users. Patches 10-12 add some (small)
changes to KVM and VFIO, which then enables patches 13-15 to expose the HW for
device assignment into a VM.

Aspects I'm seeking feedback for:

* The general structure of the driver: The current shape addresses the
  performance requirements we have for the use cases, and is therefore our
  preferred approach. But there are some unusual aspects due to the HW design.

* Driver interaction with architectural support: I've opted to treat the CLA as
  a device rather than a CPU extension, so it's implemented as a (mostly)
  self-contained driver. It has some unavoidable coupling to the arch code since
  it needs to share page tables and ASIDs/VMIDs. All arm64 arch interaction is
  contained in cla-mtc.c.

* The location of the driver: although most accelerators will likely be compute
  ones, CLA is a generic MMIO interface that could handle any kind of
  accelerator. It's currently implemented as a misc driver. accel is another
  potential option, but given the current SVA approach, we would not use any of
  the services (memory-management or otherwise) that accel provides.

* Virtualization support: since the HW uses the CPU's MMU, we introduced a new
  VFIO_CPU_MMU group type, and added the kvm_arch_[get|put]_guest_mmu() API to
  KVM/arm64 so that the CLA can share the stage2 pgtables and VMID. The CPU
  pinning problem remains unsolved; the vCPU must be pinned to the pCPU that
  owns the CLA in order to access it. If the pCPU goes offline or the vCPU is
  otherwise unpinned, it would look to the guest like the HW is faulty. This
  issue is therefore contained to the guest. I've additionally improved the
  robustness of the core driver to deal with this eventuality gracefully.

I consider the core driver to be well tested and robust. The virtualization
portion is prototype and has known issues that would be addressed assuming the
approach gets positive feedback.

Changes since RFCv1 [1]
=======================

 - Added KVM guest support through VFIO mdev, including exclusive domain
   assignment, stage-2 memory translation and VMID pinning
 - Changed the userspace ABI to expose one `/dev/cla/<class-id>` device per
   accelerator class; `ARM_CLA_PARAM_DEV_ACCELS` now reports only accelerators
   belonging to the opened class (per Arnd)
 - Removed `ARM_CLA_UABI_VERSION` and the `ARM_CLA_PARAM_UABI_VERSION` query
   (per Arnd)
 - Various driver bug fixes and robustness improvements


Source, along with some tests, is available at [2]. Patches based on v7.3-rc5.

[1] https://lore.kernel.org/all/20260717104759.123203-1-ryan.roberts@arm.com/
[2] https://gitlab.arm.com/linux-arm/linux-rr/-/tree/features/cla-driver-v2-rfc-tests

Thanks,
Ryan


Jean-Philippe Brucker (10):
  misc/arm-cla: Add driver skeleton and documentation
  misc/arm-cla: Add launch operation helpers
  misc/arm-cla: Probe firmware-described devices
  misc/arm-cla: Initialize devices on CPU bringup
  misc/arm-cla: Accelerator context save and restore
  KVM: arm64: Export stage-2 MMU config
  vfio: Support VFIO devices that access the CPU MMU
  misc/arm-cla: Add stage-2 MTC and VM context switch
  misc/arm-cla: Support exclusive context assignment
  misc/arm-cla: Add vfio-mdev user interface

Ryan Roberts (4):
  dt-bindings: misc: Add Arm Core Local Accelerator
  misc/arm-cla: Set up memory translation context
  misc/arm-cla: Manage domain contexts
  misc/arm-cla: Add userspace interface

Shameer Kolothum (1):
  KVM: arm64: Introduce support to pin VMIDs

 .../devicetree/bindings/misc/arm,cla.yaml     |  77 +++
 Documentation/misc-devices/arm-cla.rst        | 217 +++++++
 Documentation/misc-devices/index.rst          |   1 +
 MAINTAINERS                                   |   9 +
 arch/arm64/include/asm/kvm_host.h             |  14 +
 arch/arm64/include/asm/kvm_mmu.h              |   1 +
 arch/arm64/kvm/mmu.c                          | 102 ++++
 arch/arm64/kvm/sys_regs.c                     |  14 +-
 arch/arm64/kvm/vmid.c                         |  77 ++-
 drivers/misc/Kconfig                          |   1 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/arm-cla/Kconfig                  |  26 +
 drivers/misc/arm-cla/Makefile                 |  15 +
 drivers/misc/arm-cla/arm-cla-regs.h           | 192 ++++++
 drivers/misc/arm-cla/arm-cla.h                | 393 ++++++++++++
 drivers/misc/arm-cla/cla-ctx.c                | 229 +++++++
 drivers/misc/arm-cla/cla-init.c               | 562 ++++++++++++++++++
 drivers/misc/arm-cla/cla-mdev.c               | 469 +++++++++++++++
 drivers/misc/arm-cla/cla-mtc.c                | 335 +++++++++++
 drivers/misc/arm-cla/cla-ops.c                | 417 +++++++++++++
 drivers/misc/arm-cla/cla-regs.c               | 370 ++++++++++++
 drivers/misc/arm-cla/cla-sched.c              | 474 +++++++++++++++
 drivers/misc/arm-cla/cla-topology.c           | 202 +++++++
 drivers/misc/arm-cla/cla-user.c               | 541 +++++++++++++++++
 drivers/vfio/group.c                          |  37 +-
 drivers/vfio/vfio.h                           |   5 +
 drivers/vfio/vfio_main.c                      |  16 +-
 include/linux/vfio.h                          |   1 +
 include/uapi/linux/arm-cla.h                  | 198 ++++++
 29 files changed, 4969 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/arm,cla.yaml
 create mode 100644 Documentation/misc-devices/arm-cla.rst
 create mode 100644 drivers/misc/arm-cla/Kconfig
 create mode 100644 drivers/misc/arm-cla/Makefile
 create mode 100644 drivers/misc/arm-cla/arm-cla-regs.h
 create mode 100644 drivers/misc/arm-cla/arm-cla.h
 create mode 100644 drivers/misc/arm-cla/cla-ctx.c
 create mode 100644 drivers/misc/arm-cla/cla-init.c
 create mode 100644 drivers/misc/arm-cla/cla-mdev.c
 create mode 100644 drivers/misc/arm-cla/cla-mtc.c
 create mode 100644 drivers/misc/arm-cla/cla-ops.c
 create mode 100644 drivers/misc/arm-cla/cla-regs.c
 create mode 100644 drivers/misc/arm-cla/cla-sched.c
 create mode 100644 drivers/misc/arm-cla/cla-topology.c
 create mode 100644 drivers/misc/arm-cla/cla-user.c
 create mode 100644 include/uapi/linux/arm-cla.h

--
2.43.0


