Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22E1C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 13:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQMLx+20gZIPhu6fhJcix+G46/n6BMZRZhFfen7tOCo=; b=x4Le8iZck2TfsGJP961oFv4/vX
	2PwzmwsL8yDkCiFEAJ6Tx7otPPKGCnasqtH9KhIHyxI6OmJjRnQCiB7FPioOoOfKWdcDEwEPwqOF9
	Dhhi2zy5Lstdg9filHhS5VzLWvMwDmIaO1gmvB7YSavISz2neFUfuRTCPJ0j//X+7vVgWoXofjeHo
	pIiAFE5tH0L1aQVlBwr0AHuli79z1Y90qqtgNngpTvTvxDuI5rgUHJHjX4z7RnBty+5pI0R1WgUz3
	LebhfguEaKGiM5Yu8G0PSZK5v3QBekNM7/DadvsIz/yqsmIIXLFyDNJtdxmSXLz5v0Xg5q+5v4maA
	GXIOQvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG77-0000000GUgx-2Q2b;
	Fri, 24 Jul 2026 13:38:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6S-0000000GUIT-11bd;
	Fri, 24 Jul 2026 13:38:17 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784900290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQMLx+20gZIPhu6fhJcix+G46/n6BMZRZhFfen7tOCo=;
	b=uqUzV0NYFb7ieencYml2faMhFQzti7121pHxXW9cmMkJRXRbna9CO2POLwIjHKLsM1H4xK
	Dd+sjptgKWWJd6EX+F9KhC/hpNGJ0/GO9+4oJzoxqiGxR0DK7cW0wjEYKWjC2balVEEKc6
	e2rVK+ayx0idQ7Sl6p5ptYgn6hmKFQ/Ta9AhmHnlW9+BH4ADrGPR071uSVSDDFADEWAB0f
	NY4ws6fqfIjtqUDPOpP9BsAZyPdeOhrc2WikDFnliqMoY4uOUt4GWRsM0PHHLgGJ2RA6HF
	+BWuJ1FIgDdlpFf1S6CXSkfIpc3FdehXz5UsqnlJu1e2VLFIXwAamCl1mGKyKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784900290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQMLx+20gZIPhu6fhJcix+G46/n6BMZRZhFfen7tOCo=;
	b=QdpEAYG5R2YSM0ionPd/7GINsEOmj9QnFSv5exEX+24Cp6+grLf8aMdPl8z4sH7AibE+E3
	8QTPGdJjY08s/lBQ==
Date: Fri, 24 Jul 2026 15:36:22 +0200
Subject: [PATCH v4 5/7] clocksource/drivers/arm_arch_timer: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260724-vdso-arch-clockmodes-v4-5-ddbe447be860@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784900286; l=1205;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6njepM9aoRoFusxbCJ2Ptn3ocLjwqPODCMiHZfeqmAQ=;
 b=YJHIR6wb3YNPF73ed+3uprMQgLye4yx87dQoWXQ018PvGabImJT4D4l3VYkwXmofSixRkGii1
 OkSo794dInuAtIcjhdqMoxSjVlGQJ9s9KPkzCm00ye2yWwqDYaX18XD
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063816_490707_6C7237B5 
X-CRM114-Status: UNSURE (   7.72  )
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
Acked-by: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/arm_arch_timer.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 4adf756423de..a5157d8a8a13 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -56,11 +56,7 @@ static struct clock_event_device __percpu *arch_timer_evt;
 static enum arch_timer_ppi_nr arch_timer_uses_ppi __ro_after_init = ARCH_TIMER_VIRT_PPI;
 static bool arch_timer_c3stop __ro_after_init;
 static bool arch_counter_suspend_stop __ro_after_init;
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 static enum vdso_clock_mode vdso_default = VDSO_CLOCKMODE_ARCHTIMER;
-#else
-static enum vdso_clock_mode vdso_default = VDSO_CLOCKMODE_NONE;
-#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
 
 static cpumask_t evtstrm_available = CPU_MASK_NONE;
 static bool evtstrm_enable __ro_after_init = IS_ENABLED(CONFIG_ARM_ARCH_TIMER_EVTSTREAM);

-- 
2.55.0


