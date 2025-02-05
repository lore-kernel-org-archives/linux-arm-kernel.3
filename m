Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBF5C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nd/dr2vL0fvT1NFkFgg09AI38ZrhEiBpnWL1BZbZ2YU=; b=EcJ9kEOdxXYYkaYiClYwkTOHqR
	+jh7vG4TZuaKmJX8sYsO4KWvDj4zkKpDieJvu9KiDxRi1XN5joi7/C59Q8gFkrq8sxAvih5lcsP54
	SoufFklk13EUrO3P6h0GYvBcoPrrIUZHpwwdi0y7XHrU72fhZqufSQuR2mDgL8mnvqMCiSVhqszGF
	hzajaK8MJ2xNsABwyOzn3LiDsw776S+Rir2M0BbVF9FQ8FngGL0LO6ijl/5G1/I3py4GwBr++mEws
	chFTVgyuoSoIbumySuhTwIdRN3xkfxWQicAQcI46TCwm0e61xQe87TYJvtmpl6g9NhUwAf0ipg3kz
	JWNpZIKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhPh-00000003mqA-3gWQ;
	Wed, 05 Feb 2025 15:34:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfh3Y-00000003iQR-2Pay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 15:11:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D55E91063;
	Wed,  5 Feb 2025 07:11:35 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B93063F5A1;
	Wed,  5 Feb 2025 07:11:09 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steve Capper <steve.capper@linaro.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 16/16] arm64/mm: Defer barriers when updating kernel mappings
Date: Wed,  5 Feb 2025 15:09:56 +0000
Message-ID: <20250205151003.88959-17-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205151003.88959-1-ryan.roberts@arm.com>
References: <20250205151003.88959-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_071112_705987_7C84CE98 
X-CRM114-Status: GOOD (  21.99  )
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
barriers until the end of a set up entry updates. The newly added
arch_update_kernel_mappings_begin() / arch_update_kernel_mappings_end()
provide the required hooks.

vmalloc improves by up to 30% as a result.

Two new TIF_ flags are created; TIF_KMAP_UPDATE_ACTIVE tells us if we
are in the batch mode and can therefore defer any barriers until the end
of the batch. TIF_KMAP_UPDATE_PENDING tells us if barriers are queued to
be emited at the end of the batch.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h     | 65 +++++++++++++++++++---------
 arch/arm64/include/asm/thread_info.h |  2 +
 arch/arm64/kernel/process.c          | 20 +++++++--
 3 files changed, 63 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index ff358d983583..1ee9b9588502 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -39,6 +39,41 @@
 #include <linux/mm_types.h>
 #include <linux/sched.h>
 #include <linux/page_table_check.h>
+#include <linux/pgtable_modmask.h>
+
+static inline void emit_pte_barriers(void)
+{
+	dsb(ishst);
+	isb();
+}
+
+static inline void queue_pte_barriers(void)
+{
+	if (test_thread_flag(TIF_KMAP_UPDATE_ACTIVE)) {
+		if (!test_thread_flag(TIF_KMAP_UPDATE_PENDING))
+			set_thread_flag(TIF_KMAP_UPDATE_PENDING);
+	} else
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
+	if (test_thread_flag(TIF_KMAP_UPDATE_PENDING))
+		emit_pte_barriers();
+
+	clear_thread_flag(TIF_KMAP_UPDATE_PENDING);
+	clear_thread_flag(TIF_KMAP_UPDATE_ACTIVE);
+}
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
@@ -323,10 +358,8 @@ static inline void __set_pte_complete(pte_t pte)
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
@@ -791,10 +824,8 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 
 	WRITE_ONCE(*pmdp, pmd);
 
-	if (pmd_valid_not_user(pmd)) {
-		dsb(ishst);
-		isb();
-	}
+	if (pmd_valid_not_user(pmd))
+		queue_pte_barriers();
 }
 
 static inline void pmd_clear(pmd_t *pmdp)
@@ -869,10 +900,8 @@ static inline void set_pud(pud_t *pudp, pud_t pud)
 
 	WRITE_ONCE(*pudp, pud);
 
-	if (pud_valid_not_user(pud)) {
-		dsb(ishst);
-		isb();
-	}
+	if (pud_valid_not_user(pud))
+		queue_pte_barriers();
 }
 
 static inline void pud_clear(pud_t *pudp)
@@ -960,10 +989,8 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 
 	WRITE_ONCE(*p4dp, p4d);
 
-	if (p4d_valid_not_user(p4d)) {
-		dsb(ishst);
-		isb();
-	}
+	if (p4d_valid_not_user(p4d))
+		queue_pte_barriers();
 }
 
 static inline void p4d_clear(p4d_t *p4dp)
@@ -1098,10 +1125,8 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 
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
index 1114c1c3300a..382d2121261e 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -82,6 +82,8 @@ void arch_setup_new_exec(void);
 #define TIF_SME_VL_INHERIT	28	/* Inherit SME vl_onexec across exec */
 #define TIF_KERNEL_FPSTATE	29	/* Task is in a kernel mode FPSIMD section */
 #define TIF_TSC_SIGSEGV		30	/* SIGSEGV on counter-timer access */
+#define TIF_KMAP_UPDATE_ACTIVE	31	/* kernel map update in progress */
+#define TIF_KMAP_UPDATE_PENDING	32	/* kernel map updated with deferred barriers */
 
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 42faebb7b712..1367ec6407d1 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -680,10 +680,10 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	gcs_thread_switch(next);
 
 	/*
-	 * Complete any pending TLB or cache maintenance on this CPU in case
-	 * the thread migrates to a different CPU.
-	 * This full barrier is also required by the membarrier system
-	 * call.
+	 * Complete any pending TLB or cache maintenance on this CPU in case the
+	 * thread migrates to a different CPU. This full barrier is also
+	 * required by the membarrier system call. Additionally it is required
+	 * for TIF_KMAP_UPDATE_PENDING, see below.
 	 */
 	dsb(ish);
 
@@ -696,6 +696,18 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	/* avoid expensive SCTLR_EL1 accesses if no change */
 	if (prev->thread.sctlr_user != next->thread.sctlr_user)
 		update_sctlr_el1(next->thread.sctlr_user);
+	else if (unlikely(test_thread_flag(TIF_KMAP_UPDATE_PENDING))) {
+		/*
+		 * In unlikely event that a kernel map update is on-going when
+		 * preemption occurs, we must emit_pte_barriers() if pending.
+		 * emit_pte_barriers() consists of "dsb(ishst); isb();". The dsb
+		 * is already handled above. The isb() is handled if
+		 * update_sctlr_el1() was called. So only need to emit isb()
+		 * here if it wasn't called.
+		 */
+		isb();
+		clear_thread_flag(TIF_KMAP_UPDATE_PENDING);
+	}
 
 	/* the actual thread switch */
 	last = cpu_switch_to(prev, next);
-- 
2.43.0


