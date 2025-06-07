Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CEFC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wo2/J5ZAB6lqJfCe5NRG1BVNt7OTDs/ZB+OcWmMX8Vg=; b=1MY6PVH19YjLX/JfWM9aT/6lCh
	LoXSLbqdmcqMwQ8YcFiB5dNYxsxM99C50MiC4kFNRCHD2PmciU4DEO57dPKAU+Jh6+dER/6rO0jdJ
	u21u1aOv+DQpl51PF9B8gIj1XTJyP0i379ar+Vi/LVSReiywWeZCOsN6ojGQ9l60ncJgwF+EEdr4b
	/JhydMeXttzf9TTyS49v/v/QW5fEJgeIDyc5HAdE66HqCEIdRt+rKcYT1yTh7E2RkCrxCX3Z0FI3O
	EwdKEHjqvtgKx76vEq2yAO8HRK3NT2hldmZP5VoAR0fDzfHNGmvFCM5c9N+6DiHzdGj4rhP2OK5+P
	/pAuN+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNroY-00000001blt-43lY;
	Sat, 07 Jun 2025 11:34:18 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrYL-00000001ape-17mD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:17:34 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ad69e4f2100so483945066b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749295052; x=1749899852; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wo2/J5ZAB6lqJfCe5NRG1BVNt7OTDs/ZB+OcWmMX8Vg=;
        b=RUIXRyS5Mh95K+fjbV6VX4pWcNSQgVwT81ZD0a0XRCZIAu0qbsc7PdkyICoMDXfVt7
         YPA2gscfZLqXeH3O3PSwf3mBKxzCVbhHybjgYSCNrACyAB3FAtPCOX1OsS1b8ErXQJMM
         PO5nbkUGyj0i8Dp12Q58YnSGrVUVfcqpqO+E8B1bHoEAnMLOZPHZO7ycbbORRWvx9nPW
         vxDhtjv6T6cKRrpZHHm4tkvKy6VQQE4wYSAUMniyk+iXwCW/m7DAWGc/OCygSUtYClJJ
         ACqz7fN9YwydTssPwXfO/akVKpvW69pmv81sqCP/7hChqyqb7/qNuSU+UK+UXXv1sHdI
         KhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749295052; x=1749899852;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wo2/J5ZAB6lqJfCe5NRG1BVNt7OTDs/ZB+OcWmMX8Vg=;
        b=oHRzLHX6yWfSMUzzTs80OTzCuRzbWxxgQ9rKE8rz8rDRASQZ49ujXPTbFmcza72TID
         SLD0+I5rnzy1cFC1wYuOouAoHcMxr7Jz6ujEsCuocBqwX/tnL/4dpVKICo88XFO+vVfN
         5bDwTV47EqqFBbRwsZHU0oGNn4FwQi8wshWpPatxYbD1QiTjkwSQDkNiFAy4mA1kUbwZ
         4O5xBJpFSw66p9B8z/M7qlu4HI2RoqOFVHBe3QPAnqq0rN0gV7dyigNL8N+8kkWIk8ay
         mo0vKehRYS4sj2x3dNd9jtmRdCvIrcsH9btMk1zRhIHHCHcjHmldWJKN1VxDdqdp5v6t
         Xv8w==
X-Forwarded-Encrypted: i=1; AJvYcCVsKb5csN7oGeRq78nVt5mdAB55sCtVKlhuxlVDccbv06etDvQYkaF+qoM1mXKNBpAknqJ61jioR0jZpVu3aI5H@lists.infradead.org
X-Gm-Message-State: AOJu0YxdRk212uDCOY1eqSwVA7O6quQaYmvbzSMtI1Mvl0tM1BVKb2FR
	zjlhD4DYP/RBKMb7t+6A34Zn9MBeLmHpBQkpGd/vXIW1uw2H6ovHThrl7a23xptZCVQ=
X-Gm-Gg: ASbGncsWO56rzfbKXDJGU+3X+Dsdhnt19kOnONysK8dpzk8lpYoqWSfZgJCZt4Nq8LS
	W+ZymYTDVk/ebgriebd2zfnz64O0m+sGyrATrk/z5RwwoOMRWlyQFsI8xfaxQjhamLCn1nG+qv8
	hDKmBsAu/VU0J59JJieRMfwC4pZxZ3caGVyNyQ1NsSoLqcnuQ9mae++krMTqvmHgNv59P33xuHF
	QFvBcdDYSuNcg0tQY4p+dUJCUAxmQ/Dn7Y9PSNDUg7fATyzvXHWwRCHOp7QlsQqseOQgxjhkwQL
	5lWv3ha8X7fg0MnLuFK3ET6gS+F5M87S3KeWN4agU7M1m/a+I2t/UKY5dFRb
X-Google-Smtp-Source: AGHT+IHler8uepWC8BUcQVWFTPho53gfFnJDIZ0DzlC3E7bSqB1Irh8C7asB6/PASoLmm0Q2jJsedQ==
X-Received: by 2002:a17:907:94cc:b0:ad8:9f50:d8c1 with SMTP id a640c23a62f3a-ade1aab97cemr626104166b.31.1749295051679;
        Sat, 07 Jun 2025 04:17:31 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm263963066b.98.2025.06.07.04.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:17:31 -0700 (PDT)
Message-ID: <0fb997c0-468c-4c24-9b84-6d4075723b49@tuxon.dev>
Date: Sat, 7 Jun 2025 14:17:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: microchip: use recent scl/sda gpio bindings
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org
References: <20250519112107.2980-1-wsa+renesas@sang-engineering.com>
 <20250519112107.2980-4-wsa+renesas@sang-engineering.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250519112107.2980-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_041733_315471_225F30E4 
X-CRM114-Status: GOOD (  13.66  )
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



On 19.05.2025 14:21, Wolfram Sang wrote:
> We have dedictaded bindings for scl/sda nowadays. Switch away from the
> deprecated plain 'gpios' property.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  arch/arm/boot/dts/microchip/at91rm9200.dtsi  |  5 ++---
>  arch/arm/boot/dts/microchip/at91sam9260.dtsi |  5 ++---
>  arch/arm/boot/dts/microchip/at91sam9261.dtsi |  4 ++--
>  arch/arm/boot/dts/microchip/at91sam9263.dtsi |  5 ++---
>  arch/arm/boot/dts/microchip/at91sam9g45.dtsi |  5 ++---
>  arch/arm/boot/dts/microchip/at91sam9n12.dtsi |  5 ++---
>  arch/arm/boot/dts/microchip/at91sam9rl.dtsi  |  8 ++++----
>  arch/arm/boot/dts/microchip/at91sam9x5.dtsi  | 15 ++++++---------
>  8 files changed, 22 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91rm9200.dtsi b/arch/arm/boot/dts/microchip/at91rm9200.dtsi
> index 2a4c83d88733..e105ad855ce8 100644
> --- a/arch/arm/boot/dts/microchip/at91rm9200.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91rm9200.dtsi
> @@ -714,9 +714,8 @@ usb0: usb@300000 {
>  
>  	i2c-gpio-0 {
>  		compatible = "i2c-gpio";
> -		gpios = <&pioA 25 GPIO_ACTIVE_HIGH /* sda */
> -			 &pioA 26 GPIO_ACTIVE_HIGH /* scl */
> -			>;
> +		sda-gpios = <&pioA 25 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&pioA 26 GPIO_ACTIVE_HIGH>;
>  		i2c-gpio,sda-open-drain;
>  		i2c-gpio,scl-open-drain;
>  		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> diff --git a/arch/arm/boot/dts/microchip/at91sam9260.dtsi b/arch/arm/boot/dts/microchip/at91sam9260.dtsi
> index ec973f07a961..fc0b6a73204f 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9260.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9260.dtsi
> @@ -781,9 +781,8 @@ nand_controller: nand-controller {
>  
>  	i2c_gpio0: i2c-gpio-0 {
>  		compatible = "i2c-gpio";
> -		gpios = <&pioA 23 GPIO_ACTIVE_HIGH /* sda */
> -			 &pioA 24 GPIO_ACTIVE_HIGH /* scl */
> -			>;
> +		sda-gpios = <&pioA 23 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&pioA 24 GPIO_ACTIVE_HIGH>;
>  		i2c-gpio,sda-open-drain;
>  		i2c-gpio,scl-open-drain;
>  		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> diff --git a/arch/arm/boot/dts/microchip/at91sam9261.dtsi b/arch/arm/boot/dts/microchip/at91sam9261.dtsi
> index 0b556c234557..d1d678b77e84 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9261.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9261.dtsi
> @@ -655,8 +655,8 @@ i2c-gpio-0 {
>  		compatible = "i2c-gpio";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_i2c_bitbang>;
> -		gpios = <&pioA 7 GPIO_ACTIVE_HIGH>, /* sda */
> -			<&pioA 8 GPIO_ACTIVE_HIGH>; /* scl */
> +		sda-gpios = <&pioA 7 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&pioA 8 GPIO_ACTIVE_HIGH>;
>  		i2c-gpio,sda-open-drain;
>  		i2c-gpio,scl-open-drain;
>  		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> diff --git a/arch/arm/boot/dts/microchip/at91sam9263.dtsi b/arch/arm/boot/dts/microchip/at91sam9263.dtsi
> index 3e9e5ce7c6c8..a4b5d1f228f9 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9263.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9263.dtsi
> @@ -826,9 +826,8 @@ nand_controller1: nand-controller {
>  
>  	i2c-gpio-0 {
>  		compatible = "i2c-gpio";
> -		gpios = <&pioB 4 GPIO_ACTIVE_HIGH /* sda */
> -			 &pioB 5 GPIO_ACTIVE_HIGH /* scl */
> -			>;
> +		sda-gpios = <&pioB 4 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&pioB 5 GPIO_ACTIVE_HIGH>;
>  		i2c-gpio,sda-open-drain;
>  		i2c-gpio,scl-open-drain;
>  		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> diff --git a/arch/arm/boot/dts/microchip/at91sam9g45.dtsi b/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
> index 535e26e05e99..4e00ed2d3ecd 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
> @@ -1010,9 +1010,8 @@ nand_controller: nand-controller {
>  
>  	i2c-gpio-0 {
>  		compatible = "i2c-gpio";
> -		gpios = <&pioA 20 GPIO_ACTIVE_HIGH /* sda */
> -			 &pioA 21 GPIO_ACTIVE_HIGH /* scl */
> -			>;
> +		sda-gpios = <&pioA 20 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&pioA 21 GPIO_ACTIVE_HIGH>;
>  		i2c-gpio,sda-open-drain;
>  		i2c-gpio,scl-open-drain;
>  		i2c-gpio,delay-us = <5>;	/* ~100 kHz */
> diff --git a/arch/arm/boot/dts/microchip/at91sam9n12.dtsi b/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
> index 2f930c39ce4d..af41c3dbb4bf 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
> @@ -786,9 +786,8 @@ nand_controller: nand-controller {
>  
>  	i2c-gpio-0 {
>  		compatible = "i2c-gpio";
> -		gpios = <&pioA 30 GPIO_ACTIVE_HIGH /* sda */
> -			 &pioA 31 GPIO_ACTIVE_HIGH /* scl */
> -			>;
> +		sda-gpios = <&pioA 30 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&pioA 31 GPIO_ACTIVE_HIGH>;
>  		i2c-gpio,sda-open-drain;
>  		i2c-gpio,scl-open-drain;
>  		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> diff --git a/arch/arm/boot/dts/microchip/at91sam9rl.dtsi b/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
> index 1fec9fcc7cd1..de74cf2980a0 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
> @@ -833,8 +833,8 @@ rtc@fffffe00 {
>  
>  	i2c-gpio-0 {
>  		compatible = "i2c-gpio";
> -		gpios = <&pioA 23 GPIO_ACTIVE_HIGH>, /* sda */
> -			<&pioA 24 GPIO_ACTIVE_HIGH>; /* scl */
> +		sda-gpios = <&pioA 23 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&pioA 24 GPIO_ACTIVE_HIGH>;
>  		i2c-gpio,sda-open-drain;
>  		i2c-gpio,scl-open-drain;
>  		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> @@ -847,8 +847,8 @@ i2c-gpio-0 {
>  
>  	i2c-gpio-1 {
>  		compatible = "i2c-gpio";
> -		gpios = <&pioD 10 GPIO_ACTIVE_HIGH>, /* sda */
> -			<&pioD 11 GPIO_ACTIVE_HIGH>; /* scl */
> +		sda-gpios = <&pioD 10 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&pioD 11 GPIO_ACTIVE_HIGH>;
>  		i2c-gpio,sda-open-drain;
>  		i2c-gpio,scl-open-drain;
>  		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> diff --git a/arch/arm/boot/dts/microchip/at91sam9x5.dtsi b/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
> index 17bdf1e4db01..9070fd06995a 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
> @@ -933,9 +933,8 @@ nand_controller: nand-controller {
>  
>  	i2c-gpio-0 {
>  		compatible = "i2c-gpio";
> -		gpios = <&pioA 30 GPIO_ACTIVE_HIGH /* sda */
> -			 &pioA 31 GPIO_ACTIVE_HIGH /* scl */
> -			>;
> +		sda-gpios = <&pioA 30 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&pioA 31 GPIO_ACTIVE_HIGH>;
>  		i2c-gpio,sda-open-drain;
>  		i2c-gpio,scl-open-drain;
>  		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> @@ -948,9 +947,8 @@ &pioA 31 GPIO_ACTIVE_HIGH /* scl */
>  
>  	i2c-gpio-1 {
>  		compatible = "i2c-gpio";
> -		gpios = <&pioC 0 GPIO_ACTIVE_HIGH /* sda */
> -			 &pioC 1 GPIO_ACTIVE_HIGH /* scl */
> -			>;
> +		sda-gpios = <&pioC 0 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&pioC 1 GPIO_ACTIVE_HIGH>;
>  		i2c-gpio,sda-open-drain;
>  		i2c-gpio,scl-open-drain;
>  		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> @@ -963,9 +961,8 @@ &pioC 1 GPIO_ACTIVE_HIGH /* scl */
>  
>  	i2c-gpio-2 {
>  		compatible = "i2c-gpio";
> -		gpios = <&pioB 4 GPIO_ACTIVE_HIGH /* sda */
> -			 &pioB 5 GPIO_ACTIVE_HIGH /* scl */
> -			>;
> +		sda-gpios = <&pioB 4 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&pioB 5 GPIO_ACTIVE_HIGH>;
>  		i2c-gpio,sda-open-drain;
>  		i2c-gpio,scl-open-drain;
>  		i2c-gpio,delay-us = <2>;	/* ~100 kHz */


