Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFF7C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIxxSOtTOWfkgJ6ZPTh9wpPoFqmWlmW/dFwplfHXX5c=; b=FVh+3VQyaSbVyB401SzwBJZjki
	0pCbQoRZaSwhxL4PVV7/qbtT8eb0R/tQ1StdeskvBKxRf9cwCO/5B2WdigL6dEz4V9rPEfwPU+A88
	dN/Dv36kLNac2XqSVBHRr2CwlHsjkARbTQkJ5JJg5x9fAdmxE+4vo0yZCgpoMIhW0NWJnXjTyBrbM
	PXG16INzDjgpIxnP4PRg994dVq/eE/wk31DJ0DKh4vftKANOdLl3iKPKlOafgIUOdHaK1+pR08bzm
	DXlbm9QBeqZV62ZBwYJ7IyhUitdqXMDXmIIm/B+DTKaPqAxeJ7S73iWBeA6HtU680NBfUv4EO/0wx
	hIr+QJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhN1-00000003mBp-3bTg;
	Wed, 05 Feb 2025 15:31:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfh3S-00000003iNi-4BAX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 15:11:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 439D7165C;
	Wed,  5 Feb 2025 07:11:30 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27B823F5A1;
	Wed,  5 Feb 2025 07:11:04 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steve Capper <steve.capper@linaro.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 14/16] mm/vmalloc: Batch arch_sync_kernel_mappings() more efficiently
Date: Wed,  5 Feb 2025 15:09:54 +0000
Message-ID: <20250205151003.88959-15-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205151003.88959-1-ryan.roberts@arm.com>
References: <20250205151003.88959-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_071107_126309_28DEC353 
X-CRM114-Status: GOOD (  15.90  )
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

When page_shift is greater than PAGE_SIZE, __vmap_pages_range_noflush()
will call vmap_range_noflush() for each individual huge page. But
vmap_range_noflush() would previously call arch_sync_kernel_mappings()
directly so this would end up being called for every huge page.

We can do better than this; refactor the call into the outer
__vmap_pages_range_noflush() so that it is only called once for the
entire batch operation.

This will benefit performance for arm64 which is about to opt-in to
using the hook.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 mm/vmalloc.c | 60 ++++++++++++++++++++++++++--------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 68950b1824d0..50fd44439875 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -285,40 +285,38 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 
 static int vmap_range_noflush(unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift)
+			unsigned int max_page_shift, pgtbl_mod_mask *mask)
 {
 	pgd_t *pgd;
-	unsigned long start;
 	unsigned long next;
 	int err;
-	pgtbl_mod_mask mask = 0;
 
 	might_sleep();
 	BUG_ON(addr >= end);
 
-	start = addr;
 	pgd = pgd_offset_k(addr);
 	do {
 		next = pgd_addr_end(addr, end);
 		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot,
-					max_page_shift, &mask);
+					max_page_shift, mask);
 		if (err)
 			break;
 	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
 
-	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
-		arch_sync_kernel_mappings(start, end);
-
 	return err;
 }
 
 int vmap_page_range(unsigned long addr, unsigned long end,
 		    phys_addr_t phys_addr, pgprot_t prot)
 {
+	pgtbl_mod_mask mask = 0;
 	int err;
 
 	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
-				 ioremap_max_page_shift);
+				 ioremap_max_page_shift, &mask);
+	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
+		arch_sync_kernel_mappings(addr, end);
+
 	flush_cache_vmap(addr, end);
 	if (!err)
 		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
@@ -587,29 +585,24 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 }
 
 static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
-		pgprot_t prot, struct page **pages)
+		pgprot_t prot, struct page **pages, pgtbl_mod_mask *mask)
 {
-	unsigned long start = addr;
 	pgd_t *pgd;
 	unsigned long next;
 	int err = 0;
 	int nr = 0;
-	pgtbl_mod_mask mask = 0;
 
 	BUG_ON(addr >= end);
 	pgd = pgd_offset_k(addr);
 	do {
 		next = pgd_addr_end(addr, end);
 		if (pgd_bad(*pgd))
-			mask |= PGTBL_PGD_MODIFIED;
-		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
+			*mask |= PGTBL_PGD_MODIFIED;
+		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, mask);
 		if (err)
 			break;
 	} while (pgd++, addr = next, addr != end);
 
-	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
-		arch_sync_kernel_mappings(start, end);
-
 	return err;
 }
 
@@ -626,26 +619,33 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
 	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
+	unsigned long start = addr;
+	pgtbl_mod_mask mask = 0;
+	int err = 0;
 
 	WARN_ON(page_shift < PAGE_SHIFT);
 
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
-		return vmap_small_pages_range_noflush(addr, end, prot, pages);
-
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
-		int err;
-
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
-					page_to_phys(pages[i]), prot,
-					page_shift);
-		if (err)
-			return err;
+			page_shift == PAGE_SHIFT) {
+		err = vmap_small_pages_range_noflush(addr, end, prot, pages,
+						&mask);
+	} else {
+		for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
+			err = vmap_range_noflush(addr,
+						addr + (1UL << page_shift),
+						page_to_phys(pages[i]), prot,
+						page_shift, &mask);
+			if (err)
+				break;
 
-		addr += 1UL << page_shift;
+			addr += 1UL << page_shift;
+		}
 	}
 
-	return 0;
+	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
+		arch_sync_kernel_mappings(start, end);
+
+	return err;
 }
 
 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
-- 
2.43.0


