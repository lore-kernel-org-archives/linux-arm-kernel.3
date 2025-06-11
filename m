Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0B1C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DvPxkcdVRvKh2gHlPFtVO95EhwVRl/Iz0u5ov0YWNRk=; b=pZpXKHFM8alVX5Yt1R2mZccV/Y
	PPfdBXKAnFyZU+woWF6uzw6GzquD2FgIusQ4S19jz8EytSnYKoj8qusV2Wwl2rE8U26u5apYkb6OT
	q2KxUomzy3Q5JWMMyJ3gx7YjYUHgsEvPe1dVZEB7SwWbU91oX5L7k6teeGeW3vUyD4OZEZeQCgyfS
	jR6DsDvi1OOnvfTvaoloXIUOuln2H/Jkx8USbwSPzQyzZ6VPqT8g7M34tr+KGnQOJ5sZIYE34Gox9
	kbzzLx6IJCRQTbMqgso2jT9wx/oL2oD0iM+bLriqEMz8VGZyI4XvQbCzGG1TMwgjTVEIsLQJUk+y7
	F+DgQgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNmO-0000000ATSd-2Ngv;
	Wed, 11 Jun 2025 15:54:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ12-00000009f8J-3cuB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 10:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DvPxkcdVRvKh2gHlPFtVO95EhwVRl/Iz0u5ov0YWNRk=; b=Aa/GcoPYiq9onWpQ5WNd6aPUFj
	oLGT98ES/BuCRCEc5r709rlxJ4z1gSds+7iGECd2P6L6NxYibiw1DxPOmEiGz7+tR9IUf64GlpB+7
	4gDyWpxPbOVSopU5y4ArftfmewFgJDPwC8O47p100SWJuodsXnXLszTLxUVc38bmdDGLBKoki+Zju
	T+ahScOO30hnMZQaHJhQOMjE9ofctVTKOcONtgGtJOiih1xmKxIFM/VMjt9/A0KSflNG/jLqCFeRJ
	5h6sGdzhGgTJu0R8fs1smNaeZyAqJeaZVWYzAZxrLbGy6e3B37dlrZUPAU2YAVG3sqVnl0c/gmSh8
	u5OsIb5w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ10-00000002I6L-0rJa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:49:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCFFF15A1;
	Wed, 11 Jun 2025 03:48:42 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.67.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 605143F673;
	Wed, 11 Jun 2025 03:48:58 -0700 (PDT)
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
	Emi Kisanuki <fj0570is@fujitsu.com>
Subject: [PATCH v9 00/43] arm64: Support for Arm CCA in KVM
Date: Wed, 11 Jun 2025 11:47:57 +0100
Message-ID: <20250611104844.245235-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_114906_602987_30A2B635 
X-CRM114-Status: GOOD (  17.94  )
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
Arm Confidential Compute Architecture (CCA).

The related guest support was merged for v6.14-rc1 so you no longer need
that separately.

There are a few changes since v8, many thanks for the review
comments. The highlights are below, and individual patches have a changelog.

 * NV support is now upstream, so this series no longer conflicts.

 * Tidied up RTT accounting by providing wrapper functions to call
   kvm_account_pgtable_pages() only when appropriate.

 * Propagate the 'may_block' flag to enable cond_resched calls only when
   appropriate.

 * Reduce code duplication between INIT_RIPAS and SET_RIPAS.

 * Various code improvements from the reviews - many thanks!

 * Rebased onto v6.16-rc1.

Things to note:

 * The magic numbers for capabilities and ioctls have been updated. So
   you'll need to update your VMM. See below for update kvmtool branch.

 * Patch 42 increases KVM_VCPU_MAX_FEATURES to expose the new feature.

The ABI to the RMM (the RMI) is based on RMM v1.0-rel0 specification[1].

This series is based on v6.16-rc1. It is also available as a git
repository:

https://gitlab.arm.com/linux-arm/linux-cca cca-host/v9

Work in progress changes for kvmtool are available from the git
repository below:

https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v7

[1] https://developer.arm.com/documentation/den0137/1-0rel0/

Jean-Philippe Brucker (7):
  arm64: RME: Propagate number of breakpoints and watchpoints to
    userspace
  arm64: RME: Set breakpoint parameters through SET_ONE_REG
  arm64: RME: Initialize PMCR.N with number counter supported by RMM
  arm64: RME: Propagate max SVE vector length from RMM
  arm64: RME: Configure max SVE vector length for a Realm
  arm64: RME: Provide register list for unfinalized RME RECs
  arm64: RME: Provide accurate register list

Joey Gouly (2):
  arm64: RME: allow userspace to inject aborts
  arm64: RME: support RSI_HOST_CALL

Steven Price (31):
  arm64: RME: Handle Granule Protection Faults (GPFs)
  arm64: RME: Add SMC definitions for calling the RMM
  arm64: RME: Add wrappers for RMI calls
  arm64: RME: Check for RME support at KVM init
  arm64: RME: Define the user ABI
  arm64: RME: ioctls to create and configure realms
  KVM: arm64: Allow passing machine type in KVM creation
  arm64: RME: RTT tear down
  arm64: RME: Allocate/free RECs to match vCPUs
  KVM: arm64: vgic: Provide helper for number of list registers
  arm64: RME: Support for the VGIC in realms
  KVM: arm64: Support timers in realm RECs
  arm64: RME: Allow VMM to set RIPAS
  arm64: RME: Handle realm enter/exit
  arm64: RME: Handle RMI_EXIT_RIPAS_CHANGE
  KVM: arm64: Handle realm MMIO emulation
  arm64: RME: Allow populating initial contents
  arm64: RME: Runtime faulting of memory
  KVM: arm64: Handle realm VCPU load
  KVM: arm64: Validate register access for a Realm VM
  KVM: arm64: Handle Realm PSCI requests
  KVM: arm64: WARN on injected undef exceptions
  arm64: Don't expose stolen time for realm guests
  arm64: RME: Always use 4k pages for realms
  arm64: RME: Prevent Device mappings for Realms
  arm_pmu: Provide a mechanism for disabling the physical IRQ
  arm64: RME: Enable PMU support with a realm guest
  arm64: RME: Hide KVM_CAP_READONLY_MEM for realm guests
  KVM: arm64: Expose support for private memory
  KVM: arm64: Expose KVM_ARM_VCPU_REC to user space
  KVM: arm64: Allow activating realms

Suzuki K Poulose (3):
  kvm: arm64: Include kvm_emulate.h in kvm/arm_psci.h
  kvm: arm64: Don't expose debug capabilities for realm guests
  arm64: RME: Allow checking SVE on VM instance

 Documentation/virt/kvm/api.rst       |   94 +-
 arch/arm64/include/asm/kvm_emulate.h |   40 +
 arch/arm64/include/asm/kvm_host.h    |   17 +-
 arch/arm64/include/asm/kvm_rme.h     |  139 ++
 arch/arm64/include/asm/rmi_cmds.h    |  508 ++++++++
 arch/arm64/include/asm/rmi_smc.h     |  268 ++++
 arch/arm64/include/asm/virt.h        |    1 +
 arch/arm64/include/uapi/asm/kvm.h    |   49 +
 arch/arm64/kvm/Kconfig               |    1 +
 arch/arm64/kvm/Makefile              |    3 +-
 arch/arm64/kvm/arch_timer.c          |   48 +-
 arch/arm64/kvm/arm.c                 |  168 ++-
 arch/arm64/kvm/guest.c               |  108 +-
 arch/arm64/kvm/hypercalls.c          |    4 +-
 arch/arm64/kvm/inject_fault.c        |    5 +-
 arch/arm64/kvm/mmio.c                |   16 +-
 arch/arm64/kvm/mmu.c                 |  207 ++-
 arch/arm64/kvm/pmu-emul.c            |    6 +
 arch/arm64/kvm/psci.c                |   30 +
 arch/arm64/kvm/reset.c               |   23 +-
 arch/arm64/kvm/rme-exit.c            |  207 +++
 arch/arm64/kvm/rme.c                 | 1743 ++++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c            |   53 +-
 arch/arm64/kvm/vgic/vgic-init.c      |    2 +-
 arch/arm64/kvm/vgic/vgic-v3.c        |    6 +-
 arch/arm64/kvm/vgic/vgic.c           |   60 +-
 arch/arm64/mm/fault.c                |   31 +-
 drivers/perf/arm_pmu.c               |   15 +
 include/kvm/arm_arch_timer.h         |    2 +
 include/kvm/arm_pmu.h                |    4 +
 include/kvm/arm_psci.h               |    2 +
 include/linux/perf/arm_pmu.h         |    5 +
 include/uapi/linux/kvm.h             |   29 +-
 33 files changed, 3790 insertions(+), 104 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_rme.h
 create mode 100644 arch/arm64/include/asm/rmi_cmds.h
 create mode 100644 arch/arm64/include/asm/rmi_smc.h
 create mode 100644 arch/arm64/kvm/rme-exit.c
 create mode 100644 arch/arm64/kvm/rme.c

-- 
2.43.0


