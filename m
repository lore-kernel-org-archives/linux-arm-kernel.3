Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BF5C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 05:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YUkhdEd0QQUDppQNw/UgH6HjgrfQKtiPCLApZ8LbF4=; b=DI78rOT1Wuw+cI7ukHEnp4Bhfg
	yLhE8XKbLSLqjYt5oQLUernpq0gNyWkQO6BvC5iYwxe4epDspLXqL8NNYi5iIYFMpA5Y7lB1AcZna
	i8RzZJuYIjbjbpMKbRgnP/GHA5jb27wNkRVL8278vgKjXptNTFTsX44DxMOxDm1GV0TTnO7DYCHXn
	+hL6y5MLZDQeltmYJNK12hAy7682CcINV2otXYp6tAKn8po+lULt9Hvgjdp0ZbO0yBlrjJ9SWaWMN
	BIJNhzCGWvVek6KGNaHOsSpAmv5hjxiS/RKDdUBe0gE3gVVu6gzxPjf8VqRThh0DErIkEmRVBMnK0
	3GyMLkWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHybN-0000000HVWE-31Dp;
	Thu, 22 May 2025 05:36:21 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHyZK-0000000HVMm-1ZqD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 05:34:15 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-48d71b77cc0so101059051cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 22:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747892053; x=1748496853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YUkhdEd0QQUDppQNw/UgH6HjgrfQKtiPCLApZ8LbF4=;
        b=G4mJQ4gVVm4uNQyGfIfFFhbOkZ73q9fpCtenkvlm250/b6Ad7foMrJwZRmazCQQIEX
         VCrpryCGw7hFbqLTJrnhGE3HTxHeRVBvXmfG9+weFuCYUZGWVcwlBl6kjId9iQw8wWs4
         L11us4aQOqgiz/frt8iqLbkc8HqFKKScjqIP3X+7mZ567jydbg5QaRCrO+qsShQ0Wao1
         evKbaS8x+bjhKJW/dWlW9FtFVqiIrtBvK0vXXH3Se6i2H9iuwhQkoR4+RPHl3YieJRmw
         uWSI5hho+GBdbLJbPv859js0AvZ7DIQnOjcZDjZCOMu15P4WSYvdWkG4PPRVWUH7fgdh
         r39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747892053; x=1748496853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YUkhdEd0QQUDppQNw/UgH6HjgrfQKtiPCLApZ8LbF4=;
        b=AsDBvEWHQtO7nNpl5b+iEpI5MEPfsdNsxWVyWYvzRw92QDRcd/bI2oR64lbcms5H/R
         SFtX6ee8Evp/GQhMf0GawXlSfUFkdim/O2kD0HCiPstrxklt2yXbBIDHOcSQ0LSxbdzH
         jWEcg26AFmZZufEzbsGSH+xlk3ch8dnzv+q1pamVoLUvYYBuQ11cutk1NtObpJNvgPZt
         /V0A/dBxeVKG5a1BGna4lt4Lw+4GmZMoypCtaEb6fNHtRbaeXv/BUsOMLS5Pv1omNi5O
         D5G6LpVM09BP6tQk+gyv3uHdEKqbiAaHg3ZVC/yftpINg9h7wpaPo2wwPNShqoW+48YM
         7jhg==
X-Forwarded-Encrypted: i=1; AJvYcCU/BQCVDHyqMFCG7kMEdJv5wzf3WHnD9eRFOsYtgSWjNUHOHPEo2IOiUci5u21ziCjkQnYijcBMl0kPgSAfAEQc@lists.infradead.org
X-Gm-Message-State: AOJu0YywXjifzVx2jASWV1hksCiK4qzvWp66Z/cBEZhSAgEbpwlqKb32
	2KqSc/Wn0RMIPsG7kOFFojX436cCa2tR2xZqKRqqU9bjj41ag2dlnkNfpfGqAz81E+88ZjHXKTQ
	KJbV2/YRMGjDrjNhykFzYVeElMUVCFMI=
X-Gm-Gg: ASbGncv+jJzOBTW5HfkWFro2hcOBP8XbpD2++g2H0ldeHTNFdcNE/WU9g3l76Cv/c9H
	vDvl9Ja/kZxPBbC7hffpgRdfFb1DydTa1FyV2XgULkD89NSdg15OeVSr+M8Pz4bMA8sJsYdx2KL
	MoSMC4+MtE6vQkn+uqNdMSXrDI4B2VTrjBjWdcuX5JzsWWJMAEkP5gGqeREpMSG5tRWQ==
X-Google-Smtp-Source: AGHT+IH+sFe/00LC82lChdaqpHX3ynAV5L9IbuDF4Vx4OIu+c9DVXkOKwcSM0tGgH5FbhmtibOWhO+4UzN974C3Q8Hc=
X-Received: by 2002:ac8:5ccd:0:b0:48b:50ea:85af with SMTP id
 d75a77b69052e-494ae353b1amr376196131cf.8.1747892052546; Wed, 21 May 2025
 22:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
 <20250521-vt8500-timer-updates-v5-3-7e4bd11df72e@gmail.com> <aC4Ma3E461XMBig0@mai.linaro.org>
In-Reply-To: <aC4Ma3E461XMBig0@mai.linaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 22 May 2025 09:34:09 +0400
X-Gm-Features: AX0GCFtb-57_ZpBzRmHvZ9tosIN3IcdFjFNTkT9IoDYGJf6KA7HEPxpktqxPEQw
Message-ID: <CABjd4YzQgjwYgTHCTz9_2T0Hr3oXu4SZjxjjbVPk4UjKoLC2TA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_223414_426843_78F50915 
X-CRM114-Status: GOOD (  55.97  )
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

On Wed, May 21, 2025 at 9:25=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On Wed, May 21, 2025 at 05:00:11PM +0400, Alexey Charkov wrote:
> > VIA/WonderMedia system timer can generate a watchdog reset when its
> > clocksource counter matches the value in the match register 0 and
> > watchdog function is enabled. For this to work, obvously the clock even=
t
> > device must use a different match register (1~3) and respective interru=
pt.
> >
> > Check if at least two interrupts are provided by the device tree, then =
use
> > match register 1 for system clock events and reserve match register 0 f=
or
> > the watchdog. Instantiate an auxiliary device for the watchdog
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  MAINTAINERS                        |   1 +
> >  drivers/clocksource/Kconfig        |   1 +
> >  drivers/clocksource/timer-vt8500.c | 111 +++++++++++++++++++++++++++++=
+++++---
> >  include/linux/vt8500-timer.h       |  18 ++++++
>
> It should endup in include/clocksource/vt8500-timer.h

Noted, will move.

> >  4 files changed, 122 insertions(+), 9 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 783e5ee6854b69cca87b6f0763844d28b4b2213f..5362095240627f613638197=
fda275db6edc16cf7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3447,6 +3447,7 @@ F:      drivers/tty/serial/vt8500_serial.c
> >  F:   drivers/video/fbdev/vt8500lcdfb.*
> >  F:   drivers/video/fbdev/wm8505fb*
> >  F:   drivers/video/fbdev/wmt_ge_rops.*
> > +F:   include/linux/vt8500-timer.h
> >
> >  ARM/ZYNQ ARCHITECTURE
> >  M:   Michal Simek <michal.simek@amd.com>
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index 487c8525996724fbf9c6e9726dabb478d86513b9..92f071aade10b7c0f0bba4b=
47dc6228a5e50360f 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -178,6 +178,7 @@ config TEGRA186_TIMER
> >  config VT8500_TIMER
> >       bool "VT8500 timer driver" if COMPILE_TEST
> >       depends on HAS_IOMEM
> > +     select AUXILIARY_BUS
> >       help
> >         Enables support for the VT8500 driver.
> >
> > diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/t=
imer-vt8500.c
> > index 9f28f30dcaf83ab4e9c89952175b0d4c75bd6b40..cdea5245f8e41d65b8b9beb=
ad3fe3a55f43a18fa 100644
> > --- a/drivers/clocksource/timer-vt8500.c
> > +++ b/drivers/clocksource/timer-vt8500.c
> > @@ -11,6 +11,7 @@
> >   * Alexey Charkov. Minor changes have been made for Device Tree Suppor=
t.
> >   */
> >
> > +#include <linux/auxiliary_bus.h>
> >  #include <linux/io.h>
> >  #include <linux/irq.h>
> >  #include <linux/interrupt.h>
> > @@ -22,9 +23,6 @@
> >  #include <linux/of_address.h>
> >  #include <linux/of_irq.h>
> >
> > -#define VT8500_TIMER_OFFSET  0x0100
> > -#define VT8500_TIMER_HZ              3000000
> > -
> >  #define TIMER_MATCH_REG(x)   (4 * (x))
> >  #define TIMER_COUNT_REG              0x0010   /* clocksource counter *=
/
> >
> > @@ -53,8 +51,14 @@
> >  #define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
> >
> >  #define MIN_OSCR_DELTA               16
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/vt8500-timer.h>
> >
> >  static void __iomem *regbase;
> > +static unsigned int sys_timer_ch;     /* which match register to use
> > +                                       * for the system timer
> > +                                       */
>
> The comment format is a bit odd. It would be nicer on top of the
> variable.
>
> /*
>  * Which match register to use for the system timer
>  */

Indeed. Will reformat, thanks!

> >  static u64 vt8500_timer_read(struct clocksource *cs)
> >  {
> > @@ -75,21 +79,26 @@ static struct clocksource clocksource =3D {
> >       .flags          =3D CLOCK_SOURCE_IS_CONTINUOUS,
> >  };
> >
> > +static u64 vt8500_timer_next(u64 cycles)
> > +{
> > +     return clocksource.read(&clocksource) + cycles;
> > +}
> > +
> >  static int vt8500_timer_set_next_event(unsigned long cycles,
> >                                   struct clock_event_device *evt)
> >  {
> >       int loops =3D msecs_to_loops(10);
> > -     u64 alarm =3D clocksource.read(&clocksource) + cycles;
> > +     u64 alarm =3D vt8500_timer_next(cycles);
> >
> > -     while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(0)
> > +     while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(sy=
s_timer_ch)
> >              && --loops)
> >               cpu_relax();
> > -     writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(0));
> > +     writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(sys_timer_=
ch));
> >
> >       if ((signed)(alarm - clocksource.read(&clocksource)) <=3D MIN_OSC=
R_DELTA)
> >               return -ETIME;
> >
> > -     writel(TIMER_INT_EN_MATCH(0), regbase + TIMER_INT_EN_REG);
> > +     writel(TIMER_INT_EN_MATCH(sys_timer_ch), regbase + TIMER_INT_EN_R=
EG);
> >
> >       return 0;
> >  }
> > @@ -131,7 +140,9 @@ static int __init vt8500_timer_init(struct device_n=
ode *np)
> >               return -ENXIO;
> >       }
> >
> > -     timer_irq =3D irq_of_parse_and_map(np, 0);
>
> It may be worth to repeat part of what is said in the changelog

Will do, thanks!

> > +     sys_timer_ch =3D of_irq_count(np) > 1 ? 1 : 0;
> > +
> > +     timer_irq =3D irq_of_parse_and_map(np, sys_timer_ch);
> >       if (!timer_irq) {
> >               pr_err("%s: Missing irq description in Device Tree\n",
> >                                                               __func__)=
;
> > @@ -140,7 +151,7 @@ static int __init vt8500_timer_init(struct device_n=
ode *np)
> >
> >       writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
> >       writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
> > -     writel(~0, regbase + TIMER_MATCH_REG(0));
> > +     writel(~0, regbase + TIMER_MATCH_REG(sys_timer_ch));
> >
> >       ret =3D clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
> >       if (ret) {
> > @@ -166,4 +177,86 @@ static int __init vt8500_timer_init(struct device_=
node *np)
> >       return 0;
> >  }
> >
> > +static void vt8500_timer_aux_uninit(void *data)
> > +{
> > +     auxiliary_device_uninit(data);
> > +}
> > +
> > +static void vt8500_timer_aux_delete(void *data)
> > +{
> > +     auxiliary_device_delete(data);
> > +}
> > +
> > +static void vt8500_timer_aux_release(struct device *dev)
> > +{
> > +     struct auxiliary_device *aux;
> > +
> > +     aux =3D container_of(dev, struct auxiliary_device, dev);
> > +     kfree(aux);
>
> That will result in a double kfree because the data belongs to the
> wdt_info structure. It is not a pointer allocated. So when the
> wdt_info will be freed, it will free the area already freed by this
> function.

Hmm, it will probably even work still, due to the fact that auxdev is
the first member of wdt_info. But at least a container_of is required
as long as the wdt_info struct is allocated with plain kzalloc not its
devm_* sibling.

> Please note, a timer should never be unloaded, so not sure if the wdt
> should handle the case.

I think this function is rather meant for freeing the parent allocated
resources when the child unregisters from the auxiliary bus, which may
happen earlier than the parent itself unloading (at least that's what
I'm getting from the auxiliary bus documentation). The auxiliary bus
doesn't even allow a child device to be added without specifying the
release callback, which leads me to believe that manual object
lifecycle management is preferred over devm managed one [1].

[1] https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/auxiliary=
_bus.h#L22

But it does make me wonder if e.g. unloading the wdt module would
trigger a release here, which might get messy upon loading it again.

> > +}
> > +
> > +/*
> > + * This probe gets called after the timer is already up and running. T=
his will
> > + * create the watchdog device as a child since the registers are share=
d.
> > + */
> > +static int vt8500_timer_probe(struct platform_device *pdev)
> > +{
> > +     struct vt8500_wdt_info *wdt_info;
> > +     struct device *dev =3D &pdev->dev;
> > +     int ret;
>
> >>>>>
>
> > +     if (!sys_timer_ch) {
> > +             dev_info(dev, "Not enabling watchdog: only one irq was gi=
ven");
> > +             return 0;
> > +     }
> > +
> > +     if (!regbase)
> > +             return dev_err_probe(dev, -ENOMEM,
> > +                     "Timer not initialized, cannot create watchdog");
>
> The block above seems to be a bit wobbly as it relies on
> vt8500_timer_init() to have succeeded.
>
> Why not have vt8500_timer_probe() called by vt8500_timer_init() (with
> a proper name like vt8500_timer_wdt_init()) ?

I need a struct device to hang all the devm_*, dev_* and auxiliary bus
stuff on to. I couldn't find anything readymade in the timers
framework, thus the platform probe function to put something on a bus
first and get a valid dev pointer.

What are the chances of reaching the point of platform devices probing
without a successfully initialized system timer? I have a strong
suspicion that the system will be unusable anyway if vt8500_timer_init
is unsuccessful, given that it's the only clocksource on VT8500. In
which case being unable to initialize a watchdog would be the least of
my concerns :)

> <<<<<
>
> > +     wdt_info =3D kzalloc(sizeof(*wdt_info), GFP_KERNEL);
>
> devm_kzalloc()

I tried to find examples of other auxiliary_device structures
allocated with the managed functions and could only find plain
kzalloc, which makes me wonder if it's appropriate here?

> > +     if (!wdt_info)
> > +             return dev_err_probe(dev, -ENOMEM,
> > +                     "Failed to allocate vt8500-wdt info");
>
> Is it possible kzalloc to return -EPROBE_DEFER ?

I don't think so, but I like how dev_err_probe formats its output
including the textual representation of the errno, and also its inline
return. The docs also say it's fine to use even if -EPROBE_DEFER is
not expected [2]

[2] https://elixir.bootlin.com/linux/v6.14.6/source/drivers/base/core.c#L50=
57

> > +
> > +     wdt_info->timer_next =3D &vt8500_timer_next;
> > +     wdt_info->wdt_en =3D regbase + TIMER_WATCHDOG_EN_REG;
> > +     wdt_info->wdt_match =3D regbase + TIMER_MATCH_REG(0);
>
> The two fields above can be merged into one : wdt_info->regbase
>
> Move TIMER_WATCHDOG_EN_REG to the watchdog driver code.
>
> And as TIMER_MATCH_REG(__channel) =3D=3D 4 * (__channel),
> then TIMER_MATCH_REG =3D=3D 0, so regbase + 0 =3D=3D regbase

Could do that, but frankly I find it neat that the watchdog driver
doesn't need to do offsets into the parent's MMIO registers and just
uses descriptive names for the two registers it actually needs access
to.

> > +     wdt_info->auxdev.name =3D "vt8500-wdt";
> > +     wdt_info->auxdev.dev.parent =3D dev;
> > +     wdt_info->auxdev.dev.release =3D &vt8500_timer_aux_release;
> > +
> > +     ret =3D auxiliary_device_init(&wdt_info->auxdev);
> > +     if (ret) {
> > +             kfree(wdt_info);
>
> Remove kfree because of devm_kzalloc
>
> > +             return ret;
> > +     }
>
> nit: add line
>
> > +     ret =3D devm_add_action_or_reset(dev, vt8500_timer_aux_uninit,
> > +                                    &wdt_info->auxdev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D auxiliary_device_add(&wdt_info->auxdev);
> > +     if (ret)
> > +             return ret;
>
> nit: add line

Thanks for your review Daniel!

Best regards,
Alexey

