Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE414C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JG77WgKR93x/LtBVjZqNlrO3c6x5SGKIjmb1nd9PqZU=; b=z2OmwbiCteH/AGrplDcCFuChPE
	YERIR1KAVBjEKXSX7uxY3/SXgOFfbXUSMYjJjkVtBZi5biP8gvL430ssLwpoPX9bgValcxr2ma/hz
	Ii5SRZk0FbUsc7/QE5vomhbfT56BqSt3L6CSjgE/1dU2vUOKJJhdqqG/0lN0pIa8dHS+9CUeqZSZo
	1psTOysiX9YGayto9qdcoSoVQu3Q+PFfqR2GJ61zG8dUhQbXN/3e08DWGO26bds9ODHRtzK5THAbq
	LpQ9U4A/j2tg0XFhN0xmKX4J7Mp1yKyBgAPxhhOqwdXOza65X0pnjJcOdwUbQOoZURYq5+Dgq4O28
	r799n2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdTR-00000004NrH-2LTQ;
	Mon, 09 Jun 2025 14:27:41 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdRE-00000004NU0-2QCE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:25:25 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e81cf6103a6so1166776276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479123; x=1750083923; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JG77WgKR93x/LtBVjZqNlrO3c6x5SGKIjmb1nd9PqZU=;
        b=XWQ3N7g++OYE3X9UbE+PbejOEd4f5TtZjOoA+2kqjYqe8FV5MZOXLwya6lwSu0HjxO
         qHSUmNEqRvLqK1BXIwqpGNMN/r4Dw+AR34d4rnmZgo3xwnJVGPfxAfgQVMK2ZXwFO5oG
         CU+KHxSN1Q4BM8ZJAH1DY0jCXYV6mRz+QvLig4WRIo+qHkl9UwbUiLUTnvQEQzWUwYs3
         5hO5yaFn8PremPep+vOjjzBKcwkrbJKIdxObucSSUeD3tJosGrRQTa1t7X0kKqH6A6uX
         9ztM9ZAi0DgbWzbEqV8H46VedQVjhyDh2FXcRRLTASSJw7+mYZmEQCtL7Zytdwy556Ow
         5+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479123; x=1750083923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JG77WgKR93x/LtBVjZqNlrO3c6x5SGKIjmb1nd9PqZU=;
        b=TgtI2DSRysNGxBVfn9DoBv57zv0kU0A72/SQ99YJ7b2b7/+XUh50QJXPOP1vzNXGc7
         qqVhXeEprA81Vx0GaDVOKZ9c/0q5K0FhMqWwyI5F8MLXQ/LcoqVB7w7fJ/QT8zYN4MS1
         9Yrls+cD6djuSwSbXiO+UAgVxo3sRl8LVQ3mzmv6C2qufkfl/Hg/W+i3ZSJ/paarIruB
         ZMPIM/vioSVX2UGC/w1sp6DL4o6Tqs14Hy2ppsi/8xOffpnPPPQInyOZ9ACiS760Z7U1
         6lYNqXY8vVzYEtJ5WFmMbMiMlfqY4Agrzy7cAQKgXFxI3ayL63Ni4bOP1Jgvymj6Sme5
         m3Bw==
X-Forwarded-Encrypted: i=1; AJvYcCW5zUBdhFR5Wq6lJ540MR9iEpaM1cmnmLMTn45aYvRVxsJwFov5MP9YKJtAkcShGWTNY3HvCLhXy//agl88+eW/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1mosNsTD/OmkLYBbc8OS3hUb8bRB/tCQV7xIMzUNCR8AKR+Bf
	vgbuaG1SvwOOroq4yoNswW43CoTboiDUjelUXwMi4+QXsjQFUrnUT57wTH1MZt2e5tQzRvd3FJc
	yeSa+PsznNj26pN6McNplzEwKZIvm0YAbl2Ft2kbokw==
X-Gm-Gg: ASbGncu1ZNhwWeT2vJbRkHWZydhuW1sbZykqq0OoN80enJPmg93uJOzQBvxYsN7G2Ka
	xD6FFesxPhFdyfaC1GxAYDxL+QxRyWjOmBDouPfGZYgdxesUbPGzhAA9XBQC8q5UgjA10NiEZY/
	OEoWCW5F5fpxtdHIecrFfXIP2MwPIfy+ftOihLJXhBWzD3
X-Google-Smtp-Source: AGHT+IHLNEnuAme9eHASfWL8QqGkVGxEwvncLnTk7Ne6+v13yqzaemTTYFnukN2K2Zr05hKAsZjb76xfzqBgFfZg0J4=
X-Received: by 2002:a05:6902:690c:b0:e81:d3db:9e53 with SMTP id
 3f1490d57ef6-e81d3db9eb3mr5064016276.32.1749479123336; Mon, 09 Jun 2025
 07:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250521033134.112671-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20250521033134.112671-1-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:24:47 +0200
X-Gm-Features: AX0GCFsxQzRzF0fm7fx2jH_zKPRXvTdReaWYtTKHfDZG8Ytl7CNAKn6UVwNB5jk
Message-ID: <CAPDyKFogKcwssmQXSDQ+WFBP5iPMOHaK9RSAmRtn89MUnTJb=w@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: do not change pinctrl state in
 suspend if function irq is wakeup source
To: ziniu.wang_1@nxp.com
Cc: haibo.chen@nxp.com, adrian.hunter@intel.com, linux-mmc@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Frank Li <frank.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_072524_619043_F889A4D0 
X-CRM114-Status: GOOD (  25.36  )
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

+ Frank

On Wed, 21 May 2025 at 05:30, <ziniu.wang_1@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> pinctrl sleep state may config the pin mux to certain function to save
> power in system PM. But if usdhc is setting as wakeup source, like
> the card interrupt(SDIO) or card insert interrupt, it depends on the
> related pin mux configured to usdhc function pad.
> e.g. To support card interrupt(SDIO interrupt), it need the pin is
> config as usdhc DATA[1] function pin.
>
> Find the issue on imx93-11x11-evk board, SDIO WiFi in band interrupt
> can't wakeup system because the pinctrl sleep state config the DATA[1]
> pin as GPIO function.
>
> For this case, do not change the pinctrl state in suspend.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

I have followed the discussion and I agree that there is room for
additional improvements (such as adding a new pinctrl state).

In any case, I still think $subject patch is the first step to take,
to fix the current problems. So, applied for next, thanks!

Note that, we may want this for stable kernels too, but perhaps easier
to manage that by manual backports as this depends on commit
676a83855614 ("mmc: host: sdhci-esdhc-imx: refactor the system PM
logic") too.

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 5f1c45b2bd5d..f206b562a6e3 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2057,12 +2057,20 @@ static int sdhci_esdhc_suspend(struct device *dev)
>                 ret = sdhci_enable_irq_wakeups(host);
>                 if (!ret)
>                         dev_warn(dev, "Failed to enable irq wakeup\n");
> +       } else {
> +               /*
> +                * For the device which works as wakeup source, no need
> +                * to change the pinctrl to sleep state.
> +                * e.g. For SDIO device, the interrupt share with data pin,
> +                * but the pinctrl sleep state may config the data pin to
> +                * other function like GPIO function to save power in PM,
> +                * which finally block the SDIO wakeup function.
> +                */
> +               ret = pinctrl_pm_select_sleep_state(dev);
> +               if (ret)
> +                       return ret;
>         }
>
> -       ret = pinctrl_pm_select_sleep_state(dev);
> -       if (ret)
> -               return ret;
> -
>         ret = mmc_gpio_set_cd_wake(host->mmc, true);
>
>         /*
> --
> 2.34.1
>

