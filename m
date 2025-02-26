Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83512C18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=do4WI8d05U/vDH7jtx03ci45kmkfuV+9e1R7i7Dpz8M=; b=F8It8rwLT5mzB9TpF92XPq5emF
	fkSHrpxeRs58YRmAJKMNSOs8A8Ki+Wkxa9UZ5+6YuSJ1ZnqDsg8lnD0+9aoOvGoTe2hU9Gc9h+AEg
	CHbqp0m6P7XQvtuuGojQhl5AjoUW1x1U+525SivYMuD6UwEEYxkM9UNbTuNsMpImUcj+ZzGrd6h7V
	Gw/KSrWLclRDwTWbZ3tbe3AG/KP3IcWCpNOskSiopNeFFaliaZIB4j7bNGrWHZ4+mJwKt0zgfEPnu
	mvPTG4q3hLJPk5iCspXhWZBAsie0ZmhI7SSKvfZL14jm5o0Ujl29Ss8W27JilKP/UpVqWGN0xFvB/
	DBPIKGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHRw-00000003tXU-3fW4;
	Wed, 26 Feb 2025 13:27:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGT6-00000003fdY-1ag8;
	Wed, 26 Feb 2025 12:24:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFA742BC0;
	Wed, 26 Feb 2025 04:25:07 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.40.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A5B7F3F5A1;
	Wed, 26 Feb 2025 04:24:44 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Subject: [PATCH V3 5/5] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
Date: Wed, 26 Feb 2025 17:54:04 +0530
Message-Id: <20250226122404.1927473-6-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226122404.1927473-1-anshuman.khandual@arm.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_042452_501474_94085753 
X-CRM114-Status: GOOD (  17.55  )
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

Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
is confusing as they sound very similar and does not differentiate between
platform's feature subscription and feature enablement for ptdump. Rename
the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
readability.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: kvmarm@lists.linux.dev
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-mm@kvack.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/Kconfig              |  2 +-
 arch/arm64/include/asm/ptdump.h |  4 ++--
 arch/arm64/kvm/Kconfig          |  4 ++--
 arch/arm64/mm/Makefile          |  2 +-
 arch/powerpc/Kconfig            |  2 +-
 arch/powerpc/mm/Makefile        |  2 +-
 arch/riscv/Kconfig              |  2 +-
 arch/riscv/mm/Makefile          |  2 +-
 arch/s390/Kconfig               |  2 +-
 arch/s390/mm/Makefile           |  2 +-
 arch/x86/Kconfig                |  2 +-
 arch/x86/Kconfig.debug          |  2 +-
 arch/x86/mm/Makefile            |  2 +-
 mm/Kconfig.debug                | 12 ++++++------
 mm/Makefile                     |  2 +-
 15 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 940343beb3d4..5cf688ee01b7 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -41,6 +41,7 @@ config ARM64
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_NONLEAF_PMD_YOUNG if ARM64_HAFT
+	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_DEVMAP
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_HW_PTE_YOUNG
@@ -157,7 +158,6 @@ config ARM64
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select GENERIC_PCI_IOMAP
-	select GENERIC_PTDUMP
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
index 6cf4aae05219..b2931d1ae0fb 100644
--- a/arch/arm64/include/asm/ptdump.h
+++ b/arch/arm64/include/asm/ptdump.h
@@ -7,7 +7,7 @@
 
 #include <linux/ptdump.h>
 
-#ifdef CONFIG_PTDUMP_CORE
+#ifdef CONFIG_PTDUMP
 
 #include <linux/mm_types.h>
 #include <linux/seq_file.h>
@@ -70,6 +70,6 @@ static inline void ptdump_debugfs_register(struct ptdump_info *info,
 #else
 static inline void note_page(struct ptdump_state *pt_st, unsigned long addr,
 			     int level, u64 val) { }
-#endif /* CONFIG_PTDUMP_CORE */
+#endif /* CONFIG_PTDUMP */
 
 #endif /* __ASM_PTDUMP_H */
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index ead632ad01b4..096e45acadb2 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -71,8 +71,8 @@ config PTDUMP_STAGE2_DEBUGFS
 	depends on KVM
 	depends on DEBUG_KERNEL
 	depends on DEBUG_FS
-	depends on GENERIC_PTDUMP
-	select PTDUMP_CORE
+	depends on ARCH_HAS_PTDUMP
+	select PTDUMP
 	default n
 	help
 	  Say Y here if you want to show the stage-2 kernel pagetables
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index fc92170a8f37..c26489cf96cd 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -5,7 +5,7 @@ obj-y				:= dma-mapping.o extable.o fault.o init.o \
 				   context.o proc.o pageattr.o fixmap.o
 obj-$(CONFIG_ARM64_CONTPTE)	+= contpte.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
-obj-$(CONFIG_PTDUMP_CORE)	+= ptdump.o
+obj-$(CONFIG_PTDUMP)		+= ptdump.o
 obj-$(CONFIG_PTDUMP_DEBUGFS)	+= ptdump_debugfs.o
 obj-$(CONFIG_TRANS_TABLE)	+= trans_pgd.o
 obj-$(CONFIG_TRANS_TABLE)	+= trans_pgd-asm.o
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 424f188e62d9..6f1ae41dcf85 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -148,6 +148,7 @@ config PPC
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_PMEM_API
 	select ARCH_HAS_PREEMPT_LAZY
+	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_DEVMAP		if PPC_BOOK3S_64
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
@@ -206,7 +207,6 @@ config PPC
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_PCI_IOMAP		if PCI
-	select GENERIC_PTDUMP
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_VDSO_TIME_NS
diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index 0fe2f085c05a..8c1582b2987d 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -15,5 +15,5 @@ obj-$(CONFIG_NUMA) += numa.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_NOT_COHERENT_CACHE) += dma-noncoherent.o
 obj-$(CONFIG_PPC_COPRO_BASE)	+= copro_fault.o
-obj-$(CONFIG_PTDUMP_CORE)	+= ptdump/
+obj-$(CONFIG_PTDUMP)		+= ptdump/
 obj-$(CONFIG_KASAN)		+= kasan/
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..353cf41d01f4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -43,6 +43,7 @@ config RISCV
 	select ARCH_HAS_PMEM_API
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
+	select ARCH_HAS_PTDUMP if MMU
 	select ARCH_HAS_PTE_DEVMAP if 64BIT && MMU
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SET_DIRECT_MAP if MMU
@@ -112,7 +113,6 @@ config RISCV
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select GENERIC_PCI_IOMAP
-	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index cbe4d775ef56..b916a68d324a 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -19,7 +19,7 @@ obj-y += context.o
 obj-y += pmem.o
 
 obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
-obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
+obj-$(CONFIG_PTDUMP) += ptdump.o
 obj-$(CONFIG_KASAN)   += kasan_init.o
 
 ifdef CONFIG_KASAN
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 9c9ec08d78c7..dd9dd2f8e673 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -96,6 +96,7 @@ config S390
 	select ARCH_HAS_MEM_ENCRYPT
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_PREEMPT_LAZY
+	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SCALED_CPUTIME
 	select ARCH_HAS_SET_DIRECT_MAP
@@ -163,7 +164,6 @@ config S390
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_ENTRY
 	select GENERIC_GETTIMEOFDAY
-	select GENERIC_PTDUMP
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_VDSO_TIME_NS
diff --git a/arch/s390/mm/Makefile b/arch/s390/mm/Makefile
index f6c2db7a8669..9726b91fe7e4 100644
--- a/arch/s390/mm/Makefile
+++ b/arch/s390/mm/Makefile
@@ -9,6 +9,6 @@ obj-y		+= page-states.o pageattr.o pgtable.o pgalloc.o extable.o
 obj-$(CONFIG_CMM)		+= cmm.o
 obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
-obj-$(CONFIG_PTDUMP_CORE)	+= dump_pagetables.o
+obj-$(CONFIG_PTDUMP)		+= dump_pagetables.o
 obj-$(CONFIG_PGSTE)		+= gmap.o
 obj-$(CONFIG_PFAULT)		+= pfault.o
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index be2c311f5118..39ecafffc7e3 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -26,6 +26,7 @@ config X86_64
 	depends on 64BIT
 	# Options that are inherently 64-bit kernel only:
 	select ARCH_HAS_GIGANTIC_PAGE
+	select ARCH_HAS_PTDUMP
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
@@ -174,7 +175,6 @@ config X86
 	select GENERIC_IRQ_RESERVATION_MODE
 	select GENERIC_IRQ_SHOW
 	select GENERIC_PENDING_IRQ		if SMP
-	select GENERIC_PTDUMP
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_GETTIMEOFDAY
diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index 1eb4d23cdaae..c95c3aaadf97 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -59,7 +59,7 @@ config EARLY_PRINTK_USB_XDBC
 config EFI_PGT_DUMP
 	bool "Dump the EFI pagetable"
 	depends on EFI
-	select PTDUMP_CORE
+	select PTDUMP
 	help
 	  Enable this if you want to dump the EFI page table before
 	  enabling virtual mode. This can be used to debug miscellaneous
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index 690fbf48e853..e0c99a8760ca 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -39,7 +39,7 @@ CFLAGS_fault.o := -I $(src)/../include/asm/trace
 obj-$(CONFIG_X86_32)		+= pgtable_32.o iomap_32.o
 
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
-obj-$(CONFIG_PTDUMP_CORE)	+= dump_pagetables.o
+obj-$(CONFIG_PTDUMP)		+= dump_pagetables.o
 obj-$(CONFIG_PTDUMP_DEBUGFS)	+= debug_pagetables.o
 
 obj-$(CONFIG_HIGHMEM)		+= highmem_32.o
diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index a51a1149909a..32b65073d0cc 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -186,9 +186,9 @@ config ARCH_HAS_DEBUG_WX
 config DEBUG_WX
 	bool "Warn on W+X mappings at boot"
 	depends on ARCH_HAS_DEBUG_WX
-	depends on GENERIC_PTDUMP
+	depends on ARCH_HAS_PTDUMP
 	depends on MMU
-	select PTDUMP_CORE
+	select PTDUMP
 	help
 	  Generate a warning if any W+X mappings are found at boot.
 
@@ -213,18 +213,18 @@ config DEBUG_WX
 
 	  If in doubt, say "Y".
 
-config GENERIC_PTDUMP
+config ARCH_HAS_PTDUMP
 	bool
 
-config PTDUMP_CORE
+config PTDUMP
 	bool
 
 config PTDUMP_DEBUGFS
 	bool "Export kernel pagetable layout to userspace via debugfs"
 	depends on DEBUG_KERNEL
 	depends on DEBUG_FS
-	depends on GENERIC_PTDUMP
-	select PTDUMP_CORE
+	depends on ARCH_HAS_PTDUMP
+	select PTDUMP
 	help
 	  Say Y here if you want to show the kernel pagetable layout in a
 	  debugfs file. This information is only useful for kernel developers
diff --git a/mm/Makefile b/mm/Makefile
index 850386a67b3e..26dfecd4d396 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -138,7 +138,7 @@ obj-$(CONFIG_ZONE_DEVICE) += memremap.o
 obj-$(CONFIG_HMM_MIRROR) += hmm.o
 obj-$(CONFIG_MEMFD_CREATE) += memfd.o
 obj-$(CONFIG_MAPPING_DIRTY_HELPERS) += mapping_dirty_helpers.o
-obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
+obj-$(CONFIG_PTDUMP) += ptdump.o
 obj-$(CONFIG_PAGE_REPORTING) += page_reporting.o
 obj-$(CONFIG_IO_MAPPING) += io-mapping.o
 obj-$(CONFIG_HAVE_BOOTMEM_INFO_NODE) += bootmem_info.o
-- 
2.25.1


