Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AC7CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdQcNmsUrAvNaSU7vRgQ25T5BWjSoAg5rwKu5dzuAyA=; b=3kT2ViNziOXRl3SdhFVSQhYWMM
	9OSuRp8lrEt9BYdO/R16BE09URxpktNwoX4T3XCRUOlhWsig5M++q5PBNUoe/mD56BtuKrFvvueEX
	NF1cZE4cxInhN3afjGlk4O4jOtGWoqJ/nNb6jXSsLHFPrCNENZoyCxQqABg8WruQUQ/ulxTE5iDw/
	cGv09bYQLL5ylie2eIqK92rUpHg3m2YDstE8YAXXC7P+9w0HQGkxWDR4KMNIly8sFlwN3HwEIdfw4
	/vUwTMUgm7rIGqpI+J1cL9DKEyD4F29LeJJyttbLb2Kyy0bprNeXdq6MAbLqnrkgWlIy/6kxlki+1
	a6qTTMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvUd-0000000DMb8-3UbH;
	Wed, 17 Sep 2025 16:58:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvUV-0000000DMVZ-307c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:58:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07C436023C;
	Wed, 17 Sep 2025 16:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C4EC4CEF7;
	Wed, 17 Sep 2025 16:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758128326;
	bh=NLPqKBImEM5oQw3GL20ow1blcuzSCSxrMgiP2h3woVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VyfZv9wsBbfgi9ZBFOaJmElXCjzUV4IveKtCqZvbHAysDX8TFepOhD2jqJI++fH57
	 /2CmdM2cTofY7KRxAHncuU1Qu6ix5RweuXUnMvO6rbBrbeuLaY1sNgyqBOCnKW9GgK
	 nDpaN0Y+soecGxMAfQz0/vQnUcu7qUHNMDOMZr/ncR4+ZswVSsXTYDRsRnz/J/+Vck
	 6ZDsh5G904DVAPJhsSds1C35oSV140Ahilzb1MTQaDFg3ZuxHbH+M1nBKL1NyibTGN
	 OxpvfO7LXs88fWEK88hhCSIBh/yo4RUL65DJT2kllSUVUU+6QZDkHAdwlWMVAk4G0u
	 QYlLZR9XlRFJA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uyvUS-00000007AQw-2jag;
	Wed, 17 Sep 2025 16:58:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH 3/8] KVM: arm64: Enforce absence of FEAT_HCX on HCRX_EL2
Date: Wed, 17 Sep 2025 17:58:35 +0100
Message-Id: <20250917165840.1633412-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250917165840.1633412-1-maz@kernel.org>
References: <20250917165840.1633412-1-maz@kernel.org>
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 05be2b917c8c0..f8e9cfa844266 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -187,6 +187,7 @@ struct reg_to_feat_map {
 #define FEAT_FGT		ID_AA64MMFR0_EL1, FGT, IMP
 #define FEAT_FGT2		ID_AA64MMFR0_EL1, FGT, FGT2
 #define FEAT_MTPMU		ID_AA64DFR0_EL1, MTPMU, IMP
+#define FEAT_HCX		ID_AA64MMFR1_EL1, HCX, IMP
 
 static bool not_feat_aa64el3(struct kvm *kvm)
 {
@@ -893,7 +894,7 @@ struct reg_to_feat_map hdfgwtr2_feat_map = FEAT_MAP_FGT(hdfgwtr2_masks,
 							hdfgwtr2_bit_feat_map,
 							FEAT_FGT2);
 
-static const struct reg_bits_to_feat_map hcrx_feat_map[] = {
+static const struct reg_bits_to_feat_map hcrx_bit_feat_map[] = {
 	NEEDS_FEAT(HCRX_EL2_PACMEn, feat_pauth_lr),
 	NEEDS_FEAT(HCRX_EL2_EnFPM, FEAT_FPMR),
 	NEEDS_FEAT(HCRX_EL2_GCSEn, FEAT_GCS),
@@ -922,6 +923,10 @@ static const struct reg_bits_to_feat_map hcrx_feat_map[] = {
 	NEEDS_FEAT(HCRX_EL2_EnAS0, FEAT_LS64_ACCDATA),
 };
 
+static const
+struct reg_to_feat_map hcrx_feat_map = FEAT_MAP(__HCRX_EL2, FEAT_HCX,
+						hcrx_bit_feat_map);
+
 static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 	NEEDS_FEAT(HCR_EL2_TID0, FEAT_AA32EL0),
 	NEEDS_FEAT_FIXED(HCR_EL2_RW, compute_hcr_rw),
@@ -1174,8 +1179,7 @@ void __init check_feature_map(void)
 	check_reg_feat_map(&hfgitr2_feat_map);
 	check_reg_feat_map(&hdfgrtr2_feat_map);
 	check_reg_feat_map(&hdfgwtr2_feat_map);
-	check_feat_map(hcrx_feat_map, ARRAY_SIZE(hcrx_feat_map),
-		       __HCRX_EL2_RES0, "HCRX_EL2");
+	check_reg_feat_map(&hcrx_feat_map);
 	check_feat_map(hcr_feat_map, ARRAY_SIZE(hcr_feat_map),
 		       HCR_EL2_RES0, "HCR_EL2");
 	check_feat_map(sctlr2_feat_map, ARRAY_SIZE(sctlr2_feat_map),
@@ -1376,9 +1380,7 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
 		*res1 = HDFGWTR2_EL2_RES1;
 		break;
 	case HCRX_EL2:
-		*res0 = compute_res0_bits(kvm, hcrx_feat_map,
-					  ARRAY_SIZE(hcrx_feat_map), 0, 0);
-		*res0 |= __HCRX_EL2_RES0;
+		*res0 = compute_reg_res0_bits(kvm, &hcrx_feat_map, 0, 0);
 		*res1 = __HCRX_EL2_RES1;
 		break;
 	case HCR_EL2:
-- 
2.39.2


