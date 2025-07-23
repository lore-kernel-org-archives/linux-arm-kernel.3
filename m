Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AD7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yxdbF1lpWuT9Ovkz6Fc3Sq+61kQGAJBOyBc7d0s4ZXQ=; b=IFFP6VFfgF3TSnvnXB6FM3YiwZ
	BPWpULsBtJ8uKMB2hWvlFwNA8a/3HKf1Gnp6YAUU0ltDk8UpRYaNADRQc3CJmHfBLQ+VEcdSOHWup
	eVvNlTf9Anabm0gjT0U+viOBp0fkvBbKaFvrRZBuyggiUI8NazzL8zAgVsVeDNFpxiQ2J7mHta9YR
	2uRdRQd3pxySko6aVfcrmGr3OinbshT/zCSVpszIDmG5zkkUYzmzXfqYjIutZDVK/WLhevdOZMaNu
	xWm93DF3wCBDM5PckSP/jJf1dHM6gZivt1wHHi16mgKDTFOQMMLgbCMJym+xeeBicFetnvkn9Ty1I
	uM7OjA1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uecE4-00000005UEM-1ZEz;
	Wed, 23 Jul 2025 16:21:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uecBd-00000005Tv1-18Hq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 16:19:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B75911CE2;
	Wed, 23 Jul 2025 09:19:13 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.163.93.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B8A093F6A8;
	Wed, 23 Jul 2025 09:19:14 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: anshuman.khandual@arm.com,
	quic_zhenhuah@quicinc.com,
	ryan.roberts@arm.com,
	kevin.brodsky@arm.com,
	yangyicong@hisilicon.com,
	joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	david@redhat.com,
	mark.rutland@arm.com,
	urezki@gmail.com,
	Dev Jain <dev.jain@arm.com>
Subject: [RESEND PATCH v5] arm64: Enable vmalloc-huge with ptdump
Date: Wed, 23 Jul 2025 21:48:27 +0530
Message-Id: <20250723161827.15802-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_091921_395372_A7B6D55D 
X-CRM114-Status: GOOD (  28.18  )
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

Our goal is to move towards enabling vmalloc-huge by default on arm64 so
as to reduce TLB pressure. Therefore, we need a way to analyze the portion
of block mappings in vmalloc space we can get on a production system; this
can be done through ptdump, but currently we disable vmalloc-huge if
CONFIG_PTDUMP_DEBUGFS is on. The reason is that lazy freeing of kernel
pagetables via vmap_try_huge_pxd() may race with ptdump, so ptdump
may dereference a bogus address.

To solve this, we need to synchronize ptdump_walk_pgd() with
pud_free_pmd_page() and pmd_free_pte_page().

Since this race is very unlikely to happen in practice, we do not want to
penalize other code paths taking the init_mm mmap_lock. Therefore, we use
static keys. ptdump will enable the static key - upon observing that, the
vmalloc table freeing path will get patched in with an
mmap_read_lock/unlock sequence. A code comment explains in detail, how
a combination of acquire sematics of static_branch_enable() and the
barriers in __flush_tlb_kernel_pgtable() ensures that ptdump will never
get a hold on the address of a freed PMD or PTE table.

For an (almost) rigorous proof of correctness, one may look at:
https://lore.kernel.org/all/e1e87f16-1c48-481b-8f7c-9333ac5d13e7@arm.com/

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
Rebased on 6.16-rc7.

mm-selfests pass. No issues were observed while parallelly running
test_vmalloc.sh (which stresses the vmalloc subsystem) and dumping the
kernel pagetable through sysfs in a loop.

v4->v5:
 - The arch_vmap_pxd_supported() changes were dropped by mistake in between
   the revisions, add them back (Anshuman)
 - Rewrite cover letter, drop stray change, add arm64_ptdump_walk_pgd()
   helper, rename ptdump_lock_key -> arm64_ptdump_lock_key, add comment
   above __pmd_free_pte_page() to explain when the lock won't
   be taken (Anshuman)
 - Rewrite the comment explaining the synchronization logic (Catalin)

v3->v4:
 - Lock-unlock immediately
 - Simplify includes

v2->v3:
 - Use static key mechanism

v1->v2:
 - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
 - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
   the lock 512 times again via pmd_free_pte_page()

---
 arch/arm64/include/asm/ptdump.h  |  2 +
 arch/arm64/include/asm/vmalloc.h |  6 +--
 arch/arm64/mm/mmu.c              | 86 ++++++++++++++++++++++++++++++--
 arch/arm64/mm/ptdump.c           | 11 +++-
 4 files changed, 95 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
index fded5358641f..baff24004459 100644
--- a/arch/arm64/include/asm/ptdump.h
+++ b/arch/arm64/include/asm/ptdump.h
@@ -7,6 +7,8 @@
 
 #include <linux/ptdump.h>
 
+DECLARE_STATIC_KEY_FALSE(arm64_ptdump_lock_key);
+
 #ifdef CONFIG_PTDUMP
 
 #include <linux/mm_types.h>
diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 12f534e8f3ed..e835fd437ae0 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
 	/*
 	 * SW table walks can't handle removal of intermediate entries.
 	 */
-	return pud_sect_supported() &&
-	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
+	return pud_sect_supported();
 }
 
 #define arch_vmap_pmd_supported arch_vmap_pmd_supported
 static inline bool arch_vmap_pmd_supported(pgprot_t prot)
 {
-	/* See arch_vmap_pud_supported() */
-	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
+	return true;
 }
 
 #define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 00ab1d648db6..49932c1dd34e 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -46,6 +46,8 @@
 #define NO_CONT_MAPPINGS	BIT(1)
 #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
 
+DEFINE_STATIC_KEY_FALSE(arm64_ptdump_lock_key);
+
 enum pgtable_type {
 	TABLE_PTE,
 	TABLE_PMD,
@@ -1267,7 +1269,12 @@ int pmd_clear_huge(pmd_t *pmdp)
 	return 1;
 }
 
-int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
+/*
+ * If PMD has been isolated via pud_free_pmd_page(), ptdump cannot get
+ * a hold to it, so no need to serialize with mmap_lock, hence lock
+ * will be passed as false here. Otherwise, lock will be true.
+ */
+static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
 {
 	pte_t *table;
 	pmd_t pmd;
@@ -1279,13 +1286,24 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
 		return 1;
 	}
 
+	/* See comment in pud_free_pmd_page for static key logic */
 	table = pte_offset_kernel(pmdp, addr);
 	pmd_clear(pmdp);
 	__flush_tlb_kernel_pgtable(addr);
+	if (static_branch_unlikely(&arm64_ptdump_lock_key) && lock) {
+		mmap_read_lock(&init_mm);
+		mmap_read_unlock(&init_mm);
+	}
+
 	pte_free_kernel(NULL, table);
 	return 1;
 }
 
+int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
+{
+	return __pmd_free_pte_page(pmdp, addr, true);
+}
+
 int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
 {
 	pmd_t *table;
@@ -1301,16 +1319,76 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
 	}
 
 	table = pmd_offset(pudp, addr);
+
+	/*
+	 * Our objective is to prevent ptdump from reading a PMD table which has
+	 * been freed.  Assume that ptdump_walk_pgd() (call this thread T1)
+	 * executes completely on CPU1 and pud_free_pmd_page() (call this thread
+	 * T2) executes completely on CPU2. Let the region sandwiched by the
+	 * mmap_write_lock/unlock in T1 be called CS (the critical section).
+	 *
+	 * Claim: The CS of T1 will never operate on a freed PMD table.
+	 *
+	 * Proof:
+	 *
+	 * Case 1: The static branch is visible to T2.
+	 *
+	 * Case 1 (a): T1 acquires the lock before T2 can.
+	 * T2 will block until T1 drops the lock, so pmd_free() will only be
+	 * executed after T1 exits CS.
+	 *
+	 * Case 1 (b): T2 acquires the lock before T1 can.
+	 * The sequence of barriers issued in __flush_tlb_kernel_pgtable()
+	 * ensures that an empty PUD (via pud_clear()) is visible to T1 before
+	 * T1 can enter CS, therefore it is impossible for the CS to get hold
+	 * of the address of the isolated PMD table.
+	 *
+	 * Case 2: The static branch is not visible to T2.
+	 *
+	 * Since static_branch_enable() (via dmb(ish)) and mmap_write_lock()
+	 * have acquire semantics, it is guaranteed that the static branch
+	 * will be visible to all CPUs before T1 can enter CS. The static
+	 * branch not being visible to T2 therefore guarantees that T1 has
+	 * not yet entered CS .... (i)
+	 * The sequence of barriers via __flush_tlb_kernel_pgtable() in T2
+	 * implies that if the invisibility of the static branch has been
+	 * observed by T2 (i.e static_branch_unlikely() is observed as false),
+	 * then all CPUs will have observed an empty PUD ... (ii)
+	 * Combining (i) and (ii), we conclude that T1 observes an empty PUD
+	 * before entering CS => it is impossible for the CS to get hold of
+	 * the address of the isolated PMD table. Q.E.D
+	 *
+	 * We have proven that the claim is true on the assumption that
+	 * there is no context switch for T1 and T2. Note that the reasoning
+	 * of the proof uses barriers operating on the inner shareable domain,
+	 * which means that they will affect all CPUs, and also a context switch
+	 * will insert extra barriers into the code paths => the claim will
+	 * stand true even if we drop the assumption.
+	 *
+	 * It is also worth reasoning whether something can go wrong via
+	 * pud_free_pmd_page() -> __pmd_free_pte_page(), since the latter
+	 * will be called locklessly on this code path.
+	 *
+	 * For Case 1 (a), T2 will block until CS is finished, so we are safe.
+	 * For Case 1 (b) and Case 2, the PMD table will be isolated before
+	 * T1 can enter CS, therefore it is safe for T2 to operate on the
+	 * PMD table locklessly.
+	 */
+	pud_clear(pudp);
+	__flush_tlb_kernel_pgtable(addr);
+	if (static_branch_unlikely(&arm64_ptdump_lock_key)) {
+		mmap_read_lock(&init_mm);
+		mmap_read_unlock(&init_mm);
+	}
+
 	pmdp = table;
 	next = addr;
 	end = addr + PUD_SIZE;
 	do {
 		if (pmd_present(pmdp_get(pmdp)))
-			pmd_free_pte_page(pmdp, next);
+			__pmd_free_pte_page(pmdp, next, false);
 	} while (pmdp++, next += PMD_SIZE, next != end);
 
-	pud_clear(pudp);
-	__flush_tlb_kernel_pgtable(addr);
 	pmd_free(NULL, table);
 	return 1;
 }
diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 421a5de806c6..65335c7ba482 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -283,6 +283,13 @@ void note_page_flush(struct ptdump_state *pt_st)
 	note_page(pt_st, 0, -1, pte_val(pte_zero));
 }
 
+static void arm64_ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm)
+{
+	static_branch_enable(&arm64_ptdump_lock_key);
+	ptdump_walk_pgd(st, mm, NULL);
+	static_branch_disable(&arm64_ptdump_lock_key);
+}
+
 void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
 {
 	unsigned long end = ~0UL;
@@ -311,7 +318,7 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
 		}
 	};
 
-	ptdump_walk_pgd(&st.ptdump, info->mm, NULL);
+	arm64_ptdump_walk_pgd(&st.ptdump, info->mm);
 }
 
 static void __init ptdump_initialize(void)
@@ -353,7 +360,7 @@ bool ptdump_check_wx(void)
 		}
 	};
 
-	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
+	arm64_ptdump_walk_pgd(&st.ptdump, &init_mm);
 
 	if (st.wx_pages || st.uxn_pages) {
 		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found, %lu non-UXN pages found\n",
-- 
2.30.2


