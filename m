Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D75C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 09:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBhoY3JzR5UUf6f22tr97FXC7T2gtMfmjNwq/zidCrE=; b=xoXc9Lx6nGFHtNXKKAnRlsmBKa
	a+IIiNqaKWc8TqmpKENbFm4lfAH629RbQpXJDSD/dufQoYFAGIIIwtUAmktoxxI0ys8eKBvq1+1/j
	GuRxZIpu+svJyD4IfBIxFgxrOJVM3hooXSHr5G2rbxBmRCx3qaZFOZFmvxMRQGq3oIg9L2anDHi9g
	RJQhXygjhiPVAawJ9s6t7xXK9bdCq9bnaM/w0lVHT/GS9AzK/GWjqAvO5AEKsMnGegsEpQtqN8pIe
	/dxmC9X8ONYAaW9ulh8oYOetVa8Z+pOxFaQSW6TLOhxX64mhKzRYjXy4eB5hlnyYEXLrxqub9uP1S
	DaM4KJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNeS-0000000G71n-2vLN;
	Sat, 15 Mar 2025 09:17:52 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNZc-0000000G5mh-06Ii
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 09:12:53 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-224191d92e4so57372595ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742029971; x=1742634771; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBhoY3JzR5UUf6f22tr97FXC7T2gtMfmjNwq/zidCrE=;
        b=G79iS9WB2Wl2LAibtqBeTKT+cfCwKRMagTCGCl0Ypu/EDqy2/HO2VnagMB2JUzy+lW
         6YFofrc7E37G6hR0F441Sk+r3oUjb9Z0K7R18XTEtjO1EsqyKt8Pn4jJfYysiYzVazPb
         icrPs3S4HEq+b7l630KTh5XvZSxbgCHDOWJRcLiaY3T+yqfzbmLrHhkMBs/x/vPfG0x6
         gXD8LhYuCluBwX7cKg85cpQhOPGVQ0bzAKXsnMwyfM++hfjf+0O6YXXWita2dXNVoTqL
         MaqBTbWvbJuF9fETXl76ZKCjf6QC/5jZNOfbLImGzlBwh4vDH8NU583Wh+XmpGEzPBw1
         L9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742029971; x=1742634771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBhoY3JzR5UUf6f22tr97FXC7T2gtMfmjNwq/zidCrE=;
        b=RA4wT3oOWprjUGALfojfmIYYWZDmy5paAjBHkFfR4VCpUofPwzvXQfLvhTA13WsQvl
         Lgj+25q4U1CnGcUy7N6ERzlzMl3D2CPkX2nQuG2A3Q/A0i2ZpwhZyBK/FQdYFFXwhaji
         HZ0tsi8ZOgbdyf4W7/6wgPWznECVhFB7oGwXMiQ+d8YQo/kdVVLqV7Z/XCN0UZ2GA8tS
         HYLOfFbVbRHRyFzJc4Lk2uhdHmE2PVadVa4k/1FMG0Az5Nsy1laGfh4UUrwlQkUoqH7w
         UowcxaA2Tx0QXEdMzb+SEZ3dfWG256Klr1RFR/YPsyNfmFrsGUUX9opj5Ailjzu+Iw34
         UFfQ==
X-Gm-Message-State: AOJu0Yw8yXEQx6Cvdup3xuOVRkgtBEDckTNzkZDMaQpDHKimwcGwhXTY
	WbBBmGk80YFW2jkxIUXbVX5c1C3wmRSLX5ok2vDhpgnSlEwiBEa/c5NyWolSuMU=
X-Gm-Gg: ASbGnctwC5SdwQdb4UUXeP2K5IuvEoEL/nN9Gl0xQKSGjl14yGEb0tP1hR34p9yF0cF
	sC4jQpvB7ZPCik5Tl+CaMcGho6s/yVoJi/tL3jxaeBMoNujLgZsRqYiJrENnKbvGPtgVAZ7u0Cu
	N/5Ixt5iNUyNKN0I2udhMbHLBgvx7vQGxe1OJz9ak4RcCPiS/rP5xIY+Vydq7uWsfiyHVT2nPVv
	od71X9C6E1pB5tbm50D08OMbzhpCfpTdRMg/htHnXftszlYqhGHtJ7keamAtTwsBqCd1/fvyyaa
	E6lzYi7ltDTyyIvKm2a8RDYxroFNZk2P8AY3wy2toUChzzhI
X-Google-Smtp-Source: AGHT+IHzLP/Cp0+ZoY1hmXekIVA9+RY6XNkX4cssJ6gV1Uehk1XprCWAd4bfwyV6HDnSKCO9/1qjaA==
X-Received: by 2002:a17:903:2b0c:b0:223:faf5:c82 with SMTP id d9443c01a7336-225e0a28898mr57188645ad.8.1742029971350;
        Sat, 15 Mar 2025 02:12:51 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-30153b994b3sm2327772a91.30.2025.03.15.02.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 02:12:51 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 15 Mar 2025 18:12:11 +0900
Subject: [PATCH v5 2/5] KVM: arm64: PMU: Assume PMU presence in pmu-emul.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250315-pmc-v5-2-ecee87dab216@daynix.com>
References: <20250315-pmc-v5-0-ecee87dab216@daynix.com>
In-Reply-To: <20250315-pmc-v5-0-ecee87dab216@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <andrew.jones@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_021252_071355_0B3F046A 
X-CRM114-Status: GOOD (  20.57  )
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

Many functions in pmu-emul.c checks kvm_vcpu_has_pmu(vcpu). A favorable
interpretation is defensive programming, but it also has downsides:

- It is confusing as it implies these functions are called without PMU
  although most of them are called only when a PMU is present.

- It makes semantics of functions fuzzy. For example, calling
  kvm_pmu_disable_counter_mask() without PMU may result in no-op as
  there are no enabled counters, but it's unclear what
  kvm_pmu_get_counter_value() returns when there is no PMU.

- It allows callers without checking kvm_vcpu_has_pmu(vcpu), but it is
  often wrong to call these functions without PMU.

- It is error-prone to duplicate kvm_vcpu_has_pmu(vcpu) checks into
  multiple functions. Many functions are called for system registers,
  and the system register infrastructure already employs less
  error-prone, comprehensive checks.

Check kvm_vcpu_has_pmu(vcpu) in callers of these functions instead,
and remove the obsolete checks from pmu-emul.c. The only exceptions are
the functions that implement ioctls as they have definitive semantics
even when the PMU is not present.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/arm.c            | 17 +++++++++++------
 arch/arm64/kvm/emulate-nested.c |  6 ++++--
 arch/arm64/kvm/pmu-emul.c       | 26 +-------------------------
 arch/arm64/kvm/sys_regs.c       |  6 ++++--
 4 files changed, 20 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 0160b4924351..caa1357fa367 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -835,9 +835,11 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 	if (ret)
 		return ret;
 
-	ret = kvm_arm_pmu_v3_enable(vcpu);
-	if (ret)
-		return ret;
+	if (kvm_vcpu_has_pmu(vcpu)) {
+		ret = kvm_arm_pmu_v3_enable(vcpu);
+		if (ret)
+			return ret;
+	}
 
 	if (is_protected_kvm_enabled()) {
 		ret = pkvm_create_hyp_vm(kvm);
@@ -1148,7 +1150,8 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 */
 		preempt_disable();
 
-		kvm_pmu_flush_hwstate(vcpu);
+		if (kvm_vcpu_has_pmu(vcpu))
+			kvm_pmu_flush_hwstate(vcpu);
 
 		local_irq_disable();
 
@@ -1167,7 +1170,8 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		if (ret <= 0 || kvm_vcpu_exit_request(vcpu, &ret)) {
 			vcpu->mode = OUTSIDE_GUEST_MODE;
 			isb(); /* Ensure work in x_flush_hwstate is committed */
-			kvm_pmu_sync_hwstate(vcpu);
+			if (kvm_vcpu_has_pmu(vcpu))
+				kvm_pmu_sync_hwstate(vcpu);
 			if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
 				kvm_timer_sync_user(vcpu);
 			kvm_vgic_sync_hwstate(vcpu);
@@ -1197,7 +1201,8 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 * that the vgic can properly sample the updated state of the
 		 * interrupt line.
 		 */
-		kvm_pmu_sync_hwstate(vcpu);
+		if (kvm_vcpu_has_pmu(vcpu))
+			kvm_pmu_sync_hwstate(vcpu);
 
 		/*
 		 * Sync the vgic state before syncing the timer state because
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 607d37bab70b..9293fb078fc6 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2516,7 +2516,8 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 	kvm_arch_vcpu_load(vcpu, smp_processor_id());
 	preempt_enable();
 
-	kvm_pmu_nested_transition(vcpu);
+	if (kvm_vcpu_has_pmu(vcpu))
+		kvm_pmu_nested_transition(vcpu);
 }
 
 static void kvm_inject_el2_exception(struct kvm_vcpu *vcpu, u64 esr_el2,
@@ -2599,7 +2600,8 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	kvm_arch_vcpu_load(vcpu, smp_processor_id());
 	preempt_enable();
 
-	kvm_pmu_nested_transition(vcpu);
+	if (kvm_vcpu_has_pmu(vcpu))
+		kvm_pmu_nested_transition(vcpu);
 
 	return 1;
 }
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 6c5950b9ceac..98fdc65f5b24 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -150,9 +150,6 @@ static u64 kvm_pmu_get_pmc_value(struct kvm_pmc *pmc)
  */
 u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx)
 {
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return 0;
-
 	return kvm_pmu_get_pmc_value(kvm_vcpu_idx_to_pmc(vcpu, select_idx));
 }
 
@@ -191,9 +188,6 @@ static void kvm_pmu_set_pmc_value(struct kvm_pmc *pmc, u64 val, bool force)
  */
 void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val)
 {
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return;
-
 	kvm_pmu_set_pmc_value(kvm_vcpu_idx_to_pmc(vcpu, select_idx), val, false);
 }
 
@@ -350,7 +344,7 @@ void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val)
 {
 	int i;
 
-	if (!kvm_vcpu_has_pmu(vcpu) || !val)
+	if (!val)
 		return;
 
 	for (i = 0; i < KVM_ARMV8_PMU_MAX_COUNTERS; i++) {
@@ -401,9 +395,6 @@ static void kvm_pmu_update_state(struct kvm_vcpu *vcpu)
 	struct kvm_pmu *pmu = &vcpu->arch.pmu;
 	bool overflow;
 
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return;
-
 	overflow = kvm_pmu_overflow_status(vcpu);
 	if (pmu->irq_level == overflow)
 		return;
@@ -599,9 +590,6 @@ void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val)
 {
 	int i;
 
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return;
-
 	/* Fixup PMCR_EL0 to reconcile the PMU version and the LP bit */
 	if (!kvm_has_feat(vcpu->kvm, ID_AA64DFR0_EL1, PMUVer, V3P5))
 		val &= ~ARMV8_PMU_PMCR_LP;
@@ -766,9 +754,6 @@ void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu, u64 data,
 	struct kvm_pmc *pmc = kvm_vcpu_idx_to_pmc(vcpu, select_idx);
 	u64 reg;
 
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return;
-
 	reg = counter_index_to_evtreg(pmc->idx);
 	__vcpu_sys_reg(vcpu, reg) = data & kvm_pmu_evtyper_mask(vcpu->kvm);
 
@@ -848,9 +833,6 @@ u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 	u64 val, mask = 0;
 	int base, i, nr_events;
 
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return 0;
-
 	if (!pmceid1) {
 		val = read_sysreg(pmceid0_el0);
 		/* always support CHAIN */
@@ -900,9 +882,6 @@ void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu)
 
 int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)
 {
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return 0;
-
 	if (!vcpu->arch.pmu.created)
 		return -EINVAL;
 
@@ -1231,9 +1210,6 @@ void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu)
 	unsigned long mask;
 	int i;
 
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return;
-
 	mask = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
 	for_each_set_bit(i, &mask, 32) {
 		struct kvm_pmc *pmc = kvm_vcpu_idx_to_pmc(vcpu, i);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ffee72fd1273..e8e9c781a929 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1853,12 +1853,14 @@ static int set_id_aa64dfr0_el1(struct kvm_vcpu *vcpu,
 static u64 read_sanitised_id_dfr0_el1(struct kvm_vcpu *vcpu,
 				      const struct sys_reg_desc *rd)
 {
-	u8 perfmon = pmuver_to_perfmon(kvm_arm_pmu_get_pmuver_limit());
+	u8 perfmon;
 	u64 val = read_sanitised_ftr_reg(SYS_ID_DFR0_EL1);
 
 	val &= ~ID_DFR0_EL1_PerfMon_MASK;
-	if (kvm_vcpu_has_pmu(vcpu))
+	if (kvm_vcpu_has_pmu(vcpu)) {
+		perfmon = pmuver_to_perfmon(kvm_arm_pmu_get_pmuver_limit());
 		val |= SYS_FIELD_PREP(ID_DFR0_EL1, PerfMon, perfmon);
+	}
 
 	val = ID_REG_LIMIT_FIELD_ENUM(val, ID_DFR0_EL1, CopDbg, Debugv8p8);
 

-- 
2.48.1


