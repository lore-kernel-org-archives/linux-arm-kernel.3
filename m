Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA70C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 12:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEOAQ4+huP5P2UxwDkmIJwHky2Zn8+jD9WJaoKTnTcI=; b=oOeDtols7lu9vBkm+BaAgeB6MJ
	F7bETwu3pmGSQZ5mianusvRBP0v3uDrWoE5MNr1XQya83qslDaqd4DZjjLG8aj/rBKfKQ3dKbHpoA
	MNDyVD4It/hCF3gKtwpfauovTQRYssDZ5UYk+7rjz1XXcNl0DbrO89phc/n3Wp3netomF1MFjZWgF
	QwnsYWPLuuHzm/wCCLqHBOv2XeDFGS5QZUaGNDdm/Ausx5eidzov4JZ5gkthE4tqL8ig2OBkjGeWh
	UH3PRjXe61qQkRu+Dy5vonEAQxSLyw8UsHm2//R5w2RdUNY4yKCD6v3L75E4dUdh2h5ZecYgOTjA0
	goabXQRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHM1P-0000000CqgH-0EWM;
	Tue, 20 May 2025 12:24:39 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLzH-0000000CqQu-17H8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 12:22:28 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-70dd29b0d34so14659257b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 05:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747743746; x=1748348546; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MEOAQ4+huP5P2UxwDkmIJwHky2Zn8+jD9WJaoKTnTcI=;
        b=a3RZ1U54Xho4DIT6+MbijSVdBHuh9WMNJbwPj1m9bO9jLYwROjzVrWKoV/tHYu4TL/
         k37d4S6NxflzlrEVJs0q6pgCgdxS9Ua5/OSIV0qGdD8gVtmXrSg2MX+1XTtil8CnRc1H
         SmcVqCWnLAjn7DflWB63oLPeFa85wzwcfJBnuE4DpdsuEbvES1gCR82r+kZg/9692rYZ
         oVKnyTNUjWpl12Fk6FC+L6TPYb6mCrKvdPo3jRRQWFySkeY+PQXfXzxck1xDefLvAo7v
         7R6Ma7U2FaooTWBlTtU4SaA/ESDtDHBFGhcT322jv7ABRXOBKOdEg1N+xlzMn/Z7yvaW
         /MDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747743746; x=1748348546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEOAQ4+huP5P2UxwDkmIJwHky2Zn8+jD9WJaoKTnTcI=;
        b=X1UnGcL1PlblXRZNpwQG/7T3zCrGXTkNVPVosgF8pmPp4QpUGjx8IjpUJ1BdeChy0O
         xJ4D8ZjewcZ4mA+RMcZnxy9JWgLu5ZY0UMy5gptCfULk7ujScpnC5oQryZSSXeFR9iOk
         XuJXbthnvnGaxyO7UqqczB52SXBoXeqOE8kjMPeUj9muimLzXggNSOUj9RSVs1Ox26gT
         PD3cLaWRGmgSpOUBQjcPyDLX9cgIzwLWZJWHNQXknc2Hysv1auqsVs9+s+o+H12vNTrE
         2+infqS6EU4J1OjnVSLSc1wcjIbdUXb/zmtUW6hDxTNUb2cfn7YV3rNVEYeQOztwsOEV
         DtiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX33lLYShZWFAe8MGtzsEUV+A+NaBG/llp57++IM6YGDXo916HWG4qntZeo+RFcU9XTYg0p1dH96hSLkbi/lqpy@lists.infradead.org
X-Gm-Message-State: AOJu0YzMTTyiIoUjZ7wvZPWdnu9N9XhSncoEIpX4Fe5FAtsEldMF8BAO
	qxL7AQiaV+ldYRJoUtaQOL3wbQlslh+xa9bXo3OGSKc0T1944fxemdgek9iS/JjOhaet5uAEe3a
	MlHMAs2MFfRuYMRQqv5xJnSfrrc+6QRSgJ8HnANivKg==
X-Gm-Gg: ASbGncsrBup0Q8nQlO3KHQsG6yfuStkOfJVHkQwCIxZFvDGGdWM1a7EbGHBaICnJBJY
	10rC+vJLBPb3Jj5PEupW1hi9rQ0a79Zqe76CeA49hA9SXqL2KMgzino0DPqtVo4Xv1G6HXRCjRr
	QbpejbTGbru68XCL5gNbXq61MjoUueQ0xiQg==
X-Google-Smtp-Source: AGHT+IEoqQjb+R4v4FqIJ9NsaAJz8P+torT+l2h/KrsSDMTfNo1fSuoB13kxgbLiWRiK4DxnCXAbwKmJB14az3T0qSA=
X-Received: by 2002:a05:690c:ed1:b0:70d:d1a6:fcfc with SMTP id
 00721157ae682-70dd1a6ffb1mr74617027b3.13.1747743745677; Tue, 20 May 2025
 05:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250507160056.11876-1-hiagofranco@gmail.com> <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb> <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb> <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
 <20250519172357.vfnwehrbkk24vkge@hiago-nb>
In-Reply-To: <20250519172357.vfnwehrbkk24vkge@hiago-nb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 20 May 2025 14:21:49 +0200
X-Gm-Features: AX0GCFvecIGQgQvYviOe7hMAhu1Tk0oNxkZ2kd0dxrSn8Ur7tJ7dhdnhpp02IIc
Message-ID: <CAPDyKFpGcgMzOUHf-JTRTLBviFdLdbjZKrMm8yd37ZqJ1nfkHw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_052227_322081_842AD9F3 
X-CRM114-Status: GOOD (  57.91  )
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

On Mon, 19 May 2025 at 19:24, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> Hi Ulf,
>
> On Mon, May 19, 2025 at 04:33:30PM +0200, Ulf Hansson wrote:
> > On Fri, 9 May 2025 at 21:13, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >
> > > On Fri, May 09, 2025 at 12:37:02PM +0200, Ulf Hansson wrote:
> > > > On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > > On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> > > > > > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > > > > >
> > > > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > > > >
> > > > > > > When the remote core is started before Linux boots (e.g., by the
> > > > > > > bootloader), the driver currently is not able to attach because it only
> > > > > > > checks for cores running in different partitions. If the core was kicked
> > > > > > > by the bootloader, it is in the same partition as Linux and it is
> > > > > > > already up and running.
> > > > > > >
> > > > > > > This adds power mode verification through the SCU interface, enabling
> > > > > > > the driver to detect when the remote core is already running and
> > > > > > > properly attach to it.
> > > > > > >
> > > > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > > > > > > ---
> > > > > > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > > > > > suggested.
> > > > > > > ---
> > > > > > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> > > > > > >  1 file changed, 13 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > > > > index 627e57a88db2..9b6e9e41b7fc 100644
> > > > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> > > > > > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> > > > > > >                                 return -EINVAL;
> > > > > > >
> > > > > > > +                       /*
> > > > > > > +                        * If remote core is already running (e.g. kicked by
> > > > > > > +                        * the bootloader), attach to it.
> > > > > > > +                        */
> > > > > > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > > > > > > +                                                               priv->rsrc_id);
> > > > > > > +                       if (ret < 0)
> > > > > > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > > > > > > +                                       priv->rsrc_id, ret);
> > > > > > > +
> > > > > > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > > > > > > +                               priv->rproc->state = RPROC_DETACHED;
> > > > > > > +
> > > > > > >                         return imx_rproc_attach_pd(priv);
> > > > > >
> > > > > > Why is it important to potentially set "priv->rproc->state =
> > > > > > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> > > > > >
> > > > > > Would it be possible to do it the other way around? First calling
> > > > > > imx_rproc_attach_pd() then get the power-mode to know if
> > > > > > RPROC_DETACHED should be set or not?
> > > > > >
> > > > > > The main reason why I ask, is because of how we handle the single PM
> > > > > > domain case. In that case, the PM domain has already been attached
> > > > > > (and powered-on) before we reach this point.
> > > > >
> > > > > I am not sure if I understood correcly, let me know if I missed
> > > > > something. From my understanding in this case it does not matter, since
> > > > > the RPROC_DETACHED will only be a flag to trigger the attach callback
> > > > > from rproc_validate(), when rproc_add() is called inside
> > > > > remoteproc_core.c.
> > > >
> > > > Okay, I see.
> > > >
> > > > To me, it sounds like we should introduce a new genpd helper function
> > > > instead. Something along the lines of this (drivers/pmdomain/core.c)
> > > >
> > > > bool dev_pm_genpd_is_on(struct device *dev)
> > > > {
> > > >         struct generic_pm_domain *genpd;
> > > >         bool is_on;
> > > >
> > > >         genpd = dev_to_genpd_safe(dev);
> > > >         if (!genpd)
> > > >                 return false;
> > > >
> > > >         genpd_lock(genpd);
> > > >         is_on = genpd_status_on(genpd);
> > > >         genpd_unlock(genpd);
> > > >
> > > >         return is_on;
> > > > }
> > > >
> > > > After imx_rproc_attach_pd() has run, we have the devices that
> > > > correspond to the genpd(s). Those can then be passed as in-parameters
> > > > to the above function to get the power-state of their PM domains
> > > > (genpds). Based on that, we can decide if priv->rproc->state should be
> > > > to RPROC_DETACHED or not. Right?
> > >
> > > Got your idea, I think it should work yes, I am not so sure how. From
> > > what I can see these power domains are managed by
> > > drivers/pmdomain/imx/scu-pd.c and by enabling the debug messages I can
> > > see the power mode is correct when the remote core is powered on:
> > >
> > > [    0.317369] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_ON
> > >
> > > and powered off:
> > >
> > > [    0.314953] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_OFF
> > >
> > > But I cannot see how to integrate this into the dev_pm_genpd_is_on() you
> > > proposed. For a quick check, I added this function and it always return
> > > NULL at dev_to_genpd_safe(). Can you help me to understand this part?
> >
> > As your device has multiple PM domains and those gets attached with
> > dev_pm_domain_attach_list(), the device(s) that you should use with
> > dev_pm_genpd_is_on() are in imx_rproc->pd_list->pd_devs[n].
>
> Ok got it, thanks for sharing.
>
> I just send the v3 with the changes Peng proposed (here
> https://lore.kernel.org/lkml/20250519171514.61974-1-hiagofranco@gmail.com/T/#t),
> but I am a bit confused which path we should take, the initial approach
> proposed or using these PD functions. Maybe we can discuss this in the
> new v3 patch series?

I think it would be better if we can avoid sharing low-level firmware
functions for PM domains. I am worried that they may become abused for
other future use-cases.

So, if possible, I would rather make us try to use
dev_pm_genpd_is_on() (or something along those lines), but let's see
what Peng thinks about it before we make the decision.

[...]

Kind regards
Uffe

