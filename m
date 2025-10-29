Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9C1CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1WYke7yUdTWbw26Vtz0uNRFVp3PKYDfCjn5IuHDAks=; b=W4o+8jqJjgtenbQbfqPDEvvhRa
	0q3OTw6nIqyddfXHf3DCq5SIcSZuEAtLiK34m5X6NxiyklcW5PIkrV0IbbKNcTgVv61V4e71+kgWD
	HVkM0J6hQLPC+ReGhn/48xuh19mKq5AgjF5GvUeFkcb/r7obasuZzRqp4cueJ3q7ywzvBKOQNgDIc
	J85Y0h3ht7hQWq5PLAIYt9EonnDBX/MehPEA1uKRHU96tU+QHLgQ0IJ2+dEw6njs+A8agf2HvhJzg
	CScGgfpx+u/v7QW5Vlm1ZHtcuFoeCX9d3e+qMKC9zuVBrOeV7iFDInXhfafP311QCOJGDBt9NJ2px
	pr+9krUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE38j-00000000eRw-2JyA;
	Wed, 29 Oct 2025 10:10:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE38Z-00000000eHY-1Pdf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:10:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECC152BCC;
	Wed, 29 Oct 2025 03:10:30 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DACF93F66E;
	Wed, 29 Oct 2025 03:10:33 -0700 (PDT)
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
Subject: [PATCH v4 09/12] powerpc/mm: replace batch->active with in_lazy_mmu_mode()
Date: Wed, 29 Oct 2025 10:09:06 +0000
Message-ID: <20251029100909.3381140-10-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251029100909.3381140-1-kevin.brodsky@arm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_031039_555058_6E80CC89 
X-CRM114-Status: GOOD (  15.65  )
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

A per-CPU batch struct is activated when entering lazy MMU mode; its
lifetime is the same as the lazy MMU section (it is deactivated when
leaving the mode). Preemption is disabled in that interval to ensure
that the per-CPU reference remains valid.

The generic lazy_mmu layer now tracks whether a task is in lazy MMU
mode. We can therefore use the generic helper in_lazy_mmu_mode()
to tell whether a batch struct is active instead of tracking it
explicitly.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 9 ---------
 arch/powerpc/mm/book3s64/hash_tlb.c                | 2 +-
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 623a8a8b2d0e..bbc54690d374 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -12,7 +12,6 @@
 #define PPC64_TLB_BATCH_NR 192
 
 struct ppc64_tlb_batch {
-	int			active;
 	unsigned long		index;
 	struct mm_struct	*mm;
 	real_pte_t		pte[PPC64_TLB_BATCH_NR];
@@ -26,8 +25,6 @@ extern void __flush_tlb_pending(struct ppc64_tlb_batch *batch);
 
 static inline void arch_enter_lazy_mmu_mode(void)
 {
-	struct ppc64_tlb_batch *batch;
-
 	if (radix_enabled())
 		return;
 	/*
@@ -35,8 +32,6 @@ static inline void arch_enter_lazy_mmu_mode(void)
 	 * operating on kernel page tables.
 	 */
 	preempt_disable();
-	batch = this_cpu_ptr(&ppc64_tlb_batch);
-	batch->active = 1;
 }
 
 static inline void arch_flush_lazy_mmu_mode(void)
@@ -51,14 +46,10 @@ static inline void arch_flush_lazy_mmu_mode(void)
 
 static inline void arch_leave_lazy_mmu_mode(void)
 {
-	struct ppc64_tlb_batch *batch;
-
 	if (radix_enabled())
 		return;
-	batch = this_cpu_ptr(&ppc64_tlb_batch);
 
 	arch_flush_lazy_mmu_mode();
-	batch->active = 0;
 	preempt_enable();
 }
 
diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
index 787f7a0e27f0..72b83f582b6d 100644
--- a/arch/powerpc/mm/book3s64/hash_tlb.c
+++ b/arch/powerpc/mm/book3s64/hash_tlb.c
@@ -100,7 +100,7 @@ void hpte_need_flush(struct mm_struct *mm, unsigned long addr,
 	 * Check if we have an active batch on this CPU. If not, just
 	 * flush now and return.
 	 */
-	if (!batch->active) {
+	if (!in_lazy_mmu_mode()) {
 		flush_hash_page(vpn, rpte, psize, ssize, mm_is_thread_local(mm));
 		put_cpu_var(ppc64_tlb_batch);
 		return;
-- 
2.47.0


