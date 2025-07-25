Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEB5C87FCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 07:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ceB1qf+gLasT0iKM4trjiwxebZfTYB6IsMaryh73jIo=; b=p8h0hPXNL7PVrB5hEZtxM0cHjo
	NRpr2ypBaP9vEPTgotqn8CxYvsYrWJMd/E+kLqy+Ta8w3+7ZpHHkq9yswXUdlca+/l0trhBWVsoXM
	EX1W4kNZ0cWyAdB0jnWeroyTvh3dqvlmskiuLlt058r5ExM8kLG8q228kmJrzAQ51us251XPzDkJL
	+3MpDQ5Ecb5H9ECI4l9wGxuBZvppe73s19MEHBa4PuJl4vnoZcDf7Gs7jIUo0hQRD8xGzsAOha8U5
	WX7C2JEmLdu1iWt8J1DxFfp53pxLMzvGR68qMPxUYhHddHiLHxDSZvq7xF39yVRPfW9a+1jSOOd3F
	S78zhFuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCvZ-00000009Gen-286z;
	Fri, 25 Jul 2025 07:33:13 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCcl-00000009Euw-1wu0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 07:13:48 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-558f7fda97eso1466237e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 00:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753427625; x=1754032425; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceB1qf+gLasT0iKM4trjiwxebZfTYB6IsMaryh73jIo=;
        b=XPxwjnwnyMXCb2++H7MuBvCBN41DBbWx6gB3m3uFB6wCgyPl7xin/Jt11q+emAoKcJ
         EK2JPu1etHgIBIP2ey+MEK8+lNtp4GKI9LpDVUaHpHJP5n/CmJBDBmBaHPTpEkKQtZMG
         4d3FdUchs3vh8daNEn/rETzhSsH9ElYr2pc/dnm4o4m2rjmCphmSX7SxulK+/XeYHXWB
         j4YoFxnwyfzpuz9QiNUmdAFY/gVMk74KEeyOXUqiIhRlH4R5q6aVOmZ2wnYtuArZEBlO
         cQZqO/1PmLahVx+0G9iNGciJxbemI5Ihyu3IE4DurfvNltrnVlzII42g9RJGeVQAKZR0
         j3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753427626; x=1754032426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ceB1qf+gLasT0iKM4trjiwxebZfTYB6IsMaryh73jIo=;
        b=uM4tau06MMqYTvQwSBKZuBfy03FN1gYl7cVMd+8kboc98cS4U0z/2UefkBnUHUGriI
         QqKRrrBoUZrwnJG1cg0Z8jPeO7OarcC1OCGmsD2XYynZhhfCLis8h+JIfJI5J1n/FnDV
         ihiajwI2HwlT9Jr1dEWioYZ8y3p6YQbUgwuCfYhaUlYTBQkSq51ba+C0yFJggkbcnxIa
         lpJ7EgFo6q1Ypy299XQfkLTAWpaAAY1IENK5qEsV4xKDq1rxEThHxgB+aPdBsrO68ZIu
         wQgfu49ychcX0ikpb7+7mBIBWMTGpqyrvR3sZCCpxsjYjJkdZMh4woI4JbfItYZmltxl
         sopQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9Dp/sXiJbHnIt9sVdmBSy2R/RqV4EBaZpuBHmlLYxr1XtKmcE2+86sc66nLdE6NE5Rgl3Wy3maNmKEBR0IctX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbi5/oBmAeRusThhXrtpVuMhoHcPBRqhQRL2YsBaleVOhme+PJ
	MDoGlzqWpAWCXe8rxDO97ZSQhHDovMr1N6WmHy26FFfATi4BG0na6cSyQImlFARHqaPH0Wj0nnr
	v/kaeck5ZoF4EZMbwpvzOBxID0wUCabcco96bIm7Kwg==
X-Gm-Gg: ASbGncvahg42uRaafZ+w2cgANgmhicA2Wv52NdCtZwhg45HMdO2hNiC5tyFzTH3cfHv
	77zFZ1J01JSRAXlbLTzhOKEgWOSJlNqdXFdup2aPscg5SLM8JvfG5wcns82wc6JVs9t20by3Z64
	HS4f2FDtzeYHn+9JYuZgVQ0LLrA7PJPeAN32r3v9OH40Tkap9IwS4CBo4KA2NByxiTyJaRZiIU4
	pCqqM4koyvmparL5K40BdqQzY4WBA0T0WMinwNXxnD978euFg==
X-Google-Smtp-Source: AGHT+IGZ6IpSoNGJljT1FXr2JWFQwLBJcl/zkngQEk6KemDtXvzc434wLZBIztSCj044zT6GZ+DEkjAHeT2KYoDAfi0=
X-Received: by 2002:a05:6512:4003:b0:553:a4cf:2106 with SMTP id
 2adb3069b0e04-55b5f4ea71bmr197629e87.57.1753427625388; Fri, 25 Jul 2025
 00:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250725055221.258501-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250725055221.258501-1-alexander.stein@ew.tq-group.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Jul 2025 09:13:34 +0200
X-Gm-Features: Ac12FXxdj3cPCvNBd3Lm4-GvXKqLYsKZr59Agf2YhP9X2Y28_xXRSYG4_XGAoZY
Message-ID: <CAMRc=Mew_F9ngFSNSyPL8ecm9ZgivYkbJg-jYghnWPGuy4pwVA@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: stmpe: Allow to compile as a module
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_001347_746957_6205EDD6 
X-CRM114-Status: GOOD (  22.37  )
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

On Fri, Jul 25, 2025 at 7:52=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Add the necessary boilerplate to also make this driver modular.
> This follows commit a2b8191ab695a ("pwm: stmpe: Allow to compile as a
> module") which does the same for pwm. Also add OF match table for module
> autoloading.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpio/Kconfig      |  2 +-
>  drivers/gpio/gpio-stmpe.c | 19 +++++++++++--------
>  2 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 500d839f65ee8..0621832d045fa 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1559,7 +1559,7 @@ config GPIO_SL28CPLD
>           called gpio-sl28cpld.
>
>  config GPIO_STMPE
> -       bool "STMPE GPIOs"
> +       tristate "STMPE GPIOs"
>         depends on MFD_STMPE
>         depends on OF_GPIO
>         select GPIOLIB_IRQCHIP
> diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
> index 0a270156e0bea..db9f4cd1e8615 100644
> --- a/drivers/gpio/gpio-stmpe.c
> +++ b/drivers/gpio/gpio-stmpe.c
> @@ -534,16 +534,19 @@ static int stmpe_gpio_probe(struct platform_device =
*pdev)
>         return devm_gpiochip_add_data(dev, &stmpe_gpio->chip, stmpe_gpio)=
;
>  }
>
> +static const struct of_device_id stmpe_gpio_of_matches[] =3D {
> +       { .compatible =3D "st,stmpe-gpio", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, stmpe_gpio_of_matches);
> +
>  static struct platform_driver stmpe_gpio_driver =3D {
>         .driver =3D {
> -               .suppress_bind_attrs    =3D true,
> -               .name                   =3D "stmpe-gpio",
> +               .name =3D "stmpe-gpio",
> +               .of_match_table =3D stmpe_gpio_of_matches,
>         },
> -       .probe          =3D stmpe_gpio_probe,
>  };
> +module_platform_driver_probe(stmpe_gpio_driver, stmpe_gpio_probe);
>
> -static int __init stmpe_gpio_init(void)
> -{
> -       return platform_driver_register(&stmpe_gpio_driver);
> -}
> -subsys_initcall(stmpe_gpio_init);

Please don't reorder the registration for built-in mode.

Bart

> +MODULE_DESCRIPTION("STMPE expander GPIO");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>

