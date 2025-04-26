Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C9FC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J407mJFXHjtMTMAmHlJN1cKIkBEdqNJvnzIbzWuD3a0=; b=RPEbk8Y+pqzq6FCs/O21cEen1E
	jEd1HmXeGH/GuHnJLOugoMvyNRi5GGbPMlav5jB/TKv8Wj5QxrgoHd1bkyotftL9ZvPnEMr7pgyJe
	iJpylqvhR9Zey28WfKwA6lufKiih7T4RZiWCpq0A9fvo+qH0n/q6kRzrvu9K0rfcz+WFwA7jWDY2U
	ELLXhqNdQQXFzCb9Rwdfe5zVYlCnjMvIAJ6eqmclTarUa7RA5H+P3RbPg1G1I124Hzksuh0vCWlMh
	HhvFt3H8DOfJejo4JQxZL6jgeCyZ5N2vVRlA4k8S5XjpVbZEkDVGow0fO3bsYKA5fTNHw9pZcTXRo
	09PItFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8g16-000000027nO-1Y0Z;
	Sat, 26 Apr 2025 13:56:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fOg-0000000249j-1yiG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 13:16:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso37201765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745673404; x=1746278204; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J407mJFXHjtMTMAmHlJN1cKIkBEdqNJvnzIbzWuD3a0=;
        b=DSIz+TZoweI1+leC66kFtN4LTBPg6QcDcpn2b+qUD+ruZvucxadUPZWambLWIPfjIm
         2L65v7f+Mk752K56X5XVus42onH6cSvcCgj5AOPGzsT9aC/UttOpw9GwPz5kK1T5wFjg
         UetTvGpHwnMzUJt0CQS+EO33ML7qmn3zKz6IUTRnOxNjsj/MoMboJ5pBzMBEeKSR7PiI
         Tob7qtHhcaCC453EECW0p84KvvytZxtPAfsr4wg8+N56GZFAPpyqsOBXN1JSExRCgqTC
         qwe0bg81AeVFGQ2w9AZrzwhC3oKqKA1qV2h9xK1fgEvJD/cXGv4Dtnbv21Qbj98vrCpR
         jq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745673404; x=1746278204;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J407mJFXHjtMTMAmHlJN1cKIkBEdqNJvnzIbzWuD3a0=;
        b=B//BcsQXJyGCRr62eVzsy7J9JCFwZbW20KBIhAmuiJ7AaJUuUz37y5ABf4O6Ou6Dh2
         AJoGo2FbbiZje/MAK/BRJNp1M7FGlXOC0QjzCTZyJWvCjrJ0QbW5E6w9uujs1AR6z2t+
         Sw4OV89q52Q99qylGmlvubo+jR6LnA954DaCP7cC+/puKq2xfubtrGeiZ8QVtA2wH10B
         pd50RYFU13hfPQVr+2zIkEpDcerP88Xx+0A/AXW8RKTN/CPfdI7oytTlfzVdNo/Kv9cT
         hzL74alN+4MeBD/i/A6p21i73mA83k+TzxwCvenSJJjXeLx1YM8DF99JxQtcYAna20m1
         JA0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPfpv5CSOP4X3tnovS0yrG3ru5sPYj1FCsDP9rHG0aiktX89hYnPyplrwnvKv6gBqgMvzithoGG31KtUmKpAPt@lists.infradead.org
X-Gm-Message-State: AOJu0YwLm2iF4Sdb6vLU3miSEMk2YbBcX0wEKtiXcTFE/eZJDQirUZgt
	DJRzvXdPuzJKtDI8plMLqQz+HUAmaQ672AnnFjMkelIPYgJaEHK3ysn7Yyh+NhM=
X-Gm-Gg: ASbGncvQsvL5Jru7D8As+4JeOIuk5WzaBfmXk3elUoW+3Q9E0oZPqkfquaCYeWKSZH6
	geZIEKkREbxPqzHsTIAGcKoPy+2CuiR0aIi50D/e1V2KuZHmFkT35PHpGhPw8U3aGEg8TCm/LLK
	Aad3N+z0B7QfFFE4LBMvaXGnFxvHFRjmcaDG7h1f91U2I5m+JdZXtstIza828ul32O+ySr9uVQV
	J2kLHSdmMcv4QmnhCOQNq/quw065sg5b1TzCf48rBErg60VavMRw68AMH1XIYyjHPsWlz50VNxM
	KMTlOFiuLY28ZibyasbPilai8blc+GK5upqVTkugLmEhott0tw==
X-Google-Smtp-Source: AGHT+IFEdPhvnEPF2IPYYIjIlVAxjiyxZPBsePtMycDc8OXoHjZ80eyhmbO/+g2anWdvGqYyjM32vw==
X-Received: by 2002:a05:600c:3548:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-440a65fe6ebmr57418595e9.16.1745673404131;
        Sat, 26 Apr 2025 06:16:44 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5e1c6sm5649133f8f.98.2025.04.26.06.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 06:16:43 -0700 (PDT)
Message-ID: <79d1211f-6d4b-4f1f-8d94-3bb717025f05@tuxon.dev>
Date: Sat, 26 Apr 2025 16:16:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] ARM: dts: microchip: sama7d65: Add RTT and GPBR
 Support for sama7d65 SoC
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, lee@kernel.org, sre@kernel.org,
 p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
 <e8868ef06102241b47883ba10edaed751831be6d.1744666011.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <e8868ef06102241b47883ba10edaed751831be6d.1744666011.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_061646_607873_5586B250 
X-CRM114-Status: GOOD (  14.84  )
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
> Add RTT support for SAMA7D65 SoC. The GPBR is added so the SoC is able
> to store the RTT time data.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index 8439c6a9e9f2..bec70164a75c 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -132,6 +132,13 @@ shdwc: poweroff@e001d200 {
>  			status = "disabled";
>  		};
>  
> +		rtt: rtc@e001d300 {
> +			compatible = "microchip,sama7d65-rtt", "atmel,at91sam9260-rtt";
> +			reg = <0xe001d300 0x30>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk32k 0>;
> +		};
> +
>  		clk32k: clock-controller@e001d500 {
>  			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
>  			reg = <0xe001d500 0x4>;
> @@ -146,6 +153,11 @@ rtc: rtc@e001d800 {
>  			clocks = <&clk32k 1>;
>  		};
>  
> +		gpbr: syscon@e001d700 {
> +			compatible = "microchip,sama7d65-gpbr", "syscon";
> +			reg = <0xe001d700 0x48>;
> +		};
> +

This should go before rtc node to keep the nodes sorted by their address.
I'll adjust while applying.

Thank you,
Claudiu

