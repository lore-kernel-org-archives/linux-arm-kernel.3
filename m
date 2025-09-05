Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55F7CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JdXw4Qv1njBlO6xmYzVUcXa+L4DKBA78RJzciCH6Gs=; b=VXFyP49O/0+WRPrI5Zv0HvItQj
	rGYCmiMX+G5h8vzhhaT57NirS0zNyQ0iw6DcTuqIGKpfuQzXtw2Tks+oczfCiQDJT5mA/6g24cf8V
	3KN15VoEHEa6SGxeduIpvIIITYafbXuZwYJasDkxhy81xsO7AghxwAPSS5Di75PlFY0YEcdPPIu1b
	zs8Mx2QZ5JVdEp2de8okxtNc8XwVxoCLK0qUkrXK39Dwcf8iFz9P9SzwWlaXOO+k4hwh6qu4f6FPc
	6pFtZ6YrLz9tJVC6JoZS+0VkiVaCTj7/1GBe9p6vPkQPiNrIq9vrfE11aonprRfwmuQbH9WSukPVx
	LzJ/WHaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYYu-00000002pMQ-17d2;
	Fri, 05 Sep 2025 15:41:16 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUKL-00000001Haw-3Zss
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 11:09:59 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e96e1c82b01so1957165276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 04:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757070596; x=1757675396; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2JdXw4Qv1njBlO6xmYzVUcXa+L4DKBA78RJzciCH6Gs=;
        b=rI9U7qbKeGxC3Wp2acOSArXptpud2KErZ5gZuCU5TWU7pwl8rK7BOBZWDWfpqbLQ+F
         2mETmo974DISLEWXHrbRcucwiNIMXfJfhqAyj0vw/9uxV+Ck1+z0FGbZfVVLybUa8OxS
         bydx5N+DxzQi+7993VsDbQolVO7EgwIl58z9i2UIeP6cd2uFfAAo5Q10fTZkxULZas1k
         YazVmWKAVSn1+x/POSCaLoCmnQBwJkLkJBep6YQulQYEOxFJ1Wa6Nf2STkYlG0OeBxf2
         nRLTt95f0QtTmEEkmFOGtLoY/xyh7OZEbMwNM9RLABanNO5+Q0yGHTrvEYNlrs3g4eBV
         Bdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757070596; x=1757675396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JdXw4Qv1njBlO6xmYzVUcXa+L4DKBA78RJzciCH6Gs=;
        b=W7WC/syYdXfj5Hrhs4w7s8Q0lG6ikyLxHqaGKNBViES0iKDpARc6Ycwlddcfv1dKXK
         1AjgOFzoQn61YWyMoq28Agt60ycgG5hULGl4pRNLiJKkAuxk+f5+R9bWI0r9KIlMTjmd
         /rTY8ba2t+x1OeROs/HHem9rM538RWGFJMwqlPxwpUXpfEXecMYBlLuBNi0xq7sNghRf
         /CBMqb1vvtjTwPxJvuiq7T5p4VaPGKD5AP2ghS13cGbjascxNMim+IRW8M1TqaPpThXU
         uC/iHV383aHAlbxnYcDvjxBISAuxoeBESj6ryJrDK1MTe1u5YRc4u3qhKct/2EChs2zj
         gHxw==
X-Forwarded-Encrypted: i=1; AJvYcCUIRssQ/uuU/dInp/CEQmcfBqZf4/ZIyNslC6fJNCeuQjpltw2u3hyLcz1/ys2X5PjqkvmHLNXBXa4U3qAr3gz6@lists.infradead.org
X-Gm-Message-State: AOJu0YwZAiE76UyDJ/myOKPJa/mcpvCUlgyOzCC0W9CPuznX8Wb7DOKA
	YXmseMvLon55HioRn88FKp+mN+r5+dAKh5bX9NO3WKBDJ8BxC1ooTXcsiuOk8C/g7BSW87abIWd
	7hIFTodwo0Krt71kEstWqstHY5IbFdEZNDdcTgyDYGg==
X-Gm-Gg: ASbGncug6mb48KN2qca+U3hEmJkm86D3mn5pfMBagddF6SbEhrOFZ2v9oCG0J0I2biF
	+bL0MLnK6/qVgnJ72+y0928lBFt9lYhVt9+eVrgIF6wz1XBWidZr+PR5TT0XszIT2Hd5jwdsGL9
	WQO+w6RBxSoOWBqmUdHupovkjbtP2TXfMK0cAHISI3J3J1PF1z/khi7FPI/9E32dl42GXT1yiub
	eKILKWPMGARTEisMog=
X-Google-Smtp-Source: AGHT+IGJvbbIlAC6F/9Nh1B+6nqGQfT+amUgoRJzoU9Ah54iDfe6pod7IY2Mz9W1QhgN1npg8B3ZwJzDinFuk2aB9V8=
X-Received: by 2002:a05:690e:15c7:b0:5f5:5d5:b1f5 with SMTP id
 956f58d0204a3-601774c10f2mr4510800d50.20.1757070596115; Fri, 05 Sep 2025
 04:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
 <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
 <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
 <CAPDyKFq7z9e9hEC9QWiYcaU=t+Gs_GgRurmK-+cNYp4xkhr5Ow@mail.gmail.com>
 <CAMuHMdU7W+f3nZ_ckHOFsmmK6V9HzK0-fNtcu8kgjTSeU89AqQ@mail.gmail.com>
 <CAPDyKFr-mVbGo62Wp+othcs+cWR6Wn9bz==ZB5hSpyKgkGtqHg@mail.gmail.com>
 <CAMuHMdUAhsZMbkUzwb=XnCNyvA3aOvuhkKL4=1nOPQ0w0if-HA@mail.gmail.com>
 <CAPDyKFrWv3ObciCtrb4YE_K6to5xxx79DGcPv0=nP9LR60=xYA@mail.gmail.com> <CAMuHMdXoLnQR_hB-jXeGxAudwwpFRcQjrQcCb8iYCOz32yHinw@mail.gmail.com>
In-Reply-To: <CAMuHMdXoLnQR_hB-jXeGxAudwwpFRcQjrQcCb8iYCOz32yHinw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 5 Sep 2025 13:09:20 +0200
X-Gm-Features: Ac12FXxAyk0DgxeOLPurHUdA5X-JyzT3WI7knde2ma8Q4W4KgpMj8w1PmU3YQLs
Message-ID: <CAPDyKFqvjeuXhk7H4nH80RY63QfKwGO_61UW=MJaU8Qiahbt3g@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Saravana Kannan <saravanak@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_040957_914585_E7469A17 
X-CRM114-Status: GOOD (  81.29  )
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

[...]

> > > > > > > > > BTW, the "pending due to"-messages look weird to me.
> > > > > > > > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > > > > > > > >
> > > > > > > > >     genpd_provider ca15-cpu0: sync_state() pending due to e6020000.watchdog
> > > > > > > > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pending
> > > > > > > > > due to e6020000.watchdog
> > > > > > > > >
> > > > > > > > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > > > > > > > the watchdog resides in the always-on Clock Domain, and uses the
> > > > > > > > > clock-controller for PM_CLK handling.
> > > > > > >
> > > > > > > Unfortunately the first PM Domain is "ca15-cpu0", which is blocked on
> > > > > > > these bogus pending states, and no PM Domain is powered off.
> > > > > >
> > > > > > I see, thanks for the details. I am looking closer at this.
> > > > > >
> > > > > > In any case, this is the main issue, as it prevents the ->sync_state()
> > > > > > callback to be called. Hence the "genpd->stay_on" will also *not* be
> > > > > > cleared for any of the genpd's for the genpd-provider.
> > > > >
> > > > > I was under the impression there is a time-out, after which the
> > > > > .sync_state() callback would be called anyway, just like for probe
> > > > > deferral due to missing optional providers like DMACs and IOMMUs.
> > > > > Apparently that is not the case?
> > > >
> > > > The behaviour is configurable, so it depends. The current default
> > > > behaviour does *not* enforce the ->sync_state() callbacks to be
> > > > called, even after a time-out.
> > > >
> > > > You may set CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT to achieve the above
> > > > behavior or use the fw_devlink command line parameters to change it.
> > > > Like setting "fw_devlink.sync_state=timeout".
> > > >
> > > > I guess it can be debated what the default behaviour should be.
> > > > Perhaps we should even allow the default behaviour to be dynamically
> > > > tweaked on a per provider device/driver basis?
> > >
> > > The domains are indeed powered off like before when passing
> > > "fw_devlink.sync_state=timeout", so that fixes the regression.
> > > But it was not needed before...
> >
> > Right, the default behavior in genpd has changed. The approach was
> > taken as we believed that original behavior was not correct.
> >
> > Although, the current situation isn't good as it causes lot of churns for us.
>
> I did some more testing, and there seems to be a similar issue with
> DMA controllers, which I hadn't really noticed before, as I have
> DMAC drivers built-in in all my kernel configs.  If the (optional)
> DMAC driver is not available, you need "fw_devlink=permissive" to make
> drivers probe devices that have (optional) DMA support.

Well, after the deferred probe timeout, the missing supplier depency
should be ignored even if you don't have "permissive".

Typically we get a print in the log that could say:
"pm-test-drv pm_test24: deferred probe timeout, ignoring dependency"

... and then the driver-core tries probing the device anyway. It's
then up to the consumer driver to allow probing to succeed, even if
the DMA setup procedure fails.

> Interestingly, that is not the case with (optional) IOMMU support:
> drivers do probe devices that have (optional) DMA support when the
> latter is not available.

Okay, so some special treatments are already in place for IOMMUs, to
allow them to probe sooner, I guess. I don't know in detail how this
works, maybe Saravana can help to fill in?

Although my guess is that, by allowing IOMMUs to probe like this,
means that these drivers need to manage the DMA setup quite
differently.

The DMA driver (supplier) may probe and become available *after* the
IOMMU driver has probed. In other words, the IOMMU drivers then need
to manage the DMA setup even beyond probing.

>
> > > I could add "select FW_DEVLINK_SYNC_STATE_TIMEOUT" to the SYSC_RCAR
> > > and SYSC_RCAR_GEN4 Kconfig options, but that would play badly with
> > > multi-platform kernels.  As the fw_devlink_sync_state flag is static,
> > > the R-Car SYSC drivers can't just auto-enable the flag at runtime.
> > >
> > > Any other options? Perhaps a device-specific flag to be set by the PM
> > > Domain driver, and to be checked by fw_devlink_dev_sync_state()?
> >
> > Something along those lines seems reasonable to me too.
> >
> > However, the remaining question though, is what should be the default
> > behavior in genpd for this. Due to all the churns, we may want
> > something that is closer to what we had *before*, which means to
> > always use the timeout option, unless the genpd provider driver
> > explicitly requests to not to (an opt-out genpd config flag).
> >
> > Saravana, it would be nice to get some thoughts from you are around
> > this? Does it make sense?
> >
> > >
> > > > > > > If I remove the "sync_state = false" above, genpd_provider_sync_state()
> > > > > > > considers all domains, and does power down all unused domains (even
> > > > > > > multiple times, as expected).
> > > > > >
> > > > > > I think those are getting called because with the change above, there
> > > > > > is no device_link being tracked. As stated above, fw_devlink is
> > > > > > limited to use only one device - if multiple devices share the same
> > > > > > fwnode.
> > > > >
> > > > > Indeed.
> > > > >
> > > > > > In other words, the ->sync_state() callbacks are called even if the
> > > > > > corresponding consumer devices have not been probed yet.
> > > > >
> > > > > Hence shouldn't there be a timeout, as the kernel may not even have
> > > > > a driver for one or more consumer devices?
> > > >
> > > > See above.
> > > >
> > > > > > > Upon closer look, all "pending due to" messages I see claim that the
> > > > > > > first (index 0) PM Domain is pending on some devices, while all of
> > > > > > > these devices are part of a different domain (usually the always-on
> > > > > > > domain, which is always the last (32 or 64) on R-Car).
> > > > > > >
> > > > > > > So I think there are two issues:
> > > > > > >   1. Devices are not attributed to the correct PM Domain using
> > > > > > >      fw_devlink sync_state,
> > > > > > >   2. One PM Domain of a multi-domain controller being blocked should
> > > > > > >      not block all other domains handled by the same controller.
> > > > > >
> > > > > > Right, that's a current limitation with fw_devlink. To cope with this,
> > > > > > it's possible to enforce the ->sync_state() callback to be invoked
> > > > > > from user-space (timeout or explicitly) for a device.
> > >
> > > That needs explicit handling, which was not needed before.
> > >
> > > Perhaps the fw_devlink creation should be removed again from
> > > of_genpd_add_provider_onecell(), as it is not correct, except for
> > > the first domain?
> >
> > There is nothing wrong with it, the behavior is correct, unless I
> > failed to understand your problem. To me the problem is that it is
>
> It does print wrong and confusing warnings indicating the problem:
>
>     genpd_provider ca57-cpu0: sync_state() pending due to fe000000.pcie
>
> (no, the PCIe controller is not part of the CPU PM Domain)

That's a good point. We should fix this to avoid confusion.

>
> > just less fine grained, compared to using
> > of_genpd_add_provider_simple(). All PM domains that is provided by a
> > single power-domain controller that uses #power-domain-cells = <1>,
> > requires all consumers of them to be probed, to allow the sync_state
> > callback to be invoked.
>
> if it would be just coarse-grained, the link should be created to a
> device representing the controller, not to the device representing
> the first PM domain.
>
> > If we could teach fw_devlink to take into account the
> > power-domain-*id* that is specified by the consumer node, when the
> > provider is using #power-domain-cells = <1>, this could potentially
> > become as fine-grained as of_genpd_add_provider_simple().
> >
> > Saravana, do think we can extend fw_devlink to take this into account somehow?
>
> Doesn't the pmdomain core create a device for each PM domain, so the
> index could be used to link to the correct domain?

Correct, we have a device associated for each PM domain - and when
of_genpd_add_provider_onecell() is called, we get the index associated
for each of them.

If I understand your proposal, you are suggesting that genpd itself
creates the device_link between its corresponding device (supplier)
and the upcoming consumer device(s), at the point when
of_genpd_add_provider_onecell() is called, right?

It's an interesting idea, but I am not sure it will work. To create
the device_link at this point, assumes that all the consumer OF-nodes
have been populated (to have devices available for them). Maybe there
is an intermediate step we can take to instruct fw_devlink to treat
these "links" differently?

Saravana, any thoughts around this?

>
> > > > > > Another option would be to allow an opt-out behavior for some genpd's
> > > > > > that are powered-on at initialization. Something along the lines of
> > > > > > the below.
> > > > > >
> > > > > > From: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > > Date: Tue, 29 Jul 2025 14:27:22 +0200
> > > > > > Subject: [PATCH] pmdomain: core: Allow powered-on PM domains to be powered-off
> > > > > >  during boot
> > > > >
> > > > > [...]
> > > > >
> > > > > I gave this a try (i.e. "| GENPD_FLAG_NO_STAY_ON" in rcar-sysc.c), but
> > > > > this doesn't make any difference.  I assume this would only work when
> > > > > actively calling genpd_power_off() (i.e. not from of_genpd_sync_state()
> > > > > or genpd_provider_sync_state())?
> > > >
> > > > Right. Thanks for testing!
> > > >
> > > > So, we may need to restore some part of the genpd_power_off_unused()
> > > > when CONFIG_PM_GENERIC_DOMAINS_OF is set. Without clearing
> > > > "genpd->stay_on".
> > > >
> > > > I can extend the patch, if you think it would make sense for you?
> > >
> > > I would applaud anything that would fix these regressions.
> > > Thanks!
> >
> > While being mostly silent from my side for a while, I have been
> > continuing to evolve my test suite for sync_state tests. Wanted to
> > make sure I cover additional new corner cases that you have pointed
> > out for Renesas platforms.
> >
> > That said, I have not observed any issues on my side, so it looks like
> > we are simply facing new behaviors that you have pointed out to be a
> > problem. In this regards, I think it's important to note that we are
> > currently only seeing problems for those genpds that are powered-on
> > when the provider driver calls pm_genpd_init(). Another simple option
> > is to power-off those PM domains that we know is not really needed to
> > be powered-on. Also not perfect, but an option.
> >
> > Another option is something along the lines of what I posted, but
> > perhaps extending it to let the late_initcall_sync to try to power-off
> > the unused PM domains.
>
> Yep, like before.

Okay!

>
> > I will work on updating the patch so we can try it out - or perhaps
> > what you suggested above with a device-specific flag taken into
> > account by fw_devlink_dev_sync_state() would be better/sufficient you
> > think?
>
> I also had a closer look at the few pending sync_state() pending
> warnings I do see on SH/R-Mobile SoCs.  Their PM Domain driver uses
> of_genpd_add_provider_simple() instead of of_genpd_add_provider_onecell().
> E.g. on R-Mobile A1:
>
>     genpd_provider a3sm: sync_state() pending due to f0100000.cache-controller
>     genpd_provider a4s: sync_state() pending due to fe400000.memory-controller
>     genpd_provider d4: sync_state() pending due to ptm
>
> All three domains were already handled specially in the PM Domain
> driver, as they must not be turned off, so these platforms didn't
> regress due to this series.

Okay!

Again the prints are confusing and annoying, but in principle we are
fine. Thanks for clarifying!

This also makes me wonder if we should skip enabling the fw_devlink
support for those genpds with "simple" providers that are special
(GENPD_FLAG_ALWAYS_ON and GENPD_FLAG_RPM_ALWAYS_ON). It doesn't make
sense to track consumers for them, I think.

[...]

Kind regards
Uffe

