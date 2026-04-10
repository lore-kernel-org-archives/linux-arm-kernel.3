Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06ADF4484C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=knDLOL3Pglg0Ub7FLYkkPKBMBdISeZid22CAd3SOyJM=; b=xVfLr3X3+Ul2EM
	RcbuKjuZU7L4AcXuBzKP9V9SGgMvyF9yVvPjopQwkqf0r3PdFBQy+mlP/gpRg09CW/XOIpDzr28ZV
	2LiDfLj4g1d1bFeKFrqYi4grJMtA+wq6Ehw6dDLC6leoVlJG6F6cxa4HByWqJfT1AKEx3Xe7LEhVZ
	05IcKQ/RCkIuRHG+kjPxyBBvjf5jage+Owjsx4WGuRF16rbox/pQdmhrvKTB14ENc1vzSOJ/ufgLI
	R3/+nNJjCKIu7SiOXL7r22pRbnmf1q/Ndq1WNuQbpwSqxGMqomYDGlgAsKQjmu9/OR+XUrHRL7+6F
	o/Eck9DzDduyMdMjHW1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArP-0000000CChJ-0x3K;
	Fri, 10 Apr 2026 12:21:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArA-0000000CCH0-327S;
	Fri, 10 Apr 2026 12:21:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5035961333;
	Fri, 10 Apr 2026 12:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21923C2BCB2;
	Fri, 10 Apr 2026 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823663;
	bh=arEz1VHg70GeH2cUr9Lpy43pf1nP5ZqGj9No6b3NvGc=;
	h=Date:From:To:Cc:Subject:References:From;
	b=NMEawaGfBmItTINOkOidvgB6jXoclDGf78qU2DQLeTlzGLrdEzTDk/muIR3isadas
	 Eyy5g0FnRv8ECHD8WNjJd+poKDwf709MD2FUA4Zxpq4v2gA+LwpA8vel0ik9BGCmUL
	 SRAcDP7ql7MsZ2nrhkZkSeh/8fnf2+XnKGt9MLspNLANeefspPmNjhAwKQtf/nBzwq
	 +qFTCUz5zVqyJxqgiY8VftvHSe0PhwZa05l9UZAVCASdReHFxw2Di6MoEIbRm/DACH
	 6EZjVdKmyCFY0ahPlTJF5Om8tUGbM3+RzMDvfnJ5JW0Kfa99RJyTmb3751RAHQJ2qn
	 SLzORLtraR9aA==
Date: Fri, 10 Apr 2026 14:21:00 +0200
Message-ID: <20260410120319.658485572@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
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
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 31/38] parisc: Select ARCH_HAS_RANDOM_ENTROPY
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The only remaining non-architecture usage of get_cycles() is to provide
random_get_entropy().

Switch parisc over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
and providing random_get_entropy() in asm/random.h.

Add 'asm/timex.h' includes to the relevant files, so the global include can
be removed once all architectures are converted over.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/Kconfig              |    1 +
 arch/parisc/include/asm/random.h |   12 ++++++++++++
 arch/parisc/include/asm/timex.h  |    6 ------
 arch/parisc/kernel/processor.c   |    1 +
 arch/parisc/kernel/time.c        |    1 +
 5 files changed, 15 insertions(+), 6 deletions(-)

--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -16,6 +16,7 @@ config PARISC
 	select ARCH_HAS_STRICT_MODULE_RWX
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_RANDOM_ENTROPY
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SPLIT_ARG64 if !64BIT
 	select ARCH_SUPPORTS_HUGETLBFS if PA20
--- /dev/null
+++ b/arch/parisc/include/asm/random.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASMPARISC_RANDOM_H
+#define _ASMPARISC_RANDOM_H
+
+#include <asm/timex.h>
+
+static inline unsigned long random_get_entropy(void)
+{
+	return get_cycles();
+}
+
+#endif
--- a/arch/parisc/include/asm/timex.h
+++ b/arch/parisc/include/asm/timex.h
@@ -1,9 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/*
- * linux/include/asm-parisc/timex.h
- *
- * PARISC architecture timex specifications
- */
 #ifndef _ASMPARISC_TIMEX_H
 #define _ASMPARISC_TIMEX_H
 
@@ -13,6 +8,5 @@ static inline cycles_t get_cycles(void)
 {
 	return mfctl(16);
 }
-#define get_cycles get_cycles
 
 #endif
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -30,6 +30,7 @@
 #include <asm/pdcpat.h>
 #include <asm/irq.h>		/* for struct irq_region */
 #include <asm/parisc-device.h>
+#include <asm/timex.h>
 
 struct system_cpuinfo_parisc boot_cpu_data __ro_after_init;
 EXPORT_SYMBOL(boot_cpu_data);
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <asm/processor.h>
 #include <asm/pdcpat.h>
+#include <asm/timex.h>
 
 static u64 cr16_clock_freq;
 static unsigned long clocktick;


