Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5E4CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Oc2Kn+68+9BJj/EDaEdJiag5mR/bu1km+1hhaHUolU=; b=MiToBgGh968D3OHbvq4FlrbpS5
	YKvXTwzWzANnUoJYIKhtxSBx3gry1hxKgW14YWpixUxUMigmA+Fxq6yyO3XhQudOVEdQaoY+dNsw9
	Yog8BQqQagXugiz+hyzd20efk9HsuVsMKSsP0InEH7IrmFZ9XESqMSU12DZ8lP/MGFfBQNmgB2zI9
	3K8dcHjeFIOrEb5pH5xx4owS/gWvVl13eMMHg5VDB9E2Ug6gpiZPrmEwGX5/kU//Nzjbp2YXhrn+2
	ynhXIGV7qAR2ZjE0Vtb3EuO6OZXsBV0ZAUpkITfgQCyRWxZGdzpaM7nlU5AqChyw4XHg7o9OPWMJu
	H5IiramQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wsS-00000000vSf-0B3X;
	Wed, 15 Oct 2025 08:28:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wsP-00000000vPY-0t9U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 08:28:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3A1E2379;
	Wed, 15 Oct 2025 01:28:44 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF2653F66E;
	Wed, 15 Oct 2025 01:28:47 -0700 (PDT)
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
Subject: [PATCH v3 13/13] mm: introduce arch_wants_lazy_mmu_mode()
Date: Wed, 15 Oct 2025 09:27:27 +0100
Message-ID: <20251015082727.2395128-14-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251015082727.2395128-1-kevin.brodsky@arm.com>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_012853_391628_9FD78754 
X-CRM114-Status: GOOD (  15.33  )
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

powerpc decides at runtime whether the lazy MMU mode should be used.

To avoid the overhead associated with managing
task_struct::lazy_mmu_state if the mode isn't used, introduce
arch_wants_lazy_mmu_mode() and bail out of lazy_mmu_mode_* if it
returns false. Add a default definition returning true, and an
appropriate implementation for powerpc.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
This patch seemed like a good idea to start with, but now I'm not so
sure that the churn added to the generic layer is worth it.

It provides a minor optimisation for just powerpc. x86 with XEN_PV also
chooses at runtime whether to implement lazy_mmu helpers or not, but
it doesn't fit this API so neatly and isn't handled here.
---
 .../include/asm/book3s/64/tlbflush-hash.h        | 11 ++++++-----
 include/linux/pgtable.h                          | 16 ++++++++++++----
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index bbc54690d374..a91b354cf87c 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -23,10 +23,14 @@ DECLARE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
 
 extern void __flush_tlb_pending(struct ppc64_tlb_batch *batch);
 
+#define arch_wants_lazy_mmu_mode arch_wants_lazy_mmu_mode
+static inline bool arch_wants_lazy_mmu_mode(void)
+{
+	return !radix_enabled();
+}
+
 static inline void arch_enter_lazy_mmu_mode(void)
 {
-	if (radix_enabled())
-		return;
 	/*
 	 * apply_to_page_range can call us this preempt enabled when
 	 * operating on kernel page tables.
@@ -46,9 +50,6 @@ static inline void arch_flush_lazy_mmu_mode(void)
 
 static inline void arch_leave_lazy_mmu_mode(void)
 {
-	if (radix_enabled())
-		return;
-
 	arch_flush_lazy_mmu_mode();
 	preempt_enable();
 }
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 718c9c788114..db4f388d2a16 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -261,11 +261,19 @@ static inline int pmd_dirty(pmd_t pmd)
  * currently enabled.
  */
 #ifdef CONFIG_ARCH_LAZY_MMU
+
+#ifndef arch_wants_lazy_mmu_mode
+static inline bool arch_wants_lazy_mmu_mode(void)
+{
+	return true;
+}
+#endif
+
 static inline void lazy_mmu_mode_enable(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
-	if (in_interrupt())
+	if (!arch_wants_lazy_mmu_mode() || in_interrupt())
 		return;
 
 	VM_BUG_ON(state->count == U8_MAX);
@@ -283,7 +291,7 @@ static inline void lazy_mmu_mode_disable(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
-	if (in_interrupt())
+	if (!arch_wants_lazy_mmu_mode() || in_interrupt())
 		return;
 
 	VM_BUG_ON(state->count == 0);
@@ -303,7 +311,7 @@ static inline void lazy_mmu_mode_pause(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
-	if (in_interrupt())
+	if (!arch_wants_lazy_mmu_mode() || in_interrupt())
 		return;
 
 	VM_WARN_ON(state->count == 0 || !state->enabled);
@@ -316,7 +324,7 @@ static inline void lazy_mmu_mode_resume(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
-	if (in_interrupt())
+	if (!arch_wants_lazy_mmu_mode() || in_interrupt())
 		return;
 
 	VM_WARN_ON(state->count == 0 || state->enabled);
-- 
2.47.0


