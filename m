Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D8BCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EzMP3K8s6++sGHcwTpQvp42ys/gvIEowCqs0BvxCM0=; b=tXpR3migIHQUZMiL70jpsJcfJd
	j6JoUUcYk70CoOdFreMUcVY0Swz2YhpaoLdccubrmTj6jO4AmRW9gG3qMoqK331Q6KWaBcXB2v5BF
	RrmOXEFsr9XQ2ihc0oLXpXstTW3ftZcAVJgVFMgcgmodXAtjMGv/cAAHi5GfqogrzK4yBpZVqY1p6
	8E0lWM4dKRtkd5kXueUEkffeyJ7DjsnBe2bYFxpaebHoG1RRtYS5S5MLKIPuEY3ZnBbzHUG+9PEYf
	8ohCD47n/TnhSM2OlPlMIokmxGmQgjvNSb/8KdkfS34S6X2ahbA0ntfRyjQFYJyDY8kB8Iijihf6a
	W4WL5A8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7dl-00000003xhf-0KEE;
	Mon, 15 Sep 2025 11:45:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7di-00000003xe4-2ij1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:44:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 009FB601EF;
	Mon, 15 Sep 2025 11:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EB7C4CEF1;
	Mon, 15 Sep 2025 11:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757936697;
	bh=YGO8iofCD9Klx/7xoZBjB3a2UwUyHWW5VkjpdU6mkSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iGLKFNmrU69yTiktOfzRLU3kbWpFoVwhEwehBIh7gmmzau6EdVdpz9YxurBHkFDXh
	 KwYCgSexf7eMPgGmHDZoomfXhFntmNnFbugCGZGJtQxwCOOeEiPzJ2xdBGgHBdCEY/
	 z6Z9dSvtF92sLWsUZZsCb4CCCgrheQT4ha09MzMYuVHf3Ptp9C9cl5Q1COXsuybc8L
	 0IvdKqIfVEqL4UshJb97iAhiCr2bDQ+r57eBOIF9hI/ZJvawp+NDsh7Ozfwf4gbfEQ
	 Ue9I1b+f+OXVOw9XGbO+OUGEH/k0q21QY1ILGbL6B8z2943U4Xsu5LGDrKrtnMeUI/
	 E4nfOAVXl2UUw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy7df-00000006MDw-2ygY;
	Mon, 15 Sep 2025 11:44:55 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 04/16] KVM: arm64: Decouple output address from the PT descriptor
Date: Mon, 15 Sep 2025 12:44:39 +0100
Message-Id: <20250915114451.660351-5-maz@kernel.org>
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

Add a helper converting the descriptor into a nicely formed OA,
irrespective of the in-descriptor representation (< 52bit, LPA
or LPA2).

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index e02e467fc2ccd..bdb2c3e22f248 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -56,6 +56,29 @@ static bool has_52bit_pa(struct kvm_vcpu *vcpu, struct s1_walk_info *wi, u64 tcr
 	return (tcr & (wi->regime == TR_EL2 ? TCR_EL2_DS : TCR_DS));
 }
 
+static u64 desc_to_oa(struct s1_walk_info *wi, u64 desc)
+{
+	u64 addr;
+
+	if (!wi->pa52bit)
+		return desc & GENMASK_ULL(47, wi->pgshift);
+
+	switch (BIT(wi->pgshift)) {
+	case SZ_4K:
+	case SZ_16K:
+		addr = desc & GENMASK_ULL(49, wi->pgshift);
+		addr |= FIELD_GET(KVM_PTE_ADDR_51_50_LPA2, desc) << 50;
+		break;
+	case SZ_64K:
+	default:	    /* IMPDEF: treat any other value as 64k */
+		addr = desc & GENMASK_ULL(47, wi->pgshift);
+		addr |= FIELD_GET(KVM_PTE_ADDR_51_48, desc) << 48;
+		break;
+	}
+
+	return addr;
+}
+
 /* Return the translation regime that applies to an AT instruction */
 static enum trans_regime compute_translation_regime(struct kvm_vcpu *vcpu, u32 op)
 {
@@ -402,7 +425,7 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 			wr->PXNTable |= FIELD_GET(PMD_TABLE_PXN, desc);
 		}
 
-		baddr = desc & GENMASK_ULL(47, wi->pgshift);
+		baddr = desc_to_oa(wi, desc);
 
 		/* Check for out-of-range OA */
 		if (check_output_size(baddr, wi))
@@ -431,7 +454,8 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 			goto transfault;
 	}
 
-	if (check_output_size(desc & GENMASK(47, va_bottom), wi))
+	baddr = desc_to_oa(wi, desc);
+	if (check_output_size(baddr & GENMASK(52, va_bottom), wi))
 		goto addrsz;
 
 	if (!(desc & PTE_AF)) {
@@ -444,7 +468,7 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	wr->failed = false;
 	wr->level = level;
 	wr->desc = desc;
-	wr->pa = desc & GENMASK(47, va_bottom);
+	wr->pa = baddr & GENMASK(52, va_bottom);
 	wr->pa |= va & GENMASK_ULL(va_bottom - 1, 0);
 
 	wr->nG = (wi->regime != TR_EL2) && (desc & PTE_NG);
-- 
2.39.2


