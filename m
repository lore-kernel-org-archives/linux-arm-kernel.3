Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F39C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQbno2WvTFVUJzsRinFLe6H6OiW8r6h0VjyMcplhKIo=; b=ZWmvhMReS6knPlYyeYHaXHW+Gb
	2wIGehNJAPw/hSuunNbpu8LYxYBpF7k6WpExN2KAa5PQl+p8BFMgDMoyiCUctHFl/uATjySxaoD1C
	2/Ursk2rllcSABmP+2MzvGsMzo+nxLif5r9HVTTMeqRnkYf9p84AXRyABOd1TqD4wvsEfvWCskDYU
	RrnSub5Y7ZOAqiin1hdqAKPM13jagnBYsrDFLXbVNbo+LsovIWj27/yMWmzkeVdr2HZ1FEwygUjaO
	Uikm5e5xylukRdxw8IOQZY6Ox2F0UrdENiWqd88GgITJ5LhdwW+66KO65RjQAq250lyhC4VEgdsPN
	eAjH+iQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmS-0000000BAPi-06p0;
	Wed, 22 Jul 2026 07:54:16 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmI-0000000BAGo-0WKn;
	Wed, 22 Jul 2026 07:54:08 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784706843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQbno2WvTFVUJzsRinFLe6H6OiW8r6h0VjyMcplhKIo=;
	b=LKY7C7tfTK4hNNjqvs9SoRMIMTNRS97ZlznMKPJd/o0VcyqL4oMZxkFKywOjea3+3nl0BC
	MoyoizzY2Fo+pKnDZbz52N4A3PnsKvywIJRJKKgpwfl2Pbpt4E90U4/sxVuVbCVbuOwFtc
	VRCQ6VcQiAkH/a9fhuIpgcEJwhYQu5WLfYMEnl5zhnvFIwkd7mq3mrC+QBKNl3+IKWXdxk
	0wCikdKPMQgp6a15XWf4ROpJ1JcNPAWclud4ARyRf9GJ6LjHzTGmRE00LGLwkuZb2LWo5J
	lawQ8Fh+Do0aKCTOeALJhwL00HkFSniNA2RnlS7UPD8u1XFjoC3PYmcj25DGBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784706843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQbno2WvTFVUJzsRinFLe6H6OiW8r6h0VjyMcplhKIo=;
	b=sqvOfTw0cChbxqmSe7acokNhETxrB9krRBUV+IXGcyS3GfSnA2p9K6i4nTwy2FCkLb/8PK
	tAOHx873s1CDL0BQ==
Date: Wed, 22 Jul 2026 09:53:29 +0200
Subject: [PATCH v3 3/7] MIPS: csrc-r4k: Remove CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-vdso-arch-clockmodes-v3-3-4c5753191cc4@linutronix.de>
References: <20260722-vdso-arch-clockmodes-v3-0-4c5753191cc4@linutronix.de>
In-Reply-To: <20260722-vdso-arch-clockmodes-v3-0-4c5753191cc4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784706840; l=1015;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=t3APLy9t2SZVxR8iClS2KaGCf82ju0LDxr/0aH1HIvc=;
 b=uIxQRvVPAiyarjQZoFTq+WiQV0PMfsm1ed9ZoSCQZBqxSTsN8eNdGkdcFomursBXVd30Qumhx
 +nredqHFZbwDng2K5SrwNJB8xJ6geRjJGvDD5cAay/QdT2uEfhlSRct
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005406_298715_F416EAF6 
X-CRM114-Status: UNSURE (   7.94  )
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

Now that there is a definition of VDSO_CLOCKMODE_R4K even if no
vDSO is built, the ugly ifdeffery can be removed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/kernel/csrc-r4k.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
index 241a934543a8..59eca397f297 100644
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
 	if (cpu_has_mips_r2_r6 && rdhwr_count_usable())
 		clocksource_mips.vdso_clock_mode = VDSO_CLOCKMODE_R4K;
-#endif
 
 	clocksource_register_hz(&clocksource_mips, mips_hpt_frequency);
 

-- 
2.55.0


