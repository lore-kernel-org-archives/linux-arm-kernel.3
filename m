Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42123CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AU7H3Y7kBOsElJkv6VNrmfGdcBEVGJ+3XWubfNSqus=; b=0VJOPv4rpuS/De2rlGJGsYe5bk
	eMFpRfiCdYmeO9day7pOE+N6uwjHYp4ug6gHOI80uqit9wWuMBijr0V+EZqeAds301WdFw89+xSge
	W7S6HJEvlhQQUK9QEQDK/+cjnXb8vi6wQ2iydYVm1vmT6c7h0LDkiDgP0BPiq9Acn1SfUI0mBRJpz
	WEvUmOCY+6o2DOEU4M8M1QpP1u+TszstBzOKLUVpLmXHoO8mPY6twnmAFxd8WNFTQl3l2Wiv1yG8T
	7ZnMy/fJyq+6xes+rKLCjMuz7jHPzBz/GxmxbsOUpnyKPEMsHPS7arMvbb4Kodg1LdcsASpga8PKC
	bIFPmAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE38i-00000000eQQ-1v7w;
	Wed, 29 Oct 2025 10:10:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE38O-00000000e6N-3WMQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:10:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 856C31AC1;
	Wed, 29 Oct 2025 03:10:20 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70AF73F66E;
	Wed, 29 Oct 2025 03:10:23 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>,
	Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
Date: Wed, 29 Oct 2025 10:09:04 +0000
Message-ID: <20251029100909.3381140-8-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251029100909.3381140-1-kevin.brodsky@arm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_031029_066128_038EB738 
X-CRM114-Status: GOOD (  30.81  )
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

Despite recent efforts to prevent lazy_mmu sections from nesting, it
remains difficult to ensure that it never occurs - and in fact it
does occur on arm64 in certain situations (CONFIG_DEBUG_PAGEALLOC).
Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
made nesting tolerable on arm64, but without truly supporting it:
the inner call to leave() disables the batching optimisation before
the outer section ends.

This patch actually enables lazy_mmu sections to nest by tracking
the nesting level in task_struct, in a similar fashion to e.g.
pagefault_{enable,disable}(). This is fully handled by the generic
lazy_mmu helpers that were recently introduced.

lazy_mmu sections were not initially intended to nest, so we need to
clarify the semantics w.r.t. the arch_*_lazy_mmu_mode() callbacks.
This patch takes the following approach:

* The outermost calls to lazy_mmu_mode_{enable,disable}() trigger
  calls to arch_{enter,leave}_lazy_mmu_mode() - this is unchanged.

* Nested calls to lazy_mmu_mode_{enable,disable}() are not forwarded
  to the arch via arch_{enter,leave} - lazy MMU remains enabled so
  the assumption is that these callbacks are not relevant. However,
  existing code may rely on a call to disable() to flush any batched
  state, regardless of nesting. arch_flush_lazy_mmu_mode() is
  therefore called in that situation.

A separate interface was recently introduced to temporarily pause
the lazy MMU mode: lazy_mmu_mode_{pause,resume}(). pause() fully
exits the mode *regardless of the nesting level*, and resume()
restores the mode at the same nesting level.

Whether the mode is actually enabled or not at any point is tracked
by a separate "active" field in task_struct; this makes it possible
to check invariants in the generic API, and to expose a new
in_lazy_mmu_mode() helper to replace the various ways arch's
currently track whether the mode is enabled (this will be done in
later patches).

In summary (nesting/active represent the values *after* the call):

lazy_mmu_mode_enable()		-> arch_enter()	    nesting=1 active=1
    lazy_mmu_mode_enable()	-> ø		    nesting=2 active=1
	lazy_mmu_mode_pause()	-> arch_leave()     nesting=2 active=0
	lazy_mmu_mode_resume()	-> arch_enter()     nesting=2 active=1
    lazy_mmu_mode_disable()	-> arch_flush()     nesting=1 active=1
lazy_mmu_mode_disable()		-> arch_leave()     nesting=0 active=0

Note: in_lazy_mmu_mode() is added to <linux/sched.h> to allow arch
headers included by <linux/pgtable.h> to use it.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 12 ------
 include/linux/mm_types_task.h    |  5 +++
 include/linux/pgtable.h          | 67 ++++++++++++++++++++++++++++++--
 include/linux/sched.h            | 16 ++++++++
 4 files changed, 84 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 54f8d6bb6f22..535435248923 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -82,18 +82,6 @@ static inline void queue_pte_barriers(void)
 
 static inline void arch_enter_lazy_mmu_mode(void)
 {
-	/*
-	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
-	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
-	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
-	 * permissions on the linear map with apply_to_page_range(), which
-	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
-	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
-	 * flush and clear the flag such that the remainder of the work in the
-	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
-	 * keeps tracking simple.
-	 */
-
 	if (in_interrupt())
 		return;
 
diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
index a82aa80c0ba4..632d404f8191 100644
--- a/include/linux/mm_types_task.h
+++ b/include/linux/mm_types_task.h
@@ -88,4 +88,9 @@ struct tlbflush_unmap_batch {
 #endif
 };
 
+struct lazy_mmu_state {
+	u8 nesting_level;
+	bool active;
+};
+
 #endif /* _LINUX_MM_TYPES_TASK_H */
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index b5fdf32c437f..e6064e00b22d 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -228,27 +228,86 @@ static inline int pmd_dirty(pmd_t pmd)
  * of the lazy mode. So the implementation must assume preemption may be enabled
  * and cpu migration is possible; it must take steps to be robust against this.
  * (In practice, for user PTE updates, the appropriate page table lock(s) are
- * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
- * and the mode cannot be used in interrupt context.
+ * held, but for kernel PTE updates, no lock is held). The mode cannot be used
+ * in interrupt context.
+ *
+ * The lazy MMU mode is enabled for a given block of code using:
+ *
+ *   lazy_mmu_mode_enable();
+ *   <code>
+ *   lazy_mmu_mode_disable();
+ *
+ * Nesting is permitted: <code> may itself use an enable()/disable() pair.
+ * A nested call to enable() has no functional effect; however disable() causes
+ * any batched architectural state to be flushed regardless of nesting. After a
+ * call to disable(), the caller can therefore rely on all previous page table
+ * modifications to have taken effect, but the lazy MMU mode may still be
+ * enabled.
+ *
+ * In certain cases, it may be desirable to temporarily pause the lazy MMU mode.
+ * This can be done using:
+ *
+ *   lazy_mmu_mode_pause();
+ *   <code>
+ *   lazy_mmu_mode_resume();
+ *
+ * This sequence must only be used if the lazy MMU mode is already enabled.
+ * pause() ensures that the mode is exited regardless of the nesting level;
+ * resume() re-enters the mode at the same nesting level. <code> must not modify
+ * the lazy MMU state (i.e. it must not call any of the lazy_mmu_mode_*
+ * helpers).
+ *
+ * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
+ * currently enabled.
  */
 #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
 static inline void lazy_mmu_mode_enable(void)
 {
-	arch_enter_lazy_mmu_mode();
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
+	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
+	/* enable() must not be called while paused */
+	VM_WARN_ON(state->nesting_level > 0 && !state->active);
+
+	if (state->nesting_level++ == 0) {
+		state->active = true;
+		arch_enter_lazy_mmu_mode();
+	}
 }
 
 static inline void lazy_mmu_mode_disable(void)
 {
-	arch_leave_lazy_mmu_mode();
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
+	VM_WARN_ON_ONCE(state->nesting_level == 0);
+	VM_WARN_ON(!state->active);
+
+	if (--state->nesting_level == 0) {
+		state->active = false;
+		arch_leave_lazy_mmu_mode();
+	} else {
+		/* Exiting a nested section */
+		arch_flush_lazy_mmu_mode();
+	}
 }
 
 static inline void lazy_mmu_mode_pause(void)
 {
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
+	VM_WARN_ON(state->nesting_level == 0 || !state->active);
+
+	state->active = false;
 	arch_leave_lazy_mmu_mode();
 }
 
 static inline void lazy_mmu_mode_resume(void)
 {
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
+	VM_WARN_ON(state->nesting_level == 0 || state->active);
+
+	state->active = true;
 	arch_enter_lazy_mmu_mode();
 }
 #else
diff --git a/include/linux/sched.h b/include/linux/sched.h
index cbb7340c5866..11566d973f42 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1441,6 +1441,10 @@ struct task_struct {
 
 	struct page_frag		task_frag;
 
+#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
+	struct lazy_mmu_state		lazy_mmu_state;
+#endif
+
 #ifdef CONFIG_TASK_DELAY_ACCT
 	struct task_delay_info		*delays;
 #endif
@@ -1724,6 +1728,18 @@ static inline char task_state_to_char(struct task_struct *tsk)
 	return task_index_to_char(task_state_index(tsk));
 }
 
+#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
+static inline bool in_lazy_mmu_mode(void)
+{
+	return current->lazy_mmu_state.active;
+}
+#else
+static inline bool in_lazy_mmu_mode(void)
+{
+	return false;
+}
+#endif
+
 extern struct pid *cad_pid;
 
 /*
-- 
2.47.0


