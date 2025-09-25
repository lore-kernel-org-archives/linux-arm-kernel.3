Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8D5CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfJ32hMp/SXase9EIClmjehsriaoWao+oyHfJjiFbug=; b=fxlf32MOzekqnYabGmAIDfk+gN
	v6xGl1Yaex+KJbhUba6dZUrnv5TaC9YZAHF5gfHJelQBT3sYwpv8ZL0xO1ZxwOreCr5cv0hys8CrE
	Z1mK1FukoYqtEU3t0dhbBpQoCrggb9DDQY+0UxTpnoDdVKMMz+G9yeIh18M8N2zM5K7aSo1+PDBAZ
	8iU6sFct/iCRv1rUiDBq9jhO3rnUCnJISvjwsHu9sjfIpQ05gKigzXhoEVlB3kNDUILmXZvwrOY5A
	J0fik6dxViQTjBh6UHigCe6U22vu/LtKljTDW7h7+F7kQ8m8gPBskGwvSWnccVOUJlvBPtFfZFKwH
	jG3iRlwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1j4J-000000080nt-2vTB;
	Thu, 25 Sep 2025 10:19:19 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1j4H-000000080lG-0uzt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 10:19:18 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-71d6014810fso6902457b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 03:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758795556; x=1759400356; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tfJ32hMp/SXase9EIClmjehsriaoWao+oyHfJjiFbug=;
        b=vx3e2WhRmMXB/8AyyZIiv2ep7lqH+CMQdu33BEZ8WkU1Tj1/6o8WiRwIp8sQxGyi6x
         lJ1P2cl53+NelxV3Yh5vMndn+VN2xr6IzjTWjGmvaBceKubH5RFnvK0Q8xMA6BSIFUNi
         2v0t3aJCvvBh6++nRmPxTHMQRFDx1jYhAWA4SbI93iiKOoO9y/5MHOHqA0rAcrUVLsSh
         omTbNA3vkEmOuuerGfYlkSPZoPhZkjlu/y/NeevuKjzsZGEMmCPtq5xMHTkc497FIM8W
         UaVthpZ0Fslo6YuRozszeOl2LgNiG6FnbJIbKFWcd7p6CKlsPyxYFPddmcAAfzRAIX1G
         JQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758795556; x=1759400356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfJ32hMp/SXase9EIClmjehsriaoWao+oyHfJjiFbug=;
        b=c1q1Xu6jzEBxebDoaRTV6FsxBdVrE47nXbf8Erf2Q19S0Uf2niKJRSsRDSef4EXAHZ
         8by0kuLS+fL/ZzzqqdFYLRlCtEuS09jWt1ZqNAM6G+j3MIFqFJbV5z0s3LP5YlkpnBIk
         F89ZepSOO1kT8V393+nID2yhgajDttzpHyE2CXn2oCkkQwDxGfIBRCQhzKYpBKfpEPHh
         EzQUXo5vM2nQLXtBjCsZhm6IVEPNX1ztG5AZpPEsmL9JswUD90SgojE4czKbuL9mrsy3
         2XOwwXJPYmtZzs60qrTsRpJ/HP/8PNM0XtOuj6Xt1Ohc7961JEz4mNmVBpjk3sdDlVKt
         /8PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIkPRuAh7WRbZjU9jj+vhnq7ls+zmC6/VJcdL7BU8I+dsRyMfadMcenddvjAyCCE3mWznc9q3oAvckzbxYZ6vB@lists.infradead.org
X-Gm-Message-State: AOJu0YwdZfZtwZftUBizxxvDen6/h7ztHjWo7G9OPhlbd/bfSwEfckwY
	hod/r/FTT/62jBG8Hy6P5HOE371R3dsyQNTb5X5CRNkhjuyjG7cOomOby2Wa0h0Ie0b0v3HVvc5
	HiNHqXjlYRit/FhE2qNT8KuxpON1fncy/kacootwkoQ==
X-Gm-Gg: ASbGncvzdsShMTFiXREgVF4yUDLneFfRny8CxJTYMKR1/7A7V9FiPV/dcF7OF+/KdgJ
	1DvJMLeN+MHzHsltyk2UKo//gEQnHYYcTJpBE1D8IDB3bgU+lkQauLGMbwtagb2/QwDlsO5sEn3
	LepY2gYzUPawveZUDIk4EYtbWEM1eVXXHrC7lA44uVYTZhlwDLWS2fFS8oE8vwkYGaJYy9A2oCC
	aoQu1J9
X-Google-Smtp-Source: AGHT+IFqegPV4dsBkr5tbUoAw3Bm05qqiJTdfJDLdA6jeqSgBdmgnNcHPAYMQZGNKgLNwd05Ndo4qwVQgs+KcKU2zhM=
X-Received: by 2002:a05:690c:61c8:b0:750:bb77:4433 with SMTP id
 00721157ae682-764f444f932mr17758937b3.19.1758795555565; Thu, 25 Sep 2025
 03:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com> <20250923-imx_rproc_c2-v2-1-d31c437507e5@nxp.com>
In-Reply-To: <20250923-imx_rproc_c2-v2-1-d31c437507e5@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 25 Sep 2025 12:18:39 +0200
X-Gm-Features: AS18NWBVvi4sa4FYZSi9ELVd8mD6lGopH5aCYkeAuSPCLUa8dQJVAPN_Zi7EgaQ
Message-ID: <CAPDyKFpjP07826FXh8XveXiH7ta+N=upYaowf7r6gyNWPSFfqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup
 order and error handling
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_031917_292150_02E160F1 
X-CRM114-Status: GOOD (  36.52  )
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

On Tue, 23 Sept 2025 at 07:17, Peng Fan <peng.fan@nxp.com> wrote:
>
> The order of runtime PM API calls in the remove path is wrong.
> pm_runtime_put() should be called before pm_runtime_disable(), per the
> runtime PM guidelines. Calling pm_runtime_disable() prematurely can
> lead to incorrect reference counting and improper device suspend behavior.

This isn't entirely correct as it depends a bit more on the runtime PM
deployment.

More importantly, even if you would call pm_runtime_put() before the
call to pm_runtime_disable() doesn't necessarily mean that the device
becomes runtime suspended, as it can be prevented by user-space for
example, assuming that is the goal.

To make sure the device is put back into a low power-state, this is
the typical pattern that is deployed in a driver's ->remove()
callback.

*) Call pm_runtime_get_sync(), to make sure the device gets the runtime resumed.
Not needed in this case, as the runtime PM usage count was increased
during ->probe() and not dropped).

*) Turn off resources that correspond to what the runtime PM callbacks
in the driver are managing.
Not needed, as there are no runtime PM callbacks for the driver.

*) Call pm_runtime_disable() and then pm_runtime_put_noidle(). This
makes sure that when ->remove() is completed, the device is in a low
power-state and the runtime PM usage count has been restored.

*) If there are PM domains, those are turned off by calling
dev_pm_domain_detach_list(), or from the driver core (after the
->remove() callback has been completed) for the single PM domain case.

That said, one could consider converting the pm_runtime_put() here
into a pm_runtime_put_noidle(), to make it clear that this is only
about restoring the usage count, but I don't think it's a big deal.

>
> Additionally, proper cleanup should be done when rproc_add() fails by
> invoking both pm_runtime_put() and pm_runtime_disable() to avoid leaving
> the device in an inconsistent power state.

Right, this deserved to be fixed.

>
> With using devm_pm_runtime_enable() for automatic resource management and
> introducing a devres-managed cleanup action imx_rproc_pm_runtime_put() to
> enforce correct PM API usage and simplify error paths, the upper two
> issues could be fixed. Also print out error log in case of error.

I really don't want to encourage people to use
devm_pm_runtime_enable(), simply because it's not always a good fit
when making sure things get turned off in the correct sequence. In
particular, as it's just about saving one/two lines of code, this
doesn't make sense to me.

I suggest you follow the similar pattern as I explained above for
->remove(), for the error path in ->probe() too. So, calling
pm_runtime_disable() and pm_runtime_put_noidle() should do the trick
for this too, I think.

>
> Fixes: a876a3aacc43 ("remoteproc: imx_rproc: detect and attach to pre-booted remote cores")
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Kind regards
Uffe

> ---
>  drivers/remoteproc/imx_rproc.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bb25221a4a8987ff427d68e2a5535f0e156b0097..12305f36552fb5265b0953a099ea0d561880e3ff 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1046,6 +1046,13 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>         return NOTIFY_DONE;
>  }
>
> +static void imx_rproc_pm_runtime_put(void *data)
> +{
> +       struct device *dev = data;
> +
> +       pm_runtime_put(dev);
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> @@ -1125,12 +1132,23 @@ static int imx_rproc_probe(struct platform_device *pdev)
>         }
>
>         if (dcfg->method == IMX_RPROC_SCU_API) {
> -               pm_runtime_enable(dev);
> +               ret = devm_pm_runtime_enable(dev);
> +               if (ret) {
> +                       dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
> +                       goto err_put_clk;
> +               }
> +
>                 ret = pm_runtime_resume_and_get(dev);
>                 if (ret) {
>                         dev_err(dev, "pm_runtime get failed: %d\n", ret);
>                         goto err_put_clk;
>                 }
> +
> +               ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
> +               if (ret) {
> +                       dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
> +                       goto err_put_clk;
> +               }
>         }
>
>         ret = rproc_add(rproc);
> @@ -1158,10 +1176,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
>         struct rproc *rproc = platform_get_drvdata(pdev);
>         struct imx_rproc *priv = rproc->priv;
>
> -       if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> -               pm_runtime_disable(priv->dev);
> -               pm_runtime_put(priv->dev);
> -       }
>         clk_disable_unprepare(priv->clk);
>         rproc_del(rproc);
>         imx_rproc_put_scu(rproc);
>
> --
> 2.37.1
>

