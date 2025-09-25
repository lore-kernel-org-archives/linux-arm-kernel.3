Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5076CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmyZXRi73uZYdBVcBjsptiB3fqiGtTcUPx0kUvNWDWU=; b=HvhsblyvqgNzvcaPb6uSz5y4y6
	20YPqSIZFvkkP0uFSh/cGcPM1fs/3P0OZ0Eb1wFU5DeunGCoacBf+HYKawgg/jGFlgsP2BOPjHB/c
	8R5JJdtnStYxEQmpuwBGxOgW0apRxcUA3X+nkKwyrRnBOVEtvuuPu0zb3EIXzU2DGNs4DTMxT9AWp
	2X4PC58TcFmtuu8brm2B73WxCpEIgcydaHEJo6/DjKua5uGnbvvfsG/XgpCidCYsVHiK7nJc2QTHG
	FrLobtWwzB/xDTyOUMVxSCg9zTWn4SUfeyHTNqEXvPCAwXe1dlSq1SMdY7G5YkZcZJeJZzDKxSkyS
	lU8/oQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mME-00000009c0T-2AHf;
	Thu, 25 Sep 2025 13:50:02 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mMC-00000009bxd-0jqu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 13:50:01 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-74f6974175dso14278897b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 06:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758808199; x=1759412999; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kmyZXRi73uZYdBVcBjsptiB3fqiGtTcUPx0kUvNWDWU=;
        b=ZBAKOA5ACMrHEa+fq+PDm4TiE+T42FKA4EKRdGqghA13ps6xm9yx/epMNQwK2I7Jmp
         fzNEf/4Vkseg+vGK9eZt8HbeJl1NHV0nrAXNG4TqoQN4cY+0ugSCZRrXwKWIC7HNdrOk
         IKPbKvWOXQrY7gJaQY6mvCeW12vQus/X2QSGtoDBSkFfYMa8JW3oID1zJkkcspJNrQSO
         lpdD6Ay5IheDy3rAQoE2Y+cR9p7G0JxRqbfJtOsVlLKgR3j8EKMuU+yj51bfXzNj2zlh
         3GT98Bysb6R3Zoj4ySJ9VEV3VWTw/PDcTDhrBVG32V9neYhfW+W5nkzZRPMgFzbOGD4q
         jhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758808199; x=1759412999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmyZXRi73uZYdBVcBjsptiB3fqiGtTcUPx0kUvNWDWU=;
        b=nEeX8K4uxWVVgq4dD0XLFFC5YhsfCXEfb/c4+ilyqhw1zT9NOLGkL6CRaLDumsY9Fm
         lpxeuyh7cFvr4pUfFee1N7qklOsx1oEGYwbr79c+CLkiBnZ5NVPR7S3mnODZKFd0o2a9
         46UrcwGcyWPJ+oS8wp71z9ADXg6jJxmNN/KQ671V1SCBDDpLSa/nBCm6Sf8QlR1HUu75
         c4sCzpJqjaHJqmMeeQn+/cmZhKdKHeEIYpgaL4ctnmbQfEE8sP5f1p9qYwG7pzdHnhfT
         8AqNrsMHD0arAmXYtEFaMdIa9FYahR2qcaHOo63DZkXy0ue81s7rmOmLLDOJBuu3RnXz
         H65g==
X-Forwarded-Encrypted: i=1; AJvYcCVCeVRJ9IfhQitGnMoXSp6FdhyC03mNzew16VUL+Dj9lkBXF7lePMFiMSHBCbVmkS/63bHJNDqC1RZLlA9GjKZ6@lists.infradead.org
X-Gm-Message-State: AOJu0YxYNA5TqgmdeSCGHv/XCDTan5tbcYGj/GoL09hMOVUBtHvh3jHK
	67hem0iJBf1r3FPJ8tPXaEiHMD+4ZiK4YuizPic7gzEbSwp1FqvkG21BrmygGqxKTWjBsuzIHRQ
	TY5lxAUbGErW1TJ/lCrwVJZTCq1NuH4YXYwxuoF8k3Q==
X-Gm-Gg: ASbGncunc0E1nvyUuc/X+d9Wer3xlT6iI7r1cF9LMsy20faTsNsZccmeaql6cWJH/5q
	qX9h/WV3wW6vZBA/rcvtlpoNg08WlOyV69DPxTQYqn22L9tL1eC4fQblGPxLL9Ewe7Od3sYcv80
	7F2Caj7Cfn9+4qN1qSOviWApYVoKx3gsyTIJVTghPHpE9Ivzn9igw2ytKe2CUfLR+dx7IVCcm5B
	PxEOLCz
X-Google-Smtp-Source: AGHT+IGaha3hYgmKpJiOOTZ9mrQajm66T6EOvbyDKUqs9BGv9oHsslH1tx8/pHWIf2OpE+bvRrEoo4jl8LUISCN+73k=
X-Received: by 2002:a05:690c:620d:b0:744:fe4e:b5ce with SMTP id
 00721157ae682-76406cdda58mr31077837b3.45.1758808198715; Thu, 25 Sep 2025
 06:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
 <20250923-imx_rproc_c2-v2-1-d31c437507e5@nxp.com> <CAPDyKFpjP07826FXh8XveXiH7ta+N=upYaowf7r6gyNWPSFfqA@mail.gmail.com>
 <20250925142400.GA18572@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250925142400.GA18572@nxa18884-linux.ap.freescale.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 25 Sep 2025 15:49:22 +0200
X-Gm-Features: AS18NWBypGVgaTpOeUMZ5LpwCPamsE3X5aIdHt-BsxZusAy24_34jazFPo4GtO0
Message-ID: <CAPDyKFqeWAqbM0td1gW0+Kz2g85xqCuSpQWdJEs8U7MmOPsY0Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup
 order and error handling
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_065000_235616_48BB0E32 
X-CRM114-Status: GOOD (  52.33  )
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

On Thu, 25 Sept 2025 at 15:12, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> Hi Ulf,
>
> Thanks for reviewing this patch.
>
> On Thu, Sep 25, 2025 at 12:18:39PM +0200, Ulf Hansson wrote:
> >On Tue, 23 Sept 2025 at 07:17, Peng Fan <peng.fan@nxp.com> wrote:
> >>
> >> The order of runtime PM API calls in the remove path is wrong.
> >> pm_runtime_put() should be called before pm_runtime_disable(), per the
> >> runtime PM guidelines. Calling pm_runtime_disable() prematurely can
> >> lead to incorrect reference counting and improper device suspend behavior.
> >
> >This isn't entirely correct as it depends a bit more on the runtime PM
> >deployment.
> >
> >More importantly, even if you would call pm_runtime_put() before the
> >call to pm_runtime_disable() doesn't necessarily mean that the device
> >becomes runtime suspended, as it can be prevented by user-space for
> >example, assuming that is the goal.
> >
> >To make sure the device is put back into a low power-state, this is
> >the typical pattern that is deployed in a driver's ->remove()
> >callback.
> >
> >*) Call pm_runtime_get_sync(), to make sure the device gets the runtime resumed.
> >Not needed in this case, as the runtime PM usage count was increased
> >during ->probe() and not dropped).
> >
> >*) Turn off resources that correspond to what the runtime PM callbacks
> >in the driver are managing.
> >Not needed, as there are no runtime PM callbacks for the driver.
> >
> >*) Call pm_runtime_disable() and then pm_runtime_put_noidle(). This
> >makes sure that when ->remove() is completed, the device is in a low
> >power-state and the runtime PM usage count has been restored.
> >
> >*) If there are PM domains, those are turned off by calling
> >dev_pm_domain_detach_list(), or from the driver core (after the
> >->remove() callback has been completed) for the single PM domain case.
> >
> >That said, one could consider converting the pm_runtime_put() here
> >into a pm_runtime_put_noidle(), to make it clear that this is only
> >about restoring the usage count, but I don't think it's a big deal.
> >
> >>
> >> Additionally, proper cleanup should be done when rproc_add() fails by
> >> invoking both pm_runtime_put() and pm_runtime_disable() to avoid leaving
> >> the device in an inconsistent power state.
> >
> >Right, this deserved to be fixed.
> >
> >>
> >> With using devm_pm_runtime_enable() for automatic resource management and
> >> introducing a devres-managed cleanup action imx_rproc_pm_runtime_put() to
> >> enforce correct PM API usage and simplify error paths, the upper two
> >> issues could be fixed. Also print out error log in case of error.
> >
> >I really don't want to encourage people to use
> >devm_pm_runtime_enable(), simply because it's not always a good fit
> >when making sure things get turned off in the correct sequence. In
> >particular, as it's just about saving one/two lines of code, this
> >doesn't make sense to me.
> >
> >I suggest you follow the similar pattern as I explained above for
> >->remove(), for the error path in ->probe() too. So, calling
> >pm_runtime_disable() and pm_runtime_put_noidle() should do the trick
> >for this too, I think.
>
> I appreciate for your detailed explaination. I intended to drop the remove path
> in this patchset :), but need to keep it now. No problem.
>
> Follow your suggestion, I work out one patch, would you please give a look
> whether this is good for you?
>
> You could ignore the 'dcfg->method == IMX_RPROC_SCU_API', I will drop
> this in the patchset to make the runtime PM apply for all, not just
> IMX_RPROC_SCU_API.
>
> Thanks in advance for you guidance and help.
>
> --------------------------------------------------------------------
> remoteproc: imx_rproc: Fix runtime PM cleanup and improve remove path
>
> Proper cleanup should be done when rproc_add() fails by invoking both
> pm_runtime_disable() and pm_runtime_put_noidle() to avoid leaving the
> device in an inconsistent power state.
>
> Fix it by adding pm_runtime_put_noidle() and pm_runtime_disable()
> in the error path.
>
> Also Update the remove() callback to use pm_runtime_put_noidle() instead of
> pm_runtime_put(), to clearly indicate that only need to restore the usage
> count.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bb25221a4a89..8424e6ea5569 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1136,11 +1136,16 @@ static int imx_rproc_probe(struct platform_device *pdev)
>         ret = rproc_add(rproc);
>         if (ret) {
>                 dev_err(dev, "rproc_add failed\n");
> -               goto err_put_clk;
> +               goto err_put_pm;
>         }
>
>         return 0;
>
> +err_put_pm:
> +       if (dcfg->method == IMX_RPROC_SCU_API) {
> +               pm_runtime_disable(dev);
> +               pm_runtime_put_noidle(dev);
> +       }
>  err_put_clk:
>         clk_disable_unprepare(priv->clk);
>  err_put_scu:
> @@ -1160,7 +1165,7 @@ static void imx_rproc_remove(struct platform_device *pdev)
>
>         if (priv->dcfg->method == IMX_RPROC_SCU_API) {
>                 pm_runtime_disable(priv->dev);
> -               pm_runtime_put(priv->dev);
> +               pm_runtime_put_noidle(priv->dev);
>         }
>         clk_disable_unprepare(priv->clk);
>         rproc_del(rproc);
>
>
> Thanks,
> Peng

Yes, this makes better sense to me!

Kind regards
Uffe

