Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A48DCAC5AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXmRyyxXbTkWwbTuFrXGXKV/+aH+3401cAUMElrcaqg=; b=weHlpUFhpdBv8PsqD47ZGaYDWT
	fYwKbucTrEA4FPHvN7N65sIiimM+puZIHNDvTPvEKmOG1I7yuEEu5jg0Nzxs/uTCWTZ7HpXalVwFk
	odhs2zb3FAMbRDfcuNtvt3+KhWzl88tMPnT1VyIlqki6atFDElsPJIeC/UV4fYaC2eZZEEhECyOPg
	J4oeclO5H2ddiF4wNebFUONSz4vlh40r+PIRYkvB/RI+dv3Wvni5WwR5XdZ8X1dZKo6nn/HmtF7ix
	p5z5nihp3Q6uIFjH/AZZ+U5vKxvvRL/owjuMt1143h5nl3DEcKJRSlAYhHRJp9NfaTMMptX4AkuYx
	9crCahDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGLA-00000000J6J-4Acm;
	Thu, 18 Sep 2025 15:14:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL8-00000000J2f-0puM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:14:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AAD46023C;
	Thu, 18 Sep 2025 15:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3866FC4CEE7;
	Thu, 18 Sep 2025 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208469;
	bh=eupJ06qxqUgb5TzZ8DopOro3ckZwNVxHqqwxA+gfRPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mVgiE2vykyaN2upImbYB+dknQb5kqcBGSXSHjB5lgvOHplixqJZkLIrAHamIvnww5
	 bsqACzrWGidF4FoHJ5vVktN+Kju6YRUzXf4WTryfT8GSBLuNVX1NSYKqMFZ1qxwMYO
	 wMzVtODwhhSP0qkLZ58w3GcJmI0wHAzNa/5Y7xjPBPviCVu3+OAbHiOL/IAIMQkLg0
	 LKyRTwlOTATIFUhnNp/WLsiOigMz8I32c7hkaA3Yvi4tilmlv33UxEL1Lg4Aqzm29V
	 rZ2zsFeWOdOe0IhYacsSpjdAT0RylkdR8gcBUZJ0QXEC4q4wJpBrJd/717AqDSED0s
	 J/R1p7GXn6XwQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzGL5-00000007TmF-0wC1;
	Thu, 18 Sep 2025 15:14:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH v2 05/10] KVM: arm64: Enforce absence of FEAT_HCX on HCRX_EL2
Date: Thu, 18 Sep 2025 16:13:57 +0100
Message-Id: <20250918151402.1665315-6-maz@kernel.org>
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

Add the dependency between the HCRX_EL2 register and FEAT_HCX.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 6828bcdc038d8..2b2a87e31389d 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -214,6 +214,7 @@ struct reg_feat_map_desc {
 #define FEAT_FGT		ID_AA64MMFR0_EL1, FGT, IMP
 #define FEAT_FGT2		ID_AA64MMFR0_EL1, FGT, FGT2
 #define FEAT_MTPMU		ID_AA64DFR0_EL1, MTPMU, IMP
+#define FEAT_HCX		ID_AA64MMFR1_EL1, HCX, IMP
 
 static bool not_feat_aa64el3(struct kvm *kvm)
 {
@@ -929,6 +930,10 @@ static const struct reg_bits_to_feat_map hcrx_feat_map[] = {
 	NEEDS_FEAT(HCRX_EL2_EnAS0, FEAT_LS64_ACCDATA),
 };
 
+
+static const DECLARE_FEAT_MAP(hcrx_desc, __HCRX_EL2,
+			      hcrx_feat_map, FEAT_HCX);
+
 static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 	NEEDS_FEAT(HCR_EL2_TID0, FEAT_AA32EL0),
 	NEEDS_FEAT_FIXED(HCR_EL2_RW, compute_hcr_rw),
@@ -1181,8 +1186,7 @@ void __init check_feature_map(void)
 	check_reg_desc(&hfgitr2_desc);
 	check_reg_desc(&hdfgrtr2_desc);
 	check_reg_desc(&hdfgwtr2_desc);
-	check_feat_map(hcrx_feat_map, ARRAY_SIZE(hcrx_feat_map),
-		       __HCRX_EL2_RES0, "HCRX_EL2");
+	check_reg_desc(&hcrx_desc);
 	check_feat_map(hcr_feat_map, ARRAY_SIZE(hcr_feat_map),
 		       HCR_EL2_RES0, "HCR_EL2");
 	check_feat_map(sctlr2_feat_map, ARRAY_SIZE(sctlr2_feat_map),
@@ -1383,9 +1387,7 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
 		*res1 = HDFGWTR2_EL2_RES1;
 		break;
 	case HCRX_EL2:
-		*res0 = compute_res0_bits(kvm, hcrx_feat_map,
-					  ARRAY_SIZE(hcrx_feat_map), 0, 0);
-		*res0 |= __HCRX_EL2_RES0;
+		*res0 = compute_reg_res0_bits(kvm, &hcrx_desc, 0, 0);
 		*res1 = __HCRX_EL2_RES1;
 		break;
 	case HCR_EL2:
-- 
2.39.2


