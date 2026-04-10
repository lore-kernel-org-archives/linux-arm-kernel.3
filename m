Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51508F4484C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:cc:Content-Type:MIME-Version
	:References:Subject:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=Bd2cg6ABy+bDw1GoAexe6DyvKfgKbE4JMcwGjXdm8Fs=; b=JSzeRrqUCK88EP
	bl3rGN5vpkxbQU6ZFmC90IZxRl1IlvMHdKdaLWkW27zvwerAubfLOIrT2Hu0L/K4Njm/K3YWnnjL3
	mcuqGgrclIeWs/dpKJ3cO6V8UIvZbFBUr7E1Xo12DvtLi5DZeUsPYJvpA8Qux9i842P37ud0HAIz0
	sI9Tm/vvZ2xnvH4571exuVkjGA+PX11XoB2+KPmT6VJJ/lAmRCsCv+3S3czJOOqMxf68AQANYhm4b
	A/e5sfLraNLO4CpoZFeKHPISgLsg7JeVksq/RYEbgf0Z2mHHooju/hzMLOPgjYYcJHAP+QxGurZIg
	vnYOjObO5h1h4lxxwvcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArw-0000000CDgX-02FG;
	Fri, 10 Apr 2026 12:21:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArh-0000000CDCM-0Aqu;
	Fri, 10 Apr 2026 12:21:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E64B61334;
	Fri, 10 Apr 2026 12:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AD5C2BC87;
	Fri, 10 Apr 2026 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823695;
	bh=pY4Ba+JrP/xTQAmwvt4Sblvq53DUrPINRCnMdCBk5qo=;
	h=Date:From:To:Subject:References:cc:From;
	b=HDyFrce5AOq/EGfeY1UdoV8DNpMgAy18kWHJM1sjAR8gGlb0lGVL/86T8A9JdQ406
	 geoVdL2hWTrXGNOfAnq/kY6NSEK4TpMk9WMO+y1nQNH3tMz9xsxHfqX6syvZMUj1PK
	 bzYUHDgCtqjEJkHt2pwcVZ7pxbRQ83NKHdjXp0R8JD++ws1pIDJb+QbVlpuQaSrK3+
	 elCptYV6iuLAdTbeeR+RbymhnVAR5noANk7G5ygRae6T0lvFrKQfmBeUjBXUKx1VNg
	 KMOPQf2nxfU/JqhQvoUzqUAfK3BjbJR+sYA7dzOFGZqkM+hZZWPxeRIyaCeQdbvVoP
	 M9E/X3gApmxpw==
Date: Fri, 10 Apr 2026 14:21:32 +0200
Message-ID: <20260410120320.163559629@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 38/38] treewide: Remove asm/timex.h includes from generic code
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

asm/timex.h does not provide any functionality for non-architecture code
anymore.

Remove the asm-generic fallback and all references in include and source
files along with the random_get_entropy() #ifdeffery in timex.h.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 include/asm-generic/Kbuild  |    1 -
 include/asm-generic/timex.h |   15 ---------------
 include/linux/random.h      |    3 +++
 include/linux/timex.h       |   26 --------------------------
 kernel/time/timer.c         |    1 -
 lib/interval_tree_test.c    |    1 -
 lib/rbtree_test.c           |    1 -
 7 files changed, 3 insertions(+), 45 deletions(-)

--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -56,7 +56,6 @@ mandatory-y += shmparam.h
 mandatory-y += simd.h
 mandatory-y += softirq_stack.h
 mandatory-y += switch_to.h
-mandatory-y += timex.h
 mandatory-y += tlbflush.h
 mandatory-y += topology.h
 mandatory-y += trace_clock.h
--- a/include/asm-generic/timex.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_GENERIC_TIMEX_H
-#define __ASM_GENERIC_TIMEX_H
-
-/*
- * If you have a cycle counter, return the value here.
- */
-#ifndef get_cycles
-static inline cycles_t get_cycles(void)
-{
-	return 0;
-}
-#endif
-
-#endif /* __ASM_GENERIC_TIMEX_H */
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -1,3 +1,4 @@
+
 /* SPDX-License-Identifier: GPL-2.0 */
 
 #ifndef _LINUX_RANDOM_H
@@ -152,6 +153,8 @@ unsigned long random_get_entropy_fallbac
  */
 #ifdef CONFIG_ARCH_HAS_RANDOM_ENTROPY
 #include <asm/random.h>
+#else
+#define random_get_entropy()	random_get_entropy_fallback()
 #endif
 
 #endif /* _LINUX_RANDOM_H */
--- a/include/linux/timex.h
+++ b/include/linux/timex.h
@@ -62,32 +62,6 @@
 #include <linux/types.h>
 #include <linux/param.h>
 
-unsigned long random_get_entropy_fallback(void);
-
-#include <asm/timex.h>
-
-#ifndef CONFIG_ARCH_HAS_RANDOM_ENTROPY
-#ifndef random_get_entropy
-/*
- * The random_get_entropy() function is used by the /dev/random driver
- * in order to extract entropy via the relative unpredictability of
- * when an interrupt takes places versus a high speed, fine-grained
- * timing source or cycle counter.  Since it will be occurred on every
- * single interrupt, it must have a very low cost/overhead.
- *
- * By default we use get_cycles() for this purpose, but individual
- * architectures may override this in their asm/timex.h header file.
- * If a given arch does not have get_cycles(), then we fallback to
- * using random_get_entropy_fallback().
- */
-#ifdef get_cycles
-#define random_get_entropy()	((unsigned long)get_cycles())
-#else
-#define random_get_entropy()	random_get_entropy_fallback()
-#endif
-#endif
-#endif
-
 /*
  * SHIFT_PLL is used as a dampening factor to define how much we
  * adjust the frequency correction for a given offset in PLL mode.
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -48,7 +48,6 @@
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
 #include <asm/div64.h>
-#include <asm/timex.h>
 #include <asm/io.h>
 
 #include "tick-internal.h"
--- a/lib/interval_tree_test.c
+++ b/lib/interval_tree_test.c
@@ -4,7 +4,6 @@
 #include <linux/interval_tree.h>
 #include <linux/prandom.h>
 #include <linux/slab.h>
-#include <asm/timex.h>
 #include <linux/bitmap.h>
 #include <linux/maple_tree.h>
 
--- a/lib/rbtree_test.c
+++ b/lib/rbtree_test.c
@@ -4,7 +4,6 @@
 #include <linux/rbtree_augmented.h>
 #include <linux/prandom.h>
 #include <linux/slab.h>
-#include <asm/timex.h>
 
 #define __param(type, name, init, msg)		\
 	static type name = init;		\


