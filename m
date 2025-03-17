Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E957FC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0qUgaUrYwFOh7rWnfnoc0fr3tb5PvfK77peSjWpZHE=; b=V+b6inaOwqezeV3RerYi0bucWD
	iOcGyNiHPoJIZI8BrQmHL6HXl8BqwWM7myn9ekPU/3ZfReOl1atHvqVaFnm6n275GVfOQDsjXip7o
	Z0ITqGXjrDrkPJOA8NCig4H1B/cp+xtk1461YlNOJ+ymLVnthjlq86eTQQe2FybmBlMhkKvvayBW8
	bKC1rBLIcRYLLBkyQIX2XMIpv1txUl8yqcBvOdCJ8iAqjTekEsT6r9WrH8phXwbfaJd2BTcgSrua/
	NAOA+3lEX+sHoGe/WL99q/1957R7sUo/v/PzUTwHAnB4v1hBI8Ogud/uoSQBOFBzBORJcv+avMkMz
	OdLctuFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBYv-00000002ylJ-1I3p;
	Mon, 17 Mar 2025 14:35:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBLv-00000002uZb-0dvS;
	Mon, 17 Mar 2025 14:22:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B17952936;
	Mon, 17 Mar 2025 07:22:11 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A11D3F63F;
	Mon, 17 Mar 2025 07:21:58 -0700 (PDT)
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
Subject: [PATCH 07/11] arm64: mm: Use enum to identify pgtable level instead of *_SHIFT
Date: Mon, 17 Mar 2025 14:16:56 +0000
Message-ID: <20250317141700.3701581-8-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250317141700.3701581-1-kevin.brodsky@arm.com>
References: <20250317141700.3701581-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_072203_281636_6E51C9C1 
X-CRM114-Status: GOOD (  16.19  )
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

Commit 90292aca9854 ("arm64: mm: use appropriate ctors for page
tables") introduced pgtable ctor calls in pgd_pgtable_alloc(). To
identify the pgtable level and call the appropriate ctor, the
*_SHIFT value associated with the pgtable level is used. However,
those values do not unambiguously identify a level, because if a
given level is folded, the *_SHIFT value will be equal to that of
the upper level (e.g. PMD_SHIFT == PUD_SHIFT if PMD is folded).

As things stand, there is probably not much damaged done by calling
the ctor for a different level, and ARCH_ENABLE_SPLIT_PMD_PTLOCK is
only selected if PMD isn't folded (so we don't needlessly initialise
pmd_ptlock). Still, this is pretty confusing, and it would get even
more confusing when adding ctor calls for the remaining levels.

Let's simplify all this by using an enum to identify the pgtable
level instead; this way folding becomes irrelevant. This is inspired
by one of the m68k pgtable allocators
(arch/m68k/include/asm/motorola_pgalloc.h).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/mm/mmu.c | 54 +++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 437d4977bcf5..a7292ce9d7b8 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -46,6 +46,13 @@
 #define NO_CONT_MAPPINGS	BIT(1)
 #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
 
+enum pgtable_type {
+	TABLE_PTE,
+	TABLE_PMD,
+	TABLE_PUD,
+	TABLE_P4D,
+};
+
 u64 kimage_voffset __ro_after_init;
 EXPORT_SYMBOL(kimage_voffset);
 
@@ -107,7 +114,7 @@ pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 }
 EXPORT_SYMBOL(phys_mem_access_prot);
 
-static phys_addr_t __init early_pgtable_alloc(int shift)
+static phys_addr_t __init early_pgtable_alloc(enum pgtable_type pgtable_type)
 {
 	phys_addr_t phys;
 
@@ -192,7 +199,7 @@ static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 				unsigned long end, phys_addr_t phys,
 				pgprot_t prot,
-				phys_addr_t (*pgtable_alloc)(int),
+				phys_addr_t (*pgtable_alloc)(enum pgtable_type),
 				int flags)
 {
 	unsigned long next;
@@ -207,7 +214,7 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 		if (flags & NO_EXEC_MAPPINGS)
 			pmdval |= PMD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
-		pte_phys = pgtable_alloc(PAGE_SHIFT);
+		pte_phys = pgtable_alloc(TABLE_PTE);
 		ptep = pte_set_fixmap(pte_phys);
 		init_clear_pgtable(ptep);
 		ptep += pte_index(addr);
@@ -243,7 +250,7 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 
 static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		     phys_addr_t phys, pgprot_t prot,
-		     phys_addr_t (*pgtable_alloc)(int), int flags)
+		     phys_addr_t (*pgtable_alloc)(enum pgtable_type), int flags)
 {
 	unsigned long next;
 
@@ -277,7 +284,8 @@ static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 				unsigned long end, phys_addr_t phys,
 				pgprot_t prot,
-				phys_addr_t (*pgtable_alloc)(int), int flags)
+				phys_addr_t (*pgtable_alloc)(enum pgtable_type),
+				int flags)
 {
 	unsigned long next;
 	pud_t pud = READ_ONCE(*pudp);
@@ -294,7 +302,7 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 		if (flags & NO_EXEC_MAPPINGS)
 			pudval |= PUD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
-		pmd_phys = pgtable_alloc(PMD_SHIFT);
+		pmd_phys = pgtable_alloc(TABLE_PMD);
 		pmdp = pmd_set_fixmap(pmd_phys);
 		init_clear_pgtable(pmdp);
 		pmdp += pmd_index(addr);
@@ -325,7 +333,7 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 
 static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 			   phys_addr_t phys, pgprot_t prot,
-			   phys_addr_t (*pgtable_alloc)(int),
+			   phys_addr_t (*pgtable_alloc)(enum pgtable_type),
 			   int flags)
 {
 	unsigned long next;
@@ -339,7 +347,7 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		if (flags & NO_EXEC_MAPPINGS)
 			p4dval |= P4D_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
-		pud_phys = pgtable_alloc(PUD_SHIFT);
+		pud_phys = pgtable_alloc(TABLE_PUD);
 		pudp = pud_set_fixmap(pud_phys);
 		init_clear_pgtable(pudp);
 		pudp += pud_index(addr);
@@ -383,7 +391,7 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 
 static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 			   phys_addr_t phys, pgprot_t prot,
-			   phys_addr_t (*pgtable_alloc)(int),
+			   phys_addr_t (*pgtable_alloc)(enum pgtable_type),
 			   int flags)
 {
 	unsigned long next;
@@ -397,7 +405,7 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 		if (flags & NO_EXEC_MAPPINGS)
 			pgdval |= PGD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
-		p4d_phys = pgtable_alloc(P4D_SHIFT);
+		p4d_phys = pgtable_alloc(TABLE_P4D);
 		p4dp = p4d_set_fixmap(p4d_phys);
 		init_clear_pgtable(p4dp);
 		p4dp += p4d_index(addr);
@@ -427,7 +435,7 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
 					unsigned long virt, phys_addr_t size,
 					pgprot_t prot,
-					phys_addr_t (*pgtable_alloc)(int),
+					phys_addr_t (*pgtable_alloc)(enum pgtable_type),
 					int flags)
 {
 	unsigned long addr, end, next;
@@ -455,7 +463,7 @@ static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
 static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
 				 unsigned long virt, phys_addr_t size,
 				 pgprot_t prot,
-				 phys_addr_t (*pgtable_alloc)(int),
+				 phys_addr_t (*pgtable_alloc)(enum pgtable_type),
 				 int flags)
 {
 	mutex_lock(&fixmap_lock);
@@ -468,10 +476,11 @@ static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
 extern __alias(__create_pgd_mapping_locked)
 void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
 			     phys_addr_t size, pgprot_t prot,
-			     phys_addr_t (*pgtable_alloc)(int), int flags);
+			     phys_addr_t (*pgtable_alloc)(enum pgtable_type),
+			     int flags);
 #endif
 
-static phys_addr_t __pgd_pgtable_alloc(int shift)
+static phys_addr_t __pgd_pgtable_alloc(enum pgtable_type pgtable_type)
 {
 	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
 	void *ptr = (void *)__get_free_page(GFP_PGTABLE_KERNEL & ~__GFP_ZERO);
@@ -480,23 +489,26 @@ static phys_addr_t __pgd_pgtable_alloc(int shift)
 	return __pa(ptr);
 }
 
-static phys_addr_t pgd_pgtable_alloc(int shift)
+static phys_addr_t pgd_pgtable_alloc(enum pgtable_type pgtable_type)
 {
-	phys_addr_t pa = __pgd_pgtable_alloc(shift);
+	phys_addr_t pa = __pgd_pgtable_alloc(pgtable_type);
 	struct ptdesc *ptdesc = page_ptdesc(phys_to_page(pa));
 
 	/*
 	 * Call proper page table ctor in case later we need to
 	 * call core mm functions like apply_to_page_range() on
 	 * this pre-allocated page table.
-	 *
-	 * We don't select ARCH_ENABLE_SPLIT_PMD_PTLOCK if pmd is
-	 * folded, and if so pagetable_pte_ctor() becomes nop.
 	 */
-	if (shift == PAGE_SHIFT)
+	switch (pgtable_type) {
+	case TABLE_PTE:
 		BUG_ON(!pagetable_pte_ctor(NULL, ptdesc));
-	else if (shift == PMD_SHIFT)
+		break;
+	case TABLE_PMD:
 		BUG_ON(!pagetable_pmd_ctor(NULL, ptdesc));
+		break;
+	default:
+		break;
+	}
 
 	return pa;
 }
-- 
2.47.0


