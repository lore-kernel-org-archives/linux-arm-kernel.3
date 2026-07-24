Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA8DC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 13:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wb2SX77zyxaYXrQzUmclJ/k81+yHIaZBLWgIqd5QYek=; b=rQ1HUt7+ZAz+nd1fE39nY4gyIT
	pptTWn9HaZbu4FqlAakvS9aFzN2XXg6vSPEpupxfUKNcsGn3o92UYsudy1WuIJ6zuL6wW+gFqoHFP
	4ckWJWJOJcY7FeLEv0TmlbjwO4Dyv6JeZJP8pXTkB9D/+kajzxceUxotxV9w66anCVWnYsgZnoyIT
	iw/Il+x4yg/w+qCGJnxMGC1V5Q+mM1s0gpC+z1aSv9TDfqop8Xe0sAa66eEym3HFRf7jvWsdtdaA/
	ZaxHOoBizjvhjNazQivDE28laQSVTZXDajhQHvy1nOreONCB/aKNWwqIV47gS8zunhzLVw6+ACtqr
	zOnYPV2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG70-0000000GUab-1B9z;
	Fri, 24 Jul 2026 13:38:50 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6S-0000000GUIS-12Ak;
	Fri, 24 Jul 2026 13:38:17 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784900290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wb2SX77zyxaYXrQzUmclJ/k81+yHIaZBLWgIqd5QYek=;
	b=fJQA63AhXqN0Wt6TrowHVZuSsMNP0G4WVVoLUsYDckEfWkcsS+utv4/QPUaNH5Bg828tO2
	ZTiTmBU2Z5XxJ/irTdAXpPPtpRqd7/nltgO5vmspMfkiLohJxq4mSeSa+Gh2msVxqp/i9O
	cv7/xUuqPSE29eGuUNPF+01vv6DY500HCfGh2Okt3fMAhmeSzdpVZiL6rU6hKW5z4Os9XD
	1InV/Grh5c8MB9aVWJfaPBqdruV8IbWeAxN2H/yvpPeOTTu0PjydJfuQ1M0R9w2HfCaqSh
	PvifLZ3qpIXrQgiYmLPaM0AfsYJGvnvMKHUjwNcj9o8kQlwDDPqdcsmR/RfwFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784900290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wb2SX77zyxaYXrQzUmclJ/k81+yHIaZBLWgIqd5QYek=;
	b=86dQJzWWaZAgS+vRVMF0ZufUKVhSBsgdu+ylGsup4jHHNu757Z3axqD9G1bvaW38+rYPvv
	C+R/sJ+vgrg3XOBg==
Date: Fri, 24 Jul 2026 15:36:23 +0200
Subject: [PATCH v4 6/7] clocksource/drivers/timer-riscv: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260724-vdso-arch-clockmodes-v4-6-ddbe447be860@linutronix.de>
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784900286; l=898;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6yZi1E2ORWX3erxZ2iLgMw+pOXO/qHsB3RdbekGUNbY=;
 b=nmad2uoX7O2hqUY1EMlB36avIhjqVM82Dv1sCDRFVS/iKzjJOA2F5DmkLQrmhAf+pwqMcVWqO
 BT3A90/wOmTB3fU2MFpx3uScqaGM9MwiSK27/z2LrHGJXh7kGVc5def
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063816_483875_00D26F0D 
X-CRM114-Status: UNSURE (   7.89  )
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

Now that there is a definition of VDSO_CLOCKMODE_ARCHTIMER
even if no vDSO is built, the ugly ifdeffery can be removed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/clocksource/timer-riscv.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index cfc4d83c42c0..b310e6721fac 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -98,11 +98,7 @@ static struct clocksource riscv_clocksource = {
 	.mask		= CLOCKSOURCE_MASK(64),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.read		= riscv_clocksource_rdtime,
-#if IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY)
 	.vdso_clock_mode = VDSO_CLOCKMODE_ARCHTIMER,
-#else
-	.vdso_clock_mode = VDSO_CLOCKMODE_NONE,
-#endif
 };
 
 static int riscv_timer_starting_cpu(unsigned int cpu)

-- 
2.55.0


