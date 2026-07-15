Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D7DC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVD5YICoFs6IGZko2faFmBTnBcS21tFoTzk2EZjj06c=; b=z1rlfkDZa2gw1ErGeyUKO+e2f9
	rGhSzhO2+1/5peZxQBmCX64ovSyoCb9Qt3LI8kJafXwH6Rd54bOzjVeDwr2bvynEY32V+LeA31GkZ
	Z9Y1fcQA0vLlTUAMwojHzyS/IKjSaW74X8TTjajrUj1O9pyJJhaLbvJUSD36UOSPV2XSw2Fy+inPp
	tkq+IgqXD0OStYSiBlCfWxULvtSSGsEO7FJdGtZHuRKVATQqghePtCwrQWuljdYTAhJ0exDjTr5hS
	sDO6eUJEA6bv7CB5e18oYHOP9S+LUp80UuJS0+QL9JaccjXiUz4yfuxzyGHIFog4thrIh4Zid6wk5
	jnmOr9Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4Uc-0000000FhVz-0UqD;
	Wed, 15 Jul 2026 18:38:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4Ub-0000000FhVm-0ReG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:38:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A5DE64017F;
	Wed, 15 Jul 2026 18:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA981F000E9;
	Wed, 15 Jul 2026 18:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784140680;
	bh=MVD5YICoFs6IGZko2faFmBTnBcS21tFoTzk2EZjj06c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=R6YsU9y3n0TDYpeduksymjcvij1ta9ZUFduBjNE7KPDuG5FCrySIN/Cl0MsGX6Z/k
	 DmTqgFlF9pAO0Rsv439GGi7L1XAUCT2c26cG8ZSzZlC/9K6gGkhbfaXOdFc2lrUQO0
	 LLG3nqzkh3F0SkMWkSaLYY9twTc7K23pSBMbE8OE=
Date: Wed, 15 Jul 2026 11:37:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
 anshuman.khandual@arm.com, david@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rppt@kernel.org, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 Wen Jiang <jiangwen6@xiaomi.com>
Subject: Re: [PATCH v7 0/7] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
Message-Id: <20260715113759.74d68fef26f1df0c6bbcc85c@linux-foundation.org>
In-Reply-To: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 15 Jul 2026 20:08:06 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:

> This patchset accelerates ioremap, vmalloc, and vmap when the memory
> is physically fully or partially contiguous. Two techniques are used:

Thanks, I've updated mm.git's mm-unstable branch to this version.

> Changes since v6:
> - Add a clarifying comment about the reuse of hugetlb helpers
>   by non-hugetlbfs(vmalloc) mm code (patch 1)
> - Expand the arm64/vmalloc commit message and comment to clarify that
>   multi-CONT_PTE_SIZE values are vmalloc mapping spans, not HugeTLB
>   hstate sizes (patch 2)
> - Move the local steps variable change in vmap_pte_range() into the
>   vmap_set_ptes() extraction patch (patch 3)
> - Propagate vmap_pages_pte_range() errors through the upper
>   vmap_pages_*() levels instead of returning -ENOMEM for all failures
>   (patch 4)
> - Add a preparatory vm_shift() helper patch before the batching patch
>   (patch 5)
> - Guard the PFN alignment clamp in get_vmap_batch_order() against PFN 0
>   before calling __ffs() (patch 6)
> - Fix kmsan_vmap_pages_range_noflush() indentation in the batching path
>   (patch 6)

Here's how v7 altered mm.git:


 arch/arm64/include/asm/vmalloc.h |    2 +
 arch/arm64/mm/hugetlbpage.c      |    5 ++++
 mm/vmalloc.c                     |   31 ++++++++++++++++-------------
 3 files changed, 25 insertions(+), 13 deletions(-)

--- a/arch/arm64/include/asm/vmalloc.h~b
+++ a/arch/arm64/include/asm/vmalloc.h
@@ -29,6 +29,8 @@ static inline unsigned long arch_vmap_pt
 	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
 	 * aligned in both virtual and physical space, then we can pte-map the
 	 * block using the PTE_CONT bit for more efficient use of the TLB.
+	 * The returned mapping size may cover multiple CONT_PTE_SIZE blocks,
+	 * capped below PMD_SIZE.
 	 */
 	if (max_page_shift < CONT_PTE_SHIFT)
 		return PAGE_SIZE;
--- a/arch/arm64/mm/hugetlbpage.c~b
+++ a/arch/arm64/mm/hugetlbpage.c
@@ -94,6 +94,11 @@ static int find_num_contig(struct mm_str
 	return CONT_PTES;
 }
 
+/*
+ * num_contig_ptes(), set_huge_pte_at() and arch_make_huge_pte() can be
+ * used by non-hugetlbfs(vmalloc) mm code to set multiple huge mappings
+ * at the PTE level.
+ */
 static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
 {
 	int contig_ptes = 1;
--- a/mm/vmalloc.c~b
+++ a/mm/vmalloc.c
@@ -616,6 +616,7 @@ static int vmap_pages_pmd_range(pud_t *p
 {
 	pmd_t *pmd;
 	unsigned long next;
+	int err;
 
 	pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
 	if (!pmd)
@@ -642,8 +643,9 @@ static int vmap_pages_pmd_range(pud_t *p
 			}
 		}
 
-		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift))
-			return -ENOMEM;
+		err = vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (pmd++, addr = next, addr != end);
 	return 0;
 }
@@ -654,14 +656,16 @@ static int vmap_pages_pud_range(p4d_t *p
 {
 	pud_t *pud;
 	unsigned long next;
+	int err;
 
 	pud = pud_alloc_track(&init_mm, p4d, addr, mask);
 	if (!pud)
 		return -ENOMEM;
 	do {
 		next = pud_addr_end(addr, end);
-		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift))
-			return -ENOMEM;
+		err = vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (pud++, addr = next, addr != end);
 	return 0;
 }
@@ -672,14 +676,16 @@ static int vmap_pages_p4d_range(pgd_t *p
 {
 	p4d_t *p4d;
 	unsigned long next;
+	int err;
 
 	p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
 	if (!p4d)
 		return -ENOMEM;
 	do {
 		next = p4d_addr_end(addr, end);
-		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift))
-			return -ENOMEM;
+		err = vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (p4d++, addr = next, addr != end);
 	return 0;
 }
@@ -3591,6 +3597,7 @@ static inline unsigned int vm_shift(pgpr
 static inline int get_vmap_batch_order(struct page **pages,
 		pgprot_t prot, unsigned int max_steps, unsigned int idx)
 {
+	unsigned long pfn;
 	unsigned int nr_contig;
 	int order;
 
@@ -3602,9 +3609,11 @@ static inline int get_vmap_batch_order(s
 		return 0;
 
 	order = ilog2(nr_contig);
+	pfn = page_to_pfn(pages[idx]);
 
 	/* Limit order by pfn alignment */
-	order = min_t(int, order, __ffs(page_to_pfn(pages[idx])));
+	if (pfn > 0)
+		order = min_t(int, order, __ffs(pfn));
 
 	if (vm_shift(prot, PAGE_SIZE << order) == PAGE_SHIFT)
 		return 0;
@@ -3621,7 +3630,7 @@ static int vmap_pages_range_batched(unsi
 	int err;
 
 	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
-						PAGE_SHIFT, GFP_KERNEL);
+					     PAGE_SHIFT, GFP_KERNEL);
 	if (err)
 		goto out;
 
@@ -4199,11 +4208,7 @@ void *__vmalloc_node_range_noprof(unsign
 		 * supporting them.
 		 */
 
-		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
-			shift = PMD_SHIFT;
-		else
-			shift = arch_vmap_pte_supported_shift(size);
-
+		shift = vm_shift(prot, size);
 		align = max(original_align, 1UL << shift);
 	}
 
_


