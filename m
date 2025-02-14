Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CC6C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 06:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00T2ImKqG2q8X/m5/Khez9kmb7XoPbfhx8Bnox/fhX8=; b=vdU4p0kslcsG+cON37JyiTyFJS
	RmCCAaTnvenz9FfyFq6Qvl6BQ60YL1dtbNmMKPAfsAg5rc73CKF4lLHVcNQLAT0hznwYaHsJGLPjc
	gGqEgx2yObvjMUmdBFw4jxBcW+C1l117bB1UepO68TkhAfJDy73Un0K2cNAFvK1Lzuub2XuDuvmqL
	1AXtEPTGFLOAv2qMMEV1KiNamRD6pKurfZUYbnHFETzhjJWm02FGez6YQSNXNwicFaBHive9WVl93
	k1WBbZLdTuf/Njk5pbtWnzTvRCxf1z2QkIXLKxMq6bDI1+YBizQZvS6XXqLtyuw9rdbcK0240nGxi
	XuycRY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipaw-0000000DsJv-3UBs;
	Fri, 14 Feb 2025 06:54:38 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tipZW-0000000DsAl-0M5S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 06:53:11 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso2968610a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 22:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739515988; x=1740120788; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=00T2ImKqG2q8X/m5/Khez9kmb7XoPbfhx8Bnox/fhX8=;
        b=Budh9fqI6MSLjNyp3A4e7c0JFDlpQNdJbEjpMn4WSlHsOaWshDR/fRF3JrrfMRpxXY
         FCgrPC6iftj2dMJkDgQhHo3zSqjLbtaLGXxY86t1Axe1L6XqryOb6P/kAHX9Y45YkeGX
         Fen/MUTCqa6qB77FCUOKVgisP1s8T7L7SrjStGCi0fC/yUwmVWPDDgun41aEFP+Oyn9W
         kunv9ysqUknRQsqd+HcBrG4QQe9QiOQvkgeOMuNStioGPiwXCbGIkBlA19v63FkOaNAE
         VZOkti7ebmiXVRU7dxzR8tn/fDhUbkbDP8q/DaxSlrRPCDFlqP8GQYSEXl8dL6trd9VW
         G/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739515988; x=1740120788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00T2ImKqG2q8X/m5/Khez9kmb7XoPbfhx8Bnox/fhX8=;
        b=vCBgBpt6CgpDi0JSpWdU7GtHsBpl32VUSUmcFu3kYJy4JYluUW2x08dg9BCbODx0+m
         xto1sBGj+QFQijQQy2x2Iqn9zlo2d83DhTQdh3IrqpJVn68jAgIjEyLQEX9+AMGzVNA7
         rrmHDplgnEmu2X+wuSbn9bRFuSvFKAKY2WOnbhUviSqctBopo3n+ruXVXu1e94FRQkch
         6/J6ecwaXQYYuOgIgHOtWjzoUUMo17CPJ42LllwXeelk+AjwelO2kxBOjdNli8nbsAjl
         VhE68h209tJouakDvvbG53F4eiR6Dadv0DK7PNNAIVvsEMb7lfFmAhS2lTNBxQSN0HIa
         kdvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhRPdRJ8dWPUqMkmgVEXEpFwE8GVBK4igSjFK0wVqZyFgglPlpNpcz68f/+AhwCtu4wTndupE6jAFHQkiRKInL@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmz1Ybb0lLvs0xLbziBnU8Fo1Y+JGuUNKVAeKqwBTtPZrfmTR9
	46iQyDIQPl9yq4XmHIXQsEXFtFM0/YVirDQUwNGNKLafFM2yQ+ql1u9ZZnXQ8Ko=
X-Gm-Gg: ASbGncs8LJfs8GtpRe28QeJgZxnUC1SfOuwzh5WB96LjJ8+FQHEPNbnQKIWr7xDsZ45
	szJth7ZfPcu8ni+Pdz3DEz50MTxdWxLkiB4nG08qG0Ci/7DuJGClzeXwM+cpm1iwbJy+MMyr9dA
	IkIsVzW5QzFgaB+F0EKfqKFfWNL92XRDWTrX6y49phKeDI56x1rs3I8Q5I3GQazJfls3gP3ZSHi
	TxLnzbojmW64WtnCjKagAYpR7bpDsf5XniJxVv2tbnWa3yX5hlMZUZoj7RbHRQOPgVFZiNo5G6X
	evvDKBaEYn+j9eVQVWuFhTpe
X-Google-Smtp-Source: AGHT+IGXgRThBo7whBqMDD6umXjpqv2Cx6RqhrMtLSVb4XCNTRlLfTHBJzqRYVPktZC+1NWyeqaxJQ==
X-Received: by 2002:a05:6402:4025:b0:5da:b64:e5d4 with SMTP id 4fb4d7f45d1cf-5dec9fad55bmr6890118a12.25.1739515988458;
        Thu, 13 Feb 2025 22:53:08 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece287c7fsm2379602a12.70.2025.02.13.22.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 22:53:07 -0800 (PST)
Message-ID: <4dcf3258-5e98-4f6d-bce0-e79c36f1f8ca@linaro.org>
Date: Fri, 14 Feb 2025 06:53:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] spi: s3c64xx: add support exynos990-spi to new
 port config data
To: Denzeel Oliva <wachiturroxd150@gmail.com>, andi.shyti@kernel.org,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250214043343.263-1-wachiturroxd150@gmail.com>
 <Z67VP6zMwFcqFurH@droid-r8s>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <Z67VP6zMwFcqFurH@droid-r8s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_225310_134101_B0284D32 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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



On 2/14/25 5:31 AM, Denzeel Oliva wrote:
> On Fri, Feb 14, 2025 at 04:33:40AM +0000, Denzeel Oliva wrote:
>> Changes in v3:
>> - Reordered fifo_depth handling in s3c64xx_spi_probe() so that the DT
>>   property takes precedence over the default value in port_config.
>>   This allows node-specific FIFO depths to be applied correctly while
>>   preserving a fallback.
> 
> Showing evidence:
> [    0.339111] s3c64xx-spi 10920000.spi: spi bus clock parent not specified, using clock at index 0 as parent
> [    0.339119] s3c64xx-spi 10920000.spi: number of chip select lines not specified, assuming 1 chip select line
> [    0.339467] s3c64xx-spi 10920000.spi: registered host spi0
> [    0.339589] s3c64xx-spi 10920000.spi: Samsung SoC SPI Driver loaded for Bus SPI-0 with 1 Targets attached
> [    0.339597] s3c64xx-spi 10920000.spi:        IOmem=[[mem 0x10920000-0x1092002f]]     FIFO 256bytes
> -------------------------------------------------------------------------------------------------------------
> [    0.587452] s3c64xx-spi 10650000.spi: spi bus clock parent not specified, using clock at index 0 as parent
> [    0.587462] s3c64xx-spi 10650000.spi: number of chip select lines not specified, assuming 1 chip select line
> [    0.587847] s3c64xx-spi 10650000.spi: registered host spi1
> [    0.587986] s3c64xx-spi 10650000.spi: Samsung SoC SPI Driver loaded for Bus SPI-1 with 1 Targets attached
> [    0.587997] s3c64xx-spi 10650000.spi:        IOmem=[[mem 0x10650000-0x1065002f]]     FIFO 64bytes
> 

Why does this prove that the IP works?

Can you do a loopback test? See drivers/spi/spi-loopback-test.c

