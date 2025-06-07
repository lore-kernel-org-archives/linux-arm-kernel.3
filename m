Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFBEC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHcxom5o2fWiDA0ztt3DRoDer7xYDc3Xgfa6dNo2w94=; b=AWlOthr2TXoIHwbGSMwr0Fhgkq
	J1MFKgB0wrJO4WuHGMqvpppZGWx6+CS3WCyyU2joHiLcFVNO91ZGL8RfS3Pp0xv2ISIKYsNBsFSQx
	oXSf67qWUWS50BlFPLPEHOeBbLReaR3dL6/dM39h/JwpIzDrOiHLnTehU+UyPLJHXztti6gr8DE9H
	UWK+zur3AZnxIhwX94Dzay7pnIjqDkiK0xP8oUKcBDUcP9rD/4zrK1KR/qQ9hhhy34d8juGnnhuC1
	AR3V1Idh90yVEU7JZqgStRkgThNBsSh/DjRSvx17k7KXe5DhvKTnA0pfNZGNSo/WbsxT+mMy/t7y4
	YG7CvjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrmN-00000001bcS-0k4U;
	Sat, 07 Jun 2025 11:32:03 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrUi-00000001aYb-2gPu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:13:49 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ad51ef2424bso564327866b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749294827; x=1749899627; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHcxom5o2fWiDA0ztt3DRoDer7xYDc3Xgfa6dNo2w94=;
        b=W9P+eib+woeIZi3YJ4H622EZjCoxrnbu71eG2CSLGgOdj420OMHeUN+Hn/omGTJlUN
         xCz3M7H0OnifA3NBkRaLLJguK7o5tdMm701WdUtWI1Oe9mkmMEsfDM7GEbu+HChRPGFw
         WYXCnNOskBn2zMn9F7RZHephbtBBKtE7SsjLffRKeO55uMw5t2HzYwcvQwOAe5hNSOPt
         0HGuFxDa/uNfe1sX4whhVL3KzAJwcXGC/fEmOuZyP08HHZ9sVUhI7cjxZvnCVI550TDn
         EHbw7QiV8PpS6F6z0z4qzateeKT4JoRSWokaD5w3d0jbh34cTd7NL8d4K8RIuKMFsyFl
         iqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294827; x=1749899627;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UHcxom5o2fWiDA0ztt3DRoDer7xYDc3Xgfa6dNo2w94=;
        b=ilkzVb5O+RYuLHLUaq0jW7xt7TpKYw3KDz4LpU2OWC+Uqp6QGteiV83RD0N2CkCddI
         HMd9WtpvU66oWlyDVTsufKrUbNqn17ygI1gZdeYZo5sVmy0OYgCwMFkxhPmvAjEOpkZ2
         mu3ulgR67CS8N3IU7X1GYUVac0ex4c7Tnf7pxPwZF7I2Elt/jhAPjr4HQ9aYnM2Xb53y
         ifRmX4s3K9VqIoWAKc1a2FT2QXjihF2taFqp/76nQB05U60ks7dFs6Sp6xDCVaNHf5NN
         ouWqlAEQese2J0lSrsE9z9KLqLO2G8D2bt7bPuNmy6r0M1k6+m8SNIh3mi1E6Ke7DsEp
         QeHA==
X-Forwarded-Encrypted: i=1; AJvYcCXPsKCzLJkMJkzjTRnkaJJhxHK26YEEiNVljvLcRCsr6l75gjdZOMB6qIHhSE0cBoQyG0QqQl5o/Cb/4wAxXYoe@lists.infradead.org
X-Gm-Message-State: AOJu0Yxiw04pn2M5vk877oieGisDKmB288mB2/chmmsRK7jgK4LSlvj7
	7O898ZA2ammmA3C0BGjSW9Ta78+ULya0Ug1hU8aZ1WLQRRs0bcN9nBkXnXTiMxFBZBs=
X-Gm-Gg: ASbGncuA72Ib2uVbUxg4eXbHOirQdK5G7HQt5g/KcTapoqn3MP+fxDf+6UObUhauu8h
	xZFAUraVBDSko+ohkRa8tIqI7gOGBJfGh8TxBjQjOcZGtmCnKweQ0YXWTZwAMfhiBgEY7kUGmz9
	2h1XztzBnPb8W1ZjfHWKByEkRXdjNad53I1lvcIjenWqFdzhUuEJTxSLLQxLIjSOub44qC5oZbi
	hYpFkTbdaJpnYBA0xgoX3XIABGIN6o1TIfN+lb1iuvY1O0ifiILl/tRuLPLvq6hMPFzKx7nhOIE
	vxvQIZgiMATmPclNJpR7Yar35vDkxAz7IBon/RMoBZLWwilFDFPoprYfrnOCM8ekuOdEwvE=
X-Google-Smtp-Source: AGHT+IHRk3J7ADThk0fpf96UVXCfXsiW9O/Fgv/3D1Wu7i91auPM/A8uTd1EhzotXWPFzWsK+BMZPg==
X-Received: by 2002:a17:907:805:b0:ade:3bec:ea40 with SMTP id a640c23a62f3a-ade3becfd3bmr211828766b.10.1749294827163;
        Sat, 07 Jun 2025 04:13:47 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c7efsm259748966b.77.2025.06.07.04.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:13:46 -0700 (PDT)
Message-ID: <913024c8-c140-4c31-96b0-45f5a9bc8f4a@tuxon.dev>
Date: Sat, 7 Jun 2025 14:13:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: configs: at91_dt_defconfig: Select
 CONFIG_WILC1000_SDIO
To: Fabio Estevam <festevam@gmail.com>, nicolas.ferre@microchip.com
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>
References: <20250519165352.1314199-1-festevam@gmail.com>
 <20250519165352.1314199-2-festevam@gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250519165352.1314199-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_041348_685191_880DE8A0 
X-CRM114-Status: GOOD (  11.34  )
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

Hi, Fabio,

On 19.05.2025 19:53, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The at91-sama5d27_wlsom1 SoM has a WILC3000 Wifi chip populated, so select
> the CONFIG_WILC1000_SDIO by default.

at91-sama5d27_wlsom1 has a SAMA5D2 type of chip. This is built with
arch/arm/configs/sama5_defconfig.

Thank you,
Claudiu

> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  arch/arm/configs/at91_dt_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
> index ff13e1ecf4bb..d195aa31976a 100644
> --- a/arch/arm/configs/at91_dt_defconfig
> +++ b/arch/arm/configs/at91_dt_defconfig
> @@ -87,6 +87,7 @@ CONFIG_LIBERTAS_SPI=m
>  CONFIG_MWIFIEX=m
>  CONFIG_MWIFIEX_SDIO=m
>  CONFIG_MWIFIEX_USB=m
> +CONFIG_WILC1000_SDIO=m
>  CONFIG_RT2X00=m
>  CONFIG_RT2500USB=m
>  CONFIG_RT73USB=m


