Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71741CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 11:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjBR+kR0t8TJ8QuirCE4bg/F9pyLOUYw+FF6LSil2u8=; b=s+7OUFQPGgFMNk7uff66uAm6cR
	fc31DKxuMuCDPjFk49gKnM+HbzyEoSUlAsuHHX2J71rJSG/zCWHVbeaV/xDKztG6eLpHXqbV/fp2l
	mOmkYB39BWP8LmPrVCm0BO3H+NDj63De6W1DTAUsZgfv/hssLpCyyLnWqJu81NsDcyix7vIiYv5Ec
	er9PVmnaj68oL9vbkiyJKPq5LxmCxdrRKtwQcze0/sJhjJ2u9FnEXmGRhDQfByNNqPb6S5cLt8+iG
	orYvDnmaI4xoKxg6wV2mPS3NEtYWBI9rrcgRd1pS+s821G8C/4zUEMaj0WMIBfh0J+N9fhUO5KPeB
	JlKzfGzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKlK-0000000AK6w-0Upu;
	Tue, 19 Aug 2025 11:44:22 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJ8Q-0000000A3c5-1Vy4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:00:07 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-afcb78c66dcso717377566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 03:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755597605; x=1756202405; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gjBR+kR0t8TJ8QuirCE4bg/F9pyLOUYw+FF6LSil2u8=;
        b=lQG8D3uJuehsqyhP40pb8ST60Pt+5HPEOVnz+l4dYnbOIkuRcI+NHUCA9ZgzGR+VyY
         1e6F83xBolf5vzqZ4oaiOoQDvNGnBiYQrONfhVq9BBaOUt5e8kYv48WE+3czh1cnrrh5
         V+/VvKi9pf+jw6ZLGX5uQ8uJ3EkssylezY1uGewrjpKni+N/QZBLsd85qjvYLhSRTHMs
         uBuD0HhtdxAyJp6w4VkVO8ERcCEItsU5LLQcbovjgWYgMetiO21jAumV6N5s65F6AKvw
         JHzCsho1fvIenShSUU7bI70nyt2k0x+Q80TCRYsITUV7I448R2yfJL5uEFRPY6HcZtvQ
         kQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597605; x=1756202405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjBR+kR0t8TJ8QuirCE4bg/F9pyLOUYw+FF6LSil2u8=;
        b=oRUZj/LGX/oXtJkUlulgMkAiQ4l9cqzBKyVaKfzNACtaQouKMYD9twRQFkIfYcnGEV
         a2WsYGSuYSOsVTArdEAShgLxHS5gstzYHsKqmwWu9MEw/rN6BudSppxW0dMmCXJRTkWb
         UUu6w9q4Mcljt5IKtEJIuqO2uvW3iKPh8V8yALc2jC+j4qX4cU2L9skchsbuN1+9nnhv
         3j0FXmcUJ2iK2KUn9oPvkFDK97y0p2Dcukk0hlEEAdh6B+EXLF4qlBA4xaRlgcKiISpR
         T2Zc68KhzS2YnaU5Tx5o1wbwt4g/EbZgtwgfmz/3CvNeu5+OnSp3lTG8B6QN/rhZFnyq
         gxLw==
X-Forwarded-Encrypted: i=1; AJvYcCX5cmt5OAUYJOis7p6zsrYlWE2Oz9i/rsqjg1AeIOW/6TNxNY/uaQ180w2QOJy69fR9fs+WvHJHYoX5RgavwPWs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3ArG1YjWvpm4MWVeSLeWESihTvVS5+/yWcdwz25PSVJaHFmUj
	wV9rFsjG9HAaJV3Ie0pWEsJggbbhMi5xf/W08OAyv5p9btBhP0UFF0ENCSfyofdZS/Q=
X-Gm-Gg: ASbGncuAHLbmsfTruXAuvVlRJpQvmHK3kWwvwuMzHyWlHVI0yBYC/1S6V3BFfz1I39u
	3+Z00XslOyJktzTKJX8jfDTiTogJpcXOC1/+ci7cY3EeVqqpM97tNx5BZr6VtL5iMSU4M1IP2Z2
	YMcx5zJwAN/pjb27my8S5VSAdYRRMQiWUzub8sVFYnjnPepX4vKD/QENwP528AljJyet0HiPKbN
	3GutO8ON5c7M47YhwODM2VsYZoDczjt9x2Y3CaedzSFrmQpdShQqtyIhKHI0BL6cSxW4x7s2Q7+
	tp0OTWRU3KGR2LtLBym1XeT++RYQyisAlQ+GHth1eSEiw2NneM9IsveePjRYn9Ui6woJAVSkWv+
	Lj+SCrYTKZ/YhEccX4GPQRVuG2pBXXwakurZjDjL7mY5u
X-Google-Smtp-Source: AGHT+IFPRArZTdTP+NLIy/Vie9G8nvUNWq182V7aJXvkqOBztXScKlilBZHnaP0cP/Vv2uPVCLOzAQ==
X-Received: by 2002:a17:907:3f1b:b0:af9:a4de:f092 with SMTP id a640c23a62f3a-afddd1caabcmr172982166b.55.1755597604424;
        Tue, 19 Aug 2025 03:00:04 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.104.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfccea7sm977812366b.67.2025.08.19.03.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 03:00:03 -0700 (PDT)
Message-ID: <e55326b7-7f52-4497-897b-32d67f522cd5@linaro.org>
Date: Tue, 19 Aug 2025 11:00:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] spi: s3c64xx: Remove the use of dev_err_probe()
To: Xichao Zhao <zhao.xichao@vivo.com>, Andi Shyti <andi.shyti@kernel.org>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "open list:SAMSUNG SPI DRIVERS" <linux-spi@vger.kernel.org>,
 "open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250819092044.549464-1-zhao.xichao@vivo.com>
 <20250819092044.549464-7-zhao.xichao@vivo.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250819092044.549464-7-zhao.xichao@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_030006_417890_4D28317D 
X-CRM114-Status: GOOD (  16.81  )
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



On 8/19/25 10:20 AM, Xichao Zhao wrote:
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
> remove the useless call to dev_err_probe(), and just return the value instead.
> 
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/spi/spi-s3c64xx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index b1567243ae19..3a00f9e480c5 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -1268,8 +1268,7 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
>  
>  	host = devm_spi_alloc_host(&pdev->dev, sizeof(*sdd));
>  	if (!host)
> -		return dev_err_probe(&pdev->dev, -ENOMEM,
> -				     "Unable to allocate SPI Host\n");
> +		return -ENOMEM;
>  
>  	platform_set_drvdata(pdev, host);
>  


