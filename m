Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23269CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzTzAsRmlPI0aIZgvSwxiaE8PV3bkZUp/6/mr9dE1Hs=; b=xTMBwQbIBkiBuuI8F8I+0NmOt0
	z6Zi47e+cK6t97XfrYnBvS+QRU0V9hjIsZDKrJEPaIB6hHSZD/dGahix/MBnWGIJDiOl8FUqxMTEg
	xrC4LzzhqKuXHwbSNxWVOEAfiFpDmjIlTzJdpdxrYO5UXCzrBk9bzhTysnACTbKqzjl0/ypUf7FtF
	iN1xK5V0IjP9HnjS8zJaTYbyhfAjWFiAKkcZlKZs6oGICA1qz6bBR3El+xzaQgaIvSuTgsYJv9UJv
	CjDwhrUAJpg+Ww6+AqPG/oJkTymwLMVwS1pWnUkdqBMUerQdY21Co6C0k36QrL4xuyusNBb4EsW82
	MFFkUP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7dk-00000003xh9-3DAB;
	Mon, 15 Sep 2025 11:45:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7di-00000003xe5-2Z0G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:44:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F4BE601F3;
	Mon, 15 Sep 2025 11:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B425EC4CEF5;
	Mon, 15 Sep 2025 11:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757936697;
	bh=2RbKdH4yDCd/pu6P2Shrhn2Mw55zuipHMBtAnz87VwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sYoxatmmSO6O4r3dXAL73a9cIW4maL1xTWDtEw4l9DnAUM3eIqlNgzyUHB1g2HQsM
	 e2V3Fuj+LZytfpqEihFw6Hr6mf1HAYbRK45Oca17mAFPNmvExRdivmdzykQkhiKUPj
	 wbnqWLvQSQm7hGYAr+VgtIH6H8dmbKXNTTYZGr9/j41+ypCPRUpfZguLssG5PtKb7K
	 A/afukqmU6Tg0Y+qZXEDUYqO0UYASZzsFJ2XnEGqTl72UpXcYyrsLwX50P7VID+coN
	 kGAoK/8W+iYJ8PbB/sr18UNsXXnuf51jGD496jgNVviAUSzX2PBxWyD2JFj2NOVyL+
	 YHeBvnDMHLUJg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy7df-00000006MDw-3nzy;
	Mon, 15 Sep 2025 11:44:55 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 05/16] KVM: arm64: Pass the walk_info structure to compute_par_s1()
Date: Mon, 15 Sep 2025 12:44:40 +0100
Message-Id: <20250915114451.660351-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915114451.660351-1-maz@kernel.org>
References: <20250915114451.660351-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

Instead of just passing the translation regime, pass the full
walk_info structure to compute_par_s1(). This will help further
chamges that will require it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index bdb2c3e22f248..acf6a5d497773 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -807,8 +807,8 @@ static u64 compute_par_s12(struct kvm_vcpu *vcpu, u64 s1_par,
 	return par;
 }
 
-static u64 compute_par_s1(struct kvm_vcpu *vcpu, struct s1_walk_result *wr,
-			  enum trans_regime regime)
+static u64 compute_par_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
+			  struct s1_walk_result *wr)
 {
 	u64 par;
 
@@ -823,7 +823,7 @@ static u64 compute_par_s1(struct kvm_vcpu *vcpu, struct s1_walk_result *wr,
 		par  = SYS_PAR_EL1_NSE;
 		par |= wr->pa & GENMASK_ULL(47, 12);
 
-		if (regime == TR_EL10 &&
+		if (wi->regime == TR_EL10 &&
 		    (__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_DC)) {
 			par |= FIELD_PREP(SYS_PAR_EL1_ATTR,
 					  MEMATTR(WbRaWa, WbRaWa));
@@ -838,14 +838,14 @@ static u64 compute_par_s1(struct kvm_vcpu *vcpu, struct s1_walk_result *wr,
 
 		par  = SYS_PAR_EL1_NSE;
 
-		mair = (regime == TR_EL10 ?
+		mair = (wi->regime == TR_EL10 ?
 			vcpu_read_sys_reg(vcpu, MAIR_EL1) :
 			vcpu_read_sys_reg(vcpu, MAIR_EL2));
 
 		mair >>= FIELD_GET(PTE_ATTRINDX_MASK, wr->desc) * 8;
 		mair &= 0xff;
 
-		sctlr = (regime == TR_EL10 ?
+		sctlr = (wi->regime == TR_EL10 ?
 			 vcpu_read_sys_reg(vcpu, SCTLR_EL1) :
 			 vcpu_read_sys_reg(vcpu, SCTLR_EL2));
 
@@ -1243,7 +1243,7 @@ static u64 handle_at_slow(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 		fail_s1_walk(&wr, ESR_ELx_FSC_PERM_L(wr.level), false);
 
 compute_par:
-	return compute_par_s1(vcpu, &wr, wi.regime);
+	return compute_par_s1(vcpu, &wi, &wr);
 }
 
 /*
-- 
2.39.2


