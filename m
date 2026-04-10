Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14243F45A0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 20:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaKhODvxi/ucukRjiZOPM52dL9n0W3z89ySIPcNqMX0=; b=4Bgg/b5iEopqqNOpOQS5IzLc86
	BzG6T6MZQ5aFrl/zW9JJSDvkbHzT672inspXuP8WO5rm5zXyI6K6eYxzYYQEyHj9rUrvonr+LompE
	wvq1EBxd0kFwcAD6ZZWg4Z7q1fytiIPbBDc0UHpGJSG9YlgoyRXsJr4jocGTvUksBB7wYbLfiTg6Y
	IcdBZAujWAuSisSzxYgBAAjqqAtQXDKGKv/76x3ST8t81Ke88xkVX55JBnPe3YHVlTtlkdbb37fT3
	SQZCUoF2Lo8zS9i1vWM9uJBmWicWTfVDu/QXCjICy6BnfT9SWQhcr8zDAIVr4vsuCikIZkxUZRs3f
	4cbm2NVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBIt2-0000000Cn9S-0GdL;
	Fri, 10 Apr 2026 20:55:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBIt0-0000000Cn92-15no;
	Fri, 10 Apr 2026 20:55:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6479E4031C;
	Fri, 10 Apr 2026 20:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D0DC19421;
	Fri, 10 Apr 2026 20:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775854529;
	bh=NCLwUcavida6lTRmcWsaKb5HSspL1nWNySBxMvO4hO8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uBb+aK4w3/2u4kyVJBiptzM0/JeHVU+h0LyuAGmXhRBB/wmY8nVPEGLrH6PIUauly
	 xZ5jhTx/pd4jDAH6N0E8699fbCvDPdRPvQ/1U9PBOdvPEbxrui2vDJcfwacrKBJbAt
	 K2KgH8S8N6W61I5bQqua5TC/HTbe1JJBDb2jmaIXqh11mio1s1ulWsCUgh1TEd2HU0
	 +ZMxNL6Px/beH32xwdxJ9u73C9h58Vy+EiUKACVtBOcR0D3eWoYoTnffZnDWdkv8Q1
	 Jq57olSI26FETBnKfPSYv2rHfBfCG49DcVZq8FGFKIXdb41avCYxrEXRj1YRJAzkeo
	 CA0Wg7vMsMitA==
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu
 <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, Michael Grzeschik
 <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>, Bernie Thompson
 <bernie@plugable.com>, linux-fbdev@vger.kernel.org, Theodore Tso
 <tytso@mit.edu>, linux-ext4@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, Marco
 Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Richard Henderson
 <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Catalin
 Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, Jonas
 Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Michael Ellerman
 <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Paul Walmsley
 <pjw@kernel.org>, linux-riscv@lists.infradead.org, Heiko Carstens
 <hca@linux.ibm.com>, linux-s390@vger.kernel.org, "David S. Miller"
 <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: [patch V1.1 02/38] x86: Cleanup include recursion hell
In-Reply-To: <20260410120317.709923681@kernel.org>
References: <20260410120044.031381086@kernel.org>
 <20260410120317.709923681@kernel.org>
Date: Fri, 10 Apr 2026 22:55:25 +0200
Message-ID: <87ldeuzgaq.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_135530_340971_5385A6A2 
X-CRM114-Status: GOOD (  13.78  )
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

Including a random architecture specific header which requires global
headers just to avoid including that header at the two usage sites is
really beyond lazy and tasteless. Including global headers just to get the
__percpu macro from linux/compiler_types.h falls into the same category.

Remove the linux/percpu.h and asm/cpumask.h includes from msr.h and smp.h
and fix the resulting fallout by a simple forward struct declaration and by
including the x86 specific asm/cpumask.h header where it is actually
required.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
V1.1: Fix PARAVIRT_XXL fallout....
---
 arch/x86/include/asm/cache.h             |    1 +
 arch/x86/include/asm/msr.h               |    5 +++--
 arch/x86/include/asm/paravirt.h          |    3 ++-
 arch/x86/include/asm/pvclock.h           |    1 +
 arch/x86/include/asm/smp.h               |    2 --
 arch/x86/include/asm/vdso/gettimeofday.h |    5 ++---
 arch/x86/kernel/cpu/mce/core.c           |    1 +
 arch/x86/kernel/nmi.c                    |    1 +
 arch/x86/kernel/smpboot.c                |    1 +
 9 files changed, 12 insertions(+), 8 deletions(-)

--- a/arch/x86/include/asm/cache.h
+++ b/arch/x86/include/asm/cache.h
@@ -2,6 +2,7 @@
 #ifndef _ASM_X86_CACHE_H
 #define _ASM_X86_CACHE_H
 
+#include <vdso/page.h>
 #include <linux/linkage.h>
 
 /* L1 cache line size */
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -8,12 +8,11 @@
 
 #include <asm/asm.h>
 #include <asm/errno.h>
-#include <asm/cpumask.h>
 #include <uapi/asm/msr.h>
 #include <asm/shared/msr.h>
 
+#include <linux/compiler_types.h>
 #include <linux/types.h>
-#include <linux/percpu.h>
 
 struct msr_info {
 	u32			msr_no;
@@ -256,6 +255,8 @@ int msr_set_bit(u32 msr, u8 bit);
 int msr_clear_bit(u32 msr, u8 bit);
 
 #ifdef CONFIG_SMP
+struct cpumask;
+
 int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
 int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
 int rdmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -16,9 +16,10 @@
 
 #ifndef __ASSEMBLER__
 #include <linux/types.h>
-#include <linux/cpumask.h>
 #include <asm/frame.h>
 
+struct cpumask;
+
 /* The paravirtualized I/O functions */
 static inline void slow_down_io(void)
 {
--- a/arch/x86/include/asm/pvclock.h
+++ b/arch/x86/include/asm/pvclock.h
@@ -2,6 +2,7 @@
 #ifndef _ASM_X86_PVCLOCK_H
 #define _ASM_X86_PVCLOCK_H
 
+#include <asm/barrier.h>
 #include <asm/clocksource.h>
 #include <asm/pvclock-abi.h>
 
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -5,8 +5,6 @@
 #include <linux/cpumask.h>
 #include <linux/thread_info.h>
 
-#include <asm/cpumask.h>
-
 DECLARE_PER_CPU_CACHE_HOT(int, cpu_number);
 
 DECLARE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_map);
--- a/arch/x86/include/asm/vdso/gettimeofday.h
+++ b/arch/x86/include/asm/vdso/gettimeofday.h
@@ -11,13 +11,12 @@
 #define __ASM_VDSO_GETTIMEOFDAY_H
 
 #ifndef __ASSEMBLER__
-
+#include <clocksource/hyperv_timer.h>
 #include <uapi/linux/time.h>
+
 #include <asm/vgtod.h>
 #include <asm/unistd.h>
-#include <asm/msr.h>
 #include <asm/pvclock.h>
-#include <clocksource/hyperv_timer.h>
 #include <asm/vdso/sys_call.h>
 
 #define VDSO_HAS_TIME 1
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -48,6 +48,7 @@
 #include <linux/vmcore_info.h>
 
 #include <asm/fred.h>
+#include <asm/cpumask.h>
 #include <asm/cpu_device_id.h>
 #include <asm/processor.h>
 #include <asm/traps.h>
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -26,6 +26,7 @@
 #include <linux/sched/clock.h>
 #include <linux/kvm_types.h>
 
+#include <asm/cpumask.h>
 #include <asm/cpu_entry_area.h>
 #include <asm/traps.h>
 #include <asm/mach_traps.h>
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -70,6 +70,7 @@
 #include <asm/irq.h>
 #include <asm/realmode.h>
 #include <asm/cpu.h>
+#include <asm/cpumask.h>
 #include <asm/numa.h>
 #include <asm/tlbflush.h>
 #include <asm/mtrr.h>

