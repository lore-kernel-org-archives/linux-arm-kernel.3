Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46413D13594
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcDAqbWqsvymz4STwgK63u6lc06fHWC6bKwW46nTONk=; b=ilmbtWTV+lYeteabSaTaIQtJEG
	Da8HRIVNHVHo1POwc3J8eneRVwGOEzwHYAnmbZH88UxrU1y1ErJhLQXoiGEMPKH/NegHwuU1uSEAj
	PyymIM7b4IUALQvMhm0bXuRmKK2+yOT5IPaqdwllZLyaEjVljyl6TbmuSc8Sq8ZRzb7HyEDKkb9iY
	oi+g+U40VBkGzHlR0heZ7l5VyKQbmzm8hvm4/XdcT1qW55PynRkkzlKikVyoZa8+8WaAcx6ygSHO9
	+msLiPwrdhpSoCDm+kw/qa7ULe3xlx6C/C1Xd526IYmO9uxnBH7bMXesBVLl/8s7S3K720RpzaYZj
	W8QPNgSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gZu-0000000DUbu-2BHw;
	Tue, 29 Oct 2024 07:23:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gSa-0000000DT4G-2zsD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 07:16:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-431695fa98bso49690455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 00:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730186171; x=1730790971; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NcDAqbWqsvymz4STwgK63u6lc06fHWC6bKwW46nTONk=;
        b=HsS9lF1wtfKHYz+FIPGyQtyaU7s46CxlM9BulthWR3h3cv3J2DQO2x5K99gc96NcKw
         EU5vu8eDxVFkqjEdymZekEa/L9Wh1isFXrPLA6XkfYMHNyC5qE1ZHIQXZaNqZD5LOoiF
         7trSQZ30tpxT92dPh4/skfG/UC39o7Pr0Q7VbQOypEhah9KZpXlzs7xp2TN2OpuWfrxW
         Zg2HswGTF33o/uDJf6EcGi0O6H7v4DAPpzPB5NiOxkafB1amNRzCp52OA8daJYMCHvKP
         F9GHdUwsFiEjlII9QlNlkRNaeX3VsruvxDVhqq7K9X/C4nzZmz8+XsjWVxH9GGv61QgS
         CMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730186171; x=1730790971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NcDAqbWqsvymz4STwgK63u6lc06fHWC6bKwW46nTONk=;
        b=WVfJjPrqgo6qIPeBtLovaTmMn2xCCESX0ZkHHKauICA6uIBNrw+QMLIJC6NQ4iyUEM
         /2f6OTvgQbPQDg0h06q/23Q6fA/iQb7Vce7oJV1o6L94C4wZfRjFfsuwm98v+BeoyggP
         JimXBM7hRN8XAUIXBaMQCFBd42lI5G5AVphL4tzIa1mDUAwf++23qzbceuRETKoYND3V
         k2kgwPxTcFvkE4xkngNKyUC9bbynyDx13bJjgOt/GsWhZ1rOGqWhvrye6psIs3jr/W8R
         sSjbOO5aBXMXJUkqeqfMIUUsfDlzmSRyn4R/2oAei8KTpz3o/WDIZQOvBiSGBu+5XVes
         rxuA==
X-Forwarded-Encrypted: i=1; AJvYcCXcqvi+9pHB+9dtfUUB0dlLRBaFzYHJh7O2RcSxr+NjOH3heFC6MM1QJJ6xktgWNyaclYw6dy4HZs83eZ+z6CaC@lists.infradead.org
X-Gm-Message-State: AOJu0YxOCqHx97LCmqGvTdT+kHzHeJnat5brq0C5t4OSkgKyQ995ItDt
	/EDPpF8JN0lrbPH8M25w02DzVlun+cGFbmQAjMfgLR3VgwSVaduWnMfzMJipPFo=
X-Google-Smtp-Source: AGHT+IGyPTVVmj2DPxCz2CTebpQz3Rt+6BKUInDdlX4vKTXedS2U3OsrdThrefTQ1j8XH9/JSVrTRg==
X-Received: by 2002:a5d:5711:0:b0:37d:47b0:6adc with SMTP id ffacd0b85a97d-380610f8251mr7858179f8f.4.1730186170958;
        Tue, 29 Oct 2024 00:16:10 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1c69esm11636277f8f.13.2024.10.29.00.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 00:16:10 -0700 (PDT)
Message-ID: <239d2425-52f6-4deb-964e-e22d1a1f6637@linaro.org>
Date: Tue, 29 Oct 2024 07:16:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: atmel: add at25sf321b entry
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241018-spi-nor-v1-1-d725bfb701ec@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241018-spi-nor-v1-1-d725bfb701ec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_001612_814165_E8C98774 
X-CRM114-Status: GOOD (  17.55  )
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



On 10/18/24 10:51 AM, Marcus Folkesson wrote:
> Add entry for the at25sf321b 32Mbit SPI flash which is able to provide
> SFDP information.

then we could initialize the flash based on SFDP. If you don't need
locking then probably you won't need a flash entry at all. See
https://docs.kernel.org/driver-api/mtd/spi-nor.html

> 
> Link:
> https://www.renesas.com/en/document/dst/at25sf321b-datasheet?r=1608806
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  drivers/mtd/spi-nor/atmel.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 45d1153a04a07b7c61f46b117311b24ab695038f..e635559711a4b402d23d49da93efc15e6be571dd 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -238,6 +238,12 @@ static const struct flash_info atmel_nor_parts[] = {
>  		.flags = SPI_NOR_HAS_LOCK,
>  		.no_sfdp_flags = SECT_4K,
>  		.fixups = &at25fs_nor_fixups
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x87, 0x01),
> +		.name = "at25sf321b",
> +		.size = SZ_4M,
> +		.flags = SPI_NOR_HAS_LOCK,
> +		.no_sfdp_flags = SECT_4K,
>  	},
>  };
>  
> 
> ---
> base-commit: 200289db261f0c8131a5756133e9d30966289c3b
> change-id: 20241018-spi-nor-dc29698dea0f
> 
> Best regards,

