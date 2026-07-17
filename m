Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92BAC44521
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 13:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+n0quTBKTLkuwq9QawKwspQRW3gBb6Rua2VTww6C7Lw=; b=cUiPhk10qsD2Fo0DpfWLMJG4iv
	cRVoZYJFEDBb9JlZb7tCSyEcFZF5ES+Q27Tr+Gb7vc2rqpvmdUTlg7kwHKEW7wJV6rwYzz2+DUi1x
	k0bcjTuJPq3iEAfi7V3nh+OZ6YcO2kGpxz4dXT3JPNh+yOF2imtr6sVcliwZ670TGjCmSZSfLOU/f
	qOi5jck+cPB84PiKCFHdon3PUgYpOMlKe82zjzHOibwEkyTqgIKGtg/ZvkIO6THpuJCFRfB0NGvuM
	fwwawO8AOLaf3qRg+xuN5DQsXeJv0AEz3Y7Y0FrzoWPKDNvXotSWxgK8axaZU2Xqp9jME9DeMHoy2
	CdTa1lKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiJX-00000002MyC-24Ru;
	Fri, 17 Jul 2026 13:09:15 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiJS-00000002MuV-17dC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 13:09:11 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4953c5d6d87so31914965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 06:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784293748; x=1784898548; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+n0quTBKTLkuwq9QawKwspQRW3gBb6Rua2VTww6C7Lw=;
        b=s11aYA9J0dF9SSa9cOwLceTdpjL69ftakTzuWhcxrxL7fBpC10+DHzTG3Ud5OwRCOs
         FnX0tJrywvsYZEQEiF/2bpjV8PjBP+E52WRZC6CyDALaCIGApCRrb8Cv/XMkcRz8HgPS
         p5aXkTcSc9I99wR/WTfXJU0A+ctTrZF5N1JSK1JzXsQZTeGCgqxNioANrHfaxBnjU60V
         2NMdJ050c3Ng2nDwx0veJ7vlI0svTxWwHy8UyL/hpRBo1bv+RzCBGT8mP3GlbeCq5PRD
         N63VQ7ea/dR3yrG+qL2i5I/0VLz4Y3ETj0Hstra0PADENCcbjkdWR8dk7ZoDWCaFyvmS
         C2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784293748; x=1784898548;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+n0quTBKTLkuwq9QawKwspQRW3gBb6Rua2VTww6C7Lw=;
        b=Keh1Ro8P7sHWfT427JejQWZX45smZg6XLAmNwcCGxLNNl5Kpz7hlQiFe5v9uqkBRWu
         bOLW2Noe+N1VEmMHDx6sUz25SlUoiUaSo/94rDfGfl7setVsEMyO2R4OX6HnmP658QLH
         KUDPcdhHywhgtjkX0HSi1g2qkwOQs/XAkZ0nObop79VedxDgyto193HOVa+ooP70dFhI
         kZv3wD3TcLQ2tEOlv+N5RmVWpxsJ+3AUgGhXgKzIGdJ1GgB7ZJWM8cz6VWcyHsaMJMwX
         StzThaPGuuo0n0fwBSN2sHsTciNkmh82hQJjtZYhqyCgJkoR1BqtJ7z/6fQYcNP8gxvh
         /Saw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8H/Bj5OlkQ8g/k/k1X1/KQxzA2KmAKafPYN3f/vhbQcJnFddpgl7GwS3PnFVtJ1PHMkcTN4zYJF5PmXXydTZP@lists.infradead.org
X-Gm-Message-State: AOJu0YzGjvqe4xAsxv8DIAZRRXrrqwuFNyqe5S+7+jz3F/uUH9YjTQ9C
	AigGIA0EdRs/EmlMvFqu4NZP4osueRQsMiHYUOLtiffnF9FG8FJ7lBZw8ggaDvjTxlVcjSmaJ67
	PLsBbkLzbKJWPiQ==
X-Received: from wrbcg5.prod.google.com ([2002:a5d:5cc5:0:b0:47f:4f99:b306])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154e:b0:495:49eb:1ccc with SMTP id 5b1f17b1804b1-4954a3eff56mr32478345e9.13.1784293747452;
 Fri, 17 Jul 2026 06:09:07 -0700 (PDT)
Date: Fri, 17 Jul 2026 13:09:00 +0000
In-Reply-To: <20260717130901.2239134-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260717130901.2239134-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260717130901.2239134-3-smostafa@google.com>
Subject: [RFC PATCH 2/2] KVM: arm64: Support BBM level 3
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_060910_331994_B36CA515 
X-CRM114-Status: GOOD (  18.11  )
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
to replace stage-2 PTEs directly instead of falling back to the software
break-before-make sequence.

1) Get a reference count on the containing table for the new PTE.
2) Atomically update the PTE with the new valid descriptor.
3) Invalidate the TLB for the old PTE.
4) Drop the reference count holding the old PTE.

One interesting case, as BBML3 will update the PTE atomically, it
can only know it raced with another core at the point of the cmpxchg
failing, unlike the SW implementation which locks the PTE first.
And as we must issue CMOs to the new mapped page before the update,
that means with BBML3 racing cores will issue redundant CMOs,
to improve this:
- We only use BBML3 if the old PTE was live.
- To reduce the window of the race, an early check is added before
  the CMO to exit early, but that does not eliminate the race.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 53 +++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 127b7f9541b1..69d52308236f 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -838,7 +838,8 @@ static void stage2_clean_old_pte(const struct kvm_pgtable_visit_ctx *ctx,
 /**
  * stage2_try_break_pte() - Invalidates a pte according to the
  *			    'break-before-make' requirements of the
- *			    architecture.
+ *			    architecture, if BMML3 is supported it
+ *			    will be used, otherwise fallback to SW.
  *
  * @ctx: context of the visited pte.
  * @mmu: stage-2 mmu
@@ -854,6 +855,18 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
 {
 	kvm_pte_t locked_pte;
 
+	if (system_supports_bbml3() && kvm_pte_valid(ctx->old)) {
+		kvm_pte_t curr_pte = READ_ONCE(*ctx->ptep);
+
+		/*
+		 * All handled in stage2_make_pte(). However exit early if we already
+		 * lost the race to avoid extra CMOs.
+		 */
+		 if (curr_pte != ctx->old)
+			return false;
+		 return true;
+	}
+
 	if (stage2_pte_is_locked(ctx->old)) {
 		/*
 		 * Should never occur if this walker has exclusive access to the
@@ -873,16 +886,35 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
 	return true;
 }
 
-static void stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t new)
+/* Must be paired with stage2_try_break_pte() */
+static bool stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, struct kvm_s2_mmu *mmu,
+			    kvm_pte_t new)
 {
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
 
-	WARN_ON(!stage2_pte_is_locked(*ctx->ptep));
-
 	if (stage2_pte_is_counted(new))
 		mm_ops->get_page(ctx->ptep);
 
+	if (system_supports_bbml3() && kvm_pte_valid(ctx->old)) {
+		/*
+		 * Barrier is required because stage2_try_set_pte() uses
+		 * WRITE_ONCE for non-shared walks, lacking release semantics
+		 * used in the software BBM case.
+		 */
+		smp_wmb();
+		if (!stage2_try_set_pte(ctx, new)) {
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
@@ -1014,7 +1046,8 @@ static int stage2_map_walker_try_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 	    stage2_pte_executable(new))
 		mm_ops->icache_inval_pou(kvm_pte_follow(new, mm_ops), granule);
 
-	stage2_make_pte(ctx, new);
+	if (!stage2_make_pte(ctx, data->mmu, new))
+		return -EAGAIN;
 
 	return 0;
 }
@@ -1069,7 +1102,10 @@ static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
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
@@ -1557,7 +1593,10 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
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


