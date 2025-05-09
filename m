Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB191C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZfddHQu5I9Otb7WuExi6VXYbXbdDVVverdTHksitlQ=; b=00uY6X7b56jZ+/rQuky5kvCCQg
	LiP6veg5vaoCsB3JnrhIu4Gd8FFoyOUwhsg12u06qRb9ZBq3I1Ti0yF7F125jFY1lXjsjzz5qzN2w
	zGL8HHxrKwzfNKXc/6Dw/mANe1PNJnMSiHISHtApXg2bzAKk1vh0yr5XhB4jde5vLh7UKA+j1267+
	OrGYYP2i52uJtWR21sQd0ZI78peqPG/rQuFqNdU0IeO49ULjVJFPTyReWrmM/a+BlCJdK0bALp3qf
	xSgT1N9pxrAvGUsseBGC6Q3fm0XuEIeZHsqGaAAEXq/tkv7E998h8q6AnkJYIZOiaIlBseJ8wOj78
	1zzN5BAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUKL-00000004pjO-2NG7;
	Fri, 09 May 2025 20:28:13 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDT9o-00000004f2D-2Mha
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 19:13:17 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso1833801e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 12:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746817995; x=1747422795; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dZfddHQu5I9Otb7WuExi6VXYbXbdDVVverdTHksitlQ=;
        b=lS/+F8AlHLYDOwlUmI4ES0ckKbENJIep8Q+tF2bDolktCJkMHDT1yItGYYtN3kKgmi
         AW7LNj71b5XpAJYy2MHWdYDhTlGmsyPtMxdk4OO2zCnm/7rxL1D0A5SV5fAZfgFUjz65
         2jc2Erjw6qGfd3lmSsoidXe9SBf/F7kd5NjuuVSv6JGs0N5GmXbnaGsIMn0c0noNj51F
         zQrg3s7x7O+DSvrplJF6xOQ8m7jQ/uaYwTqRBsLwA/bFS5fKZaSIwxzfm/MwEjyj6cx2
         Tyy8qG/Z2wvELcmZXdDtwaKkK1s8EOZZwkb73p4BqsPpiyfLFV+7C54T34CpgWsmvcK1
         rEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746817995; x=1747422795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZfddHQu5I9Otb7WuExi6VXYbXbdDVVverdTHksitlQ=;
        b=FJy1jHA6LJ2Ej/wt74LyPU5RtHyub+J6wS5HGa1HgyDbCWuGy6hK7uiwvmCbojRcl4
         lhhU+EJWwVRFVukPojD8k7xuJ/jo8f5OR2re7LlJehjiC5j8sWbbxdIm6BMcoqIb6eZV
         D99mauV0LxPFelJ4ACOtvKH4Ktsl1WAF+nDB0eRRN8lZ6gBVMXBpFh3BytPjeYY6GUEW
         g4WvHsd7zv/p9USa3aV3htjJdhuhHzR6WT0DnPVwlGR5+vWmm7UbhgUOK9EYfWS4gZmt
         mE2DZBBTB5e3PghvEm/et4MxJVqJDIwgxCT37R7iWgia7TRB6/nNpWlvDku30F0SwkQQ
         55eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaGdSCvfXsOK08h78b/kU31PMQPTIvlNK3tYVGrpwpVazYIKACZPnVp9FsBdhhVMMdeMPaHp1oyhIBSLu722HH@lists.infradead.org
X-Gm-Message-State: AOJu0YzewZYp5NGw0Xh+Ae1hRQdxx5sJYoUQXHahMXtdcvmRvh7doG2N
	KbEzcqLlq50sKwnED6xMCT66oc1pH2SZ7eFrqAjFnw43xMnrHfDF
X-Gm-Gg: ASbGnctUhrcdxoGdDUpOcMIQIpk5R0IJKJwhOX4ezCZFpsJq0QIVX4T/8uXbAxV4NuU
	eYJiNjMy99aKD4XkUPNXSMmmKZePyiRhA+L5y3tCaVuak4NheoHczYSDD7tuHnbnxIKTPubFX1H
	/LStxDninK6tSXzgAkOaJWjI2Chne6km9O9Qv16OKI2CyP7oVzgff8lyzk93ETWRDhR4Ifm56Wn
	maZZ04tSeBmVHpKY7uUPgzEJYpf7xkbDTGneV2rMEJ/plUGk4uc7rWttZnenlNbHAt4P3YdIUNe
	iAMU2ivnN8tnTv1FEpRkKDyfytK7qZxaaEqSjSGq6GaDU7/2mw==
X-Google-Smtp-Source: AGHT+IH6q+Y+fNg3K1fYBeHbGWU3eRXIxIU/yD3j9JyGk1Xodh5lnXB6Ky0QBqgV1qG4FaffonJZUQ==
X-Received: by 2002:a05:6122:1d14:b0:523:dd87:fe95 with SMTP id 71dfb90a1353d-52c53daf2admr4866962e0c.9.1746817995152;
        Fri, 09 May 2025 12:13:15 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c0:6030:2d83:24ee:356:8505])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6298ebasm1570303241.34.2025.05.09.12.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 12:13:14 -0700 (PDT)
Date: Fri, 9 May 2025 16:13:08 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com, Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
Message-ID: <20250509191308.6i3ydftzork3sv5c@hiago-nb>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
 <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb>
 <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_121316_632458_7A081155 
X-CRM114-Status: GOOD (  50.73  )
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

On Fri, May 09, 2025 at 12:37:02PM +0200, Ulf Hansson wrote:
> On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > Hello,
> >
> > On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> > > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > >
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > >
> > > > When the remote core is started before Linux boots (e.g., by the
> > > > bootloader), the driver currently is not able to attach because it only
> > > > checks for cores running in different partitions. If the core was kicked
> > > > by the bootloader, it is in the same partition as Linux and it is
> > > > already up and running.
> > > >
> > > > This adds power mode verification through the SCU interface, enabling
> > > > the driver to detect when the remote core is already running and
> > > > properly attach to it.
> > > >
> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > > > ---
> > > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > > suggested.
> > > > ---
> > > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> > > >  1 file changed, 13 insertions(+)
> > > >
> > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > index 627e57a88db2..9b6e9e41b7fc 100644
> > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> > > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> > > >                                 return -EINVAL;
> > > >
> > > > +                       /*
> > > > +                        * If remote core is already running (e.g. kicked by
> > > > +                        * the bootloader), attach to it.
> > > > +                        */
> > > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > > > +                                                               priv->rsrc_id);
> > > > +                       if (ret < 0)
> > > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > > > +                                       priv->rsrc_id, ret);
> > > > +
> > > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > > > +                               priv->rproc->state = RPROC_DETACHED;
> > > > +
> > > >                         return imx_rproc_attach_pd(priv);
> > >
> > > Why is it important to potentially set "priv->rproc->state =
> > > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> > >
> > > Would it be possible to do it the other way around? First calling
> > > imx_rproc_attach_pd() then get the power-mode to know if
> > > RPROC_DETACHED should be set or not?
> > >
> > > The main reason why I ask, is because of how we handle the single PM
> > > domain case. In that case, the PM domain has already been attached
> > > (and powered-on) before we reach this point.
> >
> > I am not sure if I understood correcly, let me know if I missed
> > something. From my understanding in this case it does not matter, since
> > the RPROC_DETACHED will only be a flag to trigger the attach callback
> > from rproc_validate(), when rproc_add() is called inside
> > remoteproc_core.c.
> 
> Okay, I see.
> 
> To me, it sounds like we should introduce a new genpd helper function
> instead. Something along the lines of this (drivers/pmdomain/core.c)
> 
> bool dev_pm_genpd_is_on(struct device *dev)
> {
>         struct generic_pm_domain *genpd;
>         bool is_on;
> 
>         genpd = dev_to_genpd_safe(dev);
>         if (!genpd)
>                 return false;
> 
>         genpd_lock(genpd);
>         is_on = genpd_status_on(genpd);
>         genpd_unlock(genpd);
> 
>         return is_on;
> }
> 
> After imx_rproc_attach_pd() has run, we have the devices that
> correspond to the genpd(s). Those can then be passed as in-parameters
> to the above function to get the power-state of their PM domains
> (genpds). Based on that, we can decide if priv->rproc->state should be
> to RPROC_DETACHED or not. Right?

Got your idea, I think it should work yes, I am not so sure how. From
what I can see these power domains are managed by
drivers/pmdomain/imx/scu-pd.c and by enabling the debug messages I can
see the power mode is correct when the remote core is powered on:

[    0.317369] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_ON

and powered off:

[    0.314953] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_OFF

But I cannot see how to integrate this into the dev_pm_genpd_is_on() you
proposed. For a quick check, I added this function and it always return
NULL at dev_to_genpd_safe(). Can you help me to understand this part?

> 
> In this way we don't need to export unnecessary firmware functions
> from firmware/imx/misc.c, as patch1/3 does.
> 
> If you think it can work, I can help to cook a formal patch for the
> above helper that you can fold into your series. Let me know.
> 
> >
> > With that we can correcly attach to the remote core running, which was
> > not possible before, where the function returns at "return
> > imx_rproc_attach_pd(priv);" with the RPROC_OFFLINE state to
> > rproc_validate().
> 
> I see, thanks for clarifying!
> 
> Kind regards
> Uffe

Thank you!
Hiago.

