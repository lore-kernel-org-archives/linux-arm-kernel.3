Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48542CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9Ry8A/52Xi0s0kElC+UUcRB8KbFY9Yp8meNhNE2GeQ=; b=HhA65RA9q868nNT3mBfCp5hKyR
	CE/LL5uEEm/8aT3lGUGQpAyMDPTdhFLkO47ZwWmjBC/eABsSNnIWixtCuAiDDu0HlW+6U+3GXCxTX
	5Fyzc0l3Xkdd1wVjpAs5sdywpzNd9jvJGZaWNItxVK1Drud8ZhKNQJAvFmtptZLJk9rsLc2itGC28
	yyrXn4xLuwrz6sOtiI2N1K9BalRK8RGCGp0ukDJeK5Dk/XGMkrvcv9xv/KaYEG5CKrCaYTPoHd2l1
	9mc8z2o9pWhXKNxxwn5k4Y22wCizLpwOs/CC/IonadEgNHdSrSsSWqL+6X0SaVLIq8I714FtWMGRp
	1XtA/yXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbn-0000000GZ9b-2aCU;
	Wed, 27 Aug 2025 19:14:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIja-0000000G8nR-2G2X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E8CCF601DA;
	Wed, 27 Aug 2025 16:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBCBC4CEF5;
	Wed, 27 Aug 2025 16:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311049;
	bh=BGvF4emJCZt66ab5olKluKN7eyjKva27Qgxm5D/ag18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BVb8Enl6F9/HBRQiHPkuQkdkU1q6YK4mFFrWtJKZM4j+NjrpATGhdLEBtS7Z8uqgp
	 7s3/th7lYMYcFJTNxqK45KoK3APQgI22HHhK76gUHL0a040UL0G24x90QmpOLqFBYc
	 vn7TjXscnZ0jU+veQB4HcDTcIadACVguoi7hPrIBNEMZbHomjPJ9mh0mKi2vvlylBe
	 Qv3MMMbQDmoujfOCwiltSkYxbwUus/w0O2ozC+0kDDvMHGMVI5qaD/hvCE221wXEOo
	 w5rjb8Br5cVWG62RJB5DcFTvZcr7IHBRQEaYuksi7/vEaxCZsVhyGshSafOQOZsIRE
	 HC30otkfmBKcw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjX-00000000yGc-32L2;
	Wed, 27 Aug 2025 16:10:47 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 06/16] KVM: arm64: Compute shareability for LPA2
Date: Wed, 27 Aug 2025 17:10:28 +0100
Message-Id: <20250827161039.938958-7-maz@kernel.org>
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

LPA2 gets the memory access shareability from TCR_ELx instead of
getting it form the descriptors. Store it in the walk info struct
so that it is passed around and evaluated as required.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h |  1 +
 arch/arm64/kvm/at.c                 | 37 +++++++++++++++++++++++------
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 1a03095b03c5b..f3135ded47b7d 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -295,6 +295,7 @@ struct s1_walk_info {
 	unsigned int		pgshift;
 	unsigned int		txsz;
 	int 	     		sl;
+	u8			sh;
 	bool			as_el0;
 	bool	     		hpd;
 	bool			e0poe;
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index ea94710335652..c684325b954d3 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -188,6 +188,12 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	if (!tbi && (u64)sign_extend64(va, 55) != va)
 		goto addrsz;
 
+	wi->sh = (wi->regime == TR_EL2 ?
+		  FIELD_GET(TCR_EL2_SH0_MASK, tcr) :
+		  (va55 ?
+		   FIELD_GET(TCR_SH1_MASK, tcr) :
+		   FIELD_GET(TCR_SH0_MASK, tcr)));
+
 	va = (u64)sign_extend64(va, 55);
 
 	/* Let's put the MMU disabled case aside immediately */
@@ -697,21 +703,36 @@ static u8 combine_s1_s2_attr(u8 s1, u8 s2)
 #define ATTR_OSH	0b10
 #define ATTR_ISH	0b11
 
-static u8 compute_sh(u8 attr, u64 desc)
+static u8 compute_final_sh(u8 attr, u8 sh)
 {
-	u8 sh;
-
 	/* Any form of device, as well as NC has SH[1:0]=0b10 */
 	if (MEMATTR_IS_DEVICE(attr) || attr == MEMATTR(NC, NC))
 		return ATTR_OSH;
 
-	sh = FIELD_GET(PTE_SHARED, desc);
 	if (sh == ATTR_RSV)		/* Reserved, mapped to NSH */
 		sh = ATTR_NSH;
 
 	return sh;
 }
 
+static u8 compute_s1_sh(struct s1_walk_info *wi, struct s1_walk_result *wr,
+			u8 attr)
+{
+	u8 sh;
+
+	/*
+	 * non-52bit and LPA have their basic shareability described in the
+	 * descriptor. LPA2 gets it from the corresponding field in TCR,
+	 * conveniently recorded in the walk info.
+	 */
+	if (!wi->pa52bit || BIT(wi->pgshift) == SZ_64K)
+		sh = FIELD_GET(PTE_SHARED, wr->desc);
+	else
+		sh = wi->sh;
+
+	return compute_final_sh(attr, sh);
+}
+
 static u8 combine_sh(u8 s1_sh, u8 s2_sh)
 {
 	if (s1_sh == ATTR_OSH || s2_sh == ATTR_OSH)
@@ -725,7 +746,7 @@ static u8 combine_sh(u8 s1_sh, u8 s2_sh)
 static u64 compute_par_s12(struct kvm_vcpu *vcpu, u64 s1_par,
 			   struct kvm_s2_trans *tr)
 {
-	u8 s1_parattr, s2_memattr, final_attr;
+	u8 s1_parattr, s2_memattr, final_attr, s2_sh;
 	u64 par;
 
 	/* If S2 has failed to translate, report the damage */
@@ -798,11 +819,13 @@ static u64 compute_par_s12(struct kvm_vcpu *vcpu, u64 s1_par,
 	    !MEMATTR_IS_DEVICE(final_attr))
 		final_attr = MEMATTR(NC, NC);
 
+	s2_sh = FIELD_GET(PTE_SHARED, tr->desc);
+
 	par  = FIELD_PREP(SYS_PAR_EL1_ATTR, final_attr);
 	par |= tr->output & GENMASK(47, 12);
 	par |= FIELD_PREP(SYS_PAR_EL1_SH,
 			  combine_sh(FIELD_GET(SYS_PAR_EL1_SH, s1_par),
-				     compute_sh(final_attr, tr->desc)));
+				     compute_final_sh(final_attr, s2_sh)));
 
 	return par;
 }
@@ -856,7 +879,7 @@ static u64 compute_par_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 		par |= FIELD_PREP(SYS_PAR_EL1_ATTR, mair);
 		par |= wr->pa & GENMASK_ULL(47, 12);
 
-		sh = compute_sh(mair, wr->desc);
+		sh = compute_s1_sh(wi, wr, mair);
 		par |= FIELD_PREP(SYS_PAR_EL1_SH, sh);
 	}
 
-- 
2.39.2


