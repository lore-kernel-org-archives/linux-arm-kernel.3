Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7C6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TZdbBrRkiWnQ1rnpXu49ru3ewTQuaoK95WbV8hYipU=; b=tR0ReCqlZq7NkfP3qGmynY34xY
	QXpqJFbsLz92ZA62UHVSDGV91EtcnLAedVANkHXekzi6g4+lduPs0arj4aCUsk3Xc3tVMJmQu1rzB
	0V0eW/RBHG3IWF6dLdNTu990eDADspOG0u2lkHXVWGmeaDdN6eBkX4Dw7EcAN2czrst8b6/CaA7hR
	iBPEy6bUb84FUvUWMWidXMQMBVeSfe1GhcB3KTmLtT6hMNsk4KMgUCSsnRRp+g2FMngvUfu/dcmEe
	Tx5wME4qMfwP7/k6Q+6yGZL4KTom3I7+aZf7d/A5+e9ip7WXIqbTfOhZBbkYd6OZBOrRD0xnS72Fe
	mibVfeuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzy-00000002CDL-47rl;
	Thu, 09 Jul 2026 11:32:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzq-00000002BvY-3MJe;
	Thu, 09 Jul 2026 11:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/TZdbBrRkiWnQ1rnpXu49ru3ewTQuaoK95WbV8hYipU=; b=SGEES9TIm9coxBG2CF6uhtmpbC
	ubiJQDf3ak1GbTCgcM2jaYipHq/v2lbqg51t9eMgLEx3tVFKawsz9zK3NS3TOSNODZeyOo79gm2DR
	dYR7D4tiyGKC9rq+ThygxPb7zDGl8ux7hxvSHjknVNinK0+kHrFrieEMRkh2u0T9HWUjN5X9GwC8Y
	bUKvK1c0YK1rv8OtGTsmCDf4X+g6hGEjossu0i0go6yo/8weoMNvbVuTKyCF2Oykpvg5ErLYnzgkd
	j9zS8Pz2Hzf1Lnhww57DDNQvQ6uuf8975GfqCwRY2dkBcfw3CVX6H5vjT5A7/Q+ZD8HKSOCATbVPB
	+mlmin9Q==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whmzn-000000098yg-0i5V;
	Thu, 09 Jul 2026 11:32:48 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TZdbBrRkiWnQ1rnpXu49ru3ewTQuaoK95WbV8hYipU=;
	b=qE9ykCaKrKugNciv2f8HmCCcRPsFRVI2mCh8jjFKwU8B1oeq+mJEzoaDDQd//b2fMmyrHB
	SV8k6lHvyJgNBWY649w55uYQmmUn3AxZ6S4UMAVjEMqmyPTFc3nnJUABZCJePW8ZDTdHjU
	FURPPbQgjHMuyuMM4spMZZAcXJIz3HqglmPzAJMcu0w5yehFwgkDuPwuZGByWcSLJpdPl9
	0OHSm5WZDX/K5fCxxplAfF7ujdAVFIWkP62B+75AQ63hI1WvTJbI+cb2WHwb7sQEcOl/n0
	GFrLxq1FFxFz64RwYIDrv4SNErec7HH/CB8MIpE8dHWX+kksn3euU5BBuGjXxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TZdbBrRkiWnQ1rnpXu49ru3ewTQuaoK95WbV8hYipU=;
	b=bH7h325/d/LEtOBRgSL3viObvKQno8LwTjy2KULMa9pnKAGP0Bekyl85NC/jtKCSDcEc31
	jkJUVX0UakDNcEBw==
Date: Thu, 09 Jul 2026 13:32:43 +0200
Subject: [PATCH 7/7] LoongArch: Replace CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery with IS_ENABLED()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-arch-clockmodes-v1-7-3fd780bbf851@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
In-Reply-To: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=956;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=tsTcF/C4JiOGSNucjpvjZzBIe7i/dK5sUhrvDZfcSUI=;
 b=27MWkT/6nAW1EaBrpgAB2pUzkQcFwvfWVX7EtflzxVOz4U01Vp77nbnDgwaWAWVSNR8GW+8I7
 Qh9l43Uc5U5DBlQc+Y+LHw2dYu5fJ9eSR3ztznaM+CuRgOCAOLweOWJ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_123247_335319_2643C876 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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

Now that there is a dummy declaration of VDSO_CLOCKMODE_CPU, even if no
vDSO is built, the ugly ifdeffery can be replaced with a cleaner
IS_ENABLED() check.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/loongarch/kernel/time.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
index dbaaabcaf6f0..dfc04d9f342e 100644
--- a/arch/loongarch/kernel/time.c
+++ b/arch/loongarch/kernel/time.c
@@ -212,9 +212,8 @@ static struct clocksource clocksource_const = {
 	.read = read_const_counter,
 	.mask = CLOCKSOURCE_MASK(64),
 	.flags = CLOCK_SOURCE_IS_CONTINUOUS,
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
-	.vdso_clock_mode = VDSO_CLOCKMODE_CPU,
-#endif
+	.vdso_clock_mode = IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY) ?
+				VDSO_CLOCKMODE_CPU : VDSO_CLOCKMODE_NONE,
 };
 
 int __init constant_clocksource_init(void)

-- 
2.55.0


