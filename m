Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4694ACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEF5vUcWdBFprmodmZo5FIaZFP8vmqZpiAwG6+PIi4o=; b=A3BWMAO2+BaBSh/UGv/qym2f/d
	OwHtc9e1TcbPYk7htnhPbTwt57wIISl9JEUPabr6J0bBipjjVqWVVSP7YwG9vM2usXgVRp1n6FwYX
	YLKORIVb2u6pSbq5xlPVIU2rEAUqr8xmQWZhZs/Oq5KFu0KNWv5tlv2hLysMydy24a+urXYLcfO4R
	GwW2TG+5KY3V22I44IzKmjmDpxGVhILtPjyXqs/tTaphJ04BzZG4yKHLtN3kGe0hT19WXDmSUxSDu
	+wzMeLiXFiV/zqbnbbYlC8Z8mCg21BssQ8VJ72Egv6fKg0BJDNRkIgOLhiQMq1DLod3seUcDU9u1A
	7K2R0PWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvUu-0000000DMtI-2i71;
	Wed, 17 Sep 2025 16:59:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvUd-0000000DMa3-0r3K
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Sep 2025 16:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HEF5vUcWdBFprmodmZo5FIaZFP8vmqZpiAwG6+PIi4o=; b=oPZ1fYf9eT1HDZg/B5J/ex9AGc
	dHGGuOPL06bTE6fPkMj+cdZIljVICZt1SlOPFdZvl4emosKhsd9QTcM8nIht7ROkLMANUT/pLTW9P
	2TXZ39ZdDxsy3PI0iU5nKQuBqLPjKrAHDk/lvdJsXnNmKbJTgpIz0eAz18i6Mvc846DVaOVBI3xed
	3aQSEccg0DxcqWLGrL95D0nBICja2Oh3YyqMI9t6xZTYO9s2mqLou4SZZ6/crvjMFLXEfVsMmCCLI
	vgEEShT1RHpMTetSn1QpIxMwPtw/MeyU3FJj/HEj4F8OOyfrkVcOEiytYjn45t/ebzCC5WYSLik/B
	6UUM+VyA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvUZ-00000007TcO-2hWx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:58:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F81044E0B;
	Wed, 17 Sep 2025 16:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBE0C4CEFB;
	Wed, 17 Sep 2025 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758128327;
	bh=d+w3TjPvq3SS133fV6Sh+nZK6LHsjMEfCPRqIKDB9F0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LObE7gn/2oQ9thof55DcvUVU8XCcofs1b3KKKB1+b/lxmpoHZwjk5s8+zlhBW2X9y
	 N6mV59OP0xZccwtVcDpeSIriWIXm/DcO+o/21CEZ2n04+R9xXb34fMcfA3JrOpNn6v
	 BuHRjPD0f7dwp4a0W9zDhnyTMmW6dtc8cCRmr3KS20bG+/nbGnOUKcq6flKUDvF8az
	 iDoisbJ9NQpPL9g6+8J7T/irzS+hi4w9mlpqWhYNQP8Ei/E7K2Jq6LWXIPxORfbl/k
	 vzvDRzENjQMHKZaqhhFfDc79Fok6gRSuVNXwuomU4STzkRHiLaJJ6a8kqZzDWWaURx
	 JzV9etaLiMHBA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uyvUT-00000007AQw-2EJn;
	Wed, 17 Sep 2025 16:58:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH 7/8] KVM: arm64: Convert SCTLR_EL1 RES0 handling to compute_reg_res0_bits()
Date: Wed, 17 Sep 2025 17:58:39 +0100
Message-Id: <20250917165840.1633412-8-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250917_175852_106233_CE76897B 
X-CRM114-Status: GOOD (  11.42  )
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
index 0e6723bd75775..09af46e16ac30 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1050,7 +1050,7 @@ static const
 struct reg_to_feat_map tcr2_el2_feat_map = FEAT_MAP(TCR2_EL2, FEAT_TCR2,
 						    tcr2_el2_bit_feat_map);
 
-static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
+static const struct reg_bits_to_feat_map sctlr_el1_bit_feat_map[] = {
 	NEEDS_FEAT(SCTLR_EL1_CP15BEN	|
 		   SCTLR_EL1_ITD	|
 		   SCTLR_EL1_SED,
@@ -1124,6 +1124,10 @@ static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
 		   FEAT_AA64EL1),
 };
 
+static const
+struct reg_to_feat_map sctlr_el1_feat_map = FEAT_MAP(SCTLR_EL1, FEAT_AA64EL1,
+						    sctlr_el1_bit_feat_map);
+
 static const struct reg_bits_to_feat_map mdcr_el2_feat_map[] = {
 	NEEDS_FEAT(MDCR_EL2_EBWE, FEAT_Debugv8p9),
 	NEEDS_FEAT(MDCR_EL2_TDOSA, FEAT_DoubleLock),
@@ -1196,8 +1200,7 @@ void __init check_feature_map(void)
 	check_reg_feat_map(&hcr_feat_map);
 	check_reg_feat_map(&sctlr2_feat_map);
 	check_reg_feat_map(&tcr2_el2_feat_map);
-	check_feat_map(sctlr_el1_feat_map, ARRAY_SIZE(sctlr_el1_feat_map),
-		       SCTLR_EL1_RES0, "SCTLR_EL1");
+	check_reg_feat_map(&sctlr_el1_feat_map);
 	check_feat_map(mdcr_el2_feat_map, ARRAY_SIZE(mdcr_el2_feat_map),
 		       MDCR_EL2_RES0, "MDCR_EL2");
 }
@@ -1407,9 +1410,7 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
 		*res1 = TCR2_EL2_RES1;
 		break;
 	case SCTLR_EL1:
-		*res0 = compute_res0_bits(kvm, sctlr_el1_feat_map,
-					  ARRAY_SIZE(sctlr_el1_feat_map), 0, 0);
-		*res0 |= SCTLR_EL1_RES0;
+		*res0 = compute_reg_res0_bits(kvm, &sctlr_el1_feat_map, 0, 0);
 		*res1 = SCTLR_EL1_RES1;
 		break;
 	case MDCR_EL2:
-- 
2.39.2


