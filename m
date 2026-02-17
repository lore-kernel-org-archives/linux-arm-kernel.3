Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F1AE81A32
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ccrOPrs77JLfLQyNLHKkv8AljW063eQ33NPmiJWg7g=; b=UhRUsDB2xnDmGXXDn+UOqMgZSm
	pSxggJbfs40QLpX9TGJXrRoTrfZ4dZB30mcJYsIJh4XtUHgi8eMJJv9B/sl8Oze1svhPvhHs0VlLq
	53rmqkKmMLS3JKztZKx5KMszk8IT+x/u31wlILMlnBGMRhJTshitF+TYFJ8XqjymeQk7uYo3xiHGe
	vgEuFdsattzWBDTaHyv1BDu69XsXpU3EI0T6gXSNW6hmxqJXGU3tv2WMQiixLtO+TcBxTFooZDneh
	B5C7UaJ/mfd8B3nIwKSDPYespaPCI8qgUcCbHuRtc3IE4EMXsLCEOn/EoX1QrCLJ6a5IbejIGesvg
	MghQcTRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLF0-00000008Kf5-0wLx;
	Tue, 17 Feb 2026 13:35:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLEt-00000008KaS-1TYM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:35:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BCCB1477;
	Tue, 17 Feb 2026 05:35:36 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 087B73FD09;
	Tue, 17 Feb 2026 05:35:40 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jack Aboutboul <jaboutboul@microsoft.com>,
	Sharath George John <sgeorgejohn@microsoft.com>,
	Noah Meyerhans <nmeyerhans@microsoft.com>,
	Jim Perrin <Jim.Perrin@microsoft.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 6.1 3/3] arm64: mm: Don't remap pgtables for allocate vs populate
Date: Tue, 17 Feb 2026 13:35:24 +0000
Message-ID: <20260217133527.2881603-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217133527.2881603-1-ryan.roberts@arm.com>
References: <20260217133527.2881603-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_053543_545739_1FF56584 
X-CRM114-Status: GOOD (  16.38  )
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

[ Upstream commit 0e9df1c905d8293d333ace86c13d147382f5caf9 ]

During linear map pgtable creation, each pgtable is fixmapped /
fixunmapped twice; once during allocation to zero the memory, and a
again during population to write the entries. This means each table has
2 TLB invalidations issued against it. Let's fix this so that each table
is only fixmapped/fixunmapped once, halving the number of TLBIs, and
improving performance.

Achieve this by separating allocation and initialization (zeroing) of
the page. The allocated page is now fixmapped directly by the walker and
initialized, before being populated and finally fixunmapped.

This approach keeps the change small, but has the side effect that late
allocations (using __get_free_page()) must also go through the generic
memory clearing routine. So let's tell __get_free_page() not to zero the
memory to avoid duplication.

Additionally this approach means that fixmap/fixunmap is still used for
late pgtable modifications. That's not technically needed since the
memory is all mapped in the linear map by that point. That's left as a
possible future optimization if found to be needed.

Execution time of map_mem(), which creates the kernel linear map page
tables, was measured on different machines with different RAM configs:

               | Apple M2 VM | Ampere Altra| Ampere Altra| Ampere Altra
               | VM, 16G     | VM, 64G     | VM, 256G    | Metal, 512G
---------------|-------------|-------------|-------------|-------------
               |   ms    (%) |   ms    (%) |   ms    (%) |    ms    (%)
---------------|-------------|-------------|-------------|-------------
before         |   11   (0%) |  161   (0%) |  656   (0%) |  1654   (0%)
after          |   10 (-11%) |  104 (-35%) |  438 (-33%) |  1223 (-26%)

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Tested-by: Eric Chanudet <echanude@redhat.com>
Reviewed-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Link: https://lore.kernel.org/r/20240412131908.433043-4-ryan.roberts@arm.com
Signed-off-by: Will Deacon <will@kernel.org>
[ Ryan: Trivial backport ]
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/mm/mmu.c | 58 ++++++++++++++++++++++-----------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index ca06b5e131e0f..ca0bf180082d3 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -110,28 +110,12 @@ EXPORT_SYMBOL(phys_mem_access_prot);
 static phys_addr_t __init early_pgtable_alloc(int shift)
 {
 	phys_addr_t phys;
-	void *ptr;

 	phys = memblock_phys_alloc_range(PAGE_SIZE, PAGE_SIZE, 0,
 					 MEMBLOCK_ALLOC_NOLEAKTRACE);
 	if (!phys)
 		panic("Failed to allocate page table page\n");

-	/*
-	 * The FIX_{PGD,PUD,PMD} slots may be in active use, but the FIX_PTE
-	 * slot will be free, so we can (ab)use the FIX_PTE slot to initialise
-	 * any level of table.
-	 */
-	ptr = pte_set_fixmap(phys);
-
-	memset(ptr, 0, PAGE_SIZE);
-
-	/*
-	 * Implicit barriers also ensure the zeroed page is visible to the page
-	 * table walker
-	 */
-	pte_clear_fixmap();
-
 	return phys;
 }

@@ -169,6 +153,14 @@ static bool pgattr_change_is_safe(u64 old, u64 new)
 	return ((old ^ new) & ~mask) == 0;
 }

+static void init_clear_pgtable(void *table)
+{
+	clear_page(table);
+
+	/* Ensure the zeroing is observed by page table walks. */
+	dsb(ishst);
+}
+
 static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 		     phys_addr_t phys, pgprot_t prot)
 {
@@ -211,12 +203,15 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 			pmdval |= PMD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pte_phys = pgtable_alloc(PAGE_SHIFT);
+		ptep = pte_set_fixmap(pte_phys);
+		init_clear_pgtable(ptep);
+		ptep += pte_index(addr);
 		__pmd_populate(pmdp, pte_phys, pmdval);
-		pmd = READ_ONCE(*pmdp);
+	} else {
+		BUG_ON(pmd_bad(pmd));
+		ptep = pte_set_fixmap_offset(pmdp, addr);
 	}
-	BUG_ON(pmd_bad(pmd));

-	ptep = pte_set_fixmap_offset(pmdp, addr);
 	do {
 		pgprot_t __prot = prot;

@@ -295,12 +290,15 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 			pudval |= PUD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pmd_phys = pgtable_alloc(PMD_SHIFT);
+		pmdp = pmd_set_fixmap(pmd_phys);
+		init_clear_pgtable(pmdp);
+		pmdp += pmd_index(addr);
 		__pud_populate(pudp, pmd_phys, pudval);
-		pud = READ_ONCE(*pudp);
+	} else {
+		BUG_ON(pud_bad(pud));
+		pmdp = pmd_set_fixmap_offset(pudp, addr);
 	}
-	BUG_ON(pud_bad(pud));

-	pmdp = pmd_set_fixmap_offset(pudp, addr);
 	do {
 		pgprot_t __prot = prot;

@@ -338,12 +336,15 @@ static void alloc_init_pud(pgd_t *pgdp, unsigned long addr, unsigned long end,
 			p4dval |= P4D_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pud_phys = pgtable_alloc(PUD_SHIFT);
+		pudp = pud_set_fixmap(pud_phys);
+		init_clear_pgtable(pudp);
+		pudp += pud_index(addr);
 		__p4d_populate(p4dp, pud_phys, p4dval);
-		p4d = READ_ONCE(*p4dp);
+	} else {
+		BUG_ON(p4d_bad(p4d));
+		pudp = pud_set_fixmap_offset(p4dp, addr);
 	}
-	BUG_ON(p4d_bad(p4d));

-	pudp = pud_set_fixmap_offset(p4dp, addr);
 	do {
 		pud_t old_pud = READ_ONCE(*pudp);

@@ -425,11 +426,10 @@ void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,

 static phys_addr_t __pgd_pgtable_alloc(int shift)
 {
-	void *ptr = (void *)__get_free_page(GFP_PGTABLE_KERNEL);
-	BUG_ON(!ptr);
+	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
+	void *ptr = (void *)__get_free_page(GFP_PGTABLE_KERNEL & ~__GFP_ZERO);

-	/* Ensure the zeroed page is visible to the page table walker */
-	dsb(ishst);
+	BUG_ON(!ptr);
 	return __pa(ptr);
 }

--
2.43.0


