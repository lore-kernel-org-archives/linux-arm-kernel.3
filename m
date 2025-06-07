Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A247C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PTfBD3stG5QBQvRznIOQO3iudOANMtq2ogixVLY+hE=; b=WNIrzysWLMuTTYQDY4qhUsQaWH
	5tVFS4K4Y1OuXJhdNM1A/9C92PyPgYqgCOjRnuI46j+93bIN3CDrhoI3eCYTl8BIhG2xJFuO+h3++
	jQWEClyed/dXyM+ZI2+Lg8OiBp6g9l+A3LdGsSvgblesEiqEEZYrldFZ11afjfjn6v4OvZ6r4RqHo
	wJNPpAYIui6o7C5fhEZRiUIrhetUScbG9pZ41XTCzfi4bC2Q5fl9lNjD7rEFOqUrhA39AOb3Uxpg8
	LKLnL5ZekKc8VdtzLRDSD8j+3sJ6Ime43iRargWG9pR8OToF/FllTV3URxwi0DDMcdTJ5R7D+zgm2
	lgcMpBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrkD-00000001bUv-1oVR;
	Sat, 07 Jun 2025 11:29:49 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrR9-00000001aOp-1T0t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:10:08 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo2224404a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749294606; x=1749899406; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1PTfBD3stG5QBQvRznIOQO3iudOANMtq2ogixVLY+hE=;
        b=RShSqmS+IkeHmwnFBmUk5Kl6BZIksEW1RbJTJEI2qWlbjmWNBSVKAqX1u6Ni4Yltwi
         sKoXXyxE20I9kfG9X7lNAngR2o1vsBe13q7CthNfAk7LOKdRsUQuShmR7gqWvGr96Dz/
         qiEOEfVdxcxOvaCcPXdX5ToEpieis0VqvXBKkMbMRDl0/0Pa+/SlCzDqeohaSvrpycx5
         hxU/wmjfYRqfrZFSH7RUyAkeBiCHc9OgwFX7yZZs2usISyqS4Jf8qzGVtWwVThi9iuBb
         REF/TKgO/y5a5i5HbQBdFHE11TXCfqjvHD2Zui7JE+S44LLW9gx9cxty8SNfMcmtA4I3
         xBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294606; x=1749899406;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1PTfBD3stG5QBQvRznIOQO3iudOANMtq2ogixVLY+hE=;
        b=X9ce0PE0kSkN31LUGEsjVKmSMx3DSv8lr+GG6FZ39odurDxexO0fvyNOsX+DdAfquv
         /bYp7fPuHpC9+9BL3eJf97FzydZ+UdXBB266LSsuZ6lQavpkYIVf4OMXHO298Mqxv7N1
         7jWY6hw44AUHIWgdKYkVrf3SSYb6Kp72Jqg2zFb3bPKbaRPg9Pvs3BYoOD3Ik7unbRt7
         mDwETXyUiZMCm0HY/sMqpqIk8IDvbe08QaPuuDaAPtP1YiyisukTno6huX9IVe2Iosrt
         1XEZaGVZwsSSwh0HYRS1XVs5DEW8LYTtU5AmUh4LPH+HMa+H4mxtvOXJHI0WJHGi0JP3
         KbYA==
X-Forwarded-Encrypted: i=1; AJvYcCUFT5mxCYdfWDHkiKTdos5ENmd2Lsl4kgAiYiERA3HSp82iwiI0ncDisnb9cILHGEUcVUMB8npplmVmwaDo6TE7@lists.infradead.org
X-Gm-Message-State: AOJu0YyzsFwqtG9Jw5YQAZ1oRwENpZLxd2EKXklzcuwxIdSoZESSl0L8
	K9Bf7SrZR+FgdxcO/3Ez6EA4tp8eJficVG+2iz+382C3x9UUC2guTuIeYi+HiEBD3KA=
X-Gm-Gg: ASbGncvLm7l8yl6/Pc0dtx7G6ISVThBTPCuO4kPwRlXuwkGNaG0HnvEQxpicF/IIoMO
	RrBvm1iMc9WfzvM4TCxGYNs6+yuO1pE/kwIFbtnBIHHoAyP0wPioXhzOeHu95n998E8Jmp9OQfD
	2VdpoUIsQk6TjlIArlwfw/iiwKUB+rRoiAxhPSold+wSkjpRo4pkG2lHSA9f1DsMOOXGze4r4zT
	CksHXAx1kEMf8uCl72GNh9cnPwqzH071zkqXoX/mx7J4FjEMG6xjzn9n4l8P9xpDcKJkhefwei5
	OaRaIhnHS5aKodLZS0rngbYP8JTyZvY/hY6eZAxmzxVNKiYJ1v/t3WisDWMV
X-Google-Smtp-Source: AGHT+IF3DQUEodlloMNaPTNxoK2FYWgdATNtvJwE5PCDK7H2qA3FtmE+6FFdjpNw+6Ekq/8IYTrKCQ==
X-Received: by 2002:a17:907:2da0:b0:ad8:9b5d:2c0c with SMTP id a640c23a62f3a-ade1a924887mr568188466b.33.1749294605805;
        Sat, 07 Jun 2025 04:10:05 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc78b30sm256310766b.155.2025.06.07.04.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:10:05 -0700 (PDT)
Message-ID: <e962bb23-8a36-4684-8add-29ce589978b1@tuxon.dev>
Date: Sat, 7 Jun 2025 14:10:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: at91-sama5d27_wlsom1: Improve the Wifi
 compatible
To: Fabio Estevam <festevam@gmail.com>, nicolas.ferre@microchip.com
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>
References: <20250519165352.1314199-1-festevam@gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250519165352.1314199-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_041007_397675_CB6A198E 
X-CRM114-Status: GOOD (  13.95  )
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



On 19.05.2025 19:53, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The at91-sama5d27_wlsom1 SoM has a WIL3000 Wifi SDIO device populated.
> 
> Improve the description of the Wifi compatible string by passing the
> more specific "microchip,wilc3000" string. 
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> index ef11606a82b3..e35dd79beb16 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> @@ -385,7 +385,7 @@ &sdmmc1 {
>  
>  	wilc: wifi@0 {
>  		reg = <0>;
> -		compatible = "microchip,wilc1000";
> +		compatible = "microchip,wilc3000", "microchip,wilc1000";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_wilc_default>;
>  		clocks = <&pmc PMC_TYPE_SYSTEM 9>;


