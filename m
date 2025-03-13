Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA8BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 07:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emEcgI1IcFZcczsFk7v4KbqV5pyU76mkqQgr8+I1+js=; b=i3quEH9aQEBgqrif6hgDFurUN2
	ryPUU6mlEM7Ac46kEpcBavcoCUuwa/FhdVA3hK7dz314EidzGYSMUlC5quwAWyqNAw4y7g1P5Rc8O
	sdh2fz0Lh4o+2h5CYfDhFGkNir+JgC2HbzAIBnDrv/fpSSR5X+8l9PxBPlHbZKQC25tieCYYjA51Q
	uqfUmvp9X/Fr8eGSk/iMajRL1qzpydOX4WN3/6Psp0sMAaYRcfr0YXNOv2nXiXKMqHI6QPtzJ0+v4
	LbTLyk/hGMxQPZBNKOTqmL9UkPVf38/U6HEkHpj8RjYzP+hT4RMTgt8a7ouRGXm58DLuQhKl7HJ/t
	jWoUISrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tscat-0000000AI3f-2bxa;
	Thu, 13 Mar 2025 07:03:03 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tscW6-0000000AGyC-3Nsp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 06:58:07 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2241053582dso15434205ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 23:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741849086; x=1742453886; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emEcgI1IcFZcczsFk7v4KbqV5pyU76mkqQgr8+I1+js=;
        b=oZMxlDMJ/j8Cfgva6+govv7BLl/F+p2qeXd/+8MCpe/BU1JF96ezFYmpHZ/XoLho5O
         awilBISq/RJ8UHygucoe5aQqt0OweMUc47rjbilDo5/Ve6wvTRUflpnDAScGoB5uad1U
         Ns1Zax1tPdWmiK7z7wzfpfLq2QUAjeHJlEToT7Ehu4r7r5azfhwXOdWrUPqeRvx3mX/c
         4HatZ5roPQvjo7wPQB6zOYznAT6tOIH7/l3HNRFo4UMez3LA0VR8nUo0IrLlf66XLb/s
         YO7ZRR1g2ScQa+jOmy66ZqanNEB4rJyVk2A7SRec/eVVff8eRxaRFx8CuUEnrZ7hxUI/
         /J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849086; x=1742453886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emEcgI1IcFZcczsFk7v4KbqV5pyU76mkqQgr8+I1+js=;
        b=WkNAuwJ+orZIqWkIDgYqkbta2K9kCvB/J0lTn+uR9JtvdEDh13IHAMD7d/RWA+XK6Q
         9+BGKDWiTlt+JS6jRsY0quZZ1O7wdrUcG/cbap6ohTaOjvTFT0WtkgZfbSRHipxdF75I
         cDw/jkURW8z0Bce7WIlgqkJ/xn6a5QD/9yb55o5Sqd9yeHxOfDtz62Hf1GUO7cUv+zMy
         trfFThvHk2XOZaX5qmi7evnGkKbBcGJtNx0RUxKB6UaAXdh2qBbqZ7gznGmj2fuioVWd
         nNIMm5Sak34e3eT8Rf0MtxGcY/0PMyxkaT0kTtYc//iSEFMoN9MWBDieO3gwbDumundn
         oeeA==
X-Gm-Message-State: AOJu0Yz9yPkJ5+j2eI9Qrzd314kMW0J+CXqwfLufI2GBaCv/qtTaGHb6
	Ae8yGUsgm13jdcRz0i3amvU/gL9W18HwUdsg76Et5/8yq9TaW/lqRhBcAKDljjo=
X-Gm-Gg: ASbGncuz9amk8cFFHMBg8BM+xbOivfRYKL5SXK/99HRggzzg5tmo4QXp8F3NoiTrsrD
	yZ/DucUiHxSufikPCeex3Q4AkJDo/huKGJpGg1vYfA8NXRiZHeCvQoGSULoy2VB9oXWWAJCktcZ
	+OO6N0D+L3OnqQKdOkcExDGLQFqgrETo/dII3NWOa8f+GQVcrdKySfH8hhgt6SEPdjKFEM8MeF+
	zuIULV7thEL6T4xHt/X1+qpfS+DYwnmb5xNpnOp16bOCBCDOaW/FiOpUEjdrGOEpaBkZCUw/nCL
	+WZnuTD07mSt5XP2wh0a0y3fFpnZO/O9GR8DXEqyiOprSMCF
X-Google-Smtp-Source: AGHT+IEBQV8sxGuSmnbE6/nC9EVPLKg/DvEGA12lj+yaW9V3WHmb2Osqgs4iyFBmmenFAgCKYwG/xQ==
X-Received: by 2002:a17:902:ce83:b0:21f:c67:a68a with SMTP id d9443c01a7336-22428a890c3mr411961125ad.31.1741849085952;
        Wed, 12 Mar 2025 23:58:05 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c6bd5ae4sm6400565ad.229.2025.03.12.23.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 23:58:05 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 13 Mar 2025 15:57:43 +0900
Subject: [PATCH v4 2/7] KVM: arm64: PMU: Assume PMU presence in pmu-emul.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-pmc-v4-2-2c976827118c@daynix.com>
References: <20250313-pmc-v4-0-2c976827118c@daynix.com>
In-Reply-To: <20250313-pmc-v4-0-2c976827118c@daynix.com>
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
X-CRM114-CacheID: sfid-20250312_235806_868927_2732649B 
X-CRM114-Status: GOOD (  18.65  )
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
 arch/arm64/kvm/arm.c      |  8 +++++---
 arch/arm64/kvm/pmu-emul.c | 25 +------------------------
 arch/arm64/kvm/sys_regs.c |  6 ++++--
 3 files changed, 10 insertions(+), 29 deletions(-)

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
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index e3e82b66e226..3dd0b479c6fd 100644
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


