Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379A1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 08:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nojsWNFvzyPjUlLVLngql2ur0WpvjVo6ayG+RMxuRqA=; b=j7BnW7fFYLuG+jfTvOhCJl4TAw
	KGMIc3luWh2vu2iktEV9LOqAb+9MbBdkKDMKiBtze10L4EtXSW7wUp8vB+tXv1HN2HVClnEdZfiFl
	hndIxZChvPhkAMA44RnwSLTjdSumBQdFb67jgCf38GfG5lq+0AcCq3x4pG4YM8AUcoDEhs+BVqf0g
	nQTHHzBTsFjC3wJekL1MQVxzQig9Ov/9PU/hE5+puhIY8Ak/nRhx774NwjZW8TTOHONrqP/52aHGn
	VQ1ZKDMqZOes/OPsONAb+cmrfHVoJi5V7PSLcPUc5b39gVDAmIMv6NOks9NQIdj5xwcfTBOpjb2+Z
	scAiOmmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79TY-00000006Sgh-09AH;
	Tue, 22 Apr 2025 08:59:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78qO-00000006GtV-3yiq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:19:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E095176A;
	Tue, 22 Apr 2025 01:19:00 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B57543F66E;
	Tue, 22 Apr 2025 01:19:02 -0700 (PDT)
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
Subject: [PATCH v4 11/11] arm64/mm: Batch barriers when updating kernel mappings
Date: Tue, 22 Apr 2025 09:18:19 +0100
Message-ID: <20250422081822.1836315-12-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422081822.1836315-1-ryan.roberts@arm.com>
References: <20250422081822.1836315-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_011905_090335_F44BEA76 
X-CRM114-Status: GOOD (  24.49  )
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
barriers until the end of a set of entry updates.
arch_enter_lazy_mmu_mode() and arch_leave_lazy_mmu_mode() provide the
required hooks.

vmalloc improves by up to 30% as a result.

Two new TIF_ flags are created; TIF_LAZY_MMU tells us if the task is in
the lazy mode and can therefore defer any barriers until exit from the
lazy mode. TIF_LAZY_MMU_PENDING is used to remember if any pte operation
was performed while in the lazy mode that required barriers. Then when
leaving lazy mode, if that flag is set, we emit the barriers.

Since arch_enter_lazy_mmu_mode() and arch_leave_lazy_mmu_mode() are used
for both user and kernel mappings, we need the second flag to avoid
emitting barriers unnecessarily if only user mappings were updated.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h     | 81 ++++++++++++++++++++++------
 arch/arm64/include/asm/thread_info.h |  2 +
 arch/arm64/kernel/process.c          |  9 ++--
 3 files changed, 72 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 39c331743b69..ab4a1b19e596 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -40,6 +40,63 @@
 #include <linux/sched.h>
 #include <linux/page_table_check.h>
 
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
+	 * see the store. There is no guarantee of an isb being issued though.
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
+	unsigned long flags;
+
+	VM_WARN_ON(in_interrupt());
+	flags = read_thread_flags();
+
+	if (flags & BIT(TIF_LAZY_MMU)) {
+		/* Avoid the atomic op if already set. */
+		if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
+			set_thread_flag(TIF_LAZY_MMU_PENDING);
+	} else {
+		emit_pte_barriers();
+	}
+}
+
+#define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
+static inline void arch_enter_lazy_mmu_mode(void)
+{
+	VM_WARN_ON(in_interrupt());
+	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));
+
+	set_thread_flag(TIF_LAZY_MMU);
+}
+
+static inline void arch_flush_lazy_mmu_mode(void)
+{
+	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
+		emit_pte_barriers();
+}
+
+static inline void arch_leave_lazy_mmu_mode(void)
+{
+	arch_flush_lazy_mmu_mode();
+	clear_thread_flag(TIF_LAZY_MMU);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 
@@ -326,10 +383,8 @@ static inline void __set_pte_complete(pte_t pte)
 	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
 	 * has the necessary barriers.
 	 */
-	if (pte_valid_not_user(pte)) {
-		dsb(ishst);
-		isb();
-	}
+	if (pte_valid_not_user(pte))
+		queue_pte_barriers();
 }
 
 static inline void __set_pte(pte_t *ptep, pte_t pte)
@@ -801,10 +856,8 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 
 	WRITE_ONCE(*pmdp, pmd);
 
-	if (pmd_valid(pmd)) {
-		dsb(ishst);
-		isb();
-	}
+	if (pmd_valid(pmd))
+		queue_pte_barriers();
 }
 
 static inline void pmd_clear(pmd_t *pmdp)
@@ -869,10 +922,8 @@ static inline void set_pud(pud_t *pudp, pud_t pud)
 
 	WRITE_ONCE(*pudp, pud);
 
-	if (pud_valid(pud)) {
-		dsb(ishst);
-		isb();
-	}
+	if (pud_valid(pud))
+		queue_pte_barriers();
 }
 
 static inline void pud_clear(pud_t *pudp)
@@ -951,8 +1002,7 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 	}
 
 	WRITE_ONCE(*p4dp, p4d);
-	dsb(ishst);
-	isb();
+	queue_pte_barriers();
 }
 
 static inline void p4d_clear(p4d_t *p4dp)
@@ -1080,8 +1130,7 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 	}
 
 	WRITE_ONCE(*pgdp, pgd);
-	dsb(ishst);
-	isb();
+	queue_pte_barriers();
 }
 
 static inline void pgd_clear(pgd_t *pgdp)
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 1114c1c3300a..1fdd74b7b831 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -82,6 +82,8 @@ void arch_setup_new_exec(void);
 #define TIF_SME_VL_INHERIT	28	/* Inherit SME vl_onexec across exec */
 #define TIF_KERNEL_FPSTATE	29	/* Task is in a kernel mode FPSIMD section */
 #define TIF_TSC_SIGSEGV		30	/* SIGSEGV on counter-timer access */
+#define TIF_LAZY_MMU		31	/* Task in lazy mmu mode */
+#define TIF_LAZY_MMU_PENDING	32	/* Ops pending for lazy mmu mode exit */
 
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


