Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01498CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxy2WR9jIOFdN7YJmtvFh7KSjx/WBbD3EHjVYsBnWoI=; b=ho6hzOPUVLv4xRM1UhFF22LWg2
	m3OxUD0Dk/wTenmf7JhvO+XGH6HHnu/ZfkqIGhsc6T4nslRTFUlbka0BwSvjqHCPlxbzXHgSRXBvS
	5uXZMMWiquvOG7ADPzDrnttMVPvVyUJIx2eQ3PWjkoa6yZXWXu+49wFApgZkNphRvGYyTBSEhD1YT
	ip4jfOJ+ndOVJfsaKUZG1+OV+ivrHOIXRNyd38xai7QKY5h+cSXW9rYJ7g7vqWjZ30/9HC1kPj/9V
	xrNF9v/r6OFxAPo+q7nSHkOOhdZAAdT0rP0595iLVWNinrauc+3a+btBqh4okPP+Mz6d1IBHEljLX
	iBpBKVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wsN-00000000vNj-336W;
	Wed, 15 Oct 2025 08:28:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wsJ-00000000vIW-3koa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 08:28:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78DF9236D;
	Wed, 15 Oct 2025 01:28:39 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 754613F66E;
	Wed, 15 Oct 2025 01:28:42 -0700 (PDT)
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
Subject: [PATCH v3 12/13] mm: bail out of lazy_mmu_mode_* in interrupt context
Date: Wed, 15 Oct 2025 09:27:26 +0100
Message-ID: <20251015082727.2395128-13-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251015082727.2395128-1-kevin.brodsky@arm.com>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_012848_045182_378E6FA7 
X-CRM114-Status: GOOD (  18.21  )
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

The lazy MMU mode cannot be used in interrupt context. This is
documented in <linux/pgtable.h>, but isn't consistently handled
across architectures.

arm64 ensures that calls to lazy_mmu_mode_* have no effect in
interrupt context, because such calls do occur in certain
configurations - see commit b81c688426a9 ("arm64/mm: Disable barrier
batching in interrupt contexts"). Other architectures do not check
this situation, most likely because it hasn't occurred so far.

Both arm64 and x86/Xen also ensure that any lazy MMU optimisation is
disabled while in interrupt mode (see queue_pte_barriers() and
xen_get_lazy_mode() respectively).

Let's handle this in the new generic lazy_mmu layer, in the same
fashion as arm64: bail out of lazy_mmu_mode_* if in_interrupt(), and
have in_lazy_mmu_mode() return false to disable any optimisation.
Also remove the arm64 handling that is now redundant; x86/Xen has
its own internal tracking so it is left unchanged.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 17 +----------------
 include/linux/pgtable.h          | 16 ++++++++++++++--
 include/linux/sched.h            |  3 +++
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 944e512767db..a37f417c30be 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -62,37 +62,22 @@ static inline void emit_pte_barriers(void)
 
 static inline void queue_pte_barriers(void)
 {
-	if (in_interrupt()) {
-		emit_pte_barriers();
-		return;
-	}
-
 	if (in_lazy_mmu_mode())
 		test_and_set_thread_flag(TIF_LAZY_MMU_PENDING);
 	else
 		emit_pte_barriers();
 }
 
-static inline void arch_enter_lazy_mmu_mode(void)
-{
-	if (in_interrupt())
-		return;
-}
+static inline void arch_enter_lazy_mmu_mode(void) {}
 
 static inline void arch_flush_lazy_mmu_mode(void)
 {
-	if (in_interrupt())
-		return;
-
 	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
 		emit_pte_barriers();
 }
 
 static inline void arch_leave_lazy_mmu_mode(void)
 {
-	if (in_interrupt())
-		return;
-
 	arch_flush_lazy_mmu_mode();
 }
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 269225a733de..718c9c788114 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -228,8 +228,8 @@ static inline int pmd_dirty(pmd_t pmd)
  * of the lazy mode. So the implementation must assume preemption may be enabled
  * and cpu migration is possible; it must take steps to be robust against this.
  * (In practice, for user PTE updates, the appropriate page table lock(s) are
- * held, but for kernel PTE updates, no lock is held). The mode cannot be used
- * in interrupt context.
+ * held, but for kernel PTE updates, no lock is held). The mode is disabled
+ * in interrupt context and calls to the lazy_mmu API have no effect.
  *
  * The lazy MMU mode is enabled for a given block of code using:
  *
@@ -265,6 +265,9 @@ static inline void lazy_mmu_mode_enable(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
+	if (in_interrupt())
+		return;
+
 	VM_BUG_ON(state->count == U8_MAX);
 	/* enable() must not be called while paused */
 	VM_WARN_ON(state->count > 0 && !state->enabled);
@@ -280,6 +283,9 @@ static inline void lazy_mmu_mode_disable(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
+	if (in_interrupt())
+		return;
+
 	VM_BUG_ON(state->count == 0);
 	VM_WARN_ON(!state->enabled);
 
@@ -297,6 +303,9 @@ static inline void lazy_mmu_mode_pause(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
+	if (in_interrupt())
+		return;
+
 	VM_WARN_ON(state->count == 0 || !state->enabled);
 
 	state->enabled = false;
@@ -307,6 +316,9 @@ static inline void lazy_mmu_mode_resume(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
+	if (in_interrupt())
+		return;
+
 	VM_WARN_ON(state->count == 0 || state->enabled);
 
 	arch_enter_lazy_mmu_mode();
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 2862d8bf2160..beb3e6cfddd9 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1731,6 +1731,9 @@ static inline char task_state_to_char(struct task_struct *tsk)
 #ifdef CONFIG_ARCH_LAZY_MMU
 static inline bool in_lazy_mmu_mode(void)
 {
+	if (in_interrupt())
+		return false;
+
 	return current->lazy_mmu_state.enabled;
 }
 #else
-- 
2.47.0


