Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB538F357D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yOHJbbx/TC/BvSPr8TCoHju7w3Xrp4iJMc5vBNkY7YM=; b=jlHP2mQXrSguu2pePqgIx7SHDm
	+nsRTPQL+/R9RYl9g4Zrtt+X3j27II/ZneA5Fgtb5D0K9egbIDcNuUOGyj3QqnFZbOoUyCaCks0uH
	utswYR6ZCuhsG78eQV/ey+KFBsNXJY0gW12X8AikNVLz0ywUFTlos5G3tsBekvU01ylCmFo6cwSoO
	GM8mKY1ydkpjQg0p+SXP8RQ4tCAfc57a2uHmJ0RZLRSHbOL34TC5J2yBxlNtGV9vj2C+1rOK5gO96
	gY5g21nifiMq9vVrYHag5AATvskvkNcfB0/ljEzkOSZ59842iAvBXFVUtBp3XxBqtteRRxcpLjsnq
	xWLFS4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCQW-00000003ps6-3fgc;
	Wed, 25 Feb 2026 10:47:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCQV-00000003prx-1FbI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:47:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 70B7460097;
	Wed, 25 Feb 2026 10:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1666CC116D0;
	Wed, 25 Feb 2026 10:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772016450;
	bh=bdnD7YNeSgoFDjsR80h75dWUj9sAfEHgusImJ+0NuKc=;
	h=From:To:Cc:Subject:Date:From;
	b=E7zF8h14iwOT1qT9iOWT7EGY03pcGgxNH7GaOxOfwhZ0hWHhL39qWqjHb4Lu67WpF
	 XkIPZk+e2z+Ae+O2v2sVnbFzz3d4t6xuUEN1u4VSzBMeMEr2ZS9Fm6WCi13CBGqJen
	 YxsDoFcYQdXvLHYZ9HSEt8Z06by/Gf4qaItoTi5G3tCo9QzO36L3Tx84S6h2qAmO3P
	 uKfdciTaUj5ZEiPpbzw8/VYQtvK4Okp4FIyUFZD97cWObSr25LL0KtRkvUjqU4wFxc
	 Lqf1eho3m0ZdVG8cz/Q8GjVSRSJJYYtEDB7JpzN4EwmFyqNJqNTlZC7bCCf/SGmobZ
	 NYW89HC0OTHZw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vvCQR-0000000Dfkb-3VQP;
	Wed, 25 Feb 2026 10:47:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: Deduplicate ASID retrieval code
Date: Wed, 25 Feb 2026 10:47:18 +0000
Message-ID: <20260225104718.14209-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

We currently have three versions of the ASID retrieval code, one
in the S1 walker, and two in the VNCR handling (although the last
two are limited to the EL2&0 transltion regime).

Make this code common, and take this opportunity to also simplify
the code a bit while switching over to the TTBRx_EL1_ASID macro.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h |  2 +
 arch/arm64/kvm/at.c                 | 27 +------------
 arch/arm64/kvm/nested.c             | 60 +++++++++++++++--------------
 3 files changed, 35 insertions(+), 54 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 905c658057a43..091544e6af442 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -397,6 +397,8 @@ int kvm_vcpu_allocate_vncr_tlb(struct kvm_vcpu *vcpu);
 int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu);
 void kvm_handle_s1e2_tlbi(struct kvm_vcpu *vcpu, u32 inst, u64 val);
 
+u16 get_asid_by_regime(struct kvm_vcpu *vcpu, enum trans_regime regime);
+
 #define vncr_fixmap(c)						\
 	({							\
 		u32 __c = (c);					\
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 885bd5bb2f416..6588ea251ed77 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -540,31 +540,8 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	wr->pa |= va & GENMASK_ULL(va_bottom - 1, 0);
 
 	wr->nG = (wi->regime != TR_EL2) && (desc & PTE_NG);
-	if (wr->nG) {
-		u64 asid_ttbr, tcr;
-
-		switch (wi->regime) {
-		case TR_EL10:
-			tcr = vcpu_read_sys_reg(vcpu, TCR_EL1);
-			asid_ttbr = ((tcr & TCR_A1) ?
-				     vcpu_read_sys_reg(vcpu, TTBR1_EL1) :
-				     vcpu_read_sys_reg(vcpu, TTBR0_EL1));
-			break;
-		case TR_EL20:
-			tcr = vcpu_read_sys_reg(vcpu, TCR_EL2);
-			asid_ttbr = ((tcr & TCR_A1) ?
-				     vcpu_read_sys_reg(vcpu, TTBR1_EL2) :
-				     vcpu_read_sys_reg(vcpu, TTBR0_EL2));
-			break;
-		default:
-			BUG();
-		}
-
-		wr->asid = FIELD_GET(TTBR_ASID_MASK, asid_ttbr);
-		if (!kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR0_EL1, ASIDBITS, 16) ||
-		    !(tcr & TCR_ASID16))
-			wr->asid &= GENMASK(7, 0);
-	}
+	if (wr->nG)
+		wr->asid = get_asid_by_regime(vcpu, wi->regime);
 
 	return 0;
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 7f1ea85dc67ab..787776aaf4ad1 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -854,6 +854,33 @@ int kvm_inject_s2_fault(struct kvm_vcpu *vcpu, u64 esr_el2)
 	return kvm_inject_nested_sync(vcpu, esr_el2);
 }
 
+u16 get_asid_by_regime(struct kvm_vcpu *vcpu, enum trans_regime regime)
+{
+	enum vcpu_sysreg ttbr_elx;
+	u64 tcr;
+	u16 asid;
+
+	switch (regime) {
+	case TR_EL10:
+		tcr = vcpu_read_sys_reg(vcpu, TCR_EL1);
+		ttbr_elx = (tcr & TCR_A1) ? TTBR1_EL1 : TTBR0_EL1;
+		break;
+	case TR_EL20:
+		tcr = vcpu_read_sys_reg(vcpu, TCR_EL2);
+		ttbr_elx = (tcr & TCR_A1) ? TTBR1_EL2 : TTBR0_EL2;
+		break;
+	default:
+		BUG();
+	}
+
+	asid = FIELD_GET(TTBRx_EL1_ASID, vcpu_read_sys_reg(vcpu, ttbr_elx));
+	if (!kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR0_EL1, ASIDBITS, 16) ||
+	    !(tcr & TCR_ASID16))
+		asid &= GENMASK(7, 0);
+
+	return asid;
+}
+
 static void invalidate_vncr(struct vncr_tlb *vt)
 {
 	vt->valid = false;
@@ -1333,20 +1360,8 @@ static bool kvm_vncr_tlb_lookup(struct kvm_vcpu *vcpu)
 	if (read_vncr_el2(vcpu) != vt->gva)
 		return false;
 
-	if (vt->wr.nG) {
-		u64 tcr = vcpu_read_sys_reg(vcpu, TCR_EL2);
-		u64 ttbr = ((tcr & TCR_A1) ?
-			    vcpu_read_sys_reg(vcpu, TTBR1_EL2) :
-			    vcpu_read_sys_reg(vcpu, TTBR0_EL2));
-		u16 asid;
-
-		asid = FIELD_GET(TTBR_ASID_MASK, ttbr);
-		if (!kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR0_EL1, ASIDBITS, 16) ||
-		    !(tcr & TCR_ASID16))
-			asid &= GENMASK(7, 0);
-
-		return asid == vt->wr.asid;
-	}
+	if (vt->wr.nG)
+		return get_asid_by_regime(vcpu, TR_EL20) == vt->wr.asid;
 
 	return true;
 }
@@ -1449,21 +1464,8 @@ static void kvm_map_l1_vncr(struct kvm_vcpu *vcpu)
 	if (read_vncr_el2(vcpu) != vt->gva)
 		return;
 
-	if (vt->wr.nG) {
-		u64 tcr = vcpu_read_sys_reg(vcpu, TCR_EL2);
-		u64 ttbr = ((tcr & TCR_A1) ?
-			    vcpu_read_sys_reg(vcpu, TTBR1_EL2) :
-			    vcpu_read_sys_reg(vcpu, TTBR0_EL2));
-		u16 asid;
-
-		asid = FIELD_GET(TTBR_ASID_MASK, ttbr);
-		if (!kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR0_EL1, ASIDBITS, 16) ||
-		    !(tcr & TCR_ASID16))
-			asid &= GENMASK(7, 0);
-
-		if (asid != vt->wr.asid)
-			return;
-	}
+	if (vt->wr.nG && get_asid_by_regime(vcpu, TR_EL20) != vt->wr.asid)
+		return;
 
 	vt->cpu = smp_processor_id();
 
-- 
2.47.3


