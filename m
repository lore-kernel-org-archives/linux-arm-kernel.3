Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D576C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0oPRrgKcuuA+3U0YyqK7D70URxIq3yDHbaKBG07nKg=; b=47fOLWkeNJZ3yknOhJ8d2Swg7x
	q/jswO7zaDxTuMh69nAj20OHwEVubjsW+EXV0PoGQ//KLk2a3UhZVntaiTIvu32uIRGsjOVHaGbtn
	UDkgZ5biGm6h2081I8FiQRyYtszt0hLzRWScJsznBKZJFj7Mm7bB8T2PqmX3NSK1pENMMrzqMxsfo
	XJyfL6eAegNRmRdhFWojbz82S0HvE3ohUGz5dKXEa2IRjwgI2yCa0HhrVA+3mPTSaxqau8pVa4OEH
	yrE3cAP4hwvW6K84KHpPsHzQKSUUcx6M12TJFfXPuOeA0oRWFgbPTebpVVUcy9MAaXhaLapGiHXBh
	VzbYEuCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBaZ-00000002zEK-2UfE;
	Mon, 17 Mar 2025 14:37:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBLz-00000002uct-3Bnb;
	Mon, 17 Mar 2025 14:22:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49B6813D5;
	Mon, 17 Mar 2025 07:22:16 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2274D3F63F;
	Mon, 17 Mar 2025 07:22:03 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 08/11] arm64: mm: Always call PTE/PMD ctor in __create_pgd_mapping()
Date: Mon, 17 Mar 2025 14:16:57 +0000
Message-ID: <20250317141700.3701581-9-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250317141700.3701581-1-kevin.brodsky@arm.com>
References: <20250317141700.3701581-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_072207_894283_0C6C3E74 
X-CRM114-Status: GOOD (  22.94  )
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

TL;DR: always call the PTE/PMD ctor, passing the appropriate mm to
skip ptlock_init() if unneeded.

__create_pgd_mapping() is used for creating different kinds of
mappings, and may allocate page table pages if passed an allocator
callback. There are currently three such cases:

1. create_pgd_mapping(), which is used to create the EFI mapping
2. arch_add_memory()
3. map_entry_trampoline()

1. uses pgd_pgtable_alloc() as allocator callback, which calls the
PTE/PMD ctor, while 2. and 3. use __pgd_pgtable_alloc(), which does
not. The rationale is most likely that pgtables associated with
init_mm do not make use of split page table locks, and it is
therefore unnecessary to initialise them by calling the ctor. 2.
operates on swapper_pg_dir so the allocated pgtables are clearly
associated with init_mm, this is arguably the case for 3. too (the
trampoline mapping is never modified so ptlocks are anyway
irrelevant). 1. corresponds to efi_mm so ptlocks need to be
initialised in that case.

We are now moving towards calling the ctor for all page tables, even
those associated with init_mm. pagetable_{pte,pmd}_ctor() have
become aware of the associated mm so that the ptlock initialisation
can be skipped for init_mm. This patch therefore amends the
allocator callbacks so that the PTE/PMD ctor are always called, with
an appropriate mm pointer to avoid unnecessary ptlock overhead.

Modifying the prototype of the allocator callbacks to take the mm
and propagating that pointer all the way down would be pretty
invasive. Instead:

* __pgd_pgtable_alloc() (cases 2. and 3. above) is replaced with
  pgd_pgtable_alloc_init_mm(), resulting in the ctors being called
  with &init_mm. This is the main functional change in this patch;
  the ptlock still isn't initialised, but other ctor actions (e.g.
  accounting-related) are now carried out for those allocated
  pgtables.

* pgd_pgtable_alloc() (case 1. above) is replaced with
  pgd_pgtable_alloc_special_mm(), resulting in the ctors being
  called with NULL as mm. No functional change here; NULL
  essentially means "not init_mm", and the ptlock is still
  initialised.

__pgd_pgtable_alloc() is now the common implementation of those two
helpers. While at it we switch it to using pagetable_alloc() like
standard pgtable allocator functions and remove the comment
regarding ctor calls (ctors are now always expected to be called).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/mm/mmu.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a7292ce9d7b8..accb0a33c59f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -480,31 +480,22 @@ void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
 			     int flags);
 #endif
 
-static phys_addr_t __pgd_pgtable_alloc(enum pgtable_type pgtable_type)
+static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm,
+				       enum pgtable_type pgtable_type)
 {
 	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
-	void *ptr = (void *)__get_free_page(GFP_PGTABLE_KERNEL & ~__GFP_ZERO);
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL & ~__GFP_ZERO, 0);
+	phys_addr_t pa;
 
-	BUG_ON(!ptr);
-	return __pa(ptr);
-}
-
-static phys_addr_t pgd_pgtable_alloc(enum pgtable_type pgtable_type)
-{
-	phys_addr_t pa = __pgd_pgtable_alloc(pgtable_type);
-	struct ptdesc *ptdesc = page_ptdesc(phys_to_page(pa));
+	BUG_ON(!ptdesc);
+	pa = page_to_phys(ptdesc_page(ptdesc));
 
-	/*
-	 * Call proper page table ctor in case later we need to
-	 * call core mm functions like apply_to_page_range() on
-	 * this pre-allocated page table.
-	 */
 	switch (pgtable_type) {
 	case TABLE_PTE:
-		BUG_ON(!pagetable_pte_ctor(NULL, ptdesc));
+		BUG_ON(!pagetable_pte_ctor(mm, ptdesc));
 		break;
 	case TABLE_PMD:
-		BUG_ON(!pagetable_pmd_ctor(NULL, ptdesc));
+		BUG_ON(!pagetable_pmd_ctor(mm, ptdesc));
 		break;
 	default:
 		break;
@@ -513,6 +504,16 @@ static phys_addr_t pgd_pgtable_alloc(enum pgtable_type pgtable_type)
 	return pa;
 }
 
+static phys_addr_t pgd_pgtable_alloc_init_mm(enum pgtable_type pgtable_type)
+{
+	return __pgd_pgtable_alloc(&init_mm, pgtable_type);
+}
+
+static phys_addr_t pgd_pgtable_alloc_special_mm(enum pgtable_type pgtable_type)
+{
+	return __pgd_pgtable_alloc(NULL, pgtable_type);
+}
+
 /*
  * This function can only be used to modify existing table entries,
  * without allocating new levels of table. Note that this permits the
@@ -542,7 +543,7 @@ void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
 		flags = NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
 	__create_pgd_mapping(mm->pgd, phys, virt, size, prot,
-			     pgd_pgtable_alloc, flags);
+			     pgd_pgtable_alloc_special_mm, flags);
 }
 
 static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
@@ -756,7 +757,7 @@ static int __init map_entry_trampoline(void)
 	memset(tramp_pg_dir, 0, PGD_SIZE);
 	__create_pgd_mapping(tramp_pg_dir, pa_start, TRAMP_VALIAS,
 			     entry_tramp_text_size(), prot,
-			     __pgd_pgtable_alloc, NO_BLOCK_MAPPINGS);
+			     pgd_pgtable_alloc_init_mm, NO_BLOCK_MAPPINGS);
 
 	/* Map both the text and data into the kernel page table */
 	for (i = 0; i < DIV_ROUND_UP(entry_tramp_text_size(), PAGE_SIZE); i++)
@@ -1362,7 +1363,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
 	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
-			     size, params->pgprot, __pgd_pgtable_alloc,
+			     size, params->pgprot, pgd_pgtable_alloc_init_mm,
 			     flags);
 
 	memblock_clear_nomap(start, size);
-- 
2.47.0


