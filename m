Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFD6C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 18:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGH/NngmpLn7x/rcD9jvP+7rxM2JWBV0X7vyoSK4edc=; b=sSLXxJtVGaBSqnCSj0dR6bOmBI
	6BjbQ+GYYAeBwdhM8KOKHjqmmW5TWF2jue9D6GpPN0qmyQavqGwJ78y98Zwg/0z1fWBH3D+m5Kiu6
	rwrSyNf301eyYfXBCbO8kozn2Ka/kbEAyomlGKj9Uq2uXhSd/mhTUrPhQgluH0VoD1ek7vyEoNel0
	X3U6J4nWfgXu9yCxRAa8NNt/9Aw1jknPUnkziSK7cCoRmLnmQWX2GPNxWh0GnlS5u2cPMoYZ/xaEj
	nYvlK8QgHAeIV45BiQEmB+iORAWbhfybQIMJkviln0MhgY87zGZU0GWV1F+OV3gRl99BRNBsDzNFw
	vIJ/E5eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4uP-0000000A5b2-1AcS;
	Mon, 19 May 2025 18:08:17 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4Dc-00000009xM5-3NRw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 17:24:06 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-525da75d902so1470154e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747675443; x=1748280243; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GGH/NngmpLn7x/rcD9jvP+7rxM2JWBV0X7vyoSK4edc=;
        b=l86P4nuWEoVo4r4r3cXASgOUMd754WVMImkMZDpdDIRTqtVlXkg6O4icVFI+mXEbaV
         sxwQ+5rQb3vZYXCfwiacSa1prLiwQ3rWGeB/Whd4A1JQHGgmiCd2k7FHGyVC2UIMr4c3
         3bv/9URjoAEZpN/D3XU5A18bHOxNRvRhMiu1cRI/yGHWm0IK5LedmpBMxkde/kqElODi
         xHhpVGXcuTt9iyP4S2a7EhGi4n5fIHAM8zY7pb9i9IMsuqm3CjM4l7ikuzdg5HOUj4g8
         hbRaBBYqNWCuf3+tvIoYxrprlbsSKOFXq00KOsF1pv5ELYfjJvSQk0RB7A3l1wNROldX
         ALSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747675443; x=1748280243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGH/NngmpLn7x/rcD9jvP+7rxM2JWBV0X7vyoSK4edc=;
        b=IThiXngcUuOoGejj2aOHOOzRYC2CuVjqSzGlV9dG/tfww2dKEWQM8JqTgz6GBLWIIm
         77KqvC7PkvXSvEndihj/8/k88n/LBx1oW7bD4xqW4q8/pRLsz/MHt3xYim7xdKyTnPIv
         9a2qMrnDM7O3c7TfsQRLytQ9ZRmYl3jt2mx9yORDJSWC1Dsy0bPJ5sNMVp7bB98AZw/w
         GOCqz+MmKovecmP3oWTiDLmaUH8w9xzGQEB3FCR2J1jrsMvdxN/ctfeyl6UkQ3VNVnCb
         go42aIPFOSQNbVg/pIotwq//OiKPePz/jgEvSSPti/rFnbe3ZSxmogtD2V1rQDZC6dVN
         8NjA==
X-Forwarded-Encrypted: i=1; AJvYcCVA17aVo5Vzu+ya+E8yKy9fF5oZOYlMGrJU9GH1kFa9PM5x4AmJs4rhOgfnPBBnd9XDijdJedSUWh1aNnbjKwCX@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc8ioDXPxjNfwpWHwMHknvvZkBFeuICmJzwP4CuvrdL31eis63
	iKXmQ9ENVd2llLx5Lt2WNlRZ37NxQUhaOqToC19KKrTNTgYmcWnC7bHY
X-Gm-Gg: ASbGncvf886AVTjQLvd/jD/xXgpBOKiAI8ZCes8v25/vWHQ4JZnL0yVP9iFU3nLh1ek
	zSF0seG5EyN55sQDctJzhr0mocjOp97KK+1nmjDLyMxZZOnoR4c2ikqFtYWuZDLoxLsBbmPkWEk
	bEWWWMk+LFgc1v136mw2yy6wzPcK1Wu2xMWp46No3GuHZf+2Ksmb6ILvPQqygMx+K2bBLvkQY0l
	uRouSWyy5LcJMqDnlbT2Ts0zWWISzim4tdxu/f2I/gstMIYo8G6Q6JhyQy4/BHtxvtBTNz1TJ0+
	5ogvfdBeGtROjYeNgAr1er6fv7xdbN8DTm84mpXas+ajIvq5Lg==
X-Google-Smtp-Source: AGHT+IGRviLTeo62L5TV0RMJJBJvgHY6LfT1aj/EMG2TzZ7seoCGW/qrJst+1Op6xHvQDdGo6QSqHA==
X-Received: by 2002:a05:6122:6504:b0:52d:bc0d:83f with SMTP id 71dfb90a1353d-52dbc0d0968mr7149532e0c.11.1747675443405;
        Mon, 19 May 2025 10:24:03 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e983sm7017867e0c.31.2025.05.19.10.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:24:02 -0700 (PDT)
Date: Mon, 19 May 2025 14:23:57 -0300
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
Message-ID: <20250519172357.vfnwehrbkk24vkge@hiago-nb>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
 <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb>
 <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb>
 <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_102404_849669_78243CB7 
X-CRM114-Status: GOOD (  58.48  )
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

Hi Ulf,

On Mon, May 19, 2025 at 04:33:30PM +0200, Ulf Hansson wrote:
> On Fri, 9 May 2025 at 21:13, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > On Fri, May 09, 2025 at 12:37:02PM +0200, Ulf Hansson wrote:
> > > On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> > > > > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > > > >
> > > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > > >
> > > > > > When the remote core is started before Linux boots (e.g., by the
> > > > > > bootloader), the driver currently is not able to attach because it only
> > > > > > checks for cores running in different partitions. If the core was kicked
> > > > > > by the bootloader, it is in the same partition as Linux and it is
> > > > > > already up and running.
> > > > > >
> > > > > > This adds power mode verification through the SCU interface, enabling
> > > > > > the driver to detect when the remote core is already running and
> > > > > > properly attach to it.
> > > > > >
> > > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > > > > > ---
> > > > > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > > > > suggested.
> > > > > > ---
> > > > > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> > > > > >  1 file changed, 13 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > > > index 627e57a88db2..9b6e9e41b7fc 100644
> > > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> > > > > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> > > > > >                                 return -EINVAL;
> > > > > >
> > > > > > +                       /*
> > > > > > +                        * If remote core is already running (e.g. kicked by
> > > > > > +                        * the bootloader), attach to it.
> > > > > > +                        */
> > > > > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > > > > > +                                                               priv->rsrc_id);
> > > > > > +                       if (ret < 0)
> > > > > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > > > > > +                                       priv->rsrc_id, ret);
> > > > > > +
> > > > > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > > > > > +                               priv->rproc->state = RPROC_DETACHED;
> > > > > > +
> > > > > >                         return imx_rproc_attach_pd(priv);
> > > > >
> > > > > Why is it important to potentially set "priv->rproc->state =
> > > > > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> > > > >
> > > > > Would it be possible to do it the other way around? First calling
> > > > > imx_rproc_attach_pd() then get the power-mode to know if
> > > > > RPROC_DETACHED should be set or not?
> > > > >
> > > > > The main reason why I ask, is because of how we handle the single PM
> > > > > domain case. In that case, the PM domain has already been attached
> > > > > (and powered-on) before we reach this point.
> > > >
> > > > I am not sure if I understood correcly, let me know if I missed
> > > > something. From my understanding in this case it does not matter, since
> > > > the RPROC_DETACHED will only be a flag to trigger the attach callback
> > > > from rproc_validate(), when rproc_add() is called inside
> > > > remoteproc_core.c.
> > >
> > > Okay, I see.
> > >
> > > To me, it sounds like we should introduce a new genpd helper function
> > > instead. Something along the lines of this (drivers/pmdomain/core.c)
> > >
> > > bool dev_pm_genpd_is_on(struct device *dev)
> > > {
> > >         struct generic_pm_domain *genpd;
> > >         bool is_on;
> > >
> > >         genpd = dev_to_genpd_safe(dev);
> > >         if (!genpd)
> > >                 return false;
> > >
> > >         genpd_lock(genpd);
> > >         is_on = genpd_status_on(genpd);
> > >         genpd_unlock(genpd);
> > >
> > >         return is_on;
> > > }
> > >
> > > After imx_rproc_attach_pd() has run, we have the devices that
> > > correspond to the genpd(s). Those can then be passed as in-parameters
> > > to the above function to get the power-state of their PM domains
> > > (genpds). Based on that, we can decide if priv->rproc->state should be
> > > to RPROC_DETACHED or not. Right?
> >
> > Got your idea, I think it should work yes, I am not so sure how. From
> > what I can see these power domains are managed by
> > drivers/pmdomain/imx/scu-pd.c and by enabling the debug messages I can
> > see the power mode is correct when the remote core is powered on:
> >
> > [    0.317369] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_ON
> >
> > and powered off:
> >
> > [    0.314953] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_OFF
> >
> > But I cannot see how to integrate this into the dev_pm_genpd_is_on() you
> > proposed. For a quick check, I added this function and it always return
> > NULL at dev_to_genpd_safe(). Can you help me to understand this part?
> 
> As your device has multiple PM domains and those gets attached with
> dev_pm_domain_attach_list(), the device(s) that you should use with
> dev_pm_genpd_is_on() are in imx_rproc->pd_list->pd_devs[n].

Ok got it, thanks for sharing.

I just send the v3 with the changes Peng proposed (here
https://lore.kernel.org/lkml/20250519171514.61974-1-hiagofranco@gmail.com/T/#t),
but I am a bit confused which path we should take, the initial approach
proposed or using these PD functions. Maybe we can discuss this in the
new v3 patch series?

> 
> >
> > >
> > > In this way we don't need to export unnecessary firmware functions
> > > from firmware/imx/misc.c, as patch1/3 does.
> > >
> > > If you think it can work, I can help to cook a formal patch for the
> > > above helper that you can fold into your series. Let me know.
> > >
> > > >
> > > > With that we can correcly attach to the remote core running, which was
> > > > not possible before, where the function returns at "return
> > > > imx_rproc_attach_pd(priv);" with the RPROC_OFFLINE state to
> > > > rproc_validate().
> > >
> > > I see, thanks for clarifying!
> > >
> > > Kind regards
> > > Uffe
> >
> > Thank you!
> > Hiago.
> 
> Kind regards
> Uffe

Thanks,
Hiago.

