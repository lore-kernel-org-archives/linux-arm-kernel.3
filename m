Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B889C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sx4i7rLrLjUKxNonKTZBsgb0Jj/BfKfmEgD+eiXTprc=; b=4oqKKJuj35V7hIe4+92SHTngS3
	WA+I/Y39DkFO9y5xop2Cd/CZp4UYZLbr/P4qwh+80aO29W2hwFS9WNHf3YrBZNo4N6/RSOf+CC20x
	SPX1DHDoa7L1BdDwLtrkmZkFukA/z5Dayj914v06OFH/Ys6JVWr9oBZgQzBoH4pJfwpVPAQ0Y8bON
	Atuk1WIZwa8qWrFkXGveKA37hupS/28jYAjhWMtQ5U/HkA+lYV81gOywbike5rwS/L1UMfeN9Se4D
	MHPIfAqVxQRp06u3LcElrqdbF2awclYJ5GFOBudXx5P+fvlW9Ng2hnifhQW6R5EVFDF4sKdWHceTO
	gB+oqBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nHm-0000000Bkmn-2wcB;
	Thu, 24 Sep 2026 17:31:06 +0000
Received: from mail-ot1-x347.google.com ([2607:f8b0:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGZ-0000000Bjyl-0KZ3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:57 +0000
Received: by mail-ot1-x347.google.com with SMTP id 46e09a7af769-8076c66efc6so16437a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270988; x=1790875788; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sx4i7rLrLjUKxNonKTZBsgb0Jj/BfKfmEgD+eiXTprc=;
        b=AeXFTxdLQ66xPmyY15aeSgoWg1Eso+8WHUI6RY9zryz/Vio+iq9RMCrXnl6+HuTJAh
         +0tQ8hnV8ZY9vlVEFA/u9z9HkESIyj2ZpKs30w2FbgYupwktMy2BxX4PWcH/vClreTvN
         JY6DGqm0vJIq0ZxYLSTNmeV2pYQXf0VTrY49W+ND8+UmRwBBTCiyuF5iRkkHg0MbQnsp
         F19x/UI1X95MdcipDzM+M7s8MDscF3pjsB+lZ2WhYDYgsoVQNKx7nAr8bdE4jP6CLVN3
         A+CHRjs5aPHQnKbQeK1FyYWQ/m7kjd5zbij6JQJD9QvfwhL+B32kxSPO6PI/21hGEBEA
         AkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270988; x=1790875788;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sx4i7rLrLjUKxNonKTZBsgb0Jj/BfKfmEgD+eiXTprc=;
        b=ZG1rhOuHRbm8fqCIBNPPD38TERi+hIy3DZ0YFEmxGg+WdcLeUT0Oex3S3ANAEraiZH
         WEfZuPQjOiUT10h7E8jutvta3SpSq4bTuhZooAavUMeJEXlrfdJZb0KFP8+K8CR10/KE
         QlUG9sLmNJ9L+6mozPzs8YKE7nFgS3aDNPhjxg95XNb+DLk92PcHNTRJiEb1Oa9e70rZ
         jI9zh8uSN731GVkFJ4Iu27BXW2IdL7EAyye2XSnyXta//W5oGraQd4OCgws5oXcgWYf6
         15rCNiDKMofsiPfrDDAOEg1jAdBTOBif6C6suNKcrfXWTMbjNduAQFApWQn9nUEoAKDX
         pgkA==
X-Forwarded-Encrypted: i=1; AKwUvBxyQDcj9RysD3nvccCDCcQPvmwZ/PwUwc58vf7w8YXS3TEWg4p2OW8nJrFdnzgX2r/OWPgtDcPr+1AtPVgzC9A5@lists.infradead.org
X-Gm-Message-State: AFuF++lOpSG07RZf+tpPA68nweuJnHU7a+h60aQGcCTOjhgjV+MWZzd9
	uYBRPcEngkIwqCwlNo5LiHtrgFjMM70ccdh7zHwH+UksMPAQPdjR2bf64FmUisyXkfzAxWDZQks
	rUnIaSEnyKnP6Yl6ajvgO+RjNFQ==
X-Received: from ilpx16.prod.google.com ([2002:a92:d650:0:b0:509:637c:4c67])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4fe0:b0:4d6:9133:23fc with SMTP id 5614622812f47-4d72b44c8aemr3907567b6e.50.1790270988101;
 Thu, 24 Sep 2026 10:29:48 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:18 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-13-coltonlewis@google.com>
Subject: [PATCH v9 12/22] KVM: arm64: Context swap Partitioned PMU guest registers
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
X-CRM114-CacheID: sfid-20260924_102951_435662_EE6C012D 
X-CRM114-Status: GOOD (  24.75  )
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

- PMEVCNTRn_EL0
- PMCCNTR_EL0
- PMSELR_EL0
- PMCR_EL0
- PMCNTEN_EL0
- PMINTEN_EL1

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
 arch/arm64/kvm/arm.c        |   4 +-
 arch/arm64/kvm/pmu-direct.c | 153 +++++++++++++++++++++++++++++++++++-
 arch/arm64/kvm/sys_regs.c   |   6 +-
 include/kvm/arm_pmu.h       |   5 ++
 4 files changed, 164 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8b080804bc90b..75e0f746623ec 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -714,6 +714,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (has_vhe())
 		kvm_vcpu_load_vhe(vcpu);
 	kvm_arch_vcpu_load_fp(vcpu);
+	kvm_pmu_load(vcpu);
 	kvm_vcpu_pmu_restore_guest(vcpu);
 	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
 		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
@@ -755,13 +756,14 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
 	}
 
+	kvm_pmu_put(vcpu);
+	kvm_vcpu_pmu_restore_host(vcpu);
 	kvm_vcpu_put_debug(vcpu);
 	kvm_arch_vcpu_put_fp(vcpu);
 	if (has_vhe())
 		kvm_vcpu_put_vhe(vcpu);
 	kvm_timer_vcpu_put(vcpu);
 	kvm_vgic_put(vcpu);
-	kvm_vcpu_pmu_restore_host(vcpu);
 	if (vcpu_has_nv(vcpu))
 		kvm_vcpu_put_hw_mmu(vcpu);
 	kvm_arm_vmid_clear_active();
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 5045051e91cd3..92eec0fa33867 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -155,7 +155,6 @@ static u64 kvm_vcpu_pmu_guest_counter_mask(struct kvm_vcpu *vcpu)
 
 	return 0;
 }
-
 /**
  * kvm_pmu_guest_counter_mask() - Compute bitmask of guest-reserved counters
  *
@@ -169,3 +168,155 @@ u64 kvm_pmu_guest_counter_mask(void)
 {
 	return kvm_vcpu_pmu_guest_counter_mask(kvm_get_running_vcpu());
 }
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
+	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
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
+	if (!(vcpu->arch.mdcr_el2 & MDCR_EL2_TPM)) {
+		val = __vcpu_sys_reg(vcpu, PMUSERENR_EL0);
+		write_sysreg(val, pmuserenr_el0);
+	}
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
+	mask = guest_counters;
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
+	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+	mask = guest_counters;
+
+	/* Mask these to only save the guest relevant bits. */
+	val = read_sysreg(pmcntenset_el0);
+	__vcpu_assign_sys_reg(vcpu, PMCNTENSET_EL0, val & mask);
+
+	val = read_sysreg(pmintenset_el1);
+	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
+
+	/* Stop guest counters and disable interrupts in hardware first. */
+	write_sysreg(mask, pmcntenclr_el0);
+	write_sysreg(mask, pmintenclr_el1);
+	isb();
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
+	if (!(vcpu->arch.mdcr_el2 & MDCR_EL2_TPM)) {
+		val = read_sysreg(pmuserenr_el0);
+		__vcpu_assign_sys_reg(vcpu, PMUSERENR_EL0, val);
+	}
+
+	val = read_sysreg(pmcr_el0);
+	__vcpu_rmw_sys_reg(vcpu, PMCR_EL0, &=, ~ARMV8_PMU_PMCR_MASK);
+	__vcpu_rmw_sys_reg(vcpu, PMCR_EL0, |=, val & ARMV8_PMU_PMCR_MASK);
+
+	val = ARMV8_PMU_PMCR_LC;
+	if (pmu && pmu->pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P5)
+		val |= ARMV8_PMU_PMCR_LP;
+	if (vcpu->arch.mdcr_el2 & MDCR_EL2_HPME)
+		val |= ARMV8_PMU_PMCR_E;
+	write_sysreg(val, pmcr_el0);
+
+	/* Save pending guest hardware overflows. */
+	local_irq_save(flags);
+	val = read_sysreg(pmovsset_el0);
+	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, val & mask);
+	write_sysreg(val & mask, pmovsclr_el0);
+	local_irq_restore(flags);
+
+	preempt_enable();
+}
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c8210a8b10389..ebcf52261df65 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1189,7 +1189,8 @@ static void pmu_reg_write(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg, u64 val,
 		local_irq_restore(flags);
 		break;
 	case PMUSERENR_EL0:
-		if (kvm_pmu_is_partitioned(vcpu->kvm))
+		if (kvm_pmu_is_partitioned(vcpu->kvm) &&
+		    !(vcpu->arch.mdcr_el2 & MDCR_EL2_TPM))
 			write_sysreg(val, pmuserenr_el0);
 		__vcpu_assign_sys_reg(vcpu, reg, val);
 		break;
@@ -1274,7 +1275,8 @@ static u64 pmu_reg_read(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
 		local_irq_restore(flags);
 		break;
 	case PMUSERENR_EL0:
-		if (kvm_pmu_is_partitioned(vcpu->kvm))
+		if (kvm_pmu_is_partitioned(vcpu->kvm) &&
+		    !(vcpu->arch.mdcr_el2 & MDCR_EL2_TPM))
 			val = read_sysreg(pmuserenr_el0);
 		else
 			val = __vcpu_sys_reg(vcpu, reg);
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index a24788243ac99..2604a6a46d5f3 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -102,6 +102,9 @@ void kvm_pmu_direct_pmcr_write(struct kvm_vcpu *vcpu, u64 val);
 u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu);
 u64 kvm_pmu_host_counter_mask(void);
 u64 kvm_pmu_guest_counter_mask(void);
+void kvm_pmu_load(struct kvm_vcpu *vcpu);
+void kvm_pmu_put(struct kvm_vcpu *vcpu);
+
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
  * Must be called before every vcpu run after disabling interrupts, to ensure
@@ -150,6 +153,8 @@ static inline u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu)
 {
 	return 0;
 }
+static inline void kvm_pmu_load(struct kvm_vcpu *vcpu) {}
+static inline void kvm_pmu_put(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
-- 
2.56.0.rc1.310.g51773c2048-goog


