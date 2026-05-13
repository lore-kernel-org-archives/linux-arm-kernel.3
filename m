Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33278CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 04:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApRpJ5CgTvyAvUoBge/pm4gZOB0vW5sBGLScXsfmJtY=; b=SunO0kODbEru6kp4e27qVc3nqo
	NJmQddy0P/5QxtG4f3IyF/bAwkTJFjfeqWwNAYFSMUkU63NJqbGO2hwX3WO93OQa/7itavuHGjYQn
	0giLy8I1lmBaD5iXsCiix4eAuLrwI4zpDEWw5JMIX+lu4ZrrpSTAlW4J+Ap6Mn4JxqyPcyyC7NHgv
	DqtherEDIXuT/unENSrDSrTk59c3HqbERvVBDBarCFB8baIo67FH+R3xWwbyk2LhMctfxwZTBEGni
	CAIwswPbBoeq+UVGD6xEpjw6RXIAOmjXHTpLeQUSgys6v+D1ML8RKyCp5oxZL3U0KDUMuJ7vixtFe
	oYPjxK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1UE-00000001EGz-0rlu;
	Wed, 13 May 2026 04:46:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1UC-00000001EFx-0G0N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 04:46:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDAA5153B;
	Tue, 12 May 2026 21:46:12 -0700 (PDT)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.18.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A6093F7B4;
	Tue, 12 May 2026 21:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778647578; bh=4xGOtuj2CVRhi0hzN+I2vi5eDNTXZt1P2D73d9+j0uM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JfI4UA/SaD7Ajfjfh8yxTqHtbVtcSTUAUubWw255DzWMMHIK+tDyVRDHMGgEPbThu
	 g5xJ1vn3PtBxTFINgPZVi4l1xZLWtu1ZEA4oSQ5YfFlKS2lFXww/XDbf/thYdJC3ps
	 e6KlfoTJccw+cNHmqIGPHxwbW4eztz0qPH5SFvQU=
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
	Usama Arif <usama.arif@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC V2 01/14] mm: Abstract printing of pxd_val()
Date: Wed, 13 May 2026 10:15:34 +0530
Message-ID: <20260513044547.4128549-2-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513044547.4128549-1-anshuman.khandual@arm.com>
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_214620_194873_C4C2CAB5 
X-CRM114-Status: GOOD (  14.20  )
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
Changes in RFC V2:

- Moved pxdval_t definition inside generic page table header per Mike
- Restored print format in __print_bad_page_map_pgtable() per Usama
- Renamed __PRIpte as __PRIpxx per David

 include/linux/pgtable.h | 11 +++++++++++
 mm/memory.c             | 23 +++++++++++++----------
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index cdd68ed3ae1a..a738048128e7 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -17,6 +17,17 @@
 #include <asm-generic/pgtable_uffd.h>
 #include <linux/page_table_check.h>
 
+#ifdef __SIZEOF_INT128__
+typedef u128 pxdval_t;
+#else
+typedef unsigned long long pxdval_t;
+#endif
+
+#ifndef __PRIpxx
+#define __PRIpxx		"016llx"
+#define __PRIpxx_args(val)	((u64)val)
+#endif
+
 #if 5 - defined(__PAGETABLE_P4D_FOLDED) - defined(__PAGETABLE_PUD_FOLDED) - \
 	defined(__PAGETABLE_PMD_FOLDED) != CONFIG_PGTABLE_LEVELS
 #error CONFIG_PGTABLE_LEVELS is not consistent with __PAGETABLE_{P4D,PUD,PMD}_FOLDED
diff --git a/mm/memory.c b/mm/memory.c
index ea6568571131..7b6ee3b847a0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -521,7 +521,7 @@ static bool is_bad_page_map_ratelimited(void)
 
 static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long addr)
 {
-	unsigned long long pgdv, p4dv, pudv, pmdv;
+	pxdval_t pgdv, p4dv, pudv, pmdv;
 	p4d_t p4d, *p4dp;
 	pud_t pud, *pudp;
 	pmd_t pmd, *pmdp;
@@ -535,7 +535,7 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
 	pgdv = pgd_val(*pgdp);
 
 	if (!pgd_present(*pgdp) || pgd_leaf(*pgdp)) {
-		pr_alert("pgd:%08llx\n", pgdv);
+		pr_alert("pgd:%" __PRIpxx "\n", __PRIpxx_args(pgdv));
 		return;
 	}
 
@@ -544,7 +544,8 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
 	p4dv = p4d_val(p4d);
 
 	if (!p4d_present(p4d) || p4d_leaf(p4d)) {
-		pr_alert("pgd:%08llx p4d:%08llx\n", pgdv, p4dv);
+		pr_alert("pgd:%" __PRIpxx " p4d:%" __PRIpxx "\n",
+			 __PRIpxx_args(pgdv), __PRIpxx_args(p4dv));
 		return;
 	}
 
@@ -553,7 +554,8 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
 	pudv = pud_val(pud);
 
 	if (!pud_present(pud) || pud_leaf(pud)) {
-		pr_alert("pgd:%08llx p4d:%08llx pud:%08llx\n", pgdv, p4dv, pudv);
+		pr_alert("pgd:%" __PRIpxx " p4d:%" __PRIpxx " pud:%" __PRIpxx "\n",
+			 __PRIpxx_args(pgdv), __PRIpxx_args(p4dv), __PRIpxx_args(pudv));
 		return;
 	}
 
@@ -567,8 +569,9 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
 	 * doing another map would be bad. print_bad_page_map() should
 	 * already take care of printing the PTE.
 	 */
-	pr_alert("pgd:%08llx p4d:%08llx pud:%08llx pmd:%08llx\n", pgdv,
-		 p4dv, pudv, pmdv);
+	pr_alert("pgd:%" __PRIpxx " p4d:%" __PRIpxx " pud:%" __PRIpxx " pmd:%" __PRIpxx "\n",
+		 __PRIpxx_args(pgdv), __PRIpxx_args(p4dv),
+		 __PRIpxx_args(pudv), __PRIpxx_args(pmdv));
 }
 
 /*
@@ -584,7 +587,7 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
  * page table lock.
  */
 static void print_bad_page_map(struct vm_area_struct *vma,
-		unsigned long addr, unsigned long long entry, struct page *page,
+		unsigned long addr, pxdval_t entry, struct page *page,
 		enum pgtable_level level)
 {
 	struct address_space *mapping;
@@ -596,8 +599,8 @@ static void print_bad_page_map(struct vm_area_struct *vma,
 	mapping = vma->vm_file ? vma->vm_file->f_mapping : NULL;
 	index = linear_page_index(vma, addr);
 
-	pr_alert("BUG: Bad page map in process %s  %s:%08llx", current->comm,
-		 pgtable_level_to_str(level), entry);
+	pr_alert("BUG: Bad page map in process %s  %s:%" __PRIpxx, current->comm,
+		 pgtable_level_to_str(level), __PRIpxx_args(entry));
 	__print_bad_page_map_pgtable(vma->vm_mm, addr);
 	if (page)
 		dump_page(page, "bad page map");
@@ -682,7 +685,7 @@ static void print_bad_page_map(struct vm_area_struct *vma,
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


