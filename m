Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1101EC3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 05:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qjZmg0eEJEeO+MiKEt7kQSfHjMNyNDs5BR4+Dl9DEQ=; b=S/Mwd34HwiDjCOWl6kFaCmtXw6
	EesmEcK+Nfz8Q2YCt67NpWydg7Ve9Cqmx3vHHQ5SgbwWzUbPR9rrbHO9dchwqMoYp4TLTOb6mE9ou
	ZMIqF0FH4cgFL9U0qCRRIitxTAbSINahgtMya6CRc48GFMEYlPGAxyeDiehhLOsUwMU2qwVPe1LkC
	tClOyCfGeGCKx+kydzJImBodv6UxSM3RyohGUpvyO1U7qz2KfOMxpD7fSWGwOq4FKQ6U0ycLjsmDq
	RCF6UlNQBW0bgLCRsdoxgpgk/KmgN+jt+7NlFuWZI00t8PqrvygbdNfEMwmNNZ+IGgoVGNsx7gf2l
	n1FVJK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dew-00000008PEu-36lR;
	Tue, 29 Apr 2025 05:37:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dSe-00000008NhX-2rma
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 05:24:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 748811515;
	Mon, 28 Apr 2025 22:24:45 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.78.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4330A3F5A1;
	Mon, 28 Apr 2025 22:24:41 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: ryan.roberts@arm.com,
	david@redhat.com,
	willy@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	anshuman.khandual@arm.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	ioworker0@gmail.com,
	baohua@kernel.org,
	kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com,
	christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	namit@vmware.com,
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
Date: Tue, 29 Apr 2025 10:53:35 +0530
Message-Id: <20250429052336.18912-7-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250429052336.18912-1-dev.jain@arm.com>
References: <20250429052336.18912-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_222452_813632_8FA84A88 
X-CRM114-Status: GOOD (  15.36  )
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

In preparation for patch 7, we need to properly batch around
can_change_pte_writable(). We batch around pte_needs_soft_dirty_wp() by
the corresponding fpb flag, we batch around the page-anon exclusive check
using folio_maybe_mapped_shared(); modify_prot_start_ptes() collects the
dirty and access bits across the batch, therefore batching across
pte_dirty(): this is correct since the dirty bit on the PTE really
is just an indication that the folio got written to, so even if
the PTE is not actually dirty (but one of the PTEs in the batch is),
the wp-fault optimization can be made.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 include/linux/mm.h |  4 ++--
 mm/gup.c           |  2 +-
 mm/huge_memory.c   |  4 ++--
 mm/memory.c        |  6 +++---
 mm/mprotect.c      | 11 ++++++-----
 5 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 21dd110b6655..2f639f6d93f9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2487,8 +2487,8 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
 #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
 					    MM_CP_UFFD_WP_RESOLVE)
 
-bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
-			     pte_t pte);
+bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t pte, struct folio *folio, unsigned int nr);
 extern long change_protection(struct mmu_gather *tlb,
 			      struct vm_area_struct *vma, unsigned long start,
 			      unsigned long end, unsigned long cp_flags);
diff --git a/mm/gup.c b/mm/gup.c
index f32168339390..c39f587842a0 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -614,7 +614,7 @@ static inline bool can_follow_write_common(struct page *page,
 		return false;
 
 	/*
-	 * See can_change_pte_writable(): we broke COW and could map the page
+	 * See can_change_ptes_writable(): we broke COW and could map the page
 	 * writable if we have an exclusive anonymous page ...
 	 */
 	return page && PageAnon(page) && PageAnonExclusive(page);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2780a12b25f0..a58445fcedfc 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2032,12 +2032,12 @@ static inline bool can_change_pmd_writable(struct vm_area_struct *vma,
 		return false;
 
 	if (!(vma->vm_flags & VM_SHARED)) {
-		/* See can_change_pte_writable(). */
+		/* See can_change_ptes_writable(). */
 		page = vm_normal_page_pmd(vma, addr, pmd);
 		return page && PageAnon(page) && PageAnonExclusive(page);
 	}
 
-	/* See can_change_pte_writable(). */
+	/* See can_change_ptes_writable(). */
 	return pmd_dirty(pmd);
 }
 
diff --git a/mm/memory.c b/mm/memory.c
index 68c1d962d0ad..e7ebc6b70421 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -750,7 +750,7 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
 		pte = pte_mkuffd_wp(pte);
 
 	if ((vma->vm_flags & VM_WRITE) &&
-	    can_change_pte_writable(vma, address, pte)) {
+	    can_change_ptes_writable(vma, address, pte, NULL, 1)) {
 		if (folio_test_dirty(folio))
 			pte = pte_mkdirty(pte);
 		pte = pte_mkwrite(pte, vma);
@@ -5796,7 +5796,7 @@ static void numa_rebuild_large_mapping(struct vm_fault *vmf, struct vm_area_stru
 			ptent = pte_modify(ptent, vma->vm_page_prot);
 			writable = pte_write(ptent);
 			if (!writable && pte_write_upgrade &&
-			    can_change_pte_writable(vma, addr, ptent))
+			    can_change_ptes_writable(vma, addr, ptent, NULL, 1))
 				writable = true;
 		}
 
@@ -5837,7 +5837,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
 	 */
 	writable = pte_write(pte);
 	if (!writable && pte_write_upgrade &&
-	    can_change_pte_writable(vma, vmf->address, pte))
+	    can_change_ptes_writable(vma, vmf->address, pte, NULL, 1))
 		writable = true;
 
 	folio = vm_normal_folio(vma, vmf->address, pte);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index ec5d17af7650..baff009fc981 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -40,8 +40,8 @@
 
 #include "internal.h"
 
-bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
-			     pte_t pte)
+bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
+			      pte_t pte, struct folio *folio, unsigned int nr)
 {
 	struct page *page;
 
@@ -67,8 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 		 * write-fault handler similarly would map them writable without
 		 * any additional checks while holding the PT lock.
 		 */
-		page = vm_normal_page(vma, addr, pte);
-		return page && PageAnon(page) && PageAnonExclusive(page);
+		if (!folio)
+			folio = vm_normal_folio(vma, addr, pte);
+		return folio_test_anon(folio) && !folio_maybe_mapped_shared(folio);
 	}
 
 	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
@@ -222,7 +223,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 			 */
 			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
 			    !pte_write(ptent) &&
-			    can_change_pte_writable(vma, addr, ptent))
+			    can_change_ptes_writable(vma, addr, ptent, folio, 1))
 				ptent = pte_mkwrite(ptent, vma);
 
 			ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
-- 
2.30.2


