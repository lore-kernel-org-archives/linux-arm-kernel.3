Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AA8D5B175
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoHbVHv+XTmW3E1WW4ukDXvOPBr3IO8T4igWzmkfQHI=; b=h1LbN2FLgUMMg8C5ytRVmBvmWi
	KILA+4OsXUoDeCw/GfXzXcTevol+avsa4b3mYOi+JCuXihkRF0pW8Bu2i/pnIZ2YeyPiHi4RRcGwM
	qPCC2cEOMk5hDFHfoVSZ55TXgRJfWXK+sOBT8tTBYf2wOphaRrvHrJwhO2G6HyRQo9kSDBRAxuu1a
	UvXSdUxR+MyrDTH12rsUZULHGD/7330ThWD6XVdFYDdBCBDiC/ViD5P9pXIHOjVdNLep5eG2cpTKu
	DxQX4VqD89IibGTuZj7QnqQ3U0/pySTh3Js2K1vfd/CU6PRrNjNYIf6k2K/cuHf8Nlkhw2bnENhrf
	h6EuF3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVA7k-00000003qaH-2G7g;
	Mon, 15 Dec 2025 15:04:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVA7g-00000003qY2-2cLb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:04:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C467169C;
	Mon, 15 Dec 2025 07:04:21 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3A423F73B;
	Mon, 15 Dec 2025 07:04:22 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
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
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org,
	"David Hildenbrand (Red Hat)" <david@kernel.org>
Subject: [PATCH v6 09/14] mm: enable lazy_mmu sections to nest
Date: Mon, 15 Dec 2025 15:03:18 +0000
Message-ID: <20251215150323.2218608-10-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251215150323.2218608-1-kevin.brodsky@arm.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_070430_308431_EB0F3E2E 
X-CRM114-Status: GOOD (  32.10  )
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

pause()/resume() are themselves allowed to nest, so we actually
store two nesting levels in task_struct: enable_count and
pause_count. A new helper is_lazy_mmu_mode_active() is introduced to
determine whether we are currently in lazy MMU mode; this will be
used in subsequent patches to replace the various ways arch's
currently track whether the mode is enabled.

In summary (enable/pause represent the values *after* the call):

lazy_mmu_mode_enable()		-> arch_enter()	    enable=1 pause=0
    lazy_mmu_mode_enable()	-> ø		    enable=2 pause=0
	lazy_mmu_mode_pause()	-> arch_leave()     enable=2 pause=1
	lazy_mmu_mode_resume()	-> arch_enter()     enable=2 pause=0
    lazy_mmu_mode_disable()	-> arch_flush()     enable=1 pause=0
lazy_mmu_mode_disable()		-> arch_leave()     enable=0 pause=0

Note: is_lazy_mmu_mode_active() is added to <linux/sched.h> to allow
arch headers included by <linux/pgtable.h> to use it.

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable.h |  12 ----
 include/linux/mm_types_task.h    |   5 ++
 include/linux/pgtable.h          | 114 +++++++++++++++++++++++++++++--
 include/linux/sched.h            |  45 ++++++++++++
 4 files changed, 157 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index bf9178902bdb..7f528c36d53c 100644
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
 	set_thread_flag(TIF_LAZY_MMU);
 }
 
diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
index a82aa80c0ba4..11bf319d78ec 100644
--- a/include/linux/mm_types_task.h
+++ b/include/linux/mm_types_task.h
@@ -88,4 +88,9 @@ struct tlbflush_unmap_batch {
 #endif
 };
 
+struct lazy_mmu_state {
+	u8 enable_count;
+	u8 pause_count;
+};
+
 #endif /* _LINUX_MM_TYPES_TASK_H */
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index dddde6873d1e..2f0dd3a4ace1 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -236,39 +236,139 @@ static inline int pmd_dirty(pmd_t pmd)
  * The mode is disabled in interrupt context and calls to the lazy_mmu API have
  * no effect.
  *
- * Nesting is not permitted.
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
+ * pause() ensures that the mode is exited regardless of the nesting level;
+ * resume() re-enters the mode at the same nesting level. Any call to the
+ * lazy_mmu_mode_* API between those two calls has no effect. In particular,
+ * this means that pause()/resume() pairs may nest.
+ *
+ * is_lazy_mmu_mode_active() can be used to check whether the lazy MMU mode is
+ * currently enabled.
  */
 #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
+/**
+ * lazy_mmu_mode_enable() - Enable the lazy MMU mode.
+ *
+ * Enters a new lazy MMU mode section; if the mode was not already enabled,
+ * enables it and calls arch_enter_lazy_mmu_mode().
+ *
+ * Must be paired with a call to lazy_mmu_mode_disable().
+ *
+ * Has no effect if called:
+ * - While paused - see lazy_mmu_mode_pause()
+ * - In interrupt context
+ */
 static inline void lazy_mmu_mode_enable(void)
 {
-	if (in_interrupt())
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
+	if (in_interrupt() || state->pause_count > 0)
 		return;
 
-	arch_enter_lazy_mmu_mode();
+	VM_WARN_ON_ONCE(state->enable_count == U8_MAX);
+
+	if (state->enable_count++ == 0)
+		arch_enter_lazy_mmu_mode();
 }
 
+/**
+ * lazy_mmu_mode_disable() - Disable the lazy MMU mode.
+ *
+ * Exits the current lazy MMU mode section. If it is the outermost section,
+ * disables the mode and calls arch_leave_lazy_mmu_mode(). Otherwise (nested
+ * section), calls arch_flush_lazy_mmu_mode().
+ *
+ * Must match a call to lazy_mmu_mode_enable().
+ *
+ * Has no effect if called:
+ * - While paused - see lazy_mmu_mode_pause()
+ * - In interrupt context
+ */
 static inline void lazy_mmu_mode_disable(void)
 {
-	if (in_interrupt())
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
+	if (in_interrupt() || state->pause_count > 0)
 		return;
 
-	arch_leave_lazy_mmu_mode();
+	VM_WARN_ON_ONCE(state->enable_count == 0);
+
+	if (--state->enable_count == 0)
+		arch_leave_lazy_mmu_mode();
+	else /* Exiting a nested section */
+		arch_flush_lazy_mmu_mode();
+
 }
 
+/**
+ * lazy_mmu_mode_pause() - Pause the lazy MMU mode.
+ *
+ * Pauses the lazy MMU mode; if it is currently active, disables it and calls
+ * arch_leave_lazy_mmu_mode().
+ *
+ * Must be paired with a call to lazy_mmu_mode_resume(). Calls to the
+ * lazy_mmu_mode_* API have no effect until the matching resume() call.
+ *
+ * Has no effect if called:
+ * - While paused (inside another pause()/resume() pair)
+ * - In interrupt context
+ */
 static inline void lazy_mmu_mode_pause(void)
 {
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
 	if (in_interrupt())
 		return;
 
-	arch_leave_lazy_mmu_mode();
+	VM_WARN_ON_ONCE(state->pause_count == U8_MAX);
+
+	if (state->pause_count++ == 0 && state->enable_count > 0)
+		arch_leave_lazy_mmu_mode();
 }
 
+/**
+ * lazy_mmu_mode_resume() - Resume the lazy MMU mode.
+ *
+ * Resumes the lazy MMU mode; if it was active at the point where the matching
+ * call to lazy_mmu_mode_pause() was made, re-enables it and calls
+ * arch_enter_lazy_mmu_mode().
+ *
+ * Must match a call to lazy_mmu_mode_pause().
+ *
+ * Has no effect if called:
+ * - While paused (inside another pause()/resume() pair)
+ * - In interrupt context
+ */
 static inline void lazy_mmu_mode_resume(void)
 {
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
 	if (in_interrupt())
 		return;
 
-	arch_enter_lazy_mmu_mode();
+	VM_WARN_ON_ONCE(state->pause_count == 0);
+
+	if (--state->pause_count == 0 && state->enable_count > 0)
+		arch_enter_lazy_mmu_mode();
 }
 #else
 static inline void lazy_mmu_mode_enable(void) {}
diff --git a/include/linux/sched.h b/include/linux/sched.h
index d395f2810fac..f2fc6584c790 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1419,6 +1419,10 @@ struct task_struct {
 
 	struct page_frag		task_frag;
 
+#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
+	struct lazy_mmu_state		lazy_mmu_state;
+#endif
+
 #ifdef CONFIG_TASK_DELAY_ACCT
 	struct task_delay_info		*delays;
 #endif
@@ -1702,6 +1706,47 @@ static inline char task_state_to_char(struct task_struct *tsk)
 	return task_index_to_char(task_state_index(tsk));
 }
 
+#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
+/**
+ * __task_lazy_mmu_mode_active() - Test the lazy MMU mode state for a task.
+ * @tsk: The task to check.
+ *
+ * Test whether @tsk has its lazy MMU mode state set to active (i.e. enabled
+ * and not paused).
+ *
+ * This function only considers the state saved in task_struct; to test whether
+ * current actually is in lazy MMU mode, is_lazy_mmu_mode_active() should be
+ * used instead.
+ *
+ * This function is intended for architectures that implement the lazy MMU
+ * mode; it must not be called from generic code.
+ */
+static inline bool __task_lazy_mmu_mode_active(struct task_struct *tsk)
+{
+	struct lazy_mmu_state *state = &tsk->lazy_mmu_state;
+
+	return state->enable_count > 0 && state->pause_count == 0;
+}
+
+/**
+ * is_lazy_mmu_mode_active() - Test whether we are currently in lazy MMU mode.
+ *
+ * Test whether the current context is in lazy MMU mode. This is true if both:
+ * 1. We are not in interrupt context
+ * 2. Lazy MMU mode is active for the current task
+ *
+ * This function is intended for architectures that implement the lazy MMU
+ * mode; it must not be called from generic code.
+ */
+static inline bool is_lazy_mmu_mode_active(void)
+{
+	if (in_interrupt())
+		return false;
+
+	return __task_lazy_mmu_mode_active(current);
+}
+#endif
+
 extern struct pid *cad_pid;
 
 /*
-- 
2.51.2


