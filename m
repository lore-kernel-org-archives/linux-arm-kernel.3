Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC615C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ukFASTVcwJCA9KHs65XStV/NanPY9+t/aJWekQ6IKw=; b=0Y0bKrrdk7DP4vnP93MPtqhkmf
	/TwNl+IS/OK0CdCEbvLbhf3OZ8Pvj/pbQdirG9jsbtbzVQTwN/SHwC1/9MM2Cu+f/inas5oiUN7S0
	/DCMfmMN6CsGeHU1DBJlld9XYF8DYwN/0yGpQWYvjLh92KJHwE8RYObQXhcyplbHFIj/B5AZdxNPA
	uboxnyAHo1JamfGOaZhsvtL8iXVZAqvIojfFPuKKoG3SkBuuQGeGyIQGT1UOnqkvNEHQDiZ0cGZov
	1RgTSAz2RVoVf9Y0BaR/gTvHvlD5JXMN1DLnwkMykWuWAWs9JZ4RE/5gjlPHlQ7XAG4R5nQBDOS+w
	rVynOvog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whn0A-00000002CW9-1lA1;
	Thu, 09 Jul 2026 11:33:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzp-00000002Bqu-2e4i;
	Thu, 09 Jul 2026 11:32:52 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ukFASTVcwJCA9KHs65XStV/NanPY9+t/aJWekQ6IKw=;
	b=xLBBBBbh4/VWO9XnxdBWWEUvqzn9mmxKtghNmN65V+Cf4har8MzUX9hyoH+gOUFNJ0QDZH
	mhrQzKul8EzypjUmmlpwnx86X/j6mp+M74+44prDPC5Lb8pQqlkpFANr1hPoiweBhjIMvL
	IJQ6MiL3Yuyh11sCsUB/qGlCV3fC2EXReRUTsEgy1o+ZC4hqFkeSEsi0TIZ4voWO+rfnY1
	Dv8Px5LpQHM/R1zjHRBtez08FAjNDJgYULJlhWKa/IrL6yP6/p/2kOaw2JHAzOmlqglsU6
	/03UR9MkVzy/rbOrYQVZ342ujoRW8Tk7nPvjQmW03SqWiWzVIxa6VuNOlviODw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ukFASTVcwJCA9KHs65XStV/NanPY9+t/aJWekQ6IKw=;
	b=OgMhKys2yLyiiIrzt/ebS8mgwv4WAKvLSUlGBZDOz+da0ok2x1dai57gPiCFIfoQeTZIiC
	uHk5AT5qmEA4l1Dg==
Date: Thu, 09 Jul 2026 13:32:41 +0200
Subject: [PATCH 5/7] clocksource/drivers/arm_arch_timer: Replace
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-arch-clockmodes-v1-5-3fd780bbf851@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=1366;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HBDbLxQ/mmLThuSCavhDFNuAv2+3px29VTHQ8QYWw1w=;
 b=/EvHsm6ydzGcPsxrNvqkQUB75XQjGIMB3dJQHMvHaYcR1e6vOjowSLWMYmBC9iC39j5MyPR+r
 GKnBIHG7yBIC0ZzIDI8rObHsO7fQLB+a+bRP7h1extXlNquFlV9wR/m
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_043249_828764_03BA937E 
X-CRM114-Status: UNSURE (   8.29  )
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

Now that there is a dummy declaration of VDSO_CLOCKMODE_ARCHTIMER,
even if no vDSO is built, the ugly ifdeffery can be replaced with
a cleaner IS_ENABLED() check.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/clocksource/arm_arch_timer.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 4adf756423de..d67125a8730a 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -56,11 +56,8 @@ static struct clock_event_device __percpu *arch_timer_evt;
 static enum arch_timer_ppi_nr arch_timer_uses_ppi __ro_after_init = ARCH_TIMER_VIRT_PPI;
 static bool arch_timer_c3stop __ro_after_init;
 static bool arch_counter_suspend_stop __ro_after_init;
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
-static enum vdso_clock_mode vdso_default = VDSO_CLOCKMODE_ARCHTIMER;
-#else
-static enum vdso_clock_mode vdso_default = VDSO_CLOCKMODE_NONE;
-#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
+static enum vdso_clock_mode vdso_default = IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY) ?
+	VDSO_CLOCKMODE_ARCHTIMER : VDSO_CLOCKMODE_NONE;
 
 static cpumask_t evtstrm_available = CPU_MASK_NONE;
 static bool evtstrm_enable __ro_after_init = IS_ENABLED(CONFIG_ARM_ARCH_TIMER_EVTSTREAM);

-- 
2.55.0


