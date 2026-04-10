Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF95F4484C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=vKymtlo11yiDU4TLKycOojSP+rmgc8Jkf+2yejheXps=; b=A2imFia90VIkEL
	w5+S2Di9GpltmZBKej6gtwHfoGzMZJoPoYapwPiMGrAP0nI3yPLPNiMBD6RT2O3rprm26V89TkehY
	OAr6Ew5wGGEM0oYsi7ZSV+paAWVyH1wGVIffDHyrrv1MKeZ91+W6TTVm8HddAxm/tB/IgbpoMGdUN
	TnMSdDevXP+XBJBock3fy1FhxpZJSPT8JPBzMGu9jlvuvmq8Wpl6YWEmTV+zfcyvjjrwDaBDyazaQ
	EsMI+9/9dMP9xhwiVV3iO04NOMSXifKt+1S9MXxNvNhbnOS8NvcM2xBfjr9f1SqNyJ6oQUKpCAAo/
	7caUaqXgLcV/gKXqyJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAr3-0000000CC6c-3hCu;
	Fri, 10 Apr 2026 12:20:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAqr-0000000CBmv-3hT3;
	Fri, 10 Apr 2026 12:20:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2A206111B;
	Fri, 10 Apr 2026 12:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04A4C19425;
	Fri, 10 Apr 2026 12:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823643;
	bh=ZI1DuZTKY+73ZiUZu5YDxjD9E28Vsj2HJPMLgb9lTAs=;
	h=Date:From:To:Cc:Subject:References:From;
	b=aKc8BIj04xl8fMPMfIdxvFnc9Be7sg+HcqnW4NP8XAVA8CoHWWZUH1TGoEDd3vKKD
	 FNpRo6Iom4qBRwumLXapTj7hfgRDejsC7j6E+L/Vx4C85D2LE1/deOAcMcctONxvIo
	 HMR5AMjZPk8wC2GcrGQEDXlt0rYZP0bNeTIqA2wyhnF5OK38Pv/q09G+oh4E6MeUyG
	 /IRrdxDk2wKuJ9eIif/wOJjQhHy2AsumkYu8PWY0TnTc6wXQmoLW+lJrShxrt0E6Gb
	 m+nyDRqFv+r0pZBlp7wkM/XjcKkMGym/WCszxlys26yMLXsGUqt11/GgfHwii1mXtv
	 FSYiSRKkHgM1Q==
Date: Fri, 10 Apr 2026 14:20:40 +0200
Message-ID: <20260410120319.397219631@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
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
Subject: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
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

The only remaining usage of get_cycles() is to provide
random_get_entropy().

Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
providing random_get_entropy() in asm/random.h.

Remove asm/timex.h as it has no functionality anymore.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 arch/m68k/Kconfig              |    1 +
 arch/m68k/amiga/config.c       |    1 +
 arch/m68k/include/asm/random.h |   14 ++++++++++++++
 arch/m68k/include/asm/timex.h  |   25 -------------------------
 arch/m68k/kernel/time.c        |    2 +-
 5 files changed, 17 insertions(+), 26 deletions(-)

--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -8,6 +8,7 @@ config M68K
 	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_PREP_COHERENT if M68K_NONCOHERENT_DMA && !COLDFIRE
+	select ARCH_HAS_RANDOM_ENTROPY
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if M68K_NONCOHERENT_DMA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
 	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -36,6 +36,7 @@
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/config.h>
+#include <asm/random.h>
 
 #include "amiga.h"
 
--- /dev/null
+++ b/arch/m68k/include/asm/random.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASMm68K_RANDOM_H
+#define _ASMm68K_RANDOM_H
+
+extern unsigned long (*mach_random_get_entropy)(void);
+
+static inline unsigned long random_get_entropy(void)
+{
+	if (mach_random_get_entropy)
+		return mach_random_get_entropy();
+	return random_get_entropy_fallback();
+}
+
+#endif
--- a/arch/m68k/include/asm/timex.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * linux/include/asm-m68k/timex.h
- *
- * m68k architecture timex specifications
- */
-#ifndef _ASMm68K_TIMEX_H
-#define _ASMm68K_TIMEX_H
-
-static inline cycles_t get_cycles(void)
-{
-	return 0;
-}
-
-extern unsigned long (*mach_random_get_entropy)(void);
-
-static inline unsigned long random_get_entropy(void)
-{
-	if (mach_random_get_entropy)
-		return mach_random_get_entropy();
-	return random_get_entropy_fallback();
-}
-#define random_get_entropy	random_get_entropy
-
-#endif
--- a/arch/m68k/kernel/time.c
+++ b/arch/m68k/kernel/time.c
@@ -26,12 +26,12 @@
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/irq_regs.h>
+#include <asm/random.h>
 
 #include <linux/time.h>
 #include <linux/timex.h>
 #include <linux/profile.h>
 
-
 unsigned long (*mach_random_get_entropy)(void);
 EXPORT_SYMBOL_GPL(mach_random_get_entropy);
 


