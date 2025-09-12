Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F125CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 07:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QUkpWDNNuTUShRvlsXMt8bA3b7ppAMjYzDtVpFQWtGM=; b=1Y1fZapsnnCNf+kTTnl8Y1hGV9
	nlJ9rTzab7un6PRXDg0ZAGZyZDGCayOIwT6rEB92gp0hLOJ6afl0aWjPV4qQ/v8Pgl9OUNuYLi7Bm
	h4iM4cByDtkWFXomPV7MT5OPqKYRMKXxeeZ/e2mFQkIKhmw2GD1xM9lOVk9YkDCvh9qxgNGhhP3uJ
	GTtuG9dN1IjyhNSFroGu3M7oS52wZszSBE2qD7i9WfwM0bB8gjHbs3+1DZP6Ww9/jmHrFCxjQHfAh
	919gY+qFCxvwibBLEQcVzoJdxqwPX3vSgiF3PX4MXMOkjTe7yNsvq7fhv0t2z4aF6vE/5ZOHkevCH
	Z6o9P/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyNM-00000007hC2-18CN;
	Fri, 12 Sep 2025 07:39:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyNJ-00000007hBW-0IjE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 07:39:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A80CB16A3;
	Fri, 12 Sep 2025 00:39:07 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D5433F63F;
	Fri, 12 Sep 2025 00:39:14 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2] arm64: mm: Move KPTI helpers to mmu.c
Date: Fri, 12 Sep 2025 08:39:08 +0100
Message-ID: <20250912073908.404924-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_003917_201358_487D36B2 
X-CRM114-Status: GOOD (  23.32  )
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

create_kpti_ng_temp_pgd() is currently defined (as an alias) in
mmu.c without matching declaration in a header; instead cpufeature.c
makes its own declaration. This is clearly not pretty, and as commit
ceca927c86e6 ("arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc
function signature") showed, it also makes it very easy for the
prototypes to go out of sync.

All this would be much simpler if kpti_install_ng_mappings() and
associated functions lived in mmu.c, where they logically belong.
This is what this patch does:
- Move kpti_install_ng_mappings() and associated functions from
  cpufeature.c to mmu.c, add a declaration to <asm/mmu.h>
- Remove create_kpti_ng_temp_pgd() and just call
  __create_pgd_mapping_locked() directly instead
- Mark all these functions __init
- Move __initdata after kpti_ng_temp_alloc (as suggested by
  checkpatch)

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
v1..v2:
* Removed create_kpti_ng_temp_pgd() instead of making it a wrapper
  [Ryan's suggestion]
* Added Reviewed-by's.
---
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/mmu.h   |  6 +++
 arch/arm64/kernel/cpufeature.c | 97 ----------------------------------
 arch/arm64/mm/mmu.c            | 96 +++++++++++++++++++++++++++++----
 3 files changed, 93 insertions(+), 106 deletions(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 49f1a810df16..624edd6c4964 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -104,5 +104,11 @@ static inline bool kaslr_requires_kpti(void)
 	return true;
 }
 
+#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
+void kpti_install_ng_mappings(void);
+#else
+static inline void kpti_install_ng_mappings(void) {}
+#endif
+
 #endif	/* !__ASSEMBLY__ */
 #endif
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index ef269a5a37e1..b99eaad48c14 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1940,103 +1940,6 @@ static bool has_pmuv3(const struct arm64_cpu_capabilities *entry, int scope)
 }
 #endif
 
-#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
-#define KPTI_NG_TEMP_VA		(-(1UL << PMD_SHIFT))
-
-extern
-void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
-			     phys_addr_t size, pgprot_t prot,
-			     phys_addr_t (*pgtable_alloc)(enum pgtable_type), int flags);
-
-static phys_addr_t __initdata kpti_ng_temp_alloc;
-
-static phys_addr_t __init kpti_ng_pgd_alloc(enum pgtable_type type)
-{
-	kpti_ng_temp_alloc -= PAGE_SIZE;
-	return kpti_ng_temp_alloc;
-}
-
-static int __init __kpti_install_ng_mappings(void *__unused)
-{
-	typedef void (kpti_remap_fn)(int, int, phys_addr_t, unsigned long);
-	extern kpti_remap_fn idmap_kpti_install_ng_mappings;
-	kpti_remap_fn *remap_fn;
-
-	int cpu = smp_processor_id();
-	int levels = CONFIG_PGTABLE_LEVELS;
-	int order = order_base_2(levels);
-	u64 kpti_ng_temp_pgd_pa = 0;
-	pgd_t *kpti_ng_temp_pgd;
-	u64 alloc = 0;
-
-	if (levels == 5 && !pgtable_l5_enabled())
-		levels = 4;
-	else if (levels == 4 && !pgtable_l4_enabled())
-		levels = 3;
-
-	remap_fn = (void *)__pa_symbol(idmap_kpti_install_ng_mappings);
-
-	if (!cpu) {
-		alloc = __get_free_pages(GFP_ATOMIC | __GFP_ZERO, order);
-		kpti_ng_temp_pgd = (pgd_t *)(alloc + (levels - 1) * PAGE_SIZE);
-		kpti_ng_temp_alloc = kpti_ng_temp_pgd_pa = __pa(kpti_ng_temp_pgd);
-
-		//
-		// Create a minimal page table hierarchy that permits us to map
-		// the swapper page tables temporarily as we traverse them.
-		//
-		// The physical pages are laid out as follows:
-		//
-		// +--------+-/-------+-/------ +-/------ +-\\\--------+
-		// :  PTE[] : | PMD[] : | PUD[] : | P4D[] : ||| PGD[]  :
-		// +--------+-\-------+-\------ +-\------ +-///--------+
-		//      ^
-		// The first page is mapped into this hierarchy at a PMD_SHIFT
-		// aligned virtual address, so that we can manipulate the PTE
-		// level entries while the mapping is active. The first entry
-		// covers the PTE[] page itself, the remaining entries are free
-		// to be used as a ad-hoc fixmap.
-		//
-		create_kpti_ng_temp_pgd(kpti_ng_temp_pgd, __pa(alloc),
-					KPTI_NG_TEMP_VA, PAGE_SIZE, PAGE_KERNEL,
-					kpti_ng_pgd_alloc, 0);
-	}
-
-	cpu_install_idmap();
-	remap_fn(cpu, num_online_cpus(), kpti_ng_temp_pgd_pa, KPTI_NG_TEMP_VA);
-	cpu_uninstall_idmap();
-
-	if (!cpu) {
-		free_pages(alloc, order);
-		arm64_use_ng_mappings = true;
-	}
-
-	return 0;
-}
-
-static void __init kpti_install_ng_mappings(void)
-{
-	/* Check whether KPTI is going to be used */
-	if (!arm64_kernel_unmapped_at_el0())
-		return;
-
-	/*
-	 * We don't need to rewrite the page-tables if either we've done
-	 * it already or we have KASLR enabled and therefore have not
-	 * created any global mappings at all.
-	 */
-	if (arm64_use_ng_mappings)
-		return;
-
-	stop_machine(__kpti_install_ng_mappings, NULL, cpu_online_mask);
-}
-
-#else
-static inline void kpti_install_ng_mappings(void)
-{
-}
-#endif	/* CONFIG_UNMAP_KERNEL_AT_EL0 */
-
 static void cpu_enable_kpti(struct arm64_cpu_capabilities const *cap)
 {
 	if (__this_cpu_read(this_cpu_vector) == vectors) {
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 183801520740..6a8e831b2b63 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -27,6 +27,7 @@
 #include <linux/kfence.h>
 #include <linux/pkeys.h>
 #include <linux/mm_inline.h>
+#include <linux/stop_machine.h>
 
 #include <asm/barrier.h>
 #include <asm/cputype.h>
@@ -466,14 +467,6 @@ static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
 	mutex_unlock(&fixmap_lock);
 }
 
-#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
-extern __alias(__create_pgd_mapping_locked)
-void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
-			     phys_addr_t size, pgprot_t prot,
-			     phys_addr_t (*pgtable_alloc)(enum pgtable_type),
-			     int flags);
-#endif
-
 static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm,
 				       enum pgtable_type pgtable_type)
 {
@@ -735,7 +728,92 @@ static void __init declare_vma(struct vm_struct *vma,
 }
 
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
-static pgprot_t kernel_exec_prot(void)
+#define KPTI_NG_TEMP_VA		(-(1UL << PMD_SHIFT))
+
+static phys_addr_t kpti_ng_temp_alloc __initdata;
+
+static phys_addr_t __init kpti_ng_pgd_alloc(enum pgtable_type type)
+{
+	kpti_ng_temp_alloc -= PAGE_SIZE;
+	return kpti_ng_temp_alloc;
+}
+
+static int __init __kpti_install_ng_mappings(void *__unused)
+{
+	typedef void (kpti_remap_fn)(int, int, phys_addr_t, unsigned long);
+	extern kpti_remap_fn idmap_kpti_install_ng_mappings;
+	kpti_remap_fn *remap_fn;
+
+	int cpu = smp_processor_id();
+	int levels = CONFIG_PGTABLE_LEVELS;
+	int order = order_base_2(levels);
+	u64 kpti_ng_temp_pgd_pa = 0;
+	pgd_t *kpti_ng_temp_pgd;
+	u64 alloc = 0;
+
+	if (levels == 5 && !pgtable_l5_enabled())
+		levels = 4;
+	else if (levels == 4 && !pgtable_l4_enabled())
+		levels = 3;
+
+	remap_fn = (void *)__pa_symbol(idmap_kpti_install_ng_mappings);
+
+	if (!cpu) {
+		alloc = __get_free_pages(GFP_ATOMIC | __GFP_ZERO, order);
+		kpti_ng_temp_pgd = (pgd_t *)(alloc + (levels - 1) * PAGE_SIZE);
+		kpti_ng_temp_alloc = kpti_ng_temp_pgd_pa = __pa(kpti_ng_temp_pgd);
+
+		//
+		// Create a minimal page table hierarchy that permits us to map
+		// the swapper page tables temporarily as we traverse them.
+		//
+		// The physical pages are laid out as follows:
+		//
+		// +--------+-/-------+-/------ +-/------ +-\\\--------+
+		// :  PTE[] : | PMD[] : | PUD[] : | P4D[] : ||| PGD[]  :
+		// +--------+-\-------+-\------ +-\------ +-///--------+
+		//      ^
+		// The first page is mapped into this hierarchy at a PMD_SHIFT
+		// aligned virtual address, so that we can manipulate the PTE
+		// level entries while the mapping is active. The first entry
+		// covers the PTE[] page itself, the remaining entries are free
+		// to be used as a ad-hoc fixmap.
+		//
+		__create_pgd_mapping_locked(kpti_ng_temp_pgd, __pa(alloc),
+					    KPTI_NG_TEMP_VA, PAGE_SIZE, PAGE_KERNEL,
+					    kpti_ng_pgd_alloc, 0);
+	}
+
+	cpu_install_idmap();
+	remap_fn(cpu, num_online_cpus(), kpti_ng_temp_pgd_pa, KPTI_NG_TEMP_VA);
+	cpu_uninstall_idmap();
+
+	if (!cpu) {
+		free_pages(alloc, order);
+		arm64_use_ng_mappings = true;
+	}
+
+	return 0;
+}
+
+void __init kpti_install_ng_mappings(void)
+{
+	/* Check whether KPTI is going to be used */
+	if (!arm64_kernel_unmapped_at_el0())
+		return;
+
+	/*
+	 * We don't need to rewrite the page-tables if either we've done
+	 * it already or we have KASLR enabled and therefore have not
+	 * created any global mappings at all.
+	 */
+	if (arm64_use_ng_mappings)
+		return;
+
+	stop_machine(__kpti_install_ng_mappings, NULL, cpu_online_mask);
+}
+
+static pgprot_t __init kernel_exec_prot(void)
 {
 	return rodata_enabled ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
 }

base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
-- 
2.47.0


