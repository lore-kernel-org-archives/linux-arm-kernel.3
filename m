Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8611FC5B555
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 14:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vXUbl/NjZ4X/g6iEM4SGdrbPxC/g3hPNmbk0yBOW0PM=; b=o4RoHbaq/YbVY7BfVfSpp8kv6m
	ZjCBTewQLDK2t/Kqf1GYYEDMW3XZB588z+cxKZw32kr2AKg42lC5GVYlDzce10EVech6TFgQIWXGG
	SgyTFMqJ86ZLDcDTNuGo8vgf7COedbm0MuJFXphCZ8eSC34PLTfRxOtlRhQDz+IqVt4JehDRY7/Cn
	/wrrW6KU78+mAWI+jTjFI/ETd9BJV+qcCxNWMUvkClCT+MZpZ/1om+ZxS5yETvjljKyU8eTer8DmO
	sAdQzAlE19FESxuOlVAMXTD+KPukqvIGPaozRFKAUzgxudeZuSg+cWkU2+EL9Nm3SASlqyO9pmpcP
	10lDCUhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXeD-00000000OkO-1rGu;
	Fri, 06 Jun 2025 14:02:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXZB-00000000O2T-2IbN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 13:57:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA1F9152B;
	Fri,  6 Jun 2025 06:56:44 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6CDD3F673;
	Fri,  6 Jun 2025 06:57:01 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64/mm: Ensure lazy_mmu_mode never nests
Date: Fri,  6 Jun 2025 14:56:52 +0100
Message-ID: <20250606135654.178300-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_065705_672709_3255873B 
X-CRM114-Status: GOOD (  19.97  )
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

Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
provided a quick fix to ensure that lazy_mmu_mode continues to work when
CONFIG_DEBUG_PAGEALLOC is enabled, which can cause lazy_mmu_mode to
nest.

The solution in that patch is the make the implementation tolerant to
nesting; when the inner nest exits lazy_mmu_mode, we exit then the outer
exit becomes a nop. But this sacrifices the optimization opportunity for
the remainder of the outer user.

So let's take a different approach and simply ensure the nesting never
happens in the first place. The nesting is caused when the page
allocator calls out to __kernel_map_pages() which then eventually calls
apply_to_page_range(), which calls arch_enter_lazy_mmu_mode(). So simply
notice if we are in lazy_mmu_mode in __kernel_map_pages() and
temporarily exit.

With that approach, we can effectively revert Commit 1ef3095b1405
("arm64/mm: Permit lazy_mmu_mode to be nested"), re-enabling the VM_WARN
if we ever detect nesting in future.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---

I wonder if you might be willing to take this for v6.16? I think its a neater
solution then my first attempt - Commit 1ef3095b1405 ("arm64/mm: Permit
lazy_mmu_mode to be nested") - which is already in Linus's master.

To be clear, the current solution is safe, I just think this is much neater.

Applies on today's master branch (e271ed52b344).

Thanks,
Ryan

 arch/arm64/include/asm/pgtable.h | 22 ++++++++++------------
 arch/arm64/mm/pageattr.c         | 23 +++++++++++++++++------
 2 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 88db8a0c0b37..9f387337ccc3 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -83,21 +83,11 @@ static inline void queue_pte_barriers(void)
 #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
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

+	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));
+
 	set_thread_flag(TIF_LAZY_MMU);
 }

@@ -119,6 +109,14 @@ static inline void arch_leave_lazy_mmu_mode(void)
 	clear_thread_flag(TIF_LAZY_MMU);
 }

+static inline bool arch_in_lazy_mmu_mode(void)
+{
+	if (in_interrupt())
+		return false;
+
+	return test_thread_flag(TIF_LAZY_MMU);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 04d4a8f676db..4da7a847d5f3 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -293,18 +293,29 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 }

 #ifdef CONFIG_DEBUG_PAGEALLOC
-/*
- * This is - apart from the return value - doing the same
- * thing as the new set_direct_map_valid_noflush() function.
- *
- * Unify? Explain the conceptual differences?
- */
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
+	bool lazy_mmu;
+
 	if (!can_set_direct_map())
 		return;

+	/*
+	 * This is called during page alloc or free, and maybe called while in
+	 * lazy mmu mode. Since set_memory_valid() may also enter lazy mmu mode,
+	 * this would cause nesting which is not supported; the inner call to
+	 * exit the mode would exit, meaning that the outer lazy mmu mode is no
+	 * longer benefiting from the optimization. So temporarily leave lazy
+	 * mmu mode for the duration of the call.
+	 */
+	lazy_mmu = arch_in_lazy_mmu_mode();
+	if (lazy_mmu)
+		arch_leave_lazy_mmu_mode();
+
 	set_memory_valid((unsigned long)page_address(page), numpages, enable);
+
+	if (lazy_mmu)
+		arch_enter_lazy_mmu_mode();
 }
 #endif /* CONFIG_DEBUG_PAGEALLOC */

--
2.43.0


