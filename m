Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D00D5D689
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 20:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tthOirtAYAbVODGiUuOcdhR/O6us8nRui7ePy/4XFU=; b=sYFLWNwcchuSj5afPXMGvC0LOP
	OcTSqxjcepn2UyAPYmFuGIxJt5EEdyvXrbTxQ65Nc0anuXj2VhsMQUoHZvMa5RIVp1UwTfSsT0DMd
	keqY3tEbSMQ0hyq1H6txvYKy7bYzw8p5lHm/sRq7QohWC5xtel1gbs5NntlpMuyE/JT1LMX1kK/iT
	pn9TFu59ffICK2FN35jgMXohur2S5+CrWrvNzRfIOmWK8jxFZDCAFw9WdT8o8SaOIXwtCE7cWe89p
	bDKj9nKfdH8DYaPxr8z5fj2YMKOHNUhRfpBlPZt31m76wIx7ftFmanxXn9qtsie2yqrPqvq6RtSX+
	c+qLy3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t993C-00000008Edv-1IU0;
	Thu, 07 Nov 2024 20:24:18 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98zi-00000008E2u-0cLB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 20:20:43 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e59dc7df64so17925147b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 12:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731010840; x=1731615640; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1tthOirtAYAbVODGiUuOcdhR/O6us8nRui7ePy/4XFU=;
        b=2CXDU0isuYRCSj4pcsHYtr8GvI8GzFUwFstB2zmkSx6VmxnEdMr72hY/l1352c6/kA
         +bpHAs3eP73L6Ce0Q/mFkYsh1ZFSgbVQKzM+M2STrcm5RabKIekcvy94q1QZCbxR0STg
         bU1hDJ5frw5S78YfOlA/1QevmDyi6wzycNLpGYGXVAV3VxTbsBDLXC6zAXZSaQrJjn6x
         K3GZ01cSzmn9CimPos3/usLPc4NnlkyH24Rj0V58YTgi41xtqP78iSa2eyLTW17uBsff
         Zb5vYjY5NvCUjY1ssUdTjF/oZ39+4C3YlBXW9r2sD84w5q+yQ62plD7uTzvEvekhg9Qh
         YgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731010840; x=1731615640;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1tthOirtAYAbVODGiUuOcdhR/O6us8nRui7ePy/4XFU=;
        b=Gyiz0+ZCG9gCZV8t7T0MQ/SlfdbifBUFXTGA5CzSQVVIqFgxMF/owufuj94HxT8y9Q
         wpLcCCXr0gXKITL0d63uxgqNaBqrR7cPCO9pCTa4mHOc+kHciagStks6lQsNmSvVVnTn
         a6eeNLsSbqXdadXQKIDCIWphrPYXyKJnbaojw6X4uPREVI62bl4FO5SV2B2ae+zlVEza
         EZOMr11PfF6eqABI0nIB/1dBk2emyngq0pguF2EhMHqGBuyFE3kkPRzqElgHth6woTVb
         51B9t5ZAwC+Gd+ufHCYYVOlBfO/fKuUcQvTMPZY0alxCdgncX0QEgqhOD8LiV4huS6Pl
         f2xw==
X-Forwarded-Encrypted: i=1; AJvYcCVwLznsFwizpYFrTRJttOclfcxRxxw79x8Lpl+joy0C7EScc3TUPsYSdiSa+Lm8WO9GEKRBeybvAwRIJyFlp7I0@lists.infradead.org
X-Gm-Message-State: AOJu0YyhLv8mMZ+Mj/itVzvUCVivMxa9a9g4MGzK5Qsg3OSZ8pToW9s6
	cMqG9wW4ont4m9DEg4D/8DFz5opAFzsirvcnE76LQXtB/Qw8WrjutlIx20Kch9r8luytmKD/Eon
	3zw==
X-Google-Smtp-Source: AGHT+IGTqsn/Xtckt6+UQcvmaBMjWwhX3GjS38ldjfYHLBKaWt3NH7a5E1E88BJehCRrOBEtvF7Ru96C8rA=
X-Received: from yuzhao2.bld.corp.google.com ([2a00:79e0:2e28:6:a4c0:c64f:6cdd:91f8])
 (user=yuzhao job=sendgmr) by 2002:a05:690c:255:b0:6ea:4b3a:6703 with SMTP id
 00721157ae682-6eadc16949bmr149247b3.5.1731010840283; Thu, 07 Nov 2024
 12:20:40 -0800 (PST)
Date: Thu,  7 Nov 2024 13:20:28 -0700
In-Reply-To: <20241107202033.2721681-1-yuzhao@google.com>
Mime-Version: 1.0
References: <20241107202033.2721681-1-yuzhao@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107202033.2721681-2-yuzhao@google.com>
Subject: [PATCH v2 1/6] mm/hugetlb_vmemmap: batch-update PTEs
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_122042_220883_7058B057 
X-CRM114-Status: GOOD (  26.33  )
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

Convert vmemmap_remap_walk->remap_pte to ->remap_pte_range so that
vmemmap remap walks can batch-update PTEs.

The goal of this conversion is to allow architectures to implement
their own optimizations if possible, e.g., only to stop remote CPUs
once for each batch when updating vmemmap on arm64. It is not intended
to change the remap workflow nor should it by itself have any side
effects on performance.

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 mm/hugetlb_vmemmap.c | 163 ++++++++++++++++++++++++-------------------
 1 file changed, 91 insertions(+), 72 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 57b7f591eee8..46befab48d41 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -22,7 +22,7 @@
 /**
  * struct vmemmap_remap_walk - walk vmemmap page table
  *
- * @remap_pte:		called for each lowest-level entry (PTE).
+ * @remap_pte_range:	called on a range of PTEs.
  * @nr_walked:		the number of walked pte.
  * @reuse_page:		the page which is reused for the tail vmemmap pages.
  * @reuse_addr:		the virtual address of the @reuse_page page.
@@ -32,8 +32,8 @@
  *			operations.
  */
 struct vmemmap_remap_walk {
-	void			(*remap_pte)(pte_t *pte, unsigned long addr,
-					     struct vmemmap_remap_walk *walk);
+	void			(*remap_pte_range)(pte_t *pte, unsigned long start,
+					unsigned long end, struct vmemmap_remap_walk *walk);
 	unsigned long		nr_walked;
 	struct page		*reuse_page;
 	unsigned long		reuse_addr;
@@ -101,10 +101,6 @@ static int vmemmap_pmd_entry(pmd_t *pmd, unsigned long addr,
 	struct page *head;
 	struct vmemmap_remap_walk *vmemmap_walk = walk->private;
 
-	/* Only splitting, not remapping the vmemmap pages. */
-	if (!vmemmap_walk->remap_pte)
-		walk->action = ACTION_CONTINUE;
-
 	spin_lock(&init_mm.page_table_lock);
 	head = pmd_leaf(*pmd) ? pmd_page(*pmd) : NULL;
 	/*
@@ -129,33 +125,36 @@ static int vmemmap_pmd_entry(pmd_t *pmd, unsigned long addr,
 			ret = -ENOTSUPP;
 	}
 	spin_unlock(&init_mm.page_table_lock);
-	if (!head || ret)
+	if (ret)
 		return ret;
 
-	return vmemmap_split_pmd(pmd, head, addr & PMD_MASK, vmemmap_walk);
-}
+	if (head) {
+		ret = vmemmap_split_pmd(pmd, head, addr & PMD_MASK, vmemmap_walk);
+		if (ret)
+			return ret;
+	}
 
-static int vmemmap_pte_entry(pte_t *pte, unsigned long addr,
-			     unsigned long next, struct mm_walk *walk)
-{
-	struct vmemmap_remap_walk *vmemmap_walk = walk->private;
+	if (vmemmap_walk->remap_pte_range) {
+		pte_t *pte = pte_offset_kernel(pmd, addr);
 
-	/*
-	 * The reuse_page is found 'first' in page table walking before
-	 * starting remapping.
-	 */
-	if (!vmemmap_walk->reuse_page)
-		vmemmap_walk->reuse_page = pte_page(ptep_get(pte));
-	else
-		vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
-	vmemmap_walk->nr_walked++;
+		vmemmap_walk->nr_walked += (next - addr) / PAGE_SIZE;
+		/*
+		 * The reuse_page is found 'first' in page table walking before
+		 * starting remapping.
+		 */
+		if (!vmemmap_walk->reuse_page) {
+			vmemmap_walk->reuse_page = pte_page(ptep_get(pte));
+			pte++;
+			addr += PAGE_SIZE;
+		}
+		vmemmap_walk->remap_pte_range(pte, addr, next, vmemmap_walk);
+	}
 
 	return 0;
 }
 
 static const struct mm_walk_ops vmemmap_remap_ops = {
 	.pmd_entry	= vmemmap_pmd_entry,
-	.pte_entry	= vmemmap_pte_entry,
 };
 
 static int vmemmap_remap_range(unsigned long start, unsigned long end,
@@ -172,7 +171,7 @@ static int vmemmap_remap_range(unsigned long start, unsigned long end,
 	if (ret)
 		return ret;
 
-	if (walk->remap_pte && !(walk->flags & VMEMMAP_REMAP_NO_TLB_FLUSH))
+	if (walk->remap_pte_range && !(walk->flags & VMEMMAP_REMAP_NO_TLB_FLUSH))
 		flush_tlb_kernel_range(start, end);
 
 	return 0;
@@ -204,33 +203,45 @@ static void free_vmemmap_page_list(struct list_head *list)
 		free_vmemmap_page(page);
 }
 
-static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
-			      struct vmemmap_remap_walk *walk)
+static void vmemmap_remap_pte_range(pte_t *pte, unsigned long start, unsigned long end,
+				    struct vmemmap_remap_walk *walk)
 {
-	/*
-	 * Remap the tail pages as read-only to catch illegal write operation
-	 * to the tail pages.
-	 */
-	pgprot_t pgprot = PAGE_KERNEL_RO;
-	struct page *page = pte_page(ptep_get(pte));
-	pte_t entry;
-
-	/* Remapping the head page requires r/w */
-	if (unlikely(addr == walk->reuse_addr)) {
-		pgprot = PAGE_KERNEL;
-		list_del(&walk->reuse_page->lru);
+	int i;
+	struct page *page;
+	int nr_pages = (end - start) / PAGE_SIZE;
 
+	for (i = 0; i < nr_pages; i++) {
+		page = pte_page(ptep_get(pte + i));
+
+		list_add(&page->lru, walk->vmemmap_pages);
+	}
+
+	page = walk->reuse_page;
+
+	if (start == walk->reuse_addr) {
+		list_del(&page->lru);
+		copy_page(page_to_virt(page), (void *)walk->reuse_addr);
 		/*
-		 * Makes sure that preceding stores to the page contents from
-		 * vmemmap_remap_free() become visible before the set_pte_at()
-		 * write.
+		 * Makes sure that preceding stores to the page contents become
+		 * visible before set_pte_at().
 		 */
 		smp_wmb();
 	}
 
-	entry = mk_pte(walk->reuse_page, pgprot);
-	list_add(&page->lru, walk->vmemmap_pages);
-	set_pte_at(&init_mm, addr, pte, entry);
+	for (i = 0; i < nr_pages; i++) {
+		pte_t val;
+
+		/*
+		 * The head page must be mapped read-write; the tail pages are
+		 * mapped read-only to catch illegal modifications.
+		 */
+		if (!i && start == walk->reuse_addr)
+			val = mk_pte(page, PAGE_KERNEL);
+		else
+			val = mk_pte(page, PAGE_KERNEL_RO);
+
+		set_pte_at(&init_mm, start + PAGE_SIZE * i, pte + i, val);
+	}
 }
 
 /*
@@ -252,27 +263,39 @@ static inline void reset_struct_pages(struct page *start)
 	memcpy(start, from, sizeof(*from) * NR_RESET_STRUCT_PAGE);
 }
 
-static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
-				struct vmemmap_remap_walk *walk)
+static void vmemmap_restore_pte_range(pte_t *pte, unsigned long start, unsigned long end,
+				      struct vmemmap_remap_walk *walk)
 {
-	pgprot_t pgprot = PAGE_KERNEL;
+	int i;
 	struct page *page;
-	void *to;
-
-	BUG_ON(pte_page(ptep_get(pte)) != walk->reuse_page);
+	int nr_pages = (end - start) / PAGE_SIZE;
 
 	page = list_first_entry(walk->vmemmap_pages, struct page, lru);
-	list_del(&page->lru);
-	to = page_to_virt(page);
-	copy_page(to, (void *)walk->reuse_addr);
-	reset_struct_pages(to);
+
+	for (i = 0; i < nr_pages; i++) {
+		BUG_ON(pte_page(ptep_get(pte + i)) != walk->reuse_page);
+
+		copy_page(page_to_virt(page), (void *)walk->reuse_addr);
+		reset_struct_pages(page_to_virt(page));
+
+		page = list_next_entry(page, lru);
+	}
 
 	/*
 	 * Makes sure that preceding stores to the page contents become visible
-	 * before the set_pte_at() write.
+	 * before set_pte_at().
 	 */
 	smp_wmb();
-	set_pte_at(&init_mm, addr, pte, mk_pte(page, pgprot));
+
+	for (i = 0; i < nr_pages; i++) {
+		pte_t val;
+
+		page = list_first_entry(walk->vmemmap_pages, struct page, lru);
+		list_del(&page->lru);
+
+		val = mk_pte(page, PAGE_KERNEL);
+		set_pte_at(&init_mm, start + PAGE_SIZE * i, pte + i, val);
+	}
 }
 
 /**
@@ -290,7 +313,6 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end,
 			       unsigned long reuse)
 {
 	struct vmemmap_remap_walk walk = {
-		.remap_pte	= NULL,
 		.flags		= VMEMMAP_SPLIT_NO_TLB_FLUSH,
 	};
 
@@ -322,10 +344,10 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 {
 	int ret;
 	struct vmemmap_remap_walk walk = {
-		.remap_pte	= vmemmap_remap_pte,
-		.reuse_addr	= reuse,
-		.vmemmap_pages	= vmemmap_pages,
-		.flags		= flags,
+		.remap_pte_range	= vmemmap_remap_pte_range,
+		.reuse_addr		= reuse,
+		.vmemmap_pages		= vmemmap_pages,
+		.flags			= flags,
 	};
 	int nid = page_to_nid((struct page *)reuse);
 	gfp_t gfp_mask = GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN;
@@ -340,8 +362,6 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 	 */
 	walk.reuse_page = alloc_pages_node(nid, gfp_mask, 0);
 	if (walk.reuse_page) {
-		copy_page(page_to_virt(walk.reuse_page),
-			  (void *)walk.reuse_addr);
 		list_add(&walk.reuse_page->lru, vmemmap_pages);
 		memmap_pages_add(1);
 	}
@@ -371,10 +391,9 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 		 * They will be restored in the following call.
 		 */
 		walk = (struct vmemmap_remap_walk) {
-			.remap_pte	= vmemmap_restore_pte,
-			.reuse_addr	= reuse,
-			.vmemmap_pages	= vmemmap_pages,
-			.flags		= 0,
+			.remap_pte_range	= vmemmap_restore_pte_range,
+			.reuse_addr		= reuse,
+			.vmemmap_pages		= vmemmap_pages,
 		};
 
 		vmemmap_remap_range(reuse, end, &walk);
@@ -425,10 +444,10 @@ static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
 {
 	LIST_HEAD(vmemmap_pages);
 	struct vmemmap_remap_walk walk = {
-		.remap_pte	= vmemmap_restore_pte,
-		.reuse_addr	= reuse,
-		.vmemmap_pages	= &vmemmap_pages,
-		.flags		= flags,
+		.remap_pte_range	= vmemmap_restore_pte_range,
+		.reuse_addr		= reuse,
+		.vmemmap_pages		= &vmemmap_pages,
+		.flags			= flags,
 	};
 
 	/* See the comment in the vmemmap_remap_free(). */
-- 
2.47.0.277.g8800431eea-goog


