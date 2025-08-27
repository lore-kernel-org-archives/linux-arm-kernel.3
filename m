Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28B1CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEpTCHq67D0kW4e7xAR26adlNhHfxXlbBMW41w0tDNI=; b=hvb2qNXubWib4numBiqromRT2s
	E6yyupXHYJ9xnxHgzYAGcyzqSrVE1wmJ7tKnNowCJX1wWxwj+UqoP31Umf8ErwvNT6tPS4DzczCLB
	BZP7Zj/HPAsKRXjIoM58fd9zFnLtdsyxk4/H3aiCt4OwVzNQlhLkKlfQghnXJkZlH6twHsA/BMGUH
	muv6UCO2qTAluS88wpHrqLmSsYc/0IGm9XmGEh+2ovwR5W0C9p4Ow46h3lzx/WLi0XI2oLHDjlX77
	p9Q1R5JQyeM2VcgMzuV6eX6MqZxHww69aTyJosc5TQWAaBrZtiZUSQkiqUlQ4YluN1H1ab1uTSwlE
	XJcBf5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbq-0000000GZBk-2CZz;
	Wed, 27 Aug 2025 19:15:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIja-0000000G8oA-32Jd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AF9A43BDF;
	Wed, 27 Aug 2025 16:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB0FC4CEF7;
	Wed, 27 Aug 2025 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311050;
	bh=w87rfqe0fgMADYYjpvVVWDQ70sq0JPNkpi0ohmUzjz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PAVRwre2dfKRnQbp+5RVkL4OvJancYGXZsrDCd0uRgjgYW1SPDYQ6zUVYYXIl5NFR
	 BQ0iltCxUeI6qNl0fjjtLq7/rnz3kP+SnXLS+DUjv3VNIawfRBrqaXNX8sOVMgQ/hO
	 PbRi++PYGw3lTnfsJRXrKujOXWkYawE92G+2b/LhjajNyoQ+MBNaiwrcwlHaP545cO
	 ja3yGdD/lBdTtydhoUGceyKtu9PuIQjQLg5uYUAZffd+GR0FDZsnvC5nUQF7EK8FTQ
	 aTxQS4q3dEGPKeQdhok8QXHXkKZbXpNoU74hQzO0jBeD41TKdUPZJuLnhgKKQufsEK
	 OqDcdRh8ZRSXQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjY-00000000yGc-1Det;
	Wed, 27 Aug 2025 16:10:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 09/16] KVM: arm64: Report faults from S1 walk setup at the expected start level
Date: Wed, 27 Aug 2025 17:10:31 +0100
Message-Id: <20250827161039.938958-10-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250827_091050_867183_DB33E731 
X-CRM114-Status: GOOD (  16.50  )
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

Translation faults from TTBR must be reported on the start level,
and not level-0. Enforcing this requires moving quite a lot of
code around so that the start level can be computed early enough
that it is usable.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 103 +++++++++++++++++++++++---------------------
 1 file changed, 54 insertions(+), 49 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index f58dfbb4df891..3bc6cc00ab9a6 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -154,9 +154,6 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 
 	va55 = va & BIT(55);
 
-	if (wi->regime == TR_EL2 && va55)
-		goto addrsz;
-
 	wi->s2 = wi->regime == TR_EL10 && (hcr & (HCR_VM | HCR_DC));
 
 	switch (wi->regime) {
@@ -179,6 +176,46 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 		BUG();
 	}
 
+	/* Someone was silly enough to encode TG0/TG1 differently */
+	if (va55 && wi->regime != TR_EL2) {
+		wi->txsz = FIELD_GET(TCR_T1SZ_MASK, tcr);
+		tg = FIELD_GET(TCR_TG1_MASK, tcr);
+
+		switch (tg << TCR_TG1_SHIFT) {
+		case TCR_TG1_4K:
+			wi->pgshift = 12;	 break;
+		case TCR_TG1_16K:
+			wi->pgshift = 14;	 break;
+		case TCR_TG1_64K:
+		default:	    /* IMPDEF: treat any other value as 64k */
+			wi->pgshift = 16;	 break;
+		}
+	} else {
+		wi->txsz = FIELD_GET(TCR_T0SZ_MASK, tcr);
+		tg = FIELD_GET(TCR_TG0_MASK, tcr);
+
+		switch (tg << TCR_TG0_SHIFT) {
+		case TCR_TG0_4K:
+			wi->pgshift = 12;	 break;
+		case TCR_TG0_16K:
+			wi->pgshift = 14;	 break;
+		case TCR_TG0_64K:
+		default:	    /* IMPDEF: treat any other value as 64k */
+			wi->pgshift = 16;	 break;
+		}
+	}
+
+	wi->pa52bit = has_52bit_pa(vcpu, wi, tcr);
+
+	ia_bits = get_ia_size(wi);
+
+	/* AArch64.S1StartLevel() */
+	stride = wi->pgshift - 3;
+	wi->sl = 3 - (((ia_bits - 1) - wi->pgshift) / stride);
+
+	if (wi->regime == TR_EL2 && va55)
+		goto addrsz;
+
 	tbi = (wi->regime == TR_EL2 ?
 	       FIELD_GET(TCR_EL2_TBI, tcr) :
 	       (va55 ?
@@ -248,46 +285,15 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	/* R_BVXDG */
 	wi->hpd |= (wi->poe || wi->e0poe);
 
-	/* Someone was silly enough to encode TG0/TG1 differently */
-	if (va55) {
-		wi->txsz = FIELD_GET(TCR_T1SZ_MASK, tcr);
-		tg = FIELD_GET(TCR_TG1_MASK, tcr);
-
-		switch (tg << TCR_TG1_SHIFT) {
-		case TCR_TG1_4K:
-			wi->pgshift = 12;	 break;
-		case TCR_TG1_16K:
-			wi->pgshift = 14;	 break;
-		case TCR_TG1_64K:
-		default:	    /* IMPDEF: treat any other value as 64k */
-			wi->pgshift = 16;	 break;
-		}
-	} else {
-		wi->txsz = FIELD_GET(TCR_T0SZ_MASK, tcr);
-		tg = FIELD_GET(TCR_TG0_MASK, tcr);
-
-		switch (tg << TCR_TG0_SHIFT) {
-		case TCR_TG0_4K:
-			wi->pgshift = 12;	 break;
-		case TCR_TG0_16K:
-			wi->pgshift = 14;	 break;
-		case TCR_TG0_64K:
-		default:	    /* IMPDEF: treat any other value as 64k */
-			wi->pgshift = 16;	 break;
-		}
-	}
-
 	/* R_PLCGL, R_YXNYW */
 	if (!kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR2_EL1, ST, 48_47)) {
 		if (wi->txsz > 39)
-			goto transfault_l0;
+			goto transfault;
 	} else {
 		if (wi->txsz > 48 || (BIT(wi->pgshift) == SZ_64K && wi->txsz > 47))
-			goto transfault_l0;
+			goto transfault;
 	}
 
-	wi->pa52bit = has_52bit_pa(vcpu, wi, tcr);
-
 	/* R_GTJBY, R_SXWGM */
 	switch (BIT(wi->pgshift)) {
 	case SZ_4K:
@@ -300,28 +306,22 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	}
 
 	if ((lva && wi->txsz < 12) || (!lva && wi->txsz < 16))
-		goto transfault_l0;
-
-	ia_bits = get_ia_size(wi);
+		goto transfault;
 
 	/* R_YYVYV, I_THCZK */
 	if ((!va55 && va > GENMASK(ia_bits - 1, 0)) ||
 	    (va55 && va < GENMASK(63, ia_bits)))
-		goto transfault_l0;
+		goto transfault;
 
 	/* I_ZFSYQ */
 	if (wi->regime != TR_EL2 &&
 	    (tcr & (va55 ? TCR_EPD1_MASK : TCR_EPD0_MASK)))
-		goto transfault_l0;
+		goto transfault;
 
 	/* R_BNDVG and following statements */
 	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR2_EL1, E0PD, IMP) &&
 	    wi->as_el0 && (tcr & (va55 ? TCR_E0PD1 : TCR_E0PD0)))
-		goto transfault_l0;
-
-	/* AArch64.S1StartLevel() */
-	stride = wi->pgshift - 3;
-	wi->sl = 3 - (((ia_bits - 1) - wi->pgshift) / stride);
+		goto transfault;
 
 	ps = (wi->regime == TR_EL2 ?
 	      FIELD_GET(TCR_EL2_PS_MASK, tcr) : FIELD_GET(TCR_IPS_MASK, tcr));
@@ -351,12 +351,17 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 
 	return 0;
 
-addrsz:				/* Address Size Fault level 0 */
+addrsz:
+	/*
+	 * Address Size Fault level 0 to indicate it comes from TTBR.
+	 * yes, this is an oddity.
+	 */
 	fail_s1_walk(wr, ESR_ELx_FSC_ADDRSZ_L(0), false);
 	return -EFAULT;
 
-transfault_l0:			/* Translation Fault level 0 */
-	fail_s1_walk(wr, ESR_ELx_FSC_FAULT_L(0), false);
+transfault:
+	/* Translation Fault on start level */
+	fail_s1_walk(wr, ESR_ELx_FSC_FAULT_L(wi->sl), false);
 	return -EFAULT;
 }
 
-- 
2.39.2


