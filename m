Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F073EFB7FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 05:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2iPh1K2LTc1o70lQa7JOFynl3p68eA20V9ZtDN6OZM=; b=rBo7od2BBRKxGakHyJPYWhiF/v
	Ll9gH5XErphMVQFKrqqo4+EIuTxuw8/EiBlCOtpZA6ar4Xmesw4nIZ3GIUTq+xQSm7+0dQdoMX8yA
	WHWV8MbWbTJYYeBvfIx2RVV+U8Be3KGjrldYrVUw1Pux5eCgb505yJZvvRClstI+FkDvD6AU9+br1
	RMaiyRMkFyxgmc2ycyg0gksFc80xVEqd3q9qz11VysvVDVq0qT+YpF1qETRbQs3sbkp756K0IfTsv
	VFmReUtwqw2SzjJ7dXIZTRj/cZUI8clhwcqgcHiPFG3KlQBVkobbTZDOzyWGZR+ep43zCBIodfbFp
	Y6vWK6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukip-00000001SOQ-1mqj;
	Tue, 24 Feb 2026 05:12:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukil-00000001SMz-1MNa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 05:12:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9552497;
	Mon, 23 Feb 2026 21:12:23 -0800 (PST)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.18.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0458E3F7BD;
	Mon, 23 Feb 2026 21:12:25 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC V1 01/16] mm: Abstract printing of pxd_val()
Date: Tue, 24 Feb 2026 10:41:38 +0530
Message-ID: <20260224051153.3150613-2-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224051153.3150613-1-anshuman.khandual@arm.com>
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_211231_459830_2FEAA56C 
X-CRM114-Status: GOOD (  14.54  )
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

Ahead of adding support for D128 pgtables, refactor places that print
PTE values to use the new __PRIpte format specifier and __PRIpte_args()
macro to prepare the argument(s). When using D128 pgtables in future,
we can simply redefine __PRIpte and __PTIpte_args().

Besides there is also an assumption about pxd_val() being always capped
at 'unsigned long long' size but that will not work for D128 pgtables.
Just increase its size to u128 if the compiler supports via a separate
data type pxdval_t which also defaults to existing 'unsigned long long'.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 include/linux/pgtable.h |  5 +++++
 mm/memory.c             | 29 +++++++++++++++++++----------
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index a50df42a893f..da17139a1279 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -17,6 +17,11 @@
 #include <asm-generic/pgtable_uffd.h>
 #include <linux/page_table_check.h>
 
+#ifndef __PRIpte
+#define __PRIpte		"016llx"
+#define __PRIpte_args(val)	((u64)val)
+#endif
+
 #if 5 - defined(__PAGETABLE_P4D_FOLDED) - defined(__PAGETABLE_PUD_FOLDED) - \
 	defined(__PAGETABLE_PMD_FOLDED) != CONFIG_PGTABLE_LEVELS
 #error CONFIG_PGTABLE_LEVELS is not consistent with __PAGETABLE_{P4D,PUD,PMD}_FOLDED
diff --git a/mm/memory.c b/mm/memory.c
index 07778814b4a8..cfc3077fc52f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -532,9 +532,15 @@ static bool is_bad_page_map_ratelimited(void)
 	return false;
 }
 
+#ifdef __SIZEOF_INT128__
+	typedef u128 pxdval_t;
+#else
+	typedef unsigned long long pxdval_t;
+#endif
+
 static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long addr)
 {
-	unsigned long long pgdv, p4dv, pudv, pmdv;
+	pxdval_t pgdv, p4dv, pudv, pmdv;
 	p4d_t p4d, *p4dp;
 	pud_t pud, *pudp;
 	pmd_t pmd, *pmdp;
@@ -548,7 +554,7 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
 	pgdv = pgd_val(*pgdp);
 
 	if (!pgd_present(*pgdp) || pgd_leaf(*pgdp)) {
-		pr_alert("pgd:%08llx\n", pgdv);
+		pr_alert("pgd:%" __PRIpte "\n", __PRIpte_args(pgdv));
 		return;
 	}
 
@@ -557,7 +563,8 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
 	p4dv = p4d_val(p4d);
 
 	if (!p4d_present(p4d) || p4d_leaf(p4d)) {
-		pr_alert("pgd:%08llx p4d:%08llx\n", pgdv, p4dv);
+		pr_alert("pgd:%" __PRIpte "p4d:%" __PRIpte "\n",
+			 __PRIpte_args(pgdv), __PRIpte_args(p4dv));
 		return;
 	}
 
@@ -566,7 +573,8 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
 	pudv = pud_val(pud);
 
 	if (!pud_present(pud) || pud_leaf(pud)) {
-		pr_alert("pgd:%08llx p4d:%08llx pud:%08llx\n", pgdv, p4dv, pudv);
+		pr_alert("pgd:%" __PRIpte "p4d:%" __PRIpte "pud:%" __PRIpte "\n",
+			 __PRIpte_args(pgdv), __PRIpte_args(p4dv), __PRIpte_args(pudv));
 		return;
 	}
 
@@ -580,8 +588,9 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
 	 * doing another map would be bad. print_bad_page_map() should
 	 * already take care of printing the PTE.
 	 */
-	pr_alert("pgd:%08llx p4d:%08llx pud:%08llx pmd:%08llx\n", pgdv,
-		 p4dv, pudv, pmdv);
+	pr_alert("pgd:%" __PRIpte "p4d:%" __PRIpte "pud:%" __PRIpte "pmd:%" __PRIpte "\n",
+		 __PRIpte_args(pgdv), __PRIpte_args(p4dv),
+		 __PRIpte_args(pudv), __PRIpte_args(pmdv));
 }
 
 /*
@@ -597,7 +606,7 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
  * page table lock.
  */
 static void print_bad_page_map(struct vm_area_struct *vma,
-		unsigned long addr, unsigned long long entry, struct page *page,
+		unsigned long addr, pxdval_t entry, struct page *page,
 		enum pgtable_level level)
 {
 	struct address_space *mapping;
@@ -609,8 +618,8 @@ static void print_bad_page_map(struct vm_area_struct *vma,
 	mapping = vma->vm_file ? vma->vm_file->f_mapping : NULL;
 	index = linear_page_index(vma, addr);
 
-	pr_alert("BUG: Bad page map in process %s  %s:%08llx", current->comm,
-		 pgtable_level_to_str(level), entry);
+	pr_alert("BUG: Bad page map in process %s  %s:%" __PRIpte, current->comm,
+		 pgtable_level_to_str(level), __PRIpte_args(entry));
 	__print_bad_page_map_pgtable(vma->vm_mm, addr);
 	if (page)
 		dump_page(page, "bad page map");
@@ -695,7 +704,7 @@ static void print_bad_page_map(struct vm_area_struct *vma,
  */
 static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
 		unsigned long addr, unsigned long pfn, bool special,
-		unsigned long long entry, enum pgtable_level level)
+		pxdval_t entry, enum pgtable_level level)
 {
 	if (IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL)) {
 		if (unlikely(special)) {
-- 
2.43.0


