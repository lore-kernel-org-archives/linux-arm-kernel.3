Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD8EC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrNoKeX2Lj5/qNveVALcOn5Q7n0Yzi5c56UWgJ4BBhY=; b=AJUsj2B5gOPMURV+ttLB0m+bOG
	sUDpvaZq+X7zB/gw6RGGJLDEazgXro8bA4Dwbh2Isi+KetXmfckgfn61PW6ONOXElQexTVutUDjO9
	H2ZDavxlm4C80ThiJlvPRL3lQ106T5dpbW48zAAoI+2OIV2r1qGFM78Ihx+OZnVEO2KDwHvMZKQID
	RdcFEy1tzIt2Y4cv8Z7i4f9+ENV4p3htygyo31zQ+y6CZYScGG5XBIVMVay1umfJX7Bb8mOng60ZM
	aMnYnx9hr0ESOVKBxDQptY5i0IqlZ760i6OEH2DrJQIXHcHJ0vSNDg/6BheazR+TcatamBudNhPzG
	MTF5qIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2bx-00000009eJI-2XRM;
	Mon, 19 May 2025 15:41:05 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1jm-00000009UFv-0dWp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:45:07 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e731a56e111so4311511276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 07:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747665905; x=1748270705; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WrNoKeX2Lj5/qNveVALcOn5Q7n0Yzi5c56UWgJ4BBhY=;
        b=u5G+KbBTRlQNDrGRn9EZmYPI/zR4uU+TnRpETIldzqU4c08a6l57oTww+4or2qIIQN
         6pYvbx0RNKzAeBg7K6JWWb3+JFiBPtfKH1YsbCeiio8ZPXCAN1MzfXbO2m8xSZbzzsy7
         aos20zTNuuLzFx84dK2T0DQeB2ayWV/uFnjwPBzT8/CpzzUw3HoY+a7BRX+ZXrGrjNu1
         P2ehVjI3pFFi/EXUyrLf7ICgBo++5qYfttmR1pxmNEzpuQjEZ4+yOThF+ll7+c8BDjFP
         PIyq9jK2vVc4UrYe3TQ7TcLrPxbx/HXlusijHfRgMd9RyCvy63ECSCQ/zYCRk07Y+nm7
         iCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665905; x=1748270705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrNoKeX2Lj5/qNveVALcOn5Q7n0Yzi5c56UWgJ4BBhY=;
        b=J0BghHo5H93jYbGpglEisWuwM9ABq4dqmBfbMiystIWRk9awVRhCMSMHpQMNtr7y7K
         7u9B4soIrxhrfNUoILgQ5JCFYoIdQBBwvZ+inRTcGEDns2GrY+TwCMeT6WFpro2/TAKE
         z51r0ffOP6NW9EBJVlV53kyfHajLITlhKBdNsU/OQM/rI5Da6yVLCkcqRM9L9LZearZV
         NSDSRIrwG8Qjh8IHGvQ934Y5FGB4nEoa/P9/OKIuWeHCCrI4N9J+YK3D/dZjC8T/SS7n
         pzLrMC9nO3ML7EDcY5KTDXI3+1YEa3EftuliCeNiWEu7MKJr6adYtynCporndStf0M4h
         mepA==
X-Forwarded-Encrypted: i=1; AJvYcCXPWRjqIzc+HzdxEIG4QJErh6pdhI6IIt1kRMQy/PN9be+ffDDX8JtyQxvxxJGLIU6KPo231+p/f0iHm6Hie+b6@lists.infradead.org
X-Gm-Message-State: AOJu0YxMug3LjjeeMO+AmGksn4t/MQ6CPUW2cJWW1R3JehzT3bNG7EO6
	OggmIE2Do9iDXyH9GrsxVxbFFXTV0UvTHodzM0aynp3FDIjcxCgdBUoaLtbhUDtSLJaHb8kwCP4
	nfTcu5kslthCBmzqSCtWlp7HYyBgq/edgpa5QpMmDbA==
X-Gm-Gg: ASbGncvnrKolDqxSs7Cpp6Z+4NaEPasJ+pvFWLnINBWgomwlUssI9mODiBoIUBrXeTA
	5uTZmcOfznQrPyMJr9jzbIRrHgN9JHvJPUiMmiU9ZbSl24hwuNvxDUXhKy7hHosIPC4wZiUvSx9
	1pUj6r1z49LJjtb6PO/GZlPZrb2RGmKuRW+fDc/02Uqrr9
X-Google-Smtp-Source: AGHT+IF8/uwDdoGOrriHzNUlc7Tuwt8k1isUfkEw9K/S9llcMRcrkUJk2jiCJcYg88blueJKed7YKLdIpbr1Gbas65Y=
X-Received: by 2002:a05:6902:2504:b0:e7b:5e00:54a8 with SMTP id
 3f1490d57ef6-e7b6a41fc80mr17171222276.32.1747665905046; Mon, 19 May 2025
 07:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250507160056.11876-1-hiagofranco@gmail.com> <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb> <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb> <20250512045613.GB31197@nxa18884-linux>
 <CAPDyKFqLMEOEnGDRE-1OUi8o8eVd4_oYPH4heu=WFQ8+4s+3-w@mail.gmail.com>
In-Reply-To: <CAPDyKFqLMEOEnGDRE-1OUi8o8eVd4_oYPH4heu=WFQ8+4s+3-w@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 16:44:28 +0200
X-Gm-Features: AX0GCFsoxBKbaWTA3FYRE0-ad2i-E4rboVBaxePNJn3SS4-9nGpIGtS4wBpf9Ns
Message-ID: <CAPDyKFrRLKc5FSng3P-8Hfe+R-3CYoPLwrYq1uMgXVNO4MA-xw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250519_074506_197144_9AE05BB1 
X-CRM114-Status: GOOD (  55.77  )
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

On Mon, 19 May 2025 at 16:39, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Mon, 12 May 2025 at 05:46, Peng Fan <peng.fan@oss.nxp.com> wrote:
> >
> > On Fri, May 09, 2025 at 04:13:08PM -0300, Hiago De Franco wrote:
> > >On Fri, May 09, 2025 at 12:37:02PM +0200, Ulf Hansson wrote:
> > >> On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >> >
> > >> > Hello,
> > >> >
> > >> > On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> > >> > > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >> > > >
> > >> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >> > > >
> > >> > > > When the remote core is started before Linux boots (e.g., by the
> > >> > > > bootloader), the driver currently is not able to attach because it only
> > >> > > > checks for cores running in different partitions. If the core was kicked
> > >> > > > by the bootloader, it is in the same partition as Linux and it is
> > >> > > > already up and running.
> > >> > > >
> > >> > > > This adds power mode verification through the SCU interface, enabling
> > >> > > > the driver to detect when the remote core is already running and
> > >> > > > properly attach to it.
> > >> > > >
> > >> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > >> > > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > >> > > > ---
> > >> > > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > >> > > > suggested.
> > >> > > > ---
> > >> > > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> > >> > > >  1 file changed, 13 insertions(+)
> > >> > > >
> > >> > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > >> > > > index 627e57a88db2..9b6e9e41b7fc 100644
> > >> > > > --- a/drivers/remoteproc/imx_rproc.c
> > >> > > > +++ b/drivers/remoteproc/imx_rproc.c
> > >> > > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> > >> > > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> > >> > > >                                 return -EINVAL;
> > >> > > >
> > >> > > > +                       /*
> > >> > > > +                        * If remote core is already running (e.g. kicked by
> > >> > > > +                        * the bootloader), attach to it.
> > >> > > > +                        */
> > >> > > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > >> > > > +                                                               priv->rsrc_id);
> > >> > > > +                       if (ret < 0)
> > >> > > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > >> > > > +                                       priv->rsrc_id, ret);
> > >> > > > +
> > >> > > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > >> > > > +                               priv->rproc->state = RPROC_DETACHED;
> > >> > > > +
> > >> > > >                         return imx_rproc_attach_pd(priv);
> > >> > >
> > >> > > Why is it important to potentially set "priv->rproc->state =
> > >> > > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> > >> > >
> > >> > > Would it be possible to do it the other way around? First calling
> > >> > > imx_rproc_attach_pd() then get the power-mode to know if
> > >> > > RPROC_DETACHED should be set or not?
> > >> > >
> > >> > > The main reason why I ask, is because of how we handle the single PM
> > >> > > domain case. In that case, the PM domain has already been attached
> > >> > > (and powered-on) before we reach this point.
> > >> >
> > >> > I am not sure if I understood correcly, let me know if I missed
> > >> > something. From my understanding in this case it does not matter, since
> > >> > the RPROC_DETACHED will only be a flag to trigger the attach callback
> > >> > from rproc_validate(), when rproc_add() is called inside
> > >> > remoteproc_core.c.
> > >>
> > >> Okay, I see.
> > >>
> > >> To me, it sounds like we should introduce a new genpd helper function
> > >> instead. Something along the lines of this (drivers/pmdomain/core.c)
> > >>
> > >> bool dev_pm_genpd_is_on(struct device *dev)
> > >> {
> > >>         struct generic_pm_domain *genpd;
> > >>         bool is_on;
> > >>
> > >>         genpd = dev_to_genpd_safe(dev);
> > >>         if (!genpd)
> > >>                 return false;
> > >>
> > >>         genpd_lock(genpd);
> > >>         is_on = genpd_status_on(genpd);
> > >>         genpd_unlock(genpd);
> > >>
> > >>         return is_on;
> > >> }
> > >>
> > >> After imx_rproc_attach_pd() has run, we have the devices that
> > >> correspond to the genpd(s). Those can then be passed as in-parameters
> > >> to the above function to get the power-state of their PM domains
> > >> (genpds). Based on that, we can decide if priv->rproc->state should be
> > >> to RPROC_DETACHED or not. Right?
> > >
> > >Got your idea, I think it should work yes, I am not so sure how. From
> > >what I can see these power domains are managed by
> > >drivers/pmdomain/imx/scu-pd.c and by enabling the debug messages I can
> > >see the power mode is correct when the remote core is powered on:
> > >
> > >[    0.317369] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_ON
> > >
> > >and powered off:
> > >
> > >[    0.314953] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_OFF
> > >
> > >But I cannot see how to integrate this into the dev_pm_genpd_is_on() you
> > >proposed. For a quick check, I added this function and it always return
> > >NULL at dev_to_genpd_safe(). Can you help me to understand this part?
> >
> > Ulf's new API dev_pm_genpd_is_on needs to run after power domain attached.
>
> Correct, but you need to provide the correct "dev" to it. See my other
> reply to Hiago.
>
> >
> > But if run after power domain attached, there is no API to know whether
> > M4 is kicked by bootloader or now.
>
> As long as you have multiple PM domains attached for a device, genpd
> will *not* power on the PM domain(s).
>
> Genpd does a power-on in the single PM domain case (for legacy
> reasons), but that should not be a problem here, right?
>
> So what am I missing?

Aha, PD_FLAG_DEV_LINK_ON is being used when you attach to the PM
domains. I would re-work things in the driver (if needed) so you can
avoid using this flag, then the PM domains should stay power-off until
there is a call to pm_runtime_get_sync().

[...]

Kind regards
Uffe

