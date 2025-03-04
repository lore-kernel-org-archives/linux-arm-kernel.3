Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275FEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/4I1FWAK0Gz+hpZmFBcWWWAhCrvc2G8FaWno0kbrTQ=; b=1OfuWYdhnemqIhSEwbeAJ+LyD+
	U7fsuTqu/6shdiUfv5xb/ylR3RX0WztYgoVpWEz2bTLnPDf9Se/ZvffhWdaLtAzYO94wGNctqdckC
	KphLPepIaCRY5/UHTPIPAch8reUH+tKNrGmC72s/WDnjJxXTY63f8x0lOQxl1/FRmvaIuaB7dWKiX
	4N3s0BsjOL9yiFq/UnKUkk7r5bFbjJELnun+rKZ41lbGk7HC6X2+yKm8EP8UlwyPh/FydfVIQWCDD
	Q+y8dv0QeiDZoF8aMUp9nq2DX8ue7jfanQfdwyWWqEycG8zhW7D9oyI6hRDErHBR24ZyJtG2yixAE
	GJqN6eig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUNC-00000005FjM-0GIY;
	Tue, 04 Mar 2025 15:39:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTpc-000000057cu-3S7d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:05:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F4C61C2B;
	Tue,  4 Mar 2025 07:05:30 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D33D3F66E;
	Tue,  4 Mar 2025 07:05:14 -0800 (PST)
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
Subject: [PATCH v3 10/11] mm/vmalloc: Enter lazy mmu mode while manipulating vmalloc ptes
Date: Tue,  4 Mar 2025 15:04:40 +0000
Message-ID: <20250304150444.3788920-11-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304150444.3788920-1-ryan.roberts@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_070516_903388_E101B4F3 
X-CRM114-Status: GOOD (  11.66  )
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

Wrap vmalloc's pte table manipulation loops with
arch_enter_lazy_mmu_mode() / arch_leave_lazy_mmu_mode(). This provides
the arch code with the opportunity to optimize the pte manipulations.

Note that vmap_pfn() already uses lazy mmu mode since it delegates to
apply_to_page_range() which enters lazy mmu mode for both user and
kernel mappings.

These hooks will shortly be used by arm64 to improve vmalloc
performance.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 mm/vmalloc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6111ce900ec4..b63ca0b7dd40 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -104,6 +104,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pte = pte_alloc_kernel_track(pmd, addr, mask);
 	if (!pte)
 		return -ENOMEM;
+
+	arch_enter_lazy_mmu_mode();
+
 	do {
 		if (unlikely(!pte_none(ptep_get(pte)))) {
 			if (pfn_valid(pfn)) {
@@ -127,6 +130,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
 		pfn++;
 	} while (pte += PFN_DOWN(size), addr += size, addr != end);
+
+	arch_leave_lazy_mmu_mode();
 	*mask |= PGTBL_PTE_MODIFIED;
 	return 0;
 }
@@ -354,6 +359,8 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	unsigned long size = PAGE_SIZE;
 
 	pte = pte_offset_kernel(pmd, addr);
+	arch_enter_lazy_mmu_mode();
+
 	do {
 #ifdef CONFIG_HUGETLB_PAGE
 		size = arch_vmap_pte_range_unmap_size(addr, pte);
@@ -370,6 +377,8 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			ptent = ptep_get_and_clear(&init_mm, addr, pte);
 		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
 	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
+
+	arch_leave_lazy_mmu_mode();
 	*mask |= PGTBL_PTE_MODIFIED;
 }
 
@@ -515,6 +524,9 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 	pte = pte_alloc_kernel_track(pmd, addr, mask);
 	if (!pte)
 		return -ENOMEM;
+
+	arch_enter_lazy_mmu_mode();
+
 	do {
 		struct page *page = pages[*nr];
 
@@ -528,6 +540,8 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
 		(*nr)++;
 	} while (pte++, addr += PAGE_SIZE, addr != end);
+
+	arch_leave_lazy_mmu_mode();
 	*mask |= PGTBL_PTE_MODIFIED;
 	return 0;
 }
-- 
2.43.0


