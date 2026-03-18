Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608AD10854BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=86soRAa+NsNN/W/H3vjU92xS2dzTbMAMuxnxXTTu/lU=; b=O0BONDInw7gifUW/H8oC1W4Ief
	8xmGQd9sddJ+LsDY8unu4fg7TNgDn80uYNdXC/Dh7Z0eXxpeEldY8EIZHqPQmvlfLB+ctY0ND6UAl
	BrBxetXtx2OSB/hnop3Ahq2etGRvQvQPq16lqZ3fOpFDubJA9fBR+SKGzdT5zlz3DY3M6E5LbmFeL
	gjcVLjROdNW7aAjBeh9cRNqNPu+a7bzsAxTF7WEXILuTRwdtariIUmkG4mdgehFvMjAU5US70OOmE
	yejLwiiPnHgDfh7mERD4e4umieTP2+/K+exyycQ8xSFKTzfG+qoRSFNHJgJgDtPj4e2ye4K5F8RuK
	Qnz3QHig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2nAQ-000000088uF-1TBL;
	Wed, 18 Mar 2026 09:26:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2nAN-000000088ti-33du
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 09:26:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89E961E7D;
	Wed, 18 Mar 2026 02:26:06 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF0883F73B;
	Wed, 18 Mar 2026 02:26:11 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2] arm64: mm: Use generic enum pgtable_level
Date: Wed, 18 Mar 2026 09:25:43 +0000
Message-ID: <20260318092543.73331-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_022615_845825_9131E7BE 
X-CRM114-Status: GOOD (  13.45  )
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

enum pgtable_type was introduced for arm64 by commit c64f46ee1377
("arm64: mm: use enum to identify pgtable level instead of
*_SHIFT"). In the meantime, the generic enum pgtable_level got
introduced by commit b22cc9a9c7ff ("mm/rmap: convert "enum
rmap_level" to "enum pgtable_level"").

Let's switch to the generic enum pgtable_level. The only difference
is that it also includes PGD level; __pgd_pgtable_alloc() isn't
expected to create PGD tables so we add a VM_WARN_ON() for that
case.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
v1..v2:
- Add a VM_WARN_ON() for PGD in __pgd_pgtable_alloc() [Ryan, David]

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/mmu.h |  7 -----
 arch/arm64/mm/mmu.c          | 59 +++++++++++++++++++-----------------
 2 files changed, 31 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 137a173df1ff..f28e6e215da4 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -17,13 +17,6 @@
 #include <linux/refcount.h>
 #include <asm/cpufeature.h>
 
-enum pgtable_type {
-	TABLE_PTE,
-	TABLE_PMD,
-	TABLE_PUD,
-	TABLE_P4D,
-};
-
 typedef struct {
 	atomic64_t	id;
 #ifdef CONFIG_COMPAT
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a6a00accf4f9..c45a6a47dad0 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -112,7 +112,7 @@ pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 }
 EXPORT_SYMBOL(phys_mem_access_prot);
 
-static phys_addr_t __init early_pgtable_alloc(enum pgtable_type pgtable_type)
+static phys_addr_t __init early_pgtable_alloc(enum pgtable_level pgtable_level)
 {
 	phys_addr_t phys;
 
@@ -197,7 +197,7 @@ static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 			       unsigned long end, phys_addr_t phys,
 			       pgprot_t prot,
-			       phys_addr_t (*pgtable_alloc)(enum pgtable_type),
+			       phys_addr_t (*pgtable_alloc)(enum pgtable_level),
 			       int flags)
 {
 	unsigned long next;
@@ -212,7 +212,7 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 		if (flags & NO_EXEC_MAPPINGS)
 			pmdval |= PMD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
-		pte_phys = pgtable_alloc(TABLE_PTE);
+		pte_phys = pgtable_alloc(PGTABLE_LEVEL_PTE);
 		if (pte_phys == INVALID_PHYS_ADDR)
 			return -ENOMEM;
 		ptep = pte_set_fixmap(pte_phys);
@@ -252,7 +252,7 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 
 static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		    phys_addr_t phys, pgprot_t prot,
-		    phys_addr_t (*pgtable_alloc)(enum pgtable_type), int flags)
+		    phys_addr_t (*pgtable_alloc)(enum pgtable_level), int flags)
 {
 	unsigned long next;
 
@@ -292,7 +292,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 			       unsigned long end, phys_addr_t phys,
 			       pgprot_t prot,
-			       phys_addr_t (*pgtable_alloc)(enum pgtable_type),
+			       phys_addr_t (*pgtable_alloc)(enum pgtable_level),
 			       int flags)
 {
 	int ret;
@@ -311,7 +311,7 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 		if (flags & NO_EXEC_MAPPINGS)
 			pudval |= PUD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
-		pmd_phys = pgtable_alloc(TABLE_PMD);
+		pmd_phys = pgtable_alloc(PGTABLE_LEVEL_PMD);
 		if (pmd_phys == INVALID_PHYS_ADDR)
 			return -ENOMEM;
 		pmdp = pmd_set_fixmap(pmd_phys);
@@ -349,7 +349,7 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 
 static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 			  phys_addr_t phys, pgprot_t prot,
-			  phys_addr_t (*pgtable_alloc)(enum pgtable_type),
+			  phys_addr_t (*pgtable_alloc)(enum pgtable_level),
 			  int flags)
 {
 	int ret = 0;
@@ -364,7 +364,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		if (flags & NO_EXEC_MAPPINGS)
 			p4dval |= P4D_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
-		pud_phys = pgtable_alloc(TABLE_PUD);
+		pud_phys = pgtable_alloc(PGTABLE_LEVEL_PUD);
 		if (pud_phys == INVALID_PHYS_ADDR)
 			return -ENOMEM;
 		pudp = pud_set_fixmap(pud_phys);
@@ -415,7 +415,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 
 static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 			  phys_addr_t phys, pgprot_t prot,
-			  phys_addr_t (*pgtable_alloc)(enum pgtable_type),
+			  phys_addr_t (*pgtable_alloc)(enum pgtable_level),
 			  int flags)
 {
 	int ret;
@@ -430,7 +430,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 		if (flags & NO_EXEC_MAPPINGS)
 			pgdval |= PGD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
-		p4d_phys = pgtable_alloc(TABLE_P4D);
+		p4d_phys = pgtable_alloc(PGTABLE_LEVEL_P4D);
 		if (p4d_phys == INVALID_PHYS_ADDR)
 			return -ENOMEM;
 		p4dp = p4d_set_fixmap(p4d_phys);
@@ -467,7 +467,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 static int __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
 				       unsigned long virt, phys_addr_t size,
 				       pgprot_t prot,
-				       phys_addr_t (*pgtable_alloc)(enum pgtable_type),
+				       phys_addr_t (*pgtable_alloc)(enum pgtable_level),
 				       int flags)
 {
 	int ret;
@@ -500,7 +500,7 @@ static int __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
 static int __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
 				unsigned long virt, phys_addr_t size,
 				pgprot_t prot,
-				phys_addr_t (*pgtable_alloc)(enum pgtable_type),
+				phys_addr_t (*pgtable_alloc)(enum pgtable_level),
 				int flags)
 {
 	int ret;
@@ -516,7 +516,7 @@ static int __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
 static void early_create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
 				     unsigned long virt, phys_addr_t size,
 				     pgprot_t prot,
-				     phys_addr_t (*pgtable_alloc)(enum pgtable_type),
+				     phys_addr_t (*pgtable_alloc)(enum pgtable_level),
 				     int flags)
 {
 	int ret;
@@ -528,7 +528,7 @@ static void early_create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
 }
 
 static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
-				       enum pgtable_type pgtable_type)
+				       enum pgtable_level pgtable_level)
 {
 	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
 	struct ptdesc *ptdesc = pagetable_alloc(gfp & ~__GFP_ZERO, 0);
@@ -539,40 +539,43 @@ static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
 
 	pa = page_to_phys(ptdesc_page(ptdesc));
 
-	switch (pgtable_type) {
-	case TABLE_PTE:
+	switch (pgtable_level) {
+	case PGTABLE_LEVEL_PTE:
 		BUG_ON(!pagetable_pte_ctor(mm, ptdesc));
 		break;
-	case TABLE_PMD:
+	case PGTABLE_LEVEL_PMD:
 		BUG_ON(!pagetable_pmd_ctor(mm, ptdesc));
 		break;
-	case TABLE_PUD:
+	case PGTABLE_LEVEL_PUD:
 		pagetable_pud_ctor(ptdesc);
 		break;
-	case TABLE_P4D:
+	case PGTABLE_LEVEL_P4D:
 		pagetable_p4d_ctor(ptdesc);
 		break;
+	case PGTABLE_LEVEL_PGD:
+		VM_WARN_ON(1);
+		break;
 	}
 
 	return pa;
 }
 
 static phys_addr_t
-pgd_pgtable_alloc_init_mm_gfp(enum pgtable_type pgtable_type, gfp_t gfp)
+pgd_pgtable_alloc_init_mm_gfp(enum pgtable_level pgtable_level, gfp_t gfp)
 {
-	return __pgd_pgtable_alloc(&init_mm, gfp, pgtable_type);
+	return __pgd_pgtable_alloc(&init_mm, gfp, pgtable_level);
 }
 
 static phys_addr_t __maybe_unused
-pgd_pgtable_alloc_init_mm(enum pgtable_type pgtable_type)
+pgd_pgtable_alloc_init_mm(enum pgtable_level pgtable_level)
 {
-	return pgd_pgtable_alloc_init_mm_gfp(pgtable_type, GFP_PGTABLE_KERNEL);
+	return pgd_pgtable_alloc_init_mm_gfp(pgtable_level, GFP_PGTABLE_KERNEL);
 }
 
 static phys_addr_t
-pgd_pgtable_alloc_special_mm(enum pgtable_type pgtable_type)
+pgd_pgtable_alloc_special_mm(enum pgtable_level pgtable_level)
 {
-	return  __pgd_pgtable_alloc(NULL, GFP_PGTABLE_KERNEL, pgtable_type);
+	return  __pgd_pgtable_alloc(NULL, GFP_PGTABLE_KERNEL, pgtable_level);
 }
 
 static void split_contpte(pte_t *ptep)
@@ -593,7 +596,7 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
 	pte_t *ptep;
 	int i;
 
-	pte_phys = pgd_pgtable_alloc_init_mm_gfp(TABLE_PTE, gfp);
+	pte_phys = pgd_pgtable_alloc_init_mm_gfp(PGTABLE_LEVEL_PTE, gfp);
 	if (pte_phys == INVALID_PHYS_ADDR)
 		return -ENOMEM;
 	ptep = (pte_t *)phys_to_virt(pte_phys);
@@ -638,7 +641,7 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
 	pmd_t *pmdp;
 	int i;
 
-	pmd_phys = pgd_pgtable_alloc_init_mm_gfp(TABLE_PMD, gfp);
+	pmd_phys = pgd_pgtable_alloc_init_mm_gfp(PGTABLE_LEVEL_PMD, gfp);
 	if (pmd_phys == INVALID_PHYS_ADDR)
 		return -ENOMEM;
 	pmdp = (pmd_t *)phys_to_virt(pmd_phys);
@@ -1226,7 +1229,7 @@ static void __init declare_vma(struct vm_struct *vma,
 
 static phys_addr_t kpti_ng_temp_alloc __initdata;
 
-static phys_addr_t __init kpti_ng_pgd_alloc(enum pgtable_type type)
+static phys_addr_t __init kpti_ng_pgd_alloc(enum pgtable_level pgtable_level)
 {
 	kpti_ng_temp_alloc -= PAGE_SIZE;
 	return kpti_ng_temp_alloc;
-- 
2.51.2


