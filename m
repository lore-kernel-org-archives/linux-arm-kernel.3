Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E12C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DETzi99iW5LSyN+yHRyHD/USkiX0xstftPX39RhkXRQ=; b=UK+BTgwR56JWBOFbb2mW/v7qKx
	eSTzvmPtAszR/MjhTVocaO5TP/XgElqy3rme/Ml3kDibFUssEML0LVAGPLR6JxVls3HNENYYSulOp
	TBEcgHChH1Hu3HOUwmHM3QJfcdvO8Kv3r2aZVTMkrzreN2/u+6UBqUCT0I1uAHyhkE9kk/wBCtYuY
	Y5H8YaqjzZx+2bDF3UtM2oDCDLThnAOB0E4w4bi++sKaCyNP3yElLPyLOhAqJMkW5baxV+45uBCjZ
	dmkvTqugbV8XBu51UmR+kOxervjH0RlgFn0vLQ+GURYV+hPD98XJVuW8vXhyU3NDKT8oJuW8PCtpJ
	Q96/4dUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmQ-0000000BAO6-2vbe;
	Wed, 22 Jul 2026 07:54:14 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmI-0000000BAGI-0sVY;
	Wed, 22 Jul 2026 07:54:07 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784706843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DETzi99iW5LSyN+yHRyHD/USkiX0xstftPX39RhkXRQ=;
	b=F61HdFymViC3ukVd01nJrWkuHvyUyfEkTyjXYwQdSGa1VcGUAFtLgIFQDyzo/SlZQjhdOz
	hcr748HWnqQ2iNyQh2fh946cCB/vpvqtvBN5Two2EEPARvAz4b9/xVIz5UDT9k6GwTU1oe
	JInpKgTPCXngYDyOhmzz5scEvHI21UV263HuHudO4phGg30NvbXax2uxnAS0CLN+V9qZke
	Hx63wFpY7+uAbjHWvTMYMrMtDlXZoRhoFc3+kEhLYcWOjYAIQEYnaCwO1B1oq2DqyUeZfZ
	m9JGaBHLbFQOID65bbBGeTOSf7kOK5Lw3iJLixldcujkODCcf//cbZ2bwf0dEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784706843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DETzi99iW5LSyN+yHRyHD/USkiX0xstftPX39RhkXRQ=;
	b=Zrn6X7ywEQ2VhnWDfmjyo8A17SuZSw/fMV4ucdja337+xN6fnXGR7tpU66i/wAvLLNWEVw
	ATyakOMGiXGIuqBA==
Date: Wed, 22 Jul 2026 09:53:28 +0200
Subject: [PATCH v3 2/7] vDSO: Make clockmode constants available without
 CONFIG_GENERIC_GETTIMEOFDAY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-vdso-arch-clockmodes-v3-2-4c5753191cc4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784706840; l=1748;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=sXLjsimGUSXXUsc2qCiD2uC+XdCfB1PERWY6JkUJ0UM=;
 b=cXaFIgcYiUB2wwrHHfBslBD7y0L62mFnT4tLN0nF30Bff5jzXmwM85Ect4R6/BWgWEyjN6qvd
 VxIt+W4M/+6AfjXy4eatdZbv3Fs/PhuGkcZr60JIA/xjb/L4ldzmP4R
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005406_398899_7EC7A020 
X-CRM114-Status: GOOD (  11.11  )
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

Some code, for example clocksource drivers, may want to use the vDSO
clockmode constants even when CONFIG_GENERIC_GETTIMEOFDAY=n.
But the symbols are completely hidden in that case, making ugly
ifdeffery necessary.

Always provide the enum definitions.

As not all architectures provide asm/vdso/clocksource.h,
provide an empty stub in asm-generic for it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/asm-generic/Kbuild             | 1 +
 include/asm-generic/vdso/clocksource.h | 0
 include/vdso/clocksource.h             | 4 +---
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 15df9dcb42a5..2bc00c67dc54 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -62,6 +62,7 @@ mandatory-y += topology.h
 mandatory-y += trace_clock.h
 mandatory-y += uaccess.h
 mandatory-y += unwind_user.h
+mandatory-y += vdso/clocksource.h
 mandatory-y += vermagic.h
 mandatory-y += vga.h
 mandatory-y += video.h
diff --git a/include/asm-generic/vdso/clocksource.h b/include/asm-generic/vdso/clocksource.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/include/vdso/clocksource.h b/include/vdso/clocksource.h
index c682e7c60273..bce81c02a7c6 100644
--- a/include/vdso/clocksource.h
+++ b/include/vdso/clocksource.h
@@ -4,13 +4,11 @@
 
 #include <vdso/limits.h>
 
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 #include <asm/vdso/clocksource.h>
-#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
 
 enum vdso_clock_mode {
 	VDSO_CLOCKMODE_NONE,
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
+#ifdef VDSO_ARCH_CLOCKMODES
 	VDSO_ARCH_CLOCKMODES,
 #endif
 	VDSO_CLOCKMODE_MAX,

-- 
2.55.0


