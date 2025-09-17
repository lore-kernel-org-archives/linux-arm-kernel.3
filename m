Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2A4CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ch/h+5Y32QID9Kvz9B8LdYSbL1cKPugQh8L7C2LDyLA=; b=ScAbr9RVlE+Eu2vBnf3kwrBKzh
	0f5GAD0YaGX+7WXAeanajjXGf/x2qugkcA8TeONpB4vWLmrG9IMNAOTWpjC/9Edv7BeLyfHeyxy8+
	12XFoXuVNVK+DCOaFWWZoCBv7f7LYWMBNUFRfDXMsClSoypHsMNton9GX5SNe0xc2dOtnYcfkHRFs
	gWHwTNSzuGXo4HkXAlI6a0FoZYtqHogeq8okFAznrnNxvaiAqW0hcL+D2HdEYGbgvF/JRYln1E84w
	V3ceI8eNjAq4BBnOSnEznHxHqdG/VOP4VolSDi+ZPhGk2MBk0KhcJj2oRmqjfnTNSkoqgBh2d3SHJ
	WlwockDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvUe-0000000DMbe-0W80;
	Wed, 17 Sep 2025 16:58:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvUW-0000000DMWa-1ZdN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:58:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C798F60245;
	Wed, 17 Sep 2025 16:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7755BC4CEF7;
	Wed, 17 Sep 2025 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758128327;
	bh=Kiey6llcR/9OaYihZ/Gd4p8aLsz+gppndFzWm8Yg6Jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pt+E3mU4DZbdi+uC/jKdJQ/sHiY21giwbK8o16iKMtCjgdYfjmhpxWPWl7bI7SkS1
	 Gw41ll6KvukB/h4GwcfqR1qVQOhYM2PAz05XKgelZquSyrLQLgZxq27loCY42hvCDp
	 H/IWnzmbNVpG7fl8VM4GXRgXWuH2n2dDIDUWtxALWQ1iD8CGoMZCPsvPYlUxeYhtxi
	 F2/wIm1AZICWWslMNHNQIY3GGT4tvdwdKat5sdKZ+4N/lb4yXAWHg4Dc3tsC6VnviE
	 ZyNWfDhjZYjZr4fPNtEdrX750s8cq+ZjKtPXkymoAoL5RUZDgp3bVZZwo1iywnyYln
	 1UWFJ7BgvSnFw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uyvUT-00000007AQw-35BH;
	Wed, 17 Sep 2025 16:58:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH 8/8] KVM: arm64: Convert MDCR_EL2 RES0 handling to compute_reg_res0_bits()
Date: Wed, 17 Sep 2025 17:58:40 +0100
Message-Id: <20250917165840.1633412-9-maz@kernel.org>
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
 arch/arm64/kvm/config.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 09af46e16ac30..91e235cfdbffd 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1128,7 +1128,7 @@ static const
 struct reg_to_feat_map sctlr_el1_feat_map = FEAT_MAP(SCTLR_EL1, FEAT_AA64EL1,
 						    sctlr_el1_bit_feat_map);
 
-static const struct reg_bits_to_feat_map mdcr_el2_feat_map[] = {
+static const struct reg_bits_to_feat_map mdcr_el2_bit_feat_map[] = {
 	NEEDS_FEAT(MDCR_EL2_EBWE, FEAT_Debugv8p9),
 	NEEDS_FEAT(MDCR_EL2_TDOSA, FEAT_DoubleLock),
 	NEEDS_FEAT(MDCR_EL2_PMEE, FEAT_EBEP),
@@ -1159,6 +1159,10 @@ static const struct reg_bits_to_feat_map mdcr_el2_feat_map[] = {
 		   FEAT_AA64EL1),
 };
 
+static const
+struct reg_to_feat_map mdcr_el2_feat_map = FEAT_MAP(MDCR_EL2, FEAT_AA64EL2,
+						    mdcr_el2_bit_feat_map);
+
 static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
 				  int map_size, u64 res0, const char *str)
 {
@@ -1201,8 +1205,7 @@ void __init check_feature_map(void)
 	check_reg_feat_map(&sctlr2_feat_map);
 	check_reg_feat_map(&tcr2_el2_feat_map);
 	check_reg_feat_map(&sctlr_el1_feat_map);
-	check_feat_map(mdcr_el2_feat_map, ARRAY_SIZE(mdcr_el2_feat_map),
-		       MDCR_EL2_RES0, "MDCR_EL2");
+	check_reg_feat_map(&mdcr_el2_feat_map);
 }
 
 static bool idreg_feat_match(struct kvm *kvm, const struct reg_bits_to_feat_map *map)
@@ -1414,8 +1417,7 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
 		*res1 = SCTLR_EL1_RES1;
 		break;
 	case MDCR_EL2:
-		*res0 = compute_res0_bits(kvm, mdcr_el2_feat_map,
-					  ARRAY_SIZE(mdcr_el2_feat_map), 0, 0);
+		*res0 = compute_reg_res0_bits(kvm, &mdcr_el2_feat_map, 0, 0);
 		*res0 |= MDCR_EL2_RES0;
 		*res1 = MDCR_EL2_RES1;
 		break;
-- 
2.39.2


