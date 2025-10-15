Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9879DCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIunMov0D4cAh3NWLlfGoDvkKo6/ouQfl7dX2jhJDdQ=; b=Z3CUhLz8pKf9Rcz4YVbBCDL92U
	LuEI1gdc6UbTa2nJC1ttFjgjnFT3hvF8xulY96zZsP9x8vk893Y6+n4e1Uk+fSkSuBvHtmJs8Pz52
	1wdbzzOExfScSZLc834p0MyOoOqfReYBqIfXWoZ7b3eK6DOH5L9b6f8e/Ur11egl38PvYZQdtLkJs
	tCGQ1iFROqHRrNUtVPBC6jhs8mYfe9XCXjQ3Rpj4eBYoQNBEZMWTgA0TuI9mn8eNi+fDTvX/LiPJD
	itfoH3KjO5fR3PZJnUoP13Q6Qt7YZghYKAyYfZdmX5fV/9ICzeVOPUM0MjlmCKoGZA/c1MgTIduKs
	+XFemsSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wrj-00000000ubD-2fLq;
	Wed, 15 Oct 2025 08:28:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wrh-00000000uZT-3j9t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 08:28:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82ADC22FA;
	Wed, 15 Oct 2025 01:28:01 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 801C23F66E;
	Wed, 15 Oct 2025 01:28:04 -0700 (PDT)
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
Subject: [PATCH v3 05/13] mm: introduce CONFIG_ARCH_LAZY_MMU
Date: Wed, 15 Oct 2025 09:27:19 +0100
Message-ID: <20251015082727.2395128-6-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251015082727.2395128-1-kevin.brodsky@arm.com>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_012810_016747_FECE9509 
X-CRM114-Status: GOOD (  17.31  )
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

Architectures currently opt in for implementing lazy_mmu helpers by
defining __HAVE_ARCH_ENTER_LAZY_MMU_MODE.

In preparation for introducing a generic lazy_mmu layer that will
require storage in task_struct, let's switch to a cleaner approach:
instead of defining a macro, select a CONFIG option.

This patch introduces CONFIG_ARCH_LAZY_MMU and has each arch select
it when it implements lazy_mmu helpers.
__HAVE_ARCH_ENTER_LAZY_MMU_MODE is removed and <linux/pgtable.h>
relies on the new CONFIG instead.

On x86, lazy_mmu helpers are only implemented if PARAVIRT_XXL is
selected. This creates some complications in arch/x86/boot/, because
a few files manually undefine PARAVIRT* options. As a result
<asm/paravirt.h> does not define the lazy_mmu helpers, but this
breaks the build as <linux/pgtable.h> only defines them if
!CONFIG_ARCH_LAZY_MMU. There does not seem to be a clean way out of
this - let's just undefine that new CONFIG too.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/Kconfig                                 | 1 +
 arch/arm64/include/asm/pgtable.h                   | 1 -
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 2 --
 arch/powerpc/platforms/Kconfig.cputype             | 1 +
 arch/sparc/Kconfig                                 | 1 +
 arch/sparc/include/asm/tlbflush_64.h               | 2 --
 arch/x86/Kconfig                                   | 1 +
 arch/x86/boot/compressed/misc.h                    | 1 +
 arch/x86/boot/startup/sme.c                        | 1 +
 arch/x86/include/asm/paravirt.h                    | 1 -
 include/linux/pgtable.h                            | 2 +-
 mm/Kconfig                                         | 3 +++
 12 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6663ffd23f25..12d47a5f5e56 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -122,6 +122,7 @@ config ARM64
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
 	select ARCH_HAS_UBSAN
+	select ARCH_LAZY_MMU
 	select ARM_AMBA
 	select ARM_ARCH_TIMER
 	select ARM_GIC
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index aa89c2e67ebc..e3cbb10288c4 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -80,7 +80,6 @@ static inline void queue_pte_barriers(void)
 	}
 }
 
-#define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 static inline void arch_enter_lazy_mmu_mode(void)
 {
 	/*
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 7704dbe8e88d..623a8a8b2d0e 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -24,8 +24,6 @@ DECLARE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
 
 extern void __flush_tlb_pending(struct ppc64_tlb_batch *batch);
 
-#define __HAVE_ARCH_ENTER_LAZY_MMU_MODE
-
 static inline void arch_enter_lazy_mmu_mode(void)
 {
 	struct ppc64_tlb_batch *batch;
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 7b527d18aa5e..a5e06aaf19cd 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -93,6 +93,7 @@ config PPC_BOOK3S_64
 	select IRQ_WORK
 	select PPC_64S_HASH_MMU if !PPC_RADIX_MMU
 	select KASAN_VMALLOC if KASAN
+	select ARCH_LAZY_MMU
 
 config PPC_BOOK3E_64
 	bool "Embedded processors"
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index a630d373e645..59f17996a353 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -112,6 +112,7 @@ config SPARC64
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
 	select ARCH_SUPPORTS_SCHED_SMT if SMP
 	select ARCH_SUPPORTS_SCHED_MC  if SMP
+	select ARCH_LAZY_MMU
 
 config ARCH_PROC_KCORE_TEXT
 	def_bool y
diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
index 925bb5d7a4e1..4e1036728e2f 100644
--- a/arch/sparc/include/asm/tlbflush_64.h
+++ b/arch/sparc/include/asm/tlbflush_64.h
@@ -39,8 +39,6 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
 
 void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 
-#define __HAVE_ARCH_ENTER_LAZY_MMU_MODE
-
 void flush_tlb_pending(void);
 void arch_enter_lazy_mmu_mode(void);
 void arch_flush_lazy_mmu_mode(void);
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index fa3b616af03a..85de037cad8c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -804,6 +804,7 @@ config PARAVIRT
 config PARAVIRT_XXL
 	bool
 	depends on X86_64
+	select ARCH_LAZY_MMU
 
 config PARAVIRT_DEBUG
 	bool "paravirt-ops debugging"
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index db1048621ea2..80b3b79a1001 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -11,6 +11,7 @@
 #undef CONFIG_PARAVIRT
 #undef CONFIG_PARAVIRT_XXL
 #undef CONFIG_PARAVIRT_SPINLOCKS
+#undef CONFIG_ARCH_LAZY_MMU
 #undef CONFIG_KASAN
 #undef CONFIG_KASAN_GENERIC
 
diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
index e7ea65f3f1d6..af74d09b68bc 100644
--- a/arch/x86/boot/startup/sme.c
+++ b/arch/x86/boot/startup/sme.c
@@ -24,6 +24,7 @@
 #undef CONFIG_PARAVIRT
 #undef CONFIG_PARAVIRT_XXL
 #undef CONFIG_PARAVIRT_SPINLOCKS
+#undef CONFIG_ARCH_LAZY_MMU
 
 /*
  * This code runs before CPU feature bits are set. By default, the
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index b5e59a7ba0d0..13f9cd31c8f8 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -526,7 +526,6 @@ static inline void arch_end_context_switch(struct task_struct *next)
 	PVOP_VCALL1(cpu.end_context_switch, next);
 }
 
-#define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 static inline void arch_enter_lazy_mmu_mode(void)
 {
 	PVOP_VCALL0(mmu.lazy_mode.enter);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 32e8457ad535..124d5fa2975f 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -231,7 +231,7 @@ static inline int pmd_dirty(pmd_t pmd)
  * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
  * and the mode cannot be used in interrupt context.
  */
-#ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
+#ifndef CONFIG_ARCH_LAZY_MMU
 static inline void arch_enter_lazy_mmu_mode(void) {}
 static inline void arch_leave_lazy_mmu_mode(void) {}
 static inline void arch_flush_lazy_mmu_mode(void) {}
diff --git a/mm/Kconfig b/mm/Kconfig
index 0e26f4fc8717..2fdcb42ca1a1 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1372,6 +1372,9 @@ config PT_RECLAIM
 config FIND_NORMAL_PAGE
 	def_bool n
 
+config ARCH_LAZY_MMU
+	bool
+
 source "mm/damon/Kconfig"
 
 endmenu
-- 
2.47.0


