Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADC4D74ED8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGE0nuYpaKQHKtQZCEQ7uetRNJ215gHEdrxyGaPgKyU=; b=UkCRiZtnmPHJ0RAaRwPbnP5BrF
	Vyd2kUGuN+IHA4w/tYje+MsLxr8JArrfOPjMMsIqA3XFl8e0VHtsOdEzYkHo99IJF9T8C/Pch4H4n
	nbv1ijYatt57DZRkrtIXNzp9vjkijZtBVTmg4s9wJYrj7iwwvo8uKVl+GCnSgk5yOMfaTFJVeRw/D
	2NWgNbNmX7kydI/IP/SMV1ho50b7juqKP9qNqfyY7LT0CcI5TuhA+X2z1P9PAO5R4D4ri0MEB1YrC
	P8i+313aAmKpFTQmQzmetdVjI/RFgDRhwhrLNAadlFHJDMbeyJmSi1OgZFa+77NYsY0QgtlcmMZUs
	rgN8pduQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHg0-00000008zr2-19Cw;
	Fri, 23 Jan 2026 13:58:16 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHfx-00000008zqX-3C8J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 13:58:14 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so3273269a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:58:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769176691; cv=none;
        d=google.com; s=arc-20240605;
        b=ks5HmHFN14pFA69J9ZnI3C/8Vs6l8eMv4lcnO72S20PbtRpS2AEfZFh6DUj6DAyQxo
         tw1wBDbpWPKShHKxYBz0dKgFV38U+3Z7CqEj8NSA56e3a9LnRKjy7j0tkt5MB60pp0IQ
         Ry9hycaciez5grVsvAQJIdkvOlte+4c6cHvTIgNCzI5RAOxQ9vkJjXC8YJVcyDxkeCk4
         k4Pp/PCrF3rw0hlTx65wU4g6lX3AzWWLFReq+qbFnY9BEMYKZ4c24p5ATgCyVOb1BkJi
         oFQ9tl15kDIGReCiq39XqO0FjSU6oq1Y2/23w0zgFZZSvBWVLW1fXDWInErviS4KI4Ox
         2Nfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GGE0nuYpaKQHKtQZCEQ7uetRNJ215gHEdrxyGaPgKyU=;
        fh=QLyEYW17WmK4dSo0ZCzP3j5mtLHbqcmzT7Ft2rL5Z5E=;
        b=dyDATEvPCU9xxawjD6l6dKJCEDq1pyZbecXAMcnnZTKycILemkGG2lZM6eh+2IsDsi
         S93ouUObH6f5hB5wp+tKuIY2eJkMCo+Z6TDZnOspOgJCfqKeSCe5UxBA4QnzgbP8Pynu
         f0aDJyyYc+4KibKtIle/AlyUxXDZOu68lGgXlYSAsZKrYep0v6yvn3ZdQF8lAgqDnojT
         sZf3ves7y2tqKAO6y+8jCwmcqpZuMxRnava72KqJKLKXc5vM5SgIUnkHcDJOkwDts3uk
         ty7Tp+NvYtHbz1LGHGwjd3BO2ZdXjnISCUkpteU/55Lwv8kUSeP2POsh0q8/YuN0SuFu
         MLlw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769176691; x=1769781491; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GGE0nuYpaKQHKtQZCEQ7uetRNJ215gHEdrxyGaPgKyU=;
        b=BYQnsg5kJ6jOLOgGwujfJaHjZXNuDei8NuyxVJ4h7ZFZ61kzfJ8UyZhsinVYfro3RH
         WFMwsGqdTejG4pAWHQrh+Y0H9CgN8H3R1MI8BecYXaR1JnDuG18ZKXfp/zjeu0UsLJ8h
         Rc2YuNKrwJZg4xlojemx9UQOZ7xgywZPLelCKOKLqnej7FDf/8VgUG2aAi8CLuegp2PH
         xKpWYywwKMfSb6rF612IaVrFrqySZqhRKtBBkLzXMV4ZT4vWXDzvh1sbjOlo1+nMeNnM
         OXiw86jF88wc40RmFAbZTEINTQpa6LEDXpdSUG9owwNxQOajWGVpcq9XuBs39oSzW47f
         DzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769176691; x=1769781491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGE0nuYpaKQHKtQZCEQ7uetRNJ215gHEdrxyGaPgKyU=;
        b=He9yEWp0yC0A+x14utKgE6glcp9rpsAj7lHx/JPLQNFOfezsm9Np/yMzvPT9WhMQ11
         PpsMdM2Z+7led9s1orRHp7PxIo31HKPw+yfdSQKFpYhYCiVBX8Aq/NvmXdbsiT+HZ6ge
         7nvwEvDNKxlcXbCIV/ObL3EKKmbbue+hI6IaKwDfl/05Txl82AvZcsV80HGlSfZSf0xS
         GK8iW9TOKtWTyoFzVQQP0NaEoMzBUb5EQsNMGJ78/VwX6c1qw56O7T6wRkMSkMpm5kX4
         FHZP0ddcaV409V6gnjXJPBINvm3tf6qmFOzv7WUwn7bmeeRLePptU0BZ9Pb8WfYiG7N2
         uFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9EASMh+jaQTrMbwEoQVY55VCryUVbmIbNZVbQjxzJ7tOzft0fMFCdaCSo8UkU6OAGNV/KWSj0hcfBcEDkK4db@lists.infradead.org
X-Gm-Message-State: AOJu0Yww8s061e5dm7IXN9YgPkdKzVqEwSRWLNu+PgmsyD2gtbQPmiKD
	xsqyrN+5lQO9oGYqMhC1BK315n+yV06mda6pTnldOIAJ9vSK8NpF9UwEU5iMMX/8wpCmpN1i/mP
	xSPdrJoo8ru/lN8Y2tJODEyXg6l9TamXiQWNKMRzV7A==
X-Gm-Gg: AZuq6aIq7O22QgcTG7AtF+Bpp831TLIRSBcc6MmP3k1FSTaFB3KFkT3OXtqNPJbYWRV
	mYHqOinVY96Lc2QRvtnz2+ziojAJCJohfoIAja+ZWVBYKsXAb6J4OZUJG//T8x2100lgtXZ+3y6
	m9lkxx+KZx1F5lGWnvT6IL5/jY0E/tVA3gYYFALJg8MAXn5wBcjKyjtC3R9UPS4rQ6EwsyNsxky
	FylseHSvTJiAWJfC9CN5kqgzLZm5qYFRmm7VyLQDFCLNFLGGTfO4NfdYD6q9XG4MBicOSpyM+wX
	0JvZwNp6V2mX0OEKljeXz5Mu
X-Received: by 2002:a05:6402:144b:b0:64d:4a01:fc23 with SMTP id
 4fb4d7f45d1cf-65848762170mr2202436a12.10.1769176691377; Fri, 23 Jan 2026
 05:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-7-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260120115923.3463866-7-khristineandreea.barbulescu@oss.nxp.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 23 Jan 2026 14:57:58 +0100
X-Gm-Features: AZwV_QiAQsZA5zBmebv7whc3eQu-e3v4RPd4MoMEVVMDs04rAsUL7nt2fdX8y_w
Message-ID: <CAKfTPtD6LOMFGhzG3dhiSQCNbYrGLjBiT83eqz9mmwaDVpNV=w@mail.gmail.com>
Subject: Re: [PATCH v8 06/10] pinctrl: s32g2: change the driver to also be
 probed as an MFD cell
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_055813_836036_188ED1FF 
X-CRM114-Status: GOOD (  25.00  )
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

On Tue, 20 Jan 2026 at 12:59, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> The old pinctrl bindings for SIUL2 are deprecated by a previous commit.
> The new bindings for the SIUL2 represent it as an MFD device:
> - one cell for combined pinctrl&GPIO
> - two cella acting as syscon providers for SoC registers access
>
> This commit allows the existing driver to also be probed as an MFD cell.
> The changes only impact the way the driver initializes the regmaps for
> accessing MSCR and IMCR registers.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>

[..]

> @@ -969,12 +1017,28 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>         s32_pinctrl_desc->confops = &s32_pinconf_ops;
>         s32_pinctrl_desc->owner = THIS_MODULE;
>
> +       ipctl->regions = devm_kcalloc(&pdev->dev, soc_data->mem_regions,
> +                                     sizeof(*ipctl->regions), GFP_KERNEL);
> +       if (!ipctl->regions)
> +               return -ENOMEM;
> +
> +       ipctl->legacy = soc_data->legacy;
> +       if (soc_data->legacy)
> +               ret = legacy_s32_pinctrl_regmap_init(pdev, ipctl);
> +       else
> +               ret = s32_pinctrl_mfd_regmap_init(pdev, ipctl);
> +
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Failed to init driver regmap!\n");
> +
>         ret = s32_pinctrl_probe_dt(pdev, ipctl);
>         if (ret)
>                 return dev_err_probe(&pdev->dev, ret,
>                                      "Fail to probe dt properties\n");
>
> -       ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
> +       ret = devm_pinctrl_register_and_init(s32_get_dev(ipctl),

you should better add a child node for your pinctrl mfd device in its
"nxp,s32g2-siul2" parent instead of registering the pinctrl device on
the parent device. This would fix phandle to gpio too



> +                                            s32_pinctrl_desc,
>                                              ipctl, &ipctl->pctl);
>         if (ret)
>                 return dev_err_probe(&pdev->dev, ret,
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
> index c49d28793b69..2d56ffb1a109 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
> @@ -3,7 +3,7 @@
>   * NXP S32G pinctrl driver
>   *
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
> - * Copyright 2017-2018, 2020-2022 NXP
> + * Copyright 2017-2018, 2020-2022, 2024-2025 NXP
>   * Copyright (C) 2022 SUSE LLC
>   */
>
> @@ -762,7 +762,7 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
>         S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ31),
>  };
>
> -static const struct s32_pin_range s32_pin_ranges_siul2[] = {
> +static const struct s32_pin_range legacy_s32_pin_ranges_siul2[] = {
>         /* MSCR pin ID ranges */
>         S32_PIN_RANGE(0, 101),
>         S32_PIN_RANGE(112, 122),
> @@ -773,27 +773,47 @@ static const struct s32_pin_range s32_pin_ranges_siul2[] = {
>         S32_PIN_RANGE(942, 1007),
>  };
>
> -static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
> +static const struct s32_pinctrl_soc_data legacy_s32_pinctrl_data = {
>         .pins = s32_pinctrl_pads_siul2,
>         .npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
> -       .mem_pin_ranges = s32_pin_ranges_siul2,
> -       .mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
> +       .mem_pin_ranges = legacy_s32_pin_ranges_siul2,
> +       .mem_regions = ARRAY_SIZE(legacy_s32_pin_ranges_siul2),
> +       .legacy = true,
>  };
>
>  static const struct of_device_id s32_pinctrl_of_match[] = {
>         {
>                 .compatible = "nxp,s32g2-siul2-pinctrl",
> -               .data = &s32_pinctrl_data,
> +               .data = &legacy_s32_pinctrl_data,
>         },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, s32_pinctrl_of_match);
>
> +static const struct s32_pin_range s32_pin_ranges_siul2[] = {
> +       /* MSCR pin ID ranges */
> +       S32_PIN_RANGE(0, 101),
> +       S32_PIN_RANGE(112, 190),
> +       /* IMCR pin ID ranges */
> +       S32_PIN_RANGE(512, 595),
> +       S32_PIN_RANGE(631, 1007),
> +};
> +
> +static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
> +       .pins = s32_pinctrl_pads_siul2,
> +       .npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
> +       .mem_pin_ranges = s32_pin_ranges_siul2,
> +       .mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
> +       .legacy = false,
> +};
> +
>  static int s32g_pinctrl_probe(struct platform_device *pdev)
>  {
>         const struct s32_pinctrl_soc_data *soc_data;
>
>         soc_data = of_device_get_match_data(&pdev->dev);
> +       if (!soc_data)
> +               soc_data = &s32_pinctrl_data;
>
>         return s32_pinctrl_probe(pdev, soc_data);
>  }
> --
> 2.50.1
>

