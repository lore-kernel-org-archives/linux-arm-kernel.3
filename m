Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68535CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgsWJ43+sPMyFM6YZi9dneb609gv57UFa/hUFdFYocw=; b=2hCCsw1cexPwFSXLNXmAeqCI+B
	SGNOEXLlKxwx0lRvIvwT/mqoKUabevXyc2GriLZQB4mqj3oz2fRMrHqcZhgst91tDBpnBtisMA4ED
	R6oAR1Xd6PgfbEa6mphO+GChpRxlPWUpxPdZ3d64CBQE0BqKiAXQ7PaREo3F4xz7y7uiJFlFguvLf
	oIBffXgJlyBjxqrmmnpmICEDV4vq6BtdEVV+Tn4oePpScWTutXbxmB/dl5yUHU+a7M2mxtedNfCX/
	yVn5/qelQwuVALW/HvlDY2gkH/D0wNp55lXmjOZwNc0fnwOXfRZHxXm8l4yAx8k/y1gnl2qPr78kg
	eDJO2fYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbMM-00000000kh0-0K2L;
	Wed, 06 May 2026 12:28:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbMK-00000000kfv-0KGK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 12:28:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48374014a77so75507645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 05:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778070489; x=1778675289; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fgsWJ43+sPMyFM6YZi9dneb609gv57UFa/hUFdFYocw=;
        b=nAv3yooAIynbmrL3aCnwewdKI8XPU3azqmG4psFDvAwXDWQ88gi0wJRQMkAo3nWHen
         UI/NRc/bywM1RcP1NbkIIGTgFh3vj7N2qLhZJ1UhLrxQdMxbuHhDz/RN9sY31bZW07wt
         Nvp9QA7BbmZX3q4J94NpHGEgx9r8iNa7C5YAbe4dFTGRZP+x57VbJ4bVVulfbJIXm6ey
         nSTIhNkWKR7DPVm7yno5m8f0QVM0wTzmQCO0MjlyJ5SqOH9efRYXJe1qgl6XmXIqrqZ8
         e5+bF5mHfd3whkdw6qVbpFqXmM8ksAGQRmrXs929boWo79mf4bW5MnP1V2DSNR3GtzZ3
         9pQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778070489; x=1778675289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgsWJ43+sPMyFM6YZi9dneb609gv57UFa/hUFdFYocw=;
        b=tN6gP35j++wUebOti0XyxYzVVfYVOCZ2Tp28wxVmDD672WXcNkDau3zlPI1qaQ5n39
         TEyAYxAdc/utaOddYQm4aSGXxsLF0o7pd3unD/qiL9tkNVg9pNioYG0kyAXfdGc+v+bb
         EKC8UDF1RivZcNUgIiDYuEyVLwf2DGT36gLhd4HT4iCCgWiyzpIXfBzxCTD50oZXab51
         zmExZAH6Ztikrm0YsfRz/UZHDdWB85D3Lr8+1FZAQjueauTxNAwYxgdeiRparJ3Ke1p1
         uKl+riWZ9+C6aq9/y2DNOlcIz/Q1+VWOLMFbrPQLb2QcodXXHh41c6xc2hpJFYHOo5e/
         UaPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Bgqz4PnX1RqOBXo6DQBafcRKIgJea80bWXaMWUiNFeNY7VydOKVzvzpUW5iRf8bo8aEbFwJM2L4WzleqBYO1x@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ79dn9l2sWQqhuB62a56gUZ1QmIENjg9j8orH9jaJc4T8Eyq/
	8mbhgwOfNi7MwkazMWqiY/JJh+7povTE1oSjv+z0CIN2pNLeSxAct/SgUAAm5oR3C24=
X-Gm-Gg: AeBDievnL8Ey2Sc8zxBbz2RVMSqZnHSgu/JKLA7f/9LtcofGJiEfoqZ5nxDfZHdYoJl
	fvuSVqn3zZJC+MiM9DGfk5IVur+UVQVVm54FCOPiSMqhlbeh1UpNQIEBR/jWVcOFnqNnN0xFPCR
	NSF06DjpDM/PZGPtOL+idR0ILQYDar0Dp5a2J3nOeB2fg82YbMp5YWOa4trFW7mzf2s4XyXMnON
	yi9BkMFsGLNxxe8N01h3/9zfboPiLWc1+oV5aRLcuhZNxxJRIv8hK7r8N+HmLlEaI9kySbrtMAZ
	PYuU5Tw5MPKW5OvtU5WjjF2Jzl5rXHVP2ECjxdXBN32mohhtj9IB4V4Rl7GQgfAvYrXJwkAQAe0
	NNfRdvE5JwyxzzBT+CeP33aRJ6gKWIJy7IHIM/KiheDUqp7riHcbBSitfNmwJzxr96WtDhGYA1B
	xmtbJK1f8bnxbBOuTX1feXYu0nAUPlbXz2XX3MKfMSZRc=
X-Received: by 2002:a05:600c:811a:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-48e51f369c3mr57793395e9.15.1778070489168;
        Wed, 06 May 2026 05:28:09 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e539109b7sm41077585e9.15.2026.05.06.05.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:28:08 -0700 (PDT)
Message-ID: <06406c7b-c141-4997-9921-9358cdea7641@linaro.org>
Date: Wed, 6 May 2026 15:28:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: s3c64xx: fix all kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Juan Yescas <jyescas@google.com>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20260416224056.985233-1-rdunlap@infradead.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260416224056.985233-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_052812_153586_9BE3705C 
X-CRM114-Status: GOOD (  17.16  )
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

Hi!

You missed adding the SPI maintainer. +Mark.

Also, there's another kdoc warning in that file. Do you care to fix it?

scripts/kernel-doc -none include/linux/platform_data/spi-s3c64xx.h
Warning: include/linux/platform_data/spi-s3c64xx.h:40 struct member 'polling' not described in 's3c64xx_spi_info'
Warning: include/linux/platform_data/spi-s3c64xx.h:51 expecting prototype for s3c64xx_spi_set_platdata(). Prototype was for s3c64xx_spi0_set_platdata() instead

Cheers,
ta

On 4/17/26 1:40 AM, Randy Dunlap wrote:
> Add kernel-doc for one struct member and use the correct function name
> to eliminate kernel-doc warnings:
> 
> Warning: include/linux/platform_data/spi-s3c64xx.h:40 struct member
>  'polling' not described in 's3c64xx_spi_info'
> Warning: include/linux/platform_data/spi-s3c64xx.h:51 expecting prototype
>  for s3c64xx_spi_set_platdata(). Prototype was for
>  s3c64xx_spi0_set_platdata() instead
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> v2: add tag; rebase & resend
> 
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: linux-spi@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> 
>  include/linux/platform_data/spi-s3c64xx.h |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> --- linux-next-20260415.orig/include/linux/platform_data/spi-s3c64xx.h
> +++ linux-next-20260415/include/linux/platform_data/spi-s3c64xx.h
> @@ -30,6 +30,7 @@ struct s3c64xx_spi_csinfo {
>   * @src_clk_nr: Clock source index for the CLK_CFG[SPI_CLKSEL] field.
>   * @num_cs: Number of CS this controller emulates.
>   * @no_cs: Used when CS line is not connected.
> + * @polling: Using polling mode when %true (no 'dmas' property in devicetree)
>   * @cfg_gpio: Configure pins for this SPI controller.
>   */
>  struct s3c64xx_spi_info {
> @@ -41,7 +42,7 @@ struct s3c64xx_spi_info {
>  };
>  
>  /**
> - * s3c64xx_spi_set_platdata - SPI Controller configure callback by the board
> + * s3c64xx_spi0_set_platdata - SPI Controller configure callback by the board
>   *				initialization code.
>   * @src_clk_nr: Clock the SPI controller is to use to generate SPI clocks.
>   * @num_cs: Number of elements in the 'cs' array.


