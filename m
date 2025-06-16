Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC37C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 23:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhqwSDdN0As9EP8iCCAnsHFrVsuS6BmzZLRtm9F+Ab4=; b=Fqt0CBv+4qSROKpiQ119fKDoT/
	jto9L4BQ5J39z9AvOVV+wJqeNIEQye4ZDCxyHsu4XA2JUJvrHA5Ao91mzZLvmuSDg2m4UJ/GTjmod
	02TFQsS7StSrNgfXhIsPpG0rf+BS6kYj3/wNlpFRwu+T2wY+yJEhO9JbQbucro4mFZ9tJlKtW+qRX
	uEnLPRhQQhyy/NmlbKgdoTospA4ikYUuV2kW6qZ9msp6U+mpl2gEHUxCCeASN1FeIY1yj86MP/33h
	hMvcxWHyae21AJbt5zGr4v1NYsXXzPv80EWE5owZOEIm+rn4F+Yp4RXeQXbRSroVmPEWV1drq2yHo
	fG5/59vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJ0d-00000005nZ6-2pni;
	Mon, 16 Jun 2025 23:12:59 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIyN-00000005n9z-3C10
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 23:10:41 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-735ae68cc78so3453581a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 16:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750115438; x=1750720238; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZhqwSDdN0As9EP8iCCAnsHFrVsuS6BmzZLRtm9F+Ab4=;
        b=mNQng+IYpoQWB8LK3aUJp0hL7g4stT7nsEWzhDTdUxdAjYJl1EorlCubW2uhYRwrZD
         hkXfFjHWHO4lg9cXejFK7uYA4DfPfZhQO3qtfeS0hr5YD75oiAW5NBa6eHV0aEDpq74i
         AIOg27fGOBIgWuNEw1C+8K8PNeH7xU9zWN3CpRyRtws875hNWo4NrN6q5EmUZfziYBjk
         m76ndhby7+YMFwEXmDF8dBGImarFBvvG3xjvnuR4ajQ0L758whsxrKIHIcCsy0ikNfTn
         FtWGQRIRloSH+z9pdgQKT0/f9nAY4Yj1z0aSYAf/KGn5VRpyJvHEvGqMTYYTtgV+WGyT
         Jg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750115438; x=1750720238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhqwSDdN0As9EP8iCCAnsHFrVsuS6BmzZLRtm9F+Ab4=;
        b=vDqYQxfMlHbF/hwkVFDyLDecbTc7/99997YV3pvkjZvuTEnJps6wTPrBlL+uzrwi75
         gjKjDV6CfIYPI5NKELMeE000oalEEYVgMADbW8/WtrTw6EZio9YpG35FLCyHmrh0XUAv
         k0ej6PPDaM0Z8KmdTbu2e4KwWYHdhbuChYd2xpKcxWGZ6rfUYOkrSWKHiXusTFg/98Lj
         A8n27SKlQtzcMSzmJVRKVT62L2M9Uv6Ubg5kInXWYF/2bXna14Xp0hKYXKmn5xbHJaxY
         2/13KKN4OUnw/8xcYjrEJgfqK7nVvVVKOLX2yzRC4hV8WVlnANEJDRIJNPdN0y6s3UMx
         C7uA==
X-Forwarded-Encrypted: i=1; AJvYcCU/CrQbYVGzzwjM6+qtUVT6XDq9v0l/843XxSh+rcmdj4i0a0Rx5fqYbbu6YWEV1B5jCwLJAxP4K9w+SXcPEynZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzxuFgUlj2g+Cxl3lM14vC9QZiEKmOaLVo+8z/t96PUyIHLQ9A8
	yIVwktjWJv7W0ZLSLkuYpB42HN2isSprBbNrbx2bT5QjgYJvxsTWzAHZll/FomwY2dM=
X-Gm-Gg: ASbGncsmsiIkfQYaL1FOm3HTRZY9ZEhle6oG84bY8uqeBh74tFvU4uX/xcKLO6okiQ4
	DAw94dJklYDq5AsVmpEi0Pq4ITHc7zycfKXalxHTpJZ1X6gHEF7drR9URkQhp0OGZZy/JJw+PBd
	DQFq359JF8bI8Xlx3jLWae0A5VbsdzocYd18fXELrQSDGx4IiNA84fOdkpIbSh8CrSNS2NirJnI
	1F8H6X2InKmQz4rvF0neT8SWR9l/hzsaA9ZQTIE//3582g+EZMQb+sqVe3qCxXt/KxJvTnBv3fs
	Hn2leppbPFUDkHtIWoSiBWFOvvbs9jsfWEQz9CSfwM5a7JCMNKmNLAzO056Ra/Tylj1t2hGSHMt
	7nlZjtNlydkSej7EHoh9GS5Fd0l8rmsc2sP4LFDM=
X-Google-Smtp-Source: AGHT+IEWczTOKpxrX7Kq4OJFYfDdAA9v5c0yaK836ViXrpfcsn3PHuwhhvfHdkmxcH18lsKBAQA0YA==
X-Received: by 2002:a05:6830:2908:b0:739:fe04:7aec with SMTP id 46e09a7af769-73a363ed869mr7767099a34.26.1750115438134;
        Mon, 16 Jun 2025 16:10:38 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:9583:1e37:58ed:10ae? ([2600:8803:e7e4:1d00:9583:1e37:58ed:10ae])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a28554581sm1377254a34.61.2025.06.16.16.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 16:10:37 -0700 (PDT)
Message-ID: <e4d80845-ddf4-487a-8ad4-c9429eccea4c@baylibre.com>
Date: Mon, 16 Jun 2025 18:10:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] spi: zynqmp-gqspi: Support multiple buses
To: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-6-sean.anderson@linux.dev>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250616220054.3968946-6-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_161040_042659_4A73E22C 
X-CRM114-Status: GOOD (  19.49  )
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

On 6/16/25 5:00 PM, Sean Anderson wrote:
> Currently, selection of the upper/lower buses is determined by the
> chipselect. Decouple this by allowing explicit bus selection through the
> spi-buses property.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> Changes in v2:
> - New
> 
>  drivers/spi/spi-zynqmp-gqspi.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
> index 595b6dc10845..add5eea12153 100644
> --- a/drivers/spi/spi-zynqmp-gqspi.c
> +++ b/drivers/spi/spi-zynqmp-gqspi.c
> @@ -465,13 +465,13 @@ static void zynqmp_qspi_chipselect(struct spi_device *qspi, bool is_high)
>  	genfifoentry |= GQSPI_GENFIFO_MODE_SPI;
>  
>  	if (!is_high) {
> -		if (!spi_get_chipselect(qspi, 0)) {
> -			xqspi->genfifobus = GQSPI_GENFIFO_BUS_LOWER;
> +		xqspi->genfifobus =
> +			FIELD_PREP(GQSPI_GENFIFO_BUS_MASK, qspi->buses);
> +		if (!spi_get_chipselect(qspi, 0))
>  			xqspi->genfifocs = GQSPI_GENFIFO_CS_LOWER;
> -		} else {
> -			xqspi->genfifobus = GQSPI_GENFIFO_BUS_UPPER;
> +		else
>  			xqspi->genfifocs = GQSPI_GENFIFO_CS_UPPER;
> -		}
> +

We could possibly drop adding the SPI_CONTROLLER_DEFAULT_BUS_IS_CS flag
and handle the fallback here instead. Like this:

	/*
	 * If spi-buses was not provided in devicetree, assume bus is
	 * the same as chipselect (needed for backwards compatibility).
	 */
	if (qspi->buses)
		xqspi->genfifobus =
			FIELD_PREP(GQSPI_GENFIFO_BUS_MASK, qspi->buses);
	else if (spi_get_chipselect(qspi, 0) == 0)
		xqspi->genfifocs = GQSPI_GENFIFO_BUS_LOWER;
	else
		xqspi->genfifocs = GQSPI_GENFIFO_BUS_UPPER;

>  		genfifoentry |= xqspi->genfifobus;
>  		genfifoentry |= xqspi->genfifocs;
>  		genfifoentry |= GQSPI_GENFIFO_CS_SETUP;
> @@ -1316,6 +1316,8 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
>  		ctlr->num_chipselect = num_cs;
>  	}
>  
> +	ctlr->num_buses = 2;
> +	ctlr->flags = SPI_CONTROLLER_DEFAULT_BUS_IS_CS;
>  	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
>  	ctlr->mem_ops = &zynqmp_qspi_mem_ops;
>  	ctlr->mem_caps = &zynqmp_qspi_mem_caps;


