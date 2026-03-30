Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6199A1061B13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6e8m8XjKUnIM35PavlP25HMrd/OGd9CDQgYYAq1Z0c=; b=FSdwjaMCjEN4kJB4OiMPFEsl2C
	aQFWDSLthVavqvJ779bQz7/vKql4letxtcAkiMmFVtkrH51KyDxjj9Tb7FgC3qaqKjxqSxQ31OZrr
	xhT2gSQvN4aPA24mhuNZ9lfyJODp3AS0HTscxOaoLYrroV9LqXwD6hikyhXAPHlI9Oygw67U38FHD
	ayZG8ztSpc+3+EtZH5D/czisIvV83+HfB9L7M25DsbkdVFGzAgDbJfTCRL8L3NvBXn3AvzzNTTrQ6
	TtwFDsQaaBsu/yPASrNkewAHrQ4ES/XPHuRZ6Y00Zzzw75be87bqF6q43fMNpLcgcFLcV8WUzNnX1
	OJPu7e3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7FJ2-0000000BdFO-3uLJ;
	Mon, 30 Mar 2026 16:17:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7FIp-0000000BdB0-40X6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 16:17:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C7CC2403;
	Mon, 30 Mar 2026 09:17:16 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16E673F7D8;
	Mon, 30 Mar 2026 09:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774887442; bh=+3ztKn8+vWKCZnOUAI7aUx3xPekEk67SRoVhvi8keJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=enmQqJNvDTlUKQZU6bTl+9V9fEoxuFHh4uX/kt/i5ys3TRGLf0xp7g/YDZcgtWJ3F
	 lkyqWZOKTXe91pot2KSqSUUYfgdxnxZw80re9a2655bgLVItfoSKCu7OcIgAdi8FGD
	 XhOiumC2o9B8AF5t5GNICg9JrdGqaL+BJgh6k2mU=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: mm: Remove pmd_sect() and pud_sect()
Date: Mon, 30 Mar 2026 17:17:04 +0100
Message-ID: <20260330161705.3349825-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330161705.3349825-1-ryan.roberts@arm.com>
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_091724_080857_F35B78D9 
X-CRM114-Status: GOOD (  14.16  )
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

The semantics of pXd_leaf() are very similar to pXd_sect(). The only
difference is that pXd_sect() only considers it a section if PTE_VALID
is set, whereas pXd_leaf() permits both "valid" and "present-invalid"
types.

Using pXd_sect() has caused issues now that large leaf entries can be
present-invalid since commit a166563e7ec37 ("arm64: mm: support large
block mapping when rodata=full"), so let's just remove the API and
standardize on pXd_leaf().

There are a few callsites of the form pXd_leaf(READ_ONCE(*pXdp)). This
was previously fine for the pXd_sect() macro because it only evaluated
its argument once. But pXd_leaf() evaluates its argument multiple times.
So let's avoid unintended side effects by reimplementing pXd_leaf() as
an inline function.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 19 ++++++++++++-------
 arch/arm64/mm/mmu.c              | 18 +++++++++---------
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index dd062179b9b66..5bc42b85acfc0 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -784,9 +784,13 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 
 #define pmd_table(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
 				 PMD_TYPE_TABLE)
-#define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
-				 PMD_TYPE_SECT)
-#define pmd_leaf(pmd)		(pmd_present(pmd) && !pmd_table(pmd))
+
+#define pmd_leaf pmd_leaf
+static inline bool pmd_leaf(pmd_t pmd)
+{
+	return pmd_present(pmd) && !pmd_table(pmd);
+}
+
 #define pmd_bad(pmd)		(!pmd_table(pmd))
 
 #define pmd_leaf_size(pmd)	(pmd_cont(pmd) ? CONT_PMD_SIZE : PMD_SIZE)
@@ -804,11 +808,8 @@ static inline int pmd_trans_huge(pmd_t pmd)
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 #if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS < 3
-static inline bool pud_sect(pud_t pud) { return false; }
 static inline bool pud_table(pud_t pud) { return true; }
 #else
-#define pud_sect(pud)		((pud_val(pud) & PUD_TYPE_MASK) == \
-				 PUD_TYPE_SECT)
 #define pud_table(pud)		((pud_val(pud) & PUD_TYPE_MASK) == \
 				 PUD_TYPE_TABLE)
 #endif
@@ -878,7 +879,11 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 				 PUD_TYPE_TABLE)
 #define pud_present(pud)	pte_present(pud_pte(pud))
 #ifndef __PAGETABLE_PMD_FOLDED
-#define pud_leaf(pud)		(pud_present(pud) && !pud_table(pud))
+#define pud_leaf pud_leaf
+static inline bool pud_leaf(pud_t pud)
+{
+	return pud_present(pud) && !pud_table(pud);
+}
 #else
 #define pud_leaf(pud)		false
 #endif
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 1575680675d8d..dcee56bb622ad 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -204,7 +204,7 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 	pmd_t pmd = READ_ONCE(*pmdp);
 	pte_t *ptep;
 
-	BUG_ON(pmd_sect(pmd));
+	BUG_ON(pmd_leaf(pmd));
 	if (pmd_none(pmd)) {
 		pmdval_t pmdval = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
 		phys_addr_t pte_phys;
@@ -303,7 +303,7 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 	/*
 	 * Check for initial section mappings in the pgd/pud.
 	 */
-	BUG_ON(pud_sect(pud));
+	BUG_ON(pud_leaf(pud));
 	if (pud_none(pud)) {
 		pudval_t pudval = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
 		phys_addr_t pmd_phys;
@@ -1503,7 +1503,7 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 			continue;
 
 		WARN_ON(!pmd_present(pmd));
-		if (pmd_sect(pmd)) {
+		if (pmd_leaf(pmd)) {
 			pmd_clear(pmdp);
 
 			/*
@@ -1536,7 +1536,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 			continue;
 
 		WARN_ON(!pud_present(pud));
-		if (pud_sect(pud)) {
+		if (pud_leaf(pud)) {
 			pud_clear(pudp);
 
 			/*
@@ -1650,7 +1650,7 @@ static void free_empty_pmd_table(pud_t *pudp, unsigned long addr,
 		if (pmd_none(pmd))
 			continue;
 
-		WARN_ON(!pmd_present(pmd) || !pmd_table(pmd) || pmd_sect(pmd));
+		WARN_ON(!pmd_present(pmd) || !pmd_table(pmd));
 		free_empty_pte_table(pmdp, addr, next, floor, ceiling);
 	} while (addr = next, addr < end);
 
@@ -1690,7 +1690,7 @@ static void free_empty_pud_table(p4d_t *p4dp, unsigned long addr,
 		if (pud_none(pud))
 			continue;
 
-		WARN_ON(!pud_present(pud) || !pud_table(pud) || pud_sect(pud));
+		WARN_ON(!pud_present(pud) || !pud_table(pud));
 		free_empty_pmd_table(pudp, addr, next, floor, ceiling);
 	} while (addr = next, addr < end);
 
@@ -1786,7 +1786,7 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 {
 	vmemmap_verify((pte_t *)pmdp, node, addr, next);
 
-	return pmd_sect(READ_ONCE(*pmdp));
+	return pmd_leaf(READ_ONCE(*pmdp));
 }
 
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
@@ -1850,7 +1850,7 @@ void p4d_clear_huge(p4d_t *p4dp)
 
 int pud_clear_huge(pud_t *pudp)
 {
-	if (!pud_sect(READ_ONCE(*pudp)))
+	if (!pud_leaf(READ_ONCE(*pudp)))
 		return 0;
 	pud_clear(pudp);
 	return 1;
@@ -1858,7 +1858,7 @@ int pud_clear_huge(pud_t *pudp)
 
 int pmd_clear_huge(pmd_t *pmdp)
 {
-	if (!pmd_sect(READ_ONCE(*pmdp)))
+	if (!pmd_leaf(READ_ONCE(*pmdp)))
 		return 0;
 	pmd_clear(pmdp);
 	return 1;
-- 
2.43.0


