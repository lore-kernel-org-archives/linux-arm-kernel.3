Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64634D65528
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Pxfcgf9ESJFQ3CbAFDbmQCHe4wAyVbpr9IYTCTYoUU=; b=yYwobgn334eUUgKjVOUKaMBulg
	+BEJ43rN3K+My7cbvmpGhKQMl7sgCLEQiXrRrvPmZTnemp7AGasoQE5kn1LjoplN4XIyNfhcnghla
	uo2DH6gfVjpfbLQwhEqIwtPI8N68u5ZRBqVon4L1sfB5fvZbGRGxKgPbeHaWNLbK3G5U8NR+ypOsd
	tqQATJ7rmMJhCr6lecnZgFm3Lla33xzm2rdGE2Hthwea3thHleMFnkH7aE59IOJjN2+XlUrvggO0G
	BQNYnN3hpWNuwfL747HPPb+9P3o1KSy0D471XV+Gw5CNNZ2IQctP5c4l5m1vPIIN/oKrXK5eexpCQ
	hhUcruGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoVa-00000006Vmn-3427;
	Wed, 17 Dec 2025 10:11:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoVY-00000006VmC-1Za4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 10:11:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA7A514BF;
	Wed, 17 Dec 2025 02:11:38 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.45.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDC673F73B;
	Wed, 17 Dec 2025 02:11:40 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: [PATCH v12 00/46] arm64: Support for Arm CCA in KVM
Date: Wed, 17 Dec 2025 10:10:37 +0000
Message-ID: <20251217101125.91098-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021148_504655_AD8F99F2 
X-CRM114-Status: GOOD (  17.51  )
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

This series adds support for running protected VMs using KVM under the
Arm Confidential Compute Architecture (CCA). I've changed the uAPI
following feedback from Marc.

The main change is that rather than providing a multiplex CAP and
expecting the VMM to drive the different stages of realm construction,
there's now just a minimal interface and KVM performs the necessary
operations when needed.

This series is lightly tested and is meant as a demonstration of the new
uAPI. There are a number of (known) rough corners in the implementation
that I haven't dealt with properly.

In particular please note that this series is still targetting RMM v1.0.
There is an alpha quality version of RMM v2.0 available[1]. Feedback was
that there are a number of blockers for merging with RMM v1.0 and so I
expect to rework this series to support RMM v2.0 before it is merged.
That will necessarily involve reworking the implementation.

Specifically I'm expecting improvements in:

 * GIC handling - passing state in registers, and allowing the host to
   fully emulate the GIC by allowing trap bits to be set.

 * PMU handling - again providing flexibility to the host's emulation.

 * Page size/granule size mismatch. RMM v1.0 defines the granule as 4k,
   RMM v2.0 provide the option for the host to change the granule size.
   The intention is that Linux would simply set the granule size equal
   to its page size which will significantly simplify the management of
   granules.

 * Some performance improvement from the use of range-based map/unmap
   RMI calls.

This series is based on v6.19-rc1. It is also available as a git
repository:

https://gitlab.arm.com/linux-arm/linux-cca cca-host/v12

Work in progress changes for kvmtool are available from the git
repository below:

https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v10

[1] https://developer.arm.com/documentation/den0137/latest/

Jean-Philippe Brucker (7):
  arm64: RMI: Propagate number of breakpoints and watchpoints to
    userspace
  arm64: RMI: Set breakpoint parameters through SET_ONE_REG
  arm64: RMI: Initialize PMCR.N with number counter supported by RMM
  arm64: RMI: Propagate max SVE vector length from RMM
  arm64: RMI: Configure max SVE vector length for a Realm
  arm64: RMI: Provide register list for unfinalized RMI RECs
  arm64: RMI: Provide accurate register list

Joey Gouly (2):
  arm64: RMI: allow userspace to inject aborts
  arm64: RMI: support RSI_HOST_CALL

Steven Price (34):
  arm64: RME: Handle Granule Protection Faults (GPFs)
  arm64: RMI: Add SMC definitions for calling the RMM
  arm64: RMI: Add wrappers for RMI calls
  arm64: RMI: Check for RMI support at KVM init
  arm64: RMI: Define the user ABI
  arm64: RMI: Basic infrastructure for creating a realm.
  KVM: arm64: Allow passing machine type in KVM creation
  arm64: RMI: RTT tear down
  arm64: RMI: Activate realm on first VCPU run
  arm64: RMI: Allocate/free RECs to match vCPUs
  KVM: arm64: vgic: Provide helper for number of list registers
  arm64: RMI: Support for the VGIC in realms
  KVM: arm64: Support timers in realm RECs
  arm64: RMI: Handle realm enter/exit
  arm64: RMI: Handle RMI_EXIT_RIPAS_CHANGE
  KVM: arm64: Handle realm MMIO emulation
  KVM: arm64: Expose support for private memory
  arm64: RMI: Allow populating initial contents
  arm64: RMI: Set RIPAS of initial memslots
  arm64: RMI: Create the realm descriptor
  arm64: RMI: Add a VMID allocator for realms
  arm64: RMI: Runtime faulting of memory
  KVM: arm64: Handle realm VCPU load
  KVM: arm64: Validate register access for a Realm VM
  KVM: arm64: Handle Realm PSCI requests
  KVM: arm64: WARN on injected undef exceptions
  arm64: Don't expose stolen time for realm guests
  arm64: RMI: Always use 4k pages for realms
  arm64: RMI: Prevent Device mappings for Realms
  HACK: Restore per-CPU cpu_armpmu pointer
  arm_pmu: Provide a mechanism for disabling the physical IRQ
  arm64: RMI: Enable PMU support with a realm guest
  KVM: arm64: Expose KVM_ARM_VCPU_REC to user space
  arm64: RMI: Enable realms to be created

Suzuki K Poulose (3):
  kvm: arm64: Include kvm_emulate.h in kvm/arm_psci.h
  kvm: arm64: Don't expose unsupported capabilities for realm guests
  arm64: RMI: Allow checking SVE on VM instance

 Documentation/virt/kvm/api.rst       |   78 +-
 arch/arm64/include/asm/kvm_emulate.h |   31 +
 arch/arm64/include/asm/kvm_host.h    |   13 +-
 arch/arm64/include/asm/kvm_rmi.h     |  137 +++
 arch/arm64/include/asm/rmi_cmds.h    |  508 ++++++++
 arch/arm64/include/asm/rmi_smc.h     |  269 +++++
 arch/arm64/include/asm/virt.h        |    1 +
 arch/arm64/kernel/cpufeature.c       |    1 +
 arch/arm64/kvm/Kconfig               |    2 +
 arch/arm64/kvm/Makefile              |    2 +-
 arch/arm64/kvm/arch_timer.c          |   37 +-
 arch/arm64/kvm/arm.c                 |  179 ++-
 arch/arm64/kvm/guest.c               |   95 +-
 arch/arm64/kvm/hypercalls.c          |    4 +-
 arch/arm64/kvm/inject_fault.c        |    5 +-
 arch/arm64/kvm/mmio.c                |   16 +-
 arch/arm64/kvm/mmu.c                 |  214 +++-
 arch/arm64/kvm/pmu-emul.c            |    6 +
 arch/arm64/kvm/psci.c                |   30 +
 arch/arm64/kvm/reset.c               |   13 +-
 arch/arm64/kvm/rmi-exit.c            |  207 ++++
 arch/arm64/kvm/rmi.c                 | 1663 ++++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c            |   53 +-
 arch/arm64/kvm/vgic/vgic-init.c      |    2 +-
 arch/arm64/kvm/vgic/vgic-v2.c        |    6 +-
 arch/arm64/kvm/vgic/vgic-v3.c        |   14 +-
 arch/arm64/kvm/vgic/vgic.c           |   55 +-
 arch/arm64/kvm/vgic/vgic.h           |   20 +-
 arch/arm64/mm/fault.c                |   28 +-
 drivers/perf/arm_pmu.c               |   20 +
 include/kvm/arm_arch_timer.h         |    2 +
 include/kvm/arm_pmu.h                |    4 +
 include/kvm/arm_psci.h               |    2 +
 include/linux/perf/arm_pmu.h         |    7 +
 include/uapi/linux/kvm.h             |   42 +-
 35 files changed, 3650 insertions(+), 116 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_rmi.h
 create mode 100644 arch/arm64/include/asm/rmi_cmds.h
 create mode 100644 arch/arm64/include/asm/rmi_smc.h
 create mode 100644 arch/arm64/kvm/rmi-exit.c
 create mode 100644 arch/arm64/kvm/rmi.c

-- 
2.43.0


