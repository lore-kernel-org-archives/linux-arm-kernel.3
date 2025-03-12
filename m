Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA45CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwE7purWiXM/F0UZ+ykkSRqLAxV2EP4DXS0cEhDzP48=; b=eTIonIHaebGicC2b8X3fB6GYdz
	lEhmt6mIZCQW+AyhIgpIUncINTfn/8qRQdc21Lc6bIg1nvWzv0XCaqtE47P8y/neQBGIKJ904IKeR
	euhNXYx18Yw+SSYH4TmHOd8b1XOG6KkUKwu9awR6lokfNtMcWEEJLCCEZ6XmYdfw6ZM0gBlz8Wtp6
	TItepSmuNblT6tcgMqkqBQZDexjxVCXuuKjy5K4ga8yJPtszHyoNAJCOo175nPGh+4xG8cf/RZm5w
	c5YUw6/Qhqx0PB+PABWTRF8C9X5eiQhDpFAQu7kaTsI0bBotyXIKvaZQhMr/X6wAf28JJY7a15AM6
	Dpd3zY3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLcB-00000008TRl-3naP;
	Wed, 12 Mar 2025 12:55:15 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKh9-00000008KOk-42B0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:56:21 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2255003f4c6so72458315ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741780579; x=1742385379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwE7purWiXM/F0UZ+ykkSRqLAxV2EP4DXS0cEhDzP48=;
        b=vRUqNLEYzvLTR/dl7bWVDzbbXB8upTG00KXoxHebmKwwPwaVfOCOOn2Vo9bov4wdAC
         SA29hpeTwRjrIV6l5rmYiSzd+6L9EiTymzeO6FdiA5EZ+ZLg5hTg+u2GpfGsCRwg8+EP
         7Ec07TO+dnjN+Rl+Z43fxxwfjGxTxPGyT0mvZMM1jhG4nZn4mVfs3/wyQVaerx5FRK5Y
         jOk95e8eLDvpQxKqe2Jiilrr9bH6OgHm2GEfuVJKIL3wKRgY/COrn3OcVzj5uoa8ztr8
         CQqt/cGyUFZ4yi0gyFqRs16D/l9iXgbM5AR2R6ovR61Ene/l4No4VQr6X1x3RzdElYno
         5fZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741780579; x=1742385379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwE7purWiXM/F0UZ+ykkSRqLAxV2EP4DXS0cEhDzP48=;
        b=EsdtthXeBBCplG2LIVyOrv+xQ8+OoOsBXC6hCrUUqDm59FIm2pYheE83TwwOqrB/5d
         1NgcR3bG3savND0sfB7O4V5sZfJzZqUTpfHK0BqAu4VuZPBpbM02PnQ+q0w2GhwBa1YW
         0jvC2cfMU9PacyJFDqRvYnj0Hog/vF+AwhFwi8YI1Z28i+fodunNJ29FALoan7t6q7mf
         Cj3zalc2N0j9YomIpfZR8R+6TNgrXYat1kGJWTo/SgC4zTlz2PTf2zrQaXxEFz4kFh/b
         GWhpYMbtXBIeIbYAKl2278hPcmocGiAU7hwqjSXV2xasPYxY4/sVNQspGVaLM3tkRGkI
         vewg==
X-Gm-Message-State: AOJu0YwzXI0j2K3nj/OVzCIucEOPPvUj4Qd2xry43bOYMAt903O4puiG
	qkByDBusDHg8lD4yb4vzCt5crNDPsnjOKyBE2DSIyOZdqWa9lTt2wqymtUtMQKg=
X-Gm-Gg: ASbGncvL2LDA983/eWkWHgkcxObq4P8fwtrhDQ3pBJwTRnkjFSIDEqr940hk4nvPaQ0
	aVP6dLgKsd1Oy1pg7rvPpu0uFceQHSoPq+VoaD1bKQfBOIjjT80rfKog6+XkLmZaZ1V7UYNAEzt
	I0oU1i5z/AOAFUPPy8aMl27TOWwJXv9/uNZeWXkY0gKK2q4m8EAD965WesBZ5jwxgzSu4epAiYl
	AMJJVnju3cWRCnFjduXlWudwr+H2A5rjnq2mss0NrRx+qSdd2JTaKhCO7F2wPnieoFncWpxtxG7
	ns+cWNbn7I85BiotgtdXajf1xi39mjTijGCtJ117QGNK6zOt
X-Google-Smtp-Source: AGHT+IGnNDhaZJn9+pWAJQQhskEvDmKUXMj64Q6j1/BL2bE5sEl9YUEXr8ltZIQn3VPWZCpg0FkadA==
X-Received: by 2002:a05:6a21:6f07:b0:1f5:6f98:70a0 with SMTP id adf61e73a8af0-1f58cb466e2mr11761471637.22.1741780578715;
        Wed, 12 Mar 2025 04:56:18 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-736a6e5c13asm10966593b3a.157.2025.03.12.04.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 04:56:18 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 12 Mar 2025 20:55:56 +0900
Subject: [PATCH v3 2/6] KVM: arm64: PMU: Assume PMU presence in pmu-emul.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-pmc-v3-2-0411cab5dc3d@daynix.com>
References: <20250312-pmc-v3-0-0411cab5dc3d@daynix.com>
In-Reply-To: <20250312-pmc-v3-0-0411cab5dc3d@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <drjones@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_045620_009006_10738C72 
X-CRM114-Status: GOOD (  19.91  )
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
and remove the obsolete checks from pmu-emul.c.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/arm.c      |  8 +++++---
 arch/arm64/kvm/guest.c    | 12 ++++++++++++
 arch/arm64/kvm/pmu-emul.c | 34 ++--------------------------------
 arch/arm64/kvm/sys_regs.c |  6 ++++--
 4 files changed, 23 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index f66ce098f03b..e375468a2217 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -834,9 +834,11 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
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
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 962f985977c2..fc09eec3fd94 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -951,6 +951,10 @@ int kvm_arm_vcpu_arch_set_attr(struct kvm_vcpu *vcpu,
 
 	switch (attr->group) {
 	case KVM_ARM_VCPU_PMU_V3_CTRL:
+		if (!kvm_vcpu_has_pmu(vcpu)) {
+			ret = -ENODEV;
+			break;
+		}
 		mutex_lock(&vcpu->kvm->arch.config_lock);
 		ret = kvm_arm_pmu_v3_set_attr(vcpu, attr);
 		mutex_unlock(&vcpu->kvm->arch.config_lock);
@@ -976,6 +980,10 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
 
 	switch (attr->group) {
 	case KVM_ARM_VCPU_PMU_V3_CTRL:
+		if (!kvm_vcpu_has_pmu(vcpu)) {
+			ret = -ENODEV;
+			break;
+		}
 		ret = kvm_arm_pmu_v3_get_attr(vcpu, attr);
 		break;
 	case KVM_ARM_VCPU_TIMER_CTRL:
@@ -999,6 +1007,10 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
 
 	switch (attr->group) {
 	case KVM_ARM_VCPU_PMU_V3_CTRL:
+		if (!kvm_vcpu_has_pmu(vcpu)) {
+			ret = -ENXIO;
+			break;
+		}
 		ret = kvm_arm_pmu_v3_has_attr(vcpu, attr);
 		break;
 	case KVM_ARM_VCPU_TIMER_CTRL:
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index e3e82b66e226..3e5bf414447f 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -144,9 +144,6 @@ static u64 kvm_pmu_get_pmc_value(struct kvm_pmc *pmc)
  */
 u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx)
 {
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return 0;
-
 	return kvm_pmu_get_pmc_value(kvm_vcpu_idx_to_pmc(vcpu, select_idx));
 }
 
@@ -185,9 +182,6 @@ static void kvm_pmu_set_pmc_value(struct kvm_pmc *pmc, u64 val, bool force)
  */
 void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val)
 {
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return;
-
 	kvm_pmu_set_pmc_value(kvm_vcpu_idx_to_pmc(vcpu, select_idx), val, false);
 }
 
@@ -289,8 +283,6 @@ u64 kvm_pmu_valid_counter_mask(struct kvm_vcpu *vcpu)
 void kvm_pmu_enable_counter_mask(struct kvm_vcpu *vcpu, u64 val)
 {
 	int i;
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return;
 
 	if (!(kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E) || !val)
 		return;
@@ -324,7 +316,7 @@ void kvm_pmu_disable_counter_mask(struct kvm_vcpu *vcpu, u64 val)
 {
 	int i;
 
-	if (!kvm_vcpu_has_pmu(vcpu) || !val)
+	if (!val)
 		return;
 
 	for (i = 0; i < KVM_ARMV8_PMU_MAX_COUNTERS; i++) {
@@ -357,9 +349,6 @@ static void kvm_pmu_update_state(struct kvm_vcpu *vcpu)
 	struct kvm_pmu *pmu = &vcpu->arch.pmu;
 	bool overflow;
 
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return;
-
 	overflow = !!kvm_pmu_overflow_status(vcpu);
 	if (pmu->irq_level == overflow)
 		return;
@@ -555,9 +544,6 @@ void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val)
 {
 	int i;
 
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return;
-
 	/* Fixup PMCR_EL0 to reconcile the PMU version and the LP bit */
 	if (!kvm_has_feat(vcpu->kvm, ID_AA64DFR0_EL1, PMUVer, V3P5))
 		val &= ~ARMV8_PMU_PMCR_LP;
@@ -696,9 +682,6 @@ void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu, u64 data,
 	struct kvm_pmc *pmc = kvm_vcpu_idx_to_pmc(vcpu, select_idx);
 	u64 reg;
 
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return;
-
 	reg = counter_index_to_evtreg(pmc->idx);
 	__vcpu_sys_reg(vcpu, reg) = data & kvm_pmu_evtyper_mask(vcpu->kvm);
 
@@ -804,9 +787,6 @@ u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 	u64 val, mask = 0;
 	int base, i, nr_events;
 
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return 0;
-
 	if (!pmceid1) {
 		val = compute_pmceid0(cpu_pmu);
 		base = 0;
@@ -847,9 +827,6 @@ void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu)
 
 int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)
 {
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return 0;
-
 	if (!vcpu->arch.pmu.created)
 		return -EINVAL;
 
@@ -1022,9 +999,6 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return -ENODEV;
-
 	if (vcpu->arch.pmu.created)
 		return -EBUSY;
 
@@ -1129,9 +1103,6 @@ int kvm_arm_pmu_v3_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 		if (!irqchip_in_kernel(vcpu->kvm))
 			return -EINVAL;
 
-		if (!kvm_vcpu_has_pmu(vcpu))
-			return -ENODEV;
-
 		if (!kvm_arm_pmu_irq_initialized(vcpu))
 			return -ENXIO;
 
@@ -1150,8 +1121,7 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 	case KVM_ARM_VCPU_PMU_V3_INIT:
 	case KVM_ARM_VCPU_PMU_V3_FILTER:
 	case KVM_ARM_VCPU_PMU_V3_SET_PMU:
-		if (kvm_vcpu_has_pmu(vcpu))
-			return 0;
+		return 0;
 	}
 
 	return -ENXIO;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 0a2ce931a946..6e75557bea1d 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1784,12 +1784,14 @@ static int set_id_aa64dfr0_el1(struct kvm_vcpu *vcpu,
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


