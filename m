Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE2DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 12:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJAViX7/B9WZe7f1Z9+bJz1YrkYOWWpEGINZC+5C01E=; b=JcCGeKudxMUFA/47y0zBozemrg
	x0O6ubIlPjLPHwur/1b+9zd2sd54dRunVP6vBYe6WoK55HRCPP5uESI1HhJ9Rt3iXvPmL8S99Sb3X
	TpIc7JVtCZV2Br2sxgKD2GJIg3gMRW7fv+Q33mxTAFYM6gkiTFVtwmVqDYZvZ9DU3TVwD19oQEBVo
	ti4LrcK8O2RzTYovX1y5Y/RaKy6m598JHqbpEqs8D6giD0WfmU4sac91MUx9lKujsTJgOHRU3qe0N
	eoufhMHATwn4BaLvEooPkdxH7+k5GA6m8PCA77wxvw62UQzatLON8ScGogaNbntm6NJwgsIDvYmlc
	YVhQf7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDibY-0000000Fu2U-1WHW;
	Tue, 28 Oct 2025 12:15:12 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDibW-0000000Fu1Y-0gSy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 12:15:11 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-3637d6e9923so56693601fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 05:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761653708; x=1762258508; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YJAViX7/B9WZe7f1Z9+bJz1YrkYOWWpEGINZC+5C01E=;
        b=V5O8TvZ6aUBpNZlAyCJ+vUauy/OB0Ccm6pCaXyNbDMeeVwsNfDGrantHZRlO5Xf10C
         1fnIaoHp3LAE88eMRua7h/TE7k9F1sP3F5HkfwH8xEgiS0fCbMm/gLDHFkx33VCGfuHm
         Km2D8n5MERq6DhQdeP3D9kAweB0MheKjs1rY+LoBwTJgg2a9Qd2QMG7do0fBuTrmvhjn
         76ABOU20GfxL/+1YtW50OyYkQVAQw9nkee+oILm5VBbRsmUcnT7xCk1ZdIurcLov36bX
         q58yiU9ODfbQkntSmI2gv8l1+huyN6sr1Qi2KBkTmu9gNrkhiDroF/7BV1c6QDyHdO/m
         hDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761653708; x=1762258508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJAViX7/B9WZe7f1Z9+bJz1YrkYOWWpEGINZC+5C01E=;
        b=bvrXSUG+o52DjCo21utzrCAzf54UKpEFQZ2AN1UXGIyFobK4Q4isONDDoDyyKyOrc4
         vkMADKmZQwp+/BSMXA6FI4isrwXf7QaAdKPw7hQqOgm4z1Ky8E9jGBl0ZVs0eCYCDhvm
         +Vf8Wo7MBon89E5gZJjiEbovGCy7HwycV7GkHaLqfyqdSpSkAGGYxiIjT1G/YegleeQO
         iwJ9qE/n9VEuS/DqYMKbMnQa3/fnVZskONqS+F+lW83/aslHfUfRh0hTx1J5lTG4IV9L
         PBod10lETCEfKcWOvr4dPSOTb6HzHXR7OIJTQ2O2K8Z1EsTSit6+SM7LTtPCqplCXJQ7
         DdyA==
X-Forwarded-Encrypted: i=1; AJvYcCXEs9R/Y8n4YD9JYRSSiWiSoDCs2FYgwgxo+CmU1BM/dtjLUr5AtgoxRe+l2S322QkhbqsqoURFfC9o5tw1sLOu@lists.infradead.org
X-Gm-Message-State: AOJu0YzMjZHibuLeoZBX5UwfnlRWyaJSC0dFlt/xBbOb0ydCrCZDh8YL
	u+8OtQoSkeRoUTfjpkpsq7P19wnHOtgeUZcV/la9Tc32zmkZEScs51D7
X-Gm-Gg: ASbGncvgKVMxfAHMveKoHqMaDe0SGfSAtpU6XwQHvoUqvjt2Am+McKabOk6sFA/K5Zn
	Z0mgLoFFU9CTmu6ZcvnuW4mW4IoFuKBIZlE8ZpewYEBhoEWO4062sg82jg3fXaL/NC61QYCUHlx
	7kg16f5nKJpnXyS1m5pboJnhgwZeNoBqdbquxnybBWapxywGERYpCWl2Pwx0vQ9XeUZC+vQB0ge
	w7z8DEPGhrYT5k/dVIeSayaVpv729GzMwOVi9KlRSgvbkeX94p7iDpRgxCb8ncDpdpS8l8FpUNZ
	SmebUKYmIdM00oYo01Yue3LKs9KSvZU5whu75Mj1KSOTPez/XXhbZQMLC4/qN5l2XeOnNv97Evu
	lqL/MtlKU0ailexlxuCv39Upnx+bnseHN1oS3HbakCSoWHixZj8cn4Ey6DdK7A/kke2yRiYD2nq
	IMotdzayUqDwqFBQ0O6WeikIZ65Iotyn2zl7M76XYCIBTzbfReGUPwKzbW0w==
X-Google-Smtp-Source: AGHT+IFB+EXEALL0lVPB7zL+t0ISwe5rbBYFS+A45wiTOhrUz5I795qhcCG4TnO4o8BABiT+ozftyw==
X-Received: by 2002:a05:651c:20cb:20b0:378:ddbe:2d95 with SMTP id 38308e7fff4ca-379076c11aemr8817671fa.20.1761653707262;
        Tue, 28 Oct 2025 05:15:07 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09204esm28490401fa.8.2025.10.28.05.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 05:15:06 -0700 (PDT)
Message-ID: <a7012995-c2a8-48a3-abe1-5c227272f21c@gmail.com>
Date: Tue, 28 Oct 2025 14:15:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
To: maudspierings@gocontroll.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
 <20251022-mini_iv-v2-3-20af8f9aac14@gocontroll.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251022-mini_iv-v2-3-20af8f9aac14@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_051510_233196_D5A46A1E 
X-CRM114-Status: GOOD (  20.84  )
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

Hi Maud,

Thanks for the upstreaming work! :)

On 22/10/2025 10:22, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> The Ka-Ro Electronics tx8m-1610 is a COM based on the imx8mm SOC. It has
> 1 GB of ram and 4 GB of eMMC storage on board.
> 
> Add it to enable boards based on this module
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>   .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi | 439 +++++++++++++++++++++
>   1 file changed, 439 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi
> new file mode 100644
> index 0000000000000..46d3ad80942cc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi
> @@ -0,0 +1,439 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 Lothar Waßmann <LW@KARO-electronics.de>
> + * 2025 Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +#include "imx8mm.dtsi"
> +

// snip

> +	pmic: pmic@4b {
> +		compatible = "rohm,bd71847";
> +		reg = <0x4b>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&pinctrl_pmic>;
> +		pinctrl-names = "default";
> +		rohm,reset-snvs-powered;
> +
> +		regulators {
> +			reg_vdd_soc: BUCK1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <900000>;
> +				regulator-min-microvolt = <780000>;
> +				regulator-name = "buck1";
> +				regulator-ramp-delay = <1250>;
> +			};
> +
> +			reg_vdd_arm: BUCK2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <950000>;
> +				regulator-min-microvolt = <805000>;
> +				regulator-name = "buck2";
> +				regulator-ramp-delay = <1250>;
> +				rohm,dvs-run-voltage = <950000>;
> +				rohm,dvs-idle-voltage = <810000>;
> +			};
> +
> +			reg_vdd_dram: BUCK3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <900000>;
> +				regulator-min-microvolt = <805000>;
> +				regulator-name = "buck3";
> +			};
> +
> +			reg_vdd_3v3: BUCK4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-name = "buck4";
> +			};
> +
> +			reg_vdd_1v8: BUCK5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1950000>;
> +				regulator-min-microvolt = <1700000>;
> +				regulator-name = "buck5";
> +			};
> +
> +			BUCK6 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				/*
> +				 * The default output voltage is 1.1V, bumped
> +				 * to 1.35V in HW by a 499R/2.2K voltage divider in the
> +				 * feedback path.
> +				 */

Could/Should this be described using the:
'rohm,feedback-pull-up-r1-ohms' and
'rohm,feedback-pull-up-r2-ohms'? If I understand the comment correctly, 
that might allow the driver to be able to use correctly scaled voltages.

https://elixir.bootlin.com/linux/v6.18-rc1/source/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.yaml#L108

> +				regulator-max-microvolt = <1100000>;
> +				regulator-min-microvolt = <1100000>;
> +				regulator-name = "buck6";
> +			};

Yours,
	-- Matti

