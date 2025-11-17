Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E87CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 13:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyfJuWLf/bqMX1u24r/U8Bs+x3WIyoG2lBJPEBmrdOU=; b=PO92gUpV0nSyL3dlVssT/O/QhJ
	ItMBjmEL/94R6EuMiW+xbZYeQoMnhjky6jAvgoe8vjTR2d28uV3byVWiaehtfOXR/c0pXhQx1jjxP
	/9ogYg/lOx9QZedWYupd2NY1BvRBW6xOUKAvjSauvHsq+9B40fVt0k6vBcFXl6Ja3T/alWibwVU6p
	33JuF2e5yEulJiq3g38oDr6GAO2Ie9Z33TnV9At487GJaJ67kP85Prm5JSrJ5v2VbE0VY+rHwZfZR
	xA7M6b3jhtf3XYYk9Tx7OfqLtKlmsfmE0ZjatIyVXSoNkOj1iZXTLOSBxwEwyoT0M5GR4As7us+df
	5g5jS9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzVC-0000000GCkM-4AzQ;
	Mon, 17 Nov 2025 13:42:42 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzVA-0000000GCjo-1Twh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 13:42:41 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-64312565c10so6459006a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 05:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763386958; x=1763991758; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dyfJuWLf/bqMX1u24r/U8Bs+x3WIyoG2lBJPEBmrdOU=;
        b=YUsE6IKObH5jJCE4WTXK7MCnjrplEWaP2YdOJifGNgsuMJwr3oi/W57oxAS2odkfTc
         Xw3wclw7Dh59zezHwRrhBrA0nc6FyIWfYKU24GwxJDBcod3qe1H0Zn7KVeeA02GjaWt9
         vfiD3w3zLWAYRHNgKXrFSs9pGkBvsI58pBpOCYZl+i8YsnjbphS4b7ibZbR9TxEurIwO
         5FEZKlbuHjJWFzYT4fLtFJbHsKRpotkF5+rH98jzqCYbEaI+ZYceQ0Yq2EsPfAKJ/F93
         mPKm16GMAEgsunLfKst/3YormZiMKBnDlKwxp78XjvWdt6fNvsxelguRVMqjc9rqSMlJ
         XOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763386958; x=1763991758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyfJuWLf/bqMX1u24r/U8Bs+x3WIyoG2lBJPEBmrdOU=;
        b=WXljaF4uXYdMeESvYAY7Iwy9fDjRWjMIkRzWYZkyoGMNMG3IfWcWu6Gq4r2xbjpUo6
         PWLN9js9cF1jzGR7cT99nq8TRE8oRgdyc7dINsOkvsgHAjwzrqMnzsFFouHQQnKd29JE
         Lm1xKrnp0JjYm2mln7HSVVoubZO7u4f3lzFa2NX7dfKX23SOZq57+dBTrVrFlM/Tfd1w
         TUQxpMKFUk7wFdd4/Y7TTnx3sf5y3BCjyiw8TkMYagQh6LEQunIzwZt55g1E6Gj30baN
         QpmHVutRw6kCLJsyJQO0lneEdQ+Ir/xThw41cCibMDQdOqOo1Uif9mUDFpFvFWpGxFHI
         2glg==
X-Forwarded-Encrypted: i=1; AJvYcCUeMMEMz7v4KElh4RFfi2eICI4iVgbPlfLDzcxjQkJLb2mW02PoJhHcVdLKUQHaYEebrvRVvVeONbCn5tL021mh@lists.infradead.org
X-Gm-Message-State: AOJu0YzJyGAh4mz07589yThh16V5YkkIMNuvIGlgE4zNbpVzqTTmLWJL
	sFZXgQJZ49WMfqqErRGFqlCq43hsFAm+q23x/Kw6bEUvbWQ9TbW283l8
X-Gm-Gg: ASbGncuVpqYAFczwdrOE711c3hQEvUMHM5Sk0ngmIGClMxgOSa5dFVkWic74Suz1RU/
	74hr3H28Z9ymaVCh2XfCt7ijx57qCP0lrK5CRXk5LB/L45REehFWi3cuewyGf0BePGtz9IGG0dd
	IU0yKjoIOBrChxQYzmW6BPhX1kSZcTaZeOLjP0uBYW95PtKHZ3MADDmn9RNh2mR0KqNVuo3c24S
	PxoAojyi9P4CcWurLiHaHnbOlp/sEaCad5189tkANm05EbCnXOJ021b8vBPT8Ga6tjlmCy0h9+M
	Wir1CNohyIGAkbFiT1Z4J47u6Rm/829mgJFZ97BV9LLyw9c4xcKAoc6mC9QLWZe7hguzoBX27zM
	/TMUNpbGaUSd9Cjyofc1TgVqYw6O1tv1BG8AajkYhkVY0IiMjQTZr0sn8AEGjfLcLYBH64nmvqB
	6pQo+GzIxRajTJUNQchQL80JU7l7TX80a1me/LnxhnZtrzU1w42CEPuA==
X-Google-Smtp-Source: AGHT+IFnA5p6VJ7v16pDk70y3Vr1baROyHyJjL+VaSJ2PY/KT68euuo6fGAWZdzMV7Ygf3aTKhxMTw==
X-Received: by 2002:a17:906:c107:b0:b6d:7288:973d with SMTP id a640c23a62f3a-b736795bf68mr1349907366b.56.1763386957491;
        Mon, 17 Nov 2025 05:42:37 -0800 (PST)
Received: from [192.168.1.101] (79-100-30-217.ip.btc-net.bg. [79.100.30.217])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd8084csm1065257166b.34.2025.11.17.05.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:42:36 -0800 (PST)
Message-ID: <15549ffd-9ae6-428a-a9b0-73676fc252fa@gmail.com>
Date: Mon, 17 Nov 2025 15:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2 2/5] pinctrl: samsung: fix incorrect pin-bank
 entries on Exynos2200/7885/8890/8895
To: Youngmin Nam <youngmin.nam@samsung.com>, krzk@kernel.org,
 s.nawrocki@samsung.com, alim.akhtar@samsung.com, linus.walleij@linaro.org,
 peter.griffin@linaro.org, semen.protsenko@linaro.org
Cc: ryu.real@samsung.com, d7271.choe@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117074140.4090939-1-youngmin.nam@samsung.com>
 <CGME20251117073603epcas2p1366028012403591bd297764f91694181@epcas2p1.samsung.com>
 <20251117074140.4090939-3-youngmin.nam@samsung.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20251117074140.4090939-3-youngmin.nam@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_054240_446024_2C6DFA6A 
X-CRM114-Status: GOOD (  20.24  )
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

On 11/17/25 09:41, Youngmin Nam wrote:
> This patch corrects wrong pin bank table definitions for 4 SoCs based on
> their TRMs.
> 
> Exynos2200
> - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
>   'bank_type_off' layout (.fld_width = {4,1,2,2,2,2}).
> - Per the SoC TRM these banks must use the 'alive' layout
>   (.fld_width = {4,1,4,4}).
> - Switch them to EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).
> 
> Exynos7885
> - etc0, etc1: update bank type to match the SoC TRM.
> - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingly.
> 
> Exynos8890
> - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
>   a non-external interrupt bank.

Interesting, so there are disparities between vendor kernel drivers and
TRM?

> - gpi1, gpi2: update bank type to match the SoC TRM.
>   exynos8895_bank_type_off (.fld_width = {4,1,2,3,2,2}) ->
>   exynos5433_bank_type_off (.fld_width = {4,1,2,4,2,2})
Vendor kernel [1] points to these being bank_type_4 (4, 1, 2, 3, 2, 2)

[1] https://github.com/ananjaser1211/Cronos_8890/blob/0460c258d6910628410263dc838a81be8bda6776/drivers/pinctrl/samsung/pinctrl-exynos.c#L1281C24-L1281C35

> - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
> - apply lower case style for hex numbers.
> 
> Exynos8895
> - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
>   change EINTW -> EINTN. (The bank_type itself was correct and is kept
>   unchanged.)

Also differs here [2]

[2] https://github.com/Neternels/exynos8895_kernel/blob/5eb1b4159bc466602e7634b1f7a4f471f4c027e2/drivers/pinctrl/samsung/pinctrl-exynos.c#L1799

> - apply lower case style for hex numbers.
> 
> This aligns the pin-bank tables with the documented bitfield layouts and
> wakeup domains. No DT/ABI change.

I suspect the changes are valid, unless trms also don't contain false
information. In any case, this makes me wonder if there are more
instances of such errors for older SoCs.

Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

> 
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>

I wonder, what was this tested on?

> ---
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 40 +++++++++----------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index d11b2d4ca913..b4a7d86b82fe 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -95,9 +95,9 @@ static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst =
>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", 0x08),
>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", 0x0c),
>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", 0x10),
> -	EXYNOS_PIN_BANK_EINTN(4, 0xa0, "gpq0"),
> -	EXYNOS_PIN_BANK_EINTN(2, 0xc0, "gpq1"),
> -	EXYNOS_PIN_BANK_EINTN(2, 0xe0, "gpq2"),
> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 4, 0xa0, "gpq0"),
> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xc0, "gpq1"),
> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xe0, "gpq2"),
>  };
>  
>  /* pin banks of exynos2200 pin-controller - CMGP */
> @@ -768,12 +768,12 @@ const struct samsung_pinctrl_of_match_data exynos7870_of_data __initconst = {
>  
>  /* pin banks of exynos7885 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __initconst = {
> -	EXYNOS_PIN_BANK_EINTN(3, 0x000, "etc0"),
> -	EXYNOS_PIN_BANK_EINTN(3, 0x020, "etc1"),
> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x000, "etc0"),
> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x020, "etc1"),
>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0", 0x00),
>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1", 0x04),
>  	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2", 0x08),
> -	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 5, 0x0a0, "gpq0", 0x0c),
> +	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 5, 0x0a0, "gpq0"),
>  };
>  
>  /* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
> @@ -1502,7 +1502,7 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __initconst =
>  /* pin banks of exynos8890 pin-controller 2 (CCORE) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __initconst = {
>  	/* Must start with EINTG banks, ordered by EINT group number. */
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "etc0", 0x00),
> +	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 2, 0x000, "gpb3"),
>  };
>  
>  /* pin banks of exynos8890 pin-controller 3 (ESE) */
> @@ -1520,8 +1520,8 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __initconst =
>  /* pin banks of exynos8890 pin-controller 5 (FSYS0) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __initconst = {
>  	/* Must start with EINTG banks, ordered by EINT group number. */
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpi1", 0x00),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi2", 0x04),
> +	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1", 0x00),
> +	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2", 0x04),
>  };
>  
>  /* pin banks of exynos8890 pin-controller 6 (FSYS1) */
> @@ -1544,15 +1544,15 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __initconst =
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x040, "gpd1", 0x08),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpd2", 0x0c),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x080, "gpd3", 0x10),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0A0, "gpb1", 0x14),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0C0, "gpb2", 0x18),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0E0, "gpb0", 0x1c),
> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0a0, "gpb1", 0x14),
> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpb2", 0x18),
> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0e0, "gpb0", 0x1c),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x100, "gpc0", 0x20),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x120, "gpc1", 0x24),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2", 0x28),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3", 0x2c),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0", 0x30),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x1A0, "etc1", 0x34),
> +	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 7, 0x1a0, "etc1"),
>  };
>  
>  /* pin banks of exynos8890 pin-controller 9 (PERIC1) */
> @@ -1563,9 +1563,9 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks9[] __initconst =
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x040, "gpe6", 0x08),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x060, "gpj1", 0x0c),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpj2", 0x10),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0A0, "gpe2", 0x14),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0C0, "gpe3", 0x18),
> -	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0E0, "gpe4", 0x1c),
> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0a0, "gpe2", 0x14),
> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0c0, "gpe3", 0x18),
> +	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0e0, "gpe4", 0x1c),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x100, "gpe1", 0x20),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x120, "gpe7", 0x24),
>  	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x140, "gpg0", 0x28),
> @@ -1647,7 +1647,7 @@ static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst =
>  	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04),
>  	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08),
>  	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c),
> -	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 7, 0x0a0, "gpa4", 0x24),
> +	EXYNOS9_PIN_BANK_EINTN(bank_type_alive, 7, 0x0a0, "gpa4"),
>  };
>  
>  /* pin banks of exynos8895 pin-controller 1 (ABOX) */
> @@ -1695,15 +1695,15 @@ static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __initconst =
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gpb0", 0x00),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x020, "gpc0", 0x04),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x040, "gpc1", 0x08),
> -	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0C),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0c),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x080, "gpc3", 0x10),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x0a0, "gpk0", 0x14),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpe5", 0x18),
> -	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1C),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1c),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x100, "gpe2", 0x20),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x120, "gpe3", 0x24),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x140, "gpe4", 0x28),
> -	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2C),
> +	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2c),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x180, "gpe1", 0x30),
>  	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x1a0, "gpg0", 0x34),
>  };

