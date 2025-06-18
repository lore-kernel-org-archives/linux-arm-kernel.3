Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F70C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKGxDPrsrGFp0Bze86vZksL2+DNrY5eWcc4p55uZfLg=; b=wsoXtVw0ZC50OfPd7uF5nGE2Ge
	Jzg1KmKEzTKEJXiyk7cE9Cy4qCW8p+m2IkPh/TQ23dtdVhyPIuDt/hnfpQq3JOPSZXqqjTlx5erYc
	PXhTI3ScFWFwkv7dANZYWoYNDaQ04nvdfBUci41p+xlB6EoNhcD2ueaeUaA08RbRg9JZe8pVkiuGu
	IPKUVZqFR5ezoJ6bKbv3WYwXS40lWNJfvGDOOPs0wPsRGJratO0+XtK7HOaaus+wahhFAqNZNl4WH
	fEt3xnlpj/rvkJHaAi+SGC5G2H7+bHFasNroW8vNNWwXq/1TQbNngu/XdSfMpwTny2bLgoM7qMLUs
	hgb2r/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsoI-0000000AHY0-0zYN;
	Wed, 18 Jun 2025 13:26:38 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrfD-0000000A5AC-1dle
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:13:12 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ad89c32a7b5so1074292266b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 05:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248789; x=1750853589; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bKGxDPrsrGFp0Bze86vZksL2+DNrY5eWcc4p55uZfLg=;
        b=cN8wXJgKPvB3jqBBp7c61vJmyqjYsdCJJ2sitAIBQqx84GKro3cTmmsa9P4KHIeRfr
         hK8i4nQ+2J/TKUvPzCUkdJvR5VME7Ntl0xHjK6Fneib7JlTKiIUb0NCJgewqGgSsU1lp
         XhDuEfv5tM+IAnjgCD9nQXCzJhlBZ6LRiLbrN0rU5nvDefi63SJlAb/wQAMPL19TD31O
         e4ZUWInEosaU/QxHiWyR4hpLxPJTNvjycMYgwxsvNuG1OP9cCqD7Iw6zPzey37dJ+hxc
         a0EsdFs5VQOlY87UthL5ef0n8sSIGgmIhNSNskv7nbOlJj4+ANTQ2yI3ZWvHGKpbszRN
         2Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248789; x=1750853589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKGxDPrsrGFp0Bze86vZksL2+DNrY5eWcc4p55uZfLg=;
        b=Eb5TqszuQl4hG+aTyR3INGxqkYedkVNt6hIYTzJhcFa5PPgdb+Jxa8C9zerkYvtVpr
         EXiQfZyMaKb6a86f2Q1ol/mdd5SkyUHSwONRVLsGxT4qjBm+9dLoQUgtpVojXMTG+WHk
         u0R1ALjZlE/thJm+DnV7drqAnpsxqC5A5a87s7SNT/DDBQJ9En93vS4Pf39nj/nE/ekB
         c/cMBDkdP7P0sxWEEo/WGJdKfsf6v/HCVbyKGN2PCwUJEtswbDufARa5LVCP0saw4oYo
         NXPFRI1PfxCEUsaFyRMfU6Hr+EkMTlvDTeGGdUSv+/1E5OdnN9m+0zCdFg/4JwSSeopM
         VHHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlk79/ajxgsEbxaL7NUzXyO7hXSYcPy859Xbm/uEY/ghyrRyU/FgWqKci4F85Fn+hWTAi2JmIfh9y/tZZeSHxP@lists.infradead.org
X-Gm-Message-State: AOJu0YzAQNpuegDeR2NIqIky9uidWSTkqHyn3nNFSvVf2MOySY1cvhBB
	S8GZG/LCJ9t4h9b+j/0RgEC/YL8PetM/hXD+FYM1u66ojZC8XugM2Z8HbtfoHzB9RbPyxw/Vp57
	fspiOQR+sYh8m81yfVcKlLM3HT4AEocpCra3kIyZHgw==
X-Gm-Gg: ASbGncumxEWigxIRZyIeqI/ZGq6lTvQMJuS0A98F8sKeUb4lturFUqRa6OURFk1ebjp
	sPCzKOHLSGrlOOmyIoekaDSi5e5noNOgvnOHpLRLHvOKUnxSMYtO/L57FRle3qTfJlgpciR1DD+
	0IBHBTqYLaytJWoUZc/O5au7WgyDgbLbYgcJshPY78Alk=
X-Google-Smtp-Source: AGHT+IGTSzjogHCi/geFRfkS1k64vxCFzHGvVMOvmRTwVeChVfJIOBt9QznhX1/YRhdAVy4BHCTh3ig3roxkOz/SlaA=
X-Received: by 2002:a17:907:fd18:b0:add:fa4e:8a7e with SMTP id
 a640c23a62f3a-adfad4104cemr1503686066b.32.1750248789286; Wed, 18 Jun 2025
 05:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250617193450.183889-1-hiagofranco@gmail.com> <20250617193450.183889-4-hiagofranco@gmail.com>
In-Reply-To: <20250617193450.183889-4-hiagofranco@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:12:31 +0200
X-Gm-Features: AX0GCFv-WhPn_WVjSMi4ptgdlE0BOC7_hZaPLP8zfqr856nDVAxKNS58yS5OlAM
Message-ID: <CAPDyKFq0EswFPF2nabJfQQ52D3Usy8AOUEH1WJWKsEhvOhO60w@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051311_430000_FCB6140F 
X-CRM114-Status: GOOD (  37.93  )
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

On Tue, 17 Jun 2025 at 21:36, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> When the remote core is started before Linux boots (e.g., by the
> bootloader), the driver currently is not able to attach because it only
> checks for cores running in different partitions. If the core was kicked
> by the bootloader, it is in the same partition as Linux and it is
> already up and running.
>
> This adds power mode verification through dev_pm_genpd_is_on(), enabling
> the driver to detect when the remote core is already running and
> properly attach to it if all the power domain devices are on.
>
> To accomplish this, we need to avoid passing any attach_data or flags to
> dev_pm_domain_attach_list(), letting the platform device become a
> consumer of the power domain provider. With that the current power state
> of the genpds will not change, allowing the detection of the remote core
> power state.
>
> We enable and sync the device runtime PM during probe to make sure the
> power domains are correctly managed when the core is controlled by the
> kernel.
>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
> v4 -> v5:
>  - pm_runtime_get_sync() removed in favor of
>    pm_runtime_resume_and_get(). Now it also checks the return value of
>    this function.
>  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
>    function.
> v3 -> v4:
>  - Changed to use the new dev_pm_genpd_is_on() function instead, as
>    suggested by Ulf. This will now get the power status of the two
>    remote cores power domains to decided if imx_rpoc needs to attach or
>    not. In order to do that, pm_runtime_enable() and
>    pm_runtime_get_sync() were introduced and pd_data was removed.
> v2 -> v3:
>  - Unchanged.
> v1 -> v2:
>  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
>    suggested.
> ---
>  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 627e57a88db2..b53083f2553e 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
>  static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  {
>         struct device *dev = priv->dev;
> -       int ret;
> -       struct dev_pm_domain_attach_data pd_data = {
> -               .pd_flags = PD_FLAG_DEV_LINK_ON,
> -       };
> +       int ret, i;
> +       bool detached = true;
>
>         /*
>          * If there is only one power-domain entry, the platform driver framework
> @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>         if (dev->pm_domain)
>                 return 0;
>
> -       ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> +       ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> +       /*
> +        * If all the power domain devices are already turned on, the remote
> +        * core is already up when the kernel booted (e.g. kicked by the
> +        * bootloader). In this case attach to it.
> +        */
> +       for (i = 0; i < ret; i++) {
> +               if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> +                       detached = false;
> +                       break;
> +               }
> +       }
> +
> +       if (detached)
> +               priv->rproc->state = RPROC_DETACHED;
> +
>         return ret < 0 ? ret : 0;
>  }
>
> @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
>                 }
>         }
>
> +       if (dcfg->method == IMX_RPROC_SCU_API) {
> +               pm_runtime_enable(dev);
> +               ret = pm_runtime_resume_and_get(dev);
> +               if (ret) {
> +                       dev_err(dev, "pm_runtime get failed: %d\n", ret);
> +                       goto err_put_clk;
> +               }
> +       }
> +
>         ret = rproc_add(rproc);
>         if (ret) {
>                 dev_err(dev, "rproc_add failed\n");
> @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
>         struct rproc *rproc = platform_get_drvdata(pdev);
>         struct imx_rproc *priv = rproc->priv;
>
> +       if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> +               pm_runtime_disable(priv->dev);
> +               pm_runtime_put(priv->dev);
> +       }
>         clk_disable_unprepare(priv->clk);
>         rproc_del(rproc);
>         imx_rproc_put_scu(rproc);
> --
> 2.39.5
>

