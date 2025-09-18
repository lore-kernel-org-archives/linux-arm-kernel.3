Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899A0CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPQ+jq7gdlmaymrd9+ifrZ3lYfHJ1YJKU6l7xeDs1j8=; b=V4nMEgJX1I1H9xYHOS30+Z4Ngi
	LzzbFH8BC2HTSbdbtHPHYsdSyWbuD9202lTI55eaxKkhJr6HV6ESqeCZeIU/kV2q5+pq9TYY+ASbN
	nGlcAoi0oZlKjP9iyMpKDotN1USzZMPMCBD0GlKXAt/LjSY3dNvKBIilxM6gGW0bt7br9V2Itx4OX
	f5sgIeVQk/Pv186CvYEUeQNGvtlx/mBsnhLSX0zugb/P4/2SKTZiYQOvwAT/q5CdsOMJgnRXyxEg/
	U00CBHXmu9t5Zb+IHIP9Z4Ku40/nXuPj7m7J7TsRp8gA+gx+wMnOlaIQAW4EVCDVNOPM8CfutOaTA
	Clnse00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL9-00000000J4T-3Emm;
	Thu, 18 Sep 2025 15:14:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL7-00000000J2R-35IL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A9DC60228;
	Thu, 18 Sep 2025 15:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE69C4CEFC;
	Thu, 18 Sep 2025 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208468;
	bh=8WKV7KgMmhCiDqAOfGnyqNC3BJsGbsgkg5xXNidLs9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VO32RYxB1/9Gq3OKZfWtZ0bZA7vlcB2vysychdsVQcDwg6pVF82wM3QLiMRJUo2y6
	 mbSdte8eRRr33Kp+6kw0wnaVHJuw0eaAvmNSkLWGh9S6WzvOKwkWJmMkHvIW87gFzA
	 O+/byZ7feHG1AsJb8UeFmjN1blsiAMU8yvgzNqnX+GRTiYG+xDzaTFX+oLwlgHZBqT
	 Pgg6/t2dq0J4fDQP6a0X8IqOLOjewfw7j22nfoXjLISljv+I2UQviq5XdPyll4QsGj
	 Q4rBriPp11amz2Mobq0Z53E3ZqdqTqMvKYqCIkHziTVWix0KvfMpVNgqjF/HwzQwFN
	 KHiP7TyDxdM7g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzGL5-00000007TmF-04lE;
	Thu, 18 Sep 2025 15:14:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH v2 04/10] KVM: arm64: Enforce absence of FEAT_FGT2 on FGT2 registers
Date: Thu, 18 Sep 2025 16:13:56 +0100
Message-Id: <20250918151402.1665315-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250918151402.1665315-1-maz@kernel.org>
References: <20250918151402.1665315-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, yangjinqian1@huawei.com
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

Similarly to the FEAT_FGT registers, add the dependency between
the registers and the controlling feature.

WHile we're at it, add the missing checks for the RES0 vs valid
bit overlap.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 67 +++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index bb38364d55e9a..6828bcdc038d8 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -212,6 +212,7 @@ struct reg_feat_map_desc {
 #define FEAT_SSBS		ID_AA64PFR1_EL1, SSBS, IMP
 #define FEAT_TIDCP1		ID_AA64MMFR1_EL1, TIDCP1, IMP
 #define FEAT_FGT		ID_AA64MMFR0_EL1, FGT, IMP
+#define FEAT_FGT2		ID_AA64MMFR0_EL1, FGT, FGT2
 #define FEAT_MTPMU		ID_AA64DFR0_EL1, MTPMU, IMP
 
 static bool not_feat_aa64el3(struct kvm *kvm)
@@ -788,6 +789,9 @@ static const struct reg_bits_to_feat_map hfgitr2_feat_map[] = {
 	NEEDS_FEAT(HFGITR2_EL2_TSBCSYNC, FEAT_TRBEv1p1)
 };
 
+static const DECLARE_FEAT_MAP_FGT(hfgitr2_desc, hfgitr2_masks,
+				  hfgitr2_feat_map, FEAT_FGT2);
+
 static const struct reg_bits_to_feat_map hfgrtr2_feat_map[] = {
 	NEEDS_FEAT(HFGRTR2_EL2_nPFAR_EL1, FEAT_PFAR),
 	NEEDS_FEAT(HFGRTR2_EL2_nERXGSR_EL1, FEAT_RASv2),
@@ -807,6 +811,9 @@ static const struct reg_bits_to_feat_map hfgrtr2_feat_map[] = {
 	NEEDS_FEAT(HFGRTR2_EL2_nRCWSMASK_EL1, FEAT_THE),
 };
 
+static const DECLARE_FEAT_MAP_FGT(hfgrtr2_desc, hfgrtr2_masks,
+				  hfgrtr2_feat_map, FEAT_FGT2);
+
 static const struct reg_bits_to_feat_map hfgwtr2_feat_map[] = {
 	NEEDS_FEAT(HFGWTR2_EL2_nPFAR_EL1, FEAT_PFAR),
 	NEEDS_FEAT(HFGWTR2_EL2_nACTLRALIAS_EL1	|
@@ -825,6 +832,9 @@ static const struct reg_bits_to_feat_map hfgwtr2_feat_map[] = {
 	NEEDS_FEAT(HFGWTR2_EL2_nRCWSMASK_EL1, FEAT_THE),
 };
 
+static const DECLARE_FEAT_MAP_FGT(hfgwtr2_desc, hfgwtr2_masks,
+				  hfgwtr2_feat_map, FEAT_FGT2);
+
 static const struct reg_bits_to_feat_map hdfgrtr2_feat_map[] = {
 	NEEDS_FEAT(HDFGRTR2_EL2_nMDSELR_EL1, FEAT_Debugv8p9),
 	NEEDS_FEAT(HDFGRTR2_EL2_nPMECR_EL1, feat_ebep_pmuv3_ss),
@@ -855,6 +865,9 @@ static const struct reg_bits_to_feat_map hdfgrtr2_feat_map[] = {
 	NEEDS_FEAT(HDFGRTR2_EL2_nTRBMPAM_EL1, feat_trbe_mpam),
 };
 
+static const DECLARE_FEAT_MAP_FGT(hdfgrtr2_desc, hdfgrtr2_masks,
+				  hdfgrtr2_feat_map, FEAT_FGT2);
+
 static const struct reg_bits_to_feat_map hdfgwtr2_feat_map[] = {
 	NEEDS_FEAT(HDFGWTR2_EL2_nMDSELR_EL1, FEAT_Debugv8p9),
 	NEEDS_FEAT(HDFGWTR2_EL2_nPMECR_EL1, feat_ebep_pmuv3_ss),
@@ -883,6 +896,10 @@ static const struct reg_bits_to_feat_map hdfgwtr2_feat_map[] = {
 	NEEDS_FEAT(HDFGWTR2_EL2_nTRBMPAM_EL1, feat_trbe_mpam),
 };
 
+static const DECLARE_FEAT_MAP_FGT(hdfgwtr2_desc, hdfgwtr2_masks,
+				  hdfgwtr2_feat_map, FEAT_FGT2);
+
+
 static const struct reg_bits_to_feat_map hcrx_feat_map[] = {
 	NEEDS_FEAT(HCRX_EL2_PACMEn, feat_pauth_lr),
 	NEEDS_FEAT(HCRX_EL2_EnFPM, FEAT_FPMR),
@@ -1159,6 +1176,11 @@ void __init check_feature_map(void)
 	check_reg_desc(&hdfgrtr_desc);
 	check_reg_desc(&hdfgwtr_desc);
 	check_reg_desc(&hafgrtr_desc);
+	check_reg_desc(&hfgrtr2_desc);
+	check_reg_desc(&hfgwtr2_desc);
+	check_reg_desc(&hfgitr2_desc);
+	check_reg_desc(&hdfgrtr2_desc);
+	check_reg_desc(&hdfgwtr2_desc);
 	check_feat_map(hcrx_feat_map, ARRAY_SIZE(hcrx_feat_map),
 		       __HCRX_EL2_RES0, "HCRX_EL2");
 	check_feat_map(hcr_feat_map, ARRAY_SIZE(hcr_feat_map),
@@ -1289,25 +1311,20 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
 					     0, NEVER_FGU);
 		break;
 	case HFGRTR2_GROUP:
-		val |= compute_res0_bits(kvm, hfgrtr2_feat_map,
-					 ARRAY_SIZE(hfgrtr2_feat_map),
-					 0, NEVER_FGU);
-		val |= compute_res0_bits(kvm, hfgwtr2_feat_map,
-					 ARRAY_SIZE(hfgwtr2_feat_map),
-					 0, NEVER_FGU);
+		val |= compute_reg_res0_bits(kvm, &hfgrtr2_desc,
+					     0, NEVER_FGU);
+		val |= compute_reg_res0_bits(kvm, &hfgwtr2_desc,
+					     0, NEVER_FGU);
 		break;
 	case HFGITR2_GROUP:
-		val |= compute_res0_bits(kvm, hfgitr2_feat_map,
-					 ARRAY_SIZE(hfgitr2_feat_map),
-					 0, NEVER_FGU);
+		val |= compute_reg_res0_bits(kvm, &hfgitr2_desc,
+					     0, NEVER_FGU);
 		break;
 	case HDFGRTR2_GROUP:
-		val |= compute_res0_bits(kvm, hdfgrtr2_feat_map,
-					 ARRAY_SIZE(hdfgrtr2_feat_map),
-					 0, NEVER_FGU);
-		val |= compute_res0_bits(kvm, hdfgwtr2_feat_map,
-					 ARRAY_SIZE(hdfgwtr2_feat_map),
-					 0, NEVER_FGU);
+		val |= compute_reg_res0_bits(kvm, &hdfgrtr2_desc,
+					     0, NEVER_FGU);
+		val |= compute_reg_res0_bits(kvm, &hdfgwtr2_desc,
+					     0, NEVER_FGU);
 		break;
 	default:
 		BUG();
@@ -1346,33 +1363,23 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
 		*res1 = HAFGRTR_EL2_RES1;
 		break;
 	case HFGRTR2_EL2:
-		*res0 = compute_res0_bits(kvm, hfgrtr2_feat_map,
-					  ARRAY_SIZE(hfgrtr2_feat_map), 0, 0);
-		*res0 |= hfgrtr2_masks.res0;
+		*res0 = compute_reg_res0_bits(kvm, &hfgrtr2_desc, 0, 0);
 		*res1 = HFGRTR2_EL2_RES1;
 		break;
 	case HFGWTR2_EL2:
-		*res0 = compute_res0_bits(kvm, hfgwtr2_feat_map,
-					  ARRAY_SIZE(hfgwtr2_feat_map), 0, 0);
-		*res0 |= hfgwtr2_masks.res0;
+		*res0 = compute_reg_res0_bits(kvm, &hfgwtr2_desc, 0, 0);
 		*res1 = HFGWTR2_EL2_RES1;
 		break;
 	case HFGITR2_EL2:
-		*res0 = compute_res0_bits(kvm, hfgitr2_feat_map,
-					  ARRAY_SIZE(hfgitr2_feat_map), 0, 0);
-		*res0 |= hfgitr2_masks.res0;
+		*res0 = compute_reg_res0_bits(kvm, &hfgitr2_desc, 0, 0);
 		*res1 = HFGITR2_EL2_RES1;
 		break;
 	case HDFGRTR2_EL2:
-		*res0 = compute_res0_bits(kvm, hdfgrtr2_feat_map,
-					  ARRAY_SIZE(hdfgrtr2_feat_map), 0, 0);
-		*res0 |= hdfgrtr2_masks.res0;
+		*res0 = compute_reg_res0_bits(kvm, &hdfgrtr2_desc, 0, 0);
 		*res1 = HDFGRTR2_EL2_RES1;
 		break;
 	case HDFGWTR2_EL2:
-		*res0 = compute_res0_bits(kvm, hdfgwtr2_feat_map,
-					  ARRAY_SIZE(hdfgwtr2_feat_map), 0, 0);
-		*res0 |= hdfgwtr2_masks.res0;
+		*res0 = compute_reg_res0_bits(kvm, &hdfgwtr2_desc, 0, 0);
 		*res1 = HDFGWTR2_EL2_RES1;
 		break;
 	case HCRX_EL2:
-- 
2.39.2


