Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8945DC02197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 05:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XOLFGKzAq1Ih/DSvWl2e03z1sP+VNRq7tgpUtW0Lods=; b=X6LSItWWlPS7SWijyKDM/l6Nl+
	JssaNiylIYS65uL3GECmcslUL5N2N2hnjcWtLfgAQ6+Nd8cu+HPB30fomamLMWSSQWdtQNgi9PFdq
	2Q0B3ipEGOFew8Oftg26YnzWFGZrWuJnR525F7aqpgbbITqR3F6Eyxi6B9858JzzdcRVTnRRq9f/4
	yMwnUhNdfjZs0Dccs+66jrZMl2BdTZu9nONNHuBoYcTp7rvyCERaH382R57dCPWB5VLmDX57eOXMF
	6uP3xcgKm8ayQwlYrtCxLPhMtgPv8rDE5+6xKZUoJHFVxWcwYt2ih1lHCShS7y/T30QEvKU4HcK9J
	fj77DIWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfXZC-00000002Jq5-0Tas;
	Wed, 05 Feb 2025 05:03:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfXWy-00000002JXJ-4A9B;
	Wed, 05 Feb 2025 05:00:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D9D611FB;
	Tue,  4 Feb 2025 21:01:17 -0800 (PST)
Received: from a077893.blr.arm.com (unknown [10.162.16.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0BA7C3F63F;
	Tue,  4 Feb 2025 21:00:45 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: steven.price@arm.com,
	christophe.leroy@csgroup.eu,
	Anshuman Khandual <anshuman.khandual@arm.com>,
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
	Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH V2] mm/ptdump: Drop GENERIC_PTDUMP
Date: Wed,  5 Feb 2025 10:30:39 +0530
Message-Id: <20250205050039.1506377-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_210057_139599_5FA3DC05 
X-CRM114-Status: GOOD (  15.20  )
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

GENERIC_PTDUMP does not guard any code but instead just used for platform's
subscription into core ptdump defined under PTDUMP_CORE, which is selected.
Instead use PTDUMP_CORE for platform subscription and drop GENERIC_PTDUMP.

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
This patch applies on v6.14-rc1

Changes in V2:

- Keep arch/powerpc/Kconfig alphabetically sorted per Christophe

Changes in V1:

https://lore.kernel.org/all/20241217034807.2541349-1-anshuman.khandual@arm.com/

 Documentation/arch/arm64/ptdump.rst       | 1 -
 arch/arm64/Kconfig                        | 2 +-
 arch/arm64/kvm/Kconfig                    | 3 +--
 arch/powerpc/Kconfig                      | 2 +-
 arch/powerpc/configs/mpc885_ads_defconfig | 1 -
 arch/riscv/Kconfig                        | 2 +-
 arch/s390/Kconfig                         | 2 +-
 arch/x86/Kconfig                          | 2 +-
 arch/x86/Kconfig.debug                    | 2 +-
 kernel/configs/debug.config               | 1 -
 mm/Kconfig.debug                          | 8 ++------
 11 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/Documentation/arch/arm64/ptdump.rst b/Documentation/arch/arm64/ptdump.rst
index 5dcfc5d7cddf..61ca040a885b 100644
--- a/Documentation/arch/arm64/ptdump.rst
+++ b/Documentation/arch/arm64/ptdump.rst
@@ -22,7 +22,6 @@ offlining of memory being accessed by the ptdump code.
 In order to dump the kernel page tables, enable the following
 configurations and mount debugfs::
 
- CONFIG_GENERIC_PTDUMP=y
  CONFIG_PTDUMP_CORE=y
  CONFIG_PTDUMP_DEBUGFS=y
 
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fcdd0ed3eca8..1f516bed81dd 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -157,7 +157,7 @@ config ARM64
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select GENERIC_PCI_IOMAP
-	select GENERIC_PTDUMP
+	select PTDUMP_CORE
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index ead632ad01b4..fe17d7f5b061 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -71,8 +71,7 @@ config PTDUMP_STAGE2_DEBUGFS
 	depends on KVM
 	depends on DEBUG_KERNEL
 	depends on DEBUG_FS
-	depends on GENERIC_PTDUMP
-	select PTDUMP_CORE
+	depends on PTDUMP_CORE
 	default n
 	help
 	  Say Y here if you want to show the stage-2 kernel pagetables
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 424f188e62d9..97312440f715 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -206,7 +206,6 @@ config PPC
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_PCI_IOMAP		if PCI
-	select GENERIC_PTDUMP
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_VDSO_TIME_NS
@@ -314,6 +313,7 @@ config PPC
 	select PCI_MSI_ARCH_FALLBACKS		if PCI_MSI
 	select PCI_SYSCALL			if PCI
 	select PPC_DAWR				if PPC64
+	select PTDUMP_CORE
 	select RTC_LIB
 	select SPARSE_IRQ
 	select STRICT_KERNEL_RWX if STRICT_MODULE_RWX
diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
index 77306be62e9e..ea6f836407d2 100644
--- a/arch/powerpc/configs/mpc885_ads_defconfig
+++ b/arch/powerpc/configs/mpc885_ads_defconfig
@@ -78,4 +78,3 @@ CONFIG_DEBUG_VM_PGTABLE=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_BDI_SWITCH=y
 CONFIG_PPC_EARLY_DEBUG=y
-CONFIG_GENERIC_PTDUMP=y
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..bdaf08c1e1da 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -112,7 +112,7 @@ config RISCV
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select GENERIC_PCI_IOMAP
-	select GENERIC_PTDUMP if MMU
+	select PTDUMP_CORE if MMU
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 9c9ec08d78c7..ecf6b4cb3e33 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -163,7 +163,7 @@ config S390
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_ENTRY
 	select GENERIC_GETTIMEOFDAY
-	select GENERIC_PTDUMP
+	select PTDUMP_CORE
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_VDSO_TIME_NS
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 87198d957e2f..b6097b6178de 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -174,7 +174,7 @@ config X86
 	select GENERIC_IRQ_RESERVATION_MODE
 	select GENERIC_IRQ_SHOW
 	select GENERIC_PENDING_IRQ		if SMP
-	select GENERIC_PTDUMP
+	select PTDUMP_CORE
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_GETTIMEOFDAY
diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index 1eb4d23cdaae..090c44d7e1a5 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -59,7 +59,7 @@ config EARLY_PRINTK_USB_XDBC
 config EFI_PGT_DUMP
 	bool "Dump the EFI pagetable"
 	depends on EFI
-	select PTDUMP_CORE
+	depends on PTDUMP_CORE
 	help
 	  Enable this if you want to dump the EFI page table before
 	  enabling virtual mode. This can be used to debug miscellaneous
diff --git a/kernel/configs/debug.config b/kernel/configs/debug.config
index 20552f163930..8aafd050b754 100644
--- a/kernel/configs/debug.config
+++ b/kernel/configs/debug.config
@@ -73,7 +73,6 @@ CONFIG_DEBUG_VM=y
 CONFIG_DEBUG_VM_PGFLAGS=y
 CONFIG_DEBUG_VM_RB=y
 CONFIG_DEBUG_VM_VMACACHE=y
-CONFIG_GENERIC_PTDUMP=y
 CONFIG_KASAN=y
 CONFIG_KASAN_GENERIC=y
 CONFIG_KASAN_INLINE=y
diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 41a58536531d..b206e5a11f96 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -187,7 +187,7 @@ config DEBUG_WX
 	bool "Warn on W+X mappings at boot"
 	depends on ARCH_HAS_DEBUG_WX
 	depends on MMU
-	select PTDUMP_CORE
+	depends on PTDUMP_CORE
 	help
 	  Generate a warning if any W+X mappings are found at boot.
 
@@ -212,9 +212,6 @@ config DEBUG_WX
 
 	  If in doubt, say "Y".
 
-config GENERIC_PTDUMP
-	bool
-
 config PTDUMP_CORE
 	bool
 
@@ -222,8 +219,7 @@ config PTDUMP_DEBUGFS
 	bool "Export kernel pagetable layout to userspace via debugfs"
 	depends on DEBUG_KERNEL
 	depends on DEBUG_FS
-	depends on GENERIC_PTDUMP
-	select PTDUMP_CORE
+	depends on PTDUMP_CORE
 	help
 	  Say Y here if you want to show the kernel pagetable layout in a
 	  debugfs file. This information is only useful for kernel developers
-- 
2.30.2


