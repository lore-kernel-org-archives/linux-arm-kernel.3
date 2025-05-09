Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832E0C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8HWqsBnOgHqfOkli6JOl9XjSbPGwepeT1L+AmPmiow=; b=Q5lt/bkiO6Yjnm68VGJt5yIw9T
	u6tfZKNO6nJTJ+2mTZaZEK4np/1M9JfV8t3WL8gDUvVRh1Ix9fasGzoiM5gprtSJMT3iMo1FOkTy4
	AOfaSINm9XIIfAR3Tyv7PT8MC/cofrlNlH3y89en+nTgqlEqXqFW1NrYZJK2QmsIEpmHArEv0knup
	JnT8tEGm/JBNMpP+et9ofCQY/fXL4coKCa4mro7XjgZGyHBaVBhpg5A0OF2z7vZUa7LcnChWh+76T
	jvDcNm+aP7TxqWb3bnytpdsTuSvz+jNDKInhVH0WIJVU49U9T4d5sryL7wRZr3redFyCAHPW/1L3Q
	KOgPRUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDM45-00000003SH8-0St9;
	Fri, 09 May 2025 11:38:53 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDL6p-00000003Inm-1u2I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:37:40 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e7297c3ce7aso1649712276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746787058; x=1747391858; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v8HWqsBnOgHqfOkli6JOl9XjSbPGwepeT1L+AmPmiow=;
        b=o0X8JY4AFzkM+1QzcY3IS8G4vdeqzEhP43ZGH+pKsHdXGAm6Fs9JHW7EP0neu5O9Na
         uirYl6qg1QrXZSkdavGl5NfOsEK6b6N0GJENu7FRIK+zhybo3RhsL64vKbhZoFUBv5Mn
         TJKxrrt9GYxSzS+TsHJgb47VzemParezh9kOX2YV3dTOnUfqAyk4Iyh+5UR7ZphTcA8G
         6GXquxjREiXBULLpQjautFJRjk1LaRVi1FGkgKd4Q6YFv6pyJVLtF5L6Y4qzxIdkJ0V6
         Owvh4+XlNS9vKfmvwzWE3lJx+PwergUMbDAQBMC0gycP8Dg9mn9P91IRXtoX0/NWHRse
         HgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746787058; x=1747391858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8HWqsBnOgHqfOkli6JOl9XjSbPGwepeT1L+AmPmiow=;
        b=mOFl/mz2kw6f6223Hl/VPIAQon3XuvZVu2ENj1Ot5avqHQsCuTwY8sAtNgUPos0vwz
         HucBW+8q6EPctH1Dd+VwyFVjtJzn4qMhcqmL29pnUbvZ0SSB7YwWlUvpaQwVG+Vkn/Zx
         qo6Sj7NbTKVI0ZmWYYYC/Z+fCusIutN/zV7PEhLSrJ8CeS446YYu9fABOgqkZIs1wSle
         D2BVvs2u8yeVM7PdAoMpkdd/MO1EnbTdlBMJpJgJ7Wte/FUqIw7pzmrqOyanWt8wYgci
         VspsL6AAQUei8bfyP5YOiAapZuARTPP9XS2Pq/3VPSQQDPJmT4tu3lupSYBURnMLKY1J
         zlGw==
X-Forwarded-Encrypted: i=1; AJvYcCUW7qsaVB+0bXVEtDGpfEb1Gbw3OH7l0LGlhGL2Y90//tHPqSXpVEWrOaOP2r1ItD8hoNdsmTjjw+M5TIXKbuCp@lists.infradead.org
X-Gm-Message-State: AOJu0YwTRTwpFdJhiY1Md5pwbXN84ktPS7i8wQbFusDG5pMceCZfSG/6
	n+fsX9os1zyLGMzzyWbaU+YLbYF/4hxJUjzJZ1Cy4dTGMFIFBUpV3EZwFIK+JJoW3Bn/OJCYIaB
	I8iURv6HzbDUbUb7sdbWGUHq5FtYXRFDoKQ17PQ==
X-Gm-Gg: ASbGncuCq0hL5O2BBTTcHtVBweeBW3nl4yGtxdVH0DbSr28KKRtfRmBylFvGPbvOhnf
	3KNs3AREEXc8/fbui0KeesHj1tj2ZzomN7kjUsfQP0mNsgq94s0RkaM2u2x7rxDxcod5Hn33bxJ
	mz0Muh3lfsY4CtJxssIaOphVE=
X-Google-Smtp-Source: AGHT+IHGUQjJVdBjTJmRKFe+lI4Dr7Yvcb3JZ9EYjARYtthQZOUUjBw0vFstcVpvdszrsUfiNCJi95xf6kgp4EbzMV4=
X-Received: by 2002:a05:6902:161c:b0:e73:1b5a:940e with SMTP id
 3f1490d57ef6-e78fdc94c29mr3707287276.12.1746787057898; Fri, 09 May 2025
 03:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250507160056.11876-1-hiagofranco@gmail.com> <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com> <20250508202826.33bke6atcvqdkfa4@hiago-nb>
In-Reply-To: <20250508202826.33bke6atcvqdkfa4@hiago-nb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 9 May 2025 12:37:02 +0200
X-Gm-Features: ATxdqUFDC_Pl3jlEgS_HbLn5g6wqCpqO-dLCHrdHv6je6wX2F4IVnpafFiKhvog
Message-ID: <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250509_033739_518732_3EC01943 
X-CRM114-Status: GOOD (  40.96  )
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

On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> Hello,
>
> On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > When the remote core is started before Linux boots (e.g., by the
> > > bootloader), the driver currently is not able to attach because it only
> > > checks for cores running in different partitions. If the core was kicked
> > > by the bootloader, it is in the same partition as Linux and it is
> > > already up and running.
> > >
> > > This adds power mode verification through the SCU interface, enabling
> > > the driver to detect when the remote core is already running and
> > > properly attach to it.
> > >
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > suggested.
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 627e57a88db2..9b6e9e41b7fc 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> > >                                 return -EINVAL;
> > >
> > > +                       /*
> > > +                        * If remote core is already running (e.g. kicked by
> > > +                        * the bootloader), attach to it.
> > > +                        */
> > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > > +                                                               priv->rsrc_id);
> > > +                       if (ret < 0)
> > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > > +                                       priv->rsrc_id, ret);
> > > +
> > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > > +                               priv->rproc->state = RPROC_DETACHED;
> > > +
> > >                         return imx_rproc_attach_pd(priv);
> >
> > Why is it important to potentially set "priv->rproc->state =
> > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> >
> > Would it be possible to do it the other way around? First calling
> > imx_rproc_attach_pd() then get the power-mode to know if
> > RPROC_DETACHED should be set or not?
> >
> > The main reason why I ask, is because of how we handle the single PM
> > domain case. In that case, the PM domain has already been attached
> > (and powered-on) before we reach this point.
>
> I am not sure if I understood correcly, let me know if I missed
> something. From my understanding in this case it does not matter, since
> the RPROC_DETACHED will only be a flag to trigger the attach callback
> from rproc_validate(), when rproc_add() is called inside
> remoteproc_core.c.

Okay, I see.

To me, it sounds like we should introduce a new genpd helper function
instead. Something along the lines of this (drivers/pmdomain/core.c)

bool dev_pm_genpd_is_on(struct device *dev)
{
        struct generic_pm_domain *genpd;
        bool is_on;

        genpd = dev_to_genpd_safe(dev);
        if (!genpd)
                return false;

        genpd_lock(genpd);
        is_on = genpd_status_on(genpd);
        genpd_unlock(genpd);

        return is_on;
}

After imx_rproc_attach_pd() has run, we have the devices that
correspond to the genpd(s). Those can then be passed as in-parameters
to the above function to get the power-state of their PM domains
(genpds). Based on that, we can decide if priv->rproc->state should be
to RPROC_DETACHED or not. Right?

In this way we don't need to export unnecessary firmware functions
from firmware/imx/misc.c, as patch1/3 does.

If you think it can work, I can help to cook a formal patch for the
above helper that you can fold into your series. Let me know.

>
> With that we can correcly attach to the remote core running, which was
> not possible before, where the function returns at "return
> imx_rproc_attach_pd(priv);" with the RPROC_OFFLINE state to
> rproc_validate().

I see, thanks for clarifying!

Kind regards
Uffe

