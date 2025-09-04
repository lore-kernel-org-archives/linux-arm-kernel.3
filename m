Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10576CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWQ/OmD9CmpzqUNR8GfFlqWGjLcl1VDbFZ1Nh40eC1w=; b=ZOcMXa5nhZQWUOQuIvH3aXSPgN
	f4w7+YRmzWo2Gzj3RtjEeKPSY4UGDtDUP073MPXr7UfhPW3yaRnsQNm9SbDncnr/2xvxWvNdpaqtg
	QE65FgkKpk4yi1TyhQaEAYvVFSDyDP4WI92RWh08gtlTlw+qajZFixdW9yeEO3kVqVISWsRxPJcap
	m9IPALUAAJu+ePx6ZL9izT4ae6FGyPON9EDqLDI4BPCcgul/6HgHAgv6C5+xXSRvo7F4Y+vyBU/u6
	76dKV092dWADqrPv3j9EvDgGCRMusLKMR6W3qtFpfAU/CgtfnILLNTA2+Jwq8O65lB77oT5ZN7odA
	arPASXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCld-0000000Cr9w-3Y5I;
	Thu, 04 Sep 2025 16:24:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9Xm-0000000BiaS-0hgH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:58:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 741D025E0;
	Thu,  4 Sep 2025 05:58:17 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44AD33F6A8;
	Thu,  4 Sep 2025 05:58:21 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/7] mm: remove arch_flush_lazy_mmu_mode()
Date: Thu,  4 Sep 2025 13:57:30 +0100
Message-ID: <20250904125736.3918646-2-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250904125736.3918646-1-kevin.brodsky@arm.com>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_055826_282213_A61EBBE2 
X-CRM114-Status: GOOD (  15.13  )
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

This function has only ever been used in arch/x86, so there is no
need for other architectures to implement it. Remove it from
linux/pgtable.h and all architectures besides x86.

The arm64 implementation is not empty but it is only called from
arch_leave_lazy_mmu_mode(), so we can simply fold it there.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable.h                   | 9 +--------
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 2 --
 arch/sparc/include/asm/tlbflush_64.h               | 1 -
 arch/x86/include/asm/pgtable.h                     | 3 ++-
 include/linux/pgtable.h                            | 1 -
 5 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index abd2dee416b3..728d7b6ed20a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -101,21 +101,14 @@ static inline void arch_enter_lazy_mmu_mode(void)
 	set_thread_flag(TIF_LAZY_MMU);
 }
 
-static inline void arch_flush_lazy_mmu_mode(void)
+static inline void arch_leave_lazy_mmu_mode(void)
 {
 	if (in_interrupt())
 		return;
 
 	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
 		emit_pte_barriers();
-}
-
-static inline void arch_leave_lazy_mmu_mode(void)
-{
-	if (in_interrupt())
-		return;
 
-	arch_flush_lazy_mmu_mode();
 	clear_thread_flag(TIF_LAZY_MMU);
 }
 
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 146287d9580f..176d7fd79eeb 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -55,8 +55,6 @@ static inline void arch_leave_lazy_mmu_mode(void)
 	preempt_enable();
 }
 
-#define arch_flush_lazy_mmu_mode()      do {} while (0)
-
 extern void hash__tlbiel_all(unsigned int action);
 
 extern void flush_hash_page(unsigned long vpn, real_pte_t pte, int psize,
diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
index 8b8cdaa69272..cd144eb31bdd 100644
--- a/arch/sparc/include/asm/tlbflush_64.h
+++ b/arch/sparc/include/asm/tlbflush_64.h
@@ -44,7 +44,6 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 void flush_tlb_pending(void);
 void arch_enter_lazy_mmu_mode(void);
 void arch_leave_lazy_mmu_mode(void);
-#define arch_flush_lazy_mmu_mode()      do {} while (0)
 
 /* Local cpu only.  */
 void __flush_tlb_all(void);
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index e33df3da6980..14fd672bc9b2 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -117,7 +117,8 @@ extern pmdval_t early_pmd_flags;
 #define pte_val(x)	native_pte_val(x)
 #define __pte(x)	native_make_pte(x)
 
-#define arch_end_context_switch(prev)	do {} while(0)
+#define arch_end_context_switch(prev)	do {} while (0)
+#define arch_flush_lazy_mmu_mode()	do {} while (0)
 #endif	/* CONFIG_PARAVIRT_XXL */
 
 static inline pmd_t pmd_set_flags(pmd_t pmd, pmdval_t set)
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 4c035637eeb7..8848e132a6be 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -234,7 +234,6 @@ static inline int pmd_dirty(pmd_t pmd)
 #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 #define arch_enter_lazy_mmu_mode()	do {} while (0)
 #define arch_leave_lazy_mmu_mode()	do {} while (0)
-#define arch_flush_lazy_mmu_mode()	do {} while (0)
 #endif
 
 #ifndef pte_batch_hint
-- 
2.47.0


