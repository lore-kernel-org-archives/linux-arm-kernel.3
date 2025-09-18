Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1715CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HywRgvrROYFcoe9AvzUgd42VxYdKJK3bC6gbp0/QNxs=; b=sSL5eM+r5KMQps5SbmKsKJLuG0
	wjq+cTIe0s+dwEhVEz07MV9ICNRf1rnGhGG27QyPINvOdhFtLuKW2REizcbHPw9JXxhTKBqAyDrWL
	UoBCMHLvogreqewratjtA5wb3qkE7jOs7XB38zuNvNVUsnyxIRAag1OVhfBtLkc3+exRDTY0XdQe4
	v/ET2TmIMYmu7zKdc8c9e/Z0hM+2zzFFD9EnbPx43PgGDEw8C20MugPQiFoSASwmzDw5KZeU5TcKD
	WZeGRQnGRUMxEztiveZbVLRt0etYylAAnM15CU9Vk6WZ1SE892P/huGonESON96oABesLO9S6iCYY
	GQxgSoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGLb-00000000JSE-3D3g;
	Thu, 18 Sep 2025 15:14:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL8-00000000J32-1mrt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:14:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1F5D60249;
	Thu, 18 Sep 2025 15:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09D7C4CEE7;
	Thu, 18 Sep 2025 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208469;
	bh=4JKWva21hEmO3GDcKRhhJ0dp6bwMOj89EVA7MRjSyVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aQHsCcWB8KZ14t29aq1GCt4MT1Mr7y8BCf5SgvaFFeXfJy5QIn0XZwK96CpbtDRzb
	 kOSWsu5rfPRioHfEnnZizevQbJh3BTNHbKcZnmQrJmaqg2EXnkzAjDe9Bqb6gTWdht
	 2jf836H3J7Hn2QAkOuHv4M7SJspAhoF6XgOCP6t7ZV0cOVoFC38j1WxMnLOgk2ZBaW
	 X44yUpQySfT6bh8oOTIfdQgaC0H7GIyHOsGyJgKo4kYpmio1w+Bf04U36DKhgsvNvl
	 xqC9x6r921h96W9Jj89QHeeD5R3/+Zuwqmw9d2vsNE+KzjkpzdgAG4O2T3p9F+x0tT
	 zsfCZs9LfDR3A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzGL5-00000007TmF-3TmN;
	Thu, 18 Sep 2025 15:14:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH v2 08/10] KVM: arm64: Enforce absence of FEAT_TCR2 on TCR2_EL2
Date: Thu, 18 Sep 2025 16:14:00 +0100
Message-Id: <20250918151402.1665315-9-maz@kernel.org>
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

Enforce that TCR2_EL2 are RES0 when FEAT_TCR2 isn't present.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 94dfc1320bd36..c91b9ed3cb400 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1051,6 +1051,9 @@ static const struct reg_bits_to_feat_map tcr2_el2_feat_map[] = {
 	NEEDS_FEAT(TCR2_EL2_PIE, FEAT_S1PIE),
 };
 
+static const DECLARE_FEAT_MAP(tcr2_el2_desc, TCR2_EL2,
+			      tcr2_el2_feat_map, FEAT_TCR2);
+
 static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
 	NEEDS_FEAT(SCTLR_EL1_CP15BEN	|
 		   SCTLR_EL1_ITD	|
@@ -1196,8 +1199,7 @@ void __init check_feature_map(void)
 	check_reg_desc(&hcrx_desc);
 	check_reg_desc(&hcr_desc);
 	check_reg_desc(&sctlr2_desc);
-	check_feat_map(tcr2_el2_feat_map, ARRAY_SIZE(tcr2_el2_feat_map),
-		       TCR2_EL2_RES0, "TCR2_EL2");
+	check_reg_desc(&tcr2_el2_desc);
 	check_feat_map(sctlr_el1_feat_map, ARRAY_SIZE(sctlr_el1_feat_map),
 		       SCTLR_EL1_RES0, "SCTLR_EL1");
 	check_feat_map(mdcr_el2_feat_map, ARRAY_SIZE(mdcr_el2_feat_map),
@@ -1405,9 +1407,7 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
 		*res1 = SCTLR2_EL1_RES1;
 		break;
 	case TCR2_EL2:
-		*res0 = compute_res0_bits(kvm, tcr2_el2_feat_map,
-					  ARRAY_SIZE(tcr2_el2_feat_map), 0, 0);
-		*res0 |= TCR2_EL2_RES0;
+		*res0 = compute_reg_res0_bits(kvm, &tcr2_el2_desc, 0, 0);
 		*res1 = TCR2_EL2_RES1;
 		break;
 	case SCTLR_EL1:
-- 
2.39.2


