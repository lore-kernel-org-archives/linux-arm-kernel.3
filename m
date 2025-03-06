Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30087C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIFvuaqHhFntvQlpRTIvoKjIOarKQMOq9Ag0pcr/34A=; b=wPpjqn2hZ1x0n5424ppu8cH/Ko
	Wdr39t26ecAmHPRFnfZUg/jD10BW4CqqgwGMa5waGOannJ5iz074muj2lCX/xaHL2mqo33mtxmXYG
	4RSGn2O35CcmO729ZcOFRLWOJLTdZ39P2tzLBwV/KtLCZfyCYUO4hT/3218XHY10ZAR6BmBclqJ0I
	alaBgY5TPbfn6pmPbV/caE0JNXLXw3YIt+p5WkIncyt7mzXVNXRHoR6CWPj3+Fyk+xzNR6VomCDSe
	jFS7GdNTN7sPL8SEiBAaMPByOBLR92+LSu1SKznNYMKiUb1zAY+aCLT4V3C0P2lNC9Trhn8HFq+KO
	0QQWtV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDDm-0000000BKrE-0qsO;
	Thu, 06 Mar 2025 15:33:14 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqD7I-0000000BJcw-0R2k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 15:26:33 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e4bed34bccso1267892a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 07:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741274790; x=1741879590; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iIFvuaqHhFntvQlpRTIvoKjIOarKQMOq9Ag0pcr/34A=;
        b=Fq6jdWxxv2tUrSlbDJ6CcoaA5Ark+4uUOMKOyOCC9yun6Ma0jBXEjPazAAubSl5OMY
         Oq9R5IHWL7sq+nZciIuTQNS+l4sqpzJ/e0fSR3A52asRaybC/rTNIqLrHghuGt7e/Z45
         XQEJhIF8VbllKlPpeonRnRf0/wo6eJhHviBuQHQuHBA0YksouVy0ua4urtISgImi9aw/
         5H3A9fGtAyrYsGjm7BOM7gCsSUEr/nnKb29kmgV7ZV0Hizwsyi92yEhcEd7csabYLg68
         II7hZ0Jzo120jLAW5iVF1Bg4YuAuA1TdsypXjN+50ocW8iZw3g7Fp7PSOu0E4mtjRCtH
         fDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741274790; x=1741879590;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iIFvuaqHhFntvQlpRTIvoKjIOarKQMOq9Ag0pcr/34A=;
        b=N/oiFS3c1YTNwZ85a17vy0Q3JVppnUE2xaGhO3a9ElEdPk2CE6uGBuWBwjSjHbU5sq
         phECv6wSUk4nWdOlLAhzX7EHao+iC/sj2AmCyXULbhG1326TR41b02PRzMswNm21VFx8
         xbv0SK4RRyzDHjVFXHngIcwRqh0uGHUSnBoYBs9pVrO3HZDFfnUdUm5LO3ZX7aPiP6DW
         b5q47y7LH6qGpICJrmhNnMZkOt2bX3taOVLzVZazfzkgc3WNn9tp6qwtlKY9yLCqnD+3
         MTUwN7JkEfoXzUdKYU8iFqmN4cp1OIisFT1c4Ku2CgjN7dAeWGrM0q4iYSkhxYmC4Kfd
         yN4g==
X-Gm-Message-State: AOJu0Ywvov84tIJYW8+OicWp05POD7l3oRO89lFtQhJTA+5JQNhPC21x
	V9ZFzDp4f7iPIbXN51xU1DHp1x1HQAbsNHg/xay5IFFSXf1FdgCipQiBtZeZy6A=
X-Gm-Gg: ASbGncsyLvKytWO3q0Lx5bgAwrUqfLKgb4yNvXAI10Iba/H3awz8bPpJfJtFbxzmMZy
	scbGmyFw+vjhiTN04YzNGwXPqqEFlNsYdNEA+dZKNez39jOyGnJxq96lawYdp+udI5flulnRvxl
	tIJTCIYnkLfUX0HoEKY9Qzt9OnJ60t1aeeE3CYYneNt7PZeydLKkDt8GDLA6HNc6zIUqt3M/cJi
	Wxtzb2mzC7q4VXu1JrtEtffJB9SUwaPlM3ABDuJhBBHud2rR53A4zuRn6kcc3fucaefv9sdlTpT
	hrLxRhWSLaUZYOAKjxsja/5wqwxZrcFZvg03a60+FdaMwgO3
X-Google-Smtp-Source: AGHT+IH0jkdkKlxaqF3wkqHwudjs10mK4wes1NDX4QS5VUliT9VayRAZEVO93js8rAurkPGvYT2syQ==
X-Received: by 2002:a05:6402:234a:b0:5d0:8197:7ab3 with SMTP id 4fb4d7f45d1cf-5e59f353369mr8529169a12.3.1741274790139;
        Thu, 06 Mar 2025 07:26:30 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c766a5bcsm1078630a12.52.2025.03.06.07.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 07:26:29 -0800 (PST)
Message-ID: <ac831e724393dd928d3e62a4cfe2d9d30af7a081.camel@linaro.org>
Subject: Re: [PATCH v2 4/4] pinctrl: samsung: Add filter selection support
 for alive bank on gs101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Thu, 06 Mar 2025 15:26:28 +0000
In-Reply-To: <20250301-pinctrl-fltcon-suspend-v2-4-a7eef9bb443b@linaro.org>
References: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
	 <20250301-pinctrl-fltcon-suspend-v2-4-a7eef9bb443b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_072632_149607_93410D6E 
X-CRM114-Status: GOOD (  30.18  )
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
> Newer Exynos based SoCs have a filter selection bitfield in the filter
> configuration registers on alive bank pins. This allows the selection of
> a digital or analog delay filter for each pin. Add support for selecting
> and enabling the filter.
>=20
> On suspend we set the analog filter to all pins in the bank (as the
> digital filter relies on a clock). On resume the digital filter is
> reapplied to all pins in the bank. The digital filter is working via
> a clock and has an adjustable filter delay flt_width bitfield, whereas
> the analog filter uses a fixed delay.
>=20
> The filter determines to what extent signal fluctuations received through
> the pad are considered glitches.
>=20
> The code path can be exercised using
> echo mem > /sys/power/state
> And then wake the device using a eint gpio
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>=20
> Changes since v1:
> * Remove eint_flt_selectable bool as it can be deduced from EINT_TYPE_WKU=
P (Peter)
> * Move filter config comment to header (Andre)
> * Rename EXYNOS_FLTCON_DELAY to EXYNOS_FLTCON_ANALOG (Andre)
> * Remove misleading old comment (Andre)
> * Refactor exynos_eint_update_flt_reg() into a loop (Andre)
>=20
> Note: this patch was previously sent as part of the initial gs101/ Pixel =
6
> series and was dropped in v6. This new version incorporates the review
> feedback from Sam Protsenko here in v5.
>=20
> Link: https://lore.kernel.org/all/20231201160925.3136868-1-peter.griffin@=
linaro.org/T/#m79ced98939e895c840d812c8b4c2b3f33ce604c8
>=20
> Changes since previous version
> * Drop fltcon_type enum and use bool eint_flt_selectable (Sam)
> * Refactor and add exynos_eint_update_flt_reg() (Sam)
> * Rename function to exynos_eint_set_filter() for easier readability (Sam=
)
> * Remove comments and `if bank->fltcon_type !=3D FLT_DEFAULT)` checks and=
 indentation (Sam)
> ---
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c | 35 +++++++++++++++++++++=
+++++++++++
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.h | 21 +++++++++++++++++++
> =C2=A02 files changed, 56 insertions(+)
>=20
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/s=
amsung/pinctrl-exynos.c
> index ddc7245ec2e5..4c467651b034 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -369,6 +369,39 @@ struct exynos_eint_gpio_save {
> =C2=A0	u32 eint_mask;
> =C2=A0};
> =C2=A0
> +static void exynos_eint_update_flt_reg(void __iomem *reg, int cnt, int c=
on)
> +{
> +	unsigned int val, shift;
> +	int i;
> +
> +	val =3D readl(reg);
> +	for (i =3D 0; i < cnt; i++) {
> +		shift =3D i * EXYNOS_FLTCON_LEN;
> +		val |=3D con << shift;

EXYNOS_FLTCON_ANALOG =3D=3D 0, so this code still needs to clear
bit 6 to undo a previous enabling of digital filter:

    val &=3D ~(EXYNOS_FLTCON_DIGITAL << shift);
    val |=3D con << shift;


> +	}
> +	writel(val, reg);
> +}
> +
> +/*
> + * Set the desired filter (digital or analog delay) and enable it to
> + * every pin in the bank. Note the filter selection bitfield is only
> + * found on alive banks. The filter determines to what extent signal
> + * fluctuations received through the pad are considered glitches.
> + */
> +static void exynos_eint_set_filter(struct samsung_pin_bank *bank, int fi=
lter)
> +{
> +	unsigned int off =3D EXYNOS_GPIO_EFLTCON_OFFSET + bank->eint_fltcon_off=
set;
> +	void __iomem *reg =3D bank->drvdata->virt_base + off;
> +	unsigned int con =3D EXYNOS_FLTCON_EN | filter;
> +
> +	if (bank->eint_type !=3D EINT_TYPE_WKUP)
> +		return;
> +
> +	for (int n =3D 0; n < bank->nr_pins; n +=3D 4)
> +		exynos_eint_update_flt_reg(reg + n,
> +					=C2=A0=C2=A0 min(bank->nr_pins - n, 4), con);
> +}
> +
> =C2=A0/*
> =C2=A0 * exynos_eint_gpio_init() - setup handling of external gpio interr=
upts.
> =C2=A0 * @d: driver data of samsung pinctrl driver.
> @@ -834,6 +867,7 @@ void gs101_pinctrl_suspend(struct samsung_pin_bank *b=
ank)
> =C2=A0		pr_debug("%s: save=C2=A0=C2=A0=C2=A0 mask %#010x\n",
> =C2=A0			 bank->name, save->eint_mask);
> =C2=A0	}
> +	exynos_eint_set_filter(bank, EXYNOS_FLTCON_ANALOG);

Similar to patch 2, might be nicer to have this all if / else if to
make it more obvious that set_filter() is not unconditional.


> =C2=A0}
> =C2=A0
> =C2=A0void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
> @@ -889,6 +923,7 @@ void gs101_pinctrl_resume(struct samsung_pin_bank *ba=
nk)
> =C2=A0		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> =C2=A0	}
> +	exynos_eint_set_filter(bank, EXYNOS_FLTCON_DIGITAL);

dito.

Cheers,
Andre'

> =C2=A0}
> =C2=A0
> =C2=A0void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/s=
amsung/pinctrl-exynos.h
> index 773f161a82a3..203d4b76a956 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -52,6 +52,27 @@
> =C2=A0#define EXYNOS_EINT_MAX_PER_BANK	8
> =C2=A0#define EXYNOS_EINT_NR_WKUP_EINT
> =C2=A0
> +/*
> + * EINT filter configuration register (on alive banks) has
> + * the following layout.
> + *
> + * BitfieldName[PinNum][Bit:Bit]
> + * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
> + * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
> + * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
> + * FLT_EN[0][7]=C2=A0 FLT_SEL[0][6]=C2=A0 FLT_WIDTH[0][5:0]
> + *
> + * FLT_EN	0x0 =3D Disable, 0x1=3DEnable
> + * FLT_SEL	0x0 =3D Analog delay filter, 0x1 Digital filter (clock count)
> + * FLT_WIDTH	Filtering width. Valid when FLT_SEL is 0x1
> + */
> +
> +#define EXYNOS_FLTCON_EN		BIT(7)
> +#define EXYNOS_FLTCON_DIGITAL		BIT(6)
> +#define EXYNOS_FLTCON_ANALOG		(0 << 6)
> +#define EXYNOS_FLTCON_MASK		GENMASK(7, 0)
> +#define EXYNOS_FLTCON_LEN		8
> +
> =C2=A0#define EXYNOS_PIN_BANK_EINTN(pins, reg, id)		\
> =C2=A0	{						\
> =C2=A0		.type		=3D &bank_type_off,	\
>=20


