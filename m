Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8343D10DBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hoqd94D+feLlJAd8AMaa3RK9Jl4eaWLUHOfCXcSoW5M=; b=Fs3ECLwcjGVKgkvx2rUOjHPrs8
	rEoP/GbFu71cOCFbdO9J2s4JaY51sKcEK12JQxM7piDmL6gBoikaHiajrnFI7FxfAkJFFEXTH1WqL
	5L8S9dBQzSjf8ngm1LadSpizxuTtH7nJwZIQwtp/UbfSMmPC5c+PJfm+uMX9FvVHSjh+l7A+53ny8
	4tZIMIrfgHXfkzkPDRD0qkjkeHWN7HCi0byiYa8YzUfBPwBQUfelAfwnNvh0bPK4hgZPdb+aDqcFr
	//s9LJZzPsGi1ZKxsMx3cPe1PXXO127fhoW2oVy2c3qN/cqT3IS1JovVR/9+5rIWNY1PqiBjAAuOK
	rbRNkNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1ac-00000005OWI-3B2i;
	Mon, 02 Dec 2024 08:15:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1Ze-00000005OMG-1IXF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 08:14:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-434a10588f3so23927185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 00:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733127268; x=1733732068; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hoqd94D+feLlJAd8AMaa3RK9Jl4eaWLUHOfCXcSoW5M=;
        b=gdp53uq74OiJRTVkznjLiXOC4MFW7oiNCl0aZDBKag0EIY8r0NAYcF8TxRD5jQnDKA
         eWTt0bAL8DltsV6TIKALyW0A/wp99ydWNTCiphLmOe04144tr+AopvXVvV7evB4vFB+z
         5uLQywCeoaNT/qLGz4/3/wH/E5ABJ+gLCjB+FhmicRz3j6QmSg9kGAq1Xd1uOVxvv5JD
         +fNSGSzX5sbOdEsF8XqShsfSElTtNC0h/3qNalkUqxEzAYZh0CUMMKSHrSw+oQnjE3e7
         Duuj+atOSoecTZmwcIvDXsg7u8acFqRXhsutD97ayMjzYmqjW2XyDBkFk7jccQuAy/U1
         t0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733127268; x=1733732068;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hoqd94D+feLlJAd8AMaa3RK9Jl4eaWLUHOfCXcSoW5M=;
        b=l+1vJhx1TTcHykXBUcV3/hNefSUuxt2uJjEzob//f6kPTHKMNVuqBxv1/1MJAn35Jp
         08RrhRIKFkYpkuABKjvksLkI9xr5rmNPe8F5zdBL/byi/yU6D1upIL9HhUQPYnxTawmG
         hQvAqdGlfoRNx6a3JrKfX04dwTCeT9UguoXwrxrEfckSQvFLZ/RGV94edVbtrwflalf8
         LdzViVlU7+6HPPAHKa4/LBOF3peYJP9eRl4+p1biARTh9hjwYYlhHzgy0pOTHYhkwuqv
         Vz0BsclvOB8VSW01+zWjkXhxJE9Ejd4fgQdivSKN7ifp2s9/T7ZCkYtHZenn8qKbSQiR
         IO1g==
X-Forwarded-Encrypted: i=1; AJvYcCV526ULyoNhCbZGp5Bn0niXZIMQLdmQ8433G0NI9hE3r2vqMtuZsQV3qsxg6RVkW2z8PZjgGXqbSVihbOwvTGdw@lists.infradead.org
X-Gm-Message-State: AOJu0YwZbZ8wv0cZkOHAuheWrogFkzJUa5BwrqNLxJSBOYgtP6zUAgZy
	UkUDSbXnQeSFZesVS/G0FxhulRKF7+KgAM8am8JegCTRRwowVtibcQbj7IEYZjkaKhjylQKYBHs
	0
X-Gm-Gg: ASbGncsgLMEg37v0H57TpiqJ06L/pSOIO7vMxNjcw/pBHcBNsWBLEWV+spIClYTpnj2
	wJIEL/3y+X2Mg1FM/O/ovx5ZrP9XLMfmdqPFFeqh2FcOt13S/xoX16u4z7DJbbRqPSysx07z9j3
	tZEMWBuODmcG1eATEQMZOkaO0JCto+w0EJwsnmbOs1qzspQe0WPxyB/cjDrJ4x++W5MNCYRZrcv
	Z1TIJ2mgnwp0MM5r5nWNVu1zQDWMfhQ4WXEDkiIOLYBE0ODFKlwAlEHSQ==
X-Google-Smtp-Source: AGHT+IEtDqzYKWw9Benv/Yt2JeqHtMT7suJIclYJoqZ4tha5f1Yj7UJIk1x1IGm4le52EEPyGssZLA==
X-Received: by 2002:a05:600c:1552:b0:42c:ba83:3f01 with SMTP id 5b1f17b1804b1-434a9dc36b6mr195508445e9.8.1733127268332;
        Mon, 02 Dec 2024 00:14:28 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dc63f7sm142240315e9.23.2024.12.02.00.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 00:14:27 -0800 (PST)
Message-ID: <2d8dd1c8-fd4b-4dc1-ba62-312ac86335a6@tuxon.dev>
Date: Mon, 2 Dec 2024 10:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: microchip: sam9x75_curiosity: Add power
 monitor support
Content-Language: en-US
To: Mihai Sain <mihai.sain@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241122080523.3941-1-mihai.sain@microchip.com>
 <20241122080523.3941-3-mihai.sain@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241122080523.3941-3-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_001430_354731_F3C7A60E 
X-CRM114-Status: GOOD (  16.53  )
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
> Add PAC1934 support in order to monitor the board power consumption.
> Device is connected on flexcom7 in twi mode.
> 
> [root@SAM9X75 ~]$ awk -f pac1934.awk
> VDD3V3 current:   10.675 mA, voltage: 3295.41 mV
> VDDOUT4 current:  5.7625 mA, voltage: 1196.78 mV
> VDDCORE current: 115.442 mA, voltage: 1243.65 mV
> VDDIODDR current: 29.585 mA, voltage: 1345.21 mV
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---
>  .../dts/microchip/at91-sam9x75_curiosity.dts  | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
> index d453800f8e35..76d7a756e08c 100644
> --- a/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
> @@ -198,6 +198,52 @@ regulator-state-standby {
>  	};
>  };
>  
> +&flx7 {
> +	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
> +	status = "okay";
> +};
> +
> +&i2c7 {
> +	dmas = <0>, <0>;
> +	i2c-analog-filter;
> +	i2c-digital-filter;
> +	i2c-digital-filter-width-ns = <35>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flx7_default>;
> +	status = "okay";
> +
> +	power-monitor@10 {
> +		compatible = "microchip,pac1934";
> +		reg = <0x10>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		channel@1 {
> +			reg = <0x1>;
> +			shunt-resistor-micro-ohms = <10000>;
> +			label = "VDD3V3";
> +		};
> +
> +		channel@2 {
> +			reg = <0x2>;
> +			shunt-resistor-micro-ohms = <10000>;
> +			label = "VDDOUT4";

On the schematics at [1] this seems to be named DCDC4. Is there a mistake
on [1] or this patch needs adjustments? If so, I can do it while applying.

Thank you,
Claudiu

[1]
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/UserGuides/SAM9X75-Curiosity-User-Guide-DS60001859.pdf

> +		};
> +
> +		channel@3 {
> +			reg = <0x3>;
> +			shunt-resistor-micro-ohms = <10000>;
> +			label = "VDDCORE";
> +		};
> +
> +		channel@4 {
> +			reg = <0x4>;
> +			shunt-resistor-micro-ohms = <10000>;
> +			label = "VDDIODDR";
> +		};
> +	};
> +};
> +
>  &i2s {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_i2s_default>;
> @@ -231,6 +277,12 @@ pinctrl_flx6_default: flx6-default {
>  				<AT91_PIOA 24 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>,
>  				<AT91_PIOA 25 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;
>  		};
> +
> +		pinctrl_flx7_default: flx7-default {
> +			atmel,pins =
> +				<AT91_PIOC 0 AT91_PERIPH_C AT91_PINCTRL_PULL_UP>,
> +				<AT91_PIOC 1 AT91_PERIPH_C AT91_PINCTRL_PULL_UP>;
> +		};
>  	};
>  
>  	gpio-keys {

