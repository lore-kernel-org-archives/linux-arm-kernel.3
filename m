Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954AFC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDP1/De8mXwU/nt2lIGDI5ew+jYcb644zLLMJJyPWj0=; b=q+RDgVAXO5Jp62XnyXhMDOQM0J
	HESeR7rA+ArnVmaV5b4HXwM57e1ggKnNhcQDAcaURwaTzYYKKPvPXlfv5Ai4XlEJ+vKYNn9QPaXBG
	Nk7Ryr6NFAFnRNi6yHARwGB37S4GD8H31+xOiCgE+SvUWlofaGuAX2LSEyZApSFjY+HGwLnicWTiN
	FJboquztp8cue2cxHFzGb7uRC60DhOcSl4m4r+8wUSMRr4VAg4pMBbxY9DUTqP+8cM/NSsWBfoDM8
	phbH4shVrV05PjMqrcg0ieuSxnQv2FpDcuH3AM/nigdIvRoUQj8MF9aIbs8Ic94jSZUJ7VdDZYHTD
	oTIotmyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trd4j-00000002mBr-0LoN;
	Mon, 10 Mar 2025 13:21:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcC6-00000002bXQ-2QE8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:25:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9CE94A45B6C;
	Mon, 10 Mar 2025 12:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E501C4CEEE;
	Mon, 10 Mar 2025 12:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609517;
	bh=ne64BQyhsk+KcVvzIQyD/bMPuLxgslvEtWY9d1eApyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sb8iO9sQsI6GRCGf16a6/575Q472xXlGF9yuVg+gCCYsDghxlT1lCYxy74H/RFa+p
	 t0faNCiXJHRTLwkdUHeS9MVTQpbF7O1Px3jWuPjd08C9aL+bJMARzZmT5sic5MZpo5
	 78+X8htECHBmxAyGsJQxu+r5WCZTCgrO/55MsGpX3CrOIa3LG5IFeg7AEqqjjBF+8T
	 Ja9tRfDrnYNaRNjLTve9sBzEdMIuq94hDQbKab1tx5/7qWEGo/Fbrc61A7aZwLl0I9
	 5jqxoSTgLou1dYX/suPC/D/TJD2yLarEfbq3qI9bSs2ES679t7UQPpJnepIYH7ee+q
	 Nl/LPoaSplKYQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1trcC3-00CAea-BJ;
	Mon, 10 Mar 2025 12:25:15 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 20/23] KVM: arm64: Use FGT feature maps to drive RES0 bits
Date: Mon, 10 Mar 2025 12:25:02 +0000
Message-Id: <20250310122505.2857610-21-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250310122505.2857610-1-maz@kernel.org>
References: <20250310122505.2857610-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052518_764423_6B16CF9E 
X-CRM114-Status: GOOD (  14.52  )
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

Another benefit of mapping bits to features is that it becomes trivial
to define which bits should be handled as RES0.

Let's apply this principle to the guest's view of the FGT registers.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |   1 +
 arch/arm64/kvm/config.c           |  46 +++++++++++
 arch/arm64/kvm/nested.c           | 129 +++---------------------------
 3 files changed, 57 insertions(+), 119 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index c98f7eed68142..9bac3c6800294 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1565,6 +1565,7 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
 
 void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt);
+void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64*res1);
 void check_feature_map(void);
 
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index d39f1f14e3dc4..f88783bd9a2f1 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -616,3 +616,49 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
 
 	kvm->arch.fgu[fgt] = val;
 }
+
+void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *res1)
+{
+	switch (reg) {
+	case HFGRTR_EL2:
+		*res0 = compute_res0_bits(kvm, hfgrtr_feat_map,
+					  ARRAY_SIZE(hfgrtr_feat_map), 0, 0);
+		*res0 |= hfgrtr_masks.res0;
+		*res1 = HFGxTR_EL2_RES1;
+		break;
+	case HFGWTR_EL2:
+		*res0 = compute_res0_bits(kvm, hfgwtr_feat_map,
+					  ARRAY_SIZE(hfgwtr_feat_map), 0, 0);
+		*res0 |= hfgwtr_masks.res0;
+		*res1 = HFGxTR_EL2_RES1;
+		break;
+	case HFGITR_EL2:
+		*res0 = compute_res0_bits(kvm, hfgitr_feat_map,
+					  ARRAY_SIZE(hfgitr_feat_map), 0, 0);
+		*res0 |= hfgitr_masks.res0;
+		*res1 = HFGITR_EL2_RES1;
+		break;
+	case HDFGRTR_EL2:
+		*res0 = compute_res0_bits(kvm, hdfgrtr_feat_map,
+					  ARRAY_SIZE(hdfgrtr_feat_map), 0, 0);
+		*res0 |= hdfgrtr_masks.res0;
+		*res1 = HDFGRTR_EL2_RES1;
+		break;
+	case HDFGWTR_EL2:
+		*res0 = compute_res0_bits(kvm, hdfgwtr_feat_map,
+					  ARRAY_SIZE(hdfgwtr_feat_map), 0, 0);
+		*res0 |= hdfgwtr_masks.res0;
+		*res1 = HDFGWTR_EL2_RES1;
+		break;
+	case HAFGRTR_EL2:
+		*res0 = compute_res0_bits(kvm, hafgrtr_feat_map,
+					  ARRAY_SIZE(hafgrtr_feat_map), 0, 0);
+		*res0 |= hafgrtr_masks.res0;
+		*res1 = HAFGRTR_EL2_RES1;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		*res0 = *res1 = 0;
+		break;
+	}
+}
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 48b8a700de457..74df066f9ab3f 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1081,132 +1081,23 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 	set_sysreg_masks(kvm, HCRX_EL2, res0, res1);
 
 	/* HFG[RW]TR_EL2 */
-	res0 = res1 = 0;
-	if (!(kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_PTRAUTH_ADDRESS) &&
-	      kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_PTRAUTH_GENERIC)))
-		res0 |= (HFGxTR_EL2_APDAKey | HFGxTR_EL2_APDBKey |
-			 HFGxTR_EL2_APGAKey | HFGxTR_EL2_APIAKey |
-			 HFGxTR_EL2_APIBKey);
-	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, LO, IMP))
-		res0 |= (HFGxTR_EL2_LORC_EL1 | HFGxTR_EL2_LOREA_EL1 |
-			 HFGxTR_EL2_LORID_EL1 | HFGxTR_EL2_LORN_EL1 |
-			 HFGxTR_EL2_LORSA_EL1);
-	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, CSV2, CSV2_2) &&
-	    !kvm_has_feat(kvm, ID_AA64PFR1_EL1, CSV2_frac, CSV2_1p2))
-		res0 |= (HFGxTR_EL2_SCXTNUM_EL1 | HFGxTR_EL2_SCXTNUM_EL0);
-	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, GIC, IMP))
-		res0 |= HFGxTR_EL2_ICC_IGRPENn_EL1;
-	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, IMP))
-		res0 |= (HFGxTR_EL2_ERRIDR_EL1 | HFGxTR_EL2_ERRSELR_EL1 |
-			 HFGxTR_EL2_ERXFR_EL1 | HFGxTR_EL2_ERXCTLR_EL1 |
-			 HFGxTR_EL2_ERXSTATUS_EL1 | HFGxTR_EL2_ERXMISCn_EL1 |
-			 HFGxTR_EL2_ERXPFGF_EL1 | HFGxTR_EL2_ERXPFGCTL_EL1 |
-			 HFGxTR_EL2_ERXPFGCDN_EL1 | HFGxTR_EL2_ERXADDR_EL1);
-	if (!kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA))
-		res0 |= HFGxTR_EL2_nACCDATA_EL1;
-	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, GCS, IMP))
-		res0 |= (HFGxTR_EL2_nGCS_EL0 | HFGxTR_EL2_nGCS_EL1);
-	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, SME, IMP))
-		res0 |= (HFGxTR_EL2_nSMPRI_EL1 | HFGxTR_EL2_nTPIDR2_EL0);
-	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, THE, IMP))
-		res0 |= HFGxTR_EL2_nRCWMASK_EL1;
-	if (!kvm_has_s1pie(kvm))
-		res0 |= (HFGxTR_EL2_nPIRE0_EL1 | HFGxTR_EL2_nPIR_EL1);
-	if (!kvm_has_s1poe(kvm))
-		res0 |= (HFGxTR_EL2_nPOR_EL0 | HFGxTR_EL2_nPOR_EL1);
-	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S2POE, IMP))
-		res0 |= HFGxTR_EL2_nS2POR_EL1;
-	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, AIE, IMP))
-		res0 |= (HFGxTR_EL2_nMAIR2_EL1 | HFGxTR_EL2_nAMAIR2_EL1);
-	set_sysreg_masks(kvm, HFGRTR_EL2, res0 | hfgrtr_masks.res0, res1);
-	set_sysreg_masks(kvm, HFGWTR_EL2, res0 | hfgwtr_masks.res0, res1);
+	get_reg_fixed_bits(kvm, HFGRTR_EL2, &res0, &res1);
+	set_sysreg_masks(kvm, HFGRTR_EL2, res0, res1);
+	get_reg_fixed_bits(kvm, HFGWTR_EL2, &res0, &res1);
+	set_sysreg_masks(kvm, HFGWTR_EL2, res0, res1);
 
 	/* HDFG[RW]TR_EL2 */
-	res0 = res1 = 0;
-	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, DoubleLock, IMP))
-		res0 |= HDFGRTR_EL2_OSDLR_EL1;
-	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, IMP))
-		res0 |= (HDFGRTR_EL2_PMEVCNTRn_EL0 | HDFGRTR_EL2_PMEVTYPERn_EL0 |
-			 HDFGRTR_EL2_PMCCFILTR_EL0 | HDFGRTR_EL2_PMCCNTR_EL0 |
-			 HDFGRTR_EL2_PMCNTEN | HDFGRTR_EL2_PMINTEN |
-			 HDFGRTR_EL2_PMOVS | HDFGRTR_EL2_PMSELR_EL0 |
-			 HDFGRTR_EL2_PMMIR_EL1 | HDFGRTR_EL2_PMUSERENR_EL0 |
-			 HDFGRTR_EL2_PMCEIDn_EL0);
-	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, IMP))
-		res0 |= (HDFGRTR_EL2_PMBLIMITR_EL1 | HDFGRTR_EL2_PMBPTR_EL1 |
-			 HDFGRTR_EL2_PMBSR_EL1 | HDFGRTR_EL2_PMSCR_EL1 |
-			 HDFGRTR_EL2_PMSEVFR_EL1 | HDFGRTR_EL2_PMSFCR_EL1 |
-			 HDFGRTR_EL2_PMSICR_EL1 | HDFGRTR_EL2_PMSIDR_EL1 |
-			 HDFGRTR_EL2_PMSIRR_EL1 | HDFGRTR_EL2_PMSLATFR_EL1 |
-			 HDFGRTR_EL2_PMBIDR_EL1);
-	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceVer, IMP))
-		res0 |= (HDFGRTR_EL2_TRC | HDFGRTR_EL2_TRCAUTHSTATUS |
-			 HDFGRTR_EL2_TRCAUXCTLR | HDFGRTR_EL2_TRCCLAIM |
-			 HDFGRTR_EL2_TRCCNTVRn | HDFGRTR_EL2_TRCID |
-			 HDFGRTR_EL2_TRCIMSPECn | HDFGRTR_EL2_TRCOSLSR |
-			 HDFGRTR_EL2_TRCPRGCTLR | HDFGRTR_EL2_TRCSEQSTR |
-			 HDFGRTR_EL2_TRCSSCSRn | HDFGRTR_EL2_TRCSTATR |
-			 HDFGRTR_EL2_TRCVICTLR);
-	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
-		res0 |= (HDFGRTR_EL2_TRBBASER_EL1 | HDFGRTR_EL2_TRBIDR_EL1 |
-			 HDFGRTR_EL2_TRBLIMITR_EL1 | HDFGRTR_EL2_TRBMAR_EL1 |
-			 HDFGRTR_EL2_TRBPTR_EL1 | HDFGRTR_EL2_TRBSR_EL1 |
-			 HDFGRTR_EL2_TRBTRG_EL1);
-	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, BRBE, IMP))
-		res0 |= (HDFGRTR_EL2_nBRBIDR | HDFGRTR_EL2_nBRBCTL |
-			 HDFGRTR_EL2_nBRBDATA);
-	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P2))
-		res0 |= HDFGRTR_EL2_nPMSNEVFR_EL1;
-	set_sysreg_masks(kvm, HDFGRTR_EL2, res0 | hdfgrtr_masks.res0, res1);
-
-	/* Reuse the bits from the read-side and add the write-specific stuff */
-	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, IMP))
-		res0 |= (HDFGWTR_EL2_PMCR_EL0 | HDFGWTR_EL2_PMSWINC_EL0);
-	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceVer, IMP))
-		res0 |= HDFGWTR_EL2_TRCOSLAR;
-	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceFilt, IMP))
-		res0 |= HDFGWTR_EL2_TRFCR_EL1;
-	set_sysreg_masks(kvm, HFGWTR_EL2, res0 | hdfgwtr_masks.res0, res1);
+	get_reg_fixed_bits(kvm, HDFGRTR_EL2, &res0, &res1);
+	set_sysreg_masks(kvm, HDFGRTR_EL2, res0, res1);
+	get_reg_fixed_bits(kvm, HDFGWTR_EL2, &res0, &res1);
+	set_sysreg_masks(kvm, HDFGWTR_EL2, res0, res1);
 
 	/* HFGITR_EL2 */
-	res0 = hfgitr_masks.res0;
-	res1 = HFGITR_EL2_RES1;
-	if (!kvm_has_feat(kvm, ID_AA64ISAR1_EL1, DPB, DPB2))
-		res0 |= HFGITR_EL2_DCCVADP;
-	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, PAN, PAN2))
-		res0 |= (HFGITR_EL2_ATS1E1RP | HFGITR_EL2_ATS1E1WP);
-	if (!kvm_has_feat(kvm, ID_AA64ISAR0_EL1, TLB, OS))
-		res0 |= (HFGITR_EL2_TLBIRVAALE1OS | HFGITR_EL2_TLBIRVALE1OS |
-			 HFGITR_EL2_TLBIRVAAE1OS | HFGITR_EL2_TLBIRVAE1OS |
-			 HFGITR_EL2_TLBIVAALE1OS | HFGITR_EL2_TLBIVALE1OS |
-			 HFGITR_EL2_TLBIVAAE1OS | HFGITR_EL2_TLBIASIDE1OS |
-			 HFGITR_EL2_TLBIVAE1OS | HFGITR_EL2_TLBIVMALLE1OS);
-	if (!kvm_has_feat(kvm, ID_AA64ISAR0_EL1, TLB, RANGE))
-		res0 |= (HFGITR_EL2_TLBIRVAALE1 | HFGITR_EL2_TLBIRVALE1 |
-			 HFGITR_EL2_TLBIRVAAE1 | HFGITR_EL2_TLBIRVAE1 |
-			 HFGITR_EL2_TLBIRVAALE1IS | HFGITR_EL2_TLBIRVALE1IS |
-			 HFGITR_EL2_TLBIRVAAE1IS | HFGITR_EL2_TLBIRVAE1IS |
-			 HFGITR_EL2_TLBIRVAALE1OS | HFGITR_EL2_TLBIRVALE1OS |
-			 HFGITR_EL2_TLBIRVAAE1OS | HFGITR_EL2_TLBIRVAE1OS);
-	if (!kvm_has_feat(kvm, ID_AA64ISAR1_EL1, SPECRES, IMP))
-		res0 |= (HFGITR_EL2_CFPRCTX | HFGITR_EL2_DVPRCTX |
-			 HFGITR_EL2_CPPRCTX);
-	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, BRBE, IMP))
-		res0 |= (HFGITR_EL2_nBRBINJ | HFGITR_EL2_nBRBIALL);
-	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, GCS, IMP))
-		res0 |= (HFGITR_EL2_nGCSPUSHM_EL1 | HFGITR_EL2_nGCSSTR_EL1 |
-			 HFGITR_EL2_nGCSEPP);
-	if (!kvm_has_feat(kvm, ID_AA64ISAR1_EL1, SPECRES, COSP_RCTX))
-		res0 |= HFGITR_EL2_COSPRCTX;
-	if (!kvm_has_feat(kvm, ID_AA64ISAR2_EL1, ATS1A, IMP))
-		res0 |= HFGITR_EL2_ATS1E1A;
+	get_reg_fixed_bits(kvm, HFGITR_EL2, &res0, &res1);
 	set_sysreg_masks(kvm, HFGITR_EL2, res0, res1);
 
 	/* HAFGRTR_EL2 - not a lot to see here */
-	res0 = hafgrtr_masks.res0;
-	res1 = HAFGRTR_EL2_RES1;
-	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, AMU, V1P1))
-		res0 |= ~(res0 | res1);
+	get_reg_fixed_bits(kvm, HAFGRTR_EL2, &res0, &res1);
 	set_sysreg_masks(kvm, HAFGRTR_EL2, res0, res1);
 
 	/* TCR2_EL2 */
-- 
2.39.2


