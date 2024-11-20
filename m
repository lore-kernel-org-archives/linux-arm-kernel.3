Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F4CD63928
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2ye01SL04Hi/5TQJr/O/jGfNGyrrRy3c5ysqoOQYuY=; b=DcCBKSyyMe6TqwzxVzhUYGxjg4
	ihKS27AdKfCsSxwHjv/eL3hG37eJQMnnVNrzipM8/7+I8pjYsn0BkXTRopDT71qRPlvAMYngkCHgJ
	LLaU5/YeISrn5PAV7R1GuU0hqLdZk8hxMxeTNwssK972Jh37BYGkuotEoL4saN4NK7hRLS1uUvLws
	8MgWY3UvELULMTxPc+knv7lx2ylGR+hYSCAXt1vYdK6TykgHqtB+Ym7MzVghKnCKSKFBu87E/bLp6
	5VQ0Gf3XjfVynuVDjqW+oFQNhzy6pcbS5V1I4KsoX/LYz31WWoovU7q5sP0F07s9n2khQrZp7+NMK
	0c8mZKJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiNI-0000000F71T-3tFv;
	Wed, 20 Nov 2024 10:55:56 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiKV-0000000F6QD-0kdi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:53:04 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea8901dff1so83057817b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 02:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732099981; x=1732704781; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B2ye01SL04Hi/5TQJr/O/jGfNGyrrRy3c5ysqoOQYuY=;
        b=TlJyeC7GIvpUwhfnUdV2ehy6BQ5QbogLfmyVk8KLORUe3BHm5oGyq259qwDkYGf2mS
         bBE/cdb61bLzxvH6oMN2NHh/ipdtZDnJpULXIggPhr0lZIMx25eLwGsSNbw49m53rqsF
         0yjXBIkea42y95w7M1jfwTp+jwqokAzWEaY0h4GpwrsyJ5PAmtk1dDtlcchYqpSrJozu
         3Pq4kbdJ5ZiESTl7UCsdMrrgtLE45C2ZWxsEfE2JcGsV6hnIt0dlZPr00HqrkMpsPVDL
         IX2aHWxY91Q/N02FPWQGqKQkled7R52wqBb9EEvNwUw10ln6upStfX7kbb2BfzfRoIFZ
         pqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732099981; x=1732704781;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2ye01SL04Hi/5TQJr/O/jGfNGyrrRy3c5ysqoOQYuY=;
        b=Cc123Sd2QTZfCNSUszB3//BxC5SdREUoKQFzMAYIPmfKrZVnG/6utZLreNGJBC7+K8
         XJ4YDYVreZFjlXJRnv17cg7pjrTL1a4fx426rmAVM9zBTZRwHE+MSHnkSTlHuVW6OZhj
         JFmagRxs3xCp3bHpQQZzOFWbKLJtvSfKZg66F3dQpttO/PeoVuZ+qnGAAufKYgjjcw3A
         CczsoNWfQenl3n/WddKPLgQb6CLa7Zt1qrJtwC9W9gVyOZf+dzDqLOSaOOUXD8/sQl8q
         r8/2IpC5/gE3HhqVMMd8F+CZfbAWfza1jNNualyhobCyDqon45NULnQkwk+0CLLNzQgY
         eZRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3iCcV9lRelrqUBTFPo3oDEsDEkBufM8dDtDTaZ8YoRKRHmyOK3z7G4eV2iY6EnnqnhBFnvISpoorU5dqcfUkh@lists.infradead.org
X-Gm-Message-State: AOJu0YwqmLAT9ibCWJbuGJI4pLo1BtgTlSTs5jBLClJWpVBL+zH6KrXv
	AZ3ygDbRl1JgersLtto3gUCo0IrB/lmRl2ikEVbfSGsA8tW1hXWJC73soC7e6U6hyDZAuYj72Q=
	=
X-Google-Smtp-Source: AGHT+IHA+adB5zG/bvSF3+1Ze4xFNx6KzRB7BxJlwmHw04skO/eObuZYriLE9Ky5AW9lFwKL20aLq9q/Ig==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a81:ad16:0:b0:62c:f976:a763 with SMTP id
 00721157ae682-6eebd0c2111mr142957b3.1.1732099981509; Wed, 20 Nov 2024
 02:53:01 -0800 (PST)
Date: Wed, 20 Nov 2024 10:52:44 +0000
In-Reply-To: <20241120105254.2842020-1-tabba@google.com>
Mime-Version: 1.0
References: <20241120105254.2842020-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241120105254.2842020-3-tabba@google.com>
Subject: [PATCH v1 02/12] KVM: arm64: Group setting traps for protected VMs by
 control register
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_025303_222074_3196AD1C 
X-CRM114-Status: GOOD (  18.91  )
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

Group setting protected vm traps by control register rather than
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


