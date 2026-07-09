Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640C8C44508
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=js0vaP5nbNwcNIYrCXst9vVmG9tcENf2qeLGcWeiwxA=; b=Exmr8+aT94wYxzbvG6vP54OX/j
	VOlYtVKQY+23Ck69lGdCD4ntNsY61rjj/Fmd4PIyI2gL+GjcINrfEsb/yH3E26P8ld33EMxDg7i66
	wVY+nREqrPi+flCjgXJDpx5fytnF3MZEARqnOLdAZfqZYnC+8X3AtgVzbU0sfP2oilFdryfObPWAl
	0pX82bg4Jzo7HQoKlpzu4PJUX8caxcS8z8R47LghwDx3kFRKCgCD/32xIDB0e2EUhYZ3tPnlEhKU4
	Rdp8GJvmKzxJf0KtMumqG+yuEuadPmzVbk3e6G89cfOJFUFtALeTRrpR7+RxoGkjuBDr5LnEBEuty
	MODQQqPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzs-00000002C0x-23Fp;
	Thu, 09 Jul 2026 11:32:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzm-00000002Bp9-348j;
	Thu, 09 Jul 2026 11:32:49 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=js0vaP5nbNwcNIYrCXst9vVmG9tcENf2qeLGcWeiwxA=;
	b=G1B5E6g1lV0WBctrCeAuI2EktZx6NZNOCwaU4W+HwWbS+gvAsponEz1VMyQ8tM40Hc8owF
	+x5uQMIevWKuDtG7FF2RbnPweHb1b0+u7UGRz4RuCN5pKEzPa7ZgAQB3vRWEaYrG1ZfEcd
	huGAFbrT50h4C6acrIhMA6hAirN0klf2sC1OPGwPHQItJQonDNKSvIOQ62djPQJiOQKrZZ
	U6k8VZY9wKLYQZONhdskn+yM2kiUn2rc/aEWr18ieOE5DSr1WJAHa6iZ1RDRcScByCCFQZ
	Xd6y59j2a7OHEsFmjwqJeRHL83aD712bCkozDQotGzUtGi3XqdLPObXOzMnktw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=js0vaP5nbNwcNIYrCXst9vVmG9tcENf2qeLGcWeiwxA=;
	b=cwSqdujTT7iDvRMcmoMRrwAXfht7s86XKdpgPR8idw5KvHg0klV/uFbi10aLdEX93n5iPm
	w+zwV6MbyExus/Ag==
Date: Thu, 09 Jul 2026 13:32:42 +0200
Subject: [PATCH 6/7] clocksource/drivers/timer-riscv: Replace
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-arch-clockmodes-v1-6-3fd780bbf851@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=1080;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=7G4NMoLshPcdVswq+VZJCTeRBiPlUiYrF8fwlrRj/uk=;
 b=+3rICIuTC6LYbv8a3J2iDAsVddreeZXz8SonYTwvPP3IpMLBejhyOnRPxIEPY1IWeVWIRnUod
 AqapUTyoS+sA1bO2X6bjVrHoXXReK7U+ezdW0CvqFmzOuexzTPSsCgr
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_043246_941674_EBDC1567 
X-CRM114-Status: UNSURE (   8.58  )
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
 drivers/clocksource/timer-riscv.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index cfc4d83c42c0..82bd380b3dda 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -98,11 +98,8 @@ static struct clocksource riscv_clocksource = {
 	.mask		= CLOCKSOURCE_MASK(64),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.read		= riscv_clocksource_rdtime,
-#if IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY)
-	.vdso_clock_mode = VDSO_CLOCKMODE_ARCHTIMER,
-#else
-	.vdso_clock_mode = VDSO_CLOCKMODE_NONE,
-#endif
+	.vdso_clock_mode = IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY) ?
+				VDSO_CLOCKMODE_ARCHTIMER : VDSO_CLOCKMODE_NONE,
 };
 
 static int riscv_timer_starting_cpu(unsigned int cpu)

-- 
2.55.0


