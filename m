Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0A6F4484F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:cc:Content-Type:MIME-Version
	:References:Subject:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=hS8C4KqVeUlIUjtSj7w2Upw8HyApf1Pu0cIqAYxRChU=; b=0AnP19oxp2sL8x
	hImpZyWIsQ7n4t4mJy0W9c2acBjnavUPKEZ96LSdsNtiHkYOUJ0eYs4ugynOerMziVt72F6Lutffa
	6FTP/pIL88kje4Q0/agjIIqkzJIzF+H8XXDjrVTio9IH4eSPoUKl2L4IHFF36bi3kNybpvzm9YJno
	+NYmYt0XCAxP3+xWKxe5ga2+6YYAziojQE7+DHa4EJASvrbAmL6vfAaoUrDBLlSy4YXuV5ETfwSVn
	o8zmhvMdzjm5dqc7kNFWa4ixICHd4ELT9T4nr8Er4xIwiqVBdv1qeOPsf/Atd6F7UZvBYxJ+cyw+d
	SI/8RSrklCL6gVJaceqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApN-0000000C9dQ-3E2N;
	Fri, 10 Apr 2026 12:19:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApL-0000000C9ae-3Fag;
	Fri, 10 Apr 2026 12:19:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 32D916024D;
	Fri, 10 Apr 2026 12:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455B0C2BC87;
	Fri, 10 Apr 2026 12:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823550;
	bh=bea3byi4f+lJwA9RE9L4RIIWG0LfPmc09XAUdHtlAlE=;
	h=Date:From:To:Subject:References:cc:From;
	b=YwhpP/sfl2uNAokHMGyDzPyXqsYG5Z3HHapkhzwVASiSkGSv1ImeSFBY018VYZGU6
	 EPRk8H/tD4bE94DCGFfik82fydH/mvkzeKH2zcGHFzmiPQlK2yTJNXmBvp6CR6/aKP
	 ZUXJ1ridIfNl+octSklnUsCiAFVq0bMAbDZHArZ2XlGiEpILEnKNdARJlXe1YoLGU7
	 gTGiAjrmuKfAH7Stm5YSWpKnJ3J0WABG0fiD/+Dm/7aJCfY6aDBkC0dcXhqkELemEA
	 OLCKD9b/UmnIij2UMaT5laELpK9/RUq1POEHXDOcdk6mujQiavRoj/L2U3OHpVV16q
	 LiEll066ex31A==
Date: Fri, 10 Apr 2026 14:19:08 +0200
Message-ID: <20260410120318.121043259@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 08/38] x86/tsc: Use rdtsc() instead of get_cycles()
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

This code knows that TSC is available so there is no point to use the TSC
feature guarded get_cycles().

No functional change.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 arch/x86/kernel/tsc.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -371,12 +371,12 @@ static u64 tsc_read_refs(u64 *p, int hpe
 	int i;
 
 	for (i = 0; i < MAX_RETRIES; i++) {
-		t1 = get_cycles();
+		t1 = rdtsc();
 		if (hpet)
 			*p = hpet_readl(HPET_COUNTER) & 0xFFFFFFFF;
 		else
 			*p = acpi_pm_read_early();
-		t2 = get_cycles();
+		t2 = rdtsc();
 		if ((t2 - t1) < thresh)
 			return t2;
 	}
@@ -468,13 +468,13 @@ static unsigned long pit_calibrate_tsc(u
 	outb(latch & 0xff, 0x42);
 	outb(latch >> 8, 0x42);
 
-	tsc = t1 = t2 = get_cycles();
+	tsc = t1 = t2 = rdtsc();
 
 	pitcnt = 0;
 	tscmax = 0;
 	tscmin = ULONG_MAX;
 	while ((inb(0x61) & 0x20) == 0) {
-		t2 = get_cycles();
+		t2 = rdtsc();
 		delta = t2 - tsc;
 		tsc = t2;
 		if ((unsigned long) delta < tscmin)
@@ -553,9 +553,9 @@ static inline int pit_expect_msb(unsigne
 		if (!pit_verify_msb(val))
 			break;
 		prev_tsc = tsc;
-		tsc = get_cycles();
+		tsc = rdtsc();
 	}
-	*deltap = get_cycles() - prev_tsc;
+	*deltap = rdtsc() - prev_tsc;
 	*tscp = tsc;
 
 	/*


