Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA70FC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 14:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LX/Z/xH5TjB+vI+iZlL+8jgmL2VhAdgdSQGMqiSf1Z8=; b=n3XG5LrXOaBm0r775MdojnCwAQ
	jbw7ShzvZnokDIwuMBBahta0Mw7Y+JBK+/5WPtxYmDdMbVwLQKFErZRDhO37oOpD2dlVJZEwyhUoi
	cTH41Sp9X8ZLU/1QbL9V+ZtBH0GTUrqwKqLeofKX0ouHQJdpljKizbM0NPBzYpzZGoONv6yWKOWFx
	rx8EncqfOPzOrOuLJu2dj52Z25Yq4CBuQN9smOro1A2MtqQposSsz13LQ8GnclEZMM7vSTDv4oNbS
	zxVryVOrwlM1hFvbEMgy8AGeN2vP3cool02D69SqJ9KGS0MoGfHsvE3xKaqOnPkfRfSzzmAwriNN8
	YdzLdf6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkRp-0000000G75p-2kEQ;
	Wed, 21 May 2025 14:29:33 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkEW-0000000G4wk-2caJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 14:15:50 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-476ac73c76fso98220561cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747836947; x=1748441747; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX/Z/xH5TjB+vI+iZlL+8jgmL2VhAdgdSQGMqiSf1Z8=;
        b=aW62LTilf4t95LqZerxuM2v/vtEPnutgvwwj4kQi8OVIc+uqzjDIRFPvEdKgvxTmXq
         z7M5bWe4JTVFEDHdd2tc28sKyXa2KvBx4pqMabx/3Rhz8FEzbnUq99yoSzypZIn4dj90
         Y3GDgaIQMYlqtHxqsw/4lhTrP5b4vJB0drOih5OdE0kKlBUbyt2cw0NuBb5+XV+O7Yg5
         +47WICnx2Ah0N1TT6R9ErtkNYXQBJ+uswMfMkOHa1Jvdgn3cXXzaETSQfC+ITvughUah
         7VoFx5mRFTlQuUwAZok1HMN+y8fNoerQnikSzKvqpXUji/Uxe/T733coN7ZkCiRutZME
         J4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836947; x=1748441747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LX/Z/xH5TjB+vI+iZlL+8jgmL2VhAdgdSQGMqiSf1Z8=;
        b=BSnv6aqONmAsA+KE0YIabMZiZ3xoGkqqCsIEq7uX0lxVLoojm2807e+hrFUo+iuoEU
         YL5gyh3eZxbdV/vy5F356O0LdiYXaAl7iOjW7xrXZRYPeHbZx2d/G8YQbcubVgkY04Yh
         A1g5xQBwAO5/mv1Umi5uvq3q+pVizmF/DUDJ4UXtHCz3Q+BdKwz0+R9oNCNefgknai5I
         hvyfADLIHQd900ficX2CzYmyegmW/QZb/oLctetbHUwyvc+pvEHVsE/Y939Ol0kUvguR
         SPwe1hEaNFBYMgFNumLiZE3xhLmdgIIUJY60GMhxIpQPVCyyZefvcfmlYQJ6fU2oBTv2
         UjZA==
X-Forwarded-Encrypted: i=1; AJvYcCWW8g080CDHEh9YO58dtrwsbqwMDG5429KA1CM1azuUg46MYYuem808lvGP7xr/aGcApFxI93yGdPUlDlNl1p0L@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9EbzZHdXt3S5N4hACNRzhquPG4TrdjG7QxNWnPmWt/lY4dPzM
	ES4cXZ4HCii4dD6lsW6Tqxv+4Y76wCow0f5FexK9xOLnO0T8B0L0xBPH02L+mwgwWdkK4cW9HkK
	qTPxEzDvaKhxzt6te7bkDIRIGW/Ypetg=
X-Gm-Gg: ASbGncve2KXvGRbPodW5njczvCJ/sgykREJTSzgZOj25K/CSIpnxtOf68O4PlDlTApp
	cHB2eFRM+YPHX7D+DgQfb7Bz2ky7K4pL7kxbphmYZT4CcxxuWdTsIpALjD5eMOqWeJRKXH4ZL83
	5lVMQxgokm6OEV0UUSpT53eZYBuOYonsvMkU75ihXfceJA7aYpdkr343nkDGx0DM7Zig==
X-Google-Smtp-Source: AGHT+IG65h/nKA2J2iUE51lnHxvDcG5rrR5l2GuLcWFMV2UNRCvs4wib/LqSZVzL+JTCvKRcXMsDTnTi8KGlN+5/w40=
X-Received: by 2002:a05:622a:4406:b0:494:99ed:1607 with SMTP id
 d75a77b69052e-494ae366cacmr298873241cf.3.1747836947371; Wed, 21 May 2025
 07:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
 <20250521-vt8500-timer-updates-v4-4-2d4306a16ae4@gmail.com>
 <38df2f02-efc4-465b-aa64-4c9e2c1919d8@roeck-us.net> <CABjd4YxZVQSuavEYojc8U4AqwUN3GkweiNNHqn=NDTE70xZm8w@mail.gmail.com>
 <ad056ba1-8fce-4735-b71e-f22c22eacc18@roeck-us.net>
In-Reply-To: <ad056ba1-8fce-4735-b71e-f22c22eacc18@roeck-us.net>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 18:15:44 +0400
X-Gm-Features: AX0GCFs__lAG49URpvw4duA8KsLg_Jnwr6hpjs3l-kk9UHP4SXqRTeQaxAZH4oo
Message-ID: <CABjd4YxE4eDYt7MEZCrqHK7G9SuziBYEtWSK35DEUxsMmW60tA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250521_071548_667176_95944775 
X-CRM114-Status: GOOD (  35.17  )
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

On Wed, May 21, 2025 at 5:33=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 5/20/25 23:20, Alexey Charkov wrote:
> > On Wed, May 21, 2025 at 3:15=E2=80=AFAM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> On 5/20/25 13:01, Alexey Charkov wrote:
> >>> VIA/WonderMedia SoCs can use their system timer's first channel as a
> >>> watchdog device which will reset the system if the clocksource counte=
r
> >>> matches the value given in its match register 0 and if the watchdog
> >>> function is enabled.
> >>>
> >>> Since the watchdog function is tightly coupled to the timer itself, i=
t
> >>> is implemented as an auxiliary device of the timer device
> >>>
> >>> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> >>> ---
> >>>    MAINTAINERS                   |  1 +
> >>>    drivers/watchdog/Kconfig      | 15 ++++++++
> >>>    drivers/watchdog/Makefile     |  1 +
> >>>    drivers/watchdog/vt8500-wdt.c | 80 +++++++++++++++++++++++++++++++=
++++++++++++
> >>>    4 files changed, 97 insertions(+)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 5362095240627f613638197fda275db6edc16cf7..97d1842625dbdf7fdca35=
56260662dab469ed091 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -3447,6 +3447,7 @@ F:      drivers/tty/serial/vt8500_serial.c
> >>>    F:  drivers/video/fbdev/vt8500lcdfb.*
> >>>    F:  drivers/video/fbdev/wm8505fb*
> >>>    F:  drivers/video/fbdev/wmt_ge_rops.*
> >>> +F:   drivers/watchdog/vt8500-wdt.c
> >>>    F:  include/linux/vt8500-timer.h
> >>>
> >>>    ARM/ZYNQ ARCHITECTURE
> >>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> >>> index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..8049ae630301a98123f97=
f6e3ee868bd3bf1534a 100644
> >>> --- a/drivers/watchdog/Kconfig
> >>> +++ b/drivers/watchdog/Kconfig
> >>> @@ -2003,6 +2003,21 @@ config PIC32_DMT
> >>>          To compile this driver as a loadable module, choose M here.
> >>>          The module will be called pic32-dmt.
> >>>
> >>> +config VT8500_WATCHDOG
> >>> +     tristate "VIA/WonderMedia VT8500 watchdog support"
> >>> +     depends on ARCH_VT8500 || COMPILE_TEST
> >>> +     select WATCHDOG_CORE
> >>> +     select AUXILIARY_BUS
> >>> +     help
> >>> +       VIA/WonderMedia SoCs can use their system timer as a hardware
> >>> +       watchdog, as long as the first timer channel is free from oth=
er
> >>> +       uses and respective function is enabled in its registers. To
> >>> +       make use of it, say Y here and ensure that the device tree
> >>> +       lists at least two interrupts for the VT8500 timer device.
> >>> +
> >>> +       To compile this driver as a module, choose M here.
> >>> +       The module will be called vt8500-wdt.
> >>> +
> >>>    # PARISC Architecture
> >>>
> >>>    # POWERPC Architecture
> >>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> >>> index c9482904bf870a085c7fce2a439ac5089b6e6fee..3072786bf226c357102be=
3734fe6e701f753d45b 100644
> >>> --- a/drivers/watchdog/Makefile
> >>> +++ b/drivers/watchdog/Makefile
> >>> @@ -101,6 +101,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) +=3D msc313e_wdt.o
> >>>    obj-$(CONFIG_APPLE_WATCHDOG) +=3D apple_wdt.o
> >>>    obj-$(CONFIG_SUNPLUS_WATCHDOG) +=3D sunplus_wdt.o
> >>>    obj-$(CONFIG_MARVELL_GTI_WDT) +=3D marvell_gti_wdt.o
> >>> +obj-$(CONFIG_VT8500_WATCHDOG) +=3D vt8500-wdt.o
> >>>
> >>>    # X86 (i386 + ia64 + x86_64) Architecture
> >>>    obj-$(CONFIG_ACQUIRE_WDT) +=3D acquirewdt.o
> >>> diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-=
wdt.c
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..54fe5ad7695de36f6b3c1=
d28e955f00bef00e9db
> >>> --- /dev/null
> >>> +++ b/drivers/watchdog/vt8500-wdt.c
> >>> @@ -0,0 +1,80 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
> >>> +
> >>> +#include <linux/auxiliary_bus.h>
> >>> +#include <linux/container_of.h>
> >>> +#include <linux/io.h>
> >>> +#include <linux/limits.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/types.h>
> >>> +#include <linux/watchdog.h>
> >>> +#include <linux/vt8500-timer.h>
> >>> +
> >>> +static int vt8500_watchdog_start(struct watchdog_device *wdd)
> >>> +{
> >>> +     struct vt8500_wdt_info *info =3D watchdog_get_drvdata(wdd);
> >>> +     u64 deadline =3D info->timer_next(wdd->timeout * VT8500_TIMER_H=
Z);
> >>> +
> >>
> >> wdd->timeout is the soft timeout, which may be larger
> >> than the maximum hardware timeout. That means you'll need
> >> to use something like "min(wdd->timeout, U32_MAX / VT8500_TIMER_HZ)
> >> * VT8500_TIMER_HZ" as parameter to the timer_next call.
> >
> > Indeed. For some reason I thought the core splits up large user
> > requested timeout values into at most max_hw_heartbeat_ms long chunks
> > and feeds those to the driver via the timeout field, but now I see it
> > doesn't.
> >
> > Do I get it right that the core worker will try and do its last ping
> > of the hardware at exactly max_hw_heartbeat_ms before the user
> > specified deadline?
> >
>
> Where do you see that ? In the watchdog core:
>
>          hw_heartbeat_ms =3D min_not_zero(timeout_ms, wdd->max_hw_heartbe=
at_ms);
>          keepalive_interval =3D ms_to_ktime(hw_heartbeat_ms / 2);

This comment [1] which follows the lines you've pasted: "To ensure
that the watchdog times out wdd->timeout seconds after the most recent
ping from userspace, the last worker ping has to come in
hw_heartbeat_ms before this timeout."

I'm not exactly sure I'm following the code path there 100%, so wanted
to double check. Meanwhile, I've just sent a new version [2] adding
the min function as you pointed out.

[1] https://elixir.bootlin.com/linux/v6.14.6/source/drivers/watchdog/watchd=
og_dev.c#L120
[2] https://lore.kernel.org/all/20250521-vt8500-timer-updates-v5-0-7e4bd11d=
f72e@gmail.com/

Best regards,
Alexey

