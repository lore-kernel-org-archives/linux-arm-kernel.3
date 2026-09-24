Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D639C98325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5+HVoWUpl0qaj6LVCbO//92JCksvBDFuswRRe0vTxAA=; b=daDdpNW51+E7RE2K4oTgmfd8fw
	XOuDlLXVpwCQ2hDZKRLUpM7HinQDuciNSUGW2pJgk6T/sPAYyOp9D/paWM6N1NLQWV1XL0DPWZYRT
	HPZHKippz17/i/lUpJKdldbT1DwJ/eJLfqHK69snkvxXJ5nXJVvG33TFBnvo3PbWww+U+r7kd/S/I
	cDRVK5GBMaD1gUQcqLx5jCLnvKnY0dPb/qL+XtISZqfKOrXlVf3qNnM9KEFmrQeutLV6eeNuNQNu0
	WYxbxwaZ6/MQ4baYz91w3LK1+Eoc+u0MhKeUv76BDRBtkqTRacbgpF3Mzsy2PxnlNNHqw918e2Dxl
	zY5hPk5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGT-0000000Bjtl-1GCU;
	Thu, 24 Sep 2026 17:29:45 +0000
Received: from mail-oi1-x245.google.com ([2607:f8b0:4864:20::245])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGG-0000000BjmO-0K6Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:33 +0000
Received: by mail-oi1-x245.google.com with SMTP id 5614622812f47-4b28deb7ee3so203622b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270970; x=1790875770; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5+HVoWUpl0qaj6LVCbO//92JCksvBDFuswRRe0vTxAA=;
        b=na1QcUqxur0eTqppLyZsKPQk62mneF4D78AoOslHkmC7h1d9nInuTeKJN14wiEOR3M
         AUydF5mbWDcNxB/DPNqncaZ+8TxTikJbNBMwQapSUPh4yZ+cObo522qMvR8XN/7QK8IY
         R1NipBYBtTlk5/sJmMZfT6T9Lgbq+DgrmXSqt4PViJfnhY+jQU6sb/Y1DrHwiRArnJ9R
         IAEnSp9ABQgtgxMKsR4AwppDs0gZYx8km3wOAhghqkMNu+PY5Oue6um8y7AXynfdpKo+
         RVXAEjqUbzmb3AbyPtxnxgd5zdJcm6eKN8OD0VsN/Qx1ltkHNGbrxYnMeHlkO6wj9oJe
         f98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270970; x=1790875770;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+HVoWUpl0qaj6LVCbO//92JCksvBDFuswRRe0vTxAA=;
        b=mwjIwZHIzsTQqRvuU46eo9JAxSboz4uzXRPvQ7ERaozuatziJsay5ug28AcWKabVri
         whmTvCX43IcU0yF5QKcM2aBpX7HmrYBhx+kn/2u5VtuHxHRp2+Cc81h2+P0y38gCRhmD
         avJ5d+Otup3b1qnZ0c4mm2XGFoPFq53GRnn4IaQbDurmRnUW+bN1Eh3ubS8HJT0qYv7M
         vkIVS2xLw3CRZjTaUQGWyuwCpyYIETeV8UamZ7XH76EoDD4G9a7rGVtH/k1YT6jKl1oM
         xQ/GFu73qR2YM3fzFfbKU7Lg+StKWqf7FY4AGNeUWivpdHs9G8MiHqvZGWLgf4RckxMq
         Xf6A==
X-Forwarded-Encrypted: i=1; AKwUvByJhWKl8xe/Z1GZ84T1Kx0HlT5z8vpGy7eLjf3vd89OihViHEmDXrDZly5hnmTS7uQFGr+CGyPZgkOiVzaorh4x@lists.infradead.org
X-Gm-Message-State: AFuF++kgrAI3DIisRykeQy3SEn41BkJQq8Odsf1NYOMx+PpOrHn1HrvU
	rUqPZjfzLkQs0GchjDweQJDxCPmBMiDbCmCtNs5gwbp06xKc0D166oGdz/+N9guNlgHx/5cFB6w
	IwGy/ltpbUvm0SDfmPywiNCGAvQ==
X-Received: from ilbdr2.prod.google.com ([2002:a05:6e02:3f02:b0:509:22e1:470c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:17aa:b0:4bc:2295:1687 with SMTP id 5614622812f47-4d72df6ccaamr3402135b6e.40.1790270969819;
 Thu, 24 Sep 2026 10:29:29 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:06 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-1-coltonlewis@google.com>
Subject: [PATCH v9 00/22] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_102932_142256_3CCC85CF 
X-CRM114-Status: GOOD (  18.53  )
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

There is no longer a kernel command line parameter
(`arm_pmuv3.reserved_host_counters`); PMU partitioning is now completely
controlled via the KVM API using `KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION`
and `KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS` vCPU device attributes. When
partitioning is enabled for a VM, userspace must explicitly configure a
guest event counter count strictly less than the maximum general-purpose
counters implemented by the PMU (leaving at least one general-purpose
counter for the host) prior to calling `KVM_ARM_VCPU_PMU_V3_INIT`. A QEMU
patch demonstrating how to use the uAPI is sent separately.

An overview of what this series accomplishes was presented at KVM
Forum 2025. Slides [1] and video [2] are linked below.

v9:

* Rebase on top of v7.3-rc4.

* Drop the `arm_pmuv3.reserved_host_counters` module parameter so
  partitioning is completely controlled via the KVM vCPU device
  attribute uAPI (`KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION` and
  `KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS`), and document the new
  attribute and counter allocation rules in
  `Documentation/virt/kvm/devices/vcpu.rst` (James Clark).

* Move the dynamic counter allocation mask (`cntr_mask`) from global
  `struct arm_pmu` to per-CPU `struct pmu_hw_events` (`cpuc->cntr_mask`)
  in a dedicated `drivers/perf` patch, fixing multi-pCPU counter
  reservation clobbering on vCPU migration and eliminating the
  `cpu_pm_pmu_setup()` cpuidle `WARN_ON_ONCE` (Zide Chen, James Clark).

* Synchronously propagate trapped guest writes to `PMEVTYPER<n>_EL0`
  and `PMCCFILTR_EL0` to hardware via `kvm_pmu_apply_single_event_filter()`
  when guest-owned, fixing in-guest `perf stat` event count skew across
  runs (James Clark, Sashiko AI Review).

* Refactor `armv8pmu_can_use_pmccntr()` and `armv8pmu_get_event_idx()`
  to check `cntr_mask` inside `armv8pmu_can_use_pmccntr()` and un-nest
  the 64-bit user-access check so cycle events fall back cleanly to
  general-purpose counters when `PMCCNTR_EL0` is reserved by a guest
  (Robin Murphy).

* Restrict the lazy transition to `VCPU_PMU_ACCESS_GUEST_OWNED` to when
  the guest actively enables counting (`PMCR_EL0.E = 1` or setting guest
  counter bits in `PMCNTENSET_EL0` / `PMINTENSET_EL1`), preventing guest
  boot-time PMU probing from prematurely claiming hardware counters and
  triggering spurious host counter preemption warnings (James Clark).

* Fix patch dependency ordering and series bisectability across all
  commits, removing intermediate `max_guest_counters` / `hw_cntr_impl`
  churn and squashing the selftest exception relaxation into the
  Partitioned PMU selftest patch (James Clark).

* Fix compiler warning for `struct arm_pmu` declaration in
  `include/kvm/arm_pmu.h` (kernel test robot) and guard
  `kvm_pmu_host_counter_mask()` when KVM is compiled in but not active
  (wuyifan).

* Track physical CPU PMU residency in `vcpu->arch.pmu.loaded_on_cpu`
  separately from `VCPU_PMU_ACCESS_GUEST_OWNED`, and toggle
  `MDCR_EL2.HPME` via `kvm_pmu_host_start()` / `kvm_pmu_host_stop()`
  instead of `PMCR_EL0.E` when starting/stopping host perf events while
  a partitioned guest is loaded.

* Allow `kvm_vcpu_pmu_resync_el0()` to resynchronize VHE EL0 event
  filters (`PMEVTYPER<n>_EL0.U`) in process context and order
  `kvm_pmu_put()` before `kvm_vcpu_pmu_restore_host()` in
  `kvm_arch_vcpu_put()`.

* Address additional Sashiko AI Review findings:
  - Check `idx - 1` against `cpuc->cntr_mask` in `armv8pmu_get_chain_idx()`
    to prevent 64-bit chained host events from crossing an odd `HPMN`
    partition boundary, and use `cpuc->cntr_mask` in
    `armv8pmu_enable_user_access()`.
  - Latch live hardware `PMOVSSET_EL0` overflow bits for guest counters
    with IRQs disabled (`local_irq_save()`) in `kvm_pmu_part_overflow_status()`
    and during trapped guest accesses to `PMOVS{SET,CLR}_EL0`.
  - Add mandatory `isb()` barriers after control-plane system register
    writes (`mdcr_el2`, `pmcntenclr_el0`, `pmintenclr_el1`), preserve
    guest `PMSELR_EL0` / `PMUSERENR_EL0` when `MDCR_EL2.TPM == 0`, and
    restore host `PMCR_EL0` control flags on `kvm_pmu_put()`.

v8:
https://lore.kernel.org/kvmarm/20260612192909.1153907-1-coltonlewis@google.com/

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

Colton Lewis (21):
  arm64: cpufeature: Add cpucap for HPMN0
  KVM: arm64: Reorganize PMU functions
  perf: arm_pmuv3: Generalize counter bitmasks
  perf: arm_pmuv3: Move counter allocation mask to per-CPU struct
    pmu_hw_events
  perf: arm_pmuv3: Check cntr_mask before using pmccntr
  perf: arm_pmuv3: Allocate counter indices from high to low
  KVM: arm64: Add initial scaffolding for Partitioned PMU
  KVM: arm64: Set up FGT for Partitioned PMU
  KVM: arm64: Add Partitioned PMU register trap handlers
  KVM: arm64: Set up MDCR_EL2 to handle a Partitioned PMU
  KVM: arm64: Context swap Partitioned PMU guest registers
  KVM: arm64: Enforce PMU event filter at vcpu_load()
  perf: Add perf_pmu_resched_update()
  KVM: arm64: Allow kvm_vcpu_pmu_resync_el0() to resync filters in
    process context
  KVM: arm64: Apply dynamic guest counter reservations
  KVM: arm64: Implement lazy PMU context swaps
  perf: arm_pmuv3: Handle IRQs for Partitioned PMU guest counters
  KVM: arm64: Detect overflows for the Partitioned PMU
  KVM: arm64: Add vCPU device attr to partition the PMU
  KVM: selftests: Add find_bit to KVM library
  KVM: arm64: selftests: Add test case for Partitioned PMU

Marc Zyngier (1):
  KVM: arm64: Reorganize PMU includes

 Documentation/virt/kvm/devices/vcpu.rst       |  42 +-
 arch/arm/include/asm/arm_pmuv3.h              |  16 +
 arch/arm64/include/asm/arm_pmuv3.h            |   7 +-
 arch/arm64/include/asm/kvm_host.h             |  18 +-
 arch/arm64/include/asm/kvm_types.h            |   6 +-
 arch/arm64/include/uapi/asm/kvm.h             |   2 +
 arch/arm64/kernel/cpufeature.c                |  10 +-
 arch/arm64/kvm/Makefile                       |   2 +-
 arch/arm64/kvm/arm.c                          |   4 +-
 arch/arm64/kvm/config.c                       |  49 +-
 arch/arm64/kvm/debug.c                        |  41 +-
 arch/arm64/kvm/pmu-direct.c                   | 636 ++++++++++++++
 arch/arm64/kvm/pmu-emul.c                     | 718 +---------------
 arch/arm64/kvm/pmu.c                          | 787 +++++++++++++++++-
 arch/arm64/kvm/sys_regs.c                     | 334 ++++++--
 arch/arm64/tools/cpucaps                      |   1 +
 arch/arm64/tools/sysreg                       |   6 +-
 drivers/perf/arm_pmu.c                        |   7 +-
 drivers/perf/arm_pmuv3.c                      |  97 ++-
 include/kvm/arm_pmu.h                         |  93 ++-
 include/linux/perf/arm_pmu.h                  |   2 +
 include/linux/perf/arm_pmuv3.h                |  14 +-
 include/linux/perf_event.h                    |   3 +
 kernel/events/core.c                          |  31 +-
 tools/include/perf/arm_pmuv3.h                |  12 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/vpmu_counter_access.c | 129 ++-
 tools/testing/selftests/kvm/lib/find_bit.c    |   2 +
 28 files changed, 2200 insertions(+), 870 deletions(-)
 create mode 100644 arch/arm64/kvm/pmu-direct.c
 create mode 100644 tools/testing/selftests/kvm/lib/find_bit.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.56.0.rc1.310.g51773c2048-goog


