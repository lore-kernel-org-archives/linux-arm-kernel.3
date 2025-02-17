Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FE3C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1dNM9JM90rBmspFvnFJJnBHEG8lJQq6n88kpxM+tj8=; b=jhh6B46fWUhZu6s4GjcGJv+VsY
	ifkgVr/Wxt1r5V19hZu+xCnsiYvtQCzRt+u2bvSAx0aM6Vf/1tYbcAM+7JFWxugJg3jTL3KtAw/ki
	ObqHrkzRXBkGEBBpOfBuTDPO+ddnGYgNrZDjkW6sGJPzbk9TvPuLS/q6tr5K9JF4VZ1SgO7rLYQus
	cIrX26xOXbBavRXC7v4ERR0NPr7IBMoYf5FjXDhTEv+I3BUgkiTqmOALtpzo17sZMg0NZEWqjsZ1p
	9LCnImF1nnLoVOzo7C5UbglRqtCFBa5ik50HHEn0Xr9B34FCtBTKQbO2sPIOwPutm0psrT0O/InTK
	1wr4RgVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2CR-00000004sFA-1K0X;
	Mon, 17 Feb 2025 14:34:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1ns-00000004mdU-1uXN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:08:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42E83244C;
	Mon, 17 Feb 2025 06:09:15 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9BE63F6A8;
	Mon, 17 Feb 2025 06:08:53 -0800 (PST)
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
Subject: [PATCH v2 14/14] arm64/mm: Batch barriers when updating kernel mappings
Date: Mon, 17 Feb 2025 14:08:06 +0000
Message-ID: <20250217140809.1702789-15-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217140809.1702789-1-ryan.roberts@arm.com>
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_060856_581542_D79AFFEC 
X-CRM114-Status: GOOD (  22.04  )
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

Because the kernel can't tolerate page faults for kernel mappings, when
setting a valid, kernel space pte (or pmd/pud/p4d/pgd), it emits a
dsb(ishst) to ensure that the store to the pgtable is observed by the
table walker immediately. Additionally it emits an isb() to ensure that
any already speculatively determined invalid mapping fault gets
canceled.

We can improve the performance of vmalloc operations by batching these
barriers until the end of a set of entry updates. The newly added
arch_update_kernel_mappings_begin() / arch_update_kernel_mappings_end()
provide the required hooks.

vmalloc improves by up to 30% as a result.

A new TIF_ flag is created; TIF_KMAP_UPDATE_ACTIVE tells us if we are in
the batch mode and can therefore defer any barriers until the end of the
batch.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h     | 73 ++++++++++++++++++++--------
 arch/arm64/include/asm/thread_info.h |  1 +
 arch/arm64/kernel/process.c          |  9 ++--
 3 files changed, 59 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 51128c2956f8..f8866dbdfde7 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -39,6 +39,49 @@
 #include <linux/mm_types.h>
 #include <linux/sched.h>
 #include <linux/page_table_check.h>
+#include <linux/pgtable_modmask.h>
+
+static inline void emit_pte_barriers(void)
+{
+	/*
+	 * These barriers are emitted under certain conditions after a pte entry
+	 * was modified (see e.g. __set_pte_complete()). The dsb makes the store
+	 * visible to the table walker. The isb ensures that any previous
+	 * speculative "invalid translation" marker that is in the CPU's
+	 * pipeline gets cleared, so that any access to that address after
+	 * setting the pte to valid won't cause a spurious fault. If the thread
+	 * gets preempted after storing to the pgtable but before emitting these
+	 * barriers, __switch_to() emits a dsb which ensure the walker gets to
+	 * see the store. There is no guarrantee of an isb being issued though.
+	 * This is safe because it will still get issued (albeit on a
+	 * potentially different CPU) when the thread starts running again,
+	 * before any access to the address.
+	 */
+	dsb(ishst);
+	isb();
+}
+
+static inline void queue_pte_barriers(void)
+{
+	if (!test_thread_flag(TIF_KMAP_UPDATE_ACTIVE))
+		emit_pte_barriers();
+}
+
+#define arch_update_kernel_mappings_begin arch_update_kernel_mappings_begin
+static inline void arch_update_kernel_mappings_begin(unsigned long start,
+						     unsigned long end)
+{
+	set_thread_flag(TIF_KMAP_UPDATE_ACTIVE);
+}
+
+#define arch_update_kernel_mappings_end arch_update_kernel_mappings_end
+static inline void arch_update_kernel_mappings_end(unsigned long start,
+						   unsigned long end,
+						   pgtbl_mod_mask mask)
+{
+	clear_thread_flag(TIF_KMAP_UPDATE_ACTIVE);
+	emit_pte_barriers();
+}
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
@@ -323,10 +366,8 @@ static inline void __set_pte_complete(pte_t pte)
 	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
 	 * or update_mmu_cache() have the necessary barriers.
 	 */
-	if (pte_valid_not_user(pte)) {
-		dsb(ishst);
-		isb();
-	}
+	if (pte_valid_not_user(pte))
+		queue_pte_barriers();
 }
 
 static inline void __set_pte(pte_t *ptep, pte_t pte)
@@ -791,10 +832,8 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 
 	WRITE_ONCE(*pmdp, pmd);
 
-	if (pmd_valid_not_user(pmd)) {
-		dsb(ishst);
-		isb();
-	}
+	if (pmd_valid_not_user(pmd))
+		queue_pte_barriers();
 }
 
 static inline void pmd_clear(pmd_t *pmdp)
@@ -859,10 +898,8 @@ static inline void set_pud(pud_t *pudp, pud_t pud)
 
 	WRITE_ONCE(*pudp, pud);
 
-	if (pud_valid_not_user(pud)) {
-		dsb(ishst);
-		isb();
-	}
+	if (pud_valid_not_user(pud))
+		queue_pte_barriers();
 }
 
 static inline void pud_clear(pud_t *pudp)
@@ -941,10 +978,8 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 
 	WRITE_ONCE(*p4dp, p4d);
 
-	if (p4d_valid_not_user(p4d)) {
-		dsb(ishst);
-		isb();
-	}
+	if (p4d_valid_not_user(p4d))
+		queue_pte_barriers();
 }
 
 static inline void p4d_clear(p4d_t *p4dp)
@@ -1072,10 +1107,8 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 
 	WRITE_ONCE(*pgdp, pgd);
 
-	if (pgd_valid_not_user(pgd)) {
-		dsb(ishst);
-		isb();
-	}
+	if (pgd_valid_not_user(pgd))
+		queue_pte_barriers();
 }
 
 static inline void pgd_clear(pgd_t *pgdp)
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 1114c1c3300a..3856e0759cc3 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -82,6 +82,7 @@ void arch_setup_new_exec(void);
 #define TIF_SME_VL_INHERIT	28	/* Inherit SME vl_onexec across exec */
 #define TIF_KERNEL_FPSTATE	29	/* Task is in a kernel mode FPSIMD section */
 #define TIF_TSC_SIGSEGV		30	/* SIGSEGV on counter-timer access */
+#define TIF_KMAP_UPDATE_ACTIVE	31	/* kernel map update in progress */
 
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 42faebb7b712..45a55fe81788 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -680,10 +680,11 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	gcs_thread_switch(next);
 
 	/*
-	 * Complete any pending TLB or cache maintenance on this CPU in case
-	 * the thread migrates to a different CPU.
-	 * This full barrier is also required by the membarrier system
-	 * call.
+	 * Complete any pending TLB or cache maintenance on this CPU in case the
+	 * thread migrates to a different CPU. This full barrier is also
+	 * required by the membarrier system call. Additionally it makes any
+	 * in-progress pgtable writes visible to the table walker; See
+	 * emit_pte_barriers().
 	 */
 	dsb(ish);
 
-- 
2.43.0


