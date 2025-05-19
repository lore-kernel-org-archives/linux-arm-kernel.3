Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F7CC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWQGQfS8CLVYL4QI2AOhtxcKvBGn1H3Acg4MC1GRK8o=; b=o4ANfmm49bosm8HKR5/znxhlWP
	OLGte8OXC5ken9QwsZ7QE2QP5X8lk3OJMLzgHhih6OwwBx37hRF5csL9Qtwfa1TzY1e1WvKN8fJGL
	Cuy6Zzit0WKNg9CH3u7hyN8xg8haqOD8LK+xEILzX627sHOZVMFZFSSbafro1yYqSHmyQN8DsNruM
	1RdkjVxeUVC37ElfUamsAPDWOgoBBcabwo3IaXIxkktqDNdQQjJ/ioHYeRrhKK4nbUqAVC0VqjNcz
	3KS7xJUOaw85ghuaOhO7uSGpT7IEoFLA+cLw1j3ZlyQgD6sKx2SpJHan1hy5oHuANdvb4aEHcRvjT
	oJ4puzyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29a-00000009Xjc-2Q2n;
	Mon, 19 May 2025 15:11:46 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1ZC-00000009SIR-1p1W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:34:11 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e7b8858241aso1578810276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747665249; x=1748270049; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tWQGQfS8CLVYL4QI2AOhtxcKvBGn1H3Acg4MC1GRK8o=;
        b=TXq+gCuFvazRhsGqZ+cvGdmzm2VdaP8pJNBFZIU/z9xpxGMW7F2GDlCjt/AbpkdLmE
         Jra39/sXtrcg9KWF3++BJdhQK/2snau0harazh26TXx0MNHVbnBhT7hYfsd/ZgQyY3o1
         kuecnCxLXzn6N111+7FIHfi/k+p6UHAl25SlyvM4WuXD3i9ebPtLoHiLd+4maqrSg3FB
         91hwsBbFQ2KbEE5PPcQ1Bo3aFC5BAAdU2nteipSSok5YZtn6Z0KEQdDLYSBtIKmprzda
         wcf3N7SrzncPDVpewXyTfTAfW3ltk+yD9ELkqM76T1RoEB0JIirS9yMMgTYkDOpngoe7
         jR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665249; x=1748270049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWQGQfS8CLVYL4QI2AOhtxcKvBGn1H3Acg4MC1GRK8o=;
        b=AsimdA7Njz67P9TCWejown03oVcosHBibUgdNBAl9c1sXxhUrmQcrV9uUdBC0+CZ8z
         bdyuOVV7xLp/mvQe1NtfPzmEcT2ktuV/0eNlwf92E6NS65aJHrkRbzqJW2L5Z09o3rGz
         WceL/VCn0e5KUa6HpuRnHL9p57l/3U/hfei4MrQ7EKnNH2IFzhl/md80hyN6JdnsJUJi
         QcZZc8Bufd3tL7n0jPjNJ4G+ibxh0fUBn25VHt3Nqf4fQtRLDe+UotVB5caqe8e71sZU
         cJAmdKzrflgfZZJgVsHDBz0YxwvRbJiiUQcq7D+IkK8t3ifigi+Y5hVhpV/KirlMs92O
         wBsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBqjvu10+9JEHrtq3T7bcHDxhwYM+MbqISuQITlEibIsKV8Dm5SXaQS1cYleXnJEohN09RDPDfJ4+O+lARfiH3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/QhqYvQ4IPOBAgyNWe0vr23LVitcM/BRJmp0jby8sw37z4vm2
	5+naLBdsaFDiNJsMpaCkD+pM8nSki5FouOvn6j7se1DVLdJ+VhwJMglqEhxOQbMNeTcjc8t0qSP
	FDLNTI65vmn8k5ZQ6i3GQCvcuifomc6k6L4RXfmmugU+chDLYFlo4F4xtEA==
X-Gm-Gg: ASbGncvPRlfJjrkYke8eNhXHeH5OC/ZO/vAguLDOTMD0fGdSHBYQaI9i7M0nCCohioW
	Zm/OE4dcF1oHWayF3lAbeRtmLhwz22lGHOpCk+C4fVCdUPmNVvWZd8OgYkbIqmWYcI52BfI/O6s
	MdL4rWg83ByeXO8v222oDMeNJAf3JAAy6Sbw==
X-Google-Smtp-Source: AGHT+IFWUCxEZiHhmGzWmhcQHoV2f4N5kkNUGaz9Fah8Ux1VEsnpDKqNMNg1yrNsBceCDvpkLeFncOO16VyD8I7q6m8=
X-Received: by 2002:a05:6902:2082:b0:e7d:44ee:9c7a with SMTP id
 3f1490d57ef6-e7d44ee9e76mr1602221276.40.1747665249108; Mon, 19 May 2025
 07:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250507160056.11876-1-hiagofranco@gmail.com> <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb> <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb>
In-Reply-To: <20250509191308.6i3ydftzork3sv5c@hiago-nb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 16:33:30 +0200
X-Gm-Features: AX0GCFsG_40iOKNCPwkbiqnn-4ukoqDDfiyLZnVk1h-WIiTDA33EI1CKHx8gLMM
Message-ID: <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250519_073410_476317_7F327422 
X-CRM114-Status: GOOD (  54.86  )
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

On Fri, 9 May 2025 at 21:13, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> On Fri, May 09, 2025 at 12:37:02PM +0200, Ulf Hansson wrote:
> > On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >
> > > Hello,
> > >
> > > On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> > > > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > > >
> > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > >
> > > > > When the remote core is started before Linux boots (e.g., by the
> > > > > bootloader), the driver currently is not able to attach because it only
> > > > > checks for cores running in different partitions. If the core was kicked
> > > > > by the bootloader, it is in the same partition as Linux and it is
> > > > > already up and running.
> > > > >
> > > > > This adds power mode verification through the SCU interface, enabling
> > > > > the driver to detect when the remote core is already running and
> > > > > properly attach to it.
> > > > >
> > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > > > > ---
> > > > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > > > suggested.
> > > > > ---
> > > > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> > > > >  1 file changed, 13 insertions(+)
> > > > >
> > > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > > index 627e57a88db2..9b6e9e41b7fc 100644
> > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> > > > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> > > > >                                 return -EINVAL;
> > > > >
> > > > > +                       /*
> > > > > +                        * If remote core is already running (e.g. kicked by
> > > > > +                        * the bootloader), attach to it.
> > > > > +                        */
> > > > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > > > > +                                                               priv->rsrc_id);
> > > > > +                       if (ret < 0)
> > > > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > > > > +                                       priv->rsrc_id, ret);
> > > > > +
> > > > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > > > > +                               priv->rproc->state = RPROC_DETACHED;
> > > > > +
> > > > >                         return imx_rproc_attach_pd(priv);
> > > >
> > > > Why is it important to potentially set "priv->rproc->state =
> > > > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> > > >
> > > > Would it be possible to do it the other way around? First calling
> > > > imx_rproc_attach_pd() then get the power-mode to know if
> > > > RPROC_DETACHED should be set or not?
> > > >
> > > > The main reason why I ask, is because of how we handle the single PM
> > > > domain case. In that case, the PM domain has already been attached
> > > > (and powered-on) before we reach this point.
> > >
> > > I am not sure if I understood correcly, let me know if I missed
> > > something. From my understanding in this case it does not matter, since
> > > the RPROC_DETACHED will only be a flag to trigger the attach callback
> > > from rproc_validate(), when rproc_add() is called inside
> > > remoteproc_core.c.
> >
> > Okay, I see.
> >
> > To me, it sounds like we should introduce a new genpd helper function
> > instead. Something along the lines of this (drivers/pmdomain/core.c)
> >
> > bool dev_pm_genpd_is_on(struct device *dev)
> > {
> >         struct generic_pm_domain *genpd;
> >         bool is_on;
> >
> >         genpd = dev_to_genpd_safe(dev);
> >         if (!genpd)
> >                 return false;
> >
> >         genpd_lock(genpd);
> >         is_on = genpd_status_on(genpd);
> >         genpd_unlock(genpd);
> >
> >         return is_on;
> > }
> >
> > After imx_rproc_attach_pd() has run, we have the devices that
> > correspond to the genpd(s). Those can then be passed as in-parameters
> > to the above function to get the power-state of their PM domains
> > (genpds). Based on that, we can decide if priv->rproc->state should be
> > to RPROC_DETACHED or not. Right?
>
> Got your idea, I think it should work yes, I am not so sure how. From
> what I can see these power domains are managed by
> drivers/pmdomain/imx/scu-pd.c and by enabling the debug messages I can
> see the power mode is correct when the remote core is powered on:
>
> [    0.317369] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_ON
>
> and powered off:
>
> [    0.314953] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_OFF
>
> But I cannot see how to integrate this into the dev_pm_genpd_is_on() you
> proposed. For a quick check, I added this function and it always return
> NULL at dev_to_genpd_safe(). Can you help me to understand this part?

As your device has multiple PM domains and those gets attached with
dev_pm_domain_attach_list(), the device(s) that you should use with
dev_pm_genpd_is_on() are in imx_rproc->pd_list->pd_devs[n].

>
> >
> > In this way we don't need to export unnecessary firmware functions
> > from firmware/imx/misc.c, as patch1/3 does.
> >
> > If you think it can work, I can help to cook a formal patch for the
> > above helper that you can fold into your series. Let me know.
> >
> > >
> > > With that we can correcly attach to the remote core running, which was
> > > not possible before, where the function returns at "return
> > > imx_rproc_attach_pd(priv);" with the RPROC_OFFLINE state to
> > > rproc_validate().
> >
> > I see, thanks for clarifying!
> >
> > Kind regards
> > Uffe
>
> Thank you!
> Hiago.

Kind regards
Uffe

