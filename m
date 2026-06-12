Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3FCCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgP7OlxDmA2YIY21MfVAeQtCru4lRgU61gAmgy3l2mA=; b=bzsiRnVvANYv2XNAl8jPmdddzh
	6+ypypfAAZEGaaaQtnKkk05Vke1SH6H+ToKezbIp6ztZPyY4AN7PhobZgvXj4XcU99ujuyamctwCn
	EZSyTe25vUo9oVHNvjCsdGKb6eMhySArClAV/bD9m1NQfAGG22GSbGyfBSbZWLMjjhmQs0Au3f98C
	CnL9aiTAKPijvXI4USfNwFsZc0aVZmpKUfiqBQVJUWGsV0JkEgFyWNYatXYvBEYHRCPmNzZcAEeT5
	GoJ+FQvrK4kCqfE73Ebu6xnE7hkuNQQiKrpYX42d4eP9ca/k9vtmaR0/9u8chylMME6SCh5py+6oB
	oxVBpxEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZM-0000000BSc6-2vNE;
	Fri, 12 Jun 2026 19:29:32 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZB-0000000BSQ8-2u0G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:22 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-486a2a910efso2781283b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292560; x=1781897360; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mgP7OlxDmA2YIY21MfVAeQtCru4lRgU61gAmgy3l2mA=;
        b=qHZ65nmPI5SlSXpoT/I+04QyFqpfV2dTfVHFM1XXkfvO49Th28vCUt2FTMan/VQUsi
         kFovebHOqPdKmlWckAKmRx7Pp49tWEwN3JFXX2JtxXIsqi+n9ln/Erf5c/LCNcFHrscf
         Hos098LSLD5OVlJpss77xX4OwvZHlLH+rExVcOAxD/QG1Eee/2+VrJWwQvsqPjZ2KBzf
         CfNSkEpZeZlAeOZAZx10VkD496Hb1Jlrg86o/6A2c1C6B+5i/YF0KVZkNrS7pOkWdFEP
         I4F0q92v/P5fkL0GN0p5VpOpOvqyxNbEkwvdhS8dezPXZjlHWP4RDY4lIRj72fxoHqUu
         zYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292560; x=1781897360;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgP7OlxDmA2YIY21MfVAeQtCru4lRgU61gAmgy3l2mA=;
        b=GGJWncRlqw97IxKfgK2G8FndjPbQ4fQXFjuQOilwXZOWk18vxRVp7J1AGTW53emKZz
         i2TDvIO9g43emCUGyqGTi1nbFRXQlWh583mO6fFVQpA/mD3OR8X5ln+V8qOgl+dvK0sJ
         2CUPi67fqQn4ghSV06BQYdchN7/zyCQfrN0OYajSKBJ4AD3rgefcZ3yIjrQX82+GYEwd
         XLakPKiFQY7UqJdYi9pMT5PhWUTXF/aMfn7iS+RlBHUp+qpWuCtvGCYCqCVQCMAl/FJT
         pgPGGHJi+okgF/QJ23/Pw3ML9Ribyh4UTfsMSLy5EWHVjqX2xspVnQnnYRtJLiPxg2nO
         Sxjw==
X-Forwarded-Encrypted: i=1; AFNElJ+xm+4YsSwjSYUncNoTjgNQp30kby2UOpdHl9I8FkjtVJZ55xnyzYqVrhIDUoOjsqzTK+COnN4Snwzel/KFV12s@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8LBxphB8nRRvftpK1+VjF+UNB+nN6MaKaqul2HLv9T4eOye73
	QTL9yYLljhJAkz6Bs2iFE5PRbiDcYUSBMIIf7sZjWplnhe9hHRoZisF0qa0O/8V3F4KloL874gG
	t74IxBYwYmLS528EsxU9hXqhMrA==
X-Received: from jabb24.prod.google.com ([2002:a05:6638:3158:b0:5e2:68f4:12c7])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1486:b0:479:e9d2:26cf with SMTP id 5614622812f47-4872f378913mr3528034b6e.15.1781292560239;
 Fri, 12 Jun 2026 12:29:20 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:28:59 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-12-coltonlewis@google.com>
Subject: [PATCH 11/21] KVM: arm64: Context swap Partitioned PMU guest registers
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
X-CRM114-CacheID: sfid-20260612_122921_761268_DDFA13C3 
X-CRM114-Status: GOOD (  22.44  )
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

Save and restore newly untrapped registers that can be directly
accessed by the guest when the PMU is partitioned.

* PMEVCNTRn_EL0
* PMCCNTR_EL0
* PMSELR_EL0
* PMCR_EL0
* PMCNTEN_EL0
* PMINTEN_EL1

If we know we are not partitioned (that is, using the emulated vPMU),
then return immediately. A later patch will make this lazy so the
context swaps don't happen unless the guest has accessed the PMU.

PMEVTYPER is handled in a following patch since we must apply the KVM
event filter before writing values to hardware.

PMOVS guest counters are cleared to avoid the possibility of
generating spurious interrupts when PMINTEN is written. This is fine
because the virtual register for PMOVS is always the canonical value.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h |   4 +
 arch/arm64/kvm/arm.c             |   2 +
 arch/arm64/kvm/pmu-direct.c      | 183 +++++++++++++++++++++++++++++++
 include/kvm/arm_pmu.h            |  16 +++
 4 files changed, 205 insertions(+)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index eedf58ea01b10..f6031bd522718 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -235,6 +235,10 @@ static inline bool pmu_is_partitioned(struct arm_pmu *pmu)
 {
 	return false;
 }
+static inline u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
+{
+	return ~0;
+}
 
 /* PMU Version in DFR Register */
 #define ARMV8_PMU_DFR_VER_NI        0
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9453321ef8c67..24f63edc8b384 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -700,6 +700,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		kvm_vcpu_load_vhe(vcpu);
 	kvm_arch_vcpu_load_fp(vcpu);
 	kvm_vcpu_pmu_restore_guest(vcpu);
+	kvm_pmu_load(vcpu);
 	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
 		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
 
@@ -743,6 +744,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	kvm_timer_vcpu_put(vcpu);
 	kvm_vgic_put(vcpu);
 	kvm_vcpu_pmu_restore_host(vcpu);
+	kvm_pmu_put(vcpu);
 	if (vcpu_has_nv(vcpu))
 		kvm_vcpu_put_hw_mmu(vcpu);
 	kvm_arm_vmid_clear_active();
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 43f04c2f33d44..79022447cfb9a 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -86,3 +86,186 @@ u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu)
 		vcpu->kvm->arch.nr_pmu_counters,
 		ARMV8_PMU_PMCR_N);
 }
+
+/**
+ * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
+ * @pmu: Pointer to arm_pmu struct
+ *
+ * Compute the bitmask that selects the host-reserved counters in the
+ * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
+ * in HPMN..N
+ *
+ * Return: Bitmask
+ */
+u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
+{
+	u8 nr_counters = *host_data_ptr(nr_event_counters);
+
+	if (pmu_is_partitioned(pmu))
+		return GENMASK_ULL(nr_counters - 1, pmu->max_guest_counters);
+
+	return ARMV8_PMU_CNT_MASK_ALL;
+}
+
+/**
+ * kvm_pmu_guest_counter_mask() - Compute bitmask of guest-reserved counters
+ * @pmu: Pointer to arm_pmu struct
+ *
+ * Compute the bitmask that selects the guest-reserved counters in the
+ * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
+ * in 0..HPMN and the cycle and instruction counters.
+ *
+ * Return: Bitmask
+ */
+u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
+{
+	if (pmu_is_partitioned(pmu)) {
+		u64 mask = ARMV8_PMU_CNT_MASK_C;
+
+		if (pmu->max_guest_counters > 0)
+			mask |= GENMASK_ULL(pmu->max_guest_counters - 1, 0);
+
+		return mask;
+	}
+
+	return 0;
+}
+
+/**
+ * kvm_pmu_load() - Load untrapped PMU registers
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Load all untrapped PMU registers from the VCPU into the PCPU. Mask
+ * to only bits belonging to guest-reserved counters and leave
+ * host-reserved counters alone in bitmask registers.
+ */
+void kvm_pmu_load(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu;
+	unsigned long guest_counters;
+	u64 mask;
+	u8 i;
+	u64 val;
+
+	/*
+	 * If we aren't guest-owned then we know the guest isn't using
+	 * the PMU anyway, so no need to bother with the swap.
+	 */
+	if (!kvm_pmu_is_partitioned(vcpu->kvm))
+		return;
+
+	preempt_disable();
+
+	pmu = vcpu->kvm->arch.arm_pmu;
+	guest_counters = kvm_pmu_guest_counter_mask(pmu);
+
+	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
+		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
+
+		if (i == ARMV8_PMU_CYCLE_IDX)
+			write_pmccntr(val);
+		else
+			write_pmevcntrn(i, val);
+	}
+
+	val = __vcpu_sys_reg(vcpu, PMSELR_EL0);
+	write_sysreg(val, pmselr_el0);
+
+	/* Save only the stateful writable bits. */
+	val = __vcpu_sys_reg(vcpu, PMCR_EL0);
+	mask = ARMV8_PMU_PMCR_MASK &
+		~(ARMV8_PMU_PMCR_P | ARMV8_PMU_PMCR_C);
+	write_sysreg(val & mask, pmcr_el0);
+
+	/*
+	 * When handling these:
+	 * 1. Apply only the bits for guest counters (indicated by mask)
+	 * 2. Use the different registers for set and clear
+	 */
+	mask = kvm_pmu_guest_counter_mask(pmu);
+
+	/* Clear the hardware overflow flags so there is no chance of
+	 * creating spurious interrupts. The hardware here is never
+	 * the canonical version anyway.
+	 */
+	write_sysreg(mask, pmovsclr_el0);
+
+	val = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
+	write_sysreg(val & mask, pmcntenset_el0);
+	write_sysreg(~val & mask, pmcntenclr_el0);
+
+	val = __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
+	write_sysreg(val & mask, pmintenset_el1);
+	write_sysreg(~val & mask, pmintenclr_el1);
+
+	preempt_enable();
+}
+
+/**
+ * kvm_pmu_put() - Put untrapped PMU registers
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Put all untrapped PMU registers from the VCPU into the PCPU. Mask
+ * to only bits belonging to guest-reserved counters and leave
+ * host-reserved counters alone in bitmask registers.
+ */
+void kvm_pmu_put(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu;
+	unsigned long guest_counters;
+	unsigned long flags;
+	u64 mask;
+	u8 i;
+	u64 val;
+
+	/*
+	 * If we aren't guest-owned then we know the guest is not
+	 * accessing the PMU anyway, so no need to bother with the
+	 * swap.
+	 */
+	if (!kvm_pmu_is_partitioned(vcpu->kvm))
+		return;
+
+	preempt_disable();
+
+	pmu = vcpu->kvm->arch.arm_pmu;
+	guest_counters = kvm_pmu_guest_counter_mask(pmu);
+
+	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
+		if (i == ARMV8_PMU_CYCLE_IDX)
+			val = read_pmccntr();
+		else
+			val = read_pmevcntrn(i);
+
+		__vcpu_assign_sys_reg(vcpu, PMEVCNTR0_EL0 + i, val);
+	}
+
+	val = read_sysreg(pmselr_el0);
+	__vcpu_assign_sys_reg(vcpu, PMSELR_EL0, val);
+
+	val = read_sysreg(pmcr_el0);
+	__vcpu_assign_sys_reg(vcpu, PMCR_EL0, val);
+
+	/* Mask these to only save the guest relevant bits. */
+	mask = kvm_pmu_guest_counter_mask(pmu);
+
+	val = read_sysreg(pmcntenset_el0);
+	__vcpu_assign_sys_reg(vcpu, PMCNTENSET_EL0, val & mask);
+
+	val = read_sysreg(pmintenset_el1);
+	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
+
+	/* Save pending guest hardware overflows. */
+	local_irq_save(flags);
+	val = read_sysreg(pmovsset_el0);
+	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, val & mask);
+	write_sysreg(val & mask, pmovsclr_el0);
+	local_irq_restore(flags);
+
+	/* Stop guest counters and disable interrupts in hardware. */
+	write_sysreg(mask, pmcntenclr_el0);
+	write_sysreg(mask, pmintenclr_el1);
+
+	kvm_pmu_set_guest_counters(pmu, 0);
+	preempt_enable();
+}
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 700d5f275b557..61f8d4ed35e10 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -99,6 +99,10 @@ bool pmu_is_partitioned(struct arm_pmu *pmu);
 bool kvm_pmu_is_partitioned(struct kvm *kvm);
 void kvm_pmu_direct_pmcr_write(struct kvm_vcpu *vcpu, u64 val);
 u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu);
+u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu);
+u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
+void kvm_pmu_load(struct kvm_vcpu *vcpu);
+void kvm_pmu_put(struct kvm_vcpu *vcpu);
 
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
@@ -148,6 +152,8 @@ static inline u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu)
 {
 	return 0;
 }
+static inline void kvm_pmu_load(struct kvm_vcpu *vcpu) {}
+static inline void kvm_pmu_put(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
@@ -250,6 +256,16 @@ static inline bool pmu_is_partitioned(void *pmu)
 	return false;
 }
 
+static inline u64 kvm_pmu_host_counter_mask(void *kvm)
+{
+	return ~0;
+}
+
+static inline u64 kvm_pmu_guest_counter_mask(void *kvm)
+{
+	return 0;
+}
+
 #endif
 
 #endif
-- 
2.54.0.1136.gdb2ca164c4-goog


