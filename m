Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE3EC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 03:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yP+XQhskvdcS42TZvvDKrCf5KDgIRQXEgf2mQg8FHI=; b=VKJiZfvt2N2gIlYyJNyJnZXnzx
	eErsh4LTubZ2ZiX4QtT1EGc0lnoUfc2R+hHtu6O1zpPqhnV4Ya8s2xztR+Bbjsokc73UG1YvV0agT
	E4TvfpZW9DLJZddBj6Qe065/rTVtLX1NBsXhYHK31RP++woWUNADhfp8+PrI3VqukqDkU0AqGJff5
	z8BWGbubaJt9wvjmLCxz9s+qR1b34ZLyxDODUFnI7ewaBsn58lRjDcNPXU+pUsL+5Sht3rgL+Qk7f
	rFsB+HcOcgke5hgc88b67GyVm7MWWxE/dPk7rWOwtGzpbRrOTQkmhuib8xv4waV3Q4fYSlO1sx5nJ
	ea0jM4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3QNU-00000005nWH-2tTn;
	Mon, 07 Sep 2026 03:50:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3QNS-00000005nVr-445b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 03:50:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 945811516;
	Sun,  6 Sep 2026 20:50:34 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89B773F7B4;
	Sun,  6 Sep 2026 20:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788753038; bh=3yn6gSsOXRoyaBz1CARO0jyrfcLMBCzmt7csYw/Fkvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LW2jt5b0BLThiRONOynNfF1FBuy3s6vy0IP2y1G8Ho9rA3Rexh4127PHoDgS9FR98
	 ZDfgStQaqGpdqFi3z28eNV4z53rIyzJ5VwrpgP/WMoKM3iCdUA0Gjq3CKdnnc0WvyA
	 DOD/Cgke+1nc0Oi/K3jQrqX5CVCODcbUyP+HNuEs=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
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
	linux-mm@kvack.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [PATCH V2 01/14] mm: Add read-write accessors for vm_page_prot
Date: Mon,  7 Sep 2026 09:20:16 +0530
Message-ID: <20260907035030.2839978-2-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907035030.2839978-1-anshuman.khandual@arm.com>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_205039_087637_B741563C 
X-CRM114-Status: GOOD (  14.17  )
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

Add read and write accessors for vm_page_prot like pgprot_[read|write]()
which any platform can override when required, although still defaulting as
READ_ONCE() and WRITE_ONCE(), thus preserving the functionality for others.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 include/linux/pgtable.h | 14 ++++++++++++++
 mm/huge_memory.c        |  4 ++--
 mm/memory.c             |  2 +-
 mm/migrate.c            |  2 +-
 mm/mmap.c               |  2 +-
 5 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e3c8ab96941c..0df57a5c19ef 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -524,6 +524,20 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
 }
 #endif
 
+#ifndef pgprot_read
+static inline pgprot_t pgprot_read(pgprot_t *prot)
+{
+	return READ_ONCE(*prot);
+}
+#endif
+
+#ifndef pgprot_write
+static inline void pgprot_write(pgprot_t *prot, pgprot_t val)
+{
+	WRITE_ONCE(*prot, val);
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline bool ptep_test_and_clear_young(struct vm_area_struct *vma,
 		unsigned long address, pte_t *ptep)
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ced400f72d43..33753bffead4 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3391,7 +3391,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	} else {
 		pte_t entry;
 
-		entry = mk_pte(page, READ_ONCE(vma->vm_page_prot));
+		entry = mk_pte(page, pgprot_read(&vma->vm_page_prot));
 		if (write)
 			entry = pte_mkwrite(entry, vma);
 		if (!young)
@@ -5103,7 +5103,7 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct folio *folio
 
 	entry = softleaf_from_pmd(*pvmw->pmd);
 	folio_get(folio);
-	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
+	pmde = folio_mk_pmd(folio, pgprot_read(&vma->vm_page_prot));
 
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
diff --git a/mm/memory.c b/mm/memory.c
index aa6b2fc770fc..fcea6098efb2 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -939,7 +939,7 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
 
 	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
 
-	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
+	pte = pte_mkold(mk_pte(page, pgprot_read(&vma->vm_page_prot)));
 	if (pte_swp_soft_dirty(orig_pte))
 		pte = pte_mksoft_dirty(pte);
 
diff --git a/mm/migrate.c b/mm/migrate.c
index 15b45832bcfa..579152cce502 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -387,7 +387,7 @@ static bool remove_migration_pte(struct folio *folio,
 
 		folio_get(folio);
 		new = folio_page(folio, idx);
-		pte = mk_pte(new, READ_ONCE(vma->vm_page_prot));
+		pte = mk_pte(new, pgprot_read(&vma->vm_page_prot));
 		if (!softleaf_is_migration_young(entry))
 			pte = pte_mkold(pte);
 		if (folio_test_dirty(folio) && softleaf_is_migration_dirty(entry))
diff --git a/mm/mmap.c b/mm/mmap.c
index 4bf26b0f1e6e..729bc244b317 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -89,7 +89,7 @@ void vma_set_page_prot(struct vm_area_struct *vma)
 		vm_page_prot = vma_pgprot_modify(vm_page_prot, vma_flags);
 	}
 	/* remove_protection_ptes reads vma->vm_page_prot without mmap_lock */
-	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
+	pgprot_write(&vma->vm_page_prot, vm_page_prot);
 }
 
 /*
-- 
2.43.0


