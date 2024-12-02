Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7169DD7832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WafFMpKXruhPY/wS7bqG4euEvXcSbXGRH72JqapojtU=; b=WioFsicAm1DffjKon19slBX2UP
	m06ViJKM5OJ04lGVv8cPYOcxOX+zBEQVSfi1t5txCiH9ID8ZGHmQqHJ/mvMP9HSJZixr/TRyoEPcw
	Imheq1JTPudGJr9zNidsZrtcp/LAEda9HcBM5OUOT4yhkNjo9I+JaS0buIEbqZP4VaVGamIb6QTVk
	sE/GKsb2O7HfjJLk+nyZsaPbp72QNQ1K1zJ7WjFtGsjOUiiMzzE6kWrNk8oDCQxkDYVKGE1e7pTA7
	O5bvo+ERpB2ESjWIx6nd7DmiO5R2K1qKWFgVhMMPnLwOuBK2NiEu3BxRe/IADf020me9BQsBc4K2S
	v1akpl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8nC-00000006kSh-1eUj;
	Mon, 02 Dec 2024 15:56:58 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8eL-00000006iRL-26Vk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:47:50 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-434a90fecfeso32789305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733154468; x=1733759268; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WafFMpKXruhPY/wS7bqG4euEvXcSbXGRH72JqapojtU=;
        b=2557lgfINYzho8LmCgGMfbmLfW64+fH7gZHW6CcEtIPof0RWNgT1Ee/24Us6/UpFb8
         KzpFn44U00i47xmSZwsbKcPwT0XXvl9ctTZ9RLrX+5DbbUKV38Tzq+d7tbQ9DyqSlSEK
         Pmv250D/A3rM90JZOYdDe9GCkwvshdbQRMZlEXALvjng1tKkhwxa5fRkNRhOzXxNfu5C
         UoF7g4dxnPXO6YsgS0C92MvsvcKrlNAw0HSpgCf5Hj7DPRqVIRlfrTDJbH4MvtRixzri
         vOkWrbXjY48Qbshvv+i2jQIl1rwyU+FQ2PaaDubuVWENhXEAxN79DADzf8e8J+6jmRKI
         3OLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154468; x=1733759268;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WafFMpKXruhPY/wS7bqG4euEvXcSbXGRH72JqapojtU=;
        b=QFOQ+1D9+CQsvYcCJl5jpC+tQ+ovo4Zcpb8AZErPSrY0NjsXoDY/7iXhlrVddMZ20E
         PC1sJUYh1NOz7MS/DujBSPkQbX4GtkkSkQatcDCMygdVG7AidmbPBgjFi8c4A55//dn9
         WMDBCReYMoQZQyBcTqe4iZtj7hWsR1S7SFCjbmkKXApmbG+7SjlZHKuhaCr2nVB8Q08k
         Sf+pF8lZSL5SYWoSrdMWa0LM9lVEcZMcwc2fAC9FNrXbetfZEdNX8bgtcKVl+BHSDA22
         D+WpnQl4+3BuPxCKpShXREiuhA9/wPSAh4fPSXF8qqTjIiErVxSZTJp9Nhm88tXsA0It
         aI/g==
X-Forwarded-Encrypted: i=1; AJvYcCX6L94UGJcO1v0+Vc+ZxVY11oNpHQztN3V+HiZhuyrMO1oizKxxKxsnjufwmPwCFR2UnwgMcmQfw74qjYZMi2pZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwkMJx5c3ERPascsbiAgucrmjrwVzW8ZunEafXWgIWATBbR+5Q3
	vhlYEVePplKjwA93QcVRyPMVtrCIc86xIFF7ljYtw9roEZjgR9KnLpheFyeKYF07aSSrNW/q3w=
	=
X-Google-Smtp-Source: AGHT+IHPT8U6CKlSOS07e21PoVhoMtFzv/DA8fQsWUcQa7msDiIPBVI4ac8qucp3iR95+ge+R4LR3jgAqA==
X-Received: from wmsk36.prod.google.com ([2002:a05:600c:1ca4:b0:434:a102:fb6c])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3ba6:b0:434:9e63:faff
 with SMTP id 5b1f17b1804b1-434a9dbc41bmr211082505e9.2.1733154467976; Mon, 02
 Dec 2024 07:47:47 -0800 (PST)
Date: Mon,  2 Dec 2024 15:47:29 +0000
In-Reply-To: <20241202154742.3611749-1-tabba@google.com>
Mime-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202154742.3611749-3-tabba@google.com>
Subject: [PATCH v4 02/14] KVM: arm64: Group setting traps for protected VMs by
 control register
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074749_544569_3DDBEC7C 
X-CRM114-Status: GOOD (  19.45  )
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

Group setting protected VM traps by control register rather than
feature id register, since some trap values (e.g., PAuth), depend
on more than one feature id register.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 317 +++++++++++++++------------------
 1 file changed, 144 insertions(+), 173 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 76a70fee7647..1744574e79b2 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -23,233 +23,204 @@ unsigned int kvm_arm_vmid_bits;
 
 unsigned int kvm_host_sve_max_vl;
 
-/*
- * Set trap register values based on features in ID_AA64PFR0.
- */
-static void pvm_init_traps_aa64pfr0(struct kvm_vcpu *vcpu)
+static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 {
-	const u64 feature_ids = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR0_EL1);
-	u64 hcr_set = HCR_RW;
-	u64 hcr_clear = 0;
-	u64 cptr_set = 0;
-	u64 cptr_clear = 0;
-
-	/* Protected KVM does not support AArch32 guests. */
-	BUILD_BUG_ON(FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_EL0),
-		PVM_ID_AA64PFR0_ALLOW) != ID_AA64PFR0_EL1_EL0_IMP);
-	BUILD_BUG_ON(FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_EL1),
-		PVM_ID_AA64PFR0_ALLOW) != ID_AA64PFR0_EL1_EL1_IMP);
-
-	/*
-	 * Linux guests assume support for floating-point and Advanced SIMD. Do
-	 * not change the trapping behavior for these from the KVM default.
-	 */
-	BUILD_BUG_ON(!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_FP),
-				PVM_ID_AA64PFR0_ALLOW));
-	BUILD_BUG_ON(!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_AdvSIMD),
-				PVM_ID_AA64PFR0_ALLOW));
+	vcpu->arch.hcr_el2 = HCR_GUEST_FLAGS;
 
 	if (has_hvhe())
-		hcr_set |= HCR_E2H;
+		vcpu->arch.hcr_el2 |= HCR_E2H;
 
-	/* Trap RAS unless all current versions are supported */
-	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_RAS), feature_ids) <
-	    ID_AA64PFR0_EL1_RAS_V1P1) {
-		hcr_set |= HCR_TERR | HCR_TEA;
-		hcr_clear |= HCR_FIEN;
+	if (cpus_have_final_cap(ARM64_HAS_RAS_EXTN)) {
+		/* route synchronous external abort exceptions to EL2 */
+		vcpu->arch.hcr_el2 |= HCR_TEA;
+		/* trap error record accesses */
+		vcpu->arch.hcr_el2 |= HCR_TERR;
 	}
 
-	/* Trap AMU */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_AMU), feature_ids)) {
-		hcr_clear |= HCR_AMVOFFEN;
-		cptr_set |= CPTR_EL2_TAM;
-	}
+	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
+		vcpu->arch.hcr_el2 |= HCR_FWB;
 
-	/* Trap SVE */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_SVE), feature_ids)) {
-		if (has_hvhe())
-			cptr_clear |= CPACR_ELx_ZEN;
-		else
-			cptr_set |= CPTR_EL2_TZ;
-	}
+	if (cpus_have_final_cap(ARM64_HAS_EVT) &&
+	    !cpus_have_final_cap(ARM64_MISMATCHED_CACHE_TYPE))
+		vcpu->arch.hcr_el2 |= HCR_TID4;
+	else
+		vcpu->arch.hcr_el2 |= HCR_TID2;
 
-	vcpu->arch.hcr_el2 |= hcr_set;
-	vcpu->arch.hcr_el2 &= ~hcr_clear;
-	vcpu->arch.cptr_el2 |= cptr_set;
-	vcpu->arch.cptr_el2 &= ~cptr_clear;
+	if (vcpu_has_ptrauth(vcpu))
+		vcpu->arch.hcr_el2 |= (HCR_API | HCR_APK);
 }
 
-/*
- * Set trap register values based on features in ID_AA64PFR1.
- */
-static void pvm_init_traps_aa64pfr1(struct kvm_vcpu *vcpu)
+static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 {
-	const u64 feature_ids = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR1_EL1);
-	u64 hcr_set = 0;
-	u64 hcr_clear = 0;
+	const u64 id_aa64pfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR0_EL1);
+	const u64 id_aa64pfr1 = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR1_EL1);
+	const u64 id_aa64mmfr1 = pvm_read_id_reg(vcpu, SYS_ID_AA64MMFR1_EL1);
+	u64 val = vcpu->arch.hcr_el2;
+
+	/* No support for AArch32. */
+	val |= HCR_RW;
+
+	if (has_hvhe())
+		val |= HCR_E2H;
+
+	/*
+	 * Always trap:
+	 * - Feature id registers: to control features exposed to guests
+	 * - Implementation-defined features
+	 */
+	val |= HCR_TACR | HCR_TIDCP | HCR_TID3 | HCR_TID1;
+
+	/* Trap RAS unless all current versions are supported */
+	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_RAS), id_aa64pfr0) <
+	    ID_AA64PFR0_EL1_RAS_V1P1) {
+		val |= HCR_TERR | HCR_TEA;
+		val &= ~(HCR_FIEN);
+	}
+
+	/* Trap AMU */
+	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_AMU), id_aa64pfr0))
+		val &= ~(HCR_AMVOFFEN);
 
 	/* Memory Tagging: Trap and Treat as Untagged if not supported. */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE), feature_ids)) {
-		hcr_set |= HCR_TID5;
-		hcr_clear |= HCR_DCT | HCR_ATA;
+	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE), id_aa64pfr1)) {
+		val |= HCR_TID5;
+		val &= ~(HCR_DCT | HCR_ATA);
 	}
 
-	vcpu->arch.hcr_el2 |= hcr_set;
-	vcpu->arch.hcr_el2 &= ~hcr_clear;
+	/* Trap LOR */
+	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64MMFR1_EL1_LO), id_aa64mmfr1))
+		val |= HCR_TLOR;
+
+	vcpu->arch.hcr_el2 = val;
 }
 
-/*
- * Set trap register values based on features in ID_AA64DFR0.
- */
-static void pvm_init_traps_aa64dfr0(struct kvm_vcpu *vcpu)
+static void pvm_init_traps_cptr(struct kvm_vcpu *vcpu)
 {
-	const u64 feature_ids = pvm_read_id_reg(vcpu, SYS_ID_AA64DFR0_EL1);
-	u64 mdcr_set = 0;
-	u64 mdcr_clear = 0;
-	u64 cptr_set = 0;
+	const u64 id_aa64pfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR0_EL1);
+	const u64 id_aa64pfr1 = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR1_EL1);
+	const u64 id_aa64dfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64DFR0_EL1);
+	u64 val = vcpu->arch.cptr_el2;
 
-	/* Trap/constrain PMU */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMUVer), feature_ids)) {
-		mdcr_set |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
-		mdcr_clear |= MDCR_EL2_HPME | MDCR_EL2_MTPME |
-			      MDCR_EL2_HPMN_MASK;
+	if (!has_hvhe()) {
+		val |= CPTR_NVHE_EL2_RES1;
+		val &= ~(CPTR_NVHE_EL2_RES0);
 	}
 
-	/* Trap Debug */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_DebugVer), feature_ids))
-		mdcr_set |= MDCR_EL2_TDRA | MDCR_EL2_TDA | MDCR_EL2_TDE;
-
-	/* Trap OS Double Lock */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_DoubleLock), feature_ids))
-		mdcr_set |= MDCR_EL2_TDOSA;
+	/* Trap AMU */
+	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_AMU), id_aa64pfr0))
+		val |= CPTR_EL2_TAM;
 
-	/* Trap SPE */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMSVer), feature_ids)) {
-		mdcr_set |= MDCR_EL2_TPMS;
-		mdcr_clear |= MDCR_EL2_E2PB_MASK << MDCR_EL2_E2PB_SHIFT;
+	/* Trap SVE */
+	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_SVE), id_aa64pfr0)) {
+		if (has_hvhe())
+			val &= ~(CPACR_ELx_ZEN);
+		else
+			val |= CPTR_EL2_TZ;
 	}
 
-	/* Trap Trace Filter */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_TraceFilt), feature_ids))
-		mdcr_set |= MDCR_EL2_TTRF;
+	/* No SME support in KVM. */
+	BUG_ON(FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME), id_aa64pfr1));
+	if (has_hvhe())
+		val &= ~(CPACR_ELx_SMEN);
+	else
+		val |= CPTR_EL2_TSM;
 
 	/* Trap Trace */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_TraceVer), feature_ids)) {
+	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_TraceVer), id_aa64dfr0)) {
 		if (has_hvhe())
-			cptr_set |= CPACR_EL1_TTA;
+			val |= CPACR_EL1_TTA;
 		else
-			cptr_set |= CPTR_EL2_TTA;
+			val |= CPTR_EL2_TTA;
 	}
 
-	/* Trap External Trace */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_ExtTrcBuff), feature_ids))
-		mdcr_clear |= MDCR_EL2_E2TB_MASK << MDCR_EL2_E2TB_SHIFT;
-
-	vcpu->arch.mdcr_el2 |= mdcr_set;
-	vcpu->arch.mdcr_el2 &= ~mdcr_clear;
-	vcpu->arch.cptr_el2 |= cptr_set;
-}
-
-/*
- * Set trap register values based on features in ID_AA64MMFR0.
- */
-static void pvm_init_traps_aa64mmfr0(struct kvm_vcpu *vcpu)
-{
-	const u64 feature_ids = pvm_read_id_reg(vcpu, SYS_ID_AA64MMFR0_EL1);
-	u64 mdcr_set = 0;
-
-	/* Trap Debug Communications Channel registers */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64MMFR0_EL1_FGT), feature_ids))
-		mdcr_set |= MDCR_EL2_TDCC;
-
-	vcpu->arch.mdcr_el2 |= mdcr_set;
+	vcpu->arch.cptr_el2 = val;
 }
 
-/*
- * Set trap register values based on features in ID_AA64MMFR1.
- */
-static void pvm_init_traps_aa64mmfr1(struct kvm_vcpu *vcpu)
-{
-	const u64 feature_ids = pvm_read_id_reg(vcpu, SYS_ID_AA64MMFR1_EL1);
-	u64 hcr_set = 0;
-
-	/* Trap LOR */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64MMFR1_EL1_LO), feature_ids))
-		hcr_set |= HCR_TLOR;
-
-	vcpu->arch.hcr_el2 |= hcr_set;
-}
-
-/*
- * Set baseline trap register values.
- */
-static void pvm_init_trap_regs(struct kvm_vcpu *vcpu)
+static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
 {
-	const u64 hcr_trap_feat_regs = HCR_TID3;
-	const u64 hcr_trap_impdef = HCR_TACR | HCR_TIDCP | HCR_TID1;
-
-	/*
-	 * Always trap:
-	 * - Feature id registers: to control features exposed to guests
-	 * - Implementation-defined features
-	 */
-	vcpu->arch.hcr_el2 |= hcr_trap_feat_regs | hcr_trap_impdef;
+	const u64 id_aa64dfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64DFR0_EL1);
+	const u64 id_aa64mmfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64MMFR0_EL1);
+	u64 val = vcpu->arch.mdcr_el2;
 
-	/* Clear res0 and set res1 bits to trap potential new features. */
-	vcpu->arch.hcr_el2 &= ~(HCR_RES0);
-	vcpu->arch.mdcr_el2 &= ~(MDCR_EL2_RES0);
-	if (!has_hvhe()) {
-		vcpu->arch.cptr_el2 |= CPTR_NVHE_EL2_RES1;
-		vcpu->arch.cptr_el2 &= ~(CPTR_NVHE_EL2_RES0);
+	/* Trap/constrain PMU */
+	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMUVer), id_aa64dfr0)) {
+		val |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
+		val &= ~(MDCR_EL2_HPME | MDCR_EL2_MTPME | MDCR_EL2_HPMN_MASK);
 	}
-}
 
-static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
-{
-	vcpu->arch.hcr_el2 = HCR_GUEST_FLAGS;
+	/* Trap Debug */
+	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_DebugVer), id_aa64dfr0))
+		val |= MDCR_EL2_TDRA | MDCR_EL2_TDA;
 
-	if (has_hvhe())
-		vcpu->arch.hcr_el2 |= HCR_E2H;
+	/* Trap OS Double Lock */
+	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_DoubleLock), id_aa64dfr0))
+		val |= MDCR_EL2_TDOSA;
 
-	if (cpus_have_final_cap(ARM64_HAS_RAS_EXTN)) {
-		/* route synchronous external abort exceptions to EL2 */
-		vcpu->arch.hcr_el2 |= HCR_TEA;
-		/* trap error record accesses */
-		vcpu->arch.hcr_el2 |= HCR_TERR;
+	/* Trap SPE */
+	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMSVer), id_aa64dfr0)) {
+		val |= MDCR_EL2_TPMS;
+		val &= ~(MDCR_EL2_E2PB_MASK << MDCR_EL2_E2PB_SHIFT);
 	}
 
-	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
-		vcpu->arch.hcr_el2 |= HCR_FWB;
+	/* Trap Trace Filter */
+	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_TraceFilt), id_aa64dfr0))
+		val |= MDCR_EL2_TTRF;
 
-	if (cpus_have_final_cap(ARM64_HAS_EVT) &&
-	    !cpus_have_final_cap(ARM64_MISMATCHED_CACHE_TYPE))
-		vcpu->arch.hcr_el2 |= HCR_TID4;
-	else
-		vcpu->arch.hcr_el2 |= HCR_TID2;
+	/* Trap External Trace */
+	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_ExtTrcBuff), id_aa64dfr0))
+		val |= MDCR_EL2_E2TB_MASK << MDCR_EL2_E2TB_SHIFT;
 
-	if (vcpu_has_ptrauth(vcpu))
-		vcpu->arch.hcr_el2 |= (HCR_API | HCR_APK);
+	/* Trap Debug Communications Channel registers */
+	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64MMFR0_EL1_FGT), id_aa64mmfr0))
+		val |= MDCR_EL2_TDCC;
+
+	vcpu->arch.mdcr_el2 = val;
 }
 
 /*
  * Initialize trap register values in protected mode.
  */
-static void pkvm_vcpu_init_traps(struct kvm_vcpu *vcpu)
+static void pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
+	struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
+
 	vcpu->arch.cptr_el2 = kvm_get_reset_cptr_el2(vcpu);
 	vcpu->arch.mdcr_el2 = 0;
 
 	pkvm_vcpu_reset_hcr(vcpu);
 
-	if ((!vcpu_is_protected(vcpu)))
+	if ((!pkvm_hyp_vcpu_is_protected(hyp_vcpu)))
 		return;
 
-	pvm_init_trap_regs(vcpu);
-	pvm_init_traps_aa64pfr0(vcpu);
-	pvm_init_traps_aa64pfr1(vcpu);
-	pvm_init_traps_aa64dfr0(vcpu);
-	pvm_init_traps_aa64mmfr0(vcpu);
-	pvm_init_traps_aa64mmfr1(vcpu);
+	/*
+	 * PAuth is allowed if supported by the system and the vcpu.
+	 * Properly checking for PAuth requires checking various fields in
+	 * ID_AA64ISAR1_EL1 and ID_AA64ISAR2_EL1. The way that fixed config
+	 * is controlled now in pKVM does not easily allow that. This will
+	 * change later to follow the changes upstream wrt fixed configuration
+	 * and nested virt.
+	 */
+	BUILD_BUG_ON(!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_GPI),
+				PVM_ID_AA64ISAR1_ALLOW));
+
+	/* Protected KVM does not support AArch32 guests. */
+	BUILD_BUG_ON(FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_EL0),
+		PVM_ID_AA64PFR0_ALLOW) != ID_AA64PFR0_EL1_EL0_IMP);
+	BUILD_BUG_ON(FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_EL1),
+		PVM_ID_AA64PFR0_ALLOW) != ID_AA64PFR0_EL1_EL1_IMP);
+
+	/*
+	 * Linux guests assume support for floating-point and Advanced SIMD. Do
+	 * not change the trapping behavior for these from the KVM default.
+	 */
+	BUILD_BUG_ON(!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_FP),
+				PVM_ID_AA64PFR0_ALLOW));
+	BUILD_BUG_ON(!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_AdvSIMD),
+				PVM_ID_AA64PFR0_ALLOW));
+
+	pvm_init_traps_hcr(vcpu);
+	pvm_init_traps_cptr(vcpu);
+	pvm_init_traps_mdcr(vcpu);
 }
 
 /*
@@ -448,7 +419,7 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 
 	pkvm_vcpu_init_sve(hyp_vcpu, host_vcpu);
 	pkvm_vcpu_init_ptrauth(hyp_vcpu);
-	pkvm_vcpu_init_traps(&hyp_vcpu->vcpu);
+	pkvm_vcpu_init_traps(hyp_vcpu);
 done:
 	if (ret)
 		unpin_host_vcpu(host_vcpu);
-- 
2.47.0.338.g60cca15819-goog


