Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17920C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccAT+MplsCVy9sFCwXMh3oSHO7QJuG0HPfD4B1oUtuw=; b=QfWz0EFdF7NnA3V7aN6xzomc+T
	4s9HXOwAMKXeV23cGsdBxMGQ/37oUDB9ZebCFl5ZYYKwRJIIu+y/ZEaDv5oFxE1FM8yRx76uiV4jn
	hUXaeYXAjKIzfLAwou88M2qAth3jntiZeMdkbw4TFRhtho8DHtYlufq1TK9YgvKovrhdf7agrL58B
	ptbmP3ZULHE9rMMpiVV69fX/6TXahrIhYIcOqrSKu+qxkssGB4GKVL+mj2qHLkKwggEg+nENWOLjM
	5TbewSEBpraBaCouO0DSFOKJyOof+sYVufw7J5ktzAKXkWlTntwyWx5gV6bIqL6fcyTuTT3KBYqJR
	F+O53kvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubI7v-000000028nj-2aYm;
	Mon, 14 Jul 2025 12:17:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHm7-000000024rX-3tbz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:55:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C0E361428;
	Mon, 14 Jul 2025 11:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131B5C4CEF8;
	Mon, 14 Jul 2025 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752494115;
	bh=bna4wvszicgMNefOYBgXUx2bw0kd/B9OP3jI567laK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A0WZiJONfXo77B4Erwmxg3HE6MqFsEeEs/1Xe4ty5GfMzvNZs40naBbeNSntIlOHO
	 deVtpnarJvztD3fmO3KfS1C4H40TRKfJspl4KvKfkLXGJu/Y1B0rVbqCKrBZliJRqQ
	 tiOpcDeQS7fiPWF1DvOYl7NTlQNm0OVuxWnTxp/w2QuCWG0Lx2PS4XIAfpSpcgqq4S
	 l2DIhZJfl7hoG6SZLIqF3POL1H/vsheT1Vzz2CywAjCyHITwML07uOtEdTbbYNB7Ua
	 HcgVus3X6NIwgeJEI5g7bug09ce1mTO/iQpjKsUZmu8bsDDDMMGW05jxIXUaxPLrGk
	 5aB8U4I8P8dRQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubHm5-00FVUo-4L;
	Mon, 14 Jul 2025 12:55:13 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 3/5] KVM: arm64: Convert SCTLR_EL1 to config-driven sanitisation
Date: Mon, 14 Jul 2025 12:55:01 +0100
Message-Id: <20250714115503.3334242-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250714115503.3334242-1-maz@kernel.org>
References: <20250714115503.3334242-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

As for other registers, convert the determination of the RES0 bits
affecting SCTLR_EL1 to be driven by a table extracted from the 2025-06
JSON drop

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 106 ++++++++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/nested.c |   5 +-
 2 files changed, 107 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 8265b722d442b..540308429ffe7 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -134,6 +134,20 @@ struct reg_bits_to_feat_map {
 #define FEAT_ASID2		ID_AA64MMFR4_EL1, ASID2, IMP
 #define FEAT_MEC		ID_AA64MMFR3_EL1, MEC, IMP
 #define FEAT_HAFT		ID_AA64MMFR1_EL1, HAFDBS, HAFT
+#define FEAT_BTI		ID_AA64PFR1_EL1, BT, IMP
+#define FEAT_ExS		ID_AA64MMFR0_EL1, EXS, IMP
+#define FEAT_IESB		ID_AA64MMFR2_EL1, IESB, IMP
+#define FEAT_LSE2		ID_AA64MMFR2_EL1, AT, IMP
+#define FEAT_LSMAOC		ID_AA64MMFR2_EL1, LSM, IMP
+#define FEAT_MixedEnd		ID_AA64MMFR0_EL1, BIGEND, IMP
+#define FEAT_MixedEndEL0	ID_AA64MMFR0_EL1, BIGENDEL0, IMP
+#define FEAT_MTE2		ID_AA64PFR1_EL1, MTE, MTE2
+#define FEAT_MTE_ASYNC		ID_AA64PFR1_EL1, MTE_frac, ASYNC
+#define FEAT_MTE_STORE_ONLY	ID_AA64PFR2_EL1, MTESTOREONLY, IMP
+#define FEAT_PAN		ID_AA64MMFR1_EL1, PAN, IMP
+#define FEAT_PAN3		ID_AA64MMFR1_EL1, PAN, PAN3
+#define FEAT_SSBS		ID_AA64PFR1_EL1, SSBS, IMP
+#define FEAT_TIDCP1		ID_AA64MMFR1_EL1, TIDCP1, IMP
 
 static bool not_feat_aa64el3(struct kvm *kvm)
 {
@@ -241,6 +255,16 @@ static bool feat_ebep_pmuv3_ss(struct kvm *kvm)
 	return kvm_has_feat(kvm, FEAT_EBEP) || kvm_has_feat(kvm, FEAT_PMUv3_SS);
 }
 
+static bool feat_mixedendel0(struct kvm *kvm)
+{
+	return kvm_has_feat(kvm, FEAT_MixedEnd) || kvm_has_feat(kvm, FEAT_MixedEndEL0);
+}
+
+static bool feat_mte_async(struct kvm *kvm)
+{
+	return kvm_has_feat(kvm, FEAT_MTE2) && kvm_has_feat_enum(kvm, FEAT_MTE_ASYNC);
+}
+
 static bool compute_hcr_rw(struct kvm *kvm, u64 *bits)
 {
 	/* This is purely academic: AArch32 and NV are mutually exclusive */
@@ -872,6 +896,80 @@ static const struct reg_bits_to_feat_map tcr2_el2_feat_map[] = {
 	NEEDS_FEAT(TCR2_EL2_PIE, FEAT_S1PIE),
 };
 
+static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
+	NEEDS_FEAT(SCTLR_EL1_CP15BEN	|
+		   SCTLR_EL1_ITD	|
+		   SCTLR_EL1_SED,
+		   FEAT_AA32EL0),
+	NEEDS_FEAT(SCTLR_EL1_BT0	|
+		   SCTLR_EL1_BT1,
+		   FEAT_BTI),
+	NEEDS_FEAT(SCTLR_EL1_CMOW, FEAT_CMOW),
+	NEEDS_FEAT(SCTLR_EL1_TSCXT, feat_csv2_2_csv2_1p2),
+	NEEDS_FEAT(SCTLR_EL1_EIS	|
+		   SCTLR_EL1_EOS,
+		   FEAT_ExS),
+	NEEDS_FEAT(SCTLR_EL1_EnFPM, FEAT_FPMR),
+	NEEDS_FEAT(SCTLR_EL1_IESB, FEAT_IESB),
+	NEEDS_FEAT(SCTLR_EL1_EnALS, FEAT_LS64),
+	NEEDS_FEAT(SCTLR_EL1_EnAS0, FEAT_LS64_ACCDATA),
+	NEEDS_FEAT(SCTLR_EL1_EnASR, FEAT_LS64_V),
+	NEEDS_FEAT(SCTLR_EL1_nAA, FEAT_LSE2),
+	NEEDS_FEAT(SCTLR_EL1_LSMAOE	|
+		   SCTLR_EL1_nTLSMD,
+		   FEAT_LSMAOC),
+	NEEDS_FEAT(SCTLR_EL1_EE, FEAT_MixedEnd),
+	NEEDS_FEAT(SCTLR_EL1_E0E, feat_mixedendel0),
+	NEEDS_FEAT(SCTLR_EL1_MSCEn, FEAT_MOPS),
+	NEEDS_FEAT(SCTLR_EL1_ATA0	|
+		   SCTLR_EL1_ATA	|
+		   SCTLR_EL1_TCF0	|
+		   SCTLR_EL1_TCF,
+		   FEAT_MTE2),
+	NEEDS_FEAT(SCTLR_EL1_ITFSB, feat_mte_async),
+	NEEDS_FEAT(SCTLR_EL1_TCSO0	|
+		   SCTLR_EL1_TCSO,
+		   FEAT_MTE_STORE_ONLY),
+	NEEDS_FEAT(SCTLR_EL1_NMI	|
+		   SCTLR_EL1_SPINTMASK,
+		   FEAT_NMI),
+	NEEDS_FEAT(SCTLR_EL1_SPAN, FEAT_PAN),
+	NEEDS_FEAT(SCTLR_EL1_EPAN, FEAT_PAN3),
+	NEEDS_FEAT(SCTLR_EL1_EnDA	|
+		   SCTLR_EL1_EnDB	|
+		   SCTLR_EL1_EnIA	|
+		   SCTLR_EL1_EnIB,
+		   feat_pauth),
+	NEEDS_FEAT(SCTLR_EL1_EnTP2, FEAT_SME),
+	NEEDS_FEAT(SCTLR_EL1_EnRCTX, FEAT_SPECRES),
+	NEEDS_FEAT(SCTLR_EL1_DSSBS, FEAT_SSBS),
+	NEEDS_FEAT(SCTLR_EL1_TIDCP, FEAT_TIDCP1),
+	NEEDS_FEAT(SCTLR_EL1_TME0	|
+		   SCTLR_EL1_TME	|
+		   SCTLR_EL1_TMT0	|
+		   SCTLR_EL1_TMT,
+		   FEAT_TME),
+	NEEDS_FEAT(SCTLR_EL1_TWEDEL	|
+		   SCTLR_EL1_TWEDEn,
+		   FEAT_TWED),
+	NEEDS_FEAT(SCTLR_EL1_UCI	|
+		   SCTLR_EL1_EE		|
+		   SCTLR_EL1_E0E	|
+		   SCTLR_EL1_WXN	|
+		   SCTLR_EL1_nTWE	|
+		   SCTLR_EL1_nTWI	|
+		   SCTLR_EL1_UCT	|
+		   SCTLR_EL1_DZE	|
+		   SCTLR_EL1_I		|
+		   SCTLR_EL1_UMA	|
+		   SCTLR_EL1_SA0	|
+		   SCTLR_EL1_SA		|
+		   SCTLR_EL1_C		|
+		   SCTLR_EL1_A		|
+		   SCTLR_EL1_M,
+		   FEAT_AA64EL1),
+};
+
 static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
 				  int map_size, u64 res0, const char *str)
 {
@@ -905,6 +1003,8 @@ void __init check_feature_map(void)
 		       HCR_EL2_RES0, "HCR_EL2");
 	check_feat_map(tcr2_el2_feat_map, ARRAY_SIZE(tcr2_el2_feat_map),
 		       TCR2_EL2_RES0, "TCR2_EL2");
+	check_feat_map(sctlr_el1_feat_map, ARRAY_SIZE(sctlr_el1_feat_map),
+		       SCTLR_EL1_RES0, "SCTLR_EL1");
 }
 
 static bool idreg_feat_match(struct kvm *kvm, const struct reg_bits_to_feat_map *map)
@@ -1125,6 +1225,12 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
 		*res0 |= TCR2_EL2_RES0;
 		*res1 = TCR2_EL2_RES1;
 		break;
+	case SCTLR_EL1:
+		*res0 = compute_res0_bits(kvm, sctlr_el1_feat_map,
+					  ARRAY_SIZE(sctlr_el1_feat_map), 0, 0);
+		*res0 |= SCTLR_EL1_RES0;
+		*res1 = SCTLR_EL1_RES1;
+		break;
 	default:
 		WARN_ON_ONCE(1);
 		*res0 = *res1 = 0;
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index efb1f2caca626..bca4b5d4b9898 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1667,10 +1667,7 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 	set_sysreg_masks(kvm, TCR2_EL2, res0, res1);
 
 	/* SCTLR_EL1 */
-	res0 = SCTLR_EL1_RES0;
-	res1 = SCTLR_EL1_RES1;
-	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, PAN, PAN3))
-		res0 |= SCTLR_EL1_EPAN;
+	get_reg_fixed_bits(kvm, SCTLR_EL1, &res0, &res1);
 	set_sysreg_masks(kvm, SCTLR_EL1, res0, res1);
 
 	/* MDCR_EL2 */
-- 
2.39.2


