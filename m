Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1FFF4484C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=ckn3790Plbsh2S84qXvQH3wmGMizlSPUdQHepF2eyP4=; b=CXXdwvk71ewkhE
	nzWtoRS6V6FoSthXE8Rcuepv3PCIWRMhGo6GDbmBwdfAj8YnZlMi3mpmD2Jb39nuIRyDODCgE0+Xh
	4Kr27fG6V7j+O4rKVi4sezHBoMp5Rdblq6cqldMR0EMMBn3hed36t778ZG8i5APTkemx6p9zMQCxB
	dW5fm1X5v+yzAdKAhiPGYtDZ/echACbJKPhYALykIfgBXFX5ssO+scrscIvYadm9Kbp2kncELnaoN
	ShtBCJD1JRZ8AXA82sZBmSzgt8513IwUTzaBXLR4DedJSqP3KGkokMYUQCRGO0z71p2bGz3n2pOlb
	WE6MV3BKFjvNNeIEWfvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAqn-0000000CBhl-1as1;
	Fri, 10 Apr 2026 12:20:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAqg-0000000CBTN-0Wxi;
	Fri, 10 Apr 2026 12:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=ckn3790Plbsh2S84qXvQH3wmGMizlSPUdQHepF2eyP4=; b=j/SdxwAawpRlpmm9S4X4EfD40P
	TOGHHQ+Th308Jqu9n6lTdagIrBDs+tdXu3wTuxnB9Me6KEhMAhb9noHOCUVUdxS0hRbQ/e/YFQ8P/
	m892jQJvWex/z3JyqmrMdv38mEXtvq61biYo/Mup3raFg2iz68QdSSpbhRKqQQMN0niNLk0vw5NTI
	8Eau03X0Rn0oDhC6RexEjx1jI42OqDEeo/sSaoaKnwEJm7CUTP6QyzAlGSrTJeueoh/uZ9exr7PV7
	WwblWml/L6qyBYXb+4W4SNx3keqwfnVMUDUkTq7bphi3jsDmNYn3nV4gwBlEAwKhLZjXezYbDIUaW
	cuj/8XMw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAqc-00000009LVU-1PsW;
	Fri, 10 Apr 2026 12:20:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A040C438DE;
	Fri, 10 Apr 2026 12:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8D1C2BCAF;
	Fri, 10 Apr 2026 12:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823624;
	bh=oFanz67wDB6XocOAPDGw4dDZpTIkPCesLmisdDG6nxo=;
	h=Date:From:To:Cc:Subject:References:From;
	b=c0dC5JtrlZ2hDwVhQHVakSSF0GbYurUcyOeInN2NikRGB2GB116TXZbw4nZgMtYST
	 +trrlORaNRGlhOHpfrC+lW1HFBRAEy8GyOUXKZu1wlydXKozlVO6l7tAEsojNrD9kY
	 z8EDy3AU6BDmVg1em2KMGfc38GeNfIIV9PZdmIDh6XXPID1ZvpPfEKL37BFIXkriEy
	 vg9bLTMeocXCte6TCzTTMg21Eh6HrXJDyZdGV1tmWvL/lAElJukNPv/QpJCLNXioOw
	 AQtioNlgi2FcvW/yMQPolJ5GR/97GritVQBv4kElLuN4ah4YH0PTQC3eZtbzxU1vfd
	 IORnVjKLVUNIw==
Date: Fri, 10 Apr 2026 14:20:21 +0200
Message-ID: <20260410120319.131582521@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org,
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
Subject: [patch 23/38] alpha: Select ARCH_HAS_RANDOM_ENTROPY
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_132030_703192_7AF2F5B0 
X-CRM114-Status: GOOD (  11.89  )
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

Switch alpha over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
and providing random_get_entropy() in asm/random.h.

Remove asm/timex.h as it has no functionality anymore.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/Kconfig              |    1 +
 arch/alpha/include/asm/random.h |   14 ++++++++++++++
 arch/alpha/include/asm/timex.h  |   26 --------------------------
 3 files changed, 15 insertions(+), 26 deletions(-)

--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -5,6 +5,7 @@ config ALPHA
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
+	select ARCH_HAS_RANDOM_ENTROPY
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_MODULE_NEEDS_WEAK_PER_CPU if SMP
--- /dev/null
+++ b/arch/alpha/include/asm/random.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASMALPHA_RANDOM_H
+#define _ASMALPHA_RANDOM_H
+
+/* Use the cycle counter for entropy. */
+static inline unsigned long random_get_entropy(void)
+{
+	unsigned long ret;
+
+	__asm__ __volatile__ ("rpcc %0" : "=r"(ret));
+	return ret;
+}
+
+#endif
--- a/arch/alpha/include/asm/timex.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * linux/include/asm-alpha/timex.h
- *
- * ALPHA architecture timex specifications
- */
-#ifndef _ASMALPHA_TIMEX_H
-#define _ASMALPHA_TIMEX_H
-
-/*
- * Standard way to access the cycle counter.
- * Currently only used on SMP for scheduling.
- *
- * Only the low 32 bits are available as a continuously counting entity. 
- * But this only means we'll force a reschedule every 8 seconds or so,
- * which isn't an evil thing.
- */
-static inline cycles_t get_cycles (void)
-{
-	cycles_t ret;
-	__asm__ __volatile__ ("rpcc %0" : "=r"(ret));
-	return ret;
-}
-#define get_cycles get_cycles
-
-#endif


