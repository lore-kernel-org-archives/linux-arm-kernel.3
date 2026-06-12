Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A25CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u60qdRNOCqKqcuRdaXAx140Po6M1Yopy4F2KxEGMp20=; b=zB2yxK+ITPWaHuQcnVL3H+89Yf
	sxJUTK1lQU7qFgU62Lea5ymp9niRmEgPAzcBMjXYG9ygW/FijR6n2F7b/OebXXXLGJ8gcAk3Q4262
	F9L9ipyrm5AwmydYRyFvQqEtJjLxahgzmoIkZr86BI6Fraef725wZJfBmi5BLTAyJI5wxc/9AYFcJ
	I7EOJVffMi+lKczbP2Df4crrLm70YKwwQ1QG3F55tgq80PFAs2rOO5gBv3ybH281JLa2FtAs8fxH0
	1jIenPY9CSL5MDtRndhuC8jHE4HW/CxFAzXHksBqjgCULG/fnCigmhunkgfosZvISDUP2ve5whI1v
	NI4gFOvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Z5-0000000BSK9-1zIh;
	Fri, 12 Jun 2026 19:29:15 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Z2-0000000BSJB-0hbJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:13 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-485ffc7113bso1367684b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292551; x=1781897351; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u60qdRNOCqKqcuRdaXAx140Po6M1Yopy4F2KxEGMp20=;
        b=HZApXre+JFa2aaBCVGUr1hCPhUlYnWcOLpvSNnoIvG1J0fefCXjDHVxYVpGbngX8we
         wLd7BQYAJNRfA7iQsdADzYlp9McVomB6zXdvogelA1oF3XX33VS6h6o6oAXRMrKCOY38
         RC/yM4xBqt0j2RpHIMwEME1gMJi78v/rYAoZt8QJmdZtX88d9Sr5St+oko1/IiOu0Bdp
         tcX1vMIEAz2nOTe/3usAtfM99xC/HsMyv90T5Yeiy1qajvRbmFn2NEzigme66lA17620
         VYUm0hEmaXKGfwBfCRYCdp5V7N0V9/hyFS7OVQQVeQkSldi4DrRA4zHfw2VcNgERMcL9
         CEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292551; x=1781897351;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u60qdRNOCqKqcuRdaXAx140Po6M1Yopy4F2KxEGMp20=;
        b=lJb29gNT2pHox3Q9IK79iqFUCu8mF51FoBRE1TkV9Ra7IBKJ8bT3MHnj5RbIlJX1AI
         slUIodMZJA0d3dHOcdp67WkS1PZY+HrN1NfvqLpuj/+mm1kNHBzAhNyxfapIgSGdAq1Y
         7rg30tZsGOdWrZyTcXRnkpvPmSCUbr+b26X18ChtrqO/Hzasv/SPXy8ssoyfTZBkMQsI
         MTtp3m0nLluutNPxivWaswQtRprTV1zRdiWsEXBnsRWTm1NhKwvhZyIIMF4ytxb4xS+D
         ytJPE2Q15eAt0d5hBQPIQoP4tsPhG0qB4jbfqWG/ifoFroqf4J4AFJMiGNxlLSQ9JTSF
         QeRw==
X-Forwarded-Encrypted: i=1; AFNElJ+SAs8zgsyRXybGJjBEkco0m9EqqoMbnzQn8qcpLSWbomrAFSyiHJuB6MkaN3Glvg+TsUG2TOefqFwoVu/adzjS@lists.infradead.org
X-Gm-Message-State: AOJu0YxEcKjbZFTrE1NeznyzuC5bBdWQyyaclOj/qfzmO0kbVIX2qbsP
	mHLr+gzVYYTEdAV0R4DLn57NanyfR4Rxh5kbQ9cO1Y2cPnuy+uTb7El9uvBqWLfPWDMF/23SXQG
	OEHNQiqsl2pAc8sDc4CJRrHzzCA==
X-Received: from ilqh1.prod.google.com ([2002:a92:d841:0:b0:501:ee09:eb2e])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1913:b0:479:d25e:9065 with SMTP id 5614622812f47-4874193626fmr670168b6e.2.1781292550242;
 Fri, 12 Jun 2026 12:29:10 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:28:48 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-1-coltonlewis@google.com>
Subject: [PATCH v8 00/21] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_122912_249393_2502F9BE 
X-CRM114-Status: GOOD (  18.71  )
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

This series creates a new PMU scheme on ARM, a partitioned PMU that
allows reserving a subset of counters for more direct guest access,
significantly reducing overhead. More details, including performance
benchmarks, can be read in the v1 cover letter linked below.

An overview of what this series accomplishes was presented at KVM
Forum 2025. Slides [1] and video [2] are linked below.

The kernel command line parameter for the driver still exists, but now
only defines an upper limit of counters the guest might use rather
than taking those counters from the host permanently.

I would appreciate any discussion on whether that parameter should
still exist as it's an inconvenient enabling gate on the feature that
is no longer required. The question comes down to what, if any, guards
we want against a guest monopolizing all counters on a system.

v8:

* Rebase on top of v7.1-rc7.

* Implement Oliver Upton's accessor proposal to centralize PMU
  register access and simplify trap handlers. Instead of one singular
  accessor, implement as two because the read and write paths are
  always different anyway.

* Introduce the partitioning flag along with the
  kvm_pmu_is_partitioned predicate

* Don't use ifdef for partitioning predicates as that can be handled
  by has_vhe

* Clean up MDCR_EL2 handling by open-coding use_fgt and hpmn and
  unconditionally setting RES0 bits.

* Use {read,write}_pmcrcntrn in context swaps

* Put operators on preceeding lines

* Rename hw_cntr_mask to hw_cntr_impl to clarify it tracks the number
  of counters implemented by hardware

* Use GENMASK_ULL in mask functions returning u64

* warn_once when host events are squeezed out by guest counter
  allocations.

* Address Sashiko AI Review findings:

  - Critical fixes for lazy PMU context swaps (ensuring guest state is
    loaded on transition to GUEST_OWNED), PMSELR_EL0 trapping to
    prevent stale selector index, and masking guest PMCR_EL0 writes to
    prevent host reset.

  - High priority fixes for lock safety (disabling IRQs when acquiring
    perf context lock), disabling guest counters on vCPU put,
    preserving VHE host profiling in MDCR_EL2, waking halted vCPUs on
    guest PMU interrupts, masking host configuration leaks, preemption
    safety in per-CPU accesses, emulating PMCR.N reads, and preventing
    data races in PMOVSSET_EL0 accesses.

  - Medium/Low fixes for user-access fallback safety, VM-wide state
    modification restrictions, selftests type safety, and cleanup of
    unused fields and typos.

v7:
https://lore.kernel.org/kvmarm/20260504211813.1804997-1-coltonlewis@google.com/

v6:
https://lore.kernel.org/kvmarm/20260209221414.2169465-1-coltonlewis@google.com/

v5:
https://lore.kernel.org/kvmarm/20251209205121.1871534-1-coltonlewis@google.com/

v4:
https://lore.kernel.org/kvmarm/20250714225917.1396543-1-coltonlewis@google.com/

v3:
https://lore.kernel.org/kvm/20250626200459.1153955-1-coltonlewis@google.com/

v2:
https://lore.kernel.org/kvm/20250620221326.1261128-1-coltonlewis@google.com/

v1:
https://lore.kernel.org/kvm/20250602192702.2125115-1-coltonlewis@google.com/

[1] https://gitlab.com/qemu-project/kvm-forum/-/raw/main/_attachments/2025/Optimizing__itvHkhc.pdf
[2] https://www.youtube.com/watch?v=YRzZ8jMIA6M&list=PLW3ep1uCIRfxwmllXTOA2txfDWN6vUOHp&index=9

Colton Lewis (20):
  arm64: cpufeature: Add cpucap for HPMN0
  KVM: arm64: Reorganize PMU functions
  perf: arm_pmuv3: Generalize counter bitmasks
  perf: arm_pmuv3: Check cntr_mask before using pmccntr
  perf: arm_pmuv3: Allocate counter indices from high to low
  perf: arm_pmuv3: Add method to partition the PMU
  KVM: arm64: Set up FGT for Partitioned PMU
  KVM: arm64: Add Partitioned PMU register trap handlers
  KVM: arm64: Set up MDCR_EL2 to handle a Partitioned PMU
  KVM: arm64: Context swap Partitioned PMU guest registers
  KVM: arm64: Enforce PMU event filter at vcpu_load()
  perf: Add perf_pmu_resched_update()
  KVM: arm64: Apply dynamic guest counter reservations
  KVM: arm64: Implement lazy PMU context swaps
  perf: arm_pmuv3: Handle IRQs for Partitioned PMU guest counters
  KVM: arm64: Detect overflows for the Partitioned PMU
  KVM: arm64: Add vCPU device attr to partition the PMU
  KVM: selftests: Add find_bit to KVM library
  KVM: arm64: selftests: Add test case for Partitioned PMU
  KVM: arm64: selftests: Relax testing for exceptions when partitioned

Marc Zyngier (1):
  KVM: arm64: Reorganize PMU includes

 arch/arm/include/asm/arm_pmuv3.h              |  18 +
 arch/arm64/include/asm/arm_pmuv3.h            |  12 +-
 arch/arm64/include/asm/kvm_host.h             |  17 +-
 arch/arm64/include/asm/kvm_types.h            |   6 +-
 arch/arm64/include/uapi/asm/kvm.h             |   2 +
 arch/arm64/kernel/cpufeature.c                |  10 +-
 arch/arm64/kvm/Makefile                       |   2 +-
 arch/arm64/kvm/arm.c                          |   2 +
 arch/arm64/kvm/config.c                       |  41 +-
 arch/arm64/kvm/debug.c                        |  30 +-
 arch/arm64/kvm/pmu-direct.c                   | 507 ++++++++++++
 arch/arm64/kvm/pmu-emul.c                     | 684 +----------------
 arch/arm64/kvm/pmu.c                          | 720 ++++++++++++++++++
 arch/arm64/kvm/sys_regs.c                     | 271 +++++--
 arch/arm64/tools/cpucaps                      |   1 +
 arch/arm64/tools/sysreg                       |   6 +-
 drivers/perf/arm_pmuv3.c                      | 136 +++-
 include/kvm/arm_pmu.h                         |  93 ++-
 include/linux/perf/arm_pmu.h                  |   8 +
 include/linux/perf/arm_pmuv3.h                |  14 +-
 include/linux/perf_event.h                    |   3 +
 kernel/events/core.c                          |  31 +-
 tools/include/perf/arm_pmuv3.h                |  12 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/vpmu_counter_access.c | 112 ++-
 tools/testing/selftests/kvm/lib/find_bit.c    |   2 +
 26 files changed, 1918 insertions(+), 823 deletions(-)
 create mode 100644 arch/arm64/kvm/pmu-direct.c
 create mode 100644 tools/testing/selftests/kvm/lib/find_bit.c


base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
-- 
2.54.0.1136.gdb2ca164c4-goog


