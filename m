Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91825C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hWGr6yIYZ3hmyl+qH6n3K7Fm452o43E71VabCLMJ2s=; b=oDcA3lZl+AICWW4yyFHPVUN14o
	SVboZSWfRQIbIZOHFt+SpwNggVqAxRJFl1voEHUaYo/yFrsyRWvSMESsnC4U+nfUqEPMY4gmlzD2+
	RYtQpsPoJo2kmINXCQLxhCH9JpmTKUpO1oTaPy9cuvLxgHSBgSlo12PZwKEApj4+TeVg20n6SmqCx
	sFhfiDv90Uz0QrrDBz4pCihOS18UGg7iLqA5Z5g7PZJSP8EE32LAggaM2hHNnSmoNHayKF6sym3Go
	3LF2m6AZmoXlaP6QUj0K0qDTKN4WojvyjLAh8u0vczHPBwr8eB8NyQaqpyY/Q0bawX6PlL7Asbqeh
	qyd3t2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuvm-0000000E9is-2Dg9;
	Wed, 15 Jul 2026 08:25:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuvk-0000000E9iW-3A1i;
	Wed, 15 Jul 2026 08:25:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2172943A31;
	Wed, 15 Jul 2026 08:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4271F000E9;
	Wed, 15 Jul 2026 08:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103924;
	bh=0hWGr6yIYZ3hmyl+qH6n3K7Fm452o43E71VabCLMJ2s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=M1Pb9WQu0IhR3P6JRYVgpOzljOTuLBL5n6r0R+i3T6Cj6Pfq/BbEAeyvAAd6q+GwU
	 yoh16hddpke8YRXj4bfC0BlqZXoh2oOxkxxfr/ZZ4LtH1IwctkRUOsAZ2DTsl5MwXL
	 OgwbU2Z0EXRTi2suwmOEdZwMcMw1UwD4qnCb2U0UIGMxWSKqmkI4rJV0fOaz7frsyp
	 2UgeFb3NExlZX58pouMZoZOq3U2RBWV9ghRcw3YrJThQyIqJBrSR5X77jMSfD+Yh9P
	 Vqa0sNn/IVBkbkj+87yT6Eh8x08MbkvvvCwenfxyZ52gn69bWZbYdUyMpeOjJGr8Vu
	 P097FVeUHn00g==
From: Thomas Gleixner <tglx@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Arnd Bergmann
 <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH 3/7] MIPS: csrc-r4k: Replace CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery with IS_ENABLED()
In-Reply-To: <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
Date: Wed, 15 Jul 2026 10:25:19 +0200
Message-ID: <87wluwoe1c.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 09 2026 at 13:32, Thomas Wei=C3=9Fschuh wrote:
> Now that there is a dummy declaration of VDSO_CLOCKMODE_R4K, even if no
> vDSO is built, the ugly ifdeffery can be replaced with a cleaner
> IS_ENABLED() check.

Duh. This stuff is really obfuscated. I just realized that the previous
one actually expands the architecture defines to non-defined integer
variable declarations.

Smart, but seriously?

I just double checked and it turns out that none of this ifdeffery is
required. If CONFIG_GENERIC_GETTIMEOFDAY is disabled, then it does not
matter at all whether the actual ARCH_CLOCK_VDSO_MODE is set in
clocksource::vdso_mode or not.

Nothing uses the vdso mode field outside of update_vsyscall and that's
compiled out when CONFIG_GENERIC_GETTIMEOFDAY=3Dn.

So all what's required is:

--- a/include/vdso/clocksource.h
+++ b/include/vdso/clocksource.h
@@ -3,14 +3,11 @@
 #define __VDSO_CLOCKSOURCE_H
=20
 #include <vdso/limits.h>
-
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 #include <asm/vdso/clocksource.h>
-#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
=20
 enum vdso_clock_mode {
 	VDSO_CLOCKMODE_NONE,
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
+#ifdef VDSO_ARCH_CLOCKMODES
 	VDSO_ARCH_CLOCKMODES,
 #endif
 	VDSO_CLOCKMODE_MAX,

and then you can just unconditionally set clocksource::vdso_clock_mode
in all drivers.

No?

Thanks,

        tglx

