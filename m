Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722B3C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jxeF6qQ15W3iRJfD8FVALOVDq0XQ6sXFz3PZD+HrmQ=; b=JbRCKmTbw0ITSrJ4mL2nHXA0MU
	Zg26AxQDPJmPKU04PH9OFllFOcO40YxVbUJRHrRxrs8WmkQfSQ28dQ3FSNxSB9yKdPWRL4D9XTP0P
	oZfO3EJzxACa07vtoGiFvYu/fTbMaRF1gyenYE9t7JjL7HbpfHpJ7xhvCQW3H2RIboJIHO29NDZSO
	1JbNmdd6rsbCA5Aq5eWd/ROy0iKCFx1LhX6NK3Lw2MZjYWcUVCu0AzdAeZPWiJLO+OlGg4TBPtSIG
	vdM2ZWnhl9PZS+aK7lU3FFKB+21GtOr21ludHGOeoD4HSBFVTAXT+K2ZLqvkgxZBIs0IYiBay0r6C
	zG7nxViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXFM-00000009Fn5-0miW;
	Wed, 09 Jul 2025 16:02:12 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVNy-00000008tRh-0o1l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:02:59 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-70e4043c5b7so49890217b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752069777; x=1752674577; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0jxeF6qQ15W3iRJfD8FVALOVDq0XQ6sXFz3PZD+HrmQ=;
        b=B5nJPS9CqTS80S6kJIB6ZGYf1hdQTGkvRRWHx7PkRB+NnxIaoCkYJxjE9WA1sF7CkW
         Uah1hHgAB7M3xYDYh/P3eMJrZLzqrOH369959lg5fC47F9krYeQtUYy9D4vJSwCusUf6
         OM90cMiDLBe+xgtnTAddmTKYmBgYAhLdy1tt7oWn2qVH8b8GmgZAg/B5RYvjgQ/yQOdk
         Lq3UWmF30BfSVTHqXmh+0xjQ/1fibB4IZXHqt/gPzSjPN1uf9Fs/N93m8pLP3FeWwaG0
         RWWUcDsqNpyfnoTl2qhsjda8FQHosdYHTgro8ZAvTVaT8PU3EbJnHk6TDK5nCBA5Avrp
         aw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752069777; x=1752674577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jxeF6qQ15W3iRJfD8FVALOVDq0XQ6sXFz3PZD+HrmQ=;
        b=lc39NVAiTEXr3rLOAi58VSmL4MCQUJOEbcpGEo+Q2izwGl7k7H9WHDdkrWA6aBmu84
         HQRsnkubC2cz253+/fYqMPODUd+YkRiucObkiRbkYey2XI/0IIDWwOdMBSdfhV3HEKLk
         9OvYOYuJeyFCSy3c334EIzl2JxePHfH+I8DTOcw9vvky14ZhU9DYusK8RTZ+XMdrv7zb
         JKv7RKqIctAhAaagcbFefDD65l8p7oLqviKvLjQ/gEybiJD9k3lOqAUNJyh9jJZUCzmt
         1X+QtJEnkhaUpHLAXl6S+vRC2zVW6eJprBQumPCEa7sswbhbjOuuVCBJiFy//Cwd8kzO
         7gKg==
X-Forwarded-Encrypted: i=1; AJvYcCVMIG1DicWPe9FH3kuuWzk8Fl9ZhJWn8Xa68hJvIPa3QvvQdma5QuM71/eOq68j6m7Gx66U/q+KO3kP/GXBPpGI@lists.infradead.org
X-Gm-Message-State: AOJu0YzHw9r4QWNTErQ6QWVHGE9Me/5NxIMv3erg0azcyv4LKoDkxgns
	R+bYUcvwgYkXUy9fS3Al6/3OvnWDJ5q7G94OnDiVDEE+ZI5uLrF9tnA0eNkuiiLRpfgiRETWZI+
	x3pFWOQN3iYPXWWiWcYLtaRwNZMB2PX1UZpYTuC1bbw==
X-Gm-Gg: ASbGnctRzZurWkAQ+o4dnXoEFYi7fUGlTNrgHOPE0FUsVgHbF2KCzOvjG6JeLoor6UG
	O7tbbo5faACFqOOnQ1+iOE2L86I7Bl8ZpeUqsWhvyyDiYfIufIqpAFHZWssiKDv2xFh7bmtSwu3
	cJPbO/+UPYDUP65OHuzSJ8jg7GVg3y+gkniYFrF9uYaqQ9
X-Google-Smtp-Source: AGHT+IFtWA8c7PWFxCFRls9OTwmIX50KvZ84tz29XCIMOswJWdVGY+cHCZiaI7O65CCj8j+BQ/aRqyiXkvmlO0NA56I=
X-Received: by 2002:a05:690c:9c09:b0:70e:2d17:84b5 with SMTP id
 00721157ae682-717b13bf817mr39839927b3.0.1752069776636; Wed, 09 Jul 2025
 07:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075434.3220506-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075434.3220506-1-sakari.ailus@linux.intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Jul 2025 16:02:20 +0200
X-Gm-Features: Ac12FXwuMSAHr6sQzvdlqPxk0AdX5s1c2M_fF3m8uP0HMwMi2plFNm-Wc6CWOgg
Message-ID: <CAPDyKFp+aBO9XTmvBYGj4bcL9BW26LCZb9O=6nstj29zctHi6A@mail.gmail.com>
Subject: Re: [PATCH 44/80] mmc: Remove redundant pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Russell King <linux@armlinux.org.uk>, Adrian Hunter <adrian.hunter@intel.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Avri Altman <avri.altman@sandisk.com>, 
	Victor Shih <victor.shih@genesyslogic.com.tw>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	imx@lists.linux.dev, s32@nxp.com, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_070258_237186_5630486B 
X-CRM114-Status: GOOD (  22.78  )
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

On Fri, 4 Jul 2025 at 09:54, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I have pulled in pm-runtime-6.17-rc1 and applied the $subject patch
for next, thanks!

Kind regards
Uffe


> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
>
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
>
>  drivers/mmc/core/core.c            | 1 -
>  drivers/mmc/host/atmel-mci.c       | 2 --
>  drivers/mmc/host/mmci.c            | 1 -
>  drivers/mmc/host/omap_hsmmc.c      | 3 ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 1 -
>  drivers/mmc/host/sdhci-msm.c       | 1 -
>  drivers/mmc/host/sdhci-omap.c      | 2 --
>  drivers/mmc/host/sdhci-pxav3.c     | 2 --
>  drivers/mmc/host/sdhci-sprd.c      | 1 -
>  drivers/mmc/host/sdhci_am654.c     | 1 -
>  drivers/mmc/host/tmio_mmc_core.c   | 1 -
>  11 files changed, 16 deletions(-)
>
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index a0e2dce70434..874c6fe92855 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -882,7 +882,6 @@ void mmc_put_card(struct mmc_card *card, struct mmc_ctx *ctx)
>         WARN_ON(ctx && host->claimer != ctx);
>
>         mmc_release_host(host);
> -       pm_runtime_mark_last_busy(&card->dev);
>         pm_runtime_put_autosuspend(&card->dev);
>  }
>  EXPORT_SYMBOL(mmc_put_card);
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index c885c04e938a..43f92f48590f 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -541,7 +541,6 @@ static int atmci_regs_show(struct seq_file *s, void *v)
>         memcpy_fromio(buf, host->regs, ATMCI_REGS_SIZE);
>         spin_unlock_bh(&host->lock);
>
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         seq_printf(s, "MR:\t0x%08x%s%s ",
> @@ -2567,7 +2566,6 @@ static int atmci_probe(struct platform_device *pdev)
>         dev_info(dev, "Atmel MCI controller at 0x%08lx irq %d, %u slots\n",
>                  host->mapbase, irq, nr_slots);
>
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return 0;
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index c70c64f8adc4..8367283647a9 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -2082,7 +2082,6 @@ static void mmci_enable_sdio_irq(struct mmc_host *mmc, int enable)
>         spin_unlock_irqrestore(&host->lock, flags);
>
>         if (!enable) {
> -               pm_runtime_mark_last_busy(mmc_dev(mmc));
>                 pm_runtime_put_autosuspend(mmc_dev(mmc));
>         }
>  }
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
> index bf3b9f5b067c..adc0d0b6ae37 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -1663,7 +1663,6 @@ static int mmc_regs_show(struct seq_file *s, void *data)
>         seq_printf(s, "CAPA:\t\t0x%08x\n",
>                         OMAP_HSMMC_READ(host->base, CAPA));
>
> -       pm_runtime_mark_last_busy(host->dev);
>         pm_runtime_put_autosuspend(host->dev);
>
>         return 0;
> @@ -1954,7 +1953,6 @@ static int omap_hsmmc_probe(struct platform_device *pdev)
>         }
>
>         omap_hsmmc_debugfs(mmc);
> -       pm_runtime_mark_last_busy(host->dev);
>         pm_runtime_put_autosuspend(host->dev);
>
>         return 0;
> @@ -2031,7 +2029,6 @@ static int omap_hsmmc_resume(struct device *dev)
>         if (!(host->mmc->pm_flags & MMC_PM_KEEP_POWER))
>                 omap_hsmmc_conf_bus_power(host);
>
> -       pm_runtime_mark_last_busy(host->dev);
>         pm_runtime_put_autosuspend(host->dev);
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 64c27349d79f..a040c0896a7b 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2108,7 +2108,6 @@ static int sdhci_esdhc_resume(struct device *dev)
>             esdhc_is_usdhc(imx_data))
>                 sdhc_esdhc_tuning_restore(host);
>
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return ret;
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 732b65d4b61a..68e56251d5e8 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2750,7 +2750,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         if (ret)
>                 goto pm_runtime_disable;
>
> -       pm_runtime_mark_last_busy(&pdev->dev);
>         pm_runtime_put_autosuspend(&pdev->dev);
>
>         return 0;
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> index 429d8a517fb6..cdb09605e009 100644
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -1370,7 +1370,6 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>                 host->mmc->pm_caps |= MMC_PM_KEEP_POWER | MMC_PM_WAKE_SDIO_IRQ;
>         }
>
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return 0;
> @@ -1379,7 +1378,6 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>         sdhci_cleanup_host(host);
>
>  err_rpm_put:
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>  err_rpm_disable:
>         pm_runtime_dont_use_autosuspend(dev);
> diff --git a/drivers/mmc/host/sdhci-pxav3.c b/drivers/mmc/host/sdhci-pxav3.c
> index 34abf986573f..1371960e34eb 100644
> --- a/drivers/mmc/host/sdhci-pxav3.c
> +++ b/drivers/mmc/host/sdhci-pxav3.c
> @@ -494,7 +494,6 @@ static int sdhci_pxav3_suspend(struct device *dev)
>         if (host->tuning_mode != SDHCI_TUNING_MODE_3)
>                 mmc_retune_needed(host->mmc);
>         ret = sdhci_suspend_host(host);
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return ret;
> @@ -507,7 +506,6 @@ static int sdhci_pxav3_resume(struct device *dev)
>
>         pm_runtime_get_sync(dev);
>         ret = sdhci_resume_host(host);
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return ret;
> diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
> index a5dec1a0e934..fe2fe52b23b2 100644
> --- a/drivers/mmc/host/sdhci-sprd.c
> +++ b/drivers/mmc/host/sdhci-sprd.c
> @@ -863,7 +863,6 @@ static int sdhci_sprd_probe(struct platform_device *pdev)
>         if (ret)
>                 goto err_cleanup_host;
>
> -       pm_runtime_mark_last_busy(&pdev->dev);
>         pm_runtime_put_autosuspend(&pdev->dev);
>
>         return 0;
> diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
> index ea14d56558c4..e2c4a0049d61 100644
> --- a/drivers/mmc/host/sdhci_am654.c
> +++ b/drivers/mmc/host/sdhci_am654.c
> @@ -986,7 +986,6 @@ static int sdhci_am654_probe(struct platform_device *pdev)
>         /* Setting up autosuspend */
>         pm_runtime_set_autosuspend_delay(dev, SDHCI_AM654_AUTOSUSPEND_DELAY);
>         pm_runtime_use_autosuspend(dev);
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>         return 0;
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 2cec463b5e00..21c2f9095bac 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -160,7 +160,6 @@ static void tmio_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
>                 sd_ctrl_write16(host, CTL_SDIO_IRQ_MASK, host->sdio_irq_mask);
>
>                 host->sdio_irq_enabled = false;
> -               pm_runtime_mark_last_busy(mmc_dev(mmc));
>                 pm_runtime_put_autosuspend(mmc_dev(mmc));
>         }
>  }
> --
> 2.39.5
>

