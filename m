Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC639EC1E9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRs6tGXQrB9J2BI16cCWeV+WhaT3GC747fgM7MhPTRQ=; b=UGTIpX8x0xLFhzk+y8uVAgG8z8
	nXXv6a53polYM6mE1ruVQ5DGZgaBIG/A1qZQwUujqnDD/KRlNsiPfgkLJiMe9/JTD4z2hbTeWM6+2
	qVmSvMpfYEIUiRQDz9JYpXX7xEpvTN1yFs8OAPwhjIZk/531r0nNAVvZHC2N7z9vYz17VONy6f7bD
	NCtEFfxZjC/MPpSw0Vvyj3o9/KD+2oFD/5l51aDZhtImQ06YPc+EqokEPVQnHveMqF1zaeeJeqdrY
	vfVJ1VvfPlILyChTNbYkltc77vCFpueEQARF+Sq7zgQgarT1vZ+tkJreqLsGxYjT5QArM/uDmxZdy
	IsM0STPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnx2h-00000009o4f-40Og;
	Thu, 05 Feb 2026 10:56:59 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnx2f-00000009o47-1QQl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 10:56:58 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59b77f2e43aso2174583e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 02:56:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770289015; cv=none;
        d=google.com; s=arc-20240605;
        b=hWtJJdrL2OKr8Uss6R4uroM9ww5mTDahYKTq6YGkJeAzYSoHTaVC9ECL1oeZNgeXVt
         bqL98GpEllhLlLO8vXjN96HEzGQ5eQnD0njzE1nzxspeHBYEX5Mnn4ccRnPcsnSTWoaL
         c56W9ulKBia4ye27kI2Csl4kzQKALAEzZiYx8NJ7nRlSQ32dPm67lxs7lU9L4OfET0Su
         irhlJcu5A2VqfFidhMQW4h1eHeNGh8HoDXlCQId7pQ3UKefBDJkN3S2qAyG59/EwzH7V
         3L1TKtgibJBW4tg1Lx7+BeP6jDqCccsqYIlMMq7m2kcWmB1sHC23+onNofuf73K34zIR
         uZYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QRs6tGXQrB9J2BI16cCWeV+WhaT3GC747fgM7MhPTRQ=;
        fh=WJJ0S7nqEavUYTtevs6idakgnEt70wJNUTcGLx1enT8=;
        b=EIownN65ta53JptYInMDRU1Edh86NWtdpAewokhXD/EWP8VAN26nlux2BP1MGeoD5z
         CncKtDTAog+S1dh9rNds2fsl1+zglyCp5y1HxHJzv8FzEJtc+q/eu3fn5elx+IxvM6jB
         KRhqJ7apXGsAdvFTbSMECYkn2/G5L3uGthCSmPiTFXSek2lcz+JcDITaU6e6nMwZR78K
         +l90V9sgoL7sobXKuDyPkU3IZE3lnWTmaaR90HztAxt5Xf0B0vz+f/ocbtYwfosSSBQB
         sTwcy7EuSvsrpGRpbwmvaOJOU9m++8TUJC7qomFG/STkUxTyZ8pkfqzCX5ziO9rWgZlL
         SSQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770289015; x=1770893815; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QRs6tGXQrB9J2BI16cCWeV+WhaT3GC747fgM7MhPTRQ=;
        b=xsiBbrZecYAvHhiRsTmm2GB46oqFYgHyxfTHl2Q0qFNvBQl/2G/c7+QFzyDro+UqV5
         FYHwIBogBGODhWXJZANYLv+9wAoFW0bWgd7ysoPl2g3wec1tr1ib9nsAuFQo7D2JvnxG
         jiYpi8H9obA4XtEfkTRhfY49UhgsLR+Dzb5WbnbibXJGR5G7EGSHT3elX9RC41Q2xLJg
         lHW1wGN5wEIGqJGEyIg7H9JveCZNHrSiYl08LTga/ehxUCZvAvLHXaGxBKIquCiXkjtW
         NU49xk5UcPc//mL/OT81q+zqoB+ljhHiAhQDKD46AVIV+PUWJlGavJLIYI+fnmcPcgzJ
         iBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770289015; x=1770893815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRs6tGXQrB9J2BI16cCWeV+WhaT3GC747fgM7MhPTRQ=;
        b=m4oHFKNyi3Qq9lErLDEBHh8/I0VY2RDRWC+neriHu9NvqXz0vlWrXBmUG5eUy/pbdI
         Ou9hbKIO2Ptyuh0M1xWfQADprIpWM2gwg+bWp/PQHFoMhhK/igV8OGA0dlLrZoiLCqeD
         VRn6Tc9ku3B3KFGH7J/Xy1hwDMZpaALc5FUzKZh7wKrUsO9EI9A+4kDApjgMh5dCIDjo
         fDr24JtM5Bi5r1c6ssINkai5j7soL2Nux1o7zQjs5XOTIbeS7zlTGcWSqs7ph8c4zGpa
         1ve+Qd+//Hd/bUPKO+nyTHldXJRbQgzW577u7jp479ZwHAtuaWTFSYxoo37SnWSZwbT9
         Tf5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHtm4UJDwoRGzJhtm0L+tZ0Jj94Aciay2ATknu2IZFPJaRmb+ewepmjkT+35yBqx0BposXBaWKAWn5Qcu++6hn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4wHI9V/3o5a6C2gQXqEqblmKldpZiP1FRxNQBqZ+TI6HIHMr8
	pqUfCG0CDKj8H/PnzmF/0sIgwlOGcU/m2GrfJfVyeUIjd1WvaGiZNsAJnk2oZit5UlFepFtqvvb
	lRypNDZMXyQrF/NTNKH4nWnf8JUce60Osz7lRpwSu0A==
X-Gm-Gg: AZuq6aICeYGHD+xnJPazeAyZL+aE5eu+Ke5CLV2s/7CX/e9VclYtWnIJOWQAMHX0mas
	g80y0Oazq/gcXdZGWiBr4te6hFwcZAIQXE0oDKepe05z8Itam3LLgyu6E+EWQ3M6zDj2Jx6U9Ew
	IaezUNzjRtzggfYV8pFslApdLtcA2ECiR5hOsaj3bwFSeCBkK8SPoNgzEdC1XKa9H1hdqd0bd6G
	2lt4K6llMzk11ujtDsUkoj+wkBP8RxN9GmofW1noE5iR+d2LWxbgPeFDjpLrOqAYVbo2LKDDrZZ
	KvkRg1o=
X-Received: by 2002:a05:6512:3b97:b0:59e:34d7:71de with SMTP id
 2adb3069b0e04-59e3c7aebcbmr907332e87.3.1770289014684; Thu, 05 Feb 2026
 02:56:54 -0800 (PST)
MIME-Version: 1.0
References: <20260204111142.2147646-1-xu.yang_2@nxp.com>
In-Reply-To: <20260204111142.2147646-1-xu.yang_2@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Feb 2026 11:56:17 +0100
X-Gm-Features: AZwV_QghMMjFzpm5iyBrMMXiBy65oxzfHB7MKyQxNEi6CPDg3zrNZG9JA-o8bxM
Message-ID: <CAPDyKFqocghs2ucVpAz=9vErxSpCO=54RBdQg3ttoqf9t=-tYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pmdomain: imx8mp-blk-ctrl: keep gpc power domain
 on if blk-ctrl pd is on during system pm
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, peng.fan@nxp.com, jun.li@nxp.com, 
	rafael.j.wysocki@intel.com, a.fatoum@pengutronix.de, ping.bai@nxp.com, 
	shawnguo@kernel.org, l.stach@pengutronix.de, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_025657_416033_E9897319 
X-CRM114-Status: GOOD (  30.74  )
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

On Wed, 4 Feb 2026 at 12:10, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Current design will power off all dependent GPC power domains in
> imx8mp_blk_ctrl_suspend(), even though the user device has enabled
> wakeup capability. The result is that wakeup function never works
> for such device.
>
> An example will be USB wakeup on i.MX8MP. PHY device '382f0040.usb-phy'
> is attached to power domain 'hsioblk-usb-phy2' which is spawned by hsio
> block control. A virtual power domain device 'genpd:3:32f10000.blk-ctrl'
> is created to build connection with 'hsioblk-usb-phy2' and it depends on
> GPC power domain 'usb-otg2'. If device '382f0040.usb-phy' enable wakeup,
> only power domain 'hsioblk-usb-phy2' keeps on during system suspend,
> power domain 'usb-otg2' is off all the time. So the wakeup event can't
> happen.
>
> In order to further establish a connection between the power domains
> related to GPC and block control during system pm, register a notifier
> to power_dev, so that GPC power domain will know that block control power
> domain is on and will not power off itself.
>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
> Cc: stable@kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied for fixes and by amending the commit message a little bit to
make it clearer, thanks!

Kind regards
Uffe


>
> ---
> Changes in v2:
>  - add notifier to support wakeup needs
> ---
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> index 34576be606e3..56bbfee8668d 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -65,6 +65,7 @@ struct imx8mp_blk_ctrl_domain {
>         struct icc_bulk_data paths[DOMAIN_MAX_PATHS];
>         struct device *power_dev;
>         struct imx8mp_blk_ctrl *bc;
> +       struct notifier_block power_nb;
>         int num_paths;
>         int id;
>  };
> @@ -594,6 +595,20 @@ static int imx8mp_blk_ctrl_power_off(struct generic_pm_domain *genpd)
>         return 0;
>  }
>
> +static int imx8mp_blk_ctrl_gpc_notifier(struct notifier_block *nb,
> +                                       unsigned long action, void *data)
> +{
> +       struct imx8mp_blk_ctrl_domain *domain =
> +                       container_of(nb, struct imx8mp_blk_ctrl_domain, power_nb);
> +
> +       if (action == GENPD_NOTIFY_PRE_OFF) {
> +               if (domain->genpd.status == GENPD_STATE_ON)
> +                       return NOTIFY_BAD;
> +       }
> +
> +       return NOTIFY_OK;
> +}
> +
>  static struct lock_class_key blk_ctrl_genpd_lock_class;
>
>  static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
> @@ -698,6 +713,14 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
>                         goto cleanup_pds;
>                 }
>
> +               domain->power_nb.notifier_call = imx8mp_blk_ctrl_gpc_notifier;
> +               ret = dev_pm_genpd_add_notifier(domain->power_dev, &domain->power_nb);
> +               if (ret) {
> +                       dev_err_probe(dev, ret, "failed to add power notifier\n");
> +                       dev_pm_domain_detach(domain->power_dev, true);
> +                       goto cleanup_pds;
> +               }
> +
>                 domain->genpd.name = data->name;
>                 domain->genpd.power_on = imx8mp_blk_ctrl_power_on;
>                 domain->genpd.power_off = imx8mp_blk_ctrl_power_off;
> @@ -707,6 +730,7 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
>                 ret = pm_genpd_init(&domain->genpd, NULL, true);
>                 if (ret) {
>                         dev_err_probe(dev, ret, "failed to init power domain\n");
> +                       dev_pm_genpd_remove_notifier(domain->power_dev);
>                         dev_pm_domain_detach(domain->power_dev, true);
>                         goto cleanup_pds;
>                 }
> @@ -755,6 +779,7 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
>  cleanup_pds:
>         for (i--; i >= 0; i--) {
>                 pm_genpd_remove(&bc->domains[i].genpd);
> +               dev_pm_genpd_remove_notifier(bc->domains[i].power_dev);
>                 dev_pm_domain_detach(bc->domains[i].power_dev, true);
>         }
>
> @@ -774,6 +799,7 @@ static void imx8mp_blk_ctrl_remove(struct platform_device *pdev)
>                 struct imx8mp_blk_ctrl_domain *domain = &bc->domains[i];
>
>                 pm_genpd_remove(&domain->genpd);
> +               dev_pm_genpd_remove_notifier(domain->power_dev);
>                 dev_pm_domain_detach(domain->power_dev, true);
>         }
>
> --
> 2.34.1
>

