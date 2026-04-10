Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799B7F4484C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=CLIogZKtxkoQJBct1ivrzjEJ9GwuhZlm0ijU/m5U3Ys=; b=n/AYMu+yIev2+z
	eDNDiXoagMhpDOustFjbA/9Sjm7jXwJYeVmvp/9lAsvgiqgWGwlEOd0ADnizImkSbiTOQW8VyTSDU
	CcoULSNqZXO18efhzVLAmGMDSlUz2gfNsnQ+g7/hsE48K+sdKo7eH05K5dtn2OK32ifEo1k2depXz
	2AM14JWXm0eS3b60wOPz1F+al3HCAAmQmy2KdzZ7PaL78taZvBG1sD03/eRowVWytBW2J7gQVjqfb
	5or2Yv4/+1ZzwsU1xDqevNwtGF4aQYwMxYBz5VWxe74YPgy2S9reKga0gcs21o96saHBUTT9ud5EV
	yAOSe+eQa/cPt4xN6cbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAqj-0000000CBdN-3SCf;
	Fri, 10 Apr 2026 12:20:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAqc-0000000CBRO-0TkH;
	Fri, 10 Apr 2026 12:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1972441C0;
	Fri, 10 Apr 2026 12:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8258C2BCAF;
	Fri, 10 Apr 2026 12:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823629;
	bh=Xj914OB0ywB5KtjAdUFbVTIri4m7J0/9GAWloccpVyg=;
	h=Date:From:To:Cc:Subject:References:From;
	b=UacNbv5zzA6AzbAlRM4n4U5NaKejyQd8mANj0iWZ5RQiRAJWixjyMgZjbiDhDTyzO
	 ay62PPnTA47MG/rmdeWa/4KfjNAnW4xtTzJ34RAhThlg0KY8nNByGNrsu9zE469dPQ
	 hWtTJvAZ4ZE2brA8ZCckIrkzYMvi5clv/chlzjJ3PYteh92RUSFzhMNQu3+ZTJTDCI
	 kJ6mPTSZ1AZhD1XvkSSEOtM9nEZR/77fxCsYwUjbpiFSE3ESK6EP7pbE6Ao/WrdTRD
	 AlaT3EdsheI/WmWdaf0zz7rbsJUIcktKioLIztC89PcrEqXmxk39mPCnXjzI5yFh8X
	 xNx6W4PqnkQAQ==
Date: Fri, 10 Apr 2026 14:20:26 +0200
Message-ID: <20260410120319.197793115@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
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
Subject: [patch 24/38] ARM: Select ARCH_HAS_RANDOM_ENTROPY
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_052032_909969_C946ACD6 
X-CRM114-Status: GOOD (  11.86  )
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

Switch ARM over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
providing random_get_entropy() in asm/random.h.

Remove asm/timex.h as it has no functionality anymore.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/Kconfig              |    1 +
 arch/arm/include/asm/random.h |   14 ++++++++++++++
 arch/arm/include/asm/timex.h  |   18 ------------------
 arch/arm/lib/delay.c          |    4 ++--
 4 files changed, 17 insertions(+), 20 deletions(-)

--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -22,6 +22,7 @@ config ARM
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
+	select ARCH_HAS_RANDOM_ENTROPY
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_STACKWALK
--- /dev/null
+++ b/arch/arm/include/asm/random.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASMARM_RANDOM_H
+#define _ASMARM_RANDOM_H
+
+bool delay_read_timer(unsigned long *t);
+
+static inline unsigned long random_get_entropy(void)
+{
+	unsigned long t;
+
+	return delay_read_timer(&t) ? t : random_get_entropy_fallback();
+}
+
+#endif
--- a/arch/arm/include/asm/timex.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- *  arch/arm/include/asm/timex.h
- *
- *  Copyright (C) 1997,1998 Russell King
- *
- *  Architecture Specific TIME specifications
- */
-#ifndef _ASMARM_TIMEX_H
-#define _ASMARM_TIMEX_H
-
-// Temporary workaround
-bool delay_read_timer(unsigned long *t);
-
-#define get_cycles()	({ cycles_t c; delay_read_timer(&c) ? 0 : c; })
-#define random_get_entropy() (((unsigned long)get_cycles()) ?: random_get_entropy_fallback())
-
-#endif
--- a/arch/arm/lib/delay.c
+++ b/arch/arm/lib/delay.c
@@ -42,9 +42,9 @@ static inline u64 cyc_to_ns(u64 cyc, u32
 
 static void __timer_delay(unsigned long cycles)
 {
-	cycles_t start = get_cycles();
+	cycles_t start = delay_timer->read_current_timer();
 
-	while ((get_cycles() - start) < cycles)
+	while ((delay_timer->read_current_timer() - start) < cycles)
 		cpu_relax();
 }
 


