Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9C6C369AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hqxBUyC0ns9eaPvESS3za+oYCsUAFhI9e/U4xWblAI=; b=v1vr6u9Fak4ewUaxYUZNxmOsRU
	XidlNsUN1Lt/wGLk7iQ8ey8/bnhsR7YMLOO1sWCl6fCxO1x+c5WmMAmRlzUKraBD/X1hPyBX4IRX9
	eBQNndRnuXdIpju1gS9T7JhVVnSLFiB182fZDT5/P1PTDPTScnFnXyek0Ne9mjp2QnW58bTehOSTb
	rkinayZD7tc4k06bUFtXb9ojxLNKze1s6oJmhBWFPA2sh9O6C2kuhCpdDPqDm19wGutJ1llvsEY9H
	XbpHu200/GuhQ/+84veoUE20rOAsJD/miZHwctdg7JO4edZai76xEyeBtwn6nksckUMlq2zJHk+tI
	5qO7B/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FXA-0000000E7h2-3Suc;
	Fri, 11 Apr 2025 14:39:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FO0-0000000E5nk-3V9o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 14:29:42 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso1236782f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744381779; x=1744986579; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8hqxBUyC0ns9eaPvESS3za+oYCsUAFhI9e/U4xWblAI=;
        b=lOKgdXLWZY5fTE1lAWrtu93FhEyUQv6ARYSZWE8n9JDqfYy4YfCDIzE0c5qWq0eUAQ
         jvbF+wvB9x21RVgQXZl5MB6GZqeFQPmuRqdJ1EiFrOOUlZ3t0lqlPvuB4dkQU8AMVvqK
         TpqN2mq1wLJdbY6rkEnevxDVDTN+FL/bdYfdctuf/2ZNr5+oh3ZhKTlPYKiWEAG/YsL6
         slDv3f1qNW3oWEo38QM/DQ1GizMijenMeMX9b7/rTi/Q1ey0PiB0HdKnhnK8TUZRB81+
         rhtmrHris/zYJmorx9W1NsTSRRD/ld/UL5PRBLTgD2XkJEvL9FgOIPnvF4PL/AETsOQn
         4V4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381779; x=1744986579;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8hqxBUyC0ns9eaPvESS3za+oYCsUAFhI9e/U4xWblAI=;
        b=hjTlAGspANPpbe1lwR11aSXSVC32ZC6pvyDlJVcj8N6Hc0Luc8gO53nz36Unu5mtZU
         FOJN5STJ2KJyJxNdQs9QDD5KPE0DlDrYMv7hUnGKFk9RtVxzyL84BcvSjrO+liKTHi3Q
         qqV2jQpUIoLTh1H+WQvRkG8MIjKl/YU6FBxOQ5osZPI575j0Y1er8UNfe/itK7H8Dmml
         +hB0zGX9/dXfRMoDWrGwxG2On5qfCRWpApz170t3M/DJXeFLhjuIqrAVpw9p6F/gxN8L
         rMiLZHUkRE1H4KyDxw7X4JFlMsx4jDJte8raI7iw8kguRh9aAvnXf08HLmbNgr3jLKf5
         2PdA==
X-Forwarded-Encrypted: i=1; AJvYcCXBvRXUOw5cBRC28P9fVT98HpBtTPhOq9OlmKyAYv/3WjVC9X/YVYusGhj5UPUiR+WmUEp1GkLNxQy1EkSenK8l@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2hwWPX1IaWdNDvmgqJKssGQMoSm6cXtHRlBG6eiSlroYMo5QG
	4ADol+dw3At1fAzAk4a945CrniLkUMtfxfcCh2Gh81s/DmCZzB/7eY/EDioFXoA=
X-Gm-Gg: ASbGnctUyv4dr/47fRBRvTUs/iWr0qz96sys5H7bt7Jbyj2b7xFloVc2KzvHLK3ECah
	ya1G1a/gK5kuIk7zmHfKMC08y1svXmq5j+iJ9mQHmaxcKLf8g3dW3qtnLrJL9FwBIrYosQbfqAH
	pTHBk7yHPGkaZXdxqsi6WhccUxhq/AqwPtj8S/s8aUu1SijbI7BguP+mbrZbbBf4QaLP7WYFjgM
	VslRBOwsnHMUsck5KhdvhvXQJSVaiu+CYms1wpUAlm28sbZfyEc8RwPwELhrKM8wKEVm8zmtJRQ
	ir1L8sLCpYrGSlykSD594JUbk3qhAjMQfsr4/VkcgBi9ix5e
X-Google-Smtp-Source: AGHT+IHD7Cas+STyP0l4SArtn2i6scRGDrYYRpRyE7WLAnpJy9q9S7ex/ksN5K6SfcSK5n+MPRT4DA==
X-Received: by 2002:a5d:59ad:0:b0:397:8f09:5f6 with SMTP id ffacd0b85a97d-39eaaebed00mr2197064f8f.47.1744381779046;
        Fri, 11 Apr 2025 07:29:39 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae977a7fsm2151767f8f.45.2025.04.11.07.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:29:38 -0700 (PDT)
Message-ID: <ba68477d-33b8-4b3d-9a88-9f6bee6feac3@tuxon.dev>
Date: Fri, 11 Apr 2025 17:29:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ARM: dts: microchip: sama7d65: Enable GMAC interface
To: Ryan.Wanner@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, onor+dt@kernel.org, alexandre.belloni@bootlin.com
Cc: nicolas.ferre@microchip.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
 <fca0c1deb74006cdedbdd71061dec9dabf1e9b9a.1743523114.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <fca0c1deb74006cdedbdd71061dec9dabf1e9b9a.1743523114.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_072940_874787_FB9002FA 
X-CRM114-Status: GOOD (  12.70  )
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

Hi, Ryan,

On 01.04.2025 19:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Enable GMAC0 interface for sama7d65_curiosity board.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../dts/microchip/at91-sama7d65_curiosity.dts | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> index 30fdc4f55a3b..441370dbb4c2 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -105,7 +105,58 @@ &main_xtal {
>  	clock-frequency = <24000000>;
>  };
>  
> +&gmac0 {

Please keep nodes alphanumerically sorted.

> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_gmac0_default
> +		     &pinctrl_gmac0_mdio_default
> +		     &pinctrl_gmac0_txck_default
> +		     &pinctrl_gmac0_phy_irq>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +
> +	ethernet-phy@7 {
> +		reg = <0x7>;
> +		interrupt-parent = <&pioa>;
> +		interrupts = <PIN_PC1 IRQ_TYPE_LEVEL_LOW>;
> +		status = "okay";

No need for status here, default is okay.

> +	};
> +};

Missing blank line here.

As this are mainly cosmetics I will adjust while applying.

Thank you,
Claudiu

>  &pioa {
> +	pinctrl_gmac0_default: gmac0-default {
> +		pinmux = <PIN_PA26__G0_TX0>,
> +			 <PIN_PA27__G0_TX1>,
> +			 <PIN_PB4__G0_TX2>,
> +			 <PIN_PB5__G0_TX3>,
> +			 <PIN_PA29__G0_RX0>,
> +			 <PIN_PA30__G0_RX1>,
> +			 <PIN_PB2__G0_RX2>,
> +			 <PIN_PB6__G0_RX3>,
> +			 <PIN_PA25__G0_TXCTL>,
> +			 <PIN_PB3__G0_RXCK>,
> +			 <PIN_PA28__G0_RXCTL>;
> +		slew-rate = <0>;
> +		bias-disable;
> +	};
> +
> +	pinctrl_gmac0_mdio_default: gmac0-mdio-default {
> +		pinmux = <PIN_PA31__G0_MDC>,
> +			 <PIN_PB0__G0_MDIO>;
> +		bias-disable;
> +	};
> +
> +	pinctrl_gmac0_phy_irq: gmac0-phy-irq {
> +		pinmux = <PIN_PC1__GPIO>;
> +		bias-disable;
> +	};
> +
> +	pinctrl_gmac0_txck_default: gmac0-txck-default {
> +		pinmux = <PIN_PB1__G0_REFCK>;
> +		slew-rate = <0>;
> +		bias-pull-up;
> +	};
> +
>  	pinctrl_i2c10_default: i2c10-default{
>  		pinmux = <PIN_PB19__FLEXCOM10_IO1>,
>  			 <PIN_PB20__FLEXCOM10_IO0>;


