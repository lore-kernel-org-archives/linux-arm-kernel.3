Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EDAD2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tIrp6HstcuwfiFz162zyZhrHpaG9hHBmzq4tw2KMNk=; b=HGZ7QurNYz53VQF1IpkWrLYXLr
	50s2lfxtagxkaO6yljogmW4ZRQYqJpOjwODB3EbXQL8Wikt2NKXaNvspK1FVwzTdZXERLAJpqYiGr
	loaNM0lfKhemyK6NmO4oF1O2qMvcd8uVXLb+IJ7RGXbQb9YLcHACB2EWOA6cQmUDD1MVzdkgHv40S
	qTPwTl+SCrVqefMSuZEevsGGukMfUDMIcCoyD/a4HzCJt3Vpun1x6iDKlg6NICNpvfOhPoeaSMxf4
	obdht92UiZMnHXHBbx+PmMrit++u9mtiLPJTlW6kNYEACdMC5vPUDFi0bnb7ZqVemaGMWEKjWV04+
	wnhyYYVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viATY-00000003mT5-2ZVj;
	Tue, 20 Jan 2026 12:04:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viATW-00000003mSs-4AVg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:04:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F91C6014A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 12:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18444C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768910686;
	bh=jKyaAlehX7Qy5dIkcTxFT6tTeel+TstN11n2B93COhE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=O5zqHn7qGRY+OMGtwYfBkJM8aq8kprH2Je9+4YgUlyRD3vxmqwweAXuEASjZYKbis
	 CMKvOjnctS9PWsX0gsO0n0IOxNW1igR+lTwJrsAQu25eckrn/oOLYKX0OcyZYIM1M8
	 uUZG8Ekg8novL6hgivp9odFr2c+HNyNhuxoCjyoRBXH3L2uVKe+3tCKwCkCnebld5B
	 iNI6DRxIRaaLnBkwFh1oERsf0hulvXrcnwxASbFQBC1OqhXkLmKBTkQstkQ1/Hqed1
	 A6Bb1+C4g/NJu7S9ryf2YkL/T6PkOgnMbeBM+ykxNo4JIPhARVCmX/qv5OdbEwUVkZ
	 7WBAp3m6K8fkw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b685d2b79so5269995e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 04:04:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTQk79dpZIj88niLeetznlzUbvG29rg1HM1FzA9y6WIk4sqa4tT+61ZUDosIEvpZcOCgtEgpAlBAjhywBLvEsx@lists.infradead.org
X-Gm-Message-State: AOJu0YxBBWKHipFgdtSV/gun+29vgg5yyZzL6Ca5yH4ZLtrNyTau95d2
	seU/AQldj9RUIFS22NrSX0dGIi1e+Atz4EYIfjugQHf9qVPLVEEwAxHSI/taLxorAZM7KEbkr32
	J0MfAozg+gujjFGS01G0XWtWI9/UpeE+YpFmPJGlz3A==
X-Received: by 2002:a05:6512:2209:b0:595:910c:8eea with SMTP id
 2adb3069b0e04-59baeedb8d0mr4527119e87.32.1768910684697; Tue, 20 Jan 2026
 04:04:44 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 12:04:43 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 12:04:43 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260120115923.3463866-6-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-6-khristineandreea.barbulescu@oss.nxp.com>
Date: Tue, 20 Jan 2026 12:04:43 +0000
X-Gmail-Original-Message-ID: <CAMRc=McHieZFrdVkt_BhF1oEBz2breVj6zKjtgaQAaU9npCBRA@mail.gmail.com>
X-Gm-Features: AZwV_QjiJd4F6TfXTJkvg80886t2EMvMvx-E5YB_KKhZJvuYUWeZmMG4W0nTwv4
Message-ID: <CAMRc=McHieZFrdVkt_BhF1oEBz2breVj6zKjtgaQAaU9npCBRA@mail.gmail.com>
Subject: Re: [PATCH v8 05/10] pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 20 Jan 2026 12:59:17 +0100, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
> and "pinctrl_enable" since this is the recommended way.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> index a98f8e7c2768..4767916dbcab 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -974,10 +974,10 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "Fail to probe dt properties\n");
>
> -	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
> -					    ipctl);
> -	if (IS_ERR(ipctl->pctl))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
> +	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
> +					     ipctl, &ipctl->pctl);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
>  				     "Could not register s32 pinctrl driver\n");
>
>  #ifdef CONFIG_PM_SLEEP
> @@ -990,7 +990,12 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  		return -ENOMEM;
>  #endif
>
> -	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");
> +	ret = pinctrl_enable(ipctl->pctl);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to enable pinctrl\n");
> +
> +	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
>
>  	return 0;
>  }
> --
> 2.50.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

