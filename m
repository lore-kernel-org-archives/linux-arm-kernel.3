Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B486FC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 18:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N52o3BVp773wN3Idd00jSA0m0Lpy2g57ImYGMyeejhc=; b=o2MkDu9oN+txDIoKFNcTJTQA3/
	J9hDboADQNm1DKgCdHPdFOZoGMsJl0fAmGddEgiVfTE8gZ2KezWL5YZyFfdpXJ1D1kreYaXscUFJf
	wGdEm547lVzqOatA3JswOwlMWJiCxZMPOPCXAl5FEFZNUzMQeOgM88fOTDqEGiZc4tumqoFbTOrQT
	Dnwwv2fohForXS8CwmcA9fMm6m8wf6h/i/PosDhNz/Dank8WijL8nrpSBXJfWOfGfDu5XLii+bYVC
	+nE6dOKxUfjg8qHXmmW7fJDPZQSaVnQJv9Sa4bhoNDpGOFGvRY2B4tphdaHGmZfgBsg4v4BcuyHsP
	NxqPdqJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmy3R-0000000EsfL-0I7D;
	Thu, 23 Jul 2026 18:21:57 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmy3N-0000000Esdl-3qON
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 18:21:55 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4957287363bso6601635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 11:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784830911; x=1785435711; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N52o3BVp773wN3Idd00jSA0m0Lpy2g57ImYGMyeejhc=;
        b=VVEMONnbAugMvQA82BeNI42wYaANytLROGWQcK8/Z71A1gir7A/hHI6NfkHSeKttdr
         pG/efYe1878G2qWTQtuzBCidnLg9IOhspotKE1WQYWMc+shyNG6GnKBFZEILjxBiQo4k
         jRTIwqdzfG8+bzVdRm+Lhy63SqqYgts92rUdKgd1f/fySWPw5Bdylu7alk+GsSap5rCL
         K6nqfqvGQ96H8kpiRwuE3SUDGEiD1gy6hzyQU3gXNkccorGx4FYyGfjnavkBRrq4rIFb
         H2tACVUPTgFEEBBgaWBw8EI0Jh9HhBq10HnNlGaY7vJCgOco1TLj521pZY/WYMJZxU1P
         UtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784830911; x=1785435711;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N52o3BVp773wN3Idd00jSA0m0Lpy2g57ImYGMyeejhc=;
        b=c9Yrr6g7XS13Ry2Co7Oa9UszQU8y9mz1cJpaPry9oE6InzicujjKm5euywrDcemahI
         a8ACi7El4QSExEiwS01M7yhhnsJbc6mOw5JD1YytBYWN84GPgrHfiI6n61T8exEZ9lE+
         xHEqnuwwmpgsIpwucdnHn5aFuLHAAvbFYTmaK2Ny/FeW4h/kX3EarYYhWvA5qrmeWojR
         TExgzBQHmjo5em2BjFAqXZqnGd0EcVwyEe0u3kkZkmRYHXV0l/v6OAMX52jPELPAb9hY
         SHkXK7yAtmRSdEDEXHs4x9PbcL/XqaBABNXuqQP1sdCJFjRKpdHTJeHocAq1tMabYvYN
         /Bbg==
X-Forwarded-Encrypted: i=1; AHgh+RrA9m/nk+2WdBTX0F2tjhOuDxRoJuPiyVWYMFQgyVbmxMRgb9ov7Z6EdMHY/+wwMlpkYB6A5EunVh+4XZ2UPVxh@lists.infradead.org
X-Gm-Message-State: AOJu0YwnX2XPJzNoisUWVrVrJtNNwIR+BMNSQGPlcsJ1HHNdhbkiT2LB
	zWqneNp0RTXBb6O0b/fTlhTafWrO7Fik+RF6W4siCLrWuWjdTPpY29vqArad6PYQAd2kFlmoUy4
	AjLLz9QTOUAKlrg==
X-Received: from wrhm19.prod.google.com ([2002:a05:6000:1813:b0:472:9520:f359])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:c84c:0:b0:495:3eb2:b763 with SMTP id 5b1f17b1804b1-49573cffa2emr35967485e9.21.1784830911229;
 Thu, 23 Jul 2026 11:21:51 -0700 (PDT)
Date: Thu, 23 Jul 2026 18:21:40 +0000
In-Reply-To: <20260723182140.4025575-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260723182140.4025575-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260723182140.4025575-3-smostafa@google.com>
Subject: [RFC PATCH v2 2/2] KVM: arm64: Support BBM level 3
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	linu.cherian@arm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_112153_992294_F8E3A1A3 
X-CRM114-Status: GOOD (  18.71  )
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

One interesting case, as BBML3 will update the PTE atomically, it
can only know it raced with another core at the point of the cmpxchg
failing, unlike the SW implementation which locks the PTE first.
And as we must issue CMOs to the new mapped page before the update,
that means with BBML3 racing cores will issue redundant CMOs.
To avoid this, limit BBML3 support for systems with DIC and FWB,
which does not require CMOs.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 58 +++++++++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index d670da8882a5..4644b596f020 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -835,10 +835,24 @@ static void stage2_clean_old_pte(const struct kvm_pgtable_visit_ctx *ctx,
 		mm_ops->put_page(ctx->ptep);
 }
 
+/*
+ * We assume that KVM will never change the OA of an active translation.
+ * If the host needs to move the backing PFN, it should do an explicit
+ * unmap to issue the required TLBI.
+ */
+static bool stage2_use_bbml3(void)
+{
+	return system_supports_bbml3() &&
+	       cpus_have_final_cap(ARM64_HAS_STAGE2_FWB) &&
+	       cpus_have_final_cap(ARM64_HAS_CACHE_DIC);
+}
+
 /**
  * stage2_try_break_pte() - Invalidates a pte according to the
  *			    'break-before-make' requirements of the
- *			    architecture.
+ *			    architecture, if BMML3 is supported it
+ *			    will be used, meaning that this function
+ *			    won't break the PTE.
  *
  * @ctx: context of the visited pte.
  * @mmu: stage-2 mmu
@@ -854,6 +868,10 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
 {
 	kvm_pte_t locked_pte;
 
+	/* All handled in stage2_make_pte() */
+	if (stage2_use_bbml3() && kvm_pte_valid(ctx->old))
+		return true;
+
 	if (stage2_pte_is_locked(ctx->old)) {
 		/*
 		 * Should never occur if this walker has exclusive access to the
@@ -873,16 +891,35 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
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
 
+	if (stage2_use_bbml3() && kvm_pte_valid(ctx->old)) {
+		/*
+		 * Barrier is required because stage2_try_set_pte() uses
+		 * WRITE_ONCE for non-shared walks, lacking release semantics
+		 * used in the software BBM case.
+		 */
+		smp_wmb();
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
@@ -1014,7 +1051,8 @@ static int stage2_map_walker_try_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 	    stage2_pte_executable(new))
 		mm_ops->icache_inval_pou(kvm_pte_follow(new, mm_ops), granule);
 
-	stage2_make_pte(ctx, new);
+	if (!stage2_make_pte(ctx, data->mmu, new))
+		return -EAGAIN;
 
 	return 0;
 }
@@ -1069,7 +1107,10 @@ static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 	 * will be mapped lazily.
 	 */
 	new = kvm_init_table_pte(childp, mm_ops);
-	stage2_make_pte(ctx, new);
+	if (!stage2_make_pte(ctx, data->mmu, new)) {
+		mm_ops->put_page(childp);
+		return -EAGAIN;
+	}
 
 	return 0;
 }
@@ -1560,7 +1601,10 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	 * writes the PTE using smp_store_release().
 	 */
 	new = kvm_init_table_pte(childp, mm_ops);
-	stage2_make_pte(ctx, new);
+	if (!stage2_make_pte(ctx, mmu, new)) {
+		kvm_pgtable_stage2_free_unlinked(mm_ops, childp, level);
+		return -EAGAIN;
+	}
 	return 0;
 }
 
-- 
2.55.0.229.g6434b31f56-goog


