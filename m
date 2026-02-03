Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB6CE87826
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7f7LOJpzTq6WGvSLw+vMfEVieSqAeOF3O2MG1vOgfHg=; b=brKuh9KFnOa1ZOoGX+6JOsUZdh
	qdGkJclzjDKenx88vmdO1y1JvTJIn5KXAUbNhAmA6CtqJJmItuImdUcBfVXzylts5TMrvJbzIXtRa
	AJl+VfEfR3lU78cDp5s7bGcN7/KW0Vv0vNiFrX6W/pRlPLKI0L25ufpIumRu4KC3KSc2X1pjEvRy+
	pLhwSUEAmkr5KMABg6RNCGCcfGLOsrRz19+vsd49d+4AIidYpf8DAdgv/+MlKdFzqYW20p5HCb1KN
	Qq+sL1Qz/bR3DKraih9GEhlhIuXP7jykOqsr1zKTD6/7KQvvAwwgZGJJdXpFkt5KVd6vjPzykAdo+
	qc1DzF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnG4h-00000006dcz-0bf0;
	Tue, 03 Feb 2026 13:04:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnG4e-00000006dbf-0JKR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 13:04:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D7C0497;
	Tue,  3 Feb 2026 05:04:00 -0800 (PST)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 68C763F632;
	Tue,  3 Feb 2026 05:04:05 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Christoph Lameter <cl@gentwo.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH V2 1/2] arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
Date: Tue,  3 Feb 2026 13:03:47 +0000
Message-Id: <20260203130348.612150-2-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260203130348.612150-1-anshuman.khandual@arm.com>
References: <20260203130348.612150-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_050408_186696_6AD12471 
X-CRM114-Status: GOOD (  17.64  )
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

During a memory hot remove operartion both linear and vmemmap mappings for
the memory range being removed, get unmapped via unmap_hotplug_range() but
mapped pages get freed only for vmemmap mapping. This is just a sequential
operation where each table entry gets cleared, followed by a leaf specific
TLB flush, and then followed by memory free operation when applicable.

This approach was simple and uniform both for vmemmap and linear mappings.
But linear mapping might contain CONT marked block memory where it becomes
necessary to first clear out all entire in the range before a TLB flush.
This is as per the architecture requirement. Hence batch all TLB flushes
during the table tear down walk and finally do it in unmap_hotplug_range().

Prior to this fix, it was hypothetically possible for a speculative access
to a higher address in the contiguous block to fill the TLB with shattered
entries for the entire contiguous range after a lower address had already
been cleared and invalidated. Due to the table entries being shattered, the
subsequent TLB invalidation for the higher address would not then clear the
TLB entries for the lower address, meaning stale TLB entries could persist.

Besides it also helps in improving the performance via TLBI range operation
along with reduced synchronization instructions. The time spent executing
unmap_hotplug_range() improved 97% measured over a 2GB memory hot removal
in KVM guest.

This scheme is not applicable during vmemmap mapping tear down where memory
needs to be freed and hence a TLB flush is required after clearing out page
table entry.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Closes: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
Fixes: bbd6ec605c0f ("arm64/mm: Enable memory hot remove")
Cc: stable@vger.kernel.org
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/mmu.c | 81 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 67 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8e1d80a7033e..8ec8a287aaa1 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1458,10 +1458,32 @@ static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
 
 		WARN_ON(!pte_present(pte));
 		__pte_clear(&init_mm, addr, ptep);
-		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
-		if (free_mapped)
+		if (free_mapped) {
+			/*
+			 * If page is part of an existing contiguous
+			 * memory block, individual TLB invalidation
+			 * here would not be appropriate. Instead it
+			 * will require clearing all entries for the
+			 * memory block and subsequently a TLB flush
+			 * for the entire range.
+			 */
+			WARN_ON(pte_cont(pte));
+
+			/*
+			 * TLB flush is essential for freeing memory.
+			 */
+			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 			free_hotplug_page_range(pte_page(pte),
 						PAGE_SIZE, altmap);
+		}
+
+		/*
+		 * TLB flush is batched in unmap_hotplug_range()
+		 * for the entire range, when memory need not be
+		 * freed. Besides linear mapping might have CONT
+		 * blocks where TLB flush needs to be done after
+		 * clearing all relevant entries.
+		 */
 	} while (addr += PAGE_SIZE, addr < end);
 }
 
@@ -1482,15 +1504,32 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 		WARN_ON(!pmd_present(pmd));
 		if (pmd_sect(pmd)) {
 			pmd_clear(pmdp);
+			if (free_mapped) {
+				/*
+				 * If page is part of an existing contiguous
+				 * memory block, individual TLB invalidation
+				 * here would not be appropriate. Instead it
+				 * will require clearing all entries for the
+				 * memory block and subsequently a TLB flush
+				 * for the entire range.
+				 */
+				WARN_ON(pmd_cont(pmd));
+
+				/*
+				 * TLB flush is essential for freeing memory.
+				 */
+				flush_tlb_kernel_range(addr, addr + PMD_SIZE);
+				free_hotplug_page_range(pmd_page(pmd),
+							PMD_SIZE, altmap);
+			}
 
 			/*
-			 * One TLBI should be sufficient here as the PMD_SIZE
-			 * range is mapped with a single block entry.
+			 * TLB flush is batched in unmap_hotplug_range()
+			 * for the entire range, when memory need not be
+			 * freed. Besides linear mapping might have CONT
+			 * blocks where TLB flush needs to be done after
+			 * clearing all relevant entries.
 			 */
-			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
-			if (free_mapped)
-				free_hotplug_page_range(pmd_page(pmd),
-							PMD_SIZE, altmap);
 			continue;
 		}
 		WARN_ON(!pmd_table(pmd));
@@ -1515,15 +1554,20 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 		WARN_ON(!pud_present(pud));
 		if (pud_sect(pud)) {
 			pud_clear(pudp);
+			if (free_mapped) {
+				/*
+				 * TLB flush is essential for freeing memory.
+				 */
+				flush_tlb_kernel_range(addr, addr + PUD_SIZE);
+				free_hotplug_page_range(pud_page(pud),
+							PUD_SIZE, altmap);
+			}
 
 			/*
-			 * One TLBI should be sufficient here as the PUD_SIZE
-			 * range is mapped with a single block entry.
+			 * TLB flush is batched in unmap_hotplug_range()
+			 * for the entire range, when memory need not be
+			 * freed.
 			 */
-			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
-			if (free_mapped)
-				free_hotplug_page_range(pud_page(pud),
-							PUD_SIZE, altmap);
 			continue;
 		}
 		WARN_ON(!pud_table(pud));
@@ -1553,6 +1597,7 @@ static void unmap_hotplug_p4d_range(pgd_t *pgdp, unsigned long addr,
 static void unmap_hotplug_range(unsigned long addr, unsigned long end,
 				bool free_mapped, struct vmem_altmap *altmap)
 {
+	unsigned long start = addr;
 	unsigned long next;
 	pgd_t *pgdp, pgd;
 
@@ -1574,6 +1619,14 @@ static void unmap_hotplug_range(unsigned long addr, unsigned long end,
 		WARN_ON(!pgd_present(pgd));
 		unmap_hotplug_p4d_range(pgdp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
+
+	/*
+	 * Batched TLB flush only for linear mapping which
+	 * might contain CONT blocks, and does not require
+	 * freeing up memory as well.
+	 */
+	if (!free_mapped)
+		flush_tlb_kernel_range(start, end);
 }
 
 static void free_empty_pte_table(pmd_t *pmdp, unsigned long addr,
-- 
2.30.2


