Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEE1F44847
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:cc:Content-Type:MIME-Version
	:References:Subject:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=1svmJ9bLZm6y7AkRgd4KZ3wMzChgI+aIwiw2S8Q7kUs=; b=JeFN4pFPbPSmOY
	eqvbCOr7PcOp7UlCkiGHmlSTToayJjHGr45x07lWSJikq+6yN1Umdon0UdL4y1Pwgvckjan9cgZz7
	bS6ZZDVRTImPzw3mh/PMzR5U3tPELyIdtxI9nN9IDjjwGPKXlfnYfaTQ20hLp+wYNa/dUm6jLiWyW
	W0yPKM/EVK79hqQgixmFYe09rmyfD3iJCoPon7DEhbUiYaKQRy9xa4KA171leIzY7JpaveripP7vu
	gjLervpVA/Lwp3WHyq/WufRt8k3G8qABkabwx3EyMYxIkNZk+JnhHDd9zwtAnCzMtePm/1eMPF/nY
	Ww30d8VjgX1pYyqhXXcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAot-0000000C96p-3Va7;
	Fri, 10 Apr 2026 12:18:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAor-0000000C95e-3yGG;
	Fri, 10 Apr 2026 12:18:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60F576111B;
	Fri, 10 Apr 2026 12:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34709C2BC87;
	Fri, 10 Apr 2026 12:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823521;
	bh=jM+JreNQ/pvWEKCuy6rQc5u1kgCA5N5UN7yUgNovu14=;
	h=Date:From:To:Subject:References:cc:From;
	b=nWtTU/8bYflAI0sVDZCcTSRoMHHBafK4f8aE8OQUIADFXrWn3gkAS6D8iyeDcGytD
	 IkAJ7wfDdphIDTv0/p2VgJLmG6txpPJj7VHjB28F0wfKCyzE07p6hHvScSQ/hPg40n
	 m5UonCXCWoABi9Y1P5pL07/VfBtvxj5IX/qtz/8nDDpNNssj+hm09ux1rli9d/5Kp7
	 u2W39VabHnp7xFO01m/Vf4vbZzsQaYVQbm/v4/bBGJXSthxziJGUNQp6cLMMBeBrVY
	 Rxdzr0TBEmAzR1XxM10SdBatX0CJ8cwLuQKU2F/sGImGk9kogedHCPTsKBS8t/RjVc
	 cuRhduaM+Iuqw==
Date: Fri, 10 Apr 2026 14:18:37 +0200
Message-ID: <20260410120317.709923681@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 02/38] x86: Cleanup include recursion hell
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
 arch/x86/include/asm/msr.h               |    5 +++--
 arch/x86/include/asm/pvclock.h           |    1 +
 arch/x86/include/asm/smp.h               |    2 --
 arch/x86/include/asm/vdso/gettimeofday.h |    5 ++---
 arch/x86/kernel/cpu/mce/core.c           |    1 +
 arch/x86/kernel/nmi.c                    |    1 +
 arch/x86/kernel/smpboot.c                |    1 +
 7 files changed, 9 insertions(+), 7 deletions(-)

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


