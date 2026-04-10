Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D4DF4484F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=wet7X8fxJTL0AwKIA3Km4njiBeu4Q2oQdaC3YcfBnuE=; b=dGlYKQP0JoQS3i
	9BnG1r5GY3r9MYk3qI/ohtzasLdGl90UejiTes9Tsv9IaQ1nwI0/s3Isb/79zhTQTXZtnwtz2iGYa
	NeAon0sSvhVDSi2T8QeOSGt9ruQ9No4akYRyjPk7XxlmVHlijGaa6sgX4Sodx++URaPdfv0xYFDY2
	hTe/Bw1094o4Pp8QyBZ05OZ+SikeQvTTLt2C0Etl6GabcL9Fw6J7pRpBmJuyl0SdWc3KI0/eUt0sZ
	Xg1oPIK0jChNDZmX6FIVgFKwmjbdRl7VqxOjkcojc07+4ihmtCSMwpEX2E++wZSESVUZpg1v6eI9g
	8oY5+mbhN/lLIKdywywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArG-0000000CCT6-2gdX;
	Fri, 10 Apr 2026 12:21:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAr1-0000000CC1D-0T5v;
	Fri, 10 Apr 2026 12:20:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF571438DE;
	Fri, 10 Apr 2026 12:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A6BC2BCAF;
	Fri, 10 Apr 2026 12:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823653;
	bh=JK0/F7Ki9YiLWmMnKZ+Lr+3CWdB1is+mT2jM4Zqadew=;
	h=Date:From:To:Cc:Subject:References:From;
	b=OB4z6rmedzjF/tihT238p7staUYI70l/WLyVpYQgd3G/0qlK9BetgUNbHaxUOTJJk
	 qdDaLQwa1siZvXl47NXTJc0ORYA2dsT704qKM+lVSSRN4sldd+TbcnCJaaKLtMHkff
	 SfKJlNkL5h8guSKmd0Me9uWsWZCYIBa85rKbdrV18Ca38UzELO7GQROVPWzrTHMCfJ
	 QFdBWZuROAjUxl7+DX48sdEQxX7/xngz/AnUC+xaQ7wkdJF1oolh8aMOXz2mAve+hh
	 C3LVdoPqlu6sGEaRdYNI50vZs10DhqwpaJqHFXY4YWja3gycAdllpb8XCooIJE8rT+
	 LUw8ufY+z6WgQ==
Date: Fri, 10 Apr 2026 14:20:50 +0200
Message-ID: <20260410120319.528318344@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>,
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
Subject: [patch 29/38] nios2: Select ARCH_HAS_RANDOM_ENTROPY
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_052055_353965_DD2078D0 
X-CRM114-Status: GOOD (  12.94  )
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

Switch nios2 over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
and providing random_get_entropy() in asm/random.h.

Add 'asm/timex.h' includes to the relevant files, so the global include can
be removed once all architectures are converted over.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/nios2/Kconfig              |    1 +
 arch/nios2/include/asm/random.h |   14 ++++++++++++++
 arch/nios2/include/asm/timex.h  |    5 +----
 arch/nios2/kernel/time.c        |    4 ++--
 4 files changed, 18 insertions(+), 6 deletions(-)

--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -7,6 +7,7 @@ config NIOS2
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_DMA_SET_UNCACHED
+	select ARCH_HAS_RANDOM_ENTROPY
 	select ARCH_NO_SWAP
 	select COMMON_CLK
 	select TIMER_OF
--- /dev/null
+++ b/arch/nios2/include/asm/random.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_NIOS2_RANDOM_H
+#define _ASM_NIOS2_RANDOM_H
+
+#include <asm/timex.h>
+
+static inline unsigned long random_get_entropy(void)
+{
+	unsigned long c = get_cycles();
+
+	return c ? c : random_get_entropy_fallback();
+}
+
+#endif
--- a/arch/nios2/include/asm/timex.h
+++ b/arch/nios2/include/asm/timex.h
@@ -5,9 +5,6 @@
 #ifndef _ASM_NIOS2_TIMEX_H
 #define _ASM_NIOS2_TIMEX_H
 
-extern cycles_t get_cycles(void);
-#define get_cycles get_cycles
-
-#define random_get_entropy() (((unsigned long)get_cycles()) ?: random_get_entropy_fallback())
+cycles_t get_cycles(void);
 
 #endif
--- a/arch/nios2/kernel/time.c
+++ b/arch/nios2/kernel/time.c
@@ -7,7 +7,6 @@
  * License. See the file "COPYING" in the main directory of this archive
  * for more details.
  */
-
 #include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/clockchips.h>
@@ -19,6 +18,8 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 
+#include <asm/timex.h>
+
 #define ALTR_TIMER_COMPATIBLE		"altr,timer-1.0"
 
 #define ALTERA_TIMER_STATUS_REG	0
@@ -112,7 +113,6 @@ cycles_t get_cycles(void)
 		return nios2_timer_read(&nios2_cs.cs);
 	return 0;
 }
-EXPORT_SYMBOL(get_cycles);
 
 static void nios2_timer_start(struct nios2_timer *timer)
 {


