Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06CFC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 12:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzaS0HPLQ+JNoWDWc+qdmiWk51Wkp8ZaIZKSPb/Tu1s=; b=P9LpZxbsVoBFZhXiZP0xpHtZz3
	eFf2sWjXt0MyAJaNVpBtirb/nc42F74W7qrcsumEKRUkEjF5D+NlOgG5yC51hIO4E/LqstsVVw5cQ
	OVKI6+6tujYf0daVGGYzpSWraUklxfXOc6JGzX/mIsVKOjlkfzTod3bXwZo09SB8Ji3D3XJfhRk4+
	nOPJ3vFU/hMdunNXYpY5vvEOFzxFljGm/O+L3KTUxJAtmmMKY6GwoFxEVVScL3HhRJehUDKgIXfEA
	kU+jJsdr4EdhIEKEKiMYiCh3kFjA4o33jZB8qELPD2zVQHmJwt/wlsNa43xDPTV0iurXWyseZlUy2
	g8pIBAuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRR7-00000007c7o-3geF;
	Mon, 11 Aug 2025 12:15:33 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRNL-00000007bXN-2msK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 12:11:41 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-719f5a141a3so28836317b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 05:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754914298; x=1755519098; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yzaS0HPLQ+JNoWDWc+qdmiWk51Wkp8ZaIZKSPb/Tu1s=;
        b=r12flfEFoDrUWz8w1HTisO5sh9rf9ZPo9LpRjhHDopH4ObJSxJK4G6Js8NIPc/WXsH
         WAPao1EinJIiE4TB+TfzirVKqCQrNIwmVn2YSNTPpPWmVsPJmBvgTKAlNGcr4cKq0lbE
         Iq1KmVHuF7geZkWrDa1LUYmcidZcFdOsLZakn6bF8Is0AhLuGYJmWu4u3x60lia6RXc7
         pNqLbtFyQFa8jE2RkeAHHjoQ/4dpd/Piht2jCYMhqNLK5/80u4adDXicrKGDbk6C5b9O
         8nSMUOOMzsUC2iFPK+i3mV1KwXgenadzug/Lx2t8KboV+yrX9P62ZVeTnnhx1P2rwxs/
         trEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754914298; x=1755519098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzaS0HPLQ+JNoWDWc+qdmiWk51Wkp8ZaIZKSPb/Tu1s=;
        b=XaUPUsphs59uw+OC8KjlRxgJyscG9FnKWNqLKmNqkL5zHsIfU4cjEj3JPrvgULu5He
         pGN0xjaI+7Pl4b/NBNzt9B4LSFSReo6M7N3Vc3hKQHuDyjoraovZ4zNA3vop9Oqzt0RU
         V4Dr0CqlK7vwixsnwiJ0rHpqir/hoHBmhwnlO25mKrOigmeQwAETRUJ72lvkJsQBKVj0
         WKP1uZ5YWNU1pVyy/A6nfllu+66Uiv08Ms1DzJVi87NpHEunGWF4iapxqWFmtzmW3iJx
         5KD/AjAbleURh200Vdk37PPQTki+ef5HZpeEYaOheD083eK8+XOxseRpaCnSrIc5mMwK
         dM4w==
X-Forwarded-Encrypted: i=1; AJvYcCXBjqEZ3Qb6yy8UkNxhRZ2JgwABJhSAfYQlCb5rzNZKmWKJCojFdbrjzvE/CIC7J10GvSY/6bdl8DeY2kP0C4xr@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc1xxy1FDWE+/dfwtIaU95roZzeFgdHJazA7TM+GeODZUZfIYY
	AY20CHLyCU/EcoT21/7fyh1ge1UtVyN/rVdwEI2pAf17ZA9ZvlLLiWQRFXPIvM5siUmuBh+2/E4
	yDEk60xCfflfc3IwMi5dU3OBMw9iciqIH8UdwA5RvSw==
X-Gm-Gg: ASbGnctMYmkehZadzhExMybAIOlatbyXyL+Vu1vCOZX5Bw6nW+0hrR8dLgbSY2OZZ2r
	3nkbkf1oelA/BJXKZ6SkqALkYnpHghtmZvCOopU0KYI/puw07A8bIG/K3ziRTjusohtv5R8PMNp
	oqqilcUMc9Hdnj+ECoBjD1cckUBoNLmJ7poiuasyfhQAqY3axYhojAN0mMXi7WZxoxIcvTZOQnU
	3pSiYEPRKG5LvpuQOk=
X-Google-Smtp-Source: AGHT+IFMbaZrjleZ5vGz4D0X/pSaNmB18k653oOaNMk9YxEBIuCeDG7q8giRICX/XDvm2Zo/8TtZ5RzGGv6KOI1cErc=
X-Received: by 2002:a05:690c:4b89:b0:71b:7126:65a with SMTP id
 00721157ae682-71bf1a9c5admr150740997b3.2.1754914298150; Mon, 11 Aug 2025
 05:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <20250701114733.636510-21-ulf.hansson@linaro.org> <4478f28b-47f8-4049-bf17-b7fc95cfac65@nvidia.com>
In-Reply-To: <4478f28b-47f8-4049-bf17-b7fc95cfac65@nvidia.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 Aug 2025 14:11:02 +0200
X-Gm-Features: Ac12FXyNISadS8h7_-q3TDdgflMKzfkI6TZV-B6W1wySvd9OmSLdra87f6EZkBk
Message-ID: <CAPDyKFqSyP3e=JRFYEuFefWVN5SYJWULU8SKzXmrThvyiVGXgg@mail.gmail.com>
Subject: Re: [PATCH v3 20/24] pmdomain: core: Default to use
 of_genpd_sync_state() for genpd providers
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_051139_705685_3FEF2A5E 
X-CRM114-Status: GOOD (  26.60  )
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

On Thu, 31 Jul 2025 at 17:07, Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Hi Ulf,
>
> On 01/07/2025 12:47, Ulf Hansson wrote:
> > Unless the typical platform driver that act as genpd provider, has its own
> > ->sync_state() callback implemented let's default to use
> > of_genpd_sync_state().
> >
> > More precisely, while adding a genpd OF provider let's assign the
> > ->sync_state() callback, in case the fwnode has a device and its driver
> > doesn't have the ->sync_state() set already. In this way the typical
> > platform driver doesn't need to assign ->sync_state(), unless it has some
> > additional things to manage beyond genpds.
> >
> > Suggested-by: Saravana Kannan <saravanak@google.com>
> > Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> > Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >   drivers/pmdomain/core.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index ca47f91b9e91..5cef6de60c72 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -2600,6 +2600,11 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
> >       return ret;
> >   }
> >
> > +static void genpd_sync_state(struct device *dev)
> > +{
> > +     return of_genpd_sync_state(dev->of_node);
> > +}
> > +
> >   /**
> >    * of_genpd_add_provider_simple() - Register a simple PM domain provider
> >    * @np: Device node pointer associated with the PM domain provider.
> > @@ -2628,6 +2633,8 @@ int of_genpd_add_provider_simple(struct device_node *np,
> >       if (!dev && !genpd_is_no_sync_state(genpd)) {
> >               genpd->sync_state = GENPD_SYNC_STATE_SIMPLE;
> >               device_set_node(&genpd->dev, fwnode);
> > +     } else {
> > +             dev_set_drv_sync_state(dev, genpd_sync_state);
> >       }
> >
> >       put_device(dev);
> > @@ -2700,6 +2707,8 @@ int of_genpd_add_provider_onecell(struct device_node *np,
> >       dev = get_dev_from_fwnode(fwnode);
> >       if (!dev)
> >               sync_state = true;
> > +     else
> > +             dev_set_drv_sync_state(dev, genpd_sync_state);
> >
> >       put_device(dev);
> >
>
> Following this change I am seeing the following warning on our Tegra194
> devices ...
>
>   WARNING KERN tegra-bpmp bpmp: sync_state() pending due to 17000000.gpu
>   WARNING KERN tegra-bpmp bpmp: sync_state() pending due to 3960000.cec
>   WARNING KERN tegra-bpmp bpmp: sync_state() pending due to 15380000.nvjpg
>   WARNING KERN tegra-bpmp bpmp: sync_state() pending due to 154c0000.nvenc
>   WARNING KERN tegra-bpmp bpmp: sync_state() pending due to 15a80000.nvenc
>
> Per your change [0], the 'GENPD_FLAG_NO_SYNC_STATE' is set for Tegra
> and so should Tegra be using of_genpd_sync_state() by default?

This is a different power-domain provider (bpmp) in
drivers/firmware/tegra/bpmp.c and
drivers/pmdomain/tegra/powergate-bpmp.c.

For the bpmp we don't need GENPD_FLAG_NO_SYNC_STATE, as the
power-domain provider is described along with the
"nvidia,tegra186-bpmp" compatible string. In the other case
(drivers/soc/tegra/pmc.c) the "core-domain" and "powergates" are
described through child-nodes, while ->sync_state() is managed by the
parent-device-node.

In the bpmp case there is no ->sync_state() callback assigned, which
means genpd decides to assign a default one.

The reason for the warnings above is because we are still waiting for
those devices to be probed, hence the ->sync_state() callback is still
waiting to be invoked. Enforcing ->sync_state() callback to be invoked
can be done via user-space if that is needed.

Did that make sense?

>
> Thanks
> Jon
>
> [0] https://lore.kernel.org/all/20250701114733.636510-10-ulf.hansson@linaro.org/
> --
> nvpublic
>

Kind regards
Uffe

