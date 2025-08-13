Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82340C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gebmanlTn6wl4IuLzXs/lDFy+zTbdzxIjAieboFXA9Y=; b=fN2xvE3XPb8h+tlRyYURaMsyT+
	aSUtKM3kLz4i0+e/bLgiOOv9SUr+YSXlMZh6loLUN2uLP29DimHHo+yQ5V4RqKbxxXKa4A4/S0jxg
	/uqliJ9YxN5ePqktUzCzuGzvGId3QkshRWOcxgE1/VyIlurNMb9Mr3ALnzKtOo/Iu6dVJa1n1jvC+
	hnlXZOq+cvnkqgDHHCZSw0FRM1Gv+FjzhJQRM0tZPB6tjHL2MyjXql+j4fHhdvs4Ib0xLksdUVu44
	d+XhPACxWicwXdjFlEzBeq7crtwoJeoKzReeVVSBHoZwVE45/WRfrbjUuou3Ny+Ahbzpc3liZ1kMz
	HafUAkQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDR7-0000000EC5C-03PB;
	Wed, 13 Aug 2025 15:30:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtv-0000000E5Rt-2XVE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 14:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gebmanlTn6wl4IuLzXs/lDFy+zTbdzxIjAieboFXA9Y=; b=l/5v6+pWoTI2mIj4PUns6lSAvK
	46Ee2VPVNmls6lfPst8w1zbS0jWK7UcBGNKZWKTD3kS/9cv13lG9ytj6cH4prZQcGDSj6dF+xx5TE
	T74PayPWTgQdTmhgp+jCfeLaKIFhkfCDFw5R7P88QHS6jcPDu97AS284XeVZ9mfOA1ZDkzgKzxlRH
	mZVXA4B0PO9vEghtcF9Trq7Rg2TwnAyXLZgphE/LPmkMifCAG2n4XQ0O3jakZMaGwlvRA1ynzbOr0
	nYl8laLXZyfGw1D9btIqaAldAS5CoGfJ90KqrYMTPi7kFlcmWKxzFF7CDrvkqz+/ncA64VMfuu63O
	Pmm2gRjw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCts-0000000G7GE-28XN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:56:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE0A11A9A;
	Wed, 13 Aug 2025 07:56:13 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CC513F738;
	Wed, 13 Aug 2025 07:56:18 -0700 (PDT)
From: Chaitanya S Prakash <chaitanyas.prakash@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>,
	Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH 1/2] arm64/mm: Allow __create_pgd_mapping() to propagate pgtable_alloc() errors
Date: Wed, 13 Aug 2025 20:26:06 +0530
Message-Id: <20250813145607.1612234-2-chaitanyas.prakash@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813145607.1612234-1-chaitanyas.prakash@arm.com>
References: <20250813145607.1612234-1-chaitanyas.prakash@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_155624_857873_5BE3B188 
X-CRM114-Status: GOOD (  23.96  )
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

arch_add_memory() is used to hotplug memory into a system but as a part
of its implementation it calls __create_pgd_mapping(), which uses
pgtable_alloc() in order to build intermediate page tables. As this path
was initally only used during early boot pgtable_alloc() is designed to
BUG_ON() on failure. However, in the event that memory hotplug is
attempted when the system's memory is extremely tight and the allocation
were to fail, it would lead to panicking the system, which is not
desirable. Hence update __create_pgd_mapping and all it's callers to be
non void and propagate -ENOMEM on allocation failure to allow system to
fail gracefully.

But during early boot if there is an allocation failure, we want the
system to panic, hence create a wrapper around __create_pgd_mapping()
called ___create_pgd_mapping() which is designed to BUG_ON(ret), if ret
is non zero value. All the init calls are updated to use the wrapper
rather than the modified __create_pgd_mapping() to restore
functionality.

Signed-off-by: Chaitanya S Prakash <chaitanyas.prakash@arm.com>
---
 arch/arm64/mm/mmu.c | 156 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 117 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 00ab1d648db62..db7f45ef16574 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -196,12 +196,13 @@ static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 	} while (ptep++, addr += PAGE_SIZE, addr != end);
 }
 
-static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
+static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 				unsigned long end, phys_addr_t phys,
 				pgprot_t prot,
 				phys_addr_t (*pgtable_alloc)(enum pgtable_type),
 				int flags)
 {
+	int ret = 0;
 	unsigned long next;
 	pmd_t pmd = READ_ONCE(*pmdp);
 	pte_t *ptep;
@@ -215,6 +216,10 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 			pmdval |= PMD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pte_phys = pgtable_alloc(TABLE_PTE);
+		if (!pte_phys) {
+			ret = -ENOMEM;
+			goto out;
+		}
 		ptep = pte_set_fixmap(pte_phys);
 		init_clear_pgtable(ptep);
 		ptep += pte_index(addr);
@@ -246,12 +251,16 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 	 * walker.
 	 */
 	pte_clear_fixmap();
+
+out:
+	return ret;
 }
 
-static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
+static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		     phys_addr_t phys, pgprot_t prot,
 		     phys_addr_t (*pgtable_alloc)(enum pgtable_type), int flags)
 {
+	int ret = 0;
 	unsigned long next;
 
 	do {
@@ -271,22 +280,27 @@ static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 			BUG_ON(!pgattr_change_is_safe(pmd_val(old_pmd),
 						      READ_ONCE(pmd_val(*pmdp))));
 		} else {
-			alloc_init_cont_pte(pmdp, addr, next, phys, prot,
-					    pgtable_alloc, flags);
+			ret = alloc_init_cont_pte(pmdp, addr, next, phys, prot,
+						  pgtable_alloc, flags);
+			if (ret)
+				break;
 
 			BUG_ON(pmd_val(old_pmd) != 0 &&
 			       pmd_val(old_pmd) != READ_ONCE(pmd_val(*pmdp)));
 		}
 		phys += next - addr;
 	} while (pmdp++, addr = next, addr != end);
+
+	return ret;
 }
 
-static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
+static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 				unsigned long end, phys_addr_t phys,
 				pgprot_t prot,
 				phys_addr_t (*pgtable_alloc)(enum pgtable_type),
 				int flags)
 {
+	int ret = 0;
 	unsigned long next;
 	pud_t pud = READ_ONCE(*pudp);
 	pmd_t *pmdp;
@@ -303,6 +317,10 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 			pudval |= PUD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pmd_phys = pgtable_alloc(TABLE_PMD);
+		if (!pmd_phys) {
+			ret = -ENOMEM;
+			goto out;
+		}
 		pmdp = pmd_set_fixmap(pmd_phys);
 		init_clear_pgtable(pmdp);
 		pmdp += pmd_index(addr);
@@ -322,20 +340,26 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 		    (flags & NO_CONT_MAPPINGS) == 0)
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
-		init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
+		ret = init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
+		if (ret)
+			break;
 
 		pmdp += pmd_index(next) - pmd_index(addr);
 		phys += next - addr;
 	} while (addr = next, addr != end);
 
 	pmd_clear_fixmap();
+
+out:
+	return ret;
 }
 
-static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
+static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 			   phys_addr_t phys, pgprot_t prot,
 			   phys_addr_t (*pgtable_alloc)(enum pgtable_type),
 			   int flags)
 {
+	int ret = 0;
 	unsigned long next;
 	p4d_t p4d = READ_ONCE(*p4dp);
 	pud_t *pudp;
@@ -348,6 +372,10 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 			p4dval |= P4D_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pud_phys = pgtable_alloc(TABLE_PUD);
+		if (!pud_phys) {
+			ret = -ENOMEM;
+			goto out;
+		}
 		pudp = pud_set_fixmap(pud_phys);
 		init_clear_pgtable(pudp);
 		pudp += pud_index(addr);
@@ -377,8 +405,10 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 			BUG_ON(!pgattr_change_is_safe(pud_val(old_pud),
 						      READ_ONCE(pud_val(*pudp))));
 		} else {
-			alloc_init_cont_pmd(pudp, addr, next, phys, prot,
-					    pgtable_alloc, flags);
+			ret = alloc_init_cont_pmd(pudp, addr, next, phys, prot,
+						  pgtable_alloc, flags);
+			if (ret)
+				break;
 
 			BUG_ON(pud_val(old_pud) != 0 &&
 			       pud_val(old_pud) != READ_ONCE(pud_val(*pudp)));
@@ -387,13 +417,17 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 	} while (pudp++, addr = next, addr != end);
 
 	pud_clear_fixmap();
+
+out:
+	return ret;
 }
 
-static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
+static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 			   phys_addr_t phys, pgprot_t prot,
 			   phys_addr_t (*pgtable_alloc)(enum pgtable_type),
 			   int flags)
 {
+	int ret = 0;
 	unsigned long next;
 	pgd_t pgd = READ_ONCE(*pgdp);
 	p4d_t *p4dp;
@@ -406,6 +440,10 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 			pgdval |= PGD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		p4d_phys = pgtable_alloc(TABLE_P4D);
+		if (!p4d_phys) {
+			ret = -ENOMEM;
+			goto out;
+		}
 		p4dp = p4d_set_fixmap(p4d_phys);
 		init_clear_pgtable(p4dp);
 		p4dp += p4d_index(addr);
@@ -420,8 +458,10 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 
 		next = p4d_addr_end(addr, end);
 
-		alloc_init_pud(p4dp, addr, next, phys, prot,
-			       pgtable_alloc, flags);
+		ret = alloc_init_pud(p4dp, addr, next, phys, prot,
+				     pgtable_alloc, flags);
+		if (ret)
+			break;
 
 		BUG_ON(p4d_val(old_p4d) != 0 &&
 		       p4d_val(old_p4d) != READ_ONCE(p4d_val(*p4dp)));
@@ -430,14 +470,18 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 	} while (p4dp++, addr = next, addr != end);
 
 	p4d_clear_fixmap();
+
+out:
+	return ret;
 }
 
-static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
+static int __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
 					unsigned long virt, phys_addr_t size,
 					pgprot_t prot,
 					phys_addr_t (*pgtable_alloc)(enum pgtable_type),
 					int flags)
 {
+	int ret = 0;
 	unsigned long addr, end, next;
 	pgd_t *pgdp = pgd_offset_pgd(pgdir, virt);
 
@@ -445,8 +489,10 @@ static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
 	 * If the virtual and physical address don't have the same offset
 	 * within a page, we cannot map the region as the caller expects.
 	 */
-	if (WARN_ON((phys ^ virt) & ~PAGE_MASK))
-		return;
+	if (WARN_ON((phys ^ virt) & ~PAGE_MASK)) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	phys &= PAGE_MASK;
 	addr = virt & PAGE_MASK;
@@ -454,22 +500,44 @@ static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
 
 	do {
 		next = pgd_addr_end(addr, end);
-		alloc_init_p4d(pgdp, addr, next, phys, prot, pgtable_alloc,
-			       flags);
+		ret = alloc_init_p4d(pgdp, addr, next, phys, prot, pgtable_alloc,
+				     flags);
+		if (ret)
+			break;
 		phys += next - addr;
 	} while (pgdp++, addr = next, addr != end);
+
+out:
+	return ret;
 }
 
-static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
+static int __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
 				 unsigned long virt, phys_addr_t size,
 				 pgprot_t prot,
 				 phys_addr_t (*pgtable_alloc)(enum pgtable_type),
 				 int flags)
 {
+	int ret = 0;
+
 	mutex_lock(&fixmap_lock);
-	__create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
-				    pgtable_alloc, flags);
+	ret = __create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
+					  pgtable_alloc, flags);
 	mutex_unlock(&fixmap_lock);
+
+	return ret;
+}
+
+static void ___create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
+				  unsigned long virt, phys_addr_t size,
+				  pgprot_t prot,
+				  phys_addr_t (*pgtable_alloc)(enum pgtable_type),
+				  int flags)
+{
+	int ret = 0;
+
+	ret = __create_pgd_mapping(pgdir, phys, virt, size, prot, pgtable_alloc,
+				   flags);
+	BUG_ON(ret);
 }
 
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
@@ -485,9 +553,11 @@ static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm,
 {
 	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
 	struct ptdesc *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL & ~__GFP_ZERO, 0);
-	phys_addr_t pa;
+	phys_addr_t pa = 0;
+
+	if (!ptdesc)
+		goto out;
 
-	BUG_ON(!ptdesc);
 	pa = page_to_phys(ptdesc_page(ptdesc));
 
 	switch (pgtable_type) {
@@ -505,6 +575,7 @@ static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm,
 		break;
 	}
 
+out:
 	return pa;
 }
 
@@ -533,8 +604,8 @@ void __init create_mapping_noalloc(phys_addr_t phys, unsigned long virt,
 			&phys, virt);
 		return;
 	}
-	__create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
-			     NO_CONT_MAPPINGS);
+	___create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
+			      NO_CONT_MAPPINGS);
 }
 
 void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
@@ -548,8 +619,8 @@ void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
 	if (page_mappings_only)
 		flags = NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
-	__create_pgd_mapping(mm->pgd, phys, virt, size, prot,
-			     pgd_pgtable_alloc_special_mm, flags);
+	___create_pgd_mapping(mm->pgd, phys, virt, size, prot,
+			      pgd_pgtable_alloc_special_mm, flags);
 }
 
 static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
@@ -561,7 +632,7 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
 		return;
 	}
 
-	__create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
+	___create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
 			     NO_CONT_MAPPINGS);
 
 	/* flush the TLBs after updating live kernel mappings */
@@ -571,8 +642,8 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
 static void __init __map_memblock(pgd_t *pgdp, phys_addr_t start,
 				  phys_addr_t end, pgprot_t prot, int flags)
 {
-	__create_pgd_mapping(pgdp, start, __phys_to_virt(start), end - start,
-			     prot, early_pgtable_alloc, flags);
+	___create_pgd_mapping(pgdp, start, __phys_to_virt(start), end - start,
+			      prot, early_pgtable_alloc, flags);
 }
 
 void __init mark_linear_text_alias_ro(void)
@@ -761,9 +832,9 @@ static int __init map_entry_trampoline(void)
 
 	/* Map only the text into the trampoline page table */
 	memset(tramp_pg_dir, 0, PGD_SIZE);
-	__create_pgd_mapping(tramp_pg_dir, pa_start, TRAMP_VALIAS,
-			     entry_tramp_text_size(), prot,
-			     pgd_pgtable_alloc_init_mm, NO_BLOCK_MAPPINGS);
+	___create_pgd_mapping(tramp_pg_dir, pa_start, TRAMP_VALIAS,
+			      entry_tramp_text_size(), prot,
+			      pgd_pgtable_alloc_init_mm, NO_BLOCK_MAPPINGS);
 
 	/* Map both the text and data into the kernel page table */
 	for (i = 0; i < DIV_ROUND_UP(entry_tramp_text_size(), PAGE_SIZE); i++)
@@ -1369,23 +1440,30 @@ int arch_add_memory(int nid, u64 start, u64 size,
 	if (can_set_direct_map())
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
-	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
-			     size, params->pgprot, pgd_pgtable_alloc_init_mm,
-			     flags);
+	ret = __create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
+				   size, params->pgprot, pgd_pgtable_alloc_init_mm,
+				   flags);
+
+	if (ret)
+		goto out;
 
 	memblock_clear_nomap(start, size);
 
 	ret = __add_pages(nid, start >> PAGE_SHIFT, size >> PAGE_SHIFT,
 			   params);
-	if (ret)
-		__remove_pgd_mapping(swapper_pg_dir,
-				     __phys_to_virt(start), size);
-	else {
+	if (ret) {
+		goto out;
+	} else {
 		/* Address of hotplugged memory can be smaller */
 		max_pfn = max(max_pfn, PFN_UP(start + size));
 		max_low_pfn = max_pfn;
 	}
 
+	return 0;
+
+out:
+	__remove_pgd_mapping(swapper_pg_dir,
+			      __phys_to_virt(start), size);
 	return ret;
 }
 
-- 
2.34.1


