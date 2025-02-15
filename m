Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6034C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 16:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDNZRmX9cp47bNPUDnDP3nRpEEr/01wvhc2xIQB9veA=; b=Lv4l70Qnzq2qUYg7jZuL4Cngos
	a3f2ciHxpubO/3Dc/wqRruz8TrvVztCmi194sfyx+NO4Je7uFb8v5Sc6oeEcLn0LwU7eQFjeTawI/
	Tb6206Nnp6gfAMsQUZPpy7M2lLHupTXAg6m/Ra8SZLr1eZ7OLZ0qEESzqOndgSmlpQQ2peUh1ZJom
	TkR0VlFlGGJXrlYY9oUUzOorZfmc9WqiGyD7+scz9QA9wo/NHKSq6nqGaZLHxljlCCo19CzwZytF0
	LiRJ+Y4LmSdSSt0YjaMKF3yYmMkbztnz23JLQY/k/d+/FpHwh4plrU96wVKJ2oMUFxVWNd0G3JU7l
	sOX/2sTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjLVp-00000000RoF-1823;
	Sat, 15 Feb 2025 16:59:29 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjLUM-00000000Rfn-2QTG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 16:57:59 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e02eba02e8so1423613a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739638676; x=1740243476; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KDNZRmX9cp47bNPUDnDP3nRpEEr/01wvhc2xIQB9veA=;
        b=awGtHOpoqQHRWSCk/QNjDlljYCAkGBCFoMhvLopnPJPC76WHHLWguYisPJqLqB0wHz
         TE5SkTGOgbHmTInpkDJOoYEP49XKBpcWQb/hOMU7qDfOmHD998vdEElSYL0UNhROOHVa
         uwhvl98d8Yq3iecdySh8Nn2ocI5+9zKp9ydeLsmJHYAf9gxiZlDvxI03gZFlbzDnYrjL
         hkQGXO6WutkT+A5btb7VSmLjReCDHuwLvTHHKBC8u6RbTyylLIiKVPcFFnS5MBPcI37I
         U+VjBKhtVRNEETfLppE//gO3JpkyIL7UPy/CJ9gq6RW3ELk5piFUZVwB+7s7zS4jYIvy
         hJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739638676; x=1740243476;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KDNZRmX9cp47bNPUDnDP3nRpEEr/01wvhc2xIQB9veA=;
        b=wOSSFDY//cPOPe16Pr3C6MzThUmLZJF/QgMBEZ3n6RfphZgzRn51F0bp65ixzyZunT
         ehvvIMvPCPaJfdo+GNlkmsL/rGiUj5z2YECnIX1gESXHHv0NVyKlQAhhZcVJOp9JanA+
         u/HWuGUK4DUE81O8UnViH5NMqAA7VEfHs6t0BhJbUhYsIYh0YVnkolLt379GqUDM2vAa
         RJfeeO0n+9vfTe7tyklmI+YuQ9kY28mAxl/Xc5E76xZP10AVI8yTbxO89xg7AqGWzFYc
         KCFDkALeOgrC2HbdHmr4JSsrRbJ99DaiSJu3BGYY8cqoPUp0XCY1MFaM6tCWMxLquRKm
         sGrA==
X-Gm-Message-State: AOJu0Yzutd+ZyIOcYO4BXCitrslHzYfXAq0NDoDvkJ6gZPXKDyhZHx14
	Zh8716o1omkrLPexQ4/6aPS8fniRYUH4XygsWesak47Tm/MGIpGrYb6tYh7sRBE=
X-Gm-Gg: ASbGnctEYwbqYm2kQrRlJBtOjeLkvDGoryGkxwa9Szt4J+IW5QdR9RNaNl0FBVoeDL5
	fNtpRyYGJhevDmFg9BHEFqZdsUwiyMN+wSs7uMuzE41s/7dNqdU6IT5BOJ7ggif1gNzNplBFukN
	COvCwDyPhTslYBdqHLqOnech19906wwwI6dFxMJkfks4Sydy97CSs8HY04608V7WhG+6LMBoZ1+
	1xK3JHVSogTId+Xdizb++fj3B7+Mk5RBWtBGieYOaG75mwP4QXATw3U2kOnUemuQjPyvnn3h5Zn
	GW9W5ZUC5An/eFPpjnzwBCON
X-Google-Smtp-Source: AGHT+IFTKFYxT7pnJGrZdPmNe4XBatjjSmbkZ3phXPAo6n8cPTCpjh0TufWp+f5ZFCzEhuium/+FZA==
X-Received: by 2002:a17:907:774c:b0:ab7:a5f2:ed27 with SMTP id a640c23a62f3a-abb709337fcmr274119666b.8.1739638676408;
        Sat, 15 Feb 2025 08:57:56 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb5781da94sm217046166b.85.2025.02.15.08.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2025 08:57:55 -0800 (PST)
Message-ID: <ee14c4ef-04d9-488a-8304-75d9401b76c5@tuxon.dev>
Date: Sat, 15 Feb 2025 18:57:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: soc: atmel: fix the args passed to AT91_SOC
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250112-atmel-soc-v1-1-822937f1dd5a@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250112-atmel-soc-v1-1-822937f1dd5a@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_085758_622762_C75856FD 
X-CRM114-Status: GOOD (  14.54  )
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

Hi, Dharma,

On 12.01.2025 06:41, Dharma Balasubiramani wrote:
> fix the arguments passed to the AT91_SOC for SAM9X75 SiP.
> 
> Fixes: 5eb64f2b368f ("ARM: at91: add support in SoC driver for new sam9x7")
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  drivers/soc/atmel/soc.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soc/atmel/soc.c b/drivers/soc/atmel/soc.c
> index 298b542dd1c0..273c1420fd40 100644
> --- a/drivers/soc/atmel/soc.c
> +++ b/drivers/soc/atmel/soc.c
> @@ -111,17 +111,17 @@ static const struct at91_soc socs[] __initconst = {
>  	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
>  		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
>  		 "sam9x75", "sam9x7"),
> -	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D1M_EXID_MATCH,
> -		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
> +	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
> +		 AT91_CIDR_VERSION_MASK, SAM9X75_D1M_EXID_MATCH,

As of [1], chapter 37.6.11. DBGU Chip ID Register, the chip id is on bits
30..0. AT91_CIDR_MATCH_MASK is defined as

#define AT91_CIDR_MATCH_MASK		GENMASK(30, 5)

Is there something wrong in [1] ?

Thank you,
Claudiu

[1]
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf

>  		 "sam9x75 16MB DDR2 SiP", "sam9x7"),
> -	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D5M_EXID_MATCH,
> -		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
> +	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
> +		 AT91_CIDR_VERSION_MASK, SAM9X75_D5M_EXID_MATCH,
>  		 "sam9x75 64MB DDR2 SiP", "sam9x7"),
> -	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D1G_EXID_MATCH,
> -		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
> +	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
> +		 AT91_CIDR_VERSION_MASK, SAM9X75_D1G_EXID_MATCH,
>  		 "sam9x75 125MB DDR3L SiP ", "sam9x7"),
> -	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D2G_EXID_MATCH,
> -		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
> +	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
> +		 AT91_CIDR_VERSION_MASK, SAM9X75_D2G_EXID_MATCH,
>  		 "sam9x75 250MB DDR3L SiP", "sam9x7"),
>  #endif
>  #ifdef CONFIG_SOC_SAMA5
> 
> ---
> base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
> change-id: 20250112-atmel-soc-40c4b40c9b68
> 
> Best regards,


