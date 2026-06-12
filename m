Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25DECD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 20:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTKnTxX+8DMTE9NLdCA6P/+xqnJZerMbDO6oNRBMDK4=; b=ZNyicEd7sND4PgMbKz9G2gtee1
	WEQ7R8TFRNUTgOmoPr8AE9XZOsCzR/pIhiRlWLi1YltXTGoiERXTubuyPOZXEfq2Eg2cc+5n61hRz
	99rXKMHOi9Wyy+jPXKInQJ++iAaWv8y+z8zziUY/QLXPm7eRb5Ied4jLCchJwN9hytcgTGgKDzq8P
	WrNAldW4Xo7BLjhFITT3XiFoKEqHxpShW6l/wVUXdgTfew93L0MVf6UdpHB2N7KDsnO5kzs7yP8+t
	GCBpnJ8p6Xv8Weev5wZxZQdZ1pX9y+5txbCzPgZ2ayl8FUQl+4a7aj/3BDytBOm3KI3fd6IlvMbLz
	AG7v4K6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZL-0000000BSax-41DN;
	Fri, 12 Jun 2026 19:29:31 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Z8-0000000BSLQ-24bV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:19 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-487059fb570so2253116b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292557; x=1781897357; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FTKnTxX+8DMTE9NLdCA6P/+xqnJZerMbDO6oNRBMDK4=;
        b=Z03t1/L5bmt7Yljrm2rwlEZhWZDjP6qpkkyxenPlnN+TfxwY7zcoIbc1GxZBn5nsfV
         V+uMLfSCjJgczWKQJtHin2tsVqemxIaISzgR0QiYaEAgjqPzWfNDD0amCgi4QhZ5A5M1
         OxHWt82Ef3pR1TpaErGG4xNzvHr4jIRigb8aL/gZcLVQcOdrNFoJYQPCnkRvg6JM0Ua5
         jeuED20wVvUdX93Hezv65oJFkefVeaPYGQBtNnGBV1l1+CZV40EDxIFlxnYMzVUsXaTr
         nRYPN9xi0sYTRIhzEyFmUk6rAPGV7fHq6Pm2kaNExRJuRTMaZ7vR4lfVqsul1357dO0/
         QxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292557; x=1781897357;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTKnTxX+8DMTE9NLdCA6P/+xqnJZerMbDO6oNRBMDK4=;
        b=IktuYACORxZz5zKCN4Nit8yS+R2z+rg5/EkxZrDG06jl0JRSQokInO2C+CbIBSsXOS
         c2pFJ1AzJkGKvqLXk2m2c4lRB1epqKVWCvhr9xQOEfekDAr13kVrjCXKhFv8iheq8spT
         M/KT7fyAuMfVMI51eRxBONCp0EY/b6Hj12pkKl1cmXP1ht6yUjjcj++h6uxfPbwM3ymE
         qsYZ6bWAWIZJ5K0H6d2V9Cj3InAYGgHUHmGJBGmlnUSkbsrKfi6UZyR5Ye0XOmH7iv5V
         o3IOPMa1TYf908Ho04/tUIuttnCFy2XRBmgcnDtl8ouNwsxspfKOpoZhTXnJup+XUMo+
         2trQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Pem8EQ5gF7224Pb+MtOVDcgNMNTzBfxsAt2WQw9DTw/uTCq3MR/0sLSlU/lmAoqGWgQonolCrWHagTb+gFuW0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1LHCuytKQn6yiUk/xttHRnYadjuQ0QZkTwQZAi3f+Nk+dditY
	MJSIVVCNeE6PMjqoyG3qn9rBcD9XO+iy0K+6wQVhCHsaTC/o6tAMMJkTukTn7byrNC06+aiPOHS
	SQsZe8TT4Y7TRDfpGA4QzyCFhNg==
X-Received: from jahp3-n1.prod.google.com ([2002:a05:6638:6c83:10b0:5e2:7637:d35])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1514:b0:486:37ab:e829 with SMTP id 5614622812f47-4872f65317bmr2796469b6e.41.1781292556839;
 Fri, 12 Jun 2026 12:29:16 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:28:55 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-8-coltonlewis@google.com>
Subject: [PATCH 07/21] perf: arm_pmuv3: Add method to partition the PMU
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
X-CRM114-CacheID: sfid-20260612_122918_582696_2784F50E 
X-CRM114-Status: GOOD (  31.73  )
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

For PMUv3, the register field MDCR_EL2.HPMN partitions the PMU
counters into two ranges where counters 0..HPMN-1 are accessible by
EL1 and, if allowed, EL0 while counters HPMN..N are only accessible by
EL2.

Create a module parameter reserved_host_counters to reserve a number
of counters for the host. Counters not reserved for the host may be
used by a guest VM when the PMU is partitioned.

Add the function armv8pmu_partition() to check the validity of the
reservation and record a partition has happened and the maximum
allowable value for HPMN.

Due to the difficulty this feature would create for the driver running
in nVHE mode, partitioning is only allowed in VHE mode. In order to
support a partitioning on nVHE we'd need to explicitly disable guest
counters on every exit and reset HPMN to place all counters in the
first range.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h   |  4 ++
 arch/arm64/include/asm/arm_pmuv3.h |  5 ++
 arch/arm64/kvm/Makefile            |  2 +-
 arch/arm64/kvm/pmu-direct.c        | 22 +++++++++
 drivers/perf/arm_pmuv3.c           | 77 ++++++++++++++++++++++++++++--
 include/kvm/arm_pmu.h              | 10 +++-
 include/linux/perf/arm_pmu.h       |  7 +++
 7 files changed, 121 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/kvm/pmu-direct.c

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index ecfede0c03486..fddcd6e6f76b2 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -221,6 +221,10 @@ static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
 	return false;
 }
 
+static inline bool has_host_pmu_partition_support(void)
+{
+	return false;
+}
 static inline bool kvm_set_pmuserenr(u64 val)
 {
 	return false;
diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index cf2b2212e00a2..27c4d6d47da31 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -171,6 +171,11 @@ static inline bool pmuv3_implemented(int pmuver)
 		 pmuver == ID_AA64DFR0_EL1_PMUVer_NI);
 }
 
+static inline bool is_pmuv3p1(int pmuver)
+{
+	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P1;
+}
+
 static inline bool is_pmuv3p4(int pmuver)
 {
 	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P4;
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 59612d2f277c1..0e7b8e65c4c93 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -26,7 +26,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
 	 vgic/vgic-v5.o
 
-kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
+kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu-direct.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
 kvm-$(CONFIG_PTDUMP_STAGE2_DEBUGFS) += ptdump.o
 
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
new file mode 100644
index 0000000000000..74e40e4915416
--- /dev/null
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Colton Lewis <coltonlewis@google.com>
+ */
+
+#include <linux/kvm_host.h>
+
+#include <asm/arm_pmuv3.h>
+
+/**
+ * has_host_pmu_partition_support() - Determine if partitioning is possible
+ *
+ * Partitioning is only supported in VHE mode with PMUv3
+ *
+ * Return: True if partitioning is possible, false otherwise
+ */
+bool has_host_pmu_partition_support(void)
+{
+	return has_vhe() &&
+		system_supports_pmuv3();
+}
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index d7a49dc0b0be6..c187397134990 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -42,6 +42,13 @@
 #define ARMV8_THUNDER_PERFCTR_L1I_CACHE_PREF_ACCESS		0xEC
 #define ARMV8_THUNDER_PERFCTR_L1I_CACHE_PREF_MISS		0xED
 
+static int reserved_host_counters __read_mostly = -1;
+bool armv8pmu_is_partitioned;
+
+module_param(reserved_host_counters, int, 0);
+MODULE_PARM_DESC(reserved_host_counters,
+		 "PMU Partition: -1 = No partition; +N = Reserve N counters for the host");
+
 /*
  * ARMv8 Architectural defined events, not all of these may
  * be supported on any given implementation. Unsupported events will
@@ -532,6 +539,11 @@ static void armv8pmu_pmcr_write(u64 val)
 	write_pmcr(val);
 }
 
+static u64 armv8pmu_pmcr_n_read(void)
+{
+	return FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read());
+}
+
 static int armv8pmu_has_overflowed(u64 pmovsr)
 {
 	return !!(pmovsr & ARMV8_PMU_CNT_MASK_ALL);
@@ -1317,6 +1329,54 @@ struct armv8pmu_probe_info {
 	bool present;
 };
 
+/**
+ * armv8pmu_reservation_is_valid() - Determine if reservation is allowed
+ * @host_counters: Number of host counters to reserve
+ *
+ * Determine if the number of host counters in the argument is an
+ * allowed reservation, 0 to NR_COUNTERS inclusive.
+ *
+ * Return: True if reservation allowed, false otherwise
+ */
+static bool armv8pmu_reservation_is_valid(int host_counters)
+{
+	return host_counters >= 0 &&
+		host_counters <= armv8pmu_pmcr_n_read();
+}
+
+/**
+ * armv8pmu_partition() - Partition the PMU
+ * @pmu: Pointer to pmu being partitioned
+ * @host_counters: Number of host counters to reserve
+ *
+ * Partition the given PMU by taking a number of host counters to
+ * reserve and, if it is a valid reservation, recording the
+ * corresponding HPMN value in the max_guest_counters field of the PMU and
+ * clearing the guest-reserved counters from the counter mask.
+ *
+ * Return: 0 on success, -ERROR otherwise
+ */
+static int armv8pmu_partition(struct arm_pmu *pmu, int host_counters)
+{
+	u8 nr_counters;
+	u8 hpmn;
+
+	if (!armv8pmu_reservation_is_valid(host_counters)) {
+		pr_err("PMU partition reservation of %d host counters is not valid", host_counters);
+		return -EINVAL;
+	}
+
+	nr_counters = armv8pmu_pmcr_n_read();
+	hpmn = nr_counters - host_counters;
+
+	pmu->max_guest_counters = hpmn;
+	armv8pmu_is_partitioned = true;
+
+	pr_info("Partitioned PMU with %d host counters -> %u guest counters", host_counters, hpmn);
+
+	return 0;
+}
+
 static void __armv8pmu_probe_pmu(void *info)
 {
 	struct armv8pmu_probe_info *probe = info;
@@ -1331,17 +1391,26 @@ static void __armv8pmu_probe_pmu(void *info)
 
 	cpu_pmu->pmuver = pmuver;
 	probe->present = true;
+	cpu_pmu->max_guest_counters = -1;
 
 	/* Read the nb of CNTx counters supported from PMNC */
-	bitmap_set(cpu_pmu->cntr_mask,
-		   0, FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read()));
+	bitmap_set(cpu_pmu->hw_cntr_impl, 0, armv8pmu_pmcr_n_read());
 
 	/* Add the CPU cycles counter */
-	set_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask);
+	set_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->hw_cntr_impl);
 
 	/* Add the CPU instructions counter */
 	if (pmuv3_has_icntr())
-		set_bit(ARMV8_PMU_INSTR_IDX, cpu_pmu->cntr_mask);
+		set_bit(ARMV8_PMU_INSTR_IDX, cpu_pmu->hw_cntr_impl);
+
+	bitmap_copy(cpu_pmu->cntr_mask, cpu_pmu->hw_cntr_impl, ARMPMU_MAX_HWEVENTS);
+
+	if (reserved_host_counters >= 0) {
+		if (has_host_pmu_partition_support())
+			armv8pmu_partition(cpu_pmu, reserved_host_counters);
+		else
+			pr_err("PMU partition is not supported");
+	}
 
 	pmceid[0] = pmceid_raw[0] = read_pmceid0();
 	pmceid[1] = pmceid_raw[1] = read_pmceid1();
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 520f6d926ac8c..f9a0823666949 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -50,8 +50,11 @@ struct arm_pmu_entry {
 	struct arm_pmu *arm_pmu;
 };
 
+extern bool armv8pmu_is_partitioned;
+
 bool kvm_supports_guest_pmuv3(void);
-#define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num != 0)
+bool has_host_pmu_partition_support(void);
+#define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num >= VGIC_NR_SGIS)
 u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx);
 void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
 void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
@@ -120,6 +123,11 @@ static inline bool kvm_supports_guest_pmuv3(void)
 	return false;
 }
 
+static inline bool has_host_pmu_partition_support(void)
+{
+	return false;
+}
+
 #define kvm_arm_pmu_irq_initialized(v)	(false)
 static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
 					    u64 select_idx)
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 52b37f7bdbf9e..2e1e7a48e05ff 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -109,6 +109,12 @@ struct arm_pmu {
 	 */
 	int		(*map_pmuv3_event)(unsigned int eventsel);
 	DECLARE_BITMAP(cntr_mask, ARMPMU_MAX_HWEVENTS);
+	/*
+	 * Keep a copy at initialization of which counters the
+	 * hardware implements to restore cntr_mask after
+	 * modifications.
+	 */
+	DECLARE_BITMAP(hw_cntr_impl, ARMPMU_MAX_HWEVENTS);
 	bool		secure_access; /* 32-bit ARM only */
 	struct platform_device	*plat_device;
 	struct pmu_hw_events	__percpu *hw_events;
@@ -129,6 +135,7 @@ struct arm_pmu {
 
 	/* Only to be used by ACPI probing code */
 	unsigned long acpi_cpuid;
+	int		max_guest_counters;
 };
 
 #define to_arm_pmu(p) (container_of(p, struct arm_pmu, pmu))
-- 
2.54.0.1136.gdb2ca164c4-goog


