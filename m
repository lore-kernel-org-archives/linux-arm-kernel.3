Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0158CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgtc5bBmUU3u8rLa9P8me/qUYsj0Ur7FyAzeN+vjfUE=; b=uyQ42stcATPuhdP6/u80Xes5mY
	hp31JOKgCS7wHflDQJL/UbnUiLNocATygqh/DvU3kQdZU2F+bVLRVqp6yYtTJwvEPL/QNrY63qe65
	Zhp9DdNUO53S5I9qlLbHpcuItZlWcqAEAu8jygRFEaGepMQKcTZMDfX5x1yPA2KFPB4AmOSHY1orw
	C3W9Y87mGpXtKp64b94fsMVQ+ZHvCtpdHXPTSCqz3FGSd2rXJiufHVUfPAScHiYhjemh6+ZfULy5q
	gpECsOqob1GSZcWYiI7mxRux/VagPvKu7lSguTzzxLBlEXaLTNP24jACZeLYsmEezEm/VVfBcYvD/
	HWrwp0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGLA-00000000J5r-2rM3;
	Thu, 18 Sep 2025 15:14:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL8-00000000J2j-12MR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:14:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A044760248;
	Thu, 18 Sep 2025 15:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70740C4CEF7;
	Thu, 18 Sep 2025 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208469;
	bh=bkWRQqtYrz4w2lEEIkO4Lvo5LEDT2zg7t3ybpVPswlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FrLpR0ciEZS6I/NGoRrWy3efFsOnQJSNZ/d8aiMIf55zzCGCN9rTqbmM4PxdhAuFP
	 /HdQKVZYGDl766IAI2FX61xQAKONpPcQw+3jXFtX8U+4MLMdJMHIWdd8qw/68NHHZt
	 Ozq34nmiJMFUPCjXHUNKUryIbfu/sKjmvO3JBTGAfJnOHdhX9UZkqrvQ7v8jr49/n4
	 FoVMW02i2Cv9CArYlSK56oFg3eW/8ZSaNsFK2eleS3vArLPLgisXzq/wuOQIFm7sqj
	 QlGtvv1iD/oDfxCaG9VGrVj4hQ36yRMa49IwlrHs/nBnwUtDaOFJ4MxaIhD+mcMP44
	 oAIiQTFqBHj1Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzGL5-00000007TmF-2fd5;
	Thu, 18 Sep 2025 15:14:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH v2 07/10] KVM: arm64: Enforce absence of FEAT_SCTLR2 on SCTLR2_EL{1,2}
Date: Thu, 18 Sep 2025 16:13:59 +0100
Message-Id: <20250918151402.1665315-8-maz@kernel.org>
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

Enforce that SCTLR2_EL{1,2} are RES0 when FEAT_SCTLR2 isn't present.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index c96d5ff760deb..94dfc1320bd36 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1026,6 +1026,9 @@ static const struct reg_bits_to_feat_map sctlr2_feat_map[] = {
 		   FEAT_CPA2),
 };
 
+static const DECLARE_FEAT_MAP(sctlr2_desc, SCTLR2_EL1,
+			      sctlr2_feat_map, FEAT_SCTLR2);
+
 static const struct reg_bits_to_feat_map tcr2_el2_feat_map[] = {
 	NEEDS_FEAT(TCR2_EL2_FNG1	|
 		   TCR2_EL2_FNG0	|
@@ -1192,8 +1195,7 @@ void __init check_feature_map(void)
 	check_reg_desc(&hdfgwtr2_desc);
 	check_reg_desc(&hcrx_desc);
 	check_reg_desc(&hcr_desc);
-	check_feat_map(sctlr2_feat_map, ARRAY_SIZE(sctlr2_feat_map),
-		       SCTLR2_EL1_RES0, "SCTLR2_EL1");
+	check_reg_desc(&sctlr2_desc);
 	check_feat_map(tcr2_el2_feat_map, ARRAY_SIZE(tcr2_el2_feat_map),
 		       TCR2_EL2_RES0, "TCR2_EL2");
 	check_feat_map(sctlr_el1_feat_map, ARRAY_SIZE(sctlr_el1_feat_map),
@@ -1399,9 +1401,7 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
 		break;
 	case SCTLR2_EL1:
 	case SCTLR2_EL2:
-		*res0 = compute_res0_bits(kvm, sctlr2_feat_map,
-					  ARRAY_SIZE(sctlr2_feat_map), 0, 0);
-		*res0 |= SCTLR2_EL1_RES0;
+		*res0 = compute_reg_res0_bits(kvm, &sctlr2_desc, 0, 0);
 		*res1 = SCTLR2_EL1_RES1;
 		break;
 	case TCR2_EL2:
-- 
2.39.2


