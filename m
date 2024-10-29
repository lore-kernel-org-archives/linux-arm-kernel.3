Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35894D2AB1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 10:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DN7KbVPzR0Ss7/4UGrf+xZAi7oyW24SdUifFCTdR8uM=; b=m4p/9hRcZ7YCO+B6rOdTb6eWDU
	rMQUUq/DkS+vlxH4l5TCdtAKQmtM6/omaKAl1bY5TqLiW6AD5yJx1LM8LDKCbCP5CLVq50QKhPSfU
	g6sTbaGidMgZ1NUZN2Pn/KFeQU+Z6FTkuq22b8szo6Jw/HZXlXnVzZT3M7DqRAE7oy+L/AzxJCCav
	qVQ0qOFHtxQ+X8ZcOjgTyKp0mDvdjHfVYqg4YZXYDRYNTfC4H7ANqjnUb0VKOHTddDmf427TxfJU0
	JK12UBZ6CJ06M2t6HTGHjayk2nPVNxhQuU/hqOGI4NHLAtlXjVV01bnWguII6dia6lwutPhYG1JSf
	i23nbA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jPM-0000000E1bc-3Xme;
	Tue, 29 Oct 2024 10:25:04 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iyl-0000000Dwmr-0M6X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 09:57:36 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so3939617f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730195853; x=1730800653; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DN7KbVPzR0Ss7/4UGrf+xZAi7oyW24SdUifFCTdR8uM=;
        b=YI2+Ge3BGlGPXEroEROUfjmUkYb7KHpWbiLB7ygP87rXqwWAaf/Xtv00/EG1GxIP0j
         uKeQO8uUxfqT4I/sl65rATZl5nVUJZdZRbUk6lUDR0N4UD5ThojQkhpPoXA8No+p9Utc
         25ZWCIURqYhGzRO3GvIOhnKv6QKbUSPvhLFFwMBNKvETlBtB1G2LohheBqrdw0+3bUcx
         lE1koo6fRdRy6c7k6f1An7dnH+ycJwXplahkj91XgAVd/FL6nOGpKU1qcgZHEoaB8Q21
         DXYv3P0shGiys8EkesVuIA8Prk8yN1/KQm3j8Q8HB+lzyTsVI8PZfmuoOGpJgwaKJBGh
         5xzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730195853; x=1730800653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DN7KbVPzR0Ss7/4UGrf+xZAi7oyW24SdUifFCTdR8uM=;
        b=CqZLzSGLqrrYtJfAeMMyAMweis3sT9++oOr3SZEP5aXMe6dr0utcc8wN2re+q3InZm
         Y4b4barpMmOR6BcuPJIoGLQqi9FNZOzh5Pn8rGBfmkxrKztqKTk1X1djDiZUdVg964zn
         enU3+d4SAg9JJg9TJ8fFwgbwq0gTKYOAzunA7adKITc0fRmgjtzirjSMY7+KkCQ7crp1
         9FV2HFIsZ59bQ4fUU83kUAiyauRVY6cLtQ1g4WOCAMYs4iT0vqE/mBo7j+V5du6F+qe/
         XPNxP6mRzf2GjQZnXMyHtJ5uDxCZs9rbtOF4Uwe1PvG84dsXBaZhq+CJP54e9our9Jzl
         /ZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoCIJUMW3qf+iRjYcP8GyJ4XxM09ewnJcZo5xodX98TgKxW7SPrW/hlZUENfqrwroeiaNonaqPbIVx+QvznFmo@lists.infradead.org
X-Gm-Message-State: AOJu0YxlKk81UvH/VuCPcEynQF4497p3CZGWkb+KUsurh2nvTmWG4lz1
	mYNQSnYkOONaBkyjTKw0WEcZ7tCfp3pNcBynhLIC24klwn9ouMIZJJVA/j6urZQ=
X-Google-Smtp-Source: AGHT+IHhmgSstrKyHX2Iwez/d7VdkcjXlscKVW8yRli6oSKJ8qbcBw12V0iO42/emHYeLXIDzokkEw==
X-Received: by 2002:a05:6000:bd0:b0:368:37ac:3f95 with SMTP id ffacd0b85a97d-380611850a0mr8235479f8f.31.1730195853404;
        Tue, 29 Oct 2024 02:57:33 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bde6sm12026123f8f.40.2024.10.29.02.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 02:57:33 -0700 (PDT)
Message-ID: <470c0b52-17d1-44e4-9a70-5b410ead9500@linaro.org>
Date: Tue, 29 Oct 2024 09:57:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: support vcc-supply regulator
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
References: <20241027-spi-v3-0-42e81723bbcc@nxp.com>
 <20241027-spi-v3-2-42e81723bbcc@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241027-spi-v3-2-42e81723bbcc@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_025735_170161_1A54CA4C 
X-CRM114-Status: GOOD (  17.73  )
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



On 10/27/24 12:16 PM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> SPI NOR flashes needs power supply to work properly. The power supply
> maybe software controllable per board design. So add the support
> for an vcc-supply regulator.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/mtd/spi-nor/core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b6f374ded390a0c0429a61dd0579204e0e98bfa1..d95427c4f4d0839c5df348eeddea59582ef99d9d 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -17,6 +17,7 @@
>  #include <linux/mtd/spi-nor.h>
>  #include <linux/mutex.h>
>  #include <linux/of_platform.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> @@ -3465,6 +3466,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (!nor->bouncebuf)
>  		return -ENOMEM;
>  
> +	ret = devm_regulator_get_enable(dev, "vcc");
> +	if (ret)
> +		return ret;

This is all looking good, but please move it to spi_nor_probe().

All the SPI NOR controllers need to move to spi/. We stopped adding
support for the SPI NOR controllers few years ago.

> +
>  	ret = spi_nor_hw_reset(nor);
>  	if (ret)
>  		return ret;
> 

