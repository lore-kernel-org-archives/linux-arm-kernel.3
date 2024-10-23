Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C53ACFA444
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbX45RUM9uNka5equRXhvyOCkhZli1lSADDpuesw4PM=; b=WrevO1UPRTOIJs7Pvlr7rvQ/fK
	4nEWYIkk+bRW1KY2tZ8RnuJPlpl8cm98vVMoZK+IKHtRGevqsa14ssuaDnT2JXz09cqkfXWJx/U+h
	fTUNcmJ2sqE/2+BE6wimpqLBKpeMHdrCAWEWk7DCAU8yyBvGmsBfPpPXcRj0EbKUgZe+air3Xdo+p
	zRD9kFF4e4aVTCra6PhdpQCy3Xnik0aBFJ0D0LtTnpdBuHjd+z1eeALCs9KR7Cr5rEczD1wo6++sj
	UB9PZqfmcu6Cast53WAEFFdKXN0Btx0yHHsGAA8/Hyf0lHlBcXKu6cJy34cOrvEKDMfyeXGbSvJRT
	+321wGbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dTR-0000000Ezn9-2RVd;
	Wed, 23 Oct 2024 15:40:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckK-0000000EpNN-2mfH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FB195C5E80;
	Wed, 23 Oct 2024 14:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98EEAC4CEE7;
	Wed, 23 Oct 2024 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695238;
	bh=wZ18w5uzFaEd+9v97fcSC0+OL0V2c3KqXQJR4zHPEoY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jOPgSy4oftIXJPtFQ51XQfT6nCXwyWt1potE1fACSFECbVyY40Bga7VI/L9yKf0Tk
	 wSq1jeN8vXdYnK7asMYbrvED4u5XfoLCgG22/bgb6LQ5pcJRrh9G4waMWnN1pRye79
	 Pm9ZgF/5WsqcSVMJXkn3RCIQg6Xork2Bb2b+g/DBmiHdR1bLx++bW76l8W7D6A3Z/6
	 nspY/287qpolZC+CJxY/CvTkW3IeS+B7TQDPQWoHjLlwY6pmQw23wxIEVLhWKU73ii
	 HYwuCGiCmmdoUoNRRMkuLG3hbYtrLIlwXtU9maZhKz72M45UcnwOytZZAhKRmVTO+1
	 eHEVg4bQkGKJw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckG-0068vz-SP;
	Wed, 23 Oct 2024 15:53:56 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 35/37] KVM: arm64: Make PAN conditions part of the S1 walk context
Date: Wed, 23 Oct 2024 15:53:43 +0100
Message-Id: <20241023145345.1613824-36-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075400_875709_EFC2F9EE 
X-CRM114-Status: GOOD (  12.86  )
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

Move the conditions describing PAN as part of the s1_walk_info
structure, in an effort to declutter the permission processing.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 8d1dc6327ec5b..2ab2c3578c3a0 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -26,6 +26,7 @@ struct s1_walk_info {
 	bool	     		hpd;
 	bool			e0poe;
 	bool			poe;
+	bool			pan;
 	bool	     		be;
 	bool	     		s2;
 };
@@ -151,6 +152,8 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, u32 op, struct s1_walk_info *wi,
 
 	wi->regime = compute_translation_regime(vcpu, op);
 	as_el0 = (op == OP_AT_S1E0R || op == OP_AT_S1E0W);
+	wi->pan = (op == OP_AT_S1E1RP || op == OP_AT_S1E1WP) &&
+		  (*vcpu_cpsr(vcpu) & PSR_PAN_BIT);
 
 	va55 = va & BIT(55);
 
@@ -1020,10 +1023,12 @@ static void compute_s1_indirect_permissions(struct kvm_vcpu *vcpu,
 	}
 }
 
-static void compute_s1_permissions(struct kvm_vcpu *vcpu, u32 op,
+static void compute_s1_permissions(struct kvm_vcpu *vcpu,
 				   struct s1_walk_info *wi,
 				   struct s1_walk_result *wr)
 {
+	bool pan;
+
 	if (!s1pie_enabled(vcpu, wi->regime))
 		compute_s1_direct_permissions(vcpu, wi, wr);
 	else
@@ -1032,14 +1037,10 @@ static void compute_s1_permissions(struct kvm_vcpu *vcpu, u32 op,
 	if (!wi->hpd)
 		compute_s1_hierarchical_permissions(vcpu, wi, wr);
 
-	if (op == OP_AT_S1E1RP || op == OP_AT_S1E1WP) {
-		bool pan;
-
-		pan = *vcpu_cpsr(vcpu) & PSR_PAN_BIT;
-		pan &= wr->ur || wr->uw || (pan3_enabled(vcpu, wi->regime) && wr->ux);
-		wr->pw &= !pan;
-		wr->pr &= !pan;
-	}
+	pan = wi->pan && (wr->ur || wr->uw ||
+			  (pan3_enabled(vcpu, wi->regime) && wr->ux));
+	wr->pw &= !pan;
+	wr->pr &= !pan;
 }
 
 static u64 handle_at_slow(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
@@ -1065,7 +1066,7 @@ static u64 handle_at_slow(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	if (ret)
 		goto compute_par;
 
-	compute_s1_permissions(vcpu, op, &wi, &wr);
+	compute_s1_permissions(vcpu, &wi, &wr);
 
 	switch (op) {
 	case OP_AT_S1E1RP:
-- 
2.39.2


