Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DFBC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRJEDmVHvkj6iKYNb/lr1u1maCv+SpOx76Gyqqg/nbk=; b=YbYrygYp8nwl140KaZqEL3shq/
	Q5eEIkwLoVgWxJGAivfa/z4I2aGfXTTrIgutR+N7moT7BZ0pxpmn9m0C+e4WHNrHLYjJlb2q9ur3K
	R6tLVOP+qG27KkRq9NkZsaymCGlwedu4bRM7+hHU/rtYEvnNAnK5JBs8Mm/XoMOP/J/K0mzgbFHrZ
	3ZqxwU7k/pAQhu1P1YNQtw+2ZX+Jwni93dhaOA7JBVBL5ChGqLceE5Lp6wkOQ6kAJLGmmGyROc9cy
	E/k4JqPuGQzBoFEoPwApM9nUcoVZLeXEbHOq+GEw066WmYPFDAEI6Ejpp/vlPIP3zn3dm7O+OD/1N
	c42KKJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U0B-00000002DvJ-3fkp;
	Fri, 04 Sep 2026 13:30:43 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U07-00000002Drs-2qxb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:30:41 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49cc9f5bee2so8458225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 06:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788528637; x=1789133437; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRJEDmVHvkj6iKYNb/lr1u1maCv+SpOx76Gyqqg/nbk=;
        b=I7IfIdjeIxL1ZNRozXg+G5dTlCySDyeRbAAf4f9be1yOsrCyzs4M+1P6DiZ1hbdrNG
         iYaNnBW2zZw09H2hyDjnDDKBKZnBqflDlCG/jfZXxGk3hF8DtojuMy8slAcaJf0WzOoU
         r/v4HYy2VnTZb5cOO0ubShA/djqxuSx7ce2tXYPdyLsV2wC+aqH+4kGaIjMDy8GgBtSN
         Ay+un/T42MXcWzBPHpZ8mvpGtmQm7iA2wMWPdILVnWqJB2IH198d9g54/LhCZOxR/bHh
         uvfEm3JWrfSr5FnADMjW+ZohdOSPPVYmhmSkRAdIA5iSqIy+U5wYUkPsnGzaaj0YfG1r
         HBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528637; x=1789133437;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fRJEDmVHvkj6iKYNb/lr1u1maCv+SpOx76Gyqqg/nbk=;
        b=fEiHO/5j6QAcZg0e/xakWEC6P/KxJe4fXIOlBn9uc5HFPKlXgtkQ3nYSwuGDN9PYOe
         VnI1OXiVbIoUrVrXENuSFSNNSqvNyc1BmYmbnWzlFN2yVCY8e6h2L0+jt3VTl6mZps6b
         WhqxhQCbuV0/F0bs44lWrS+iqdyGxuclHXysyd96mGUaLiQ7sSSxyb4To7ulbph2qzAo
         pm59JQUa1TrKsrs5SQtHS4nGW0lckW2bgSrARRPU9PoYy8G/PlOzNlAF/dXumDIobU33
         4kZuMNsc+AlB5XZHxmFfIRnl3wl/dKnWB3pQb92OeLuqMCDJ+fU6H4x60yxhvEO5y/VR
         71VQ==
X-Forwarded-Encrypted: i=1; AKwUvBznjTPMmCdGJQPHi9uGlRwg9ZR0qVFvcmiNMOw4/sS+zMkIiZEOIJv1RUx9ms8KhESyZakR2JfZUi590N7MrFtZ@lists.infradead.org
X-Gm-Message-State: AFuF++lLUtcJ2sjcMfTQpePtv2KH4Q17gUISb1juoKxIUqKyDH+4r5TL
	J7kcI1kCkeGMZFjxn53UcENxHBaHUGZRkM/jmbCxv5N9oPoH+WHG5o+U5KTbrRolT4dtu7Ny3rh
	3NTQwRIB2yh5ToQ==
X-Received: from wmgi7.prod.google.com ([2002:a05:600c:2d87:b0:49c:fcf3:6a19])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6211:b0:49c:fa21:1c88 with SMTP id 5b1f17b1804b1-49cfa211d8cmr38545275e9.29.1788528636429;
 Fri, 04 Sep 2026 06:30:36 -0700 (PDT)
Date: Fri,  4 Sep 2026 13:28:55 +0000
In-Reply-To: <20260904132855.638117-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260904132855.638117-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904132855.638117-3-smostafa@google.com>
Subject: [PATCH v3 2/2] KVM: arm64: Support BBM level 3
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	qperret@google.com, linu.cherian@arm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_063039_770433_95B33896 
X-CRM114-Status: GOOD (  21.39  )
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

If the system supports hardware Break-Before-Make (BBM) level 3, use it
to replace stage-2 PTEs directly. Otherwise, fall back to the software
BBM sequence.

For BBML3 the sequence is:
1) Get a reference count on the containing table for the new PTE.
2) Atomically update the PTE with the new valid descriptor.
3) Invalidate the TLB for the old PTE.
4) Drop the reference count holding the old PTE.

Add 2 helpers:
1) kvm_pgtable_use_bbml3(): Checks for the architecture requirement
   for BBML3.

2) stage2_use_bbml3(): Extra checks added by SW design (FWB and DIC)
   - As BBML3 will update the PTE atomically, it can only know it
     raced with another core at the point of the cmpxchg failing,
     unlike the SW implementation which locks the PTE first.
     And as we must issue CMOs to the new mapped page before the
     update, that means with BBML3 racing cores will issue redundant
     CMOs.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 111 ++++++++++++++++++++++++++++-------
 1 file changed, 90 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index d670da8882a5..a9ba761e9a01 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -82,6 +82,27 @@ static bool kvm_pte_table(kvm_pte_t pte, s8 level)
 	return FIELD_GET(KVM_PTE_TYPE, pte) == KVM_PTE_TYPE_TABLE;
 }
 
+/*
+ * Check if BBML3 can be used for this PTE update.
+ * Fallback to software break-before-make for leaf-to-leaf changes.
+ */
+static bool kvm_pgtable_use_bbml3(const struct kvm_pgtable_visit_ctx *ctx,
+				  kvm_pte_t new)
+{
+	if (!system_supports_bbml3())
+		return false;
+
+	if (!kvm_pte_valid(ctx->old) || !kvm_pte_valid(new))
+		return false;
+
+	/* Block <-> Table is ok. */
+	if (kvm_pte_table(new, ctx->level) ||
+	    kvm_pte_table(ctx->old, ctx->level))
+		return true;
+
+	return false;
+}
+
 static kvm_pte_t *kvm_pte_follow(kvm_pte_t pte, struct kvm_pgtable_mm_ops *mm_ops)
 {
 	return mm_ops->phys_to_virt(kvm_pte_to_phys(pte));
@@ -835,25 +856,46 @@ static void stage2_clean_old_pte(const struct kvm_pgtable_visit_ctx *ctx,
 		mm_ops->put_page(ctx->ptep);
 }
 
+/*
+ * Don't use bbml3 for stage-2 if FWB or DIC are not supported
+ * as that means racing cores will issue duplicate CMOs.
+ */
+static bool stage2_use_bbml3(const struct kvm_pgtable_visit_ctx *ctx,
+			     kvm_pte_t new)
+{
+	if (!cpus_have_final_cap(ARM64_HAS_STAGE2_FWB) ||
+	    !cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
+		return false;
+
+	return kvm_pgtable_use_bbml3(ctx, new);
+}
+
 /**
  * stage2_try_break_pte() - Invalidates a pte according to the
  *			    'break-before-make' requirements of the
- *			    architecture.
+ *			    architecture, if BBML3 is supported it
+ *			    will be used and this function won't
+ *			    break the PTE.
  *
  * @ctx: context of the visited pte.
  * @mmu: stage-2 mmu
+ * @new: New pte installed in make.
  *
- * Returns: true if the pte was successfully broken.
+ * Returns: true if the pte was successfully broken or BBML3 is used.
  *
  * If the removed pte was valid, performs the necessary serialization and TLB
  * invalidation for the old value. For counted ptes, drops the reference count
  * on the containing table page.
  */
 static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
-				 struct kvm_s2_mmu *mmu)
+				 struct kvm_s2_mmu *mmu, kvm_pte_t new)
 {
 	kvm_pte_t locked_pte;
 
+	/* All handled in stage2_make_pte() */
+	if (stage2_use_bbml3(ctx, new))
+		return true;
+
 	if (stage2_pte_is_locked(ctx->old)) {
 		/*
 		 * Should never occur if this walker has exclusive access to the
@@ -873,16 +915,37 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
 	return true;
 }
 
-static void stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t new)
+static bool stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, struct kvm_s2_mmu *mmu,
+			    kvm_pte_t new)
 {
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
 
-	WARN_ON(!stage2_pte_is_locked(*ctx->ptep));
-
 	if (stage2_pte_is_counted(new))
 		mm_ops->get_page(ctx->ptep);
 
+	if (stage2_use_bbml3(ctx, new)) {
+		if (!kvm_pgtable_walk_shared(ctx)) {
+			/*
+			 * stage2_try_set_pte() uses WRITE_ONCE for non-shared walks,
+			 * lacking release semantics used in the software BBM case.
+			 */
+			smp_wmb();
+		}
+
+		if (!stage2_try_set_pte(ctx, new)) {
+			/* Raced with another core. */
+			if (stage2_pte_is_counted(new))
+				mm_ops->put_page(ctx->ptep);
+			return false;
+		}
+
+		stage2_clean_old_pte(ctx, mmu);
+		return true;
+	}
+
+	WARN_ON(!stage2_pte_is_locked(*ctx->ptep));
 	smp_store_release(ctx->ptep, new);
+	return true;
 }
 
 static bool stage2_unmap_defer_tlb_flush(struct kvm_pgtable *pgt)
@@ -1001,7 +1064,7 @@ static int stage2_map_walker_try_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 		return 0;
 	}
 
-	if (!stage2_try_break_pte(ctx, data->mmu))
+	if (!stage2_try_break_pte(ctx, data->mmu, new))
 		return -EAGAIN;
 
 	/* Perform CMOs before installation of the guest stage-2 PTE */
@@ -1014,7 +1077,8 @@ static int stage2_map_walker_try_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 	    stage2_pte_executable(new))
 		mm_ops->icache_inval_pou(kvm_pte_follow(new, mm_ops), granule);
 
-	stage2_make_pte(ctx, new);
+	if (!stage2_make_pte(ctx, data->mmu, new))
+		return -EAGAIN;
 
 	return 0;
 }
@@ -1057,19 +1121,21 @@ static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 	childp = mm_ops->zalloc_page(data->memcache);
 	if (!childp)
 		return -ENOMEM;
-
-	if (!stage2_try_break_pte(ctx, data->mmu)) {
-		mm_ops->put_page(childp);
-		return -EAGAIN;
-	}
-
 	/*
 	 * If we've run into an existing block mapping then replace it with
 	 * a table. Accesses beyond 'end' that fall within the new table
 	 * will be mapped lazily.
 	 */
 	new = kvm_init_table_pte(childp, mm_ops);
-	stage2_make_pte(ctx, new);
+	if (!stage2_try_break_pte(ctx, data->mmu, new)) {
+		mm_ops->put_page(childp);
+		return -EAGAIN;
+	}
+
+	if (!stage2_make_pte(ctx, data->mmu, new)) {
+		mm_ops->put_page(childp);
+		return -EAGAIN;
+	}
 
 	return 0;
 }
@@ -1549,18 +1615,21 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	if (IS_ERR(childp))
 		return PTR_ERR(childp);
 
-	if (!stage2_try_break_pte(ctx, mmu)) {
-		kvm_pgtable_stage2_free_unlinked(mm_ops, childp, level);
-		return -EAGAIN;
-	}
-
 	/*
 	 * Note, the contents of the page table are guaranteed to be made
 	 * visible before the new PTE is assigned because stage2_make_pte()
 	 * writes the PTE using smp_store_release().
 	 */
 	new = kvm_init_table_pte(childp, mm_ops);
-	stage2_make_pte(ctx, new);
+	if (!stage2_try_break_pte(ctx, mmu, new)) {
+		kvm_pgtable_stage2_free_unlinked(mm_ops, childp, level);
+		return -EAGAIN;
+	}
+
+	if (!stage2_make_pte(ctx, mmu, new)) {
+		kvm_pgtable_stage2_free_unlinked(mm_ops, childp, level);
+		return -EAGAIN;
+	}
 	return 0;
 }
 
-- 
2.55.0.979.g7e5102b832-goog


