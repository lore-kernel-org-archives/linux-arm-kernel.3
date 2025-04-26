Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C83C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CI5a7+0i1Z4ciPNBaeJ5FtbaB8j0UzTY2F+B8Sn8k24=; b=RxppeQOYav94dIyY+e7jF1Dt6q
	umeRxnxy9BLvg0r62ADYsN9YRs2KX0SBQ57S+cKkPRyihWdAzdKGNYeu471K1i30PhdO+J9aOcy8N
	ThiOh9wWbh7mrudWKIynlc7vvQjx6/rt4t6Y4GABGcJV20Qqe8SbEt6Y3fQ6ac0YM+ww6OdlecgHU
	52QDzNpqDomLrZEZPLoSuSSjysIyVf3OynymyQKL0Fk5kwpBLaYJu+fweA45s0PqRcnE5nSzh39ef
	46O8EmTHWMMoKmtcJ7IBLploH8IvoQgFZAG/tZzC1MByy331rlENAY3wDKaNazPEa5cgePwIYdBxk
	rYpCgyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8g2w-00000002808-09n3;
	Sat, 26 Apr 2025 13:58:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fPC-000000024Et-2htd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 13:17:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso30859615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745673437; x=1746278237; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CI5a7+0i1Z4ciPNBaeJ5FtbaB8j0UzTY2F+B8Sn8k24=;
        b=gyPadk5Mc2Y79+ilLK+TnzQGANZrt8uWU5SsmnvqXbdowXpSkudeAIC9po8R7gyO92
         /Ny+Mm8b813iDqCAiQqw2tIvF7bOm8yHpL5X8i5yRXABfyqBYeappQ8gmqbV09nCzaOv
         3525NZ5mMJ022v1wa2n7SXSB7WmkJ2HwBboNsPczRtBPKS0x9OnAQNI150N3vEA4Pk1i
         XlHwWU1tREQNNkPyKY7vLlmjJ25AvvfTOBxuxVZgK7/hTIMZ5sItNegT8NwmRO1vgFoR
         WoM/guk/D0L130iLefiirPCxQsoHdIezBZ328IyQoVwdrTMe8wNGLTxVore1VFb9E4J5
         KSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745673437; x=1746278237;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CI5a7+0i1Z4ciPNBaeJ5FtbaB8j0UzTY2F+B8Sn8k24=;
        b=v0lpGsxFn6RT1ZZ0pwzXveU0KmdrbXErjZ5534ZrEXRoHpFGHaqeQ4lEsx1Av9VSrO
         SkK50StI7BI76PqYwexY+Fd+SBG2gJ/slK+OI3Dnu544BAht6YSN68RjwsqCDdRvv7aO
         B5pvydgEvo2HI3l5mPUryJPIk4bmyQiPFaSNbaqIh7A3ezdKGGy5hOlq2r04E8OVFj6q
         iZGa8neQga0G/cLXLsqAjGho9kHACiOZx1f8mTj5+CwG+a4KRWd8j/V5WZn1tfMO+H0M
         NTCf5Zt67/1APBVo+zAh2O14hkFaPcsep3oNUqz4jS6LdXGj3j5TWNUWTlGZkYbsK8Og
         AtIA==
X-Forwarded-Encrypted: i=1; AJvYcCXV7VdT/8DCFOppx476NGwWbOaEFJi2L+pUnmz8CQyPBfnFOJCi4aK36j3OCMxVNzy7QjAfyHjXu28btejohNlV@lists.infradead.org
X-Gm-Message-State: AOJu0YzALT/S5Ffxs2CYgbP+22YOmFmtQfldedWlhisJNgjb2QtiQ2eQ
	iGRXBDh6oica/AH/08W6EXFZ8XDVP6+3Vi6l6swmGFmvwmgR6kMSgtI+oXTbQsU=
X-Gm-Gg: ASbGncvQ+s51lqWzthihIBoPYBngpyZZxvwioLsrWcXGMC0bFIyXM8SWJgvWT03TGXS
	OSM+h4W6/vB6++kUxnxOLI3cAF5OuE8NFfNC9MtYFYUDsdhT4gU3gglLQ3ivW2j+D+u+kGAQIdk
	p5vs+ntOE/Cxpnfa9CfR5FSQcc1EwGnaQRAF+g8Mi5mAklObIYPG2LiXyJ5/UsL4KNwA7oO/pPE
	IGlvuCKSsHZonWvXY461VMNOboLZGLUvUPnt9foc3lbS0k7gvVN1t/7EVs9o35wTbHmWmCiisrQ
	TdCzuZm8UH8iKt5eOA2ajFlTN0O5QxdIxxIDyM9fD6TbM2kGgg==
X-Google-Smtp-Source: AGHT+IHytqi0PRSnCZUd64Qp2/4XTNrGyd31YUwQgLulH0kGSHkkv9/ZhwEu+T7t1MGAzdiUaJUlRw==
X-Received: by 2002:a05:600c:450c:b0:440:6a5f:c308 with SMTP id 5b1f17b1804b1-440ab79bd20mr22243255e9.13.1745673437040;
        Sat, 26 Apr 2025 06:17:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d8d191bsm106573135e9.1.2025.04.26.06.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 06:17:16 -0700 (PDT)
Message-ID: <b6736e74-7f90-437c-b44c-183a75401037@tuxon.dev>
Date: Sat, 26 Apr 2025 16:17:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] ARM: dts: microchip: sama7d65: Add SRAM and DRAM
 components support
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, lee@kernel.org, sre@kernel.org,
 p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
 <354ecd628fdd292d2125570a6b10a93cbecb7706.1744666011.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <354ecd628fdd292d2125570a6b10a93cbecb7706.1744666011.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_061718_690043_0FB0E0B2 
X-CRM114-Status: GOOD (  12.84  )
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

On 15.04.2025 00:41, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SRAM, secumod, UDDRC, and DDR3phy to enable support for low power modes.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 35 +++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index b6710ccd4c36..8439c6a9e9f2 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -47,6 +47,14 @@ slow_xtal: clock-slowxtal {
>  		};
>  	};
>  
> +	ns_sram: sram@100000 {
> +		compatible = "mmio-sram";
> +		reg = <0x100000 0x20000>;
> +		ranges;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		ranges;
> @@ -58,6 +66,23 @@ sfrbu: sfr@e0008000 {
>  			reg = <0xe0008000 0x20>;
>  		};
>  
> +		securam: sram@e0000800 {
> +			compatible = "microchip,sama7d65-securam", "atmel,sama5d2-securam", "mmio-sram";
> +			reg = <0xe0000800 0x4000>;
> +			ranges = <0 0xe0000800 0x4000>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 17>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			no-memory-wc;
> +		};
> +
> +		secumod: security-module@e0004000 {
> +			compatible = "microchip,sama7d65-secumod", "atmel,sama5d2-secumod", "syscon";
> +			reg = <0xe0004000 0x4000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +

These should have be before sfrbu for keeping nodes soted by their address.
I'll adjust while applying.

Thank you,
Claudiu


