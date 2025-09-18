Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AECCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjOZWoIXF8ke7IuePHTohdxr01bVoz1F0JsG5A5LhE8=; b=CYqokb3GODum+IReJ7U3ixV2Jm
	3fatHlytkyEYlNdYx1f3Ww3ejkyGqBLjacfbZR1AG+T2oqSKsrABCkn9tiaMj5OESXI4JkSyIEUAH
	7DJezBqTX7HZGa4vJUlt8rYO9ugxW5WTsEuA3tWndbRk2tQDwKTM7I6YXAFToSgbd7O5U+h8nQGU2
	cl865mLeXjGdSMNr67Wm41LXzA5KKQDXy5L9b5Fqlfvv1d7/2pysTp7hq2z86nVgxIlgyEVOVcAJY
	l56m3eu15dUJgu+MsBHljIc82tWcKTnuwZVk4n7a8iT+XU6uxmf2te4G1oFMt7a+2Z8Rtbqv5N35E
	YSGhJJUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGLc-00000000JSl-0Fpi;
	Thu, 18 Sep 2025 15:15:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL8-00000000J34-2Wk8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:14:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A8C36024C;
	Thu, 18 Sep 2025 15:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE30C4CEEB;
	Thu, 18 Sep 2025 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208469;
	bh=rTVEKx9DQvqp+P0eKcmld01l0tLrPHWx9n0xI8iQyyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JiMEMf1RUgGb7ICf/8qkOoOvwnduAOUvDm02wKnjt4zWgjDSoj7sqhIhyAsidV9zi
	 jL/0bs6TVQTkboX/HuMMWKP9Ty/RQC+mNBpuTdqJtMFd2xavzR7NNNIYBbY87nQ2M1
	 jjPBPffXFSXPtbnDYbCNiflHqlfKPbKpoarG3rQGPpAYkg1jQQpGj2Or2hmEXbEx3w
	 oyq6jQawQeP1sD4mHXUKb4TYRsdpZQInu58c5DbSx6AuUBZowv4uSIPErReD/cMEl5
	 7eXLjCpVfD0tN0l2vOI48ywoDAATJseJzPtQw0bYjwdEt0MiFS84O2+paYQ3Sg8Tpx
	 rUju9J9LMvE6g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzGL6-00000007TmF-05bq;
	Thu, 18 Sep 2025 15:14:28 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH v2 09/10] KVM: arm64: Convert SCTLR_EL1 RES0 handling to compute_reg_res0_bits()
Date: Thu, 18 Sep 2025 16:14:01 +0100
Message-Id: <20250918151402.1665315-10-maz@kernel.org>
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

While SCTLR_EL1 cannot be RES0, convert it to the same infrastructure
anyway, as it make things cleaner.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index c91b9ed3cb400..7b5c5044d4f64 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1128,6 +1128,9 @@ static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
 		   FEAT_AA64EL1),
 };
 
+static const DECLARE_FEAT_MAP(sctlr_el1_desc, SCTLR_EL1,
+			      sctlr_el1_feat_map, FEAT_AA64EL1);
+
 static const struct reg_bits_to_feat_map mdcr_el2_feat_map[] = {
 	NEEDS_FEAT(MDCR_EL2_EBWE, FEAT_Debugv8p9),
 	NEEDS_FEAT(MDCR_EL2_TDOSA, FEAT_DoubleLock),
@@ -1200,8 +1203,7 @@ void __init check_feature_map(void)
 	check_reg_desc(&hcr_desc);
 	check_reg_desc(&sctlr2_desc);
 	check_reg_desc(&tcr2_el2_desc);
-	check_feat_map(sctlr_el1_feat_map, ARRAY_SIZE(sctlr_el1_feat_map),
-		       SCTLR_EL1_RES0, "SCTLR_EL1");
+	check_reg_desc(&sctlr_el1_desc);
 	check_feat_map(mdcr_el2_feat_map, ARRAY_SIZE(mdcr_el2_feat_map),
 		       MDCR_EL2_RES0, "MDCR_EL2");
 }
@@ -1411,9 +1413,7 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
 		*res1 = TCR2_EL2_RES1;
 		break;
 	case SCTLR_EL1:
-		*res0 = compute_res0_bits(kvm, sctlr_el1_feat_map,
-					  ARRAY_SIZE(sctlr_el1_feat_map), 0, 0);
-		*res0 |= SCTLR_EL1_RES0;
+		*res0 = compute_reg_res0_bits(kvm, &sctlr_el1_desc, 0, 0);
 		*res1 = SCTLR_EL1_RES1;
 		break;
 	case MDCR_EL2:
-- 
2.39.2


