Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915B7FEE4C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtW+TvDVbM5bVPkT5f4veuf3YOot6jvs+xND9WyGWvg=; b=caVoQECbuWcSJAVo4Zpv02BqgN
	8Gj3pcXCHnrliOHmegVzYa74KFdhGRGRVEtE0G+x7aRgEROYO9C+Y2qXPLk0de2ltYrL1CmRE3NyK
	9S/VI+XEjNRRhMYmzvT518c0VWHOJ140VRdrk3EAwxrkzRaNe10dgpY646ON2067rhaVp1Hvxk1pi
	NOVw84JlHDEmRJK+LZ7WTpQMlpKQN3Ad5ylxqqWd9k4Ztf1D0cRbWj8Zjw/BrIU8VQVP+DtnhCVNs
	Yb7R7UMCCK9s5XxM43EXsPktCSeQA11tnkuE5Wz47EZmY3WHviwr/mZSbjzdg+/djJoyRXEqMwC7j
	YBTKcAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLDC-00000009v6V-2gHo;
	Sat, 28 Feb 2026 14:22:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLD7-00000009v60-1XK0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 14:22:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48069a48629so32429195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 06:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772288543; x=1772893343; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vtW+TvDVbM5bVPkT5f4veuf3YOot6jvs+xND9WyGWvg=;
        b=AJXCJwbWZCm8ft6grh67HGBE2595He8QOzzvFSVRtxaXeU3Li+GfpPPSKqpziauZDr
         uNvWCv0M5jUf2wxFX5f9F43kzrLJflsX7daeosb6wDhf+XoTIpv1SrvcYToWDnjAD2oT
         FG9v7xHoKLWuGHTV+IMIAPIMjLMpN+TOFJXNZmmv5k1HRvBcRNe9pZbO6+HCSXHf6EEB
         zpJBEH6f9VTQWqZtHj/bBb4PfglJzG7FIsF+Y0LSJF4xzLMpyo3IRTUV4KxZ0PE7ho59
         egLpvojm4ZtXQHmyqLaoEbIUB8MtA0XZmzVF36d55Oeotv71TM8C4aR7xI5ZAeIY+KDH
         9VKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772288543; x=1772893343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtW+TvDVbM5bVPkT5f4veuf3YOot6jvs+xND9WyGWvg=;
        b=Al8BVFPuqLjKZ8wk+A+TnU2JXUnurIwPB2qNo/+9nsSlX4z4EmfRJ/zYuzc5fEQv8l
         qYfpB2aVbnbGsXi00vyd0ezBIY5Z/NwvRi+fcsTU6A9KCmThecMbuHxlgqi6II5mMoIZ
         njUU2Kxdl2MRqAjWswPBKbz6bpjlzx7kNACz8+RvHI3VH+rjKZsFCBXfbyh3+GvKCjXE
         E0J619V0B8UZz1+36XYcMlru0+wy8Sr3yz2y1UCTALZP0NQQow0k8VT2ZH8HWMIkgic/
         LTFB04YUFlBnEjDERSfj78kmJ4vca7deVH9puzdUUZ6PUXfiiVtysyML4SzLPeFxXQmW
         CA/g==
X-Forwarded-Encrypted: i=1; AJvYcCUiZcsrB0TSX9wwyxWBZUcSPT5vhiGIHY3nDFm2pUuLGAcfTg6U1ZGwR1+8X8paesHUOw3iRiZAcdCt6w+WIzFT@lists.infradead.org
X-Gm-Message-State: AOJu0YwOkmsOHYWnb+2PijIZr95vX1FXy3Fp/JXlAND62Uo8ghppZkoy
	7Ws/T1GiVYd3dDRtRoFJyWKGy6gS0oAdH5KX2NcY8NWKQ1hlffpFfjX2sAHu1TJlpFs=
X-Gm-Gg: ATEYQzznSqQFRuN/zIBbLEisuhx5OVR9X8vovf2Dx3u8CVzC0LuzLwXUPyBFkqH9dYP
	ilGbFsdnTW7jlmWcQqs22650Ixr1pQD8x9LLjeGLA/ApSO+F5tumC/+LkJzrPfL6EBkHlG1RL/3
	yHvlyWJJNowKEO7RMy+WdNJIoFBlmzKnd2gY+lR1zyl2MM2/rPNkuy74C6lhP3Oh3qtl6W4bxKa
	opOxVSdpWjYFYkPr70u0TbcG72dFWFsopt8wjYabbyoxeMNYlLbOX9Bcglv6wjHozVbR2IaF/MU
	S4H1Lv/B2f9LKH4l3b3mU0u/7oIGvTqRFm6rF8xwl2ehQNNjkCVXLgI9Y73HKKgtvUdGGtFxX3A
	qvq+QmRo8lHo0nN5soKFCUtLGdnFkvRNmNgH4Jwy6/UzfpLVKPm4WSlaDPuTeNSpFCmguGHvC3E
	p+gBNQPsHojgW4f6JBkZ3r89nyD3TnLA==
X-Received: by 2002:a05:600c:154b:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-483c9c2059bmr90939375e9.32.1772288543254;
        Sat, 28 Feb 2026 06:22:23 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb4f8bsm212800145e9.4.2026.02.28.06.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 06:22:22 -0800 (PST)
Message-ID: <9965d2fb-e1ee-4103-a5d3-01cb94468db0@tuxon.dev>
Date: Sat, 28 Feb 2026 16:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: at91: sam9x7: Remove gmac peripheral and
 generic clock entries with ID 67
To: Mihai Sain <mihai.sain@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, varshini.rajendran@microchip.com,
 cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ryan.wanner@microchip.com
References: <20260212100147.5007-1-mihai.sain@microchip.com>
 <20260212100147.5007-2-mihai.sain@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260212100147.5007-2-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_062225_438057_98209031 
X-CRM114-Status: GOOD (  14.46  )
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

Hi, Mihai,

On 2/12/26 12:01, Mihai Sain wrote:
> According with datasheet table 12.1 the instance ID 67 is reserved.

Could you please mention the datasheet revision ID?

> This change drops the gmactsu_clk and gmac_gclk entries from
> the SAM9X7 clock description tables.
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---
>   drivers/clk/at91/sam9x7.c | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 89868a0aeaba..d9603f1124d0 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -420,7 +420,6 @@ static const struct {
>   	{ .n = "lvdsc_clk",	.id = 56, },
>   	{ .n = "pit64b1_clk",	.id = 58, },
>   	{ .n = "puf_clk",	.id = 59, },
> -	{ .n = "gmactsu_clk",	.id = 67, },

Could you please keep this in a separate patch?

>   };
>   
>   /*
> @@ -702,15 +701,6 @@ static const struct {
>   		.pp_count = 1,
>   		.pp_chg_id = INT_MIN,
>   	},
> -
> -	{
> -		.n = "gmac_gclk",
> -		.id = 67,
> -		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
> -		.pp_mux_table = { 6, 8, },
> -		.pp_count = 2,
> -		.pp_chg_id = INT_MIN,
> -	},

And squash this changes with patch 3/4 "clk: at91: sam9x7: Add gmac generic 
clock entry with ID 24" and also provide a fixes tag for it?

Thank you,
Claudiu

