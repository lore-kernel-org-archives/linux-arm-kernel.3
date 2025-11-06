Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAFDCCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akl1gNWl8L32THftGNIxQmgf5DFyXSt+ixP1rwMXmD0=; b=V2pgYh1jiT6L49ok53ZVQZ2JnO
	NJOqkTJ3XdeUv4TWn4GmyBVJQDwAVTLrczjYY0tqk6vdRlAselBBowZW6QprWytw43NfFuq+bN9+y
	o+2AybWoYzE7TmBCqmnOHCF9eC67J9VYHKE2f4CZ78XHCSNY2r41SyosD7AOtBFAxPAJOyOEy39bn
	fMIhDvG34xiQ5bnBlq44uL1J++WoitbPcQpoKUjarJL4iONbAVr3MZm0cpNQ9HMta1LQ19l9/qIKK
	Va55YymbB1gwy1Wsu+BrA4QsNjoaV9dCntLey+LH0QJO+ql+QP30ZALFVoZNlfvC+VLi2rbIobH63
	kefEh/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2Yk-0000000FsnJ-0arK;
	Thu, 06 Nov 2025 16:10:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2Yh-0000000FskD-1FVM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:10:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 845DE168F;
	Thu,  6 Nov 2025 08:09:49 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDCED3F66E;
	Thu,  6 Nov 2025 08:09:55 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	yang@os.amperecomputing.com,
	david@redhat.com,
	ardb@kernel.org,
	dev.jain@arm.com,
	scott@os.amperecomputing.com,
	cl@gentwo.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <groeck@google.com>
Subject: [PATCH v2 1/3] arm64: mm: Don't sleep in split_kernel_leaf_mapping() when in atomic context
Date: Thu,  6 Nov 2025 16:09:41 +0000
Message-ID: <20251106160945.3182799-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106160945.3182799-1-ryan.roberts@arm.com>
References: <20251106160945.3182799-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_080959_414861_B2198425 
X-CRM114-Status: GOOD (  23.67  )
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

It has been reported that split_kernel_leaf_mapping() is trying to sleep
in non-sleepable context. It does this when acquiring the
pgtable_split_lock mutex, when either CONFIG_DEBUG_PAGEALLOC or
CONFIG_KFENCE are enabled, which change linear map permissions within
softirq context during memory allocation and/or freeing. All other paths
into this function are called from sleepable context and so are safe.

But it turns out that the memory for which these 2 features may attempt
to modify the permissions is always mapped by pte, so there is no need
to attempt to split the mapping. So let's exit early in these cases and
avoid attempting to take the mutex.

There is one wrinkle to this approach; late-initialized kfence allocates
it's pool from the buddy which may be block mapped. So we must hook that
allocation and convert it to pte-mappings up front. Previously this was
done as a side-effect of kfence protecting all the individual pages in
its pool at init-time, but this no longer works due to the added early
exit path in split_kernel_leaf_mapping().

So instead, do this via the existing arch_kfence_init_pool() arch hook,
and reuse the existing linear_map_split_to_ptes() infrastructure.

Closes: https://lore.kernel.org/all/f24b9032-0ec9-47b1-8b95-c0eeac7a31c5@roeck-us.net/
Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
Tested-by: Guenter Roeck <groeck@google.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/kfence.h |  3 +-
 arch/arm64/mm/mmu.c             | 92 +++++++++++++++++++++++----------
 2 files changed, 67 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/include/asm/kfence.h b/arch/arm64/include/asm/kfence.h
index a81937fae9f6..21dbc9dda747 100644
--- a/arch/arm64/include/asm/kfence.h
+++ b/arch/arm64/include/asm/kfence.h
@@ -10,8 +10,6 @@
 
 #include <asm/set_memory.h>
 
-static inline bool arch_kfence_init_pool(void) { return true; }
-
 static inline bool kfence_protect_page(unsigned long addr, bool protect)
 {
 	set_memory_valid(addr, 1, !protect);
@@ -25,6 +23,7 @@ static inline bool arm64_kfence_can_set_direct_map(void)
 {
 	return !kfence_early_init;
 }
+bool arch_kfence_init_pool(void);
 #else /* CONFIG_KFENCE */
 static inline bool arm64_kfence_can_set_direct_map(void) { return false; }
 #endif /* CONFIG_KFENCE */
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b8d37eb037fc..a364ac2c9c61 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -708,6 +708,16 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	return ret;
 }
 
+static inline bool force_pte_mapping(void)
+{
+	bool bbml2 = system_capabilities_finalized() ?
+		system_supports_bbml2_noabort() : cpu_supports_bbml2_noabort();
+
+	return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
+			   is_realm_world())) ||
+		debug_pagealloc_enabled();
+}
+
 static DEFINE_MUTEX(pgtable_split_lock);
 
 int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
@@ -723,6 +733,16 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
 	if (!system_supports_bbml2_noabort())
 		return 0;
 
+	/*
+	 * If the region is within a pte-mapped area, there is no need to try to
+	 * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
+	 * change permissions from atomic context so for those cases (which are
+	 * always pte-mapped), we must not go any further because taking the
+	 * mutex below may sleep.
+	 */
+	if (force_pte_mapping() || is_kfence_address((void *)start))
+		return 0;
+
 	/*
 	 * Ensure start and end are at least page-aligned since this is the
 	 * finest granularity we can split to.
@@ -758,30 +778,30 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
 	return ret;
 }
 
-static int __init split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
-					  unsigned long next,
-					  struct mm_walk *walk)
+static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
+				   unsigned long next, struct mm_walk *walk)
 {
+	gfp_t gfp = *(gfp_t *)walk->private;
 	pud_t pud = pudp_get(pudp);
 	int ret = 0;
 
 	if (pud_leaf(pud))
-		ret = split_pud(pudp, pud, GFP_ATOMIC, false);
+		ret = split_pud(pudp, pud, gfp, false);
 
 	return ret;
 }
 
-static int __init split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
-					  unsigned long next,
-					  struct mm_walk *walk)
+static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
+				   unsigned long next, struct mm_walk *walk)
 {
+	gfp_t gfp = *(gfp_t *)walk->private;
 	pmd_t pmd = pmdp_get(pmdp);
 	int ret = 0;
 
 	if (pmd_leaf(pmd)) {
 		if (pmd_cont(pmd))
 			split_contpmd(pmdp);
-		ret = split_pmd(pmdp, pmd, GFP_ATOMIC, false);
+		ret = split_pmd(pmdp, pmd, gfp, false);
 
 		/*
 		 * We have split the pmd directly to ptes so there is no need to
@@ -793,9 +813,8 @@ static int __init split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
 	return ret;
 }
 
-static int __init split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
-					  unsigned long next,
-					  struct mm_walk *walk)
+static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
+				   unsigned long next, struct mm_walk *walk)
 {
 	pte_t pte = __ptep_get(ptep);
 
@@ -805,12 +824,18 @@ static int __init split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
 	return 0;
 }
 
-static const struct mm_walk_ops split_to_ptes_ops __initconst = {
+static const struct mm_walk_ops split_to_ptes_ops = {
 	.pud_entry	= split_to_ptes_pud_entry,
 	.pmd_entry	= split_to_ptes_pmd_entry,
 	.pte_entry	= split_to_ptes_pte_entry,
 };
 
+static int range_split_to_ptes(unsigned long start, unsigned long end, gfp_t gfp)
+{
+	return walk_kernel_page_table_range_lockless(start, end,
+					&split_to_ptes_ops, NULL, &gfp);
+}
+
 static bool linear_map_requires_bbml2 __initdata;
 
 u32 idmap_kpti_bbml2_flag;
@@ -847,11 +872,9 @@ static int __init linear_map_split_to_ptes(void *__unused)
 		 * PTE. The kernel alias remains static throughout runtime so
 		 * can continue to be safely mapped with large mappings.
 		 */
-		ret = walk_kernel_page_table_range_lockless(lstart, kstart,
-						&split_to_ptes_ops, NULL, NULL);
+		ret = range_split_to_ptes(lstart, kstart, GFP_ATOMIC);
 		if (!ret)
-			ret = walk_kernel_page_table_range_lockless(kend, lend,
-						&split_to_ptes_ops, NULL, NULL);
+			ret = range_split_to_ptes(kend, lend, GFP_ATOMIC);
 		if (ret)
 			panic("Failed to split linear map\n");
 		flush_tlb_kernel_range(lstart, lend);
@@ -1002,6 +1025,33 @@ static void __init arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp)
 	memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
 	__kfence_pool = phys_to_virt(kfence_pool);
 }
+
+bool arch_kfence_init_pool(void)
+{
+	unsigned long start = (unsigned long)__kfence_pool;
+	unsigned long end = start + KFENCE_POOL_SIZE;
+	int ret;
+
+	/* Exit early if we know the linear map is already pte-mapped. */
+	if (!system_supports_bbml2_noabort() || force_pte_mapping())
+		return true;
+
+	/* Kfence pool is already pte-mapped for the early init case. */
+	if (kfence_early_init)
+		return true;
+
+	mutex_lock(&pgtable_split_lock);
+	ret = range_split_to_ptes(start, end, GFP_PGTABLE_KERNEL);
+	mutex_unlock(&pgtable_split_lock);
+
+	/*
+	 * Since the system supports bbml2_noabort, tlb invalidation is not
+	 * required here; the pgtable mappings have been split to pte but larger
+	 * entries may safely linger in the TLB.
+	 */
+
+	return !ret;
+}
 #else /* CONFIG_KFENCE */
 
 static inline phys_addr_t arm64_kfence_alloc_pool(void) { return 0; }
@@ -1009,16 +1059,6 @@ static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) {
 
 #endif /* CONFIG_KFENCE */
 
-static inline bool force_pte_mapping(void)
-{
-	bool bbml2 = system_capabilities_finalized() ?
-		system_supports_bbml2_noabort() : cpu_supports_bbml2_noabort();
-
-	return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
-			   is_realm_world())) ||
-		debug_pagealloc_enabled();
-}
-
 static void __init map_mem(pgd_t *pgdp)
 {
 	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
-- 
2.43.0


