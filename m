Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95937C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eL4ot+dqM/gHvOleLPQUu1Tr2WKMQ0Kb3pxoJXxeucY=; b=iuKaVSBV2n34mTkLhrQ5N/Foaa
	g32Cp/e0q87wuqp3RRJGwZVbtBxlvmENHu45NXqsvTdY6eaUwfZNzZupRmqO5avV9y2q/GJKqQpi6
	yYNP9TWRlKfYaG+xIQikKymQiIdZKyGhXUy7gffJSeHlcB3Q9C40ssyidfk764tEn/Op5U0dbDJUd
	a7OYNIUE4SapxDMTMh8zrLkvQaLZsblu3wavs1mDvLroocz996pEHIfAh+aKikRV00nUPZoULlRra
	1ca5A+BbOP+SLdfAjlUyQop24U8+siPcZq32rvlug31NFyh+oLOi2P4JaD9kd7OpafmT527yAIAqd
	oN8PUa1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucitL-0000000COKL-0JDQ;
	Fri, 18 Jul 2025 11:04:39 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciaR-0000000CKoz-1l79
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 10:45:08 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-7183d264e55so19778897b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 03:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752835506; x=1753440306; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eL4ot+dqM/gHvOleLPQUu1Tr2WKMQ0Kb3pxoJXxeucY=;
        b=TOfex5m/fNwtO2SioeDgqOSiWziNaRuacFGI2R0QJZlLw0LqxMjRcEZV6DLdi82xZn
         Z3ZL0kekpW5vCJg4FDECBCucWYF1TC7HRChQj1WjD/Wt5W4AX5Qz6pRM/nR/Vl5GG1kT
         kocc6/yR3ZCQgioZ2tgBud7hIMYXdX7xQIA66TcTcFyX+az629m7FXoOwxxw/rgya02c
         1ufflF+ztIuVPnlpjyFQ8M9zoiOGv6HemlduhtMxo2kcjdAgKwUwLUv2DO3cgdc7+gpf
         yJDcERqImiHFmjeWETJt1Y+t9PEjzzMTantEHtMmVgpg9q5HWLhFLBbut0PbtdCZAV7/
         mMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752835506; x=1753440306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eL4ot+dqM/gHvOleLPQUu1Tr2WKMQ0Kb3pxoJXxeucY=;
        b=Wm6EuiFMKPYq3DmMa8kgbGvTaW+cf+aq8r2iI9Ll/3Prb4jfP6WrijdlqJ4jlB38nB
         zFQtKdta9cMAFaaQvMeo+vIVFaE3siZh/+Bl0iF9j2yUL9joAvAa6rwK9BFMx/wFb33D
         iqu8imzA5Ghnyl5e18E4BxH0NtC45JiWlO65XDCAs1eAuVr0mxD42Ej7x9IS4TxMAdfp
         KDtsKj/WT+3J+FVRGSs39zl/iTG1F4+3GAS/PH53gndToXHNtFWDenJBTiALYV8pAftr
         SRVLD9f8csaNpz2V3hcP1ujsS0V5cpbTwtuy4PAO4zFWAOSm8+nGez9A9g1hcjY0oHQx
         m/dw==
X-Forwarded-Encrypted: i=1; AJvYcCUVzv5Tb0dz30GlvAgS/RMr+p0bflou0IyKx59bQJC895WdGQN5AYqLkw1BGSStU6R+tDnjfz8VnamJVh66JOgI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+YeotzpSiFMjlEeUFV8c+giFG2oQOHYzZE5Hx5v6TAIz4eFkw
	9AaLf4Q6eNk6kyc8AGPLpBWpoM+cRQVKkqRb7deV1JBaNVPhTitcMfz8n3Lbz9xi8ER6VtCbjX6
	g0jLHZP2hMbIdodzv8jwCZ73kSQHxSAa5B0rdyelpWA==
X-Gm-Gg: ASbGnctbXxI70jUBsQYhYZIZG674+EgeWLi4ipAay7jYOM8tWXuzc2Mbic2mP4FvX9i
	VnfP+9UngWlKb96hguo6ODPPL8lb7rK62JegumcpfGhTp7PgxHiBkhNWxHaRnBhdEqjWIkTs5RS
	TyJOmZVd40wR0NhkkpYlglArFqSiriqtDIlDi0YECn+zPXDzUcI/ve8bYi38bHnb8P4C09pgiXR
	OHCRtBK
X-Google-Smtp-Source: AGHT+IFQ1mnk1ZgI1gkcyMhNGTwcwNL/MUejQfWzddIamhebdceSEWNxbqRvh2fYEhcrWIWkwSIrRt9TLlwJqykznrc=
X-Received: by 2002:a05:690c:25c3:b0:70e:7706:824e with SMTP id
 00721157ae682-718a332563dmr82661557b3.6.1752835505656; Fri, 18 Jul 2025
 03:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250716194638.113115-1-hiagofranco@gmail.com>
In-Reply-To: <20250716194638.113115-1-hiagofranco@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 18 Jul 2025 12:44:28 +0200
X-Gm-Features: Ac12FXz3wdFyhRFKPg_XEl0cRf6bRNkkouJRpcUk47StJD9WCjNNZdufcqO3Rys
Message-ID: <CAPDyKFqWkWSahkGkap8SUiuYvmtk_b4OgN-bSyB-H519wf=eBw@mail.gmail.com>
Subject: Re: [PATCH v8] remoteproc: imx_rproc: detect and attach to pre-booted
 remote cores
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Hiago De Franco <hiago.franco@toradex.com>, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_034507_473371_D6F8684F 
X-CRM114-Status: GOOD (  47.51  )
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

On Wed, 16 Jul 2025 at 21:47, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> When the Cortex-M remote core is started and already running before
> Linux boots (typically by the Cortex-A bootloader using a command like
> bootaux), the current driver is unable to attach to it. This is because
> the driver only checks for remote cores running in different SCU
> partitions. However in this case, the M-core is in the same partition as
> Linux and is already powered up and running by the bootloader.
>
> This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> M-core's power domains are already on. If all power domain devices are
> on, the driver assumes the M-core is running and proceed to attach to
> it.
>
> To accomplish this, we need to avoid passing any attach_data or flags to
> dev_pm_domain_attach_list(), allowing the platform device become a
> consumer of the power domain provider without changing its current
> state.
>
> During probe, also enable and sync the device runtime PM to make sure
> the power domains are correctly managed when the core is controlled by
> the kernel.
>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
> Hi Mathieu, Ulf,
>
> This is the v8 of patch3 from the patch series:
> https://lore.kernel.org/all/20250629172512.14857-1-hiagofranco@gmail.com/
>
> As patches 1 and 2 are already applied on Ulf's next branch, as
> requested I am sending now only the v8 of patch 3.
>
> I made a small correction into the commit description, s/SCFW
> partitions/SCU partitions/g and updated with the check for the return
> value.
>
> I hope this is ok.
>
> Thanks!
>
> Hiago.
>
> v7 -> v8:
>     - Added return error check for dev_pm_domain_attach_list().
>     - Commit description: changed to use "SCU partitions" instead of
>       "SCFW partitions". This is more accurate since these are hardware
>       enforced partitions.
> v6 -> v7:
>  - Added Peng reviewed-by.
> v5 -> v6:
>  - Commit description improved, as suggested. Added Ulf Hansson reviewed
>    by. Comment on imx-rproc.c improved.
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
> ---
>  drivers/remoteproc/imx_rproc.c | 41 +++++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 627e57a88db2..a6eef0080ca9 100644
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
> @@ -902,8 +901,25 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>         if (dev->pm_domain)
>                 return 0;
>
> -       ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> -       return ret < 0 ? ret : 0;
> +       ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> +       if (ret < 0)
> +               return ret;
> +       /*
> +        * If all the power domain devices are already turned on, the remote
> +        * core is already powered up and running when the kernel booted (e.g.,
> +        * started by U-Boot's bootaux command). In this case attach to it.
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
> +       return 0;
>  }
>
>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
> @@ -1146,6 +1162,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
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
> @@ -1171,6 +1196,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
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

