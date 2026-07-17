Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FE8C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vDo3uHkwGXTE/lPbik782MNUamlRta61JxiZ5JxymY8=; b=3EtOqYdMw/RuDl
	Civ21vHmse+IWgxxmMMsvMsE78teFW5aJXhGWPtw9weqXUZViQ4Wugu/SKbL/XoHz0kUpA5FgWUK5
	ymHmWNoYL0KitdmE7v7d/sq/aJIe6OeGk7pSJbMmzA5Ej3N4k2Qq3wb1RrXkmDloZheJAAGUns0EY
	+cj6gb1YC0igB2HD7MnABkMIQ/jB+P6cWESk6WKNHfBOdEJMeE336tStIPqhnt4RzTlq+flCdpE7x
	H0868pmrlKYzrC28dT9trTbdwEJf5q2ZI15QsAybi5FsCOWu/eRoZIlLBTKhMrtDHuQNya7Qj3nK2
	TH/AR1bkslWCBglMiz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbrD-00000001E5a-0Idn;
	Fri, 17 Jul 2026 06:15:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbqx-00000001Dtn-15CX;
	Fri, 17 Jul 2026 06:15:21 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784268899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vDo3uHkwGXTE/lPbik782MNUamlRta61JxiZ5JxymY8=;
	b=JTbNI3FSHq/Fpng7meaJkQIsEze2XlETAmMvjMKZfNHpobXscI4+cnOJ1lbhuMoKERWzjZ
	96egokN77J+wzn8yTtijN+QwcnZLbe9cEL8NaIGBldkk7rDJX4axCsGiSyhtMdQoCx9SK8
	PJNIxUvQFozleMEMuUWEqglbvwgk7Xjy8SUU86WjazsEKt9WvUuWT9KOWEiCG6+ky2nu36
	Ce+8hcJKoVJujOmFrYFz6CvZNqwXT6fAXmXY+Ji6jEnbcEWsdls5m6791TAUIs6BhBk+M0
	Dfgo7gu7PJuZ5E30O68v0y8Wr9BvIF4PseysMT3tvTa2iNTMvoqzFAU8AG0smg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784268899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vDo3uHkwGXTE/lPbik782MNUamlRta61JxiZ5JxymY8=;
	b=7eoXt+Or1AL6mPmMAetpEU2Tuu1APEAYjpfx2qknwlYY6tK/532jdvQsnfUotbSfFcbZlD
	TflIPpizrvKYHtDg==
Subject: [PATCH v2 0/7] vDSO: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
Date: Fri, 17 Jul 2026 08:14:44 +0200
Message-Id: <20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4XM2jGlChRW/odhUfqQidiaFhsM4
 d+tuHV5TnLPXSGaQCZCV6wQTKJI3mXghwLUKN3NIOnMwBmvWc0qTDp6lEGNqCav7g+vTcTBKml
 byZU4C8jTZzCWlj177TOPFGcf3vtLKr/2F2xY+z+YSmR4sroRbBisqMrLRO41B+9oOWoD/bZtH
 yDv5Xi8AAAA
X-Change-ID: 20260605-vdso-arch-clockmodes-bfcaf9a2c848
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784268894; l=1620;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8Y+Yy1ieOzwCkyGF/eXMgH3qclcc67hiENNCHRZvyAk=;
 b=hPrf2I9P1jU+kYEQu+8UEVHQqvJVt9vTUkaHvWWuPnWeyIPtAGGgCMh+q1tvIaF2hG8/+l6fB
 1e3psZgJHTJAzl+YEzQIFGQjtwBaQb6XZCgdGDQxgN9JP9EzMeJ0Zsd
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_231519_452822_C7ED77C0 
X-CRM114-Status: UNSURE (   5.75  )
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

Always provide the definitions of the VDSO_CLOCKMODE_* constants and
remove some ifdeffery from the clocksource drivers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Also drep the IS_ENABLED() logic.
- Link to v1: https://patch.msgid.link/20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de

---
Thomas Weißschuh (7):
      kbuild: support generated asm-headers in subdirectories
      vDSO: Make clockmode constants available without CONFIG_GENERIC_GETTIMEOFDAY
      MIPS: csrc-r4k: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
      clocksource/drivers/mips-gic-timer: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
      clocksource/drivers/arm_arch_timer: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
      clocksource/drivers/timer-riscv: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
      LoongArch: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery

 arch/loongarch/kernel/time.c           |  2 --
 arch/mips/kernel/csrc-r4k.c            |  2 --
 drivers/clocksource/arm_arch_timer.c   |  4 ----
 drivers/clocksource/mips-gic-timer.c   |  2 --
 drivers/clocksource/timer-riscv.c      |  4 ----
 include/asm-generic/Kbuild             |  1 +
 include/asm-generic/vdso/clocksource.h |  0
 include/vdso/clocksource.h             |  4 +---
 scripts/Makefile.asm-headers           | 11 +++++------
 9 files changed, 7 insertions(+), 23 deletions(-)
---
base-commit: ecacc9c8d3ed0f63065f4a1e94bfd8bf65a3ffaf
change-id: 20260605-vdso-arch-clockmodes-bfcaf9a2c848

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


