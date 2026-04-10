Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534A0F4484F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=CZnLdubUssxhQoUeG+xENhtvOMtrmC4aQUSEvuRJUnc=; b=nHrXWhEGPE4chW
	6aH2qPd7HLl5E+BwyI/amkfOReAYBSmHygYtIFNRrMR7xsgPQKhytWtReHi+yWGCx/AYHSXKGHRi0
	dCSWM6D1VmEOVl7yoUyVtGuGS6JRjcoUkob8XElt4zOemgHzTVVYACpokNDQis2pO4/n590nqiw0z
	0892Zb76tUTUdC/zqnctKOa6IpkXH6G+xtlAiSs+L3v32ps0Hcp98ZTyLMi2uUpJVBUDpiq7Wlvih
	xOkY5c5s8jHowhZ61H0axmFCYQQTMqB29LJmntlp8+B8WJRVnFyda5CdcEIWbc9GQWiIk/6mFo2R3
	d0tX3s+eqWaL9Y2+N8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArk-0000000CDIk-1Eim;
	Fri, 10 Apr 2026 12:21:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArX-0000000CCtn-1KO5;
	Fri, 10 Apr 2026 12:21:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C75564366F;
	Fri, 10 Apr 2026 12:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EE3C19425;
	Fri, 10 Apr 2026 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823686;
	bh=506UQ2xUMl1Z9eAzOmzEcIl1RJxUk5Zj30ohtcXoKMY=;
	h=Date:From:To:Cc:Subject:References:From;
	b=Z5xk9L5P21mRx0MY/8DBEFXub59mdEbOhszRMhCXrj2F4yR3gtSSMVH5Ys886C70h
	 ecuez10MlaZM3qSzOJIlSqs3GQHIX7r46PbtHbTSey1wj2Xf5OquvDCTW6/Y/BwsaZ
	 HOnECp9mbfgHCsi29AhbrdwXxEeghdlmA/P/QGWQbNRq0XZzEiWDbqYK6jtMl2Fqel
	 J/j1quCkWsAMuIIV68vkZDLkhw3pICkV08QoM7gE4lID3deNtskLbUzyP0Y6rIWxr9
	 E+31Ou3bfkNfr/XyUr2BTZMkGgo/VhX2L0FM/Xl0m04u+cc79US3jzI6GNXqNN3Dgi
	 kUVIHjYrNe9Wg==
Date: Fri, 10 Apr 2026 14:21:23 +0200
Message-ID: <20260410120320.011762129@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org,
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
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org
Subject: [patch 36/38] sparc: Select ARCH_HAS_RANDOM_ENTROPY for SPARC64
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_052127_719288_630F0F4A 
X-CRM114-Status: GOOD (  10.76  )
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

The only remaining usage of get_cycles() is to provide random_get_entropy().

Switch sparc over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
and providing random_get_entropy() in asm/random.h.

Remove asm/timex*.h as it has no functionality anymore.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
---
 arch/sparc/Kconfig                |    1 +
 arch/sparc/include/asm/random.h   |   15 +++++++++++++++
 arch/sparc/include/asm/timex.h    |    9 ---------
 arch/sparc/include/asm/timex_64.h |   15 ---------------
 arch/sparc/kernel/pcic.c          |    1 -
 arch/sparc/kernel/time_32.c       |    1 -
 arch/sparc/vdso/vclock_gettime.c  |    1 -
 7 files changed, 16 insertions(+), 27 deletions(-)

--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -71,6 +71,7 @@ config SPARC64
 	def_bool 64BIT
 	select ALTERNATE_USER_ADDRESS_SPACE
 	select ARCH_HAS_DELAY_TIMER
+	select ARCH_HAS_RANDOM_ENTROPY
 	select HAVE_FUNCTION_TRACER
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_KRETPROBES
--- /dev/null
+++ b/arch/sparc/include/asm/random.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASMsparc_RANDOM_H
+#define _ASMsparc_RANDOM_H
+
+#if defined(__sparc__) && defined(__arch64__)
+
+#include <asm/timer.h>
+
+static inline unsigned long random_get_entropy(void)
+{
+	return tick_ops->get_tick();
+}
+
+#endif
+#endif
--- a/arch/sparc/include/asm/timex.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef ___ASM_SPARC_TIMEX_H
-#define ___ASM_SPARC_TIMEX_H
-#if defined(__sparc__) && defined(__arch64__)
-#include <asm/timex_64.h>
-#else
-#include <asm-generic/timex.h>
-#endif
-#endif
--- a/arch/sparc/include/asm/timex_64.h
+++ b/arch/sparc/include/asm/timex_64.h
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * linux/include/asm/timex.h
- *
- * sparc64 architecture timex specifications
- */
-#ifndef _ASMsparc64_TIMEX_H
-#define _ASMsparc64_TIMEX_H
-
-#include <asm/timer.h>
-
-/* Getting on the cycle counter on sparc64. */
-#define get_cycles()	tick_ops->get_tick()
-
-#endif
--- a/arch/sparc/kernel/pcic.c
+++ b/arch/sparc/kernel/pcic.c
@@ -33,7 +33,6 @@
 #include <asm/oplib.h>
 #include <asm/prom.h>
 #include <asm/pcic.h>
-#include <asm/timex.h>
 #include <asm/timer.h>
 #include <linux/uaccess.h>
 #include <asm/irq_regs.h>
--- a/arch/sparc/kernel/time_32.c
+++ b/arch/sparc/kernel/time_32.c
@@ -37,7 +37,6 @@
 
 #include <asm/mc146818rtc.h>
 #include <asm/oplib.h>
-#include <asm/timex.h>
 #include <asm/timer.h>
 #include <asm/irq.h>
 #include <asm/io.h>
--- a/arch/sparc/vdso/vclock_gettime.c
+++ b/arch/sparc/vdso/vclock_gettime.c
@@ -17,7 +17,6 @@
 #include <linux/string.h>
 #include <asm/io.h>
 #include <asm/unistd.h>
-#include <asm/timex.h>
 #include <asm/clocksource.h>
 #include <asm/vvar.h>
 


