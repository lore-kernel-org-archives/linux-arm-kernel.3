Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E1AD75E28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 11:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2s/8KRJVAKxiMRmai3rKrsIxiRRp3j6RS9TwsnwcjBg=; b=eEqcv6rYJEzrF16z+IER7oSZr1
	IxKWb+1ofgjnU2eDoXONfaFn35ERqwfQryaZxxqnsEWnhYmo1DZcSKAFmiiHV6dyw2xIgSO7FlRHg
	cnP2oQh0+gxNzpgsqlNmvII7IYMkBurvzpO/N1By2YI8ypkphsEseaInSkjLTxyy7fc545y/3DOuT
	OCBn+YH3yapANbB9je3SLfbq/qZWDWRC8K51mjeG2abRfBk68xW8Np62XysNXpYbr9n5hGWYVPYVT
	ymvfM2N1kUqgoP5gsoQI4Zm5GQs9D0y+6H0u4vkrmdp9xxtkY3Bu9zwGYAZG2l4Ur8XtfDB8r9Mgo
	VX2H8Eaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERb2-00000002KYb-3Qwa;
	Fri, 22 Nov 2024 11:13:08 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERUm-00000002JSD-2hC8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 11:06:41 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4315eaa3189so17279915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 03:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732273599; x=1732878399; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2s/8KRJVAKxiMRmai3rKrsIxiRRp3j6RS9TwsnwcjBg=;
        b=n+zVNFIE85DwErsrow6U/pa8wKnZfUb0cvCpbxX3jEiRjHSmwfpKqbbeWAsXf0wu+a
         zu3X88ukvfyS6CPV9ed49nhwyjsKca1UM5cMdCpXbwr7KnVIG61x8zb2WHDGavMAHT/s
         qeqZANhnVMBWRO5Nhab4EGR1TsTt2iantUJlUI1MCH3sx1RoHK2j7Z22nd/x0/tvIpUx
         uzDL/HdtungdgHGiPViw7u8B3tRsnGZbxulufCQizj0zp6YZ35oLijoYc7UIIwd03nHj
         JSDNXJq1uvfOaqG6Vx5JLQB5+d1lQDo+S9R9iaDEoEs3XUHYl1q0xj7Q4i7zi6kmidEl
         g0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273599; x=1732878399;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2s/8KRJVAKxiMRmai3rKrsIxiRRp3j6RS9TwsnwcjBg=;
        b=SoqhgegEr/lBkiXNyEoaDeALW2FodMqeOMBHdC6n6R1BCLogZe2b3Eih++nhKNQKAh
         rrdZlFBOUhQbrYfXIsCFdZBZtYbJJDrvvC7dTb439mIk4Ex2Nn2Ff5hiHDskEITWYHHM
         oD1fokh1br4wO3ocOBdJeljNoqfxbtvelqpceFg86Je5AQdGq/1a6eez+rUuWwDa7txN
         Ueb81DwdMMlTGL+BcGV/vwHj7KN4LuKNLknhzsMHXAppSTrfVSIXeYVziF7zBDHRbck1
         h8KfypC1T4qf79QJJmLgABxn2ycSdb55XsY3Kr7T5QXTVvSa8Uyi1bCE+BHmh26QZXXJ
         iOjg==
X-Forwarded-Encrypted: i=1; AJvYcCV5H0alKJbMLgHqD92rom8ssyZHL++N+KpeXz/GRXnMbZhMbxBAXZPL8gygiUSjrTKxRBJP4D7hOCg6QumPZZTZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzqnKz3rMtnj58E4yKeDvlcxVStJPMDoxBaQnqXc06duQYwB0LA
	jFV0t3GvvBerzV9+484DbkAHbCWTToAWw1HV9f+geDApNHaYG4p7+Q1kz9tx7vbTmdk6+/bMlg=
	=
X-Google-Smtp-Source: AGHT+IFEyT4vKoZmjF7IO2HV+HlHbIHy8GHMD0X32IpW0RU2LNY9Og+3IwPMY0UVh21KvGVRxbzu7NjHGw==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:600c:3541:b0:428:1fd6:1642 with SMTP id
 5b1f17b1804b1-433ce41ce03mr166315e9.2.1732273599040; Fri, 22 Nov 2024
 03:06:39 -0800 (PST)
Date: Fri, 22 Nov 2024 11:06:16 +0000
In-Reply-To: <20241122110622.3010118-1-tabba@google.com>
Mime-Version: 1.0
References: <20241122110622.3010118-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241122110622.3010118-7-tabba@google.com>
Subject: [PATCH v2 06/12] KVM: arm64: Set protected VM traps based on its view
 of feature registers
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_030640_703930_A1699990 
X-CRM114-Status: GOOD (  17.11  )
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

Now that the VM's feature id registers are initialized with the
values of the supported features, use those values to determine
which traps to set using kvm_has_feature().

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c     | 85 +++++++++++-------------------
 arch/arm64/kvm/hyp/nvhe/sys_regs.c |  7 ---
 2 files changed, 30 insertions(+), 62 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 4ef03294b2b4..3b4ea97148b9 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -52,9 +52,7 @@ static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 
 static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 {
-	const u64 id_aa64pfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR0_EL1);
-	const u64 id_aa64pfr1 = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR1_EL1);
-	const u64 id_aa64mmfr1 = pvm_read_id_reg(vcpu, SYS_ID_AA64MMFR1_EL1);
+	struct kvm *kvm = vcpu->kvm;
 	u64 val = vcpu->arch.hcr_el2;
 
 	/* No support for AArch32. */
@@ -70,25 +68,20 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 	 */
 	val |= HCR_TACR | HCR_TIDCP | HCR_TID3 | HCR_TID1;
 
-	/* Trap RAS unless all current versions are supported */
-	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_RAS), id_aa64pfr0) <
-	    ID_AA64PFR0_EL1_RAS_V1P1) {
+	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, IMP)) {
 		val |= HCR_TERR | HCR_TEA;
 		val &= ~(HCR_FIEN);
 	}
 
-	/* Trap AMU */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_AMU), id_aa64pfr0))
+	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, AMU, IMP))
 		val &= ~(HCR_AMVOFFEN);
 
-	/* Memory Tagging: Trap and Treat as Untagged if not supported. */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE), id_aa64pfr1)) {
+	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, MTE, IMP)) {
 		val |= HCR_TID5;
 		val &= ~(HCR_DCT | HCR_ATA);
 	}
 
-	/* Trap LOR */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64MMFR1_EL1_LO), id_aa64mmfr1))
+	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, LO, IMP))
 		val |= HCR_TLOR;
 
 	vcpu->arch.hcr_el2 = val;
@@ -96,9 +89,7 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 
 static void pvm_init_traps_cptr(struct kvm_vcpu *vcpu)
 {
-	const u64 id_aa64pfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR0_EL1);
-	const u64 id_aa64pfr1 = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR1_EL1);
-	const u64 id_aa64dfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64DFR0_EL1);
+	struct kvm *kvm = vcpu->kvm;
 	u64 val = vcpu->arch.cptr_el2;
 
 	if (!has_hvhe()) {
@@ -106,12 +97,11 @@ static void pvm_init_traps_cptr(struct kvm_vcpu *vcpu)
 		val &= ~(CPTR_NVHE_EL2_RES0);
 	}
 
-	/* Trap AMU */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_AMU), id_aa64pfr0))
+	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, AMU, IMP))
 		val |= CPTR_EL2_TAM;
 
-	/* Trap SVE */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_SVE), id_aa64pfr0)) {
+	/* SVE can be disabled by userspace even if supported. */
+	if (!vcpu_has_sve(vcpu)) {
 		if (has_hvhe())
 			val &= ~(CPACR_ELx_ZEN);
 		else
@@ -119,14 +109,13 @@ static void pvm_init_traps_cptr(struct kvm_vcpu *vcpu)
 	}
 
 	/* No SME support in KVM. */
-	BUG_ON(FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME), id_aa64pfr1));
+	BUG_ON(kvm_has_feat(kvm, ID_AA64PFR1_EL1, SME, IMP));
 	if (has_hvhe())
 		val &= ~(CPACR_ELx_SMEN);
 	else
 		val |= CPTR_EL2_TSM;
 
-	/* Trap Trace */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_TraceVer), id_aa64dfr0)) {
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceVer, IMP)) {
 		if (has_hvhe())
 			val |= CPACR_EL1_TTA;
 		else
@@ -138,40 +127,33 @@ static void pvm_init_traps_cptr(struct kvm_vcpu *vcpu)
 
 static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
 {
-	const u64 id_aa64dfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64DFR0_EL1);
-	const u64 id_aa64mmfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64MMFR0_EL1);
+	struct kvm *kvm = vcpu->kvm;
 	u64 val = vcpu->arch.mdcr_el2;
 
-	/* Trap/constrain PMU */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMUVer), id_aa64dfr0)) {
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, IMP)) {
 		val |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
 		val &= ~(MDCR_EL2_HPME | MDCR_EL2_MTPME | MDCR_EL2_HPMN_MASK);
 	}
 
-	/* Trap Debug */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_DebugVer), id_aa64dfr0))
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, DebugVer, IMP))
 		val |= MDCR_EL2_TDRA | MDCR_EL2_TDA;
 
-	/* Trap OS Double Lock */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_DoubleLock), id_aa64dfr0))
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, DoubleLock, IMP))
 		val |= MDCR_EL2_TDOSA;
 
-	/* Trap SPE */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMSVer), id_aa64dfr0)) {
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, IMP)) {
 		val |= MDCR_EL2_TPMS;
 		val &= ~(MDCR_EL2_E2PB_MASK << MDCR_EL2_E2PB_SHIFT);
 	}
 
-	/* Trap Trace Filter */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_TraceFilt), id_aa64dfr0))
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceFilt, IMP))
 		val |= MDCR_EL2_TTRF;
 
-	/* Trap External Trace */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_ExtTrcBuff), id_aa64dfr0))
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, ExtTrcBuff, IMP))
 		val |= MDCR_EL2_E2TB_MASK << MDCR_EL2_E2TB_SHIFT;
 
 	/* Trap Debug Communications Channel registers */
-	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64MMFR0_EL1_FGT), id_aa64mmfr0))
+	if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, FGT, IMP))
 		val |= MDCR_EL2_TDCC;
 
 	vcpu->arch.mdcr_el2 = val;
@@ -183,31 +165,24 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
  */
 static int pkvm_check_pvm_cpu_features(struct kvm_vcpu *vcpu)
 {
-	/*
-	 * PAuth is allowed if supported by the system and the vcpu.
-	 * Properly checking for PAuth requires checking various fields in
-	 * ID_AA64ISAR1_EL1 and ID_AA64ISAR2_EL1. The way that fixed config
-	 * is controlled now in pKVM does not easily allow that. This will
-	 * change later to follow the changes upstream wrt fixed configuration
-	 * and nested virt.
-	 */
-	BUILD_BUG_ON(!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_GPI),
-				PVM_ID_AA64ISAR1_ALLOW));
+	struct kvm *kvm = vcpu->kvm;
 
 	/* Protected KVM does not support AArch32 guests. */
-	BUILD_BUG_ON(FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_EL0),
-		PVM_ID_AA64PFR0_ALLOW) != ID_AA64PFR0_EL1_EL0_IMP);
-	BUILD_BUG_ON(FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_EL1),
-		PVM_ID_AA64PFR0_ALLOW) != ID_AA64PFR0_EL1_EL1_IMP);
+	if (kvm_has_feat(kvm, ID_AA64PFR0_EL1, EL0, AARCH32) ||
+	    kvm_has_feat(kvm, ID_AA64PFR0_EL1, EL1, AARCH32))
+		return -EINVAL;
 
 	/*
 	 * Linux guests assume support for floating-point and Advanced SIMD. Do
 	 * not change the trapping behavior for these from the KVM default.
 	 */
-	BUILD_BUG_ON(!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_FP),
-				PVM_ID_AA64PFR0_ALLOW));
-	BUILD_BUG_ON(!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_AdvSIMD),
-				PVM_ID_AA64PFR0_ALLOW));
+	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, FP, IMP) ||
+	    !kvm_has_feat(kvm, ID_AA64PFR0_EL1, AdvSIMD, IMP))
+		return -EINVAL;
+
+	/* No SME support in KVM right now. Check to catch if it changes. */
+	if (kvm_has_feat(kvm, ID_AA64PFR1_EL1, SME, IMP))
+		return -EINVAL;
 
 	return 0;
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 7008e9641f41..3aa76b018f70 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -285,13 +285,6 @@ static bool pvm_access_id_aarch32(struct kvm_vcpu *vcpu,
 		return false;
 	}
 
-	/*
-	 * No support for AArch32 guests, therefore, pKVM has no sanitized copy
-	 * of AArch32 feature id registers.
-	 */
-	BUILD_BUG_ON(FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_EL1),
-		     PVM_ID_AA64PFR0_ALLOW) > ID_AA64PFR0_EL1_EL1_IMP);
-
 	return pvm_access_raz_wi(vcpu, p, r);
 }
 
-- 
2.47.0.371.ga323438b13-goog


