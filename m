Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516DACD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 11:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qh57ithdNaKLyKzJTn+bCZN9e6uxSJT+tkkVV1Puba8=; b=v5ihBmAzZIH/2FFmKfcn1kfYVY
	K7rV7Q3qqyIxn1r6gHEDY6ZvYP41KxzAwrNLCsLuH+uQUJBDqjIxzZuWocxeuChCiAGqcBMccvUYu
	VMnG1aTLUBwEHfCHw5fxuyFYUvWKnyB9kVqA7p+xCHn3Fu16IW6VkXcJTmB2EDolsS9CPE01F7KUk
	ylFV8ZvloYjq7oQbOK+H6LpVT8HtTsz/rka/2PDxjkWdngv/BgDcRJlqcBg4zdfMhOVNNDjzlt6Xd
	JQd48lajwe6UbdcZKXUf4tWk3ZbNOQYRNoJIeYzjOdA24w6XhQfIAnbde1Le0gUh+XdakEDzAKa4m
	zkDGbLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuzr-00000005TKG-2iD3;
	Tue, 09 Jun 2026 11:51:55 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuzo-00000005TIv-2a5C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 11:51:53 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-befd83e0521so1158016266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 04:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781005911; x=1781610711; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qh57ithdNaKLyKzJTn+bCZN9e6uxSJT+tkkVV1Puba8=;
        b=KIXyTLPGKvcrbOsGh50LRxejVVOYatuRvkP22yEFNIYH1T+Gpfr6Mjz9S0zb1nKiS3
         /WaSAGPiMMD98juNrhOV87GMyHuLFL9HrEsZkiPNghlJEyCQT3jq8gmCgik1Yp5a14qK
         ayvzq84czWZDuF67Zn53nAJeZKym7/a76L/njRkroHOHntPiQiLjrZUvcPVo9JNUz7Z1
         NyciLbzmXIZBNJOy0dT6fP307bX2u/XntJCDAyvdXUnCVrQczEjD7cnV5K54CtzjsNCS
         qUc96/hsBy2ceEe/HjvXULKO0Tx0M5enj6cQJ59toy81wo+Wye/8GxRj73SHy/AdXVLx
         WBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005911; x=1781610711;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh57ithdNaKLyKzJTn+bCZN9e6uxSJT+tkkVV1Puba8=;
        b=Ek92Ir4sPzG0uGBYg8hfEZpEm/KQ1tcxm130fzhsy7q6wFTdLqUyNF/kWkW9AiHQEi
         PMHh/MIxL4MmCUhppEGwPIkN4iOXdSTTZ7r28hHfN8P79w1PTDv70L6MTeQ4gmhMyerB
         uodBzTp3cp1sWoiYb7C8i9EWbP83lnT6uPpdFkhveN93zKcRaqW6bae9zFYQViuAqPIZ
         QIAs1l8j5iYBUSr4eKI5KrnmLCDz4L8eAE9ceJiM2WoA04TbF+ImtK5RugTGUALuKQS9
         KaOtKW8WVk/C388Mm4yH9WmLz7G619CZAAWslLqyFFDVfEnhq8iOvriE1U6nYPMnh/hP
         vW8w==
X-Forwarded-Encrypted: i=1; AFNElJ8Odg3bj01hmat6v9Qvaqw9dx6N8z3AiRJhFCM1m3LrJJRz0SeMdloopIC4M7uAx3cySAjaZ2kmGKVKQE8kUOOI@lists.infradead.org
X-Gm-Message-State: AOJu0YzKReX1mdkeN7woKa7AWlM957lYGQy7SQmzC1wD5CaK9JTZdYsP
	ZqqttdKVT5bQtkRr0tJMA/OHqV74CMQGRpTwUC0rH0inBubpoczxGX+jbmMvSqEER3k=
X-Gm-Gg: Acq92OGeaxA3j8/iHJ9+7Xza6VVhDu0cHJsSsooqN42j7RXrJ05ckdMZw9DB5eO8WGm
	4bZJ19eP0ERDxcBEIZQQ/Gkhf5sTdjsDDWJCvlpUWLcQCX7S/D4gfzGJL1GDMzbkK7aDd9q06HX
	xEMNA98uMETCw6oGSHZl29O4ynU76YL8mT/t3fXcFUYX2WjweIkkO0tFcos6N5sZDXZlpenGrrj
	v68jyF/UXwWtH0Ng9vPMQo3wTMNeux+d1jNuKUl7xd3nFN+VXLp2s1ku81cdyhnA4m+v31GVJix
	0TDHgsuf3qzw6XhnYnfIZvnBgW9LeQMm9FI4sBZOnXrMHHCGUtYEsXR+2oOpXdeqBmRwGH0RUYM
	CxPMDVKE0gjMCNZ5OwdNgc+5/XeciLO0yw17dDY17/x0+Z8jNKxLLlmSJMjbavB6nUFIIcR9Kd+
	eod+eeSUBnvTFdYW1ttRjcFuUcMJ2bUuUbjyD03pehpp12
X-Received: by 2002:a17:906:5a69:b0:bc5:2352:555c with SMTP id a640c23a62f3a-bf3a841c5c1mr624677366b.14.1781005910578;
        Tue, 09 Jun 2026 04:51:50 -0700 (PDT)
Received: from [192.168.107.26] ([80.233.69.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553fd86csm1037260966b.46.2026.06.09.04.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:51:50 -0700 (PDT)
Message-ID: <5d6f1195a7ba54d41063b44d3907b7a22f620ae5.camel@linaro.org>
Subject: Re: [PATCH v8 2/5] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"	
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui	
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski	 <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva"	 <gustavoars@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 12:51:47 +0100
In-Reply-To: <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
	 <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_045152_679863_C328780D 
X-CRM114-Status: GOOD (  19.57  )
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

On Wed, 2026-06-03 at 13:00 +0000, Tudor Ambarus wrote:
> Add driver for the Thermal Management Unit (TMU) managed via the Alive
> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
> the Google GS101.
>=20
> The TMU on the GS101 utilizes a hybrid management model shared between
> the Application Processor (AP) and the ACPM firmware. The driver
> maintains direct memory-mapped access to the TMU interrupt pending
> registers to identify thermal events, while delegating functional
> tasks - such as sensor initialization, threshold configuration, and
> temperature acquisition, to the ACPM firmware via the ACPM IPC
> protocol.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0drivers/thermal/samsung/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=A0 19 ++
> =C2=A0drivers/thermal/samsung/Makefile=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/thermal/samsung/acpm-tmu.c | 651 ++++++++++++++++++++++++++=
+++++++++++
> =C2=A03 files changed, 672 insertions(+)
>=20
> diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kc=
onfig
> index f4eff5a41a84..bf9fb52e848e 100644
> --- a/drivers/thermal/samsung/Kconfig
> +++ b/drivers/thermal/samsung/Kconfig
> @@ -9,3 +9,22 @@ config EXYNOS_THERMAL
> =C2=A0	=C2=A0 the TMU, reports temperature and handles cooling action if =
defined.
> =C2=A0	=C2=A0 This driver uses the Exynos core thermal APIs and TMU confi=
guration
> =C2=A0	=C2=A0 data from the supported SoCs.
> +
> +config EXYNOS_ACPM_THERMAL
> +	tristate "Exynos ACPM thermal management unit driver"
> +	depends on THERMAL_OF
> +	depends on HAS_IOMEM
> +	depends on EXYNOS_ACPM_PROTOCOL
> +	default ARCH_EXYNOS
> +	help
> +	=C2=A0 Support for the Thermal Management Unit (TMU) on Samsung Exynos =
SoCs
> +	=C2=A0 utilizing the ACPM IPC protocol, such as the Google GS101.
> +
> +	=C2=A0 The TMU on these platforms is managed through a hybrid architect=
ure.
> +	=C2=A0 This driver handles direct register access for thermal interrupt=
 status
> +	=C2=A0 monitoring and communicates with the Alive Clock and Power Manag=
er
> +	=C2=A0 (ACPM) firmware via the ACPM IPC protocol for functional sensor =
control
> +	=C2=A0 and configuration.
> +
> +	=C2=A0 Select this if you want to monitor device temperature and enable
> +	=C2=A0 thermal mitigation on Samsung Exynos ACPM based devices.

If you're sending a new version, it might make sense to add a brief
clarification to the existing CONFIG_EXYNOS_THERMAL in that it only
supports (the older?) non-ACPM designs.

In any case:
Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

