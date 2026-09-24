Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9982AC98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdNj2L0sYhd75dOV9xiD7t+lj/BnIDxbJ1PH2fGr/iA=; b=gklP91BeauWaW9QFP59POVGCQl
	fQF6COyxhYJVaLRMT0bHlxn00h3ldWueD7QGOQt9Q9NkajlFJf5/y+h6sm4BP0daIrU4/hYUIYThj
	QblbQueZ/200BvrS0uZRz1xwUaYP4gf+ZYVBKpPaX0a2H9KP25IdYhK94+GdByMtN6AV4g0PxMqO7
	c1xWeeqYScnlgYTNQBHPjj+52+bvo2FPkZLLlFu4mUKQ6MkA1fhxe90h2MFVEkMyh97oUt39tSK1D
	rLPnHesXeZUUUPnS6bQXl5rSJCu9Mo39880Wk194GWhHzUvDPwXS3K759ORe6+I6wnRTX7aRdXMyL
	vVAbVPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nHn-0000000Bkor-2wkl;
	Thu, 24 Sep 2026 17:31:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGj-0000000BkDX-3Skb
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 17:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qdNj2L0sYhd75dOV9xiD7t+lj/BnIDxbJ1PH2fGr/iA=; b=n1lE3Ah9HdI1Ph1zlATJAwZo5x
	l5Yo/KWY/uPhgh8Hp1iVAx721r73NWKHHycR/mb5yyR5SeM98fGgQwV5QE4n+axIVGoQypKzbW3Qh
	UmwheYS4ZVIJ957BVihFY6A7Z6a37VIYtHF+knTw6jY9Ht8duiq3WSTCaPhbB9Nu/PQe/WP0ePv+b
	YiBLfoOxlj7oDAdfK3Z/Eqj8qRiG5a27mVugrZEKjVOG4NN+0rD1sH823GelqNnnKUSud5tziYnmn
	phar43bcWgojTdBT4mWjvAx0+Rfpc80VD+LAVasAC8Tf7YnmnX7U2OpLqSPQgHMYqsJCqtAbqq3Fc
	IZTJkx8g==;
Received: from mail-oa1-x48.google.com ([2001:4860:4864:20::48])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9nGf-0000000GFK7-2r5c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:30:00 +0000
Received: by mail-oa1-x48.google.com with SMTP id 586e51a60fabf-469debb527fso165382fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270995; x=1790875795; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdNj2L0sYhd75dOV9xiD7t+lj/BnIDxbJ1PH2fGr/iA=;
        b=cGO9Zd1LFYioob2XrC8Aw/5pEYST+NpUScGB2zWywmvm9AzhBi6r0OKFINMHTy/oE1
         3F7hP63CNfntzmK7SE/Pk/Kkw0u6IqruIP8gYwweVTJGzFyjZrn+vywQXOAHR41AozbW
         Mo8nQ13r68y6irVT1PTDCgwMPHyhFmGV1t9G2L3SJ1VeGf3z3V835KBbY6UXvl1rKAx3
         14zALVGdgYQ6UbalsrqFU+XCQ1B8cIv4qi5W5aF13fBfHecyDtm4ShkIGEvK3cuC5X4D
         /fDQsV9e0qdSa9Mp0Q26935UHVTx/Uv9E8n1UUN0vLqouEXSPcLuKum4I7yMAxGVBHL3
         ghmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270995; x=1790875795;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdNj2L0sYhd75dOV9xiD7t+lj/BnIDxbJ1PH2fGr/iA=;
        b=nRD9M+hPR4E46ZxnJONeD/pAxBEJPSDYqM+vYWi0Iddv2KabDJHiPYdTbhATQWfu0F
         Hp5/A+UOM16sdf63/W3WZ1QjCEatRmWps3VNK2Kwx1FV+c02kKXj2mUbtiOMBnHDxuqN
         jZkseDlRZKiScynWAnB5QXveIRzM5f8WNvTl3UFObw7/nG6y4VR32MBDzbSruysBHh+o
         ffXDhOKPklEmBETPMmJtE6M8B361uOVAtwFTTFRQFnLMvpaK2YkDhdWrl0ikSRSlcDMo
         sbpu/QFadsMIPx3Q5pf9vt0rWo8c4wuD/w3/nZF0myIi3Bey2tM47ME2+MfXHp9muTMm
         ME3w==
X-Forwarded-Encrypted: i=1; AKwUvBzsh4YjW9Qt1RYr5/kSvFvNXATan5VQwxjIIkrlNaXJjmDsY5LlWqOqrTwo+YifK/5aifA/e8PufrWh5vXujX4H@lists.infradead.org
X-Gm-Message-State: AFuF++nXwA3vy8a5sHumJUg9XRgjZHWfeAQKFqzMvKkfqgUZ8EYtLmB+
	ej2M+G0LM6R8CNpZXsQ+bzqdqTScuAxrskis2TFcWxDNt+dJvo4XdszV80V0Q//2Uk1dQDKyuEb
	0PxOu1la3D/3wr1m2lJnlAWCTqQ==
X-Received: from iodf28.prod.google.com ([2002:a05:6602:62dc:b0:9c4:ca2:5890])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4f54:b0:4d6:9412:45c4 with SMTP id 5614622812f47-4d72bd439c0mr4328957b6e.64.1790270995063;
 Thu, 24 Sep 2026 10:29:55 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:23 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-18-coltonlewis@google.com>
Subject: [PATCH v9 17/22] KVM: arm64: Implement lazy PMU context swaps
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
X-CRM114-CacheID: sfid-20260924_182957_948265_8869CA32 
X-CRM114-Status: GOOD (  26.13  )
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

Since many guests never touch the PMU, avoid paying the cost of
reserving hardware counters and context swapping PMU registers on every
vCPU load and put until the guest actively enables PMU counters or
interrupts.

Track per-vCPU PMU ownership state via enum vcpu_pmu_access
(VCPU_PMU_ACCESS_FREE vs. VCPU_PMU_ACCESS_GUEST_OWNED):
- While FREE, trap all PMU register accesses via MDCR_EL2 (HPMN set to
  the full host counter count, TPM/TPMCR set, and FGT traps left at
  default) so host perf retains all counters including PMCCNTR_EL0.
  Reads and non-enabling writes (such as guest kernel PMU probe resets)
  operate on virtual register state without claiming hardware counters.
- When the guest enables counting or interrupts (writing PMCR_EL0.E = 1
  or setting guest counter bits in PMCNTENSET_EL0 or PMINTENSET_EL1),
  transition to GUEST_OWNED via kvm_pmu_set_guest_owned(), reserve the
  guest's partition of counters, load guest PMU state into hardware via
  kvm_pmu_load(), and untrap guest partition accesses via FGT.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_host.h  |   1 +
 arch/arm64/include/asm/kvm_types.h |   6 +-
 arch/arm64/kvm/debug.c             |   4 +-
 arch/arm64/kvm/pmu-direct.c        |  50 +++++++++++--
 arch/arm64/kvm/pmu-emul.c          |   6 +-
 arch/arm64/kvm/sys_regs.c          | 114 ++++++++++++++++++++---------
 include/kvm/arm_pmu.h              |  10 +++
 7 files changed, 146 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 98143daab6a55..8dff576667d10 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1432,6 +1432,7 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
 	return cpus_have_final_cap(ARM64_SPECTRE_V3A);
 }
 
+void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu);
 void kvm_init_host_debug_data(void);
 void kvm_debug_init_vhe(void);
 void kvm_vcpu_load_debug(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/include/asm/kvm_types.h b/arch/arm64/include/asm/kvm_types.h
index 9a126b9e2d7c9..4e39cbc80aa0b 100644
--- a/arch/arm64/include/asm/kvm_types.h
+++ b/arch/arm64/include/asm/kvm_types.h
@@ -4,5 +4,9 @@
 
 #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
 
-#endif /* _ASM_ARM64_KVM_TYPES_H */
+enum vcpu_pmu_register_access {
+	VCPU_PMU_ACCESS_FREE,
+	VCPU_PMU_ACCESS_GUEST_OWNED,
+};
 
+#endif /* _ASM_ARM64_KVM_TYPES_H */
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index a722fd4594e09..d74354ec8351f 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -35,7 +35,7 @@ static int cpu_has_spe(u64 dfr0)
  *  - Self-hosted Trace Filter controls (MDCR_EL2_TTRF)
  *  - Self-hosted Trace (MDCR_EL2_TTRF/MDCR_EL2_E2TB)
  */
-static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
+void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 {
 	unsigned long flags;
 
@@ -54,7 +54,7 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 				MDCR_EL2_TDRA |
 				MDCR_EL2_TDOSA);
 
-	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+	if (kvm_pmu_is_partitioned(vcpu->kvm) && vcpu->arch.pmu.loaded_on_cpu) {
 		u8 nr_guest_cntr = vcpu->kvm->arch.nr_pmu_counters;
 		u64 hpmn = FIELD_GET(MDCR_EL2_HPMN, read_sysreg(mdcr_el2));
 		bool hpme;
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 31d5afc44f36e..1ada09d54f68f 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -199,7 +199,7 @@ u64 kvm_pmu_host_counter_mask(void)
 {
 	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 
-	if (vcpu && kvm_pmu_is_partitioned(vcpu->kvm)) {
+	if (vcpu && vcpu->arch.pmu.loaded_on_cpu) {
 		u8 nr_counters = *host_data_ptr(nr_event_counters);
 		unsigned int guest_counters = vcpu->kvm->arch.nr_pmu_counters;
 
@@ -212,7 +212,7 @@ u64 kvm_pmu_host_counter_mask(void)
 	return ARMV8_PMU_CNT_MASK_ALL;
 }
 
-static u64 kvm_vcpu_pmu_guest_counter_mask(struct kvm_vcpu *vcpu)
+u64 kvm_vcpu_pmu_guest_counter_mask(struct kvm_vcpu *vcpu)
 {
 	if (vcpu && kvm_pmu_is_partitioned(vcpu->kvm)) {
 		u64 mask = ARMV8_PMU_CNT_MASK_C;
@@ -226,6 +226,7 @@ static u64 kvm_vcpu_pmu_guest_counter_mask(struct kvm_vcpu *vcpu)
 
 	return 0;
 }
+
 /**
  * kvm_pmu_guest_counter_mask() - Compute bitmask of guest-reserved counters
  *
@@ -237,7 +238,12 @@ static u64 kvm_vcpu_pmu_guest_counter_mask(struct kvm_vcpu *vcpu)
  */
 u64 kvm_pmu_guest_counter_mask(void)
 {
-	return kvm_vcpu_pmu_guest_counter_mask(kvm_get_running_vcpu());
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (vcpu && vcpu->arch.pmu.loaded_on_cpu)
+		return kvm_vcpu_pmu_guest_counter_mask(vcpu);
+
+	return 0;
 }
 
 /**
@@ -336,7 +342,9 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	 * If we aren't guest-owned then we know the guest isn't using
 	 * the PMU anyway, so no need to bother with the swap.
 	 */
-	if (!kvm_pmu_is_partitioned(vcpu->kvm))
+	if (!kvm_pmu_is_partitioned(vcpu->kvm) ||
+	    kvm_pmu_get_access(vcpu) != VCPU_PMU_ACCESS_GUEST_OWNED ||
+	    vcpu->arch.pmu.loaded_on_cpu)
 		return;
 
 	preempt_disable();
@@ -344,6 +352,11 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	pmu = vcpu->kvm->arch.arm_pmu;
 	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
 	kvm_pmu_set_guest_counters(pmu, guest_counters);
+
+	vcpu->arch.pmu.loaded_on_cpu = true;
+	kvm_arm_setup_mdcr_el2(vcpu);
+	isb();
+
 	kvm_pmu_apply_event_filter(vcpu);
 
 	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
@@ -411,11 +424,12 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	u64 val;
 
 	/*
-	 * If we aren't guest-owned then we know the guest is not
+	 * If we aren't loaded on the CPU then we know the guest is not
 	 * accessing the PMU anyway, so no need to bother with the
 	 * swap.
 	 */
-	if (!kvm_pmu_is_partitioned(vcpu->kvm))
+	if (!kvm_pmu_is_partitioned(vcpu->kvm) ||
+	    !vcpu->arch.pmu.loaded_on_cpu)
 		return;
 
 	preempt_disable();
@@ -471,6 +485,30 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	write_sysreg(val & mask, pmovsclr_el0);
 	local_irq_restore(flags);
 
+	vcpu->arch.pmu.loaded_on_cpu = false;
+	kvm_arm_setup_mdcr_el2(vcpu);
+	isb();
+
 	kvm_pmu_set_guest_counters(pmu, 0);
 	preempt_enable();
 }
+
+/**
+ * kvm_pmu_set_guest_owned() - Give PMU ownership to guest
+ * @vcpu: Pointer to vcpu struct
+ *
+ * Reconfigure the guest for physical access of PMU hardware if
+ * allowed. This means reconfiguring mdcr_el2 and loading guest PMU
+ * registers when running on the current physical CPU.
+ */
+void kvm_pmu_set_guest_owned(struct kvm_vcpu *vcpu)
+{
+	guard(preempt)();
+
+	if (kvm_pmu_is_partitioned(vcpu->kvm) &&
+	    kvm_pmu_get_access(vcpu) == VCPU_PMU_ACCESS_FREE &&
+	    vcpu == kvm_get_running_vcpu()) {
+		vcpu->arch.pmu.access = VCPU_PMU_ACCESS_GUEST_OWNED;
+		kvm_pmu_load(vcpu);
+	}
+}
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 2a2c924fc6b8f..e8195984b0373 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -630,7 +630,8 @@ void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu)
 	__vcpu_rmw_sys_reg(vcpu, PMINTENSET_EL1, &=, mask);
 	__vcpu_rmw_sys_reg(vcpu, PMCNTENSET_EL0, &=, mask);
 
-	kvm_pmu_reprogram_counter_mask(vcpu, mask);
+	if (!kvm_pmu_is_partitioned(vcpu->kvm))
+		kvm_pmu_reprogram_counter_mask(vcpu, mask);
 }
 
 void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu)
@@ -639,6 +640,9 @@ void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu)
 	unsigned long mask;
 	int i;
 
+	if (kvm_pmu_is_partitioned(vcpu->kvm))
+		return;
+
 	mask = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
 	for_each_set_bit(i, &mask, 32) {
 		struct kvm_pmc *pmc = kvm_vcpu_idx_to_pmc(vcpu, i);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c4aa6a448b6ca..20c46ef705d30 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1109,13 +1109,34 @@ static void pmu_reg_write(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg, u64 val,
 
 	switch (reg) {
 	case PMCR_EL0:
-		if (kvm_pmu_is_partitioned(vcpu->kvm))
-			kvm_pmu_direct_pmcr_write(vcpu, val);
-		else
+		if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+			__vcpu_rmw_sys_reg(vcpu, PMCR_EL0, &=, ~ARMV8_PMU_PMCR_MASK);
+			__vcpu_rmw_sys_reg(vcpu, PMCR_EL0, |=, val & ARMV8_PMU_PMCR_MASK);
+			if (val & ARMV8_PMU_PMCR_C)
+				__vcpu_assign_sys_reg(vcpu, PMCCNTR_EL0, 0);
+			if (val & ARMV8_PMU_PMCR_P) {
+				int i;
+
+				mask = kvm_pmu_implemented_counter_mask(vcpu) &
+				       ~BIT(ARMV8_PMU_CYCLE_IDX);
+				if (!vcpu_is_el2(vcpu))
+					mask &= ~kvm_pmu_hyp_counter_mask(vcpu);
+				for_each_set_bit(i, (unsigned long *)&mask,
+						 ARMV8_PMU_MAX_GENERAL_COUNTERS)
+					__vcpu_assign_sys_reg(vcpu, PMEVCNTR0_EL0 + i, 0);
+			}
+
+			if (val & ARMV8_PMU_PMCR_E)
+				kvm_pmu_set_guest_owned(vcpu);
+
+			if (vcpu->arch.pmu.loaded_on_cpu)
+				kvm_pmu_direct_pmcr_write(vcpu, val);
+		} else {
 			kvm_pmu_handle_pmcr(vcpu, val);
+		}
 		break;
 	case PMSELR_EL0:
-		if (kvm_pmu_is_partitioned(vcpu->kvm))
+		if (vcpu->arch.pmu.loaded_on_cpu)
 			write_sysreg(val, pmselr_el0);
 		__vcpu_assign_sys_reg(vcpu, reg, val);
 		break;
@@ -1123,10 +1144,13 @@ static void pmu_reg_write(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg, u64 val,
 		idx = reg - PMEVCNTR0_EL0;
 
 		if (kvm_pmu_is_partitioned(vcpu->kvm)) {
-			if (idx == ARMV8_PMU_CYCLE_IDX)
-				write_sysreg(val, pmccntr_el0);
-			else
-				write_pmevcntrn(idx, val);
+			__vcpu_assign_sys_reg(vcpu, reg, val);
+			if (vcpu->arch.pmu.loaded_on_cpu) {
+				if (idx == ARMV8_PMU_CYCLE_IDX)
+					write_sysreg(val, pmccntr_el0);
+				else
+					write_pmevcntrn(idx, val);
+			}
 		} else {
 			kvm_pmu_set_counter_value(vcpu, idx, val);
 		}
@@ -1137,7 +1161,8 @@ static void pmu_reg_write(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg, u64 val,
 		if (kvm_pmu_is_partitioned(vcpu->kvm)) {
 			mask = kvm_pmu_evtyper_mask(vcpu->kvm);
 			__vcpu_assign_sys_reg(vcpu, reg, val & mask);
-			kvm_pmu_apply_single_event_filter(vcpu, idx);
+			if (vcpu->arch.pmu.loaded_on_cpu)
+				kvm_pmu_apply_single_event_filter(vcpu, idx);
 		} else {
 			kvm_pmu_set_counter_event_type(vcpu, val, idx);
 			kvm_vcpu_pmu_restore_guest(vcpu);
@@ -1145,16 +1170,24 @@ static void pmu_reg_write(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg, u64 val,
 		break;
 	case PMCNTENSET_EL0:
 		if (kvm_pmu_is_partitioned(vcpu->kvm)) {
-			if (set)
-				write_sysreg(val, pmcntenset_el0);
-			else
-				write_sysreg(val, pmcntenclr_el0);
+			mask = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+			if (set) {
+				__vcpu_rmw_sys_reg(vcpu, PMCNTENSET_EL0, |=, val & mask);
+				if (val & mask)
+					kvm_pmu_set_guest_owned(vcpu);
+				if (vcpu->arch.pmu.loaded_on_cpu)
+					write_sysreg(val & mask, pmcntenset_el0);
+			} else {
+				__vcpu_rmw_sys_reg(vcpu, PMCNTENSET_EL0, &=, ~(val & mask));
+				if (vcpu->arch.pmu.loaded_on_cpu)
+					write_sysreg(val & mask, pmcntenclr_el0);
+			}
 		} else {
 			if (set)
 				/* accessing PMCNTENSET_EL0 */
 				__vcpu_rmw_sys_reg(vcpu, PMCNTENSET_EL0, |=, val);
 			else
-				/* accessing PMINTENCLR_EL1 */
+				/* accessing PMCNTENCLR_EL0 */
 				__vcpu_rmw_sys_reg(vcpu, PMCNTENSET_EL0, &=, ~val);
 
 			kvm_pmu_reprogram_counter_mask(vcpu, val);
@@ -1162,10 +1195,18 @@ static void pmu_reg_write(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg, u64 val,
 		break;
 	case PMINTENSET_EL1:
 		if (kvm_pmu_is_partitioned(vcpu->kvm)) {
-			if (set)
-				write_sysreg(val, pmintenset_el1);
-			else
-				write_sysreg(val, pmintenclr_el1);
+			mask = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+			if (set) {
+				__vcpu_rmw_sys_reg(vcpu, PMINTENSET_EL1, |=, val & mask);
+				if (val & mask)
+					kvm_pmu_set_guest_owned(vcpu);
+				if (vcpu->arch.pmu.loaded_on_cpu)
+					write_sysreg(val & mask, pmintenset_el1);
+			} else {
+				__vcpu_rmw_sys_reg(vcpu, PMINTENSET_EL1, &=, ~(val & mask));
+				if (vcpu->arch.pmu.loaded_on_cpu)
+					write_sysreg(val & mask, pmintenclr_el1);
+			}
 		} else {
 			if (set)
 				/* accessing PMINTENSET_EL1 */
@@ -1183,14 +1224,14 @@ static void pmu_reg_write(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg, u64 val,
 		} else {
 			/* accessing PMOVSCLR_EL0 */
 			__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, &=, ~val);
-			if (kvm_pmu_is_partitioned(vcpu->kvm))
-				write_sysreg(val & kvm_pmu_guest_counter_mask(),
+			if (vcpu->arch.pmu.loaded_on_cpu)
+				write_sysreg(val & kvm_vcpu_pmu_guest_counter_mask(vcpu),
 					     pmovsclr_el0);
 		}
 		local_irq_restore(flags);
 		break;
 	case PMUSERENR_EL0:
-		if (kvm_pmu_is_partitioned(vcpu->kvm) &&
+		if (vcpu->arch.pmu.loaded_on_cpu &&
 		    !(vcpu->arch.mdcr_el2 & MDCR_EL2_TPM))
 			write_sysreg(val, pmuserenr_el0);
 		__vcpu_assign_sys_reg(vcpu, reg, val);
@@ -1199,7 +1240,6 @@ static void pmu_reg_write(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg, u64 val,
 		WARN_ON(1);
 		break;
 	}
-
 }
 
 /**
@@ -1219,13 +1259,13 @@ static u64 pmu_reg_read(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
 
 	switch (reg) {
 	case PMCR_EL0:
-		if (kvm_pmu_is_partitioned(vcpu->kvm))
+		if (vcpu->arch.pmu.loaded_on_cpu)
 			val = kvm_pmu_direct_pmcr_read(vcpu);
 		else
 			val = kvm_vcpu_read_pmcr(vcpu);
 		break;
 	case PMSELR_EL0:
-		if (kvm_pmu_is_partitioned(vcpu->kvm))
+		if (vcpu->arch.pmu.loaded_on_cpu)
 			val = read_sysreg(pmselr_el0);
 		else
 			val = __vcpu_sys_reg(vcpu, reg);
@@ -1234,10 +1274,14 @@ static u64 pmu_reg_read(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
 		idx = reg - PMEVCNTR0_EL0;
 
 		if (kvm_pmu_is_partitioned(vcpu->kvm)) {
-			if (idx == ARMV8_PMU_CYCLE_IDX)
-				val = read_sysreg(pmccntr_el0);
-			else
-				val = read_pmevcntrn(idx);
+			if (vcpu->arch.pmu.loaded_on_cpu) {
+				if (idx == ARMV8_PMU_CYCLE_IDX)
+					val = read_sysreg(pmccntr_el0);
+				else
+					val = read_pmevcntrn(idx);
+			} else {
+				val = __vcpu_sys_reg(vcpu, reg);
+			}
 		} else {
 			val = kvm_pmu_get_counter_value(vcpu, idx);
 		}
@@ -1246,26 +1290,26 @@ static u64 pmu_reg_read(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
 		val = __vcpu_sys_reg(vcpu, reg);
 		break;
 	case PMCNTENSET_EL0:
-		if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		if (vcpu->arch.pmu.loaded_on_cpu) {
 			val = read_sysreg(pmcntenset_el0);
-			val &= kvm_pmu_guest_counter_mask();
+			val &= kvm_vcpu_pmu_guest_counter_mask(vcpu);
 		} else {
 			val = __vcpu_sys_reg(vcpu, reg);
 		}
 		break;
 	case PMINTENSET_EL1:
-		if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		if (vcpu->arch.pmu.loaded_on_cpu) {
 			val = read_sysreg(pmintenset_el1);
-			val &= kvm_pmu_guest_counter_mask();
+			val &= kvm_vcpu_pmu_guest_counter_mask(vcpu);
 		} else {
 			val = __vcpu_sys_reg(vcpu, reg);
 		}
 		break;
 	case PMOVSSET_EL0:
 		local_irq_save(flags);
-		if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		if (vcpu->arch.pmu.loaded_on_cpu) {
 			u64 hw_ovf = read_sysreg(pmovsset_el0) &
-				     kvm_pmu_guest_counter_mask();
+				     kvm_vcpu_pmu_guest_counter_mask(vcpu);
 
 			if (hw_ovf) {
 				__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, hw_ovf);
@@ -1276,7 +1320,7 @@ static u64 pmu_reg_read(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
 		local_irq_restore(flags);
 		break;
 	case PMUSERENR_EL0:
-		if (kvm_pmu_is_partitioned(vcpu->kvm) &&
+		if (vcpu->arch.pmu.loaded_on_cpu &&
 		    !(vcpu->arch.mdcr_el2 & MDCR_EL2_TPM))
 			val = read_sysreg(pmuserenr_el0);
 		else
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index ddbbbb050b9de..0f2e39367d637 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -7,6 +7,7 @@
 #ifndef __ASM_ARM_KVM_PMU_H
 #define __ASM_ARM_KVM_PMU_H
 
+#include <linux/kvm_types.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmuv3.h>
 #include <linux/perf/arm_pmu.h>
@@ -42,6 +43,8 @@ struct kvm_pmu {
 	struct kvm_pmc pmc[KVM_ARMV8_PMU_MAX_COUNTERS];
 	int irq_num;
 	bool created;
+	bool loaded_on_cpu;
+	enum vcpu_pmu_register_access access;
 };
 
 struct arm_pmu_entry {
@@ -100,12 +103,16 @@ void kvm_pmu_partition_enable(struct kvm *kvm, bool enable);
 bool kvm_pmu_is_partitioned(struct kvm *kvm);
 void kvm_pmu_direct_pmcr_write(struct kvm_vcpu *vcpu, u64 val);
 u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu);
+u64 kvm_vcpu_pmu_guest_counter_mask(struct kvm_vcpu *vcpu);
 u64 kvm_pmu_host_counter_mask(void);
 u64 kvm_pmu_guest_counter_mask(void);
 void kvm_pmu_load(struct kvm_vcpu *vcpu);
 void kvm_pmu_put(struct kvm_vcpu *vcpu);
+void kvm_pmu_set_guest_owned(struct kvm_vcpu *vcpu);
 void kvm_pmu_apply_single_event_filter(struct kvm_vcpu *vcpu, u8 idx);
 
+#define kvm_pmu_get_access(vcpu)	((vcpu)->arch.pmu.access)
+
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
  * Must be called before every vcpu run after disabling interrupts, to ensure
@@ -149,6 +156,8 @@ static inline bool kvm_pmu_is_partitioned(struct kvm *kvm)
 {
 	return false;
 }
+
+#define kvm_pmu_get_access(vcpu)	(VCPU_PMU_ACCESS_FREE)
 static inline void kvm_pmu_direct_pmcr_write(struct kvm_vcpu *vcpu, u64 val) {}
 static inline u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu)
 {
@@ -156,6 +165,7 @@ static inline u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu)
 }
 static inline void kvm_pmu_load(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_put(struct kvm_vcpu *vcpu) {}
+static inline void kvm_pmu_set_guest_owned(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
-- 
2.56.0.rc1.310.g51773c2048-goog


