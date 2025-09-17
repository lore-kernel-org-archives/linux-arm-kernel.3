Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AB2CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jX9tMDuInC13pt/+VTBLbt/G1h5PcQSxCVRTYZ3wD7o=; b=HCZL+hcOCpxLlqgBIw2wm2e6NB
	MVrkLcO5BhWWX1W9kIInxh7qLWaFlgWak64gbN1hAIaJBSoy1q09EvRxwbYbznnD8Eg0RasPgyNay
	BhTXHOvItAEEbhB1ohGxFrb3TDWSEgd4CgFsAHilnEL81eA5nX/BIMJ2gA83bPQfHQHCTBC4lVwJf
	DOP4oMnZmZTAdsWNjDzqUppIXyFJSgypGuxcyOP46tZnqWoH+9e/iBD+SDR5UOmBBlyvqbsBZDNWM
	xz0WGoz9tri4IP/yQr3Wihcs5OqR7iHQL2emFwJ30u1lVNXUg9q/8xTvMUO98rxzcdVgbp84Uoc2O
	I+7/bggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvUu-0000000DMtw-45IC;
	Wed, 17 Sep 2025 16:59:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvUd-0000000DMaE-1yi0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Sep 2025 16:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jX9tMDuInC13pt/+VTBLbt/G1h5PcQSxCVRTYZ3wD7o=; b=WEKfnquKdsZnY4CS8nj8mhWQe7
	+Dw+zYKQBjCyS9mLRjHkxkCf4VQtSpsAyUD03aXWnLciy8iZWiSMt0hBXBVuO9J9aFv8/LTjuQKAh
	MY516dZbfs0ZKlEupYMxKzxUCaJ6BrRiACyszhbZy+GZ1f9uHSfC3yuvuZHpm3GDcPqETZGFKLZKU
	bGzLahusVNeAPMh8XABku++5EFPklFyJOC+rnzi+XzkfqVdjMc3w6htEffHSJssjJs70IEIFRE1xV
	gL1+ouK71IqXS5fgSq0c19p/i1XQlPbDDcBUgbm1cwPXF6HI+6L6X4f5vtQgCIOHexAliFXwuBu2r
	l5+vVlSQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvUZ-00000007TcN-2jgD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:58:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4886041AD0;
	Wed, 17 Sep 2025 16:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2702BC4CEF9;
	Wed, 17 Sep 2025 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758128327;
	bh=scTyprIG46wzzk/gBRmZrGtepaqC0rmNAeCBnCv2f18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=juuFVrexea4AiIX8dfoeS3iEFSVaN68SbbwSJjux3kL1m3EAfUu1/iEatD/5BRbzr
	 mqi+F+7FFJBL51EEQbT0wNKnAsWByyYs8FKLutCsRBJKjn7S8gBYsBTHzNA0qI2fXn
	 gtmuv77UbFtPhiQs4uAgo77hqZcBS01Hc2lh6eKnhf2xctkvuZxkE6HrhN7LPXugYZ
	 yjMycru63KJ+gMklf6GTl6CHbZCdhtZsWSHUJi/ScsbjZNrfOrSDbQpsfu9uebSfqd
	 sVYColMzN+X53Qyz6RPDICLbTovHt+T7WkcSXagGBe8RrvZrnCK1yPQmj6OHyERNt0
	 5jC+U6fekI9zQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uyvUT-00000007AQw-1Lgh;
	Wed, 17 Sep 2025 16:58:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH 6/8] KVM: arm64: Enforce absence of FEAT_TCR2 on TCR2_EL2
Date: Wed, 17 Sep 2025 17:58:38 +0100
Message-Id: <20250917165840.1633412-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250917165840.1633412-1-maz@kernel.org>
References: <20250917165840.1633412-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, yangjinqian1@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_175852_100964_9228A9C3 
X-CRM114-Status: GOOD (  11.50  )
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
 arch/arm64/kvm/config.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index b008551fcf7e9..0e6723bd75775 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1024,7 +1024,7 @@ static const
 struct reg_to_feat_map sctlr2_feat_map = FEAT_MAP(SCTLR2_EL1, FEAT_SCTLR2,
 						  sctlr2_bit_feat_map);
 
-static const struct reg_bits_to_feat_map tcr2_el2_feat_map[] = {
+static const struct reg_bits_to_feat_map tcr2_el2_bit_feat_map[] = {
 	NEEDS_FEAT(TCR2_EL2_FNG1	|
 		   TCR2_EL2_FNG0	|
 		   TCR2_EL2_A2,
@@ -1046,6 +1046,10 @@ static const struct reg_bits_to_feat_map tcr2_el2_feat_map[] = {
 	NEEDS_FEAT(TCR2_EL2_PIE, FEAT_S1PIE),
 };
 
+static const
+struct reg_to_feat_map tcr2_el2_feat_map = FEAT_MAP(TCR2_EL2, FEAT_TCR2,
+						    tcr2_el2_bit_feat_map);
+
 static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
 	NEEDS_FEAT(SCTLR_EL1_CP15BEN	|
 		   SCTLR_EL1_ITD	|
@@ -1191,8 +1195,7 @@ void __init check_feature_map(void)
 	check_reg_feat_map(&hcrx_feat_map);
 	check_reg_feat_map(&hcr_feat_map);
 	check_reg_feat_map(&sctlr2_feat_map);
-	check_feat_map(tcr2_el2_feat_map, ARRAY_SIZE(tcr2_el2_feat_map),
-		       TCR2_EL2_RES0, "TCR2_EL2");
+	check_reg_feat_map(&tcr2_el2_feat_map);
 	check_feat_map(sctlr_el1_feat_map, ARRAY_SIZE(sctlr_el1_feat_map),
 		       SCTLR_EL1_RES0, "SCTLR_EL1");
 	check_feat_map(mdcr_el2_feat_map, ARRAY_SIZE(mdcr_el2_feat_map),
@@ -1400,9 +1403,7 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
 		*res1 = SCTLR2_EL1_RES1;
 		break;
 	case TCR2_EL2:
-		*res0 = compute_res0_bits(kvm, tcr2_el2_feat_map,
-					  ARRAY_SIZE(tcr2_el2_feat_map), 0, 0);
-		*res0 |= TCR2_EL2_RES0;
+		*res0 = compute_reg_res0_bits(kvm, &tcr2_el2_feat_map, 0, 0);
 		*res1 = TCR2_EL2_RES1;
 		break;
 	case SCTLR_EL1:
-- 
2.39.2


