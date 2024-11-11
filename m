Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90470D2E9C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvYw5KMEsKEr1XuASRWN06RAKoI6bIJLeOEgHSiiZzM=; b=pXfMuoL5wZ1DLHXmbPSBD5zCPD
	UMDePBP7MZ+ntKlNYxLUruxNRzXWFg8tzGjq+CzeZhtNkvnC8O1V51JhLg1QachUQEo/Pjuk+DExr
	UlFzAX4ppzFAhXs8r0wBdzUGBksDqg2dqnlqqldmJ1Tx1tQ9pJKNiJbC4S+QfYwlnTdRR2NdQQ+mT
	aZGgO45Synu6w7gJDOp8SFA4CeF5XRJMKypoHQZ6k+QdiiTne68q0VXxWDbqfxRLWM+PYaG4iPBcn
	SbE6cEI/aygr4MBL3vQN2nCrvceDkIDl2RCSnh9Oii5Yt9JKgB+50tMAb5lNIJDPAIwCY713Ca0/d
	Jj4LYR7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQ2v-0000000GrB7-3DBk;
	Mon, 11 Nov 2024 08:45:17 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPu1-0000000GpOG-1Ejq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 08:36:06 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e297a366304so6524341276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 00:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731314164; x=1731918964; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mvYw5KMEsKEr1XuASRWN06RAKoI6bIJLeOEgHSiiZzM=;
        b=OwGjcY5oOoE3mmxBt3kJvkoxkBcIWY2NxAvz83O0AymtfgrU95i4kqZayIU/QycUss
         sWK4FyPRTysQuIZuCRROhQNUBlR/fWdoQwR7hrJgiJqSl1oEo0H2JN3uWT8pMEZkrcL/
         Kr2lIuRhrh1O/WKsrzBTbbvGjEBj2NbOgDPptNvHf6W6Di+m6KhsXLhEaTJFKqMRPnLw
         byvE/N56nvV0ZGMUAgBvKzY/XjSbpUFhvCgbzjz2ezjrK6OHQxUgVmFiUFayG9khFOOa
         h3k6Msg7n08fJSf1QtNU5/WyODiSLKxBU41qc91fQCt2oujZHM77KYeeCbWZY/e6c0Z+
         PGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731314164; x=1731918964;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mvYw5KMEsKEr1XuASRWN06RAKoI6bIJLeOEgHSiiZzM=;
        b=DhFkuzn1s2ME07EQ838x4JqwzB9tPOl00qol4PDx2k5Z0O78EbaTu2H3WEwK4up8QK
         LUb4S9xPeX+hQqRwSfg2WU9Og1A/XPB/plV9QljwoVcMF7mXFxcQzXKoRf0jeWV0SbyM
         Ad0CHB5T2hTYADH5VjP2XxHzBbF2n2VkrAQlHHZT5WSST+dmqgUG/zEmqF+ZgIELcRhT
         LBefklzU/6xnv8gTmbZ/OW63Wd8Uwwa6u8FmuBOZZUkrlzGgyh9RJCei0votw0MKiV28
         vVyfNFaysJQ2aVvD4UU1hTH4Be/KXpZsbbLaTp6YGd90bUzzPxkbamiCzv+LpZuIlMlQ
         IsRg==
X-Gm-Message-State: AOJu0Yz6FJrCYbMEcKjzTZORyF0wQgByO0EDLDW60VpQkSuP0yHK/hCn
	ohNaBxJNswQdcYprum6G/UrGeTQpfeLw+VkpG9ZAIH+jc19OHRRcZMLEjTLh6YKQm21pd7+8Pnu
	6tJadJlOUGc348D0xTuEcD2FkrfRr6gdA7ox6eKLzGpAm1A/J/ZspuXbrCysRmtztl5jXAAegJ+
	EI12BRbZcCSSsqQ5l3IQf2656tHDBaKLLkworz1Qy/
X-Google-Smtp-Source: AGHT+IGpvIMbkxeYdUfsPGg0p8TdUt7jkXcMTRirtn29GW64/R+2fJohGiuoVhYqzVfdaxv+KAZTWwUo
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:6902:4d1:b0:e0e:4841:3a7e with SMTP id
 3f1490d57ef6-e337f8da4fdmr33424276.7.1731314163950; Mon, 11 Nov 2024 00:36:03
 -0800 (PST)
Date: Mon, 11 Nov 2024 09:35:48 +0100
In-Reply-To: <20241111083544.1845845-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241111083544.1845845-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4086; i=ardb@kernel.org;
 h=from:subject; bh=ibxNk8At7yeC6neiP0xU3/81ts81JCLm+aYwdEzytG4=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JId3w4JM7ggvj+DacKNi+aJHSyRtRzunim0WYP06ZPT9h1
 +rVbqmVHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiBWGMDHsTJm1cfW2x0srf
 09K8nz/i5NPlkmS5G200dd6pGo6kZ/IM/6sMDmSw/L0Qf1f4kc0D+0e7Jp3SOuzBnhA/R2hpFMP xZ0wA
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241111083544.1845845-12-ardb+git@google.com>
Subject: [PATCH 4/6] arm64/kvm: Avoid invalid physical addresses to signal
 owner updates
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003605_361569_50ADA4D4 
X-CRM114-Status: GOOD (  20.18  )
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
signal to the internal API that only the owner_id fields of descriptors
should be updated, which are stored in the high bits of invalid
descriptors covering memory that has been donated to protected guests,
and is therefore unmapped from the host stage-2 page tables.

Given that these invalid PAs are never stored into the descriptors, it
is better to rely on an explicit flag, to clarify the API and to avoid
confusion regarding whether or not the output address of a descriptor
can ever be invalid to begin with (which is not the case with LPA2).

That removes a dependency on the logic that reasons about the maximum PA
range, which differs on LPA2 capable CPUs based on whether LPA2 is
enabled or not, and will be further clarified in subsequent patches.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kvm/hyp/pgtable.c | 37 ++++++++------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b11bcebac908..4bf618b2cba7 100644
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
+	bool				owner_update;
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
 
@@ -908,6 +892,13 @@ static bool stage2_leaf_mapping_allowed(const struct kvm_pgtable_visit_ctx *ctx,
 	if (data->force_pte && ctx->level < KVM_PGTABLE_LAST_LEVEL)
 		return false;
 
+	/*
+	 * Pass a value that is aligned to any block size when updating
+	 * only the owner_id on invalid mappings.
+	 */
+	if (data->owner_update)
+		phys = 0;
+
 	return kvm_block_mapping_supported(ctx, phys);
 }
 
@@ -923,7 +914,7 @@ static int stage2_map_walker_try_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 	if (!stage2_leaf_mapping_allowed(ctx, data))
 		return -E2BIG;
 
-	if (kvm_phys_is_valid(phys))
+	if (!data->owner_update)
 		new = kvm_init_valid_leaf_pte(phys, data->attr, ctx->level);
 	else
 		new = kvm_init_invalid_leaf_owner(data->owner_id);
@@ -1085,11 +1076,11 @@ int kvm_pgtable_stage2_set_owner(struct kvm_pgtable *pgt, u64 addr, u64 size,
 {
 	int ret;
 	struct stage2_map_data map_data = {
-		.phys		= KVM_PHYS_INVALID,
 		.mmu		= pgt->mmu,
 		.memcache	= mc,
 		.owner_id	= owner_id,
 		.force_pte	= true,
+		.owner_update	= true,
 	};
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_map_walker,
-- 
2.47.0.277.g8800431eea-goog


