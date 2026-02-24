Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69DFEFB7FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 05:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CnmJdYzNBH6v1gLDDRgLYkrgcpHli5wtReFHoAMMQI=; b=HHt3w6ojOwwLHMwKkcNYNqg44R
	Rc+3TYZr+yO/C2JSvHhVKjrVIamMvftiOP3VqIn8Xhmzbsylo/U4122iGbx+21ASWcyddGJeR38g3
	hN1ZWeT9rSnXXXZLaI3EYvbRGc2INpO1MIBYqHIYJ3N8elaBxqNuCcCeQGSAWyvXKN/CEL5UUUM3I
	0cyR6n3UcYo716LoTIH2wr5LdJkwXPwsu+waFMMOO5afj3MKLp8G7CemNI5nJFGhoPKzr64AWRl0c
	nJYXZ5UkEFcTEQC6cr4f0Dm7iQWEGIvXoUFdg5EHyVX13PzARh7uo5jaNnulzy7kSLZ5L67MJXByV
	dqY032Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukiu-00000001SQQ-31Uu;
	Tue, 24 Feb 2026 05:12:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukip-00000001SOr-3NhV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 05:12:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3E3B339;
	Mon, 23 Feb 2026 21:12:28 -0800 (PST)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.18.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C4D163F7BD;
	Mon, 23 Feb 2026 21:12:30 -0800 (PST)
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
Subject: [RFC V1 02/16] mm: Add read-write accessors for vm_page_prot
Date: Tue, 24 Feb 2026 10:41:39 +0530
Message-ID: <20260224051153.3150613-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224051153.3150613-1-anshuman.khandual@arm.com>
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_211235_981504_83C2C11B 
X-CRM114-Status: GOOD (  13.57  )
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

Currently vma->vm_page_prot is safely read from and written to, without any
locks with READ_ONCE() and WRITE_ONCE(). But with introduction of D128 page
tables on arm64 platform, vm_page_prot grows to 128 bits which can't safely
be handled with READ_ONCE() and WRITE_ONCE().

Add read and write accessors for vm_page_prot like pgprot_read/write_once()
which any platform can override when required, although still defaulting as
READ_ONCE() and WRITE_ONCE(), thus preserving the functionality for others.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 include/linux/pgtable.h | 14 ++++++++++++++
 mm/huge_memory.c        |  4 ++--
 mm/memory.c             |  2 +-
 mm/migrate.c            |  2 +-
 mm/mmap.c               |  2 +-
 5 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index da17139a1279..8858b8b03a02 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -495,6 +495,20 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
 }
 #endif
 
+#ifndef pgprot_read_once
+static inline pgprot_t pgprot_read_once(pgprot_t *prot)
+{
+	return READ_ONCE(*prot);
+}
+#endif
+
+#ifndef pgprot_write_once
+static inline void pgprot_write_once(pgprot_t *prot, pgprot_t val)
+{
+	WRITE_ONCE(*prot, val);
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 					    unsigned long address,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d4ca8cfd7f9d..0d9d6569367e 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3233,7 +3233,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	} else {
 		pte_t entry;
 
-		entry = mk_pte(page, READ_ONCE(vma->vm_page_prot));
+		entry = mk_pte(page, pgprot_read_once(&vma->vm_page_prot));
 		if (write)
 			entry = pte_mkwrite(entry, vma);
 		if (!young)
@@ -4918,7 +4918,7 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 
 	entry = softleaf_from_pmd(*pvmw->pmd);
 	folio_get(folio);
-	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
+	pmde = folio_mk_pmd(folio, pgprot_read_once(&vma->vm_page_prot));
 
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
diff --git a/mm/memory.c b/mm/memory.c
index cfc3077fc52f..2d99c9212883 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -895,7 +895,7 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
 
 	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
 
-	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
+	pte = pte_mkold(mk_pte(page, pgprot_read_once(&vma->vm_page_prot)));
 	if (pte_swp_soft_dirty(orig_pte))
 		pte = pte_mksoft_dirty(pte);
 
diff --git a/mm/migrate.c b/mm/migrate.c
index 1bf2cf8c44dd..9db1e6ed9042 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -377,7 +377,7 @@ static bool remove_migration_pte(struct folio *folio,
 			continue;
 
 		folio_get(folio);
-		pte = mk_pte(new, READ_ONCE(vma->vm_page_prot));
+		pte = mk_pte(new, pgprot_read_once(&vma->vm_page_prot));
 
 		entry = softleaf_from_pte(old_pte);
 		if (!softleaf_is_migration_young(entry))
diff --git a/mm/mmap.c b/mm/mmap.c
index 843160946aa5..af6870115a9d 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -89,7 +89,7 @@ void vma_set_page_prot(struct vm_area_struct *vma)
 		vm_page_prot = vm_pgprot_modify(vm_page_prot, vm_flags);
 	}
 	/* remove_protection_ptes reads vma->vm_page_prot without mmap_lock */
-	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
+	pgprot_write_once(&vma->vm_page_prot, vm_page_prot);
 }
 
 /*
-- 
2.43.0


