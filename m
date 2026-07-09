Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17FAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlYUd92+ScLDxYlFwSuTjK/TPM/lpz0Ba9+m5/5v7MI=; b=l63g/0s4wBOI0PTspN4jQVJ4tN
	kv4neL2pcnw7w5aqqKcGhCqiV9Ed40mGMf79sV01zLMN/yk7VYLElICR97kPo89NfJQdaIfVgYbb8
	PNJuIPLcBH0KTKqMNyOb7JlZ9cAW5X4Fl4skMOEANuyuJLvCiI4xnkl9OAaSKYdtjAz0P6A6fVdir
	5AEAJXuMP9ZCYdiwICI2JW6a406n93fhdRA2qVpVz4+730h11vtmkiWQ7JBZyrnIGcHDHD8lwtLFg
	HZcoYQy6BdSX2Rt8Wk4BGtVc+vtqhYxhvj4LpLw/qUacbsWceMyUUPg/Ut0GJeMwd5pU0t4UM3hV5
	H9bx2xzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzt-00000002C2R-0SZi;
	Thu, 09 Jul 2026 11:32:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzp-00000002BsY-1UIs;
	Thu, 09 Jul 2026 11:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YlYUd92+ScLDxYlFwSuTjK/TPM/lpz0Ba9+m5/5v7MI=; b=lZDlGAV211zwPT7mFhlNUR73+T
	aBIqNwMflvZhARzkymcYttYNpmei2VgficLzIs42HWl5U1mkquwiaqQZnGalNARqF+bmYpxvAP5HY
	K3/ef6GaJCmcyg7H2J7jxWsJ4isvppyuRQ+I4yYaE4l3Mq3B+m2ZJNbz4UMvWzqSQhDv+lM/ZPw89
	rtmN8l7CPRSWi2592KwA3Yv0SAs4i8kz3UJwvUrL2IcC5CqdalcKUAnyH2JwlrAG2wisKrc3TuIII
	FSgJOU/64YYMdIMhBSCHINqEnbkxk6NMdxLTXYlWHWqve4trGw36oHlapsMS+Du9UTadSE+kb5AZI
	PWR+TFDQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whmzl-000000098xX-088k;
	Thu, 09 Jul 2026 11:32:46 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlYUd92+ScLDxYlFwSuTjK/TPM/lpz0Ba9+m5/5v7MI=;
	b=IlULMl+4CtL6rM7d/CgRXp7QX97GF/Ck8C6qLxe+ic36JA7Bs2T6idMQqbsv46MVmx46uT
	kisfnPSYN+glvvPduDXY4WYQuLUCHypJ3V11FB9c72SOy6SA+iQWm6+5Z3M5okmVfeyPjT
	/td9lRNm3vrMZhzE8MOlzu7ejXjcPa6RNxsMpTEb4PyYzgKSmOzel/tPda942IPlusMGfq
	mH9VxaHynt0XxkfcggEtw/6x1U4OBJhcQ/+JyclLcqKZ6V6WdHGTTk4Oz+F00Ep2NI4Q/f
	DoSek3/iaDnZ9aFFY5Qlo/fBCBCEIGGEtHhyjn9k4njSL+w/mVHmfXOYCoFDJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlYUd92+ScLDxYlFwSuTjK/TPM/lpz0Ba9+m5/5v7MI=;
	b=YcjtO/4GdFIKhisomwnoXc8G8Sedwa6OEkbR8JPSkLF5WeT+Zfua/SsEoQenWHhG5QJA0C
	39OlEKeGNI8qZ9Dw==
Date: Thu, 09 Jul 2026 13:32:39 +0200
Subject: [PATCH 3/7] MIPS: csrc-r4k: Replace CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery with IS_ENABLED()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=1171;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=quX/1M6S+XbJFv91b3HWqjCqdHAetO18UrSBkVTStFo=;
 b=RdMzhC1r1vxhWsQeyyMDUvhVKhFhq1a8/Y6N7TF4JO+L8CHnocNSx3GgS8L52Oa/cL1JViKs1
 WKAwSV5KsYKBbeI3fvFLUJD7F5c9b/8WKb4l+d+UxyLhioHqM5gTHKq
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_123245_188863_AEE857A4 
X-CRM114-Status: UNSURE (   9.65  )
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

Now that there is a dummy declaration of VDSO_CLOCKMODE_R4K, even if no
vDSO is built, the ugly ifdeffery can be replaced with a cleaner
IS_ENABLED() check.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/kernel/csrc-r4k.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
index 241a934543a8..63aca74ab299 100644
--- a/arch/mips/kernel/csrc-r4k.c
+++ b/arch/mips/kernel/csrc-r4k.c
@@ -126,14 +126,12 @@ int __init init_r4k_clocksource(void)
 	clocksource_mips.rating = 200;
 	clocksource_mips.rating += clamp(mips_hpt_frequency / 10000000, 0, 99);
 
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 	/*
 	 * R2 onwards makes the count accessible to user mode so it can be used
 	 * by the VDSO (HWREna is configured by configure_hwrena()).
 	 */
-	if (cpu_has_mips_r2_r6 && rdhwr_count_usable())
+	if (IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY) && cpu_has_mips_r2_r6 && rdhwr_count_usable())
 		clocksource_mips.vdso_clock_mode = VDSO_CLOCKMODE_R4K;
-#endif
 
 	clocksource_register_hz(&clocksource_mips, mips_hpt_frequency);
 

-- 
2.55.0


