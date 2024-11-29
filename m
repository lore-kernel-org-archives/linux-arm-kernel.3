Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05263D70E03
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 01:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/u24g02F6G5dTmIgwmZ5N8zkALsWjGyEgUS5fL1byY=; b=ZaoYA1IilHGPJuSJfLoX7D9ciq
	E1BWePGDt/TXc1t+LjpqlN9h92ATpfr36AqNDJgt1bNhSH8Gfj6s86uYS+sJjI30hW31HD9RGOqCB
	RaNQiTXQQlIbw0ERrchPC3Odl9udlGVHs5bXuvD5ufexLOWc/24Y/s7v6seQKcBblJB3KXjp0VCup
	fBoNtWVNqMBiVd2YEEKkf7anJmItXkg803p6L7MFpI8V7RwWa02ZaPDBtLvRZkMXsbyjDGJwkyI6Q
	d+HxbIyi4L0y875/Zyeb6NhG5V0Qxme9whtLlYxWAGwyXWt1TY2famTLSC0sZm/LmGPNnQQn2cJb9
	Xt6zFftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGq9I-0000000GhPp-2q8Q;
	Fri, 29 Nov 2024 01:50:24 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGq8K-0000000GhIJ-0EYG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 01:49:25 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21527bb7eb0so7704125ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 17:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732844963; x=1733449763; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/u24g02F6G5dTmIgwmZ5N8zkALsWjGyEgUS5fL1byY=;
        b=f00VQb1EV4mH3AZh8akZhfvixrmLHToE8N/hPSYhytIHRMBJXqxYHu2wsK0aqrQ4rR
         gJbsdkSSMr4zolityK23EbccpVBjcIpWzusto7tycALK9zTCgkbK2Ryf2/wIbJpceY7F
         4ScBcmTKnZuxQ/XVhb6SPncHDFvKQjk/uV5xNLJlnQVwwgs+9Tzhzo1kgxHIeNl+uHFw
         FcUZEEZQLWpJpFf8AqxpOxUdbyoD000+RHkpx+7QA5CIowXGzQ2PkuQpao4UjjvLlnTL
         SPYNGMF2a/wOi0YV9P7jytJl3y8D9PpFddl4XF9RoGflJlnS6g+a872sRp8ELuv52nbb
         XuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732844963; x=1733449763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/u24g02F6G5dTmIgwmZ5N8zkALsWjGyEgUS5fL1byY=;
        b=KD+bcqE3ANboR5B5BB5ZHe277iqkiKAyeiZF0zLkVW8+SD2qhWntttePNvNy2BanUB
         ZBAtvF6oVVwnq3Z12PYTHOe+r5K0pT8fZwq1i++C5sbdi5djrszsTWmP25rowOgIlnjL
         rpO4JsVyzrpNWnZWacIPANU0RqTXzxRBBs+URcD4I6KR70Pc4B5yBmBcaeVa5plv77GP
         WToPSxivH3MtWrzPSYaNJijJyfr4NyEwXyZq/9uWuZCqDTq+rN+lDQ6vRxsa1eTi4lE5
         IIAxw0dCjpaMOS3XzH85BjQIPqLd5v63oWvgrLjcuRcxCyBEmtsPuDDwJtKH/XPJ/xFd
         vzxA==
X-Forwarded-Encrypted: i=1; AJvYcCWQDyj0s6g9yvbqbce5/nYH56OKVKTgV9tKjQsp5yQBQtyaf+WGxLb2XuGKIMvOtLA9k+mvhHHHH5DMenreE3wW@lists.infradead.org
X-Gm-Message-State: AOJu0YzeEtM/T4fwrtfkM+6cYgiw5JvdBOuBE1oIPmgDpcX/fZj3t+mZ
	BgUqmGOf23yRZ527blc2m19WBiKk1VwCjIH3EPZkur9jtMR+A85S
X-Gm-Gg: ASbGncvruVZBLOSr7C6ol4wtlSiAzAVD+NIuSPuPV8UTPH8OcawYv17TNFZballyG2i
	z9Ljb2VGjS0SOaxpzxsv9GpwkvNnRmnrgTSCBOcA8Mx1sJgvdLGbOR7A3mbvUJ/vapcY9LmQgGd
	Edy5wQ9p2gOmmr1Jmg5CdL5tQq+EsKBkn/bm5TWLNlqI/KRhDyLaHbw06zweXcIHfjjeTlzxJpN
	qNF63xNHuc0AU1jbSf9/VAclUdlWbvije6Rj4lFp+lINzH1B0KfFe60OuNcF9pYY5W6hmVldf5b
	ogomhw==
X-Google-Smtp-Source: AGHT+IFQufo5tXhmuP+UR71oQD+2OKaTxHqCGIGskq9pBU0kiHfjclL2HjYuWZdWPQ/dhvl4j1PGMw==
X-Received: by 2002:a17:902:ccca:b0:211:eb2d:e4a1 with SMTP id d9443c01a7336-2150128c1cbmr109485425ad.13.1732844962592;
        Thu, 28 Nov 2024 17:49:22 -0800 (PST)
Received: from [10.89.69.211] (wf122-211.ust.hk. [175.159.122.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417fba8esm2279190b3a.97.2024.11.28.17.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 17:49:22 -0800 (PST)
Message-ID: <0cfedbf1-76c8-477a-9523-1462cf30989c@gmail.com>
Date: Fri, 29 Nov 2024 09:49:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: apple: Add touchbar digitizer nodes
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
 <20241128-z2-v2-3-76cc59bbf117@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241128-z2-v2-3-76cc59bbf117@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_174924_101957_BD893D6F 
X-CRM114-Status: GOOD (  17.74  )
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



Sasha Finkelstein via B4 Relay 於 2024/11/29 早上6:29 寫道:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds device tree entries for the touchbar digitizer
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 26 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi     | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 24 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi     | 14 ++++++++++++++
>  4 files changed, 84 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
> index 56b0c67bfcda321b60c621de092643017693ff91..c31eb3f6f54268cafc9197a9244a5954fbb42802 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -17,6 +17,14 @@ / {
>  	compatible = "apple,j293", "apple,t8103", "apple,arm-platform";
>  	model = "Apple MacBook Pro (13-inch, M1, 2020)";
>  
> +	/*
> +	 * All of those are used by the bootloader to pass calibration
> +	 * blobs and other device-specific properties
> +	 */
> +	aliases {
> +		touchbar0 = &touchbar0;
> +	};
> +
>  	led-controller {
>  		compatible = "pwm-leds";
>  		led-0 {
> @@ -49,3 +57,21 @@ &i2c4 {
>  &fpwm1 {
>  	status = "okay";
>  };
> +
> +&spi0 {
> +	status = "okay";
> +
> +	touchbar0: touchbar@0 {
> +		compatible = "apple,j293-touchbar";
> +		reg = <0>;
> +		spi-max-frequency = <11500000>;
> +		spi-cs-setup-delay-ns = <2000>;
> +		spi-cs-hold-delay-ns = <2000>;
> +		reset-gpios = <&pinctrl_ap 139 GPIO_ACTIVE_LOW>;
> +		interrupts-extended = <&pinctrl_ap 194 IRQ_TYPE_EDGE_FALLING>;
> +		firmware-name = "apple/dfrmtfw-j293.bin";
> +		touchscreen-size-x = <23045>;
> +		touchscreen-size-y = <640>;
> +		touchscreen-inverted-y;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..9b83341a799d9a37578e5461e6b184f81ee7435c 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -326,6 +326,13 @@ clkref: clock-ref {
>  		clock-output-names = "clkref";
>  	};
>  
> +	clk_200m: clock-200m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <200000000>;
> +		clock-output-names = "clk_200m";
> +	};
> +
>  	/*
>  	 * This is a fabulated representation of the input clock
>  	 * to NCO since we don't know the true clock tree.
> @@ -441,6 +448,19 @@ fpwm1: pwm@235044000 {
>  			status = "disabled";
>  		};
>  
> +		spi0: spi@235100000 {
> +			compatible = "apple,t8103-spi", "apple,spi";
> +			reg = <0x2 0x35100000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>;
> +			cs-gpios = <&pinctrl_ap 109 GPIO_ACTIVE_LOW>;
> +			clocks = <&clk_200m>;
> +			power-domains = <&ps_spi0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled"; /* only used in J293 */
> +		};
> +
>  		serial0: serial@235200000 {
>  			compatible = "apple,s5l-uart";
>  			reg = <0x2 0x35200000 0x0 0x1000>;
> diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
> index 0ad908349f55406783942735a2e9dad54cda00ec..3332cc87cdf1a418c4c2247639baf5d2a42ed3c2 100644
> --- a/arch/arm64/boot/dts/apple/t8112-j493.dts
> +++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
> @@ -17,8 +17,13 @@ / {
>  	compatible = "apple,j493", "apple,t8112", "apple,arm-platform";
>  	model = "Apple MacBook Pro (13-inch, M2, 2022)";
>  
> +	/*
> +	 * All of those are used by the bootloader to pass calibration
> +	 * blobs and other device-specific properties
> +	 */
>  	aliases {
>  		bluetooth0 = &bluetooth0;
> +		touchbar0 = &touchbar0;
>  		wifi0 = &wifi0;
>  	};
>  
> @@ -67,3 +72,22 @@ &i2c4 {
>  &fpwm1 {
>  	status = "okay";
>  };
> +
> +&spi3 {
> +	status = "okay";
> +
> +	touchbar0: touchbar@0 {
> +		compatible = "apple,j493-touchbar";
> +		reg = <0>;
> +		spi-max-frequency = <8000000>;
> +		spi-cs-setup-delay-ns = <2000>;
> +		spi-cs-hold-delay-ns = <2000>;
> +

Remove the empty line
> +		reset-gpios = <&pinctrl_ap 170 GPIO_ACTIVE_LOW>;
> +		interrupts-extended = <&pinctrl_ap 174 IRQ_TYPE_EDGE_FALLING>;
> +		firmware-name = "apple/dfrmtfw-j493.bin";
> +		touchscreen-size-x = <23045>;
> +		touchscreen-size-y = <640>;
> +		touchscreen-inverted-y;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..977c1ca5e8c1b566bb3876b6619ea8812b98e072 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -467,6 +467,20 @@ fpwm1: pwm@235044000 {
>  			status = "disabled";
>  		};
>  
> +		spi3: spi@23510c000 {
> +			compatible = "apple,t8112-spi", "apple,spi";
> +			reg = <0x2 0x3510c000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 751 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clkref>;
> +			pinctrl-0 = <&spi3_pins>;
> +			pinctrl-names = "default";
> +			power-domains = <&ps_spi3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";

/* only used in J493 */ ?
> +		};
> +
>  		serial0: serial@235200000 {
>  			compatible = "apple,s5l-uart";
>  			reg = <0x2 0x35200000 0x0 0x1000>;
> 

Nick Chan

