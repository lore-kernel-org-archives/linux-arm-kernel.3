Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB8AF44847
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:cc:Content-Type:MIME-Version
	:References:Subject:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=QNbKEqaPolXnyDtyb0N89kzCxyVMHVZnkdKQSB7ziQU=; b=G2Otp1wyQdo0XH
	RaztXKAbSQxBArCcWN+tYsqpw3jeeh4x/WzDAFbQ0Qf1ZKzHdvEdJdAbLUnwPOjHhTIzAUyGUGUP7
	V7xvzrZgz4Ukrvk9veSsDMTKg/rJwnAi4xSWiOf4KfSlKDDhl8zv/5MMeijA8Y5ajuxDgERjL91Q9
	BctJot9Frc71Akciw1equd7lMGV/OMX1AIc/0VNHBjwnt8Ou6Ih2pF2jFn47odduCRLbODboUuy1R
	2utbAI0XxPC2UHi5hyQJNa77L5HpJQKjqTAdXsQ3U0HGiZaMb78mUIA3VBeHBf8d6dl8F8/NO1ocH
	+VfDEiIYVxT8CvpcPJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAoy-0000000C99w-1tg3;
	Fri, 10 Apr 2026 12:18:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAow-0000000C98i-2q6G;
	Fri, 10 Apr 2026 12:18:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 562114415B;
	Fri, 10 Apr 2026 12:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EC1C2BCB0;
	Fri, 10 Apr 2026 12:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823526;
	bh=OWF9pG0hQ95RygMnh7+vDhgeHyKnJRYOWEj0GBEdTEY=;
	h=Date:From:To:Subject:References:cc:From;
	b=gYJITPmdy2GNPsbI6AD2iZ7zhMgePGS+gqPbXQCs7WsAhhu/qyX8hH+Xi69K/urPl
	 BoSeBlt4BbqU4ZnISQ8slAdj5VCjiDRcN9bfEzsBBE9dj/wWUHwDFECfvHb21gTPQ5
	 cvjmyUKF+jJ25R6iZ5vAzO3xaA8XXwp+1aea+F9V1esc/zHHX5PN7paJBTByHcDBl2
	 auQKRV9dXMsXdujNzqathwxe2n8RWyCswG/DXqH2EllhOxm/ndPsrTIJX4WzacriA/
	 t/DalYn89VnEQy6E+ROiviOqorgI/E12LPFkiSGiJSdwmaaiky6k8Wx7OG7Y+w6GUr
	 Ni5ruNMG7XCYg==
Date: Fri, 10 Apr 2026 14:18:42 +0200
Message-ID: <20260410120317.776571540@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 03/38] x86/apm: Remove last LATCH usage
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_051846_758216_C4A68FBD 
X-CRM114-Status: GOOD (  12.90  )
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

LATCH is a historical leftover and has been replaced with PIT_LATCH in all
other places a decade ago. Replace the last holdout and remove the
definition from jiffies.h.

This allows to remove the otherwise unused CLOCK_TICK_RATE define in the
next step.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 arch/x86/kernel/apm_32.c |    4 ++--
 include/linux/jiffies.h  |    3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

--- a/arch/x86/kernel/apm_32.c
+++ b/arch/x86/kernel/apm_32.c
@@ -1196,9 +1196,9 @@ static void reinit_timer(void)
 	/* set the clock to HZ */
 	outb_p(0x34, PIT_MODE);		/* binary, mode 2, LSB/MSB, ch 0 */
 	udelay(10);
-	outb_p(LATCH & 0xff, PIT_CH0);	/* LSB */
+	outb_p(PIT_LATCH & 0xff, PIT_CH0);	/* LSB */
 	udelay(10);
-	outb_p(LATCH >> 8, PIT_CH0);	/* MSB */
+	outb_p(PIT_LATCH >> 8, PIT_CH0);	/* MSB */
 	udelay(10);
 	raw_spin_unlock_irqrestore(&i8253_lock, flags);
 #endif
--- a/include/linux/jiffies.h
+++ b/include/linux/jiffies.h
@@ -56,9 +56,6 @@
 #define SH_DIV(NOM,DEN,LSH) (   (((NOM) / (DEN)) << (LSH))              \
                              + ((((NOM) % (DEN)) << (LSH)) + (DEN) / 2) / (DEN))
 
-/* LATCH is used in the interval timer and ftape setup. */
-#define LATCH ((CLOCK_TICK_RATE + HZ/2) / HZ)	/* For divider */
-
 extern void register_refined_jiffies(long clock_tick_rate);
 
 /* TICK_USEC is the time between ticks in usec */


