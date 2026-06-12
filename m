Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E1ACD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFEHA4Hh+HbXwkTEMjUJrcBC6i0Zz455koc6wHXTBjw=; b=XdOS17GQ93jKS307wMze2igUEz
	oEoFMaR4Ldjf/pCZ7c0Fnvqt1jpWw+IDhDGYzIdzspn0rfRxexG+JZRXqZXMSh9k6BBmROJdwUTO0
	mvfwwpkWoOXY2YCDMjCn5LnACWah6RVFqef/TDRLN/uGKZMKDJwiPjU1gZBhLaxPWtXOo+FPi7TDa
	9v/uxyqsezPkrM0Eg3LR3g8sp+SAuJXmuzcnKrlinn8XyGhd63wGhNag1wdNGhybJzrBNgT1rxM12
	ztKmJeTrQXDE9kQN3fq+H8P3SIU5EJjQjk7j1az7WWfiLf4ir3O2BDllxTZ8DHSHJfSkjJVlU49EE
	FlAmXXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZM-0000000BSbH-0i9j;
	Fri, 12 Jun 2026 19:29:32 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Z9-0000000BSLy-1oBi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:20 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-4863a55600aso1245658b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292558; x=1781897358; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFEHA4Hh+HbXwkTEMjUJrcBC6i0Zz455koc6wHXTBjw=;
        b=vFi5xrFrbvjod5sHJO1wM0ruIQCyoz46KQFA9dnlfIAl7WROjKrDmPGOb2cy1KOKN1
         SmqPr7/PVSPyM/+m9k+CjSgDeA9U59Xi8MgBdKFl9YKn32OPGqkRg5mMbwoDLDiyo4fw
         f0jeNtJwfWJk3/kp+tJ43JVWLSVdYF0lcU65I79JW2VbWI8gl7bIPIX1KBxyYowi1o/E
         HpMR9JjZYjlBRCY+VLuQGZDmOUgBINQhlIelNpq9rAlyq1nL4GcN8VqY00v94lHHL6wt
         k+k1pg7FCrFvlDA7xCJmSFSovhscSVL/kkakoUcZXBIlsw1Ff4XnR0fU7PR7WhCQ/jaI
         mcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292558; x=1781897358;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFEHA4Hh+HbXwkTEMjUJrcBC6i0Zz455koc6wHXTBjw=;
        b=SKFyQAdCpCxfetXvwaO+ngj2IbrKEjJIgnHBp5PuF7ckrrqvfg0m2/3fcDa+CZwqXA
         SMD5cf0sceRWzleW13UTfIQWGT6fNYYVCCC2j6xIurd6blKz597YP6tvmQxHKd7g8zew
         OqQmRd8v+eJS1c8e3IFSWjets//K6xcEAvfaAjb6vUB0WEPURaZN72wPB8/xUSVWAY16
         6MAsFqfZf5nptoVe+q2QdGbMFLy7rZI60XLwYy9IOwxKZwEZxar3wqwrzI1+EjMAyRfX
         SH4t+stO5JGuC87+/OcZCck3UbsmK3+5NVSCslT+pPLSyCQjqysL0DEkBlpdeJC0lu9h
         oD4w==
X-Forwarded-Encrypted: i=1; AFNElJ9lTrcENuisNf/3qnnXbcSUTxG8JIFS1hCOXz2BNdgSM9T7RZyMnMiKznYcKWb5VWHljCyWhoRfHGxwi5Ei36zE@lists.infradead.org
X-Gm-Message-State: AOJu0YwhLqzcp1EZ0aJyQvfUuStpMl9ea9efNeV8lPEkQEEPbHajHLN5
	zVUOuzFBPbMXlnQt8rlv9yDC9RuNsMqeTkoTPmuCCijps/LIoOAdZeqBMqZ8O3oXkBQANDFWC7q
	N0xKtGSSkqNlm8iftpGRbPgDtYg==
X-Received: from iliy12.prod.google.com ([2002:a05:6e02:118c:b0:501:c810:dcf4])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:8613:b0:480:4024:3bb with SMTP id 5614622812f47-48741ab6e19mr461706b6e.24.1781292557698;
 Fri, 12 Jun 2026 12:29:17 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:28:56 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-9-coltonlewis@google.com>
Subject: [PATCH 08/21] KVM: arm64: Set up FGT for Partitioned PMU
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
X-CRM114-CacheID: sfid-20260612_122919_540299_EC20A8BB 
X-CRM114-Status: GOOD (  21.73  )
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

In order to gain the best performance benefit from partitioning the
PMU, utilize fine grain traps (FEAT_FGT and FEAT_FGT2) to avoid
trapping common PMU register accesses by the guest to remove that
overhead.

Untrapped:
* PMCR_EL0
* PMUSERENR_EL0
* PMSELR_EL0
* PMCCNTR_EL0
* PMCNTEN_EL0
* PMINTEN_EL1
* PMEVCNTRn_EL0

These are safe to untrap because writing MDCR_EL2.HPMN as this series
will do limits the effect of writes to any of these registers to the
partition of counters 0..HPMN-1. Reads from these registers will not
leak information from between guests as all these registers are
context swapped by a later patch in this series. Reads from these
registers also do not leak any information about the host's hardware
beyond what is promised by PMUv3.

Trapped:
* PMOVS_EL0
* PMEVTYPERn_EL0
* PMCCFILTR_EL0
* PMICNTR_EL0
* PMICFILTR_EL0
* PMCEIDn_EL0
* PMMIR_EL1

PMOVS remains trapped so KVM can track overflow IRQs that will need to
be injected into the guest.

PMICNTR and PMIFILTR remain trapped because KVM is not handling them
yet.

PMEVTYPERn remains trapped so KVM can limit which events guests can
count, such as disallowing counting at EL2. PMCCFILTR and PMCIFILTR
are special cases of the same.

PMCEIDn and PMMIR remain trapped because they can leak information
specific to the host hardware implementation.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h  |  4 +++
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/config.c           | 41 ++++++++++++++++++++++++++++---
 arch/arm64/kvm/pmu-direct.c       | 36 +++++++++++++++++++++++++++
 include/kvm/arm_pmu.h             | 12 +++++++++
 5 files changed, 92 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index fddcd6e6f76b2..eedf58ea01b10 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -231,6 +231,10 @@ static inline bool kvm_set_pmuserenr(u64 val)
 }
 
 static inline void kvm_vcpu_pmu_resync_el0(void) {}
+static inline bool pmu_is_partitioned(struct arm_pmu *pmu)
+{
+	return false;
+}
 
 /* PMU Version in DFR Register */
 #define ARMV8_PMU_DFR_VER_NI        0
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 0d7a620c69ee2..9c7e9b92dfbd3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -367,6 +367,8 @@ struct kvm_arch {
 #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
 	/* Unhandled SEAs are taken to userspace */
 #define KVM_ARCH_FLAG_EXIT_SEA				11
+	/* Partitioned PMU Enabled */
+#define KVM_ARCH_FLAG_PARTITION_PMU_ENABLED		12
 	unsigned long flags;
 
 	/* VM-wide vCPU feature set */
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 0622162b089e5..f052ec8a00309 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1685,12 +1685,47 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
 		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
 }
 
+static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
+{
+	__compute_fgt(vcpu, HDFGRTR_EL2);
+
+	*vcpu_fgt(vcpu, HDFGRTR_EL2) |=
+		HDFGRTR_EL2_PMOVS |
+		HDFGRTR_EL2_PMCCFILTR_EL0 |
+		HDFGRTR_EL2_PMEVTYPERn_EL0 |
+		HDFGRTR_EL2_PMCEIDn_EL0 |
+		HDFGRTR_EL2_PMMIR_EL1;
+}
+
 static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
 {
 	__compute_fgt(vcpu, HDFGWTR_EL2);
 
 	if (is_hyp_ctxt(vcpu))
 		*vcpu_fgt(vcpu, HDFGWTR_EL2) |= HDFGWTR_EL2_MDSCR_EL1;
+
+	*vcpu_fgt(vcpu, HDFGWTR_EL2) |=
+		HDFGWTR_EL2_PMOVS |
+		HDFGWTR_EL2_PMCCFILTR_EL0 |
+		HDFGWTR_EL2_PMEVTYPERn_EL0;
+}
+
+static void __compute_hdfgrtr2(struct kvm_vcpu *vcpu)
+{
+	__compute_fgt(vcpu, HDFGRTR2_EL2);
+
+	*vcpu_fgt(vcpu, HDFGRTR2_EL2) &=
+		~(HDFGRTR2_EL2_nPMICFILTR_EL0 |
+		  HDFGRTR2_EL2_nPMICNTR_EL0);
+}
+
+static void __compute_hdfgwtr2(struct kvm_vcpu *vcpu)
+{
+	__compute_fgt(vcpu, HDFGWTR2_EL2);
+
+	*vcpu_fgt(vcpu, HDFGWTR2_EL2) &=
+		~(HDFGWTR2_EL2_nPMICFILTR_EL0 |
+		  HDFGWTR2_EL2_nPMICNTR_EL0);
 }
 
 static void __compute_ich_hfgrtr(struct kvm_vcpu *vcpu)
@@ -1727,7 +1762,7 @@ void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
 	__compute_fgt(vcpu, HFGRTR_EL2);
 	__compute_hfgwtr(vcpu);
 	__compute_fgt(vcpu, HFGITR_EL2);
-	__compute_fgt(vcpu, HDFGRTR_EL2);
+	__compute_hdfgrtr(vcpu);
 	__compute_hdfgwtr(vcpu);
 	__compute_fgt(vcpu, HAFGRTR_EL2);
 
@@ -1735,8 +1770,8 @@ void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
 		__compute_fgt(vcpu, HFGRTR2_EL2);
 		__compute_fgt(vcpu, HFGWTR2_EL2);
 		__compute_fgt(vcpu, HFGITR2_EL2);
-		__compute_fgt(vcpu, HDFGRTR2_EL2);
-		__compute_fgt(vcpu, HDFGWTR2_EL2);
+		__compute_hdfgrtr2(vcpu);
+		__compute_hdfgwtr2(vcpu);
 	}
 
 	if (cpus_have_final_cap(ARM64_HAS_GICV5_CPUIF)) {
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 74e40e4915416..0135989667564 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -5,6 +5,8 @@
  */
 
 #include <linux/kvm_host.h>
+#include <linux/perf/arm_pmu.h>
+#include <linux/perf/arm_pmuv3.h>
 
 #include <asm/arm_pmuv3.h>
 
@@ -20,3 +22,37 @@ bool has_host_pmu_partition_support(void)
 	return has_vhe() &&
 		system_supports_pmuv3();
 }
+
+/**
+ * pmu_is_partitioned() - Determine if given PMU is partitioned
+ * @pmu: Pointer to arm_pmu struct
+ *
+ * Determine if given PMU is partitioned by looking at hpmn field. The
+ * PMU is partitioned if this field is less than the number of
+ * counters in the system.
+ *
+ * Return: True if the PMU is partitioned, false otherwise
+ */
+bool pmu_is_partitioned(struct arm_pmu *pmu)
+{
+	if (!pmu)
+		return false;
+
+	return pmu->max_guest_counters >= 0 &&
+		pmu->max_guest_counters <= *host_data_ptr(nr_event_counters);
+}
+
+/**
+ * kvm_pmu_is_partitioned() - Determine if KVM has a partitioned PMU
+ * @kvm: Pointer to kvm struct
+ *
+ * Determine if KVM has a partitioned PMU by extracting that field and
+ * passing it to :c:func:`pmu_is_partitioned`
+ *
+ * Return: True if the KVM PMU is partitioned, false otherwise
+ */
+bool kvm_pmu_is_partitioned(struct kvm *kvm)
+{
+	return pmu_is_partitioned(kvm->arch.arm_pmu) &&
+		test_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
+}
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index f9a0823666949..36960b9e52da2 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -95,6 +95,9 @@ void kvm_vcpu_pmu_resync_el0(void);
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
 
+bool pmu_is_partitioned(struct arm_pmu *pmu);
+bool kvm_pmu_is_partitioned(struct kvm *kvm);
+
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
  * Must be called before every vcpu run after disabling interrupts, to ensure
@@ -134,6 +137,10 @@ static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
 {
 	return 0;
 }
+static inline bool kvm_pmu_is_partitioned(struct kvm *kvm)
+{
+	return false;
+}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
@@ -231,6 +238,11 @@ static inline bool kvm_pmu_counter_is_hyp(struct kvm_vcpu *vcpu, unsigned int id
 
 static inline void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu) {}
 
+static inline bool pmu_is_partitioned(void *pmu)
+{
+	return false;
+}
+
 #endif
 
 #endif
-- 
2.54.0.1136.gdb2ca164c4-goog


