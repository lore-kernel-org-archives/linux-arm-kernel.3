Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A72C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQk2xNROAbUunePjjPQL+I4XS/ltDuWUPTvnmWm1qXc=; b=innep7IWfcxSgW0HwJcwUrfi95
	lyCisWgURAmAbR7YCLd1o/s9oPJ6KJpplQ2BZCeh48U67nkgVn0H55GlwSMWdLKylIg8BEQKWZ6zG
	Nv/2/erkQNnTbkldISxvOFfueJre5NF+4pA5AB+gg/8qyO5aeX6w/445HusI2ANTmW6R3nETDCdE1
	JCAcB9Yh+A/ODK2wE0CmVXw6tOImtP3Ekx+ByPCfz7Ze5ybcG8f24DoJhGBbS9A7uxP5VvquCOWD4
	w63GW7DDuDNkMAIrxhgyvWakqk4vX7vsOyEU0Nqh1+CWSvKcTqBk02LZ90HegntdqL1rd3kjCRJs9
	YoRpsKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1NX-0000000HZNN-3bSq;
	Mon, 03 Mar 2025 08:42:23 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1Jc-0000000HYQF-0XXf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:38:21 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e51e3274f1so3211979a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740991098; x=1741595898; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQk2xNROAbUunePjjPQL+I4XS/ltDuWUPTvnmWm1qXc=;
        b=MGY1Fe8vWkSmCI0w6irvGR5dFSygW4S+f3fBwkfxjVpk2T7ajDsEoa1msrZynjShGW
         BmYb0fvtwjj5MgKtbS3dKSWzVdPYUzJZV8ZobIO9Nh4UbC2YJXNgmY3w5a//PigwI2bv
         FN9ZK7Gd0cnuChe2cLuR84OANUvNxCqTV/x7We+7zwa9wQ74+bwpy7TEfFdxItBdKllB
         8qvqIdlyAv8xErbEtju8NaBGo42y3+1WCR30BTn8JBsJ1+E9Iycl+grDKujWk4wVj7Qm
         aREOTTPyCdsqRDpIplcrQJYVjSHxJw9Q+1ZBv7R5Al3NszlWWsOzx/eGfGV5bwKMzFcN
         dhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991098; x=1741595898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YQk2xNROAbUunePjjPQL+I4XS/ltDuWUPTvnmWm1qXc=;
        b=plK/40A3hH6rQY685RmZ94vRZtSZWVjOIGC9PRtRtrDaOKSedodhr1X8zucm3zJdty
         Mk2fpCu6zEAkvT7UQjjz/rRrofag0Z5iH/CiFe/KU/dp69+XQb+TZukxqh5djuXy37NL
         Ev6m3WUFGYtm2rNEDM6UXKy5Ob3Z4xjjvN0OpGd44r73TK77oXldYnXUhjf23wq3dV6B
         ljHjfjwUJBzOJREKDTyk6aS2mluPzO44hcJ6CjxUOVk3nKWiftVT+qT+i6Q2mfN1sWvp
         Ufc/bnMsliIjlmwZ0lXPPIDydj+Q6W1i/C6ES57KuGoQSylSwMQ5Iy3T798ibIa05LYr
         +mFw==
X-Forwarded-Encrypted: i=1; AJvYcCX47FVTA2Qd1vxTmVMou6rTD/jigfSmGp6L436R7e8nYcYfBPaZv+XWhJsI33437uWNQcZXFZ+bnDVELEUBDmEP@lists.infradead.org
X-Gm-Message-State: AOJu0YyiU52/U6Dr1ZayzMbOEP8nD360KF4uO3fBu8B4V1H1rVO404ty
	sSW1DjvdEp9ii9zwSh8bD0E6bobluo0xa1w2huRWya8jRN1nq6jvZzSp4L/ot8M=
X-Gm-Gg: ASbGncsyoleNassN2PdoAofrnIy5ulqPkAQeiS7HuQVN5oJANA1VJVq3WnK9WjRTgF+
	X+D6+CWlOU7lDbqJCsVN8BPlR3hkKunJEdIRPwUZiX18nbKpzRdoTdeL9LCSXiYmD8EqclOq6aO
	es/PGIzsHArR4q/bwHSxzm5quEpI8Qf1gD1Arwo3sKzH5WlBkqUB2CUx9//97qW+lGqY1IEWDST
	YvSLXh50UuUr+fuobB1NudX7/dGSfy5rxxgJVV7uj04J/bpRxRHQM2qviGm9VIH1FuUxS2V+0U1
	Jz3y8FM1GKg91IOa63R/yJbSvetGa0R9rmFg9irVLL+UcnpH/dB8K7cc
X-Google-Smtp-Source: AGHT+IFVwVDJq2GzOlT/TEj1tNqLe6aqacbfxkkGcxDDEFi9TNJRnV4PSA6nZiqQzltKffqId4/sKg==
X-Received: by 2002:a17:906:7308:b0:ac1:df33:25b9 with SMTP id a640c23a62f3a-ac1df33268amr85643966b.40.1740991098316;
        Mon, 03 Mar 2025 00:38:18 -0800 (PST)
Received: from [192.168.50.159] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf1aec8164sm718325666b.172.2025.03.03.00.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:38:17 -0800 (PST)
Message-ID: <6d762706-27b5-4b0b-bcab-ae96a831c03a@tuxon.dev>
Date: Mon, 3 Mar 2025 10:38:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/21] ARM: dts: microchip: sama7d65: Add RTT and GPBR
 Support for sama7d65 SoC
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <6a1c058edee3fe1459dcb3a93a0a789a9ffff5f3.1740671156.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
From: "claudiu beznea (tuxon)" <claudiu.beznea@tuxon.dev>
In-Reply-To: <6a1c058edee3fe1459dcb3a93a0a789a9ffff5f3.1740671156.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_003820_171072_BBE94B97 
X-CRM114-Status: GOOD (  14.99  )
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



On 2/27/25 17:52, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add RTT support for SAMA7D65 SoC. The GPBR is added so the SoC is able
> to store the RTT time data.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   arch/arm/boot/dts/microchip/sama7d65.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index b0a676623100..aadeea132289 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -120,6 +120,13 @@ shdwc: poweroff@e001d200 {
>   			status = "disabled";
>   		};
>   
> +		rtt: rtc@e001d300 {
> +			compatible = "microchip,sama7d65-rtt", "atmel,at91sam9260-rtt";
> +			reg = <0xe001d300 0x30>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk32k 0>;
> +		};
> +
>   		clk32k: clock-controller@e001d500 {
>   			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
>   			reg = <0xe001d500 0x4>;
> @@ -132,6 +139,11 @@ chipid@e0020000 {
>   			reg = <0xe0020000 0x8>;
>   		};
>   
> +		gpbr: gpbr@e001d700 {
> +			compatible = "microchip,sama7d65-gpbr", "syscon";
> +			reg = <0xe001d700 0x48>;
> +		};

This node should be before chipid one to have them sorted by node address.

> +
>   		dma2: dma-controller@e1200000 {
>   			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
>   			reg = <0xe1200000 0x1000>;


