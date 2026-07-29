Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0340EC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgSaLULuK5yxeruLDAoCuV+EXyZyY0IYupMc1yzzQfU=; b=cPxcHhg08jfgCoD+uWOiloN53H
	TsrK66HG0xwB3jeLmCCGH0fHva0ucZmcwkf2Ffp+09WrsLTifap+YtkEd9Yfg82OR5T1Sv17ADTvy
	oCap5Mx4ivXYUAhTTKAtWQg4JMzAy8YK4MvPhTgJ4dzZgYYxw+JVsuT8/R21Ix1TuTCyEWmsdMFFD
	DCiIgl3tz4c0zXD34nE6dlsbvct0hdmaz/gr4+BTOKFvkeMlEZMbZU6NZScdA/L0W+XLFWqFgAsvR
	nVm81RoKBMpg8zAmJ7KgJqyZ1fiiPH78gzD101MyyIWR/Nj4kcsIXxC3QfDJ0Krl69kwUKCuwRbzn
	JwoqQxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3Le-00000007t9Y-1n8A;
	Wed, 29 Jul 2026 12:25:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3La-00000007t7a-2x80
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:25:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A93611688;
	Wed, 29 Jul 2026 05:25:12 -0700 (PDT)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3862E3F66F;
	Wed, 29 Jul 2026 05:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785327916; bh=2pXM/5byulNi3A4K/CqYAXKuR5WNc4s2gWUJvDpOyvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iLc5WII+/v5MVCBJutFqYxtllmte9+UaK6MRWHhqrHycyYA28G7zAS5FZWRWxDTRC
	 YJi0z3Ddn9ZNqWZIQHpR+5IzC8LRZObKLs0ZT32T8F7ROjYtTi97iaO3eM9QJgVlrB
	 9AXuZLVfXxRu/w8dftSfyI9oCL1hWuwg8KtDVLVM=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	Mark Rtland <mark.rtland@arm.com>,
	linx-arm-kernel@lists.infradead.org,
	linx-kernel@vger.kernel.org,
	kasan-dev@googlegrops.com
Subject: [PATCH 02/17] arm64/mm: Convert READ_ONCE() as pmdp_get() while accessing PMD
Date: Wed, 29 Jul 2026 17:54:37 +0530
Message-ID: <20260729122452.3797443-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729122452.3797443-1-anshuman.khandual@arm.com>
References: <20260729122452.3797443-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_052518_823424_B9150442 
X-CRM114-Status: GOOD (  21.72  )
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

Convert all READ_ONCE() based PMD accesses as pmdp_get() instead which will
support both D64 and D128 translation regime going forward. That is because
READ_ONCE() would need 128 bit single copy atomic guarantees, while reading
128 bit page table entries which is currently not supported on arm64. Build
fails for READ_ONCE() while accessing beyond 64 bits.

Load Pair/Store Pair (ldp/stp) are only single copy atomic if FEAT_LSE128
is supported (which is required when FEAT_D128 is supported). Currently 128
bit pgtables is a compile time decision - so we could have chosen to extend
READ_ONCE()/WRITE_ONCE() to allow 128 bit for this configuration. But then
it's a general purpose API and we were concerned that other users might
eventually creep in that expect 128 and then fail to compile in the other
configs.

But worse, we are considering eventually making D128 a boot time option, at
which point we'd have to make READ_ONCE() always allow 128 bit at compile
time but then it might silently tear at runtime.

So our preference is to standardize on these existing helpers, which we can
override in arm64 to give the 128 bit single copy guarantee when required.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rtland <mark.rtland@arm.com>
Cc: linx-arm-kernel@lists.infradead.org
Cc: linx-kernel@vger.kernel.org
Cc: kasan-dev@googlegrops.com
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h |  3 ++-
 arch/arm64/mm/fault.c            |  2 +-
 arch/arm64/mm/fixmap.c           |  2 +-
 arch/arm64/mm/hugetlbpage.c      |  2 +-
 arch/arm64/mm/kasan_init.c       |  4 ++--
 arch/arm64/mm/mmu.c              | 23 ++++++++++++-----------
 arch/arm64/mm/pageattr.c         |  2 +-
 arch/arm64/mm/trans_pgd.c        |  2 +-
 8 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 27689c62bd25..5c0cc7c676fa 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -852,7 +852,8 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 }
 
 /* Find an entry in the third-level page table. */
-#define pte_offset_phys(dir,addr)	(pmd_page_paddr(READ_ONCE(*(dir))) + pte_index(addr) * sizeof(pte_t))
+#define pte_offset_phys(dir, addr)	(pmd_page_paddr(pmdp_get(dir)) + \
+					 pte_index(addr) * sizeof(pte_t))
 
 #define pte_set_fixmap(addr)		((pte_t *)set_fixmap_offset(FIX_PTE, addr))
 #define pte_set_fixmap_offset(pmd, addr)	pte_set_fixmap(pte_offset_phys(pmd, addr))
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b52557652be..30f8b3872331 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -180,7 +180,7 @@ static void show_pte(unsigned long addr)
 			break;
 
 		pmdp = pmd_offset(pudp, addr);
-		pmd = READ_ONCE(*pmdp);
+		pmd = pmdp_get(pmdp);
 		pr_cont(", pmd=%016llx", pmd_val(pmd));
 		if (pmd_none(pmd) || pmd_bad(pmd))
 			break;
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index f66a0016dd02..3cdac8021d4f 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -42,7 +42,7 @@ static inline pte_t *fixmap_pte(unsigned long addr)
 
 static void __init early_fixmap_init_pte(pmd_t *pmdp, unsigned long addr)
 {
-	pmd_t pmd = READ_ONCE(*pmdp);
+	pmd_t pmd = pmdp_get(pmdp);
 	pte_t *ptep;
 
 	if (pmd_none(pmd)) {
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 8e799c1fe0aa..cdaa4500faf9 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -304,7 +304,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 		addr &= CONT_PMD_MASK;
 
 	pmdp = pmd_offset(pudp, addr);
-	pmd = READ_ONCE(*pmdp);
+	pmd = pmdp_get(pmdp);
 	if (!(sz == PMD_SIZE || sz == CONT_PMD_SIZE) &&
 	    pmd_none(pmd))
 		return NULL;
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index 3fcad956fdf7..8cb440379f17 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -62,7 +62,7 @@ static phys_addr_t __init kasan_alloc_raw_page(int node)
 static pte_t *__init kasan_pte_offset(pmd_t *pmdp, unsigned long addr, int node,
 				      bool early)
 {
-	if (pmd_none(READ_ONCE(*pmdp))) {
+	if (pmd_none(pmdp_get(pmdp))) {
 		phys_addr_t pte_phys = early ?
 				__pa_symbol(kasan_early_shadow_pte)
 					: kasan_alloc_zeroed_page(node);
@@ -138,7 +138,7 @@ static void __init kasan_pmd_populate(pud_t *pudp, unsigned long addr,
 	do {
 		next = pmd_addr_end(addr, end);
 		kasan_pte_populate(pmdp, addr, next, node, early);
-	} while (pmdp++, addr = next, addr != end && pmd_none(READ_ONCE(*pmdp)));
+	} while (pmdp++, addr = next, addr != end && pmd_none(pmdp_get(pmdp)));
 }
 
 static void __init kasan_pud_populate(p4d_t *p4dp, unsigned long addr,
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 18a8b0d3714e..85b2e2f9ea3e 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -201,7 +201,7 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 			       int flags)
 {
 	unsigned long next;
-	pmd_t pmd = READ_ONCE(*pmdp);
+	pmd_t pmd = pmdp_get(pmdp);
 	pte_t *ptep;
 
 	BUG_ON(pmd_leaf(pmd));
@@ -258,7 +258,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 	unsigned long next;
 
 	do {
-		pmd_t old_pmd = READ_ONCE(*pmdp);
+		pmd_t old_pmd = pmdp_get(pmdp);
 
 		next = pmd_addr_end(addr, end);
 
@@ -273,7 +273,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 			 * only allow updates to the permission attributes.
 			 */
 			BUG_ON(!pgattr_change_is_safe(pmd_val(old_pmd),
-						      READ_ONCE(pmd_val(*pmdp))));
+						      pmd_val(pmdp_get(pmdp))));
 		} else {
 			int ret;
 
@@ -283,7 +283,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 				return ret;
 
 			VM_WARN_ON_ONCE(pmd_val(old_pmd) != 0 &&
-					pmd_val(old_pmd) != READ_ONCE(pmd_val(*pmdp)));
+					pmd_val(old_pmd) != pmd_val(pmdp_get(pmdp)));
 		}
 		phys += next - addr;
 	} while (pmdp++, addr = next, addr != end);
@@ -294,7 +294,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 static bool pmd_range_has_valid_noncont(pmd_t *pmdp)
 {
 	for (int i = 0; i < CONT_PMDS; i++) {
-		pte_t pte = pmd_pte(READ_ONCE(pmdp[i]));
+		pte_t pte = pmd_pte(pmdp_get(pmdp + i));
 
 		if (pte_valid(pte) && !pte_cont(pte))
 			return true;
@@ -1505,7 +1505,7 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 	do {
 		next = pmd_addr_end(addr, end);
 		pmdp = pmd_offset(pudp, addr);
-		pmd = READ_ONCE(*pmdp);
+		pmd = pmdp_get(pmdp);
 		if (pmd_none(pmd))
 			continue;
 
@@ -1660,7 +1660,7 @@ static void free_empty_pmd_table(pud_t *pudp, unsigned long addr,
 	do {
 		next = pmd_addr_end(addr, end);
 		pmdp = pmd_offset(pudp, addr);
-		pmd = READ_ONCE(*pmdp);
+		pmd = pmdp_get(pmdp);
 		if (pmd_none(pmd))
 			continue;
 
@@ -1681,7 +1681,7 @@ static void free_empty_pmd_table(pud_t *pudp, unsigned long addr,
 	 */
 	pmdp = pmd_offset(pudp, 0UL);
 	for (i = 0; i < PTRS_PER_PMD; i++) {
-		if (!pmd_none(READ_ONCE(pmdp[i])))
+		if (!pmd_none(pmdp_get(pmdp + i)))
 			return;
 	}
 
@@ -1833,7 +1833,7 @@ int pmd_set_huge(pmd_t *pmdp, phys_addr_t phys, pgprot_t prot)
 	pmd_t new_pmd = pfn_pmd(__phys_to_pfn(phys), mk_pmd_sect_prot(prot));
 
 	/* Only allow permission changes for now */
-	if (!pgattr_change_is_safe(READ_ONCE(pmd_val(*pmdp)),
+	if (!pgattr_change_is_safe(pmd_val(pmdp_get(pmdp)),
 				   pmd_val(new_pmd)))
 		return 0;
 
@@ -1858,7 +1858,7 @@ int pud_clear_huge(pud_t *pudp)
 
 int pmd_clear_huge(pmd_t *pmdp)
 {
-	if (!pmd_leaf(READ_ONCE(*pmdp)))
+	if (!pmd_leaf(pmdp_get(pmdp)))
 		return 0;
 	pmd_clear(pmdp);
 	return 1;
@@ -1870,7 +1870,7 @@ static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr,
 	pte_t *table;
 	pmd_t pmd;
 
-	pmd = READ_ONCE(*pmdp);
+	pmd = pmdp_get(pmdp);
 
 	if (!pmd_table(pmd)) {
 		VM_WARN_ON(1);
@@ -2377,4 +2377,5 @@ int arch_set_user_pkey_access(int pkey, unsigned long init_val)
 
 	return 0;
 }
+
 #endif
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index bbe98ac9ad8c..0ca07bd5ded9 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -414,7 +414,7 @@ bool kernel_page_present(struct page *page)
 		return pud_valid(pud);
 
 	pmdp = pmd_offset(pudp, addr);
-	pmd = READ_ONCE(*pmdp);
+	pmd = pmdp_get(pmdp);
 	if (pmd_none(pmd))
 		return false;
 	if (pmd_leaf(pmd))
diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
index cca9706a875c..b27b2d2c20c3 100644
--- a/arch/arm64/mm/trans_pgd.c
+++ b/arch/arm64/mm/trans_pgd.c
@@ -74,7 +74,7 @@ static int copy_pmd(struct trans_pgd_info *info, pud_t *dst_pudp,
 
 	src_pmdp = pmd_offset(src_pudp, start);
 	do {
-		pmd_t pmd = READ_ONCE(*src_pmdp);
+		pmd_t pmd = pmdp_get(src_pmdp);
 
 		next = pmd_addr_end(addr, end);
 		if (pmd_none(pmd))
-- 
2.43.0


