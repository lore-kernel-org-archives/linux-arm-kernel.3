Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54252C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 10:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6Dnu/BcOn6F3D3IfNT8dfH1gBGEupvmcZmtLIc3c1g=; b=Fn6hvJ5K8x57cw2boIufx25Lio
	SLP8ZNrN3xCawzRFPTOtBFXLYWA3DI2cTQAZQkH2SWqw7lcJr/3OgVGJ++gkoiSHlQhKZQ7y8r1Lu
	PnXootoGrzo5nNu33rXGuFYrz+TTYhFFxgiaUnX/R4XHtUXwtKLO22kSj6+T5m9cjgBDoX6iJZhcV
	vhDObs3eIMx/neX9flYDSSOx+XBiWR3dNQUXgP2PQiFBdl5NJjegqQlyUVBWILAi8uh724W++dY/h
	jf3Apr1Mue9mhElL/A5qy/GDddLqvrqfZDTraTmeVT420wlQPlqdaWaUsY2QeTLCZ9tGNy1YFoEA3
	IAJ7YM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woecq-00000004uPz-2iJY;
	Tue, 28 Jul 2026 10:01:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woecn-00000004uPH-2QwF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 10:01:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F04AE1A12C6;
	Tue, 28 Jul 2026 10:01:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B83DB601BF;
	Tue, 28 Jul 2026 10:01:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C278711C13F19;
	Tue, 28 Jul 2026 12:01:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785232874; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V6Dnu/BcOn6F3D3IfNT8dfH1gBGEupvmcZmtLIc3c1g=;
	b=ECzlfi5aqe+hP3Nyeb2r937k6WdR2ZEh2JftXD2lfQ+nlsyYgGBkzkohiHD53/xC1wyqug
	IMB3sFnj1HzdHmSK4tEuIW6jsltItT7ieJQlwESeiWZyLwnweDqkkvbhav9IA+OSNMha2r
	kCG8fRKu93d+BQbIKSJrHZqO/J1TQR91Q/lfmuq7vyTWpJrOm1urZCcMfy0WCXENNGxWk3
	MEo5OqT8M7YGpy2TiTm8rr5Yj8pEBiz+41b4ikjdk2BypkTmOIAJr6Pmq2vBfZY1ZHpjk8
	kzZ7lZGZxb77Cld87fLpO+4GkD4CPmKRyP1xEl/gA5dmrGOu6HrEiMWKM4RPZA==
Date: Tue, 28 Jul 2026 12:01:09 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?utf-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Boris Brezillon <bbrezillon@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clocksource/drivers/timer-atmel-pit: Fix init failure
 cleanup
Message-ID: <20260728100109ca239fcb@mail.local>
References: <20260608182016.99715-1-dbgh9129@gmail.com>
 <CACrCO_XQn9WLVVx5NhvzAw=FuW-4R0Du58MGwOQ5q6dgGbtKYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACrCO_XQn9WLVVx5NhvzAw=FuW-4R0Du58MGwOQ5q6dgGbtKYg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_030125_900265_C7161699 
X-CRM114-Status: GOOD (  27.33  )
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

Hello,

On 02/07/2026 17:12:48-0400, 최유호 wrote:
> Hi,
> 
> Just a gentle ping on this patch.
> 
> I would appreciate any feedback when you have a chance to review this.
> 
> Thanks
> 
> On Mon, 8 Jun 2026 at 14:20, Yuho Choi <dbgh9129@gmail.com> wrote:
> >
> > After clk_prepare_enable(data->mck) succeeds, at91sam926x_pit_dt_init()
> > can still fail while parsing the IRQ, registering the clocksource, or
> > requesting the IRQ. These paths only free the driver data, leaving the
> > master clock enabled.
> >
> > Unwind each initialized state on failure. Stop the PIT after it has been
> > started, dispose the IRQ mapping after it has been created, disable and
> > put the master clock, and unmap the registers before freeing the driver
> > data.
> >

This is a bit moot because if anything in the probe fails, then he
platform will probably not boot at all.

> > Fixes: 699e36e5b8e9 ("clocksource/drivers/timer-atmel-pit: Enable mck clock")
> > Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> > ---
> >  drivers/clocksource/timer-atmel-pit.c | 21 ++++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/clocksource/timer-atmel-pit.c b/drivers/clocksource/timer-atmel-pit.c
> > index 888b06731e54..edd427ab93e6 100644
> > --- a/drivers/clocksource/timer-atmel-pit.c
> > +++ b/drivers/clocksource/timer-atmel-pit.c
> > @@ -12,7 +12,9 @@
> >  #include <linux/clk.h>
> >  #include <linux/clockchips.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/io.h>
> >  #include <linux/irq.h>
> > +#include <linux/irqdomain.h>
> >  #include <linux/kernel.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> > @@ -185,13 +187,13 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
> >         if (IS_ERR(data->mck)) {
> >                 pr_err("Unable to get mck clk\n");
> >                 ret = PTR_ERR(data->mck);
> > -               goto exit;
> > +               goto exit_iounmap;
> >         }
> >
> >         ret = clk_prepare_enable(data->mck);
> >         if (ret) {
> >                 pr_err("Unable to enable mck\n");
> > -               goto exit;
> > +               goto exit_clk_put;
> >         }


Switching to devm_clk_get_enabled would avoid most of the error
handling. Similarly, devm_ioremap could be used earlier.

> >
> >         /* Get the interrupts property */
> > @@ -199,7 +201,7 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
> >         if (!data->irq) {
> >                 pr_err("Unable to get IRQ from DT\n");
> >                 ret = -EINVAL;
> > -               goto exit;
> > +               goto exit_clk_disable;
> >         }
> >
> >         /*
> > @@ -227,7 +229,7 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
> >         ret = clocksource_register_hz(&data->clksrc, pit_rate);
> >         if (ret) {
> >                 pr_err("Failed to register clocksource\n");
> > -               goto exit;
> > +               goto exit_pit_disable;
> >         }
> >
> >         /* Set up irq handler */
> > @@ -237,7 +239,7 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
> >         if (ret) {
> >                 pr_err("Unable to setup IRQ\n");
> >                 clocksource_unregister(&data->clksrc);
> > -               goto exit;
> > +               goto exit_pit_disable;
> >         }
> >
> >         /* Set up and register clockevents */
> > @@ -256,6 +258,15 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
> >
> >         return 0;
> >
> > +exit_pit_disable:
> > +       pit_write(data->base, AT91_PIT_MR, 0);

I doubt this write is useful.

> > +       irq_dispose_mapping(data->irq);
> > +exit_clk_disable:
> > +       clk_disable_unprepare(data->mck);
> > +exit_clk_put:
> > +       clk_put(data->mck);
> > +exit_iounmap:
> > +       iounmap(data->base);
> >  exit:
> >         kfree(data);
> >         return ret;
> > --
> > 2.43.0
> >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

