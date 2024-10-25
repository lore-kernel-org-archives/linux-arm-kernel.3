Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4BED0C608
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IEBNygevkwQNZu1U5FyCKWkFfhzXCDi5dfAjhFS+xQ=; b=lG672ARgNtRTKR1HU/Aiw9sNkr
	AgvYfZ3r2ZPMMcTn38wSVw99RykpNhvMIcIpcjf5yatDYUZgPWty4UHJOeOdNgJLwIt0ow9/8qLH4
	oXcDxcEzp7NHqDoVAmjTgRazn4YIrZa/vpmXCzPgurA+Ns1J7RydEX1485loah+16Ypq+trW507gM
	Nce8SEZMUaDjOX4/RUmB0fuaz5kKWNgNvAnyFYEhIdyO10C/KKwQA9/ks/9cRRgv0hl4WZme556aH
	HFvTLXR9OcO2h027D3NPulbZqYCbTsC5OJJomt/DNZuUiIkjRShzvig8Z8aSD8d2GcbI0Jv8d4+IG
	Oq+/CEhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K5D-00000003lnH-0AZc;
	Fri, 25 Oct 2024 13:10:27 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JhP-00000003i1J-0mYz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 12:45:53 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a9a2cdc6f0cso273797566b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 05:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729860349; x=1730465149; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IEBNygevkwQNZu1U5FyCKWkFfhzXCDi5dfAjhFS+xQ=;
        b=cB0SAqOU2rdeHPFQc+HZCJAVfB2IeTco38ka2zg+r807Dbwje7q+qSeUzb/3zhmQLH
         5ZnOHlBSye9/OEzBqOCZX1Y+HBxqWv5rDeV3+HYU+LmbDXk1tkX8ZFHi8pL/Nk95dz76
         K1RjH60mJr3dIH3YkCjSITKlvvcGWp2UcrCPOlwNzLZyaGg46k9O9S2v4ZNiof5caY5s
         0f9/qJgz+1OW2tW+z+xFX2+nEVseHNKAodpdOeMCf+tlK/idhY8EY4biTUrVgwK+7XMI
         s5Zek5UUsAmmf9ln3OlvNErlqVCG7xwttk7Tg1h9Jh2hAT/msQ+6Gmg4drNF/7+ELSEn
         xM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729860349; x=1730465149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IEBNygevkwQNZu1U5FyCKWkFfhzXCDi5dfAjhFS+xQ=;
        b=NvC9yPE7uIs4yDIe499fpWVgD/biMzSoEK6Loum/4rlcut1KzQlH6PkJOaWZcfujkR
         CGmR9bQPLZr2CBUDLcFFkqk9E7JBBednfew5lL+OnPRaG85vuuiENY7pH/39jz0SseVS
         /x4xNXexFtZqgYQfJLL9d3hSOnJ/A9uZneOlIRNzjpzmn9i/8y0xHrSQmsb59HElv4IT
         rQsdyk4dBKES8cQcMephldhAKXQoesEGa0AuOfkU9By3K00By6Q8fY6lxYmWzQwCSGLV
         RUVL02ELefNL5msEgV9IyAmmz2jI03cYx+qdUgTu8qMxBe38iybROGMGYLgJiuHQo/L1
         uM+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFEWWZgSKjkiSXDQtuvCYW3glvQvivNAVwDFXUeOMJx5g/8q4rxMmydhZjJQc+WN2HmNjLxrWwxI/LIh6wmwEQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxMqowfLoIlGJq5IRRseyiVRFdycSk1vvZehsGBi7zVv//8EK6s
	g7VMIO+YSS5x3s0NQWnFccjVk7jpjPeolAEqdtR6CVt8hbnLusw9
X-Google-Smtp-Source: AGHT+IF3ox8PvDqMUukjKbUJTn9UxLimEb3hJAauNi1rSCh9lgU4OuiSITC4LEqMTkYTD82EWNkIlg==
X-Received: by 2002:a17:906:d54e:b0:a9a:38e6:2fdf with SMTP id a640c23a62f3a-a9abf96d1ffmr847883166b.64.1729860348617;
        Fri, 25 Oct 2024 05:45:48 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dec7feasm67337966b.38.2024.10.25.05.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 05:45:48 -0700 (PDT)
Message-ID: <c956e16b-8334-4988-9f8a-20b94f6e1668@gmail.com>
Date: Fri, 25 Oct 2024 15:45:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] pinctrl: samsung: Add Exynos9810 SoC specific
 data
To: Markuss Broks <markuss.broks@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maksym Holovach <nergzd@nergzd723.xyz>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
 <20241025-exynos9810-v2-10-99ca3f316e21@gmail.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-10-99ca3f316e21@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_054551_317405_54F839EE 
X-CRM114-Status: GOOD (  17.45  )
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




On 10/25/24 14:24, Markuss Broks wrote:
> Add Samsung Exynos9810 SoC specific data to enable pinctrl
> support for platforms based on Exynos9810.
>
> Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 154 +++++++++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c      |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h      |   1 +
>  3 files changed, 157 insertions(+)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index f07c26d374425505019447161150929f7677f91d..3ea7106ce5eae3c21f11790b5a40037042c1d407 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -767,6 +767,160 @@ const struct samsung_pinctrl_of_match_data exynos990_of_data __initconst = {
>  	.num_ctrl	= ARRAY_SIZE(exynos990_pin_ctrl),
>  };
>  
> +/* pin banks of exynos9810 pin-controller 0 (ALIVE) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks0[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTN(6, 0x000, "etc1"),
> +	EXYNOS850_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00),
> +	EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa1", 0x04),
> +	EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa2", 0x08),
> +	EXYNOS850_PIN_BANK_EINTW(8, 0x080, "gpa3", 0x0c),
> +	EXYNOS850_PIN_BANK_EINTN(6, 0x0A0, "gpq0"),
> +	EXYNOS850_PIN_BANK_EINTW(2, 0x0C0, "gpa4", 0x10),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 1 (AUD) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks1[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpb1", 0x04),
> +	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpb2", 0x08),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 2 (CHUB) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks2[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gph0", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(5, 0x020, "gph1", 0x04),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 3 (CMGP) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks3[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0C),

Small nit - for the next version,  stay consistent with the lowercase
letters in hex numbers - for ex.: 0x0c

Best regards, Ivo

> +	EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x14),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x18),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x1C),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm10", 0x20),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm11", 0x24),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm12", 0x28),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm13", 0x2C),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm14", 0x30),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x1A0, "gpm15", 0x34),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x1C0, "gpm16", 0x38),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x1E0, "gpm17", 0x3C),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm40", 0x40),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm41", 0x44),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm42", 0x48),
> +	EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm43", 0x4C),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 4 (FSYS0) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks4[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTG(2, 0x000, "gpf0", 0x00),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 5 (FSYS1) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks5[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTG(7, 0x000, "gpf1", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpf2", 0x04),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 6 (PERIC0) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks6[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp1", 0x04),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
> +	EXYNOS850_PIN_BANK_EINTG(4, 0x060, "gpp3", 0x0C),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg0", 0x10),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x0A0, "gpg1", 0x14),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x0C0, "gpg2", 0x18),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 7 (PERIC1) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks7[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp4", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp5", 0x04),
> +	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpp6", 0x08),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpc0", 0x0C),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpc1", 0x10),
> +	EXYNOS850_PIN_BANK_EINTG(4, 0x0A0, "gpd0", 0x14),
> +	EXYNOS850_PIN_BANK_EINTG(7, 0x0C0, "gpg3", 0x18),
> +};
> +
> +/* pin banks of exynos9810 pin-controller 8 (VTS) */
> +static const struct samsung_pin_bank_data exynos9810_pin_banks8[] __initconst = {
> +	EXYNOS850_PIN_BANK_EINTG(3, 0x000, "gpt0", 0x00),
> +};
> +
> +static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst = {
> +	{
> +		/* pin-controller instance 0 ALIVE data */
> +		.pin_banks      = exynos9810_pin_banks0,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks0),
> +		.eint_wkup_init = exynos_eint_wkup_init,
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 1 AUD data */
> +		.pin_banks      = exynos9810_pin_banks1,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks1),
> +	}, {
> +		/* pin-controller instance 2 CHUB data */
> +		.pin_banks      = exynos9810_pin_banks2,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks2),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 3 CMGP data */
> +		.pin_banks      = exynos9810_pin_banks3,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks3),
> +		.eint_wkup_init = exynos_eint_wkup_init,
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 4 FSYS0 data */
> +		.pin_banks      = exynos9810_pin_banks4,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks4),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 5 FSYS1 data */
> +		.pin_banks      = exynos9810_pin_banks5,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks5),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 6 PERIC0 data */
> +		.pin_banks      = exynos9810_pin_banks6,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks6),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 7 PERIC1 data */
> +		.pin_banks      = exynos9810_pin_banks7,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks7),
> +		.eint_gpio_init = exynos_eint_gpio_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 8 VTS data */
> +		.pin_banks      = exynos9810_pin_banks8,
> +		.nr_banks       = ARRAY_SIZE(exynos9810_pin_banks8),
> +	},
> +};
> +
> +const struct samsung_pinctrl_of_match_data exynos9810_of_data __initconst = {
> +	.ctrl		= exynos9810_pin_ctrl,
> +	.num_ctrl	= ARRAY_SIZE(exynos9810_pin_ctrl),
> +};
> +
>  /* pin banks of exynosautov9 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks0[] __initconst = {
>  	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index 42e40860841bcc94e3c11bf313df792da10ab00b..bbedd980ec67234aad847b757f40af5002b11ebb 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1479,6 +1479,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
>  		.data = &exynos850_of_data },
>  	{ .compatible = "samsung,exynos8895-pinctrl",
>  		.data = &exynos8895_of_data },
> +	{ .compatible = "samsung,exynos9810-pinctrl",
> +		.data = &exynos9810_of_data },
>  	{ .compatible = "samsung,exynos990-pinctrl",
>  		.data = &exynos990_of_data },
>  	{ .compatible = "samsung,exynosautov9-pinctrl",
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
> index 615048f945243d4173d40142f1e62c8aeefe5b7e..bb0689d52ea0b4392714fa9bcdcbae8d253c73a1 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -385,6 +385,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
> +extern const struct samsung_pinctrl_of_match_data exynos9810_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos990_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynosautov920_of_data;
>


