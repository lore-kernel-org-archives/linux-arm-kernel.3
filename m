Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BCDCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DebYSPXyMA12y92kZcA8rAKkRRULfngBHwuM5CKJDc=; b=o2Gr2ez/UHA09hwgtcORbxAHvO
	VE960OfUpfdvINSOTGG/4YDT7SMCqQ9x0fVhmeNZtOJMnPYr9IHhCzwpQPBYAgdu9BzYnnj/ua0OK
	DOeYPwQO4JjyC4UKAKrVL4U36creGZh9yf+jLAoxDJ4MNiGM/iOSP+jQiDorFG2vZeS2aewDAcOrc
	RaCoYQhOSfDb+4DXq2IZ/7WInc5rx/y2Gjup2e5KH/l7th2uBbB+2H5Z6Ojiagh0w30g+ytMWfgAN
	JFAue2LQnSv856eLjHG7jcH/IkYH0xSIZtQ5BEOuVgjlAX/WcNY6ygRD1bIAe0zEiQ+53HHvUUHqx
	m1zqBbbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZwY-0000000CdU3-32Gu;
	Sun, 17 May 2026 11:46:02 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZwV-0000000CdTT-3zAh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 11:46:01 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-57516e08474so1129220e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 04:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779018358; x=1779623158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DebYSPXyMA12y92kZcA8rAKkRRULfngBHwuM5CKJDc=;
        b=pyQYvVq5GFyaaUQAiH874Lmp55IYW329xSTT5JWJjZY4H249TYdNNo+OTXfx1b3wbh
         tN0Y8rYJdQM6JynBbLawsfAqV7/E1p6/f32kSRfn9CWENTvqIbDZsSqiJ5N7267P4jDo
         bLoxn6T67ExhrR1jE38oNuxD9Ui+SLHmYHibc27MezZPMh/COKnht2ryJpnwXcY+XcRx
         2k2cNFcHrwn5dabnl3apIrspDt5bloTAT3GuoKYNzRxVNbnS0DtwF+n0xuI4UCHFxhRE
         l0zaDCFDYsAE8K7MUDYYsAs249Pw5SGsxrgFSw8eEaZqoYgidXwG5L9lJxKJX+T4camn
         7GVw==
X-Forwarded-Encrypted: i=1; AFNElJ+TErjxLm59OgdPAJKY3pUBuuFtvGnMqg1kOppyRMKbltKm9RFWLEIvV8/U6Pr2FbfA0+Agf96eJDuXRr3iSMEA@lists.infradead.org
X-Gm-Message-State: AOJu0YwUcB7LHshNO28Wu7DI/DhwGQ/LJmz+FQqhhY2X3HK3sOZhDEZ5
	EI4JmxqFNTA6YX3+ox0ViPeBsdjnukWezUA+UeXgH7paGqvQUmgOyXzxjz3v1ku1
X-Gm-Gg: Acq92OGE+yN1wt4zb4erGqMPAISeiFPXtm2+2AF1EdGWQS2kLxkWtkb6F/OpGr7Bt3q
	Uad8nV+jx3ApOGbjIH97orKA9lLL+VxBMLR/bBqb7jXbHZzKbef1kr2gN1F/ZobRxQboIIOZv6K
	wFL+5KCkAa5GhUU2mhTcfJ/GJSYitQpDUpt8NQdjBwkmH1pOrgkKtEJBotWj7NmRPl+X+q+z/Z5
	9ymQZVWR8jInZTaVuymdOGXz3a6m2CfWdUYcgc7lWxWNmm6eu1dTYZ1I4qY4BKk1RpE5xisJLhX
	BpwsKK/Oy4t+25QN6ojKp5i2lOxH6YcN61QXLduknpHiESWGZM3X5yR010cIa8I9swS6xTOwjo9
	s+LNVZjgVc8IHC41X2A6EsPxn7eKFxYdyzuRXHyOZLbbRfYBdEJs8tbLhqViQoErA96JQv9eZRZ
	9kpx1d+OKKIYihO00PCRHDQVpWksREfqgjFCYe6fqlgLA+2GfKn1dz26exfnI6icBAN6kbC8g=
X-Received: by 2002:a05:6123:128:b0:575:d035:8cb1 with SMTP id 71dfb90a1353d-5760c096bc8mr6509444e0c.13.1779018358035;
        Sun, 17 May 2026 04:45:58 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760f5cd08bsm4452430e0c.5.2026.05.17.04.45.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 04:45:57 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-628086439b6so1239737137.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 04:45:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9YnFO3ocqdcAAbPdxZ7hYfIDnWw9e7FIr8IdQR8AVhinmIgXhaQyu+LJw8oZTNxeeNteUOlQIkVMDmxjm73jFn@lists.infradead.org
X-Received: by 2002:a05:6102:1499:b0:632:1e2f:3a6f with SMTP id
 ada2fe7eead31-63a3f588eb4mr5593907137.24.1779018356258; Sun, 17 May 2026
 04:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <CALSJ-wAqFni+OwSUcQS+KESfe7SbWMxc0aCURHtTZ93Rx6GZhw@mail.gmail.com>
In-Reply-To: <CALSJ-wAqFni+OwSUcQS+KESfe7SbWMxc0aCURHtTZ93Rx6GZhw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 17 May 2026 13:45:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMvoODD4huxqPb+Hj6Rdid1cSgvzuJdqvg_hRzviyFuA@mail.gmail.com>
X-Gm-Features: AVHnY4LH2SV9naipvvuNwFBNfxwbLJEv_dNs2guuBciejeAs6rBKW5zfskaYVQw
Message-ID: <CAMuHMdUMvoODD4huxqPb+Hj6Rdid1cSgvzuJdqvg_hRzviyFuA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] m68k: mcf5441x: setup DAC clock name as per
 driver name
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Steven King <sfking@fdwdc.com>, Greg Ungerer <gerg@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_044559_999049_5A228D2C 
X-CRM114-Status: GOOD (  39.51  )
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

Hi Angelo,

There's something wrong with "Mail-Followup-To:", which lists everyone,
except for you...

On Sun, 17 May 2026 at 11:11, Angelo Dureghello
<adureghello@baylibre.com> wrote:
> jfyi, for some reason i was not in to/cc, but i could grab the message
> in lore.

Might be related...

> On Thu, May 14, 2026 at 10:54:32PM +1000, Greg Ungerer wrote:
> > On 14/5/26 17:05, Angelo Dureghello wrote:
> > > On 14.05.2026 11:27, Greg Ungerer wrote:
> > > > On 13/5/26 19:14, Angelo Dureghello wrote:
> > > > > From: Angelo Dureghello <adureghello@baylibre.com>
> > > > >
> > > > > Later in this patchset, the mcf54415 DAC driver is added.
> > > > > Considering some other different ColdFire cpu DACs exists, the DAC driver
> > > > > is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> > > > > DACs (mcf54415/6/7/8).
> > > > >
> > > > > So updating DAC clock names to bind with proper driver name.
> > > >
> > > > I am not sure I like naming the clocks here with a prefix for the
> > > > specific SoC part number this is in. It might be unlikely now, but
> > > > what if another ColdFire family SoC member uses this same hardware block?
> > > > That is very common amongst other hardware blocks within the ColdFire
> > > > family. Can we come up with a name more specific to just this type
> > > > of DAC hardware block?
> > > >
> > >
> > > from a brief study, this 12bit DAC, and DAC module in general, is only on
> > > this mcf45441x family. There are some ColdFire with ADC only, as those
> > > mcf5249/53/82.
> > > The mcf51mm/ag/je are the opnly to have a 5bit dacs, but these are mcus.
> > > So, if i don't miss any existing model, the name may be correct,
> > > unless we want rename it to a more generic mcf_dac.
> >
> > Yes, I would suggest just leaving it as is, "mcfdac".
> > That is not currently used by any other ColdFire variants supported by
> > the kernel.
> >
>
> Ok, will fix this in a v3, just asking confirmation on the name to
> Jonathan and all, since it involves iio too.
>
> Chaches are:
> mcfdac
> mcf-dac  or mcf_dac (we have drivers as vf610_dac and cio-dac)

The clock names in arch/m68k/coldfire/m5441x.c are the names as
specified by the producer side, not by the consumer side.

> > > > > --- a/arch/m68k/coldfire/m5441x.c
> > > > > +++ b/arch/m68k/coldfire/m5441x.c
> > > > > @@ -43,8 +43,8 @@ DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
> > > > >    DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
> > > > >    DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
> > > > >    DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
> > > > > -DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
> > > > > -DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
> > > > > +DEFINE_CLK(0, "mcf54415_dac.0", 38, MCF_CLK);
> > > > > +DEFINE_CLK(0, "mcf54415_dac.1", 39, MCF_CLK);
> > > > >    DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
> > > > >    DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
> > > > >    DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
> > > > > @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
> > > > >         CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
> > > > >         CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
> > > > >         CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> > > > > -       CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> > > > > -       CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> > > > > +       CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> > > > > +       CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
> > > > >         CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
> > > > >         CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
> > > > >         CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

