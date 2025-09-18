Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288BECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwnJ7MfncjQZZqEO7RPiB5wvlA6TdyUbKRJ/WpUXEpc=; b=ySeIZeCs0YF/hqli0YwQTxqK+i
	l4Hse2x3wdIVIqhV3ts2NXxS0z/r30PRbHp2crFYQmhjvBmgNp6G06yGXLPN/3w+q9SwGS20Uw6lo
	CkX9z503t6WtwwGFQOmFiFVpwFgs63i5s0UR+tQM4iS32fqyds7UmItsOIbyRsSPYNe2Ho8fGW3MJ
	+f6D39KVzj+BFtEj4gv60LmDe2feVcjdocgkNkL1bE92MzS+pwXc3hIvIo8+MI9XnDChFmTAxuFRd
	xeoNlUCBduul6iHz1Ap8NnB6FJmVhthoS9yMg0t2L8VW61faPHJ3UmHvdvdf83znks37/pBLxTLCz
	hRu+7Mtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFTc-000000006Fl-3UVb;
	Thu, 18 Sep 2025 14:19:12 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFTa-000000006EW-0dpp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:19:11 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-72ce9790ab3so8258967b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758205149; x=1758809949; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rwnJ7MfncjQZZqEO7RPiB5wvlA6TdyUbKRJ/WpUXEpc=;
        b=yOl6BVaTEC650FAzdZdS8hLoOE+LKoMH5sh3oTfAHJq645d0PStoq+Ou3ocDmxdcxl
         cmxyGldjBJyeJCI/RNDt1WRhWYzgGDjvr4G1VcxpNvEWReXKAgqKHU+YuD1h5pKiO1WU
         +tlfLOJkRIYLozAmbypWRUEUG9KLgmEhCj6/9QbponcuNZXKN5puLwxp6kf4E5+5m5rG
         OWhEp/16HFKGV7fyAAggOoTwFdqkvNTV59dD/bwjNn7rAePp7o5QBHRkr6vC3R7zbhUw
         UtA8xVDpI3Zgz8DOyFJmgjYR7qG7qjKfHs8KHzMLgXYqRY/NpLQaedEoVbhFoXY7RY4a
         C1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758205149; x=1758809949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwnJ7MfncjQZZqEO7RPiB5wvlA6TdyUbKRJ/WpUXEpc=;
        b=gH2ZyFD9kswNnqM5Q+1aOYgmh9VqENKRMs9e2fIB57YQ/d1RYWgLmvYNgqScKKztrS
         J+NcttVuieZofrQOu5coCoUrXUu2UPWuDyld1cRgaI0KXvbl4/LHi3eTZld9SyBH3WnO
         nitkGpEWiVvY/eSBePtpz4x0JwJHJ7MAUE3X9bwu8kysI6tzPNrgXVqt56+VcGA+TylG
         l/n3ZVgO6qUfbdrmqSc/kN6q92WIwa3w1VkJTls80qywCyAMnFC2L+6XrSR+tpzobMNI
         iOFJGf7Uhz9stM62RppWVFO7qT2ylrZTER+0uAEI2cCbJvseY57flgt9ffCVs5i5kWo0
         8jOg==
X-Forwarded-Encrypted: i=1; AJvYcCV6fsdd0SOWZqmz3SZ14osYwcKBJMpi0FsowCVZ5kCuSOe7TbfDadQ27e9kw8FCBwaJDWknyzQ/BzzdFGG1ykLM@lists.infradead.org
X-Gm-Message-State: AOJu0YysttR4IAvHrBDdbLV98kLAaJwyZPfWQyZkt2Z7FF3HzJGKBj+F
	gHBJuv8/P566Tuuukv8D9QtQF0K4f7owhdSLcGcJC0bPnkk9h3bFwMEpzeD1ip+oNaPCbKFzbqw
	uJ1gr8XOtEQFGfBhwW/0JmCMUGvsmB5/4WE+0MDLKHA==
X-Gm-Gg: ASbGncvJI3heaP8bc9+nSkzuNCTyjO3ALZWLA6PIzHn5ocMlaAUxJNpGhRxGdBF3veX
	clUoeucTd4Rh6DRd8u2qum21tKU90GZlmBGoEftMSJZY3bs/LfuIJqnxAtvo1Fcw03RyQ20MUvu
	XLS1I5oFMNZPod81deqV8OxOhnXqt/HGVjqjTjRwoelLhwDw5q8msoU4Dtd2ZQW4tA3fA5uqiix
	ektH4twcYjrNl7yLgTYpNvABaU=
X-Google-Smtp-Source: AGHT+IFja2SGfrTtCyPdRJCCefTmrgo0mQhH1O6x561N6cabqmvG2QM8w3ohhfxToBTf2XJdX84zA191m+AeXdLVuso=
X-Received: by 2002:a05:690c:3582:b0:735:8634:be68 with SMTP id
 00721157ae682-73890cb0553mr52912587b3.23.1758205148353; Thu, 18 Sep 2025
 07:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com> <20250902-pm-v3-1-ffadbb454cdc@nxp.com>
 <20250918095950.h7wmz2qj5e6khtwr@lcpd911> <20250918131230.GD9196@nxa18884-linux.ap.freescale.net>
 <20250918134039.zkpeqsbf6m2ymxvt@lcpd911>
In-Reply-To: <20250918134039.zkpeqsbf6m2ymxvt@lcpd911>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 16:18:32 +0200
X-Gm-Features: AS18NWB-C7Q2eLiy5k262B4Ual4xN_o15_I0cJZ8lRcTd3E2RvJskp1XeHp2s5E
Message-ID: <CAPDyKFrweJTBHfOOU5r8Lcfs-dsTj94A=JK8+jKDqwJ0jNfiQw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] pmdomain: core: Introduce device_set/get_out_band_wakeup()
To: Peng Fan <peng.fan@oss.nxp.com>, Dhruva Gole <d-gole@ti.com>
Cc: Peng Fan <peng.fan@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_071910_201434_052CA88E 
X-CRM114-Status: GOOD (  41.85  )
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

On Thu, 18 Sept 2025 at 15:40, Dhruva Gole <d-gole@ti.com> wrote:
>
> Hi Peng,
>
> On Sep 18, 2025 at 21:12:30 +0800, Peng Fan wrote:
> > Hi Dhruva,
> >
> > On Thu, Sep 18, 2025 at 03:29:50PM +0530, Dhruva Gole wrote:
> > >On Sep 02, 2025 at 11:33:00 +0800, Peng Fan wrote:
> > >> For some cases, a device could still wakeup the system even if its power
> > >> domain is in off state, because the device's wakeup hardware logic is
> > >> in an always-on domain.
> > >>
> > >> To support this case, introduce device_set/get_out_band_wakeup() to
> > >> allow device drivers to control the behaviour in genpd for a device
> > >> that is attached to it.
> > >>
> > >
> > >Thinking more into it, to me it seems like if the intent here is to only
> > >allow the device drivers to figure out whether they should be or not be
> > >executing the suspend/resume_noirqs then that can still be checked by
> > >wisely using the device set_wakeup APIs in the driver itself.
> > >
> > >Not sure why this patch should be necessary for a
> > >driver to execute the suspend_noirq or not. That decision can very well
> > >be taken inside the driver's suspend resume_noirq hooks based on wakeup
> > >capability and wake_enabled statuses.
> >
> > I should join today's SCMI meeting, but something else caught me (:
>
> It's alright, maybe see you in the next one ;)
>
> >
> > Thanks for looking into this.
> >
> > In genpd_suspend_finish, genpd_sync_power_off will be called if
> > "(device_awake_path(dev) && genpd_is_active_wakeup(genpd))" is false.
> > So if the device is enabled wakeup, the genpd will not be turned off because
> > the check return true.
>
> Umm I think this device_awake_path stuff is only going to be true when
> someone calls device_set_wakeup_path, I don't think it is going to
> return true for a wakeup_capable device. I know all these "wakeup"
> terminology and APIs have become all too confusing :( , so maybe Ulf can
> correct me.

The PM core checks device_may_wakeup() in device_suspend() and then
sets dev->power.wakeup_path = true;

The device_set_awake_path() and device_awake_path(), is to allow
drivers/subsystems to enforce its device to stay powered-on during
system-wide suspend. This may be needed even if the device isn't
configured to deliver system-wakeups.

> I maybe misremembering, but I have seen in some cases where a driver may
> have marked itself wakeup_capable but the suspend hooks still do get
> called... So your concern about genpd_sync_power_off not being called
> due to wakeup capable device driver may not be valid... Again please
> feel to correct me if I am wrong.

The system PM callbacks should get called no matter what.

The problem Peng pointing out, is when genpd_suspend_noirq() (which
calls genpd_finish_suspend()) is called for a device that is attached
to a genpd, we may end up bailing out, preventing the power-off for
its PM domain, while it may be perfectly fine to allow the PM domain
to be powered-off.

The particular code we are looking at, is in genpd_finish_suspend():

        if (device_awake_path(dev) && genpd_is_active_wakeup(genpd))
                return 0;

>
> Did you also look at the wake IRQ stuff I mentioned?
> In the path you're talking about it just checks
> device_awake_path(dev) && genpd_is_active_wakeup(genpd)
> However if the device irq is just marked as a wake IRQ, I don't think
> that is checked anywhere in this path. So definitely if the IRQ of your
> device is set as a wake IRQ, it will still get suspended and resumed as
> usual and that's what you want right?

The missing piece for the wake_irq, is to know whether the interrupt
can be delivered via an out-band-powered-on-logic, thus without
requiring the device to stay powered-on during system suspend.

[...]

Kind regards
Uffe

