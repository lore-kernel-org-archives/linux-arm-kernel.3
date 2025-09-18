Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3F0CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ry0nqfwn2+oHBfNeWnEAyCtR0McexbLDS4VW1RDitwg=; b=hMOhnlRYwzfESr6p99XY2ws6dr
	zjCJckvbvcojsT/OSEnkJOAoDcqrTLCUQDQdZpVLZx1iCFme5krVYmaVtG27eSMBOzak3a7kWFRRM
	geVFacqwDjytZmeAzspFaAfhoxCrWtiGBlVR2wwGtoZBYzADgRUpHbMzNbo7Jra51/u+lHiRYzwxC
	bcH2WE/DeAQ+UA71CQ8rKtpJRiJjpsXgk0V40PF8yT+4nvVCVu1CJ40yRLBOp8V/kaUDKhA5O3rdI
	K9zApCNdRIFTJHX2da/UBPsaBJ2s0IcVSl3lHQUO/76wo0uvXu/bAs2kP3ceVaqU2tBrvvY8LSgUK
	9eDL6kmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGLB-00000000J6p-1Kqa;
	Thu, 18 Sep 2025 15:14:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL8-00000000J2g-0qZs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:14:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92F4A60245;
	Thu, 18 Sep 2025 15:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412F2C4CEEB;
	Thu, 18 Sep 2025 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208469;
	bh=ilXsDS/foRM6sit3FtBx43M37aV0E6//jOyFV8KLEoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=inE4KJnvJsEFRpKkvSS0B0DracHcC1biwESrZSw32Th92WkIZAJkpqDZyeMndzOP3
	 K/fHjaYZ04CLFOdG75LcSzOqXx9AengG0o1bUreEtbRDAUeZ7+J3uptVKizGb7ofXN
	 nqnLW852kEsMrtKB6tnQTsft3KjBPU3iBHbi6QGL4cyEDe14w+KLqB8itPj5gPbmNJ
	 VLeKXg7LN5wDUayIG/33TQF4idYcLRbGrLFsX13KIzWreDmAEOE/HIvBeDloy73VM2
	 lCylXNvc+tFcXoWLGomRKdhXC3icYTpMgX4PeA6SVuS2D/e2b1iAOw3iGhN46xC+oE
	 QWj8qVH/DBs/w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzGL5-00000007TmF-1qef;
	Thu, 18 Sep 2025 15:14:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH v2 06/10] KVM: arm64: Convert HCR_EL2 RES0 handling to compute_reg_res0_bits()
Date: Thu, 18 Sep 2025 16:13:58 +0100
Message-Id: <20250918151402.1665315-7-maz@kernel.org>
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

While HCR_EL2 is unlikely to ever be RES0 (at least when NV is on),
but consistency doesn't hurt, and it can be described in the same
way as the other registers.

Convert it over to the new RES0-computing infrastructure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 2b2a87e31389d..c96d5ff760deb 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -136,6 +136,7 @@ struct reg_feat_map_desc {
 #define FEAT_AA32EL0		ID_AA64PFR0_EL1, EL0, AARCH32
 #define FEAT_AA32EL1		ID_AA64PFR0_EL1, EL1, AARCH32
 #define FEAT_AA64EL1		ID_AA64PFR0_EL1, EL1, IMP
+#define FEAT_AA64EL2		ID_AA64PFR0_EL1, EL2, IMP
 #define FEAT_AA64EL3		ID_AA64PFR0_EL1, EL3, IMP
 #define FEAT_AIE		ID_AA64MMFR3_EL1, AIE, IMP
 #define FEAT_S2POE		ID_AA64MMFR3_EL1, S2POE, IMP
@@ -1005,6 +1006,9 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 	NEEDS_FEAT_FIXED(HCR_EL2_E2H, compute_hcr_e2h),
 };
 
+static const DECLARE_FEAT_MAP(hcr_desc, HCR_EL2,
+			      hcr_feat_map, FEAT_AA64EL2);
+
 static const struct reg_bits_to_feat_map sctlr2_feat_map[] = {
 	NEEDS_FEAT(SCTLR2_EL1_NMEA	|
 		   SCTLR2_EL1_EASE,
@@ -1187,8 +1191,7 @@ void __init check_feature_map(void)
 	check_reg_desc(&hdfgrtr2_desc);
 	check_reg_desc(&hdfgwtr2_desc);
 	check_reg_desc(&hcrx_desc);
-	check_feat_map(hcr_feat_map, ARRAY_SIZE(hcr_feat_map),
-		       HCR_EL2_RES0, "HCR_EL2");
+	check_reg_desc(&hcr_desc);
 	check_feat_map(sctlr2_feat_map, ARRAY_SIZE(sctlr2_feat_map),
 		       SCTLR2_EL1_RES0, "SCTLR2_EL1");
 	check_feat_map(tcr2_el2_feat_map, ARRAY_SIZE(tcr2_el2_feat_map),
@@ -1278,15 +1281,13 @@ static u64 compute_reg_res0_bits(struct kvm *kvm,
 	return res0;
 }
 
-static u64 compute_fixed_bits(struct kvm *kvm,
-			      const struct reg_bits_to_feat_map *map,
-			      int map_size,
-			      u64 *fixed_bits,
-			      unsigned long require,
-			      unsigned long exclude)
+static u64 compute_reg_fixed_bits(struct kvm *kvm,
+				  const struct reg_feat_map_desc *r,
+				  u64 *fixed_bits, unsigned long require,
+				  unsigned long exclude)
 {
-	return __compute_fixed_bits(kvm, map, map_size, fixed_bits,
-				    require | FIXED_VALUE, exclude);
+	return __compute_fixed_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
+				    fixed_bits, require | FIXED_VALUE, exclude);
 }
 
 void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
@@ -1391,12 +1392,9 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
 		*res1 = __HCRX_EL2_RES1;
 		break;
 	case HCR_EL2:
-		mask = compute_fixed_bits(kvm, hcr_feat_map,
-					  ARRAY_SIZE(hcr_feat_map), &fixed,
-					  0, 0);
-		*res0 = compute_res0_bits(kvm, hcr_feat_map,
-					  ARRAY_SIZE(hcr_feat_map), 0, 0);
-		*res0 |= HCR_EL2_RES0 | (mask & ~fixed);
+		mask = compute_reg_fixed_bits(kvm, &hcr_desc, &fixed, 0, 0);
+		*res0 = compute_reg_res0_bits(kvm, &hcr_desc, 0, 0);
+		*res0 |= (mask & ~fixed);
 		*res1 = HCR_EL2_RES1 | (mask & fixed);
 		break;
 	case SCTLR2_EL1:
-- 
2.39.2


