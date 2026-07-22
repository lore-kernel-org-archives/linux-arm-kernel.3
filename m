Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF6DC44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wy4A5Bpkj2zzKdn6eNsWOzDqtG3uGM/7aAgamplxzrs=; b=OVI/j0+cKn/HLT+GPIwCcKdHZL
	BGk/Wb3Gdntvt8kB3tgZXLyrhxnkQyiYMcLHXauK7qulqyopDIQ7mnj6lb/F2MokKKg687daU+1hG
	/qLm6gZB4TFy0wUUHGTV4CSQVPHohIwny9SQY4nvqa75wAsdepx6sbqOtUjEgxUksQ0O8/TaQ6qX5
	nTnPT2ZwOWAhcBa6UeQDlNPmT3CdpoN5KjKDIRnG6Gj7B7BwKahZ1vRyhfoWfJNXDUa0PUgxcR075
	XxoO2Q/alggygHmXqzFBF1rbmzACfs85u2Ca8PTHRmxDzk+bIJbheBi46YsICoso/diQwsPs5nHga
	lnbn+LdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmS-0000000BAQH-1OAO;
	Wed, 22 Jul 2026 07:54:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmI-0000000BAH6-3Fty;
	Wed, 22 Jul 2026 07:54:08 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784706845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wy4A5Bpkj2zzKdn6eNsWOzDqtG3uGM/7aAgamplxzrs=;
	b=skRTAQ+a8QkdkqSL6xqu6N+jYG2V/9BTt/U29MOBwUwpB58zKwXDFacwgyzsv9PR/OhetJ
	AMBFz87o1iWRhHiM0AggqZXnBUXq6g5peqYAdEe4s6R1yoN8K4/ZmqnFGHR/unGR4npwhP
	JWcSxoa+h2GYIEGrPnaZ7Rwh8CdZxnuvhQ68UNVntkBmFmurkg5yGwh8kwBb2eRrEniOtj
	4aiyUgoRC1b9R8UdXHuN2b2zAcNEQv/X+gWm0g1uozCyNiPVZSHWHyl9bLVgmpmekt35uh
	NzIIuYghVZsZCNhbtfPbWlBIpEjs76T2U0ktXIizUhHTaqifUyFsFXOjC+UI3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784706845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wy4A5Bpkj2zzKdn6eNsWOzDqtG3uGM/7aAgamplxzrs=;
	b=8AtRNNGIfGgq400WNhL47QMz7+eYI9iW6miEUp5mJtZ3BphfmYuREg/ZmGBLZNWC1JZjXo
	fxzBl0/UCwOjKSBA==
Date: Wed, 22 Jul 2026 09:53:30 +0200
Subject: [PATCH v3 4/7] clocksource/drivers/mips-gic-timer: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-vdso-arch-clockmodes-v3-4-4c5753191cc4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784706840; l=811;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=iYdmmwYnitqCJzJDOgChDbBElLI/0ThiAUZVrCungs4=;
 b=ERed7CvjPkQB+1xB34BBcq2YhhyH5BFC82wAhQY2D11iV4dEU3WVmHHH6AE1BxKn7aJGwh1Eh
 Dojk58JDkaPB6GGxSmj/XKZ9QlXGjtLVgQE2uHLhUKznA+bhY3yCB7j
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005407_069235_347C6023 
X-CRM114-Status: UNSURE (   8.54  )
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

Now that there is a definition of VDSO_CLOCKMODE_GIC even if no
vDSO is built, the ugly ifdeffery can be removed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/clocksource/mips-gic-timer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index a1669266c94d..1501c7db9a8e 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -198,9 +198,7 @@ static struct clocksource gic_clocksource = {
 	.name			= "GIC",
 	.read			= gic_hpt_read,
 	.flags			= CLOCK_SOURCE_IS_CONTINUOUS,
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 	.vdso_clock_mode	= VDSO_CLOCKMODE_GIC,
-#endif
 };
 
 static void gic_clocksource_unstable(char *reason)

-- 
2.55.0


