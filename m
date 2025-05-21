Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F55C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 06:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLhLiGzM45hB2OU8IkkJdEpBj3k3ldSSfXABvEjzrrw=; b=UmY3k83E/4VZh2HklKaqRh7jqR
	eJ6ru1w56HdyojbMUgtg9KRMq/wk/mk7O5AGKG0thefB///+tjgjgp6U7tldDU7bRFo/vK+yh+bsG
	Zz3SBk7LlvXaNMY34CiXMRzkO5UKkwyryfpLF7tj3ndyBxiHMl+TT8rN50Zkr7LuUn2CZ+Kvththj
	00PLu1pVhdPIryLlY9lnEH+SyU3K4LzBJ7AEOEEJLUiHMc4lve3H9E3LWhLc4JXex70s4WzTOk+Xn
	yReAUGhLNHEfR4XR8vSwb4DAaVp3+B5q5p5pQl12SD5jhQti+6FCWy+KElVUw5dl2E4DIs1izEDXB
	RfXDz3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcqw-0000000Evkf-3ge6;
	Wed, 21 May 2025 06:22:58 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcot-0000000EvXm-28fm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 06:20:52 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-476f4e9cf92so49477401cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 23:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808450; x=1748413250; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLhLiGzM45hB2OU8IkkJdEpBj3k3ldSSfXABvEjzrrw=;
        b=BZhhfFq5RQ4bUKhHIFZiT+iWMc3JB+mtxOA7v4al5FGcqLXyJRxnU4Xl752nZP+ANH
         hM9KCU5ADvI2dfMJY3BTNB+z7DJ96c6UwjaLPKlFxVflM1O25FprYWvCkX20s6UNZV6R
         iBg5kA4JZvlrYxpXbcPwUZM3zf99r8UPe/Nqi0UTOy1vMKc7nsakcRxEEIwg/1pVpgO2
         /8D5UIStvBFAxR8V6U9Sj70wDyA0ev+uNp6N8WwtBAchX7eCVLLtfQ/8u5RAwtJi9lH4
         OnVYgfAFa6c2ckBBebgMXDmxLSljxLMBESkzGch8o0mvKnRXr0ewNNi0gd7o7bl4Pzr4
         4MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808450; x=1748413250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLhLiGzM45hB2OU8IkkJdEpBj3k3ldSSfXABvEjzrrw=;
        b=frbM5N/ZCBrrSS1bIfnky2OV+0Ydv106uLeLcSCACM9gv0hdolvdwP4bVeCNRakz/6
         OAUVSizWPfqNZQ/CWBjyUuo3lBKzpPMFoKPywiklhtmJyBZ/THyvC25YB+uWEMv/FgUI
         JJUwUdFVq3cIsbKsw1NY7SDqnkDpxh3vG/arS/ougmUIFF1+UvoE4GmHbQyuflzyYeZF
         H2qi2nAdeyQHqtV4aTpBr3NWl+azE+46/edtIsFE7zhxiqXH3NBJhHFq4PvjO1esnEwQ
         xV3Bw5lqBsJxpWF22/r9OIHfTdI9FfeTGS1pFfI9dRj3i7/ALyKXQ1qxAi4X+cCvxRn6
         gQLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTQZCxTAfvZQNTQqdK5zwDlr9qzvxvR1USXaAcNCAoMvFWe2vuexY03SWR8OW7EWT3wZ/cxCApXPNOLeh1e/hw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8qcN3qaJi0Mopis6sn3/CmaLpzevWWYOGjzF6+xYJPNBHNQfe
	XAEofPew4rO6t8jMPrynHj9mvfMylZxa4ccr2MlR1IL6wRFnE941hrEYL4Hk2PKrNWK9Llmd5Ty
	NR7fY+Llwf1l9jy2wnrXnQ6uNeQufeaI=
X-Gm-Gg: ASbGncsvgPaIg3LUNlH3jgddLkry3AaGDk9W4h+pZIJgt9Laz+VkM9SSDyZnQs5ekX0
	PHk1GvFPeal+C9q3rXg02Du574bh8ZJUxjEtYxoVoA3H/BiRoP19f/zdn+1dBRbuy5BmjrB67bT
	jMYe22ImnmkbrYgXF3WvV4gfGBo4XnBW/lNg0hBCfiTYAd+pkfNe2yV/XQTmhXGhbyizdtstp0y
	9Ow
X-Google-Smtp-Source: AGHT+IHQH0M4abcXZ9UcUrAXrorTjVO+BBeR2ZeH9Mp2Y0MovIJp2bP045sv7bTxDr7At2nGf5HnsY/U+aWu0hD2Ung=
X-Received: by 2002:a05:622a:418a:b0:48e:ef59:db50 with SMTP id
 d75a77b69052e-494ae3dffbdmr356956261cf.31.1747808450026; Tue, 20 May 2025
 23:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
 <20250521-vt8500-timer-updates-v4-4-2d4306a16ae4@gmail.com> <38df2f02-efc4-465b-aa64-4c9e2c1919d8@roeck-us.net>
In-Reply-To: <38df2f02-efc4-465b-aa64-4c9e2c1919d8@roeck-us.net>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 10:20:46 +0400
X-Gm-Features: AX0GCFu7nbWcnctAyXMfHnwG2aQXQ0NvTnyt98ffoC7G_taLGMiut-Sz-MFKf-Q
Message-ID: <CABjd4YxZVQSuavEYojc8U4AqwUN3GkweiNNHqn=NDTE70xZm8w@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
To: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_232051_552564_D75810E3 
X-CRM114-Status: GOOD (  33.53  )
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

On Wed, May 21, 2025 at 3:15=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 5/20/25 13:01, Alexey Charkov wrote:
> > VIA/WonderMedia SoCs can use their system timer's first channel as a
> > watchdog device which will reset the system if the clocksource counter
> > matches the value given in its match register 0 and if the watchdog
> > function is enabled.
> >
> > Since the watchdog function is tightly coupled to the timer itself, it
> > is implemented as an auxiliary device of the timer device
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >   MAINTAINERS                   |  1 +
> >   drivers/watchdog/Kconfig      | 15 ++++++++
> >   drivers/watchdog/Makefile     |  1 +
> >   drivers/watchdog/vt8500-wdt.c | 80 ++++++++++++++++++++++++++++++++++=
+++++++++
> >   4 files changed, 97 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5362095240627f613638197fda275db6edc16cf7..97d1842625dbdf7fdca3556=
260662dab469ed091 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3447,6 +3447,7 @@ F:      drivers/tty/serial/vt8500_serial.c
> >   F:  drivers/video/fbdev/vt8500lcdfb.*
> >   F:  drivers/video/fbdev/wm8505fb*
> >   F:  drivers/video/fbdev/wmt_ge_rops.*
> > +F:   drivers/watchdog/vt8500-wdt.c
> >   F:  include/linux/vt8500-timer.h
> >
> >   ARM/ZYNQ ARCHITECTURE
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..8049ae630301a98123f97f6=
e3ee868bd3bf1534a 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -2003,6 +2003,21 @@ config PIC32_DMT
> >         To compile this driver as a loadable module, choose M here.
> >         The module will be called pic32-dmt.
> >
> > +config VT8500_WATCHDOG
> > +     tristate "VIA/WonderMedia VT8500 watchdog support"
> > +     depends on ARCH_VT8500 || COMPILE_TEST
> > +     select WATCHDOG_CORE
> > +     select AUXILIARY_BUS
> > +     help
> > +       VIA/WonderMedia SoCs can use their system timer as a hardware
> > +       watchdog, as long as the first timer channel is free from other
> > +       uses and respective function is enabled in its registers. To
> > +       make use of it, say Y here and ensure that the device tree
> > +       lists at least two interrupts for the VT8500 timer device.
> > +
> > +       To compile this driver as a module, choose M here.
> > +       The module will be called vt8500-wdt.
> > +
> >   # PARISC Architecture
> >
> >   # POWERPC Architecture
> > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > index c9482904bf870a085c7fce2a439ac5089b6e6fee..3072786bf226c357102be37=
34fe6e701f753d45b 100644
> > --- a/drivers/watchdog/Makefile
> > +++ b/drivers/watchdog/Makefile
> > @@ -101,6 +101,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) +=3D msc313e_wdt.o
> >   obj-$(CONFIG_APPLE_WATCHDOG) +=3D apple_wdt.o
> >   obj-$(CONFIG_SUNPLUS_WATCHDOG) +=3D sunplus_wdt.o
> >   obj-$(CONFIG_MARVELL_GTI_WDT) +=3D marvell_gti_wdt.o
> > +obj-$(CONFIG_VT8500_WATCHDOG) +=3D vt8500-wdt.o
> >
> >   # X86 (i386 + ia64 + x86_64) Architecture
> >   obj-$(CONFIG_ACQUIRE_WDT) +=3D acquirewdt.o
> > diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wd=
t.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..54fe5ad7695de36f6b3c1d2=
8e955f00bef00e9db
> > --- /dev/null
> > +++ b/drivers/watchdog/vt8500-wdt.c
> > @@ -0,0 +1,80 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/container_of.h>
> > +#include <linux/io.h>
> > +#include <linux/limits.h>
> > +#include <linux/module.h>
> > +#include <linux/types.h>
> > +#include <linux/watchdog.h>
> > +#include <linux/vt8500-timer.h>
> > +
> > +static int vt8500_watchdog_start(struct watchdog_device *wdd)
> > +{
> > +     struct vt8500_wdt_info *info =3D watchdog_get_drvdata(wdd);
> > +     u64 deadline =3D info->timer_next(wdd->timeout * VT8500_TIMER_HZ)=
;
> > +
>
> wdd->timeout is the soft timeout, which may be larger
> than the maximum hardware timeout. That means you'll need
> to use something like "min(wdd->timeout, U32_MAX / VT8500_TIMER_HZ)
> * VT8500_TIMER_HZ" as parameter to the timer_next call.

Indeed. For some reason I thought the core splits up large user
requested timeout values into at most max_hw_heartbeat_ms long chunks
and feeds those to the driver via the timeout field, but now I see it
doesn't.

Do I get it right that the core worker will try and do its last ping
of the hardware at exactly max_hw_heartbeat_ms before the user
specified deadline?

> > +     writel((u32)deadline, info->wdt_match);
>
> Can deadline overflow ?

Yes. The underlying hardware counter is a u32 value incrementing at
VT8500_TIMER_HZ and continuing past wraparound. This register sets the
next match value: once the hardware counter reaches the value of
(u32)deadline (which might be after the counter wrapping around iff
deadline > U32_MAX) the system resets. Perhaps it warrants a comment
in code.

Thanks for your review, Guenter!

Best regards,
Alexey

