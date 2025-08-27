Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3B0CA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZGlCaVT5jI57qUYJgxR/K2i2IcxoQycTYiOgQt+3II=; b=oZ57Be3gYqKAPM/ChCmnXmdOvc
	EU1NVjh5CG/RouC25oazDczQJPmm/Y0EAZenX1F4ImHBM1LMmvq+u280PJfpZ7dx3F9UXpg9ayJ4y
	zho5Zpb4h/Vev7toy3jPDp8bNo7yjkZKI0HIMhZrE+L4vEDfXYUef5cltpOY4t0PLZ2Q2ocnYOBPh
	/9VDOHmkD49F6QR3lBVQ1IhNTjxCzS//aCFIOv7o/NCBn28YZk2F+0SM5ChUsXny8RdH4mhociCsB
	J7rdC//m2gpySbDXm8/olGKxmDYIwKYhOn94Tv3zYyNiXiojpTH07dfQ3IdWKP+L6fM471X4I/Hck
	pJsY2vNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbp-0000000GZBH-3ecs;
	Wed, 27 Aug 2025 19:15:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIja-0000000G8oC-33FC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C7CC44B88;
	Wed, 27 Aug 2025 16:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CB1C4CEFC;
	Wed, 27 Aug 2025 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311050;
	bh=n2n6snPz5XhRY4UtuG7IAalJ4oYuX0+XTMNpi/fWpoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ali6INvBOiD2S41wf+GWDgsqkbauWXeOOUZuDsEKNxp/z6BW1JggxBxxOeofFFqrP
	 9Hdog8L4HPKMe11NWTCcD0CI1gPSuZ4dXyEQtfrMJQuJZ6b+21YOpW+w6IbrADhlso
	 K7DOpzOOAYZJQ11FA9a9VjA3HDU3N4/DQmclIiERGtlUiXRHx2FVIS+QZS3E7N3BQn
	 3WWvIYEouh2yD0kv0Y8grT7CgACfA4r7FuJHucMpRt2sg0k9bCi+mYrYLNETEtT/d4
	 fnyPejcGKp7dtKWri6d6YMvb7mN5fbmekrShlyM8TE1FQkzH2veCpvFMdK/YZT1WjM
	 IPqm+s/1gwmbA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjY-00000000yGc-249o;
	Wed, 27 Aug 2025 16:10:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 10/16] KVM: arm64: Allow use of S1 PTW for non-NV vcpus
Date: Wed, 27 Aug 2025 17:10:32 +0100
Message-Id: <20250827161039.938958-11-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250827161039.938958-1-maz@kernel.org>
References: <20250827161039.938958-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_091050_885885_8D9871C1 
X-CRM114-Status: GOOD (  13.11  )
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

As we are about to use the S1 PTW in non-NV contexts, we must make
sure that we don't evaluate the EL2 state when dealing with the EL1&0
translation regime.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 3bc6cc00ab9a6..48406328b74e3 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -108,8 +108,9 @@ static bool s1pie_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
 	case TR_EL20:
 		return vcpu_read_sys_reg(vcpu, TCR2_EL2) & TCR2_EL2_PIE;
 	case TR_EL10:
-		return  (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En) &&
-			(__vcpu_sys_reg(vcpu, TCR2_EL1) & TCR2_EL1_PIE);
+		return ((!vcpu_has_nv(vcpu) ||
+			 (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En)) &&
+			(__vcpu_sys_reg(vcpu, TCR2_EL1) & TCR2_EL1_PIE));
 	default:
 		BUG();
 	}
@@ -132,7 +133,8 @@ static void compute_s1poe(struct kvm_vcpu *vcpu, struct s1_walk_info *wi)
 		wi->e0poe = (wi->regime == TR_EL20) && (val & TCR2_EL2_E0POE);
 		break;
 	case TR_EL10:
-		if (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En) {
+		if (vcpu_has_nv(vcpu) &&
+		    !(__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En)) {
 			wi->poe = wi->e0poe = false;
 			return;
 		}
@@ -150,11 +152,16 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	unsigned int stride, x;
 	bool va55, tbi, lva;
 
-	hcr = __vcpu_sys_reg(vcpu, HCR_EL2);
-
 	va55 = va & BIT(55);
 
-	wi->s2 = wi->regime == TR_EL10 && (hcr & (HCR_VM | HCR_DC));
+	if (vcpu_has_nv(vcpu)) {
+		hcr = __vcpu_sys_reg(vcpu, HCR_EL2);
+		wi->s2 = wi->regime == TR_EL10 && (hcr & (HCR_VM | HCR_DC));
+	} else {
+		WARN_ON_ONCE(wi->regime != TR_EL10);
+		wi->s2 = false;
+		hcr = 0;
+	}
 
 	switch (wi->regime) {
 	case TR_EL10:
@@ -851,7 +858,7 @@ static u64 compute_par_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 		par  = SYS_PAR_EL1_NSE;
 		par |= wr->pa & GENMASK_ULL(52, 12);
 
-		if (wi->regime == TR_EL10 &&
+		if (wi->regime == TR_EL10 && vcpu_has_nv(vcpu) &&
 		    (__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_DC)) {
 			par |= FIELD_PREP(SYS_PAR_EL1_ATTR,
 					  MEMATTR(WbRaWa, WbRaWa));
-- 
2.39.2


