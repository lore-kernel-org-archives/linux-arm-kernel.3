Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC989E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 08:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6isFNd8zHOf41Of/wjxlI+b9qTAIYvxlEpDr2EkvB3U=; b=AMAewcmc/BjC4idf01rQJfWOfw
	IOARQWwH7rh7YhM2xwCRdibYpoGH71U7UAFqhEa8J4R42E4zTL4KfylZJCztzNp+gV5Rup3tPjnNs
	ppwQnh+n03c/tVaHrxM4QlOaK1aAPVZaqGCGMrO256u+YTgQfg/cujNi6aLhk+pLHcPlAjtARCEqt
	m4WLFe3DuLxioyu4WrthWofFQ6TTGf3Ena0aAHwHxk3niAkPuB8RbD2k/tYmMjIHYeq9HHWeIufx+
	3CvqoAt8vlDRjvKUBM5jC7/IxgWuvj2X7YFZ7IaeBdX91wY3ywnLHMwU+WHhYmbqVOLVFva3Lbhj2
	t+HAyN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeVM-0000000HI2L-3kxV;
	Thu, 12 Dec 2024 08:25:04 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLePb-0000000HGl7-1CDG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 08:19:08 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-434fe2b605eso1921665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 00:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733991545; x=1734596345; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6isFNd8zHOf41Of/wjxlI+b9qTAIYvxlEpDr2EkvB3U=;
        b=itsq4h8XjleQB6LO7pehLy2SBuSoKtnBo8Yz43rxCoJYL8ORrDR/P3yF7jj8ivyv/Q
         hUSzLWLK32tr5/i2XhSsJrf4uAjaUHCBigE7pbYQ1jtQeGXhTaOcMaHfygBHqIOktZBJ
         RaFFUQ+A/0mgaY3i5QDMjk/n3EHMaVQRn+g8nWzeOEvl31JAXKxojMtWtWAHKih53psR
         Cvnh2K/ger2ORnN2EAmSlifycG368sO61YDJJ6N1ZAQhqrbbjP5CR8kCH0Y+SjQOPOv5
         ky6CHTrCKZYV2XnA5HfBbdqlRy2siTeSXkvD+v3+lqEjZai5GM1vb5q3zs7/j/KJ/VVN
         /bAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733991545; x=1734596345;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6isFNd8zHOf41Of/wjxlI+b9qTAIYvxlEpDr2EkvB3U=;
        b=EqyBEfHDB73I8jFvDK0VTwl2xEpK1TSjNa9OVPxclD66SprudG8mfvwBiYcbjSzpC1
         FaLLdp7V8j7n+qrCorH97TZd6uyMb2ROmWMXWEtvTvkwT0/9dXajK0NAlhilmQhUvOB4
         CieKIofSpUPu1Y+HHVC0yqOC9+qOoYHIc7iqOSTyskG/dvlj3eaOvRrPhelEc9qENpa3
         8EUXW+9U/ytD+5wdjo+IIXRqCjQbi8/4XBE39mytAUrr7bYOhHHO0NqwGseuojSJXTea
         IsMWb0I4Av+PKK15S95yivB/8mnMPV14E+COeY4iU7arvdK/4ogJLUh+j3Zm0M+/CDi+
         /x3w==
X-Gm-Message-State: AOJu0YzYtyQQ9HKYWRTa16UQHJUjfowBgepHkMYptJelx93XIJry6AyZ
	NVvsvX+JU7ZGE/Qw1BYjOuR5KdQQdHc9qNA8b3Qzw34KvUEsLanMEyKGlx/4y2ZfSdPZalvOUEw
	tnOimsA8gImzHMXMETFFu+jEULgvzMLN4wmJsInV+n5/0d5PV3Qy/FdwJFM1uIz1UNJJd4pTXlz
	ijKA8HyBrAArhAOomiKsx3tuM0YiNkJd2WxqMHI2+Y
X-Google-Smtp-Source: AGHT+IGiNwt46ersFJk8J3W4FvXc0YIFm/aDF3p261C7M4Bc1ps+NMc5UV9QpUddAEBdOk7TXMj8hL3G
X-Received: from wmfv7.prod.google.com ([2002:a05:600c:15c7:b0:431:1903:8a3e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:468a:b0:434:f0df:a14
 with SMTP id 5b1f17b1804b1-4361c34623dmr48042095e9.2.1733991545427; Thu, 12
 Dec 2024 00:19:05 -0800 (PST)
Date: Thu, 12 Dec 2024 09:18:46 +0100
In-Reply-To: <20241212081841.2168124-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241212081841.2168124-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4036; i=ardb@kernel.org;
 h=from:subject; bh=wxQBa7Qia0zG9OkBtRYf+Ymgq0cT+W+pOrTZLi6s8yQ=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIT1qTnpY6bHtf7P6ePhaAiaXMSobvfSe5hBzWDJBMM308
 rUKv7COUhYGMQ4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMBHLpQz/lAy4y1iv/gk7c5Pf
 43HPlMeTvzDt/SSVFRO2fd8xC+01JQz/6w49Ovvy3pzpBR22RWy3irYtb9G3Wc7Xs3NS0IHlk67 eYgQA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212081841.2168124-12-ardb+git@google.com>
Subject: [PATCH v3 4/6] arm64/kvm: Avoid invalid physical addresses to signal
 owner updates
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_001907_323341_3A9408CD 
X-CRM114-Status: GOOD (  19.88  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The pKVM stage2 mapping code relies on an invalid physical address to
signal to the internal API that only the annotations of descriptors
should be updated, and these are stored in the high bits of invalid
descriptors covering memory that has been donated to protected guests,
and is therefore unmapped from the host stage-2 page tables.

Given that these invalid PAs are never stored into the descriptors, it
is better to rely on an explicit flag, to clarify the API and to avoid
confusion regarding whether or not the output address of a descriptor
can ever be invalid to begin with (which is not the case with LPA2).

That removes a dependency on the logic that reasons about the maximum PA
range, which differs on LPA2 capable CPUs based on whether LPA2 is
enabled or not, and will be further clarified in subsequent patches.

Cc: Quentin Perret <qperret@google.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kvm/hyp/pgtable.c | 33 ++++++--------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 40bd55966540..ed600126161a 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -35,14 +35,6 @@ static bool kvm_pgtable_walk_skip_cmo(const struct kvm_pgtable_visit_ctx *ctx)
 	return unlikely(ctx->flags & KVM_PGTABLE_WALK_SKIP_CMO);
 }
 
-static bool kvm_phys_is_valid(u64 phys)
-{
-	u64 parange_max = kvm_get_parange_max();
-	u8 shift = id_aa64mmfr0_parange_to_phys_shift(parange_max);
-
-	return phys < BIT(shift);
-}
-
 static bool kvm_block_mapping_supported(const struct kvm_pgtable_visit_ctx *ctx, u64 phys)
 {
 	u64 granule = kvm_granule_size(ctx->level);
@@ -53,7 +45,7 @@ static bool kvm_block_mapping_supported(const struct kvm_pgtable_visit_ctx *ctx,
 	if (granule > (ctx->end - ctx->addr))
 		return false;
 
-	if (kvm_phys_is_valid(phys) && !IS_ALIGNED(phys, granule))
+	if (!IS_ALIGNED(phys, granule))
 		return false;
 
 	return IS_ALIGNED(ctx->addr, granule);
@@ -587,6 +579,9 @@ struct stage2_map_data {
 
 	/* Force mappings to page granularity */
 	bool				force_pte;
+
+	/* Walk should update owner_id only */
+	bool				annotation;
 };
 
 u64 kvm_get_vtcr(u64 mmfr0, u64 mmfr1, u32 phys_shift)
@@ -885,18 +880,7 @@ static u64 stage2_map_walker_phys_addr(const struct kvm_pgtable_visit_ctx *ctx,
 {
 	u64 phys = data->phys;
 
-	/*
-	 * Stage-2 walks to update ownership data are communicated to the map
-	 * walker using an invalid PA. Avoid offsetting an already invalid PA,
-	 * which could overflow and make the address valid again.
-	 */
-	if (!kvm_phys_is_valid(phys))
-		return phys;
-
-	/*
-	 * Otherwise, work out the correct PA based on how far the walk has
-	 * gotten.
-	 */
+	/* Work out the correct PA based on how far the walk has gotten */
 	return phys + (ctx->addr - ctx->start);
 }
 
@@ -908,6 +892,9 @@ static bool stage2_leaf_mapping_allowed(const struct kvm_pgtable_visit_ctx *ctx,
 	if (data->force_pte && ctx->level < KVM_PGTABLE_LAST_LEVEL)
 		return false;
 
+	if (data->annotation && ctx->level == KVM_PGTABLE_LAST_LEVEL)
+		return true;
+
 	return kvm_block_mapping_supported(ctx, phys);
 }
 
@@ -923,7 +910,7 @@ static int stage2_map_walker_try_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 	if (!stage2_leaf_mapping_allowed(ctx, data))
 		return -E2BIG;
 
-	if (kvm_phys_is_valid(phys))
+	if (!data->annotation)
 		new = kvm_init_valid_leaf_pte(phys, data->attr, ctx->level);
 	else
 		new = kvm_init_invalid_leaf_owner(data->owner_id);
@@ -1085,11 +1072,11 @@ int kvm_pgtable_stage2_set_owner(struct kvm_pgtable *pgt, u64 addr, u64 size,
 {
 	int ret;
 	struct stage2_map_data map_data = {
-		.phys		= KVM_PHYS_INVALID,
 		.mmu		= pgt->mmu,
 		.memcache	= mc,
 		.owner_id	= owner_id,
 		.force_pte	= true,
+		.annotation	= true,
 	};
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_map_walker,
-- 
2.47.1.613.gc27f4b7a9f-goog


