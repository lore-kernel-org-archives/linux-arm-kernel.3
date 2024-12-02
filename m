Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E07D10DBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 08:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biIoGOQqyq3N6XA0zNtfB70JTNOwYolG4EVywUtJAns=; b=Ysr0a6BaSGqvZteaAWJ6wmZw9T
	qxCK0jSUz2AahfnwwclI6Xg1V7lIEOvdGFJHzZP4kicuZp+NqHJgpphA2j+uFYZtBe5ZRvY2seyhW
	QB/3bAFi9NaVviWCw6wwV6MHfaBDwIQXLkc5YOLytukVGTd+0ZjKJB0/0GnOvNTCz9pjf6Aoz9f8F
	QKOrhBxXHZbvG6j7Lc4Bn6zDhSeLGuBt1f2FOnm6sb9EKGHkoLdh6Vdec4FqWt/9iB4vOXdocjGQO
	6BNz0eoSUmqHoJGipZBvzWQPYN5drPvxzmQTkuYlsUZZAvrdzMoHX6st9zPeVlxtCn9qTUwbaZiKu
	PcN7e0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1Uq-00000005NXj-16Hm;
	Mon, 02 Dec 2024 08:09:32 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1Tq-00000005NNH-1oow
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 08:08:31 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-385d7f19f20so1579315f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 00:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733126909; x=1733731709; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=biIoGOQqyq3N6XA0zNtfB70JTNOwYolG4EVywUtJAns=;
        b=Ffvp9WdnD1gApMPhQa0G+DoDhy5RQDRZbZtWYadaBgKmTN3EIWBsX04PAYTq0pIzEz
         4rjabtztaoGwI5S5ge4tDaHtTDQtTlfqGJNEtocx8lh8hXYmHlw/nP3Ped/o1ZIeLfUA
         ZDCILpIdyeDseYXjbhMlUUBJN47fgLgHn+Qt+E4nUCbdX7+fmKAvyZzwbEOuEJDAKSgK
         kVfFhI0MYXBoShVsvZfTCXSq9z8uyja3YQUi85CkooZgXhsVWm0qcuqqwfvSpOFWFScx
         V4ptLTTDCWArI4BfHDfTKmkW4aSXtGe/hx3t+ZReT15MHHD1BDJfkVPBKVo8+Olnp7Zs
         NPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733126909; x=1733731709;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=biIoGOQqyq3N6XA0zNtfB70JTNOwYolG4EVywUtJAns=;
        b=tZbO+iKkidwyOSho57WvGCQnp6mSHraZ8nFy9UL/4jKHCHXCK3oA6qtXt36ErjKyNT
         iE9ceHxZmqZLvEX2XDT/w71azCUWTt6DCe5OIdZoy3t7YgnTFGkMd7vpPbgeKHS6oEL2
         cDMMkaQpWBibenz4wkfcpCGHuiFjZWZYPYb2sp2JQidEv4SYMyPfV/3+lPLuI3zAsOTW
         4tmpE9J3SZfDPgnurYajSAzfAga2xiCMrhcZeSWFhQjec1WqgfKGIpzGAL+SUeJ+6ydZ
         o8jhp4e6Yo9O+RgGSvFvtXX9IvM1AZGXm4b2gDB8zKskNyHpQor4pDUdOoCMga1MyXtH
         Z55Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZhUd8nUuUGrt4g0Hq7TETF62W+JGwOaOIXgBTKvgc93hlOoD8/SGZkLroZIfK7tr4yiyRS31fvvpBMly2LIEq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu0ghurPaIJ5sFDF/V1XS1F16HbW/rH9InYCVLdAxGTiaDZNZX
	6E44R9/EAv1Tn4yWA6SpNTd4WzDelekwC/24j9Rzs+VPR7j5kIaRqKvxWhRYn3/CGi4Oa99W7sA
	R
X-Gm-Gg: ASbGncsKA2S+Q0F5bgyGYk31/PA5OEhBulYcZgnKtKcLhvn+EXmBBsZVNwIUDgHrAFy
	o8mhFYQxkk5SqhYz8rdPaSCiMYsHqBYr1hnXvVjguFapzqdF/aLUoJyDPhEucH4rhmiBZPVLlCW
	00Vce1N8mgMl6q4ekD6dAj4OOhFnk22tEYeaxeuVhv1iZuT3LnKJD+M+W1pnI0vE2O3XG8LN2xn
	i1FVU4O+wjU1Ce9I0jCZ6/SbMXiPH9BV6EhjNF/qUyqmdNn45JZl9suOw==
X-Google-Smtp-Source: AGHT+IE/FN2ZItFsru5z5bnmJFaCMjGBYDDtPToGAA6DQa0WbEd1yHKPiHr3G9UCYQzQErXFFCJrCA==
X-Received: by 2002:a5d:6dac:0:b0:382:32ec:f5b4 with SMTP id ffacd0b85a97d-385c6edd38emr19115560f8f.47.1733126908581;
        Mon, 02 Dec 2024 00:08:28 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e8783843sm5908426f8f.4.2024.12.02.00.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 00:08:28 -0800 (PST)
Message-ID: <db8187d8-5ec6-4aaa-bd61-21cd3a806c66@tuxon.dev>
Date: Mon, 2 Dec 2024 10:08:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: microchip: sam9x7: Move i2c address/size to
 dtsi
Content-Language: en-US
To: Mihai Sain <mihai.sain@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241122080523.3941-1-mihai.sain@microchip.com>
 <20241122080523.3941-2-mihai.sain@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241122080523.3941-2-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_000830_479981_1E9F47F6 
X-CRM114-Status: GOOD (  13.93  )
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

Hi, Mihai,

On 22.11.2024 10:05, Mihai Sain wrote:
> Since these properties are common for all i2c subnodes,
> move them to SoC dtsi from board dts.
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  .../dts/microchip/at91-sam9x75_curiosity.dts  |  2 --
>  arch/arm/boot/dts/microchip/sam9x7.dtsi       | 26 +++++++++++++++++++
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
> index 87b6ea97590b..d453800f8e35 100644
> --- a/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
> @@ -88,8 +88,6 @@ &flx6 {
>  };
>  
>  &i2c6 {
> -	#address-cells = <1>;
> -	#size-cells = <0>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_flx6_default>;
>  	i2c-analog-filter;
> diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
> index beb1f34b38d3..aedba0a8318f 100644
> --- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
> @@ -151,6 +151,8 @@ i2c4: i2c@600 {
>  				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
>  				reg = <0x600 0x200>;
>  				interrupts = <13 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 13>;
>  				dmas = <&dma0
>  					(AT91_XDMAC_DT_MEM_IF(0) |
> @@ -220,6 +222,8 @@ i2c5: i2c@600 {
>  				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
>  				reg = <0x600 0x200>;
>  				interrupts = <14 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
>  				dmas = <&dma0
>  					(AT91_XDMAC_DT_MEM_IF(0) |
> @@ -312,6 +316,8 @@ i2c11: i2c@600 {
>  				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
>  				reg = <0x600 0x200>;
>  				interrupts = <32 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 32>;
>  				dmas = <&dma0
>  					(AT91_XDMAC_DT_MEM_IF(0) |
> @@ -362,6 +368,8 @@ i2c12: i2c@600 {
>  				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
>  				reg = <0x600 0x200>;
>  				interrupts = <33 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 33>;
>  				dmas = <&dma0
>  					(AT91_XDMAC_DT_MEM_IF(0) |
> @@ -533,6 +541,8 @@ i2c6: i2c@600 {
>  				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
>  				reg = <0x600 0x200>;
>  				interrupts = <9 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 9>;
>  				dmas = <&dma0
>  					(AT91_XDMAC_DT_MEM_IF(0) |
> @@ -583,6 +593,8 @@ i2c7: i2c@600 {
>  				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
>  				reg = <0x600 0x200>;
>  				interrupts = <10 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 10>;
>  				dmas = <&dma0
>  					(AT91_XDMAC_DT_MEM_IF(0) |
> @@ -633,6 +645,8 @@ i2c8: i2c@600 {
>  				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
>  				reg = <0x600 0x200>;
>  				interrupts = <11 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 11>;
>  				dmas = <&dma0
>  					(AT91_XDMAC_DT_MEM_IF(0) |
> @@ -702,6 +716,8 @@ i2c0: i2c@600 {
>  				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
>  				reg = <0x600 0x200>;
>  				interrupts = <5 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 5>;
>  				dmas = <&dma0
>  					(AT91_XDMAC_DT_MEM_IF(0) |
> @@ -771,6 +787,8 @@ i2c1: i2c@600 {
>  				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
>  				reg = <0x600 0x200>;
>  				interrupts = <6 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 6>;
>  				dmas = <&dma0
>  					(AT91_XDMAC_DT_MEM_IF(0) |
> @@ -840,6 +858,8 @@ i2c2: i2c@600 {
>  				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
>  				reg = <0x600 0x200>;
>  				interrupts = <7 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 7>;
>  				dmas = <&dma0
>  					(AT91_XDMAC_DT_MEM_IF(0) |
> @@ -909,6 +929,8 @@ i2c3: i2c@600 {
>  				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
>  				reg = <0x600 0x200>;
>  				interrupts = <8 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 8>;
>  				dmas = <&dma0
>  					(AT91_XDMAC_DT_MEM_IF(0) |
> @@ -984,6 +1006,8 @@ i2c9: i2c@600 {
>  				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
>  				reg = <0x600 0x200>;
>  				interrupts = <15 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 15>;
>  				dmas = <&dma0
>  					(AT91_XDMAC_DT_MEM_IF(0) |
> @@ -1034,6 +1058,8 @@ i2c10: i2c@600 {
>  				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
>  				reg = <0x600 0x200>;
>  				interrupts = <16 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 16>;
>  				dmas = <&dma0
>  					(AT91_XDMAC_DT_MEM_IF(0) |

