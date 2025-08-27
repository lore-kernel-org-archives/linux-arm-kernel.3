Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339CBCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPzT8wYX6EkE++o5RwuDakMcev3BK9uFbPNPRV5S0ZE=; b=cyAWNz8e2JAMcuMEJVb5lrroWM
	3V3gvz9itviXZQgpBKISrf6KX0fo8NOpoC2KGyq2qyA+89P5tOkdioqPgkLoV4A3RpQiq62Ivo91F
	8FOCr5mFVreMqjMy3lS/LbMvkp2M2uZATO9MCeioi5gkt+umt3SrxEb65EUJiOXiiHOR6eZ/G+yo1
	+1KA9u8gVM5YjXH2twZ5cjFnXOYxdoYnkLccAvPJ5E6cwv+iSnN9lPHYcOSyUnaAfRi/diL5w/CJB
	zpqnvO+wtS3AORcZX8VaydApNJ20RiWPVe+sOVN63reotyq33KGVNyyi3klFSiI0DGDng4zf7CyeN
	jcMwF5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urKZi-0000000GQDs-45Sh;
	Wed, 27 Aug 2025 18:08:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIjZ-0000000G8mD-1ztZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E30AE60008;
	Wed, 27 Aug 2025 16:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9922FC4CEEB;
	Wed, 27 Aug 2025 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311048;
	bh=RVd9lMjmuKBoESDF5KYicIsJC3LRAaf90v6x5P6q1lw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XS99eNmhUcx4iD9tVEJgG29LTFoUKv0C2UpNhbKjdcdL4hJvzXCEGXvo2c63OAszB
	 shbl+rPe5eos/dU3N3RLwcxhZq2WFdMr7pWvYByNd5tQQqaimFIdBrVE9CLB9JFtar
	 5KAZtvWcQ5Va4NUYVqjf7qs3zuBlO3K2hnZyLaLAEQwvijpt+SiKMXFC34Il0JFGLF
	 i4afatcySRtg5MQL1JaK/3+D9BG0IBMS7DPRMEOQHAMXZJGVjI/0KyWooM3xeKijg2
	 ke3wT6xsOC7IY9f4e85QCBOquYJx4cJizQWsYwfoy3VDddZLig/jwSSNKZmP9RVaCI
	 GmQ5U3cbuQHkw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjW-00000000yGc-35kv;
	Wed, 27 Aug 2025 16:10:46 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 01/16] KVM: arm64: Add helper computing the state of 52bit PA support
Date: Wed, 27 Aug 2025 17:10:23 +0100
Message-Id: <20250827161039.938958-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250827161039.938958-1-maz@kernel.org>
References: <20250827161039.938958-1-maz@kernel.org>
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
index 0e56105339493..10484249f9d54 100644
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


