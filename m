Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71137F4484C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:cc:Content-Type:MIME-Version
	:References:Subject:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=SH5UDza4spQjzd3RSMUyPWLUXEHp2wuekQCGvQe/6zk=; b=kQldqY7VvGoxA+
	shkb3e6/NPSfTTHnd3LKLdSfk0aGxm0x/D/51SF5KtPGHzTgd4iZRhfciedANBck6NYgjCQyYK//D
	LQJEA4hKDfUIexOh+Lny8MZsf6yW5jyOHS35I0y6MxBhIfOxw8F+kVebxKw1Gxq7ZGDyb+hPXMJD+
	jSVFl8/+WBmQto6EaB4XgZ2Dk1aaJ7Ur3sZR975tV9nhZ8S5xslDx4EvjRlJmNEOyddHhusylXqRT
	doGrWFGNzS2AQRJe38zYe7BxMdgkFwOYeYz7BaRHwozrtc80zwglD6Ys/Ppt6u6Wu8IiIRyqeEqAH
	p1vVJDRMtdIb8ZY6Vw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApN-0000000C9c2-0JYL;
	Fri, 10 Apr 2026 12:19:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApG-0000000C9V3-3skG;
	Fri, 10 Apr 2026 12:19:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 95C4F40B4D;
	Fri, 10 Apr 2026 12:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDE4C2BCB3;
	Fri, 10 Apr 2026 12:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823546;
	bh=e1hr7RxQAtfkXxmpOByj9AnE8rprLs7FfW1VJuycE3U=;
	h=Date:From:To:Subject:References:cc:From;
	b=RN1rF/lik/IDDm6vfArIXRWDzYeJ5FOTg7VZhjC87W8dEFx4XOLkGFYYWGhN5FSAp
	 UgUW5oHG+RoyFDJ2Lb8wy9bLXZ629e0sIZHO26a4htp9GCeP67dTQge4t3eD4oDh93
	 1M2FHKCxNFZC0Fzd0yadwA9xaercjxCXri8tQar5sfr/ENoprWWJO3/MtUJLqRehkg
	 l/QzejVV1juchHtR/6u+RSlRsRj9VAJZETUAE3E4ZTRyX1FMMGjRx2pW1U9TsOYtOg
	 Iiw1IsbQmNZnTrKZs9AZodQQ0gykTA14aWPgbU/9QJFDHI9V1VA1cDQRoqdiQlL5WN
	 Y1nwRLUUSmSZw==
Date: Fri, 10 Apr 2026 14:19:03 +0200
Message-ID: <20260410120318.045532623@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 07/38] treewide: Consolidate cycles_t
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
cc: Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org,
 David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org,
 "Theodore Tso" <tytso@mit.edu>,
 linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_051907_041820_FE2CB964 
X-CRM114-Status: GOOD (  18.23  )
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

Most architectures define cycles_t as unsigned long execpt:

 - x86 requires it to be 64-bit independent of the 32-bit/64-bit build.

 - parisc and mips define it as unsigned int

   parisc has no real reason to do so as there are only a few usage sites
   which either expand it to a 64-bit value or utilize only the lower
   32bits.

   mips has no real requirement either.

Move the typedef to types.h and provide a config switch to enforce the
64-bit type for x86.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 arch/Kconfig                       |    4 ++++
 arch/alpha/include/asm/timex.h     |    3 ---
 arch/arm/include/asm/timex.h       |    1 -
 arch/loongarch/include/asm/timex.h |    2 --
 arch/m68k/include/asm/timex.h      |    2 --
 arch/mips/include/asm/timex.h      |    2 --
 arch/nios2/include/asm/timex.h     |    2 --
 arch/parisc/include/asm/timex.h    |    2 --
 arch/powerpc/include/asm/timex.h   |    4 +---
 arch/riscv/include/asm/timex.h     |    2 --
 arch/s390/include/asm/timex.h      |    2 --
 arch/sparc/include/asm/timex_64.h  |    1 -
 arch/x86/Kconfig                   |    1 +
 arch/x86/include/asm/tsc.h         |    2 --
 include/asm-generic/timex.h        |    1 -
 include/linux/types.h              |    6 ++++++
 16 files changed, 12 insertions(+), 25 deletions(-)

--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -360,6 +360,10 @@ config ARCH_HAS_DMA_SET_UNCACHED
 config ARCH_HAS_DMA_CLEAR_UNCACHED
 	bool
 
+# cycles_t is always 64bit wide
+config ARCH_HAS_CYCLES_T_64
+	bool
+
 config ARCH_HAS_CPU_FINALIZE_INIT
 	bool
 
--- a/arch/alpha/include/asm/timex.h
+++ b/arch/alpha/include/asm/timex.h
@@ -15,9 +15,6 @@
  * But this only means we'll force a reschedule every 8 seconds or so,
  * which isn't an evil thing.
  */
-
-typedef unsigned int cycles_t;
-
 static inline cycles_t get_cycles (void)
 {
 	cycles_t ret;
--- a/arch/arm/include/asm/timex.h
+++ b/arch/arm/include/asm/timex.h
@@ -9,7 +9,6 @@
 #ifndef _ASMARM_TIMEX_H
 #define _ASMARM_TIMEX_H
 
-typedef unsigned long cycles_t;
 // Temporary workaround
 bool delay_read_timer(unsigned long *t);
 
--- a/arch/loongarch/include/asm/timex.h
+++ b/arch/loongarch/include/asm/timex.h
@@ -12,8 +12,6 @@
 #include <asm/cpu.h>
 #include <asm/cpu-features.h>
 
-typedef unsigned long cycles_t;
-
 #define get_cycles get_cycles
 
 static inline cycles_t get_cycles(void)
--- a/arch/m68k/include/asm/timex.h
+++ b/arch/m68k/include/asm/timex.h
@@ -7,8 +7,6 @@
 #ifndef _ASMm68K_TIMEX_H
 #define _ASMm68K_TIMEX_H
 
-typedef unsigned long cycles_t;
-
 static inline cycles_t get_cycles(void)
 {
 	return 0;
--- a/arch/mips/include/asm/timex.h
+++ b/arch/mips/include/asm/timex.h
@@ -29,8 +29,6 @@
  * We know that all SMP capable CPUs have cycle counters.
  */
 
-typedef unsigned int cycles_t;
-
 /*
  * On R4000/R4400 an erratum exists such that if the cycle counter is
  * read in the exact moment that it is matching the compare register,
--- a/arch/nios2/include/asm/timex.h
+++ b/arch/nios2/include/asm/timex.h
@@ -5,8 +5,6 @@
 #ifndef _ASM_NIOS2_TIMEX_H
 #define _ASM_NIOS2_TIMEX_H
 
-typedef unsigned long cycles_t;
-
 extern cycles_t get_cycles(void);
 #define get_cycles get_cycles
 
--- a/arch/parisc/include/asm/timex.h
+++ b/arch/parisc/include/asm/timex.h
@@ -9,8 +9,6 @@
 
 #include <asm/special_insns.h>
 
-typedef unsigned long cycles_t;
-
 static inline cycles_t get_cycles(void)
 {
 	return mfctl(16);
--- a/arch/powerpc/include/asm/timex.h
+++ b/arch/powerpc/include/asm/timex.h
@@ -11,9 +11,7 @@
 #include <asm/cputable.h>
 #include <asm/vdso/timebase.h>
 
-typedef unsigned long cycles_t;
-
-static inline cycles_t get_cycles(void)
+ostatic inline cycles_t get_cycles(void)
 {
 	return mftb();
 }
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -8,8 +8,6 @@
 
 #include <asm/csr.h>
 
-typedef unsigned long cycles_t;
-
 #ifdef CONFIG_RISCV_M_MODE
 
 #include <asm/clint.h>
--- a/arch/s390/include/asm/timex.h
+++ b/arch/s390/include/asm/timex.h
@@ -177,8 +177,6 @@ static inline void local_tick_enable(uns
 	set_clock_comparator(get_lowcore()->clock_comparator);
 }
 
-typedef unsigned long cycles_t;
-
 static __always_inline unsigned long get_tod_clock(void)
 {
 	union tod_clock clk;
--- a/arch/sparc/include/asm/timex_64.h
+++ b/arch/sparc/include/asm/timex_64.h
@@ -10,7 +10,6 @@
 #include <asm/timer.h>
 
 /* Getting on the cycle counter on sparc64. */
-typedef unsigned long cycles_t;
 #define get_cycles()	tick_ops->get_tick()
 
 #endif
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -79,6 +79,7 @@ config X86
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_CPU_PASID		if IOMMU_SVA
 	select ARCH_HAS_CURRENT_STACK_POINTER
+	select ARCH_HAS_CYCLES_T_64
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE	if !X86_PAE
 	select ARCH_HAS_DELAY_TIMER
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -67,8 +67,6 @@ static __always_inline u64 rdtsc_ordered
 /*
  * Standard way to access the cycle counter.
  */
-typedef unsigned long long cycles_t;
-
 extern unsigned int cpu_khz;
 extern unsigned int tsc_khz;
 
--- a/include/asm-generic/timex.h
+++ b/include/asm-generic/timex.h
@@ -5,7 +5,6 @@
 /*
  * If you have a cycle counter, return the value here.
  */
-typedef unsigned long cycles_t;
 #ifndef get_cycles
 static inline cycles_t get_cycles(void)
 {
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -270,5 +270,11 @@ struct rcuwait {
 	struct task_struct __rcu *task;
 };
 
+#ifdef CONFIG_ARCH_HAS_CYCLES_T_64
+typedef unsigned long long	cycles_t;
+#else
+typedef unsigned long		cycles_t;
+#endif
+
 #endif /*  __ASSEMBLY__ */
 #endif /* _LINUX_TYPES_H */


