Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23750C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 09:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvMNmUJw5YHbXOAt8Uq/tq9yqI5eyvYGL9Ei7Fvb7sQ=; b=jtLAGiU7p+HcI9eKa37lflbmfq
	lg/j65A+xLrhCQuFfXxdQ8isO/ZnR7Q3mB+wFAdOUE7JgCs22S5d7DIBaLV5A+gp9ENMXPvw/FX8+
	9AyotuqXw93ihTNhCd8KdGr4WT1bcqDQ1CWtP7pnBby5WHsf1EH0oFO7ylVe4RO35+/L4zWxypI0J
	p8B6I8yO7t7ctwqXFYeEW8jvqcbtr4q9PMTfxFlHrBETMvRx6T/ho+3iS2OTyeGPAHIQVK72hiO/B
	j4IICida776PRbBzK9q38HO+R7oGY3QCsWJUIyjcMkF7Edz2G2AJwLesBACFgVXW5TqlYP/zMlavf
	06fbbO6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3B7t-0000000DGj1-03RZ;
	Fri, 11 Apr 2025 09:56:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AWZ-0000000DAr9-119F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 09:18:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A04EC1596;
	Fri, 11 Apr 2025 02:18:10 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A69D3F6A8;
	Fri, 11 Apr 2025 02:18:06 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [RFC PATCH v4 18/18] arm64: mm: Batch kpkeys level switches
Date: Fri, 11 Apr 2025 10:16:31 +0100
Message-ID: <20250411091631.954228-19-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250411091631.954228-1-kevin.brodsky@arm.com>
References: <20250411091631.954228-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_021811_372264_D5A3B7FA 
X-CRM114-Status: GOOD (  21.29  )
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

The kpkeys_hardened_pgtables feature currently switches kpkeys level
in every helper that writes to page tables, such as set_pte(). With
kpkeys implemented using POE, this entails a pair of ISBs whenever
such helper is called.

A simple way to reduce this overhead is to make use of the lazy_mmu
mode, which has recently been adopted on arm64 to batch barriers
(DSB/ISB) when updating kernel pgtables [1]. Reusing the
TIF_LAZY_MMU flag introduced by this series, we amend the
kpkeys_hardened_pgtables guard so that no level switch (i.e. POR_EL1
update) is issued while that flag is set. Instead, we switch to
KPKEYS_LVL_PGTABLES when entering lazy_mmu mode, and restore the
previous level when exiting it.

Restoring the previous kpkeys level requires storing the original
value of POR_EL1 somewhere. This is a full 64-bit value so we cannot
simply use a TIF flag, but since lazy_mmu sections cannot nest, some
sort of thread-local variable would do the trick. There is no
straightforward way to reuse current->thread.por_el1 for that
purpose - this is where the current value of POR_EL1 is stored on a
context switch, i.e. the value corresponding to KPKEYS_LVL_PGTABLES
inside a lazy_mmu section. Instead, we add a new member to
thread_struct to hold that value temporarily. This isn't optimal as
that member is unused outside of lazy_mmu sections, but it is the
simplest option.

A further optimisation this patch makes is to merge the ISBs when
exiting lazy_mmu mode. That is, if an ISB is going to be issued by
emit_pte_barriers() because kernel pgtables were modified in the
lazy_mmu section, we skip the ISB after restoring POR_EL1. This is
done by checking TIF_LAZY_MMU_PENDING and ensuring that POR_EL1 is
restored before emit_pte_barriers() is called.

Checking TIF_LAZY_MMU flag in all pgtable writers is currently
overkill, as lazy_mmu sections are only used at the lowest level of
page tables. In other words, set_pgd() (for instance) will never be
called with TIF_LAZY_MMU set. However, such higher-level helpers are
called relatively infrequently and the overhead of checking a TIF
flag is low. The flag is therefore checked in all cases for
simplicity's sake, just like in [1].

[1] https://lore.kernel.org/linux-mm/20250304150444.3788920-1-ryan.roberts@arm.com/

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable.h   | 37 +++++++++++++++++++++++++++++-
 arch/arm64/include/asm/processor.h |  1 +
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 7929b79cd6b1..61dee76be515 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -43,11 +43,40 @@
 
 #ifdef CONFIG_KPKEYS_HARDENED_PGTABLES
 KPKEYS_GUARD_COND(kpkeys_hardened_pgtables, KPKEYS_LVL_PGTABLES,
-		  kpkeys_hardened_pgtables_enabled())
+		  kpkeys_hardened_pgtables_enabled() &&
+		  !test_thread_flag(TIF_LAZY_MMU))
 #else
 KPKEYS_GUARD_NOOP(kpkeys_hardened_pgtables)
 #endif
 
+static void kpkeys_lazy_mmu_enter(void)
+{
+	if (!kpkeys_hardened_pgtables_enabled())
+		return;
+
+	current->thread.por_el1_lazy_mmu = kpkeys_set_level(KPKEYS_LVL_PGTABLES);
+}
+
+static void kpkeys_lazy_mmu_exit(void)
+{
+	u64 saved_por_el1;
+
+	if (!kpkeys_hardened_pgtables_enabled())
+		return;
+
+	saved_por_el1 = current->thread.por_el1_lazy_mmu;
+
+	/*
+	 * We skip any barrier if TIF_LAZY_MMU_PENDING is set:
+	 * emit_pte_barriers() will issue an ISB just after this function
+	 * returns.
+	 */
+	if (test_thread_flag(TIF_LAZY_MMU_PENDING))
+		__kpkeys_set_pkey_reg_nosync(saved_por_el1);
+	else
+		arch_kpkeys_restore_pkey_reg(saved_por_el1);
+}
+
 static inline void emit_pte_barriers(void)
 {
 	/*
@@ -83,6 +112,7 @@ static inline void arch_enter_lazy_mmu_mode(void)
 	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));
 
 	set_thread_flag(TIF_LAZY_MMU);
+	kpkeys_lazy_mmu_enter();
 }
 
 static inline void arch_flush_lazy_mmu_mode(void)
@@ -93,6 +123,11 @@ static inline void arch_flush_lazy_mmu_mode(void)
 
 static inline void arch_leave_lazy_mmu_mode(void)
 {
+	/*
+	 * The ordering should be preserved to allow kpkeys_lazy_mmu_exit()
+	 * to skip any barrier when TIF_LAZY_MMU_PENDING is set.
+	 */
+	kpkeys_lazy_mmu_exit();
 	arch_flush_lazy_mmu_mode();
 	clear_thread_flag(TIF_LAZY_MMU);
 }
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 0afaf96ca699..14a4b483098d 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -186,6 +186,7 @@ struct thread_struct {
 	u64			tpidr2_el0;
 	u64			por_el0;
 	u64			por_el1;
+	u64			por_el1_lazy_mmu;
 #ifdef CONFIG_ARM64_GCS
 	unsigned int		gcs_el0_mode;
 	unsigned int		gcs_el0_locked;
-- 
2.47.0


