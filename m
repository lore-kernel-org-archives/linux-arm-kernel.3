Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3771EC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OTJXiPdRvtiBBp8e+x5n2i2CDc/LvduVGRkWa7Iyto=; b=j96vJz5qX7iPI/oRCxWZKQ2HfB
	kTH+oeA6V6nMRrn6SK6TJfcOxEtqHEnkE34qBfh83jVuzFvaUzsBqfp9ILvSHN313BBg8dhGhhKVI
	soaTe3WM8+jExJWHvMGUGbQljbTEBTC487avtxS/6jey88lJTsysbfYvlW9EkiuMmrYSzZ9iU27bX
	n3xIIaGtfGm8xUYEmGh/4pTn+bxULPvekFOtVwWvKxQCHOz/Pv4TecULyVeh9ajAcCrnPToIrsUWw
	UX+tNXqwenmTqVoLDqjFv3MsmoYUH+RjZkPllv9F75PKuaytwGLOyGeVyqz8wcylwchvtIVdxW/Ue
	uVJHFD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUlI-0000000AJ9T-0oHm;
	Thu, 13 Feb 2025 08:39:56 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUcO-0000000AHXW-2gGx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:30:45 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab7f860a9c6so134599166b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 00:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739435443; x=1740040243; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8OTJXiPdRvtiBBp8e+x5n2i2CDc/LvduVGRkWa7Iyto=;
        b=XTEYVtJYD4YtTfudhrABm5jLxy8x0IdxZMyHaLoGXwr9fooTsuJpPtQjMbidlv4Gy9
         5U4QcHydKLFzpdof7tu7uYVokLHoouTqtRCrlUJRHibI7tMjoG82hcwN15VJON5l2cCM
         V73KtGfiiLq+YkueeV7LU/teVPZCRZQ+yQRcFWbGdLFR4Hm8JIqsEx2vv48kDtVLLiRZ
         MRL1o1ZMtJyMvpu3WaxNNzzajnXJ4KqQzkw071tUluQQKmzm0mZYqprIUAH4hbvdTAB6
         zH2R4wazL+7xMZO2cPNum26LpBL3T8kYVIt97xavH+TRnodIPNE7XR8vnO0SmUmoBTvj
         Rm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739435443; x=1740040243;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8OTJXiPdRvtiBBp8e+x5n2i2CDc/LvduVGRkWa7Iyto=;
        b=ElqC1iWv5Qcvj3FtmHaz9IdcjQwXGYRvEshQWbD1aZQlKTPXn4EZbx1SD36NDKqZnj
         y3Ou0njCoIGSDte40EsP7RGnn+ga+W/qXA7bWEn0kojhzHV9nnRoCbtYh9yy4GDbKiQN
         D/dpEa/5Elg1zA6jhXePGF7AA40GXpCQDR+WZlFvMYel0Y5IqY0PxRt/dkDyB23w/HNa
         ff61jP8ke+iecbtAS707U4Hy4y9H/x90kAme80Dpio7mdZuTcCbAAk3ypan1DcqBYuFU
         /KwfEqjWkS0icLctP6E01MW1xSFTgiw5xH+wFB3nV8vTMABsIRTn2MKjXn4YrV205G2k
         G5+w==
X-Forwarded-Encrypted: i=1; AJvYcCVieyErTh7vFRpqoro1qMV7MM2EGUo3i4/E8GlvUEagmaB5rTembatR0eXV/kAuDJd+agySMLRGgC/KV81gOfYR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn3zRO6NF9G4ADLRs6fDjtC0ZSL4bK8FB6SpNygP3C6+Us52d4
	ix6CoJh395rmHbUA9pJ/f9dR853zrhOfEw08s4gItRVObxdz2VAcKXP/LAh2eDE=
X-Gm-Gg: ASbGnctuqA/vqim2lkN1nhKE9V2BmZBjiXIXCnF5fqD0UieLaI2tUZvfo6Iear617Cn
	N5hj0VLPgHXLMgZw3jQaIQvQUJoNAlK6wT3vkf6S6JhXPbEyCb0LoU84VJvF9+vKA0hg8GPJio5
	gdBjVEeEYc3WVBo3eI5NCisNHl3yyKUoIZsAjLXi9BF6rrRSsPhL4UuWi1J6pzb/peYAQ6lXBpt
	4vT2DitJ4ejcsRZKndnREzUyI5f0T4jUOX2cpFim+DtwxCSjUo8vprGSqUYPlBtgVYxJuwDRNYf
	Mhwim/akfyvh8vzGlgMybzgH
X-Google-Smtp-Source: AGHT+IGRpE3mvXYi07r5eKrsPU6jDtGUtF130PrHSlSd+nAQxiAUlBKaWgcX6BHCBayFoA8d6GoHcg==
X-Received: by 2002:a17:907:724c:b0:ab7:d10b:e1de with SMTP id a640c23a62f3a-ab7f339c868mr555099266b.13.1739435443116;
        Thu, 13 Feb 2025 00:30:43 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece288e38sm753543a12.79.2025.02.13.00.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 00:30:41 -0800 (PST)
Message-ID: <83a59afc-ce67-4461-bb63-d8b8078a1198@tuxon.dev>
Date: Thu, 13 Feb 2025 10:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] ARM: dts: microchip: add shutdown controller and
 rtt timer
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <709f5268da63c123cc4eee9e47875324df81c454.1739221064.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <709f5268da63c123cc4eee9e47875324df81c454.1739221064.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_003044_679729_EDE5E626 
X-CRM114-Status: GOOD (  13.21  )
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

On 10.02.2025 23:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add shutdown controller and rtt timer to support shutdown and wake up.

Also, split it in 2 patches:

1/ add rtt timer
2/ Enable shdwc

> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../boot/dts/microchip/at91-sama7d65_curiosity.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> index 0f86360fb733a..d1d0b06fbfc43 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -77,6 +77,11 @@ pinctrl_uart6_default: uart6-default {
>  	};
>  };
>  
> +&rtt {
> +	atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
> +	status = "disabled";

Any reason for keeping this node disabled?

> +};
> +
>  &sdmmc1 {
>  	bus-width = <4>;
>  	pinctrl-names = "default";
> @@ -84,6 +89,15 @@ &sdmmc1 {
>  	status = "okay";
>  };
>  
> +&shdwc {
> +	debounce-delay-us = <976>;
> +	status = "okay";
> +
> +	input@0 {
> +		reg = <0>;
> +	};
> +};
> +
>  &slow_xtal {
>  	clock-frequency = <32768>;
>  };


