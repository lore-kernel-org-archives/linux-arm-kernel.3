Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA88C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 04:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f0pjyZ+7dsEqnPuIq6x+ju84vkdBAPd5sXSmnKpfzwM=; b=VJp6R1dk3JoU2W2+9KeJND3YfT
	xWTCJBrAjd7AXNdPYHwhMfbDlZUkbKc9InEQNWZzKRvBAKpcfgx+o6mp5Bk/q1BKntCKptfLXLkjo
	INjxxjYTDAoxHnAutwVVnS+XJNR0jirpX1d+wzTBTW13KuBcidxjs3Pwxx3eo9q4KM61CvkfecY9D
	Kmii1nWlcsuR6r9oJ2MV+BVtR4exOVSPLe2X8Gh6grvQ3W+HrYPBA7l9QQ2bSd391XBWbkFOP9wNI
	fmql6JnH/DOffzLrBp2f/pUr/Lfd56Yx0cXPdP4MaHcNi/eIFoxotrfgNCEzmDD6q822h5P+kjaqd
	EDVj5uJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjUnV-0000000AsjL-0cbk;
	Tue, 14 Jul 2026 04:31:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjUnR-0000000Asii-1Jhc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 04:31:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC9111570;
	Mon, 13 Jul 2026 21:30:58 -0700 (PDT)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E48EE3F7B4;
	Mon, 13 Jul 2026 21:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784003463; bh=wwOd20lXbLyFUgLp6XlXF5kS4CMEjRqPUxQPJNBNrbo=;
	h=From:To:Cc:Subject:Date:From;
	b=C10YY+lQANwP9BvipjJwfSbpL3ww8YkQuFwwkdNfPa+SBVVLk/JuII3UHRuDMtZFL
	 4xf+PJymhCPMd0a47lNZQqBAvPgvJw/iGjeSZy4etup3mWjQQDhmfqWA+z5tyIPvbc
	 zeL4XHyKuV7xz8+G2R62OOhhRkdXpBxcfTYK3ahU=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Rename PGD_SIZE as PGD_TABLE_SIZE
Date: Tue, 14 Jul 2026 10:00:50 +0530
Message-ID: <20260714043050.2984188-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_213105_516473_4E94B5CA 
X-CRM114-Status: GOOD (  14.81  )
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

PXD_SIZE represents the virtual address range size covered by a single page
table entry on a given page table level. On arm64 PGD entry address span is
represented with PGDIR_XXX macros instead while PGD_SIZE has been referring
to size of the PGD table itself. So PGD_SIZE has been some what confusing.

Rename PGD_SIZE as PGD_TABLE_SIZE making it explicit that it represents PGD
table size rather than virtual address range covered by a single PGD entry.
While here, also move PGD_TABLE_SIZE inside pgtable-hwdef.h header.

No functional change.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand (Arm) <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgalloc.h       | 2 --
 arch/arm64/include/asm/pgtable-hwdef.h | 1 +
 arch/arm64/mm/mmu.c                    | 2 +-
 arch/arm64/mm/pgd.c                    | 6 +++---
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 1b4509d3382c..d81df17663ee 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -17,8 +17,6 @@
 #define __HAVE_ARCH_PUD_FREE
 #include <asm-generic/pgalloc.h>
 
-#define PGD_SIZE	(PTRS_PER_PGD * sizeof(pgd_t))
-
 #if CONFIG_PGTABLE_LEVELS > 2
 
 static inline void __pud_populate(pud_t *pudp, phys_addr_t pmdp, pudval_t prot)
diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index 72f31800c703..241fc749455d 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -83,6 +83,7 @@
 #define PGDIR_SIZE		(_AC(1, UL) << PGDIR_SHIFT)
 #define PGDIR_MASK		(~(PGDIR_SIZE-1))
 #define PTRS_PER_PGD		(1 << (VA_BITS - PGDIR_SHIFT))
+#define PGD_TABLE_SIZE		(PTRS_PER_PGD * sizeof(pgd_t))
 
 /*
  * Contiguous page definitions.
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a25d8beacc83..bd9330fef173 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1356,7 +1356,7 @@ static int __init map_entry_trampoline(void)
 	pgprot_val(prot) &= ~PTE_NG;
 
 	/* Map only the text into the trampoline page table */
-	memset(tramp_pg_dir, 0, PGD_SIZE);
+	memset(tramp_pg_dir, 0, PGD_TABLE_SIZE);
 	early_create_pgd_mapping(tramp_pg_dir, pa_start, TRAMP_VALIAS,
 				 entry_tramp_text_size(), prot,
 				 pgd_pgtable_alloc_init_mm, NO_BLOCK_MAPPINGS);
diff --git a/arch/arm64/mm/pgd.c b/arch/arm64/mm/pgd.c
index bf5110b91e2f..4f7c6416158b 100644
--- a/arch/arm64/mm/pgd.c
+++ b/arch/arm64/mm/pgd.c
@@ -19,7 +19,7 @@ static struct kmem_cache *pgd_cache __ro_after_init;
 
 static bool pgdir_is_page_size(void)
 {
-	if (PGD_SIZE == PAGE_SIZE)
+	if (PGD_TABLE_SIZE == PAGE_SIZE)
 		return true;
 	if (CONFIG_PGTABLE_LEVELS == 4)
 		return !pgtable_l4_enabled();
@@ -56,12 +56,12 @@ void __init pgtable_cache_init(void)
 	 * With 52-bit physical addresses, the architecture requires the
 	 * top-level table to be aligned to at least 64 bytes.
 	 */
-	BUILD_BUG_ON(!IS_ALIGNED(PGD_SIZE, 64));
+	BUILD_BUG_ON(!IS_ALIGNED(PGD_TABLE_SIZE, 64));
 #endif
 
 	/*
 	 * Naturally aligned pgds required by the architecture.
 	 */
-	pgd_cache = kmem_cache_create("pgd_cache", PGD_SIZE, PGD_SIZE,
+	pgd_cache = kmem_cache_create("pgd_cache", PGD_TABLE_SIZE, PGD_TABLE_SIZE,
 				      SLAB_PANIC, NULL);
 }
-- 
2.43.0


