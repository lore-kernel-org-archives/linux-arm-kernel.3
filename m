Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCB1D65559
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 21:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkqGUVpcqR3FJaZivv3n68lrMx5q8kW12p75NFQawIU=; b=XQiZOneu+F2BxjjYqYC+yC6Kpd
	cv+TpVNQOLra15/c/KywTP4XuxFyWZnPHynMSgN9UHC9yNyK4BSNjHJPVzmVnoouwb83SL/RxsO4c
	iwBzn++LjPE0R9aWTbx5gY+4I+hBpchFzHhv6nD+vGZIXn7J6Ac6rV0reV1aGWD+0yeYa1B+/kua9
	S9C3agg6lOoPf7zOcVRYnTiFt7ZH9suyciVYp1C/MA4XIE2Rs4xZtsaJ+YYVpkqYWV9bQnnBPe/Wi
	KC0Ak9PwtBUp0ge7lrNtD9HnbwNhB47gMWLTjgZtkWfQcTJnanmswoV0Q4dJyQINlkh4upe5UNYyd
	y/r3/6+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2g8-0000000Bhzv-1A4D;
	Tue, 26 Nov 2024 21:01:00 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2eY-0000000Bhga-2hGZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 20:59:23 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7242f559a9fso5850964b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 12:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732654762; x=1733259562; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pkqGUVpcqR3FJaZivv3n68lrMx5q8kW12p75NFQawIU=;
        b=Smzcdn5niJ7WWeTPePoBjenOjbX6tgJyAvj0uC8hSoQP/GRgcJtDAzNMpPZ7DPNKIs
         hwlM0MAAA0pqTTkr4H8pSvq2C5xFHObowC2rWO48hBWoQhIsKho1d12Vdq7RI48TnG8h
         ng/k/XDUPZwLLB6jeZjoRLvRETHLl2EJoZPOLesDGWGfbgmKnALEb3wmrM0L1HwsPJ0l
         /xPTtyNIwvl2/urVxTKd+V4O2facaKg51QTF4UTsXsC7FwR7yRJOunY5TSOzmxRYk73i
         tfd11xI9mUVbTno/K/CDg28gy1MHYjQyWGwV6zGzBBRfIOUk6F7Gjab7kONIgc+PT9W2
         0u/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732654762; x=1733259562;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkqGUVpcqR3FJaZivv3n68lrMx5q8kW12p75NFQawIU=;
        b=mDPD9oXYczdX+IsYPX8W9SvuFX5CIGnTxpu9WVg1Qvw80EHAjGj4wdGoeuel8Uej/l
         XG17Lr7KCQXpYhzrcbGosWmyQ9d+tZ/AWca7RTzmFSoiNmfSziPiiGG/tflH2VbPsSqm
         LKh9/prkqNPlHeMhHepvuva00Koydyh8C2qedazjtEeQPYErHM+0D6pmumRG5PzO5u0N
         7ZIttzkytJlt0Q5BefMDZlC+6If7g7KZtKLznblV0yianVQ8Cw1CgX6nlGGJfRbWki3R
         VM77gLo7aqe5Znx1LABayQngjkj4xwu7gpw2MfqxV1LDgTRN0i8KGM3M8AejZfbyOJ+T
         M3hA==
X-Forwarded-Encrypted: i=1; AJvYcCVmxqWucqfIjOo5uWBhFtn0F3BNnfF5LfjMt1CfwGIZt/6NaaCjIN4X7UrdBAQl37BUSJZD8lXqehTDdtM4+DsL@lists.infradead.org
X-Gm-Message-State: AOJu0YxvM4THVYZmj/tDVPH+Xj3eyv6y+G/d3fOe1uaTp2cUYvhmh6kH
	Vkf3LuPk9kWPhdmJ1fR/G6FYOkPbUzRKiSea1KyuBTybvpG4gjOz
X-Gm-Gg: ASbGnct//uUXWTQana2cHP/RtzZppjzsgZMv0dG1OTxgWJUR+r6f8JJAJoaq4XiiiXv
	zszgffztZdNzO/6glFuhCxTnna0P2Nw+g/rTJTnpNspZUIXRkSuS04Qnsm9qV9FDonWVK8ELHAG
	Xcokupzk89mHtMIBP6BLLlMPl3zzOvRKCoKinl5mbCVXQv2e1CR8Jbj0u3Rki6O+ZgqJRoY3VRe
	5JCKJmQigomBaTXRRJ6PVNdANB/m5cOpPw78K7piwbfQUe0NkkL9i+ABjml6VZ6G2mri7mSm5HM
	obQOufGreEholJrV7Lo+f4Q=
X-Google-Smtp-Source: AGHT+IFkbQliXMJngdQsKS+kRYin8+jC/qkMwuMPdlrz1mQVCJ4TO13OHNKsmF8s3CBjHPSX9sPlOw==
X-Received: by 2002:a05:6a00:845:b0:71e:1722:d02c with SMTP id d2e1a72fcca58-7252ffcbf9amr876613b3a.3.1732654761660;
        Tue, 26 Nov 2024 12:59:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de554fbfsm8831060b3a.135.2024.11.26.12.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 12:59:21 -0800 (PST)
Message-ID: <d718ddd2-d473-4455-b21a-15024e46787c@roeck-us.net>
Date: Tue, 26 Nov 2024 12:59:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: imx: defconfig: Explicitly select CONFIG_PINCTRL
To: Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org
Cc: esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de, Fabio Estevam <festevam@denx.de>
References: <20241126194146.1193094-1-festevam@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241126194146.1193094-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_125922_689825_EE36D483 
X-CRM114-Status: GOOD (  14.37  )
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

On 11/26/24 11:41, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
> 
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.
> 
> Fix it by selecting CONFIG_PINCTRL inside the affected defconfigs.
> 
> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net/
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   arch/arm/configs/imx_v4_v5_defconfig | 1 +
>   arch/arm/configs/imx_v6_v7_defconfig | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
> index 875c8cdbada7..1af29d12129d 100644
> --- a/arch/arm/configs/imx_v4_v5_defconfig
> +++ b/arch/arm/configs/imx_v4_v5_defconfig
> @@ -83,6 +83,7 @@ CONFIG_I2C_IMX=y
>   CONFIG_SPI=y
>   CONFIG_SPI_IMX=y
>   CONFIG_SPI_SPIDEV=y
> +CONFIG_PINCTRL=y
>   CONFIG_GPIO_SYSFS=y
>   CONFIG_GPIO_MXC=y
>   CONFIG_W1=y
> diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
> index 0beecdde55f5..73f7aa7e75f7 100644
> --- a/arch/arm/configs/imx_v6_v7_defconfig
> +++ b/arch/arm/configs/imx_v6_v7_defconfig
> @@ -204,6 +204,7 @@ CONFIG_SPI_FSL_QUADSPI=y
>   CONFIG_SPI_GPIO=y
>   CONFIG_SPI_IMX=y
>   CONFIG_SPI_FSL_DSPI=y
> +CONFIG_PINCTRL=y
>   CONFIG_PINCTRL_IMX8MM=y
>   CONFIG_PINCTRL_IMX8MN=y
>   CONFIG_PINCTRL_IMX8MP=y


