Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF787C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 08:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tjfl4ziwjfHSxtx/Q53uZF468Ponlql0YZKHd4fmxws=; b=Molz5i1/ch6GdXmz23N1sSl9zt
	cgr394tvY2X7t68lhJphA7aB//EhH4eZM5kpq+Zbp+sX3JRT5RR847a5qjC693YlmDGhGvbMAScwe
	mPZnjBdrEi4+H+DWfeN7ZCGj8IIBSzO255OWEraIrhx3a1J68KSRFkqWY3iMYHFN6k7Tr724JANAj
	BmoP3onU77EkvNIr8JCKOOrMR8uq1sMIogUHkRhYRm2wsB/xThIPvX+vvISOZFlB4kTFssG7Ps6vc
	Csz5bX/OICMLhFlsLIbI/y5NZyY6vR8CNdniLfkQC/Gvchq8ZXSsrIwJxVSaV92VY7MM/IjmG6kiF
	4bRN+v+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79O1-00000006RJh-3zC7;
	Tue, 22 Apr 2025 08:53:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78qI-00000006GpH-2aPs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:19:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5AD319F0;
	Tue, 22 Apr 2025 01:18:53 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E4B73F66E;
	Tue, 22 Apr 2025 01:18:56 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/11] mm/vmalloc: Gracefully unmap huge ptes
Date: Tue, 22 Apr 2025 09:18:16 +0100
Message-ID: <20250422081822.1836315-9-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422081822.1836315-1-ryan.roberts@arm.com>
References: <20250422081822.1836315-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_011858_780144_1AB9AE1B 
X-CRM114-Status: GOOD (  15.55  )
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

Commit f7ee1f13d606 ("mm/vmalloc: enable mapping of huge pages at pte
level in vmap") added its support by reusing the set_huge_pte_at() API,
which is otherwise only used for user mappings. But when unmapping those
huge ptes, it continued to call ptep_get_and_clear(), which is a
layering violation. To date, the only arch to implement this support is
powerpc and it all happens to work ok for it.

But arm64's implementation of ptep_get_and_clear() can not be safely
used to clear a previous set_huge_pte_at(). So let's introduce a new
arch opt-in function, arch_vmap_pte_range_unmap_size(), which can
provide the size of a (present) pte. Then we can call
huge_ptep_get_and_clear() to tear it down properly.

Note that if vunmap_range() is called with a range that starts in the
middle of a huge pte-mapped page, we must unmap the entire huge page so
the behaviour is consistent with pmd and pud block mappings. In this
case emit a warning just like we do for pmd/pud mappings.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/vmalloc.h |  8 ++++++++
 mm/vmalloc.c            | 18 ++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 31e9ffd936e3..16dd4cba64f2 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -113,6 +113,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, uns
 }
 #endif
 
+#ifndef arch_vmap_pte_range_unmap_size
+static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned long addr,
+							   pte_t *ptep)
+{
+	return PAGE_SIZE;
+}
+#endif
+
 #ifndef arch_vmap_pte_supported_shift
 static inline int arch_vmap_pte_supported_shift(unsigned long size)
 {
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index d60d3a29d149..fe2e2cc8da94 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -350,12 +350,26 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			     pgtbl_mod_mask *mask)
 {
 	pte_t *pte;
+	pte_t ptent;
+	unsigned long size = PAGE_SIZE;
 
 	pte = pte_offset_kernel(pmd, addr);
 	do {
-		pte_t ptent = ptep_get_and_clear(&init_mm, addr, pte);
+#ifdef CONFIG_HUGETLB_PAGE
+		size = arch_vmap_pte_range_unmap_size(addr, pte);
+		if (size != PAGE_SIZE) {
+			if (WARN_ON(!IS_ALIGNED(addr, size))) {
+				addr = ALIGN_DOWN(addr, size);
+				pte = PTR_ALIGN_DOWN(pte, sizeof(*pte) * (size >> PAGE_SHIFT));
+			}
+			ptent = huge_ptep_get_and_clear(&init_mm, addr, pte, size);
+			if (WARN_ON(end - addr < size))
+				size = end - addr;
+		} else
+#endif
+			ptent = ptep_get_and_clear(&init_mm, addr, pte);
 		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
-	} while (pte++, addr += PAGE_SIZE, addr != end);
+	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
 	*mask |= PGTBL_PTE_MODIFIED;
 }
 
-- 
2.43.0


