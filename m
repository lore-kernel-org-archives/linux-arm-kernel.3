Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145ADC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 18:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJ2PC1oOUN/lV90CXEwewsm2mx2rssquszpJHMN4XBo=; b=urNs7BR29IafEbiAUunY8t1dJV
	oI2ff54Wf0iEgRJmB07FeYS2da1/+lmQzhBA+t2CXrWIYgGHTiIkFKf5p92/cwwRbRM5oKOonP8XU
	a4bcpun2CdiMJdf2ZUXeTErMs5QFoUTZjzdggMB9Fh0cv33mOIUzPmI5R2OCX04u3TgWfT21SCDbB
	VSMheltiJGLlALm21wT2y2FGI8sB8dWjd/p1CUTG3/x4wLSliPw/p0Mh0tuiJo+6eXK1no04qRcl2
	27saaBzusS/MdwXJehccpmNy1Z7823oSiwZZg5hVvhiFKmcebcQaN7kgDUiuYi+qb7hQQ/igECagJ
	bzUOWGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEuk-0000000A9l2-1wl6;
	Tue, 21 Jul 2026 18:09:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEuj-0000000A9kd-1WNe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 18:09:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85AFB601EC;
	Tue, 21 Jul 2026 18:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D841F00A3A;
	Tue, 21 Jul 2026 18:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784657396;
	bh=qJ2PC1oOUN/lV90CXEwewsm2mx2rssquszpJHMN4XBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M30dXX/sgOYHq+tH0rU+Ulien6D5uQDu69XilF4cR/c3jFtGoo2SJPKmaS7FkkXyo
	 SRRTaoplw7zDgeiBuqWblypHcZoV3vCAKWZfW3yldRXo5GQvUS4qhW6a7w0q4drL7E
	 aYjxieBNBz8lO9XjSOhH76uxRl8d1lS/7V+FcPElHJezohJqjofl4Wc4JNeQe0C/81
	 VecKSQXkI7rmMBXB3l1320zMCTKDepfA7f8t2yXeAHyh6kktizMqfmD8+77ucLgNRh
	 UCyQY05HDxt5gcsA1cdsncRpq2NzPsHGXA3+FvXZU4Q9SrwAfdOKizX1aJTz1xtPvS
	 WvxVgtwAQ+9Sg==
Date: Tue, 21 Jul 2026 11:09:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yo'av Moshe <linux@yoavmoshe.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
Message-ID: <20260721180950.GA3684684@ax162>
References: <20260718111340.159896-1-linux@yoavmoshe.com>
 <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com>
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

On Tue, Jul 21, 2026 at 07:29:50AM +0200, Yo'av Moshe wrote:
> On 2026-07-20 9:29 PM, Sami Tolvanen wrote:
> > Would it be possible to just copy the 4-byte CFI hash prefix to OCRAM
> > when relocating the function? If not, the __nocfi approach seems
> > reasonable to me.
> > 
> > Sami
> 
> I gave this a try - I tried copying 4 bytes from before imx6_suspend
> into OCRAM, but when I tested it on physical hardware (Kobo Clara HD),
> it still crashed on suspend.
> 
> I suspect it's because imx6_suspend is written in assembly
> (suspend-imx6.S) rather than C, so Clang doesn't emit a CFI hash prefix
> before it in the first place.

Does using SYM_TYPED_FUNC_START for imx6_suspend() make that work?
Something like this builds fine for me and I see
__kcfi_typeid_imx6_suspend generated by Clang.

diff --git a/arch/arm/mach-imx/suspend-imx6.S b/arch/arm/mach-imx/suspend-imx6.S
index 63ccc2d0e920..6ded29a38c99 100644
--- a/arch/arm/mach-imx/suspend-imx6.S
+++ b/arch/arm/mach-imx/suspend-imx6.S
@@ -3,6 +3,7 @@
  * Copyright 2014 Freescale Semiconductor, Inc.
  */
 
+#include <linux/cfi_types.h>
 #include <linux/linkage.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
@@ -148,7 +149,7 @@
 
 	.endm
 
-ENTRY(imx6_suspend)
+SYM_TYPED_FUNC_START(imx6_suspend)
 	ldr	r1, [r0, #PM_INFO_PBASE_OFFSET]
 	ldr	r2, [r0, #PM_INFO_RESUME_ADDR_OFFSET]
 	ldr	r3, [r0, #PM_INFO_DDR_TYPE_OFFSET]
@@ -329,4 +330,4 @@ resume:
 	resume_mmdc
 
 	ret	lr
-ENDPROC(imx6_suspend)
+SYM_FUNC_END(imx6_suspend)

-- 
Cheers,
Nathan

