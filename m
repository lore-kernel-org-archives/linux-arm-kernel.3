Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897A7C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nR9qA2TvUhjAo0p0Wu7gCQQJQdEUudGGwhv8dj3Lu70=; b=yFlFNo7sr8ULMBOVsTvhxvZkZG
	i3ShNDSDccZIrxoLVr0nk16I369wN4SC1shW+E0hiWssC9hKChQWzzETwdofmT6giIPyOxssChy7l
	41jbgA5nGyDWRO+z10MGIeesiyiMDr4xQCWAc4hCiPvZTgNS729j9R8FHsN49YIOyk3yLrx7EKxjT
	NapyGOQt+CzXx1QAuAsJbTA2GINIvwsLOU8M5ZKwWZ91Fuy2Y/yqVlTc2GofRT2ogIXYFhGlnThJA
	+oU/0VqcMU8kmf8p+IfFvjPclG/jGB2PQ41bxUdiR+QE+DFQvZFx3ZP+zDm6g4LPfrSh75eitg30d
	gHgdrJcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4A2-00000009wvW-3QUU;
	Mon, 19 May 2025 17:20:22 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1fH-00000009TRi-1fCy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:40:28 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso3882229276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747665626; x=1748270426; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nR9qA2TvUhjAo0p0Wu7gCQQJQdEUudGGwhv8dj3Lu70=;
        b=GyxnapDNEUndU5ljDTGU6CRQP8qK4JmrUi8fHv8LZxzZ+MUgsYBYHX875rws9bIiQu
         7T3yKowIXLIcfSb6BO7DGwqducValTsvRg6euk5qD0MsVjVyfeAdt33jvFNPQ1kuBX0A
         KI/gkt90vQ6fvEyJc/ealwOnKlQZ9XfyPBlkOLDjUNd03OS71uUIAydeAdFe1DHfYuSW
         jV/z7+abYZPG47Tw/BKcWIBFmoD3WTKdYeJ7fQbBw/72MjPA5XB4LPYP5/lGo76Xelf3
         HXeZZTcjAXV3mZugTqtyRjIc5XIPiQ7Ql209KEPHDMQCtbVpnZrNazCt/mho4/Ki93kZ
         Z6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665626; x=1748270426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nR9qA2TvUhjAo0p0Wu7gCQQJQdEUudGGwhv8dj3Lu70=;
        b=Ljy9vBVCbtr0O61/WLJ1z7HoB8McSgkpAc5utIvV2IZyatsGtOsdxPtkKIJzMkM38U
         /7XhHSKvbb92YzwnFUNGboM80pCChbIwQwrfr2qWD0IjPLAEUv2miYbYSEMnPBVgDdda
         cL6vNxsh/vRszLtrivHR9AVGvzci3NJ52H3LEvMv/DgG++aoZxxyZtPCkwYDrEtpoxpi
         fAIYw5WDB1E94FYCv+UsdjfdpU2PajzTQ/ip/SSngFg4c0pvjulUTftbQcHb5g3GQFNB
         6aPVkcgjEwBRMLUidIxskat6e6vE/anpGAe5FgOuGoURQmpCrCocUSofPblB0dHhXtYL
         /dYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcDz00J4pg0mWAwSWKvo8WSLixteSTVjKD61hdHMAKq8UprVRvhMh5r9s0Y1FZbui71D8+xLRzj/XPBRyF7rrT@lists.infradead.org
X-Gm-Message-State: AOJu0YzTjFahwSz9m0FTszSAhhWe+hYZHKk9YcyZfx3+OnrjpLgVvUsf
	5f5BCGuenmaa7eiO/UHumlfaSm6muCS/3vaAz7yL9+mnrEhQGYsj6XraIeoEW33+s0QqFbXTEF8
	7AD9h7Kekm47ZYWHJWlksm72c3C9SpZQBmNSfw8+TPg==
X-Gm-Gg: ASbGncvJUP6mSIDVK7bncdG4RhE2R2oXfQ2qCpjwOBcrsMg9dQurzJgEsx1zG1XH8JU
	TR/K0Fmd39nIMIlQs+PAsnrgwUqGYXkRFdg/HJtLbCyHlAA1NB+B+uNZMECbztdKT4rAdbFEVbz
	0AnmuqRhtHcAL6NB23MW+bWHE2w2GEJPQiaQ==
X-Google-Smtp-Source: AGHT+IH8qk2ueLJXAPfHp5CUgGKJqL27jCDTEcZZ/Z2xIhtpa6CoyOq3g3PJegrRumYN6CXvNBgDTdJaa2//XqfYZlQ=
X-Received: by 2002:a05:6902:12c7:b0:e7b:3788:78a6 with SMTP id
 3f1490d57ef6-e7b6a412047mr18064288276.48.1747665626144; Mon, 19 May 2025
 07:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250507160056.11876-1-hiagofranco@gmail.com> <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb> <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb> <20250512045613.GB31197@nxa18884-linux>
In-Reply-To: <20250512045613.GB31197@nxa18884-linux>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 16:39:50 +0200
X-Gm-Features: AX0GCFuzwvmBFpPVm7uHOWrhDiGdyjOO1BUzNOe_b1ksrA1mW-H30PaJUA1Wruo
Message-ID: <CAPDyKFqLMEOEnGDRE-1OUi8o8eVd4_oYPH4heu=WFQ8+4s+3-w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Hiago De Franco <hiagofranco@gmail.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_074027_441931_8DB4BB8C 
X-CRM114-Status: GOOD (  59.13  )
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

On Mon, 12 May 2025 at 05:46, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> On Fri, May 09, 2025 at 04:13:08PM -0300, Hiago De Franco wrote:
> >On Fri, May 09, 2025 at 12:37:02PM +0200, Ulf Hansson wrote:
> >> On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >> >
> >> > Hello,
> >> >
> >> > On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> >> > > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >> > > >
> >> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> >> > > >
> >> > > > When the remote core is started before Linux boots (e.g., by the
> >> > > > bootloader), the driver currently is not able to attach because it only
> >> > > > checks for cores running in different partitions. If the core was kicked
> >> > > > by the bootloader, it is in the same partition as Linux and it is
> >> > > > already up and running.
> >> > > >
> >> > > > This adds power mode verification through the SCU interface, enabling
> >> > > > the driver to detect when the remote core is already running and
> >> > > > properly attach to it.
> >> > > >
> >> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> >> > > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> >> > > > ---
> >> > > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> >> > > > suggested.
> >> > > > ---
> >> > > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> >> > > >  1 file changed, 13 insertions(+)
> >> > > >
> >> > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> > > > index 627e57a88db2..9b6e9e41b7fc 100644
> >> > > > --- a/drivers/remoteproc/imx_rproc.c
> >> > > > +++ b/drivers/remoteproc/imx_rproc.c
> >> > > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> >> > > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> >> > > >                                 return -EINVAL;
> >> > > >
> >> > > > +                       /*
> >> > > > +                        * If remote core is already running (e.g. kicked by
> >> > > > +                        * the bootloader), attach to it.
> >> > > > +                        */
> >> > > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> >> > > > +                                                               priv->rsrc_id);
> >> > > > +                       if (ret < 0)
> >> > > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> >> > > > +                                       priv->rsrc_id, ret);
> >> > > > +
> >> > > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> >> > > > +                               priv->rproc->state = RPROC_DETACHED;
> >> > > > +
> >> > > >                         return imx_rproc_attach_pd(priv);
> >> > >
> >> > > Why is it important to potentially set "priv->rproc->state =
> >> > > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> >> > >
> >> > > Would it be possible to do it the other way around? First calling
> >> > > imx_rproc_attach_pd() then get the power-mode to know if
> >> > > RPROC_DETACHED should be set or not?
> >> > >
> >> > > The main reason why I ask, is because of how we handle the single PM
> >> > > domain case. In that case, the PM domain has already been attached
> >> > > (and powered-on) before we reach this point.
> >> >
> >> > I am not sure if I understood correcly, let me know if I missed
> >> > something. From my understanding in this case it does not matter, since
> >> > the RPROC_DETACHED will only be a flag to trigger the attach callback
> >> > from rproc_validate(), when rproc_add() is called inside
> >> > remoteproc_core.c.
> >>
> >> Okay, I see.
> >>
> >> To me, it sounds like we should introduce a new genpd helper function
> >> instead. Something along the lines of this (drivers/pmdomain/core.c)
> >>
> >> bool dev_pm_genpd_is_on(struct device *dev)
> >> {
> >>         struct generic_pm_domain *genpd;
> >>         bool is_on;
> >>
> >>         genpd = dev_to_genpd_safe(dev);
> >>         if (!genpd)
> >>                 return false;
> >>
> >>         genpd_lock(genpd);
> >>         is_on = genpd_status_on(genpd);
> >>         genpd_unlock(genpd);
> >>
> >>         return is_on;
> >> }
> >>
> >> After imx_rproc_attach_pd() has run, we have the devices that
> >> correspond to the genpd(s). Those can then be passed as in-parameters
> >> to the above function to get the power-state of their PM domains
> >> (genpds). Based on that, we can decide if priv->rproc->state should be
> >> to RPROC_DETACHED or not. Right?
> >
> >Got your idea, I think it should work yes, I am not so sure how. From
> >what I can see these power domains are managed by
> >drivers/pmdomain/imx/scu-pd.c and by enabling the debug messages I can
> >see the power mode is correct when the remote core is powered on:
> >
> >[    0.317369] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_ON
> >
> >and powered off:
> >
> >[    0.314953] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_OFF
> >
> >But I cannot see how to integrate this into the dev_pm_genpd_is_on() you
> >proposed. For a quick check, I added this function and it always return
> >NULL at dev_to_genpd_safe(). Can you help me to understand this part?
>
> Ulf's new API dev_pm_genpd_is_on needs to run after power domain attached.

Correct, but you need to provide the correct "dev" to it. See my other
reply to Hiago.

>
> But if run after power domain attached, there is no API to know whether
> M4 is kicked by bootloader or now.

As long as you have multiple PM domains attached for a device, genpd
will *not* power on the PM domain(s).

Genpd does a power-on in the single PM domain case (for legacy
reasons), but that should not be a problem here, right?

So what am I missing?

>
> Even imx_rproc_attach_pd has a check for single power domain, but I just
> give a look again on current i.MX8QM/QX, all are using two power domain
> entries.
>
> >
> >>
> >> In this way we don't need to export unnecessary firmware functions
> >> from firmware/imx/misc.c, as patch1/3 does.
>
>
> I think still need to export firmware API. My idea is
> 1. introduce a new firmware API and put under firmware/imx/power.c
> 2. Use this new firmware API in imx_rproc.c
> 3. Replace scu-pd.c to use this new firmware API.
>
> Or
> 1. Export the API in scu-pd.c
> 2. Use the API in imx_rproc.c
>
> With approach two, you need to handle them in three trees in one patchset:
> imx/pd/rproc.
>
> With approach one, you need to handle two trees in one patchset: imx/rproc tree,
> then after done, pd tree
>
> Regards,
> Peng
> >>
> >> If you think it can work, I can help to cook a formal patch for the
> >> above helper that you can fold into your series. Let me know.
> >>
> >> >
> >> > With that we can correcly attach to the remote core running, which was
> >> > not possible before, where the function returns at "return
> >> > imx_rproc_attach_pd(priv);" with the RPROC_OFFLINE state to
> >> > rproc_validate().
> >>
> >> I see, thanks for clarifying!
> >>
> >> Kind regards
> >> Uffe
> >
> >Thank you!
> >Hiago.

Kind regards
Uffe

