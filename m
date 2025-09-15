Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9759ECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxHQx/ZiMcLUCPRD+QKkenG+QAyOTVGtBpSnIdMFJoo=; b=3RHorUEdO1zRfdLegQbHT/kSWI
	ZpumnRDL+lYOq9176MxRUMagr0DrEr9FzAw4R3Tw/XnvL09RnxD21NOifl3c/ySLpVDzjhm/UU8Vt
	aaI5cBFBOqbead2ITY0TJQmklfX9EZ+0ntPVS910X1ADG62Tzs74ZnDXAZxDucwv3KlvCyJN+f5q4
	oc72136UbkYYFVcyuQ/FUtM3L1Art719mCteaGvGyRHCHhoH/rVuAYj1j0cjDYI0Y1G5EGSkGCNYE
	TJg3IbV2VtkWK0YoLHhosNKZlWl/RWfuz2dRYf9+w029qGvLSTT3Go3lF/M0AiXR8uHvPvIMjHutz
	MNdt0/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7dk-00000003xgF-1XUO;
	Mon, 15 Sep 2025 11:45:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7dh-00000003xdM-1y4d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:44:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C71343226;
	Mon, 15 Sep 2025 11:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D51C4CEF7;
	Mon, 15 Sep 2025 11:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757936697;
	bh=ZAvEqXSsF8rnvtvXK2ptMKYukFOlYKwTSe9TJILQtKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WI/EZQOE55YGB7D/WKKNEvGqsa/JMeEeeCURsAFJSh3duvFO3hS6vLx+DttJOspnK
	 mfQfK7MmUKc+pdgPllEu6Ha49iOMB9ecQLOSCh/UgeU6ZvHpX08t0QphyYRjIydAnO
	 P5iVdfTLBCqzzdDwaA7oJWjRYdTIUH7esVCxl5mbkZEm4t4kslQms4BeL3dyV/o56U
	 /d074gLuqXGTbpbGNi9RArwXWiKGXBhMGNmtUoC0Q2FoEVg/qdYN30ky8AqVKGO0nz
	 57lTTwjMadq70R/Q24lWyJc8xd9fW53uB9Xt2MzAcBCnCKPB1dnS0r2wSeC1VPIYhO
	 Qpk2NfTIGyR4g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy7df-00000006MDw-0WZD;
	Mon, 15 Sep 2025 11:44:55 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 01/16] KVM: arm64: Add helper computing the state of 52bit PA support
Date: Mon, 15 Sep 2025 12:44:36 +0100
Message-Id: <20250915114451.660351-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915114451.660351-1-maz@kernel.org>
References: <20250915114451.660351-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_044457_546637_B24ADE3A 
X-CRM114-Status: GOOD (  14.10  )
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

Track whether the guest is using 52bit PAs, either LPA or LPA2.
This further simplifies the handling of LVA for 4k and 16k pages,
as LPA2 implies LVA in this case.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h |  1 +
 arch/arm64/kvm/at.c                 | 31 ++++++++++++++++++++++++-----
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 7fd76f41c296a..038e35430bb2c 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -299,6 +299,7 @@ struct s1_walk_info {
 	bool			pan;
 	bool	     		be;
 	bool	     		s2;
+	bool			pa52bit;
 };
 
 struct s1_walk_result {
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index d71ca4ddc9d1e..8e275ea68cfa8 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -31,6 +31,29 @@ static bool check_output_size(u64 ipa, struct s1_walk_info *wi)
 	return wi->max_oa_bits < 48 && (ipa & GENMASK_ULL(47, wi->max_oa_bits));
 }
 
+static bool has_52bit_pa(struct kvm_vcpu *vcpu, struct s1_walk_info *wi, u64 tcr)
+{
+	switch (BIT(wi->pgshift)) {
+	case SZ_64K:
+	default:		/* IMPDEF: treat any other value as 64k */
+		if (!kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR0_EL1, PARANGE, 52))
+			return false;
+		return ((wi->regime == TR_EL2 ?
+			 FIELD_GET(TCR_EL2_PS_MASK, tcr) :
+			 FIELD_GET(TCR_IPS_MASK, tcr)) == 0b0110);
+	case SZ_16K:
+		if (!kvm_has_feat(vcpu->kvm, ID_AA64MMFR0_EL1, TGRAN16, 52_BIT))
+			return false;
+		break;
+	case SZ_4K:
+		if (!kvm_has_feat(vcpu->kvm, ID_AA64MMFR0_EL1, TGRAN4, 52_BIT))
+			return false;
+		break;
+	}
+
+	return (tcr & (wi->regime == TR_EL2 ? TCR_EL2_DS : TCR_DS));
+}
+
 /* Return the translation regime that applies to an AT instruction */
 static enum trans_regime compute_translation_regime(struct kvm_vcpu *vcpu, u32 op)
 {
@@ -232,15 +255,13 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 			goto transfault_l0;
 	}
 
+	wi->pa52bit = has_52bit_pa(vcpu, wi, tcr);
+
 	/* R_GTJBY, R_SXWGM */
 	switch (BIT(wi->pgshift)) {
 	case SZ_4K:
-		lva = kvm_has_feat(vcpu->kvm, ID_AA64MMFR0_EL1, TGRAN4, 52_BIT);
-		lva &= tcr & (wi->regime == TR_EL2 ? TCR_EL2_DS : TCR_DS);
-		break;
 	case SZ_16K:
-		lva = kvm_has_feat(vcpu->kvm, ID_AA64MMFR0_EL1, TGRAN16, 52_BIT);
-		lva &= tcr & (wi->regime == TR_EL2 ? TCR_EL2_DS : TCR_DS);
+		lva = wi->pa52bit;
 		break;
 	case SZ_64K:
 		lva = kvm_has_feat(vcpu->kvm, ID_AA64MMFR2_EL1, VARange, 52);
-- 
2.39.2


