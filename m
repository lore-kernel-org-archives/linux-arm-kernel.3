Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B550C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BARUASpJRV7rjuWtAQfVw6iGKUQXuRHG9Omp79hJ7oc=; b=HN1oCJ6YvroUq7g76MiT3r0JVj
	tCXHf3q0DmXwziKP4v3aR37pFC+33DmqjDRV4P14eOmPx8lOfzgUrqJgwk/Lb0Gu5O/qpqYb1ALvM
	1T7E/WCK9U6i1EKeDPLyRbgkwXGYFmPcZ27wGfblyDL8Khj2YTB4EcJhahsI9dfD9+0oeVRrgCbto
	0y/RKwOX4zlumacb4O7CJwIUyeQdeHpfDSEnvt0euoJIeOFmgunrOy8Zv+scWojNjqYhfga62e5rV
	bbR1pzJ/OVnjyGB0V+6xUgVpnzJBdkoLP6GCyiZP67H1+NbcJU8mFcw9AdO90aK2qx2ugFg1ADHS4
	ozl0IWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqATL-0000000AwSb-0zVQ;
	Thu, 06 Mar 2025 12:37:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9rD-0000000ArBQ-1Pnf
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 11:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BARUASpJRV7rjuWtAQfVw6iGKUQXuRHG9Omp79hJ7oc=; b=d3vvbLCY4zjkoHbvg6DZ+AvRsM
	+c+IwcDkyOx44Kdla5/yYXN3Pi+ldQ1cVR01wB6O8qJdEJExhLCRExuIM+gJwJfN/Z4E/WIAxxJZs
	lt9z+PPQOOJ5ofG6+Uh0volrlcnza0xuPGApMy0mkhwkCKGRJ+KnanyTmRHub2Pwf5DVUcVU1S3FM
	3A06e607tTkgw8OUf+yLE3gxjU2Zr2jlMZS0DhlWl8uT00F1+0jTQOzfaFjd1N7GK7IOKbhv67S5D
	4n5nq2AUudo2AlmRv1Ed2ySCQq/SDjeehkL0staANHnd8BW1y59PJeIKKQ5vjQZz1UvMGABDjpUmJ
	bl675p9g==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9r9-000000013iE-48lr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:57:41 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e4ad1d67bdso809856a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741262257; x=1741867057; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BARUASpJRV7rjuWtAQfVw6iGKUQXuRHG9Omp79hJ7oc=;
        b=sUs7FMSS7Ywk4DPSV6dlH95IwJY5bFQiD9fxNEH+0xYkgTUeG9Rphf3j/8CAbBmQtM
         w/z9inVb2lSk8/mxrrSEeyeZGXJFcpTjcxgQxGyZ48H5UZtPrIUNZ+n2NzqRetxfFD7u
         qRFDZujQaUjOJajPqRzd24ZDAhvP9ZGiWeI/HjaHzyPc4eWLr569nWK0WvVCwUKv/B/J
         fU5cjwXoPJG5YRZ1j97oPNWjygTykdIHH/B4CzB/n/5+J4ibCjM/TJf28zGR7vMlkp23
         0NE4NqCWMnEgUAoSfkX6LzI0NMd9ilrhNHNhuzhUbNxCdPUMNjVXEKRRl3t//wQrW6mv
         5OsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741262257; x=1741867057;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BARUASpJRV7rjuWtAQfVw6iGKUQXuRHG9Omp79hJ7oc=;
        b=mR19syyRWrKwlTuyERjsC/+3ZqzsVyfhQCfMsATJBOermzqdmqtvFNcoSQOtMLbzYc
         qQ6OBaj0w7MxvcfvUDZQNEjX2ASrpRMDecSQEqWGsWGzLfe74SSsRHYG7K1cHbUKoj/S
         HRGQ9LsBsPECNfh9oQEpBjym0D0OCcG5HCh3SFyWLElGhYXmN8M7pry9ftW/PzSg+5Ib
         Bqt5AoE9AiuaXcL3CExIBpULlcQA5715HgIQu+Lwo6XdNU2dp1WUMHp+LRP0cjqlqSMr
         JJbQTyYoRMVEqcKQvIc8Hih+zEq2lviqn6OJnANKLoosPytVBvcdmyhVrkF7rrOrltu6
         Xz5w==
X-Gm-Message-State: AOJu0YxBHOfkcVgn+dwpNUojDEX46A96Lo57rAvhG/H+Cgh94/jAj3dp
	MaSeh8W65qnIxnEIZZoaieA6jkentA0q4Q7qmzqhoDPik2t2Am6hbD78sFFg79Q=
X-Gm-Gg: ASbGnctpliHs1krlEXna1+9VC1d33K9don+S/HqzXaPvGkLUENmWb43a4jFWh1GIpo4
	hq7uMGxDiSXqyzgro7NaxNxbKS8YTSYrxG1TWgfJFWZMCMhti/NUZtKOwgdlHISUQCgL7JecAS6
	l3ycNAtYWLUg8WgCfPrIK+sPntNi23PYRiBsVMkyY+/+ZjeXlpH9xje5wmwc7isxyA6TMn8CRmE
	st1N16THdqtILtcbMjSvxjDn1l1KmbJWHKFNCskH02iayJ/TkksmDfAaPXru5vY2Zj0FXsOtAFi
	ZWvO3goA5z4pmx9onnwfaZaxdD+KNEOlpuSACfvTTD6r6ciN
X-Google-Smtp-Source: AGHT+IFVm1H9GI3kx+kJniQRxYGCrEUbz/D381snyIxSGg+a4nF/a3d4dUAKhYqpsRUeFr9SNwunXA==
X-Received: by 2002:a05:6402:84d:b0:5e0:745c:6503 with SMTP id 4fb4d7f45d1cf-5e59f530e18mr6315105a12.31.1741262256822;
        Thu, 06 Mar 2025 03:57:36 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c768f213sm839847a12.74.2025.03.06.03.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:57:36 -0800 (PST)
Message-ID: <f7c0101ff26ac0d4ef70a374ae31ee5d23b3c8fc.camel@linaro.org>
Subject: Re: [PATCH v2 2/4] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Thu, 06 Mar 2025 11:57:35 +0000
In-Reply-To: <20250301-pinctrl-fltcon-suspend-v2-2-a7eef9bb443b@linaro.org>
References: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
	 <20250301-pinctrl-fltcon-suspend-v2-2-a7eef9bb443b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_115740_167510_141774A6 
X-CRM114-Status: GOOD (  25.49  )
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

On Sat, 2025-03-01 at 11:43 +0000, Peter Griffin wrote:
> gs101 needs it's own suspend/resume callbacks to use the newly
> added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
> registers. It also differs to previous SoCs in that fltcon1
> register doesn't always exist for each bank.
>=20
> exynosautov920 also has dedicated logic for using eint_con_offset
> and eint_mask_offset for saving & restoring it's registers.
>=20
> Refactor the existing platform specific suspend/resume callback
> so that each SoC variant has their own callback containing the
> SoC specific logic.
>=20
> Additionally we now call drvdata->suspend() & drvdata->resume()
> from within the loop that iterates the banks in
> samsung_pinctrl_suspend() and samsung_pinctrl_resume().
>=20
> This simplifies the logic, and allows us to remove the
> clk_enable() and clk_disable() from the callbacks.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes since v1:
> * Split code refactor & gs101 parts into separate patches (Andre)
> ---
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |=C2=A0 28 ++--
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 201 ++++++++++---------------
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/pinctrl/samsung/pinctrl-samsung.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 11 +-
> =C2=A0drivers/pinctrl/samsung/pinctrl-samsung.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A05 files changed, 111 insertions(+), 143 deletions(-)
>=20
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index e28fe8177646..57c98d2451b5 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -1112,8 +1112,8 @@ static const struct samsung_pin_ctrl exynosautov920=
_pin_ctrl[] =3D {
> =C2=A0		.pin_banks	=3D exynosautov920_pin_banks0,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(exynosautov920_pin_banks0),
> =C2=A0		.eint_wkup_init	=3D exynos_eint_wkup_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D exynosautov920_pinctrl_suspend,
> +		.resume		=3D exynosautov920_pinctrl_resume,
> =C2=A0		.retention_data	=3D &exynosautov920_retention_data,
> =C2=A0	}, {
> =C2=A0		/* pin-controller instance 1 AUD data */
> @@ -1124,43 +1124,43 @@ static const struct samsung_pin_ctrl exynosautov9=
20_pin_ctrl[] =3D {
> =C2=A0		.pin_banks	=3D exynosautov920_pin_banks2,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(exynosautov920_pin_banks2),
> =C2=A0		.eint_gpio_init	=3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D exynosautov920_pinctrl_suspend,
> +		.resume		=3D exynosautov920_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin-controller instance 3 HSI1 data */
> =C2=A0		.pin_banks	=3D exynosautov920_pin_banks3,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(exynosautov920_pin_banks3),
> =C2=A0		.eint_gpio_init	=3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D exynosautov920_pinctrl_suspend,
> +		.resume		=3D exynosautov920_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin-controller instance 4 HSI2 data */
> =C2=A0		.pin_banks	=3D exynosautov920_pin_banks4,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(exynosautov920_pin_banks4),
> =C2=A0		.eint_gpio_init	=3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D exynosautov920_pinctrl_suspend,
> +		.resume		=3D exynosautov920_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin-controller instance 5 HSI2UFS data */
> =C2=A0		.pin_banks	=3D exynosautov920_pin_banks5,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(exynosautov920_pin_banks5),
> =C2=A0		.eint_gpio_init	=3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D exynosautov920_pinctrl_suspend,
> +		.resume		=3D exynosautov920_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin-controller instance 6 PERIC0 data */
> =C2=A0		.pin_banks	=3D exynosautov920_pin_banks6,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(exynosautov920_pin_banks6),
> =C2=A0		.eint_gpio_init	=3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D exynosautov920_pinctrl_suspend,
> +		.resume		=3D exynosautov920_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin-controller instance 7 PERIC1 data */
> =C2=A0		.pin_banks	=3D exynosautov920_pin_banks7,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(exynosautov920_pin_banks7),
> =C2=A0		.eint_gpio_init	=3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D exynosautov920_pinctrl_suspend,
> +		.resume		=3D exynosautov920_pinctrl_resume,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/s=
amsung/pinctrl-exynos.c
> index ac6dc22b37c9..d65a9fba0781 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -761,153 +761,118 @@ __init int exynos_eint_wkup_init(struct samsung_p=
inctrl_drv_data *d)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static void exynos_pinctrl_suspend_bank(
> -				struct samsung_pinctrl_drv_data *drvdata,
> -				struct samsung_pin_bank *bank)
> +static void exynos_set_wakeup(struct samsung_pin_bank *bank)
> =C2=A0{
> -	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> -	const void __iomem *regs =3D bank->eint_base;
> +	struct exynos_irq_chip *irq_chip =3D NULL;

This is a useless init and the value is overwritten right away.

> =C2=A0
> -	if (clk_enable(bank->drvdata->pclk)) {
> -		dev_err(bank->gpio_chip.parent,
> -			"unable to enable clock for saving state\n");
> -		return;
> +	if (bank->eint_type =3D=3D EINT_TYPE_WKUP) {
> +		if (bank->irq_chip) {
> +			irq_chip =3D bank->irq_chip;
> +			irq_chip->set_eint_wakeup_mask(bank->drvdata, irq_chip);
> +		}
> =C2=A0	}
> -
> -	save->eint_con =3D readl(regs + EXYNOS_GPIO_ECON_OFFSET
> -						+ bank->eint_offset);
> -	save->eint_fltcon0 =3D readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> -						+ 2 * bank->eint_offset);
> -	save->eint_fltcon1 =3D readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> -						+ 2 * bank->eint_offset + 4);
> -	save->eint_mask =3D readl(regs + bank->irq_chip->eint_mask
> -						+ bank->eint_offset);
> -
> -	clk_disable(bank->drvdata->pclk);
> -
> -	pr_debug("%s: save=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x\n", bank->name, s=
ave->eint_con);
> -	pr_debug("%s: save fltcon0 %#010x\n", bank->name, save->eint_fltcon0);
> -	pr_debug("%s: save fltcon1 %#010x\n", bank->name, save->eint_fltcon1);
> -	pr_debug("%s: save=C2=A0=C2=A0=C2=A0 mask %#010x\n", bank->name, save->=
eint_mask);
> =C2=A0}
> =C2=A0
> -static void exynosauto_pinctrl_suspend_bank(struct samsung_pinctrl_drv_d=
ata *drvdata,
> -					=C2=A0=C2=A0=C2=A0 struct samsung_pin_bank *bank)
> +void exynos_pinctrl_suspend(struct samsung_pin_bank *bank)
> =C2=A0{
> =C2=A0	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> =C2=A0	const void __iomem *regs =3D bank->eint_base;
> =C2=A0
> -	if (clk_enable(bank->drvdata->pclk)) {
> -		dev_err(bank->gpio_chip.parent,
> -			"unable to enable clock for saving state\n");
> -		return;
> +	exynos_set_wakeup(bank);
> +
> +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {

Can you swap the order, and make the call to exynos_set_wakeup()
an else, to avoid some needless tests and make it clearer that
set_wakeup() is conditional as well, i.e.:

	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
	  ...
	} else {
	  exynos_set_wakeup(bank);
	}

What makes it hard to read is that as-is, it looks like the
set_wakeup() is unconditional, while it's also based on
bank->eint_type (which is also more obvious before your patch).

Or maybe even have exynos_set_wakeup() return a bool, as in
the follow-up gs101 patch, there are three tests of this type.

Other than that, I think I looks good.

Cheers,
Andre'

> +		save->eint_con =3D readl(regs + EXYNOS_GPIO_ECON_OFFSET
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> +		save->eint_fltcon0 =3D readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +					=C2=A0=C2=A0 + 2 * bank->eint_offset);
> +		save->eint_fltcon1 =3D readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +					=C2=A0=C2=A0 + 2 * bank->eint_offset + 4);
> +		save->eint_mask =3D readl(regs + bank->irq_chip->eint_mask
> +					+ bank->eint_offset);
> +
> +		pr_debug("%s: save=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x\n",
> +			 bank->name, save->eint_con);
> +		pr_debug("%s: save fltcon0 %#010x\n",
> +			 bank->name, save->eint_fltcon0);
> +		pr_debug("%s: save fltcon1 %#010x\n",
> +			 bank->name, save->eint_fltcon1);
> +		pr_debug("%s: save=C2=A0=C2=A0=C2=A0 mask %#010x\n",
> +			 bank->name, save->eint_mask);
> =C2=A0	}
> -
> -	save->eint_con =3D readl(regs + bank->pctl_offset + bank->eint_con_offs=
et);
> -	save->eint_mask =3D readl(regs + bank->pctl_offset + bank->eint_mask_of=
fset);
> -
> -	clk_disable(bank->drvdata->pclk);
> -
> -	pr_debug("%s: save=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x\n", bank->name, s=
ave->eint_con);
> -	pr_debug("%s: save=C2=A0=C2=A0=C2=A0 mask %#010x\n", bank->name, save->=
eint_mask);
> =C2=A0}
> =C2=A0
> -void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
> +void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
> =C2=A0{
> -	struct samsung_pin_bank *bank =3D drvdata->pin_banks;
> -	struct exynos_irq_chip *irq_chip =3D NULL;
> -	int i;
> +	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> +	const void __iomem *regs =3D bank->eint_base;
> =C2=A0
> -	for (i =3D 0; i < drvdata->nr_banks; ++i, ++bank) {
> -		if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> -			if (bank->eint_con_offset)
> -				exynosauto_pinctrl_suspend_bank(drvdata, bank);
> -			else
> -				exynos_pinctrl_suspend_bank(drvdata, bank);
> -		}
> -		else if (bank->eint_type =3D=3D EINT_TYPE_WKUP) {
> -			if (!irq_chip) {
> -				irq_chip =3D bank->irq_chip;
> -				irq_chip->set_eint_wakeup_mask(drvdata,
> -							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq_chip);
> -			}
> -		}
> +	exynos_set_wakeup(bank);
> +
> +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> +		save->eint_con =3D readl(regs + bank->pctl_offset +
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bank->eint_con_offset);
> +		save->eint_mask =3D readl(regs + bank->pctl_offset +
> +					bank->eint_mask_offset);
> +		pr_debug("%s: save=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x\n",
> +			 bank->name, save->eint_con);
> +		pr_debug("%s: save=C2=A0=C2=A0=C2=A0 mask %#010x\n",
> +			 bank->name, save->eint_mask);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static void exynos_pinctrl_resume_bank(
> -				struct samsung_pinctrl_drv_data *drvdata,
> -				struct samsung_pin_bank *bank)
> +void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
> =C2=A0{
> =C2=A0	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> =C2=A0	void __iomem *regs =3D bank->eint_base;
> =C2=A0
> -	if (clk_enable(bank->drvdata->pclk)) {
> -		dev_err(bank->gpio_chip.parent,
> -			"unable to enable clock for restoring state\n");
> -		return;
> +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> +		pr_debug("%s:=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x =3D> %#010x\n", bank-=
>name,
> +			 readl(regs + EXYNOS_GPIO_ECON_OFFSET
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset), save->eint=
_con);
> +		pr_debug("%s: fltcon0 %#010x =3D> %#010x\n", bank->name,
> +			 readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + 2 * bank->eint_offset), save->=
eint_fltcon0);
> +		pr_debug("%s: fltcon1 %#010x =3D> %#010x\n", bank->name,
> +			 readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + 2 * bank->eint_offset + 4),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 save->eint_fltcon1);
> +		pr_debug("%s:=C2=A0=C2=A0=C2=A0 mask %#010x =3D> %#010x\n", bank->name=
,
> +			 readl(regs + bank->irq_chip->eint_mask
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset), save->eint=
_mask);
> +
> +		writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> +		writel(save->eint_fltcon0, regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + 2 * bank->eint_offset);
> +		writel(save->eint_fltcon1, regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + 2 * bank->eint_offset + 4);
> +		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> =C2=A0	}
> -
> -	pr_debug("%s:=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x =3D> %#010x\n", bank->=
name,
> -			readl(regs + EXYNOS_GPIO_ECON_OFFSET
> -			+ bank->eint_offset), save->eint_con);
> -	pr_debug("%s: fltcon0 %#010x =3D> %#010x\n", bank->name,
> -			readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> -			+ 2 * bank->eint_offset), save->eint_fltcon0);
> -	pr_debug("%s: fltcon1 %#010x =3D> %#010x\n", bank->name,
> -			readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> -			+ 2 * bank->eint_offset + 4), save->eint_fltcon1);
> -	pr_debug("%s:=C2=A0=C2=A0=C2=A0 mask %#010x =3D> %#010x\n", bank->name,
> -			readl(regs + bank->irq_chip->eint_mask
> -			+ bank->eint_offset), save->eint_mask);
> -
> -	writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
> -						+ bank->eint_offset);
> -	writel(save->eint_fltcon0, regs + EXYNOS_GPIO_EFLTCON_OFFSET
> -						+ 2 * bank->eint_offset);
> -	writel(save->eint_fltcon1, regs + EXYNOS_GPIO_EFLTCON_OFFSET
> -						+ 2 * bank->eint_offset + 4);
> -	writel(save->eint_mask, regs + bank->irq_chip->eint_mask
> -						+ bank->eint_offset);
> -
> -	clk_disable(bank->drvdata->pclk);
> =C2=A0}
> =C2=A0
> -static void exynosauto_pinctrl_resume_bank(struct samsung_pinctrl_drv_da=
ta *drvdata,
> -					=C2=A0=C2=A0 struct samsung_pin_bank *bank)
> +void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank)
> =C2=A0{
> =C2=A0	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> =C2=A0	void __iomem *regs =3D bank->eint_base;
> =C2=A0
> -	if (clk_enable(bank->drvdata->pclk)) {
> -		dev_err(bank->gpio_chip.parent,
> -			"unable to enable clock for restoring state\n");
> -		return;
> +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> +		/* exynosautov920 has eint_con_offset for all but one bank */
> +		if (!bank->eint_con_offset)
> +			exynos_pinctrl_resume(bank);
> +
> +		pr_debug("%s:=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x =3D> %#010x\n", bank-=
>name,
> +			 readl(regs + bank->pctl_offset + bank->eint_con_offset),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 save->eint_con);
> +		pr_debug("%s:=C2=A0=C2=A0=C2=A0 mask %#010x =3D> %#010x\n", bank->name=
,
> +			 readl(regs + bank->pctl_offset +
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bank->eint_mask_offset), save->e=
int_mask);
> +
> +		writel(save->eint_con,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs + bank->pctl_offset + bank->=
eint_con_offset);
> +		writel(save->eint_mask,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs + bank->pctl_offset + bank->=
eint_mask_offset);
> =C2=A0	}
> -
> -	pr_debug("%s:=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x =3D> %#010x\n", bank->=
name,
> -		 readl(regs + bank->pctl_offset + bank->eint_con_offset), save->eint_c=
on);
> -	pr_debug("%s:=C2=A0=C2=A0=C2=A0 mask %#010x =3D> %#010x\n", bank->name,
> -		 readl(regs + bank->pctl_offset + bank->eint_mask_offset), save->eint_=
mask);
> -
> -	writel(save->eint_con, regs + bank->pctl_offset + bank->eint_con_offset=
);
> -	writel(save->eint_mask, regs + bank->pctl_offset + bank->eint_mask_offs=
et);
> -
> -	clk_disable(bank->drvdata->pclk);
> -}
> -
> -void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
> -{
> -	struct samsung_pin_bank *bank =3D drvdata->pin_banks;
> -	int i;
> -
> -	for (i =3D 0; i < drvdata->nr_banks; ++i, ++bank)
> -		if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> -			if (bank->eint_con_offset)
> -				exynosauto_pinctrl_resume_bank(drvdata, bank);
> -			else
> -				exynos_pinctrl_resume_bank(drvdata, bank);
> -		}
> =C2=A0}
> =C2=A0
> =C2=A0static void exynos_retention_enable(struct samsung_pinctrl_drv_data=
 *drvdata)
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/s=
amsung/pinctrl-exynos.h
> index 33df21d5c9d6..35c2bc4ea488 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -221,8 +221,10 @@ struct exynos_muxed_weint_data {
> =C2=A0
> =C2=A0int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d);
> =C2=A0int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d);
> -void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata);
> -void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata);
> +void exynosautov920_pinctrl_resume(struct samsung_pin_bank *bank);
> +void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
> +void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
> +void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
> =C2=A0struct samsung_retention_ctrl *
> =C2=A0exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct samsung_retention_dat=
a *data);
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/=
samsung/pinctrl-samsung.c
> index 963060920301..375634d8cc79 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1349,6 +1349,9 @@ static int __maybe_unused samsung_pinctrl_suspend(s=
truct device *dev)
> =C2=A0		const u8 *widths =3D bank->type->fld_width;
> =C2=A0		enum pincfg_type type;
> =C2=A0
> +		if (drvdata->suspend)
> +			drvdata->suspend(bank);
> +
> =C2=A0		/* Registers without a powerdown config aren't lost */
> =C2=A0		if (!widths[PINCFG_TYPE_CON_PDN])
> =C2=A0			continue;
> @@ -1373,8 +1376,6 @@ static int __maybe_unused samsung_pinctrl_suspend(s=
truct device *dev)
> =C2=A0
> =C2=A0	clk_disable(drvdata->pclk);
> =C2=A0
> -	if (drvdata->suspend)
> -		drvdata->suspend(drvdata);
> =C2=A0	if (drvdata->retention_ctrl && drvdata->retention_ctrl->enable)
> =C2=A0		drvdata->retention_ctrl->enable(drvdata);
> =C2=A0
> @@ -1406,9 +1407,6 @@ static int __maybe_unused samsung_pinctrl_resume(st=
ruct device *dev)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> -	if (drvdata->resume)
> -		drvdata->resume(drvdata);
> -
> =C2=A0	for (i =3D 0; i < drvdata->nr_banks; i++) {
> =C2=A0		struct samsung_pin_bank *bank =3D &drvdata->pin_banks[i];
> =C2=A0		void __iomem *reg =3D bank->pctl_base + bank->pctl_offset;
> @@ -1416,6 +1414,9 @@ static int __maybe_unused samsung_pinctrl_resume(st=
ruct device *dev)
> =C2=A0		const u8 *widths =3D bank->type->fld_width;
> =C2=A0		enum pincfg_type type;
> =C2=A0
> +		if (drvdata->resume)
> +			drvdata->resume(bank);
> +
> =C2=A0		/* Registers without a powerdown config aren't lost */
> =C2=A0		if (!widths[PINCFG_TYPE_CON_PDN])
> =C2=A0			continue;
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/=
samsung/pinctrl-samsung.h
> index 371e4f02bbfb..e939e5bb0347 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -285,8 +285,8 @@ struct samsung_pin_ctrl {
> =C2=A0	int		(*eint_gpio_init)(struct samsung_pinctrl_drv_data *);
> =C2=A0	int		(*eint_wkup_init)(struct samsung_pinctrl_drv_data *);
> =C2=A0	void		(*pud_value_init)(struct samsung_pinctrl_drv_data *drvdata);
> -	void		(*suspend)(struct samsung_pinctrl_drv_data *);
> -	void		(*resume)(struct samsung_pinctrl_drv_data *);
> +	void		(*suspend)(struct samsung_pin_bank *bank);
> +	void		(*resume)(struct samsung_pin_bank *bank);
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -335,8 +335,8 @@ struct samsung_pinctrl_drv_data {
> =C2=A0
> =C2=A0	struct samsung_retention_ctrl	*retention_ctrl;
> =C2=A0
> -	void (*suspend)(struct samsung_pinctrl_drv_data *);
> -	void (*resume)(struct samsung_pinctrl_drv_data *);
> +	void (*suspend)(struct samsung_pin_bank *bank);
> +	void (*resume)(struct samsung_pin_bank *bank);
> =C2=A0};
> =C2=A0
> =C2=A0/**
>=20


