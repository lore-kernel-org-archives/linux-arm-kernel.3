Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEA7C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLbitD9Yz365jr3BdIqraX9XTg2iaE+GPbMQNtnpays=; b=pxeyqDl7vwXCQYEWH7lwU8m0E7
	1IRNSADfuplgzLAnBbqBMLLIxgC3oRt+CmvJySwSzh9U4Ex2F+nV08nETNoWXGR3mOCOK6Oe+d/Wg
	LciT3CzwhqLsKdOERipd1uBxrS/8ls47txIGAW3QILnQkEhU/c+wPxWwZSghHP6Mwvv7nr81zFd8W
	kZqV+T33a4vhYCOWVfV6iO9VavrAFV9hUnU+qihBd+B7MEjDiuH5gYozgjyTjZIwtKsKd/SAQS2T5
	xHWtLTK0A2VJis/jPBh3m7lefxEE9URUatQYp10BWDp/b9OIzGg9n0h7/cNN6lxR6z5JMkTn29iue
	hvsmoWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxoP-00000004qCx-0mWV;
	Tue, 24 Jun 2025 07:11:21 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxi1-00000004pRs-44NN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:04:47 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so168598a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 00:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750748684; x=1751353484; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HLbitD9Yz365jr3BdIqraX9XTg2iaE+GPbMQNtnpays=;
        b=aDK+EXL1U+MQIlOj6umry2eSufsafiPg6dHlujCruAVywgqef3VQeJFbWXYxkJ7iIy
         R3WwNP6z/vdvF30fjxjvxBaQ8TESfrTZkb3kUeKBP/RHBSFyAMnBZQDwp3SPlw39kfq7
         L05cHzvhmlN/d+8tUC6ZHO3yuz6TqNQ5J+3w6Z/E3KYlQCJmaRS+800smNmJzoGTKnLq
         Jz3ir2YQKCsJ0TUcg+u/FnYVQYBnY3iqelIs1RuBbb2jPeSGKvGnMWzYigxVGDnB7ayS
         a2Nd4/3/66NGpAeoA3x2s/JoIrU1ckJjdsIioQFMMpAkEWo9AtOIOuzPgYmapCj6hjfx
         nV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750748684; x=1751353484;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLbitD9Yz365jr3BdIqraX9XTg2iaE+GPbMQNtnpays=;
        b=Gch9FXnOIWvPHAw5ImfEcH73CDrxhELqUiOkQGmCWz+JVlZffOn47SzvWut6Dabn73
         +G/BSFZbrcwgrzb34OATOWUK3yX66ERuNDronNeevzs6jk/8+3suMjBf3iEXQZKTVf7K
         /sqr4IszRmKeI2NeerWXbwvTyYpEuNHDPV+RD5/Rud69vLRqW9SIBsEJ41GcpFDTynvV
         69BUhgabSRBqFp0HS2CuH2/KzI9jgKsEUBmRlGShkJ/MHIuVQ8dbIqr60ZHJtDSVSo2l
         grPazI1fp7psZ461b6/QE4Vqx1XpEYXcaISpdoRRXgwWs1f83j3oP7wUl5l+32mg9V+z
         K29A==
X-Forwarded-Encrypted: i=1; AJvYcCW+mVuPdsNb2v5lhhN1OUkdXaHkq4VbrBps50wWQmY3eqVqoRhVxl6R0dYgueEIbJAklBJmbfwgFDXbdk1kZJrk@lists.infradead.org
X-Gm-Message-State: AOJu0YwT5rQI58ybCjwv7p5/G/pCjicDjxC5vj+jlU14kiX03uH+lUbR
	iufg5euERdrnh4dwt3iMl9/NU2ClQoW74zQQZjuGz6UbcygQFEOMbAfSyCXiQYWKLBk=
X-Gm-Gg: ASbGncvrbchRX8HlyN93/QaK12n7OJXMlmGykIDslCBVeg5Qw1viJaW9AizVKmdAxXQ
	ddN9R27rqw4brUp/0Mzk8hKj6833dq6tn385mwliq54thupmrTM3MOjL8GEZC6KsH76JN0j4r93
	lPLrgnVmEcuGBI2xyWXa/hf6BZZ3lu0hJkTbUWtdN/bT4LLsbZcVRfOR3V9Zri9RCCnrr+ceb1t
	Pw1Lecug8o15ffqaAIuyiKuV6XxMtjJ4UIDx6w3U6HdLoo+H3HFhfkDe/vIRjyCLtVlCrOJc8Uf
	FuA3XuGC8b/Fpibc/AhalyxF8My9zGcetz+/js1Vpu8gM4h6G3D+f0ZXYDhzz4dykVE2IkE32J2
	OoAqIeQ==
X-Google-Smtp-Source: AGHT+IH9JmPa7BbH+tgIB0uoiJ2JP68fJ2WltDdUQv4ZUEycK4uvEtfSZLwyJj/VT7FzXEaxap3DCQ==
X-Received: by 2002:a17:906:6a05:b0:ace:cc7f:8abe with SMTP id a640c23a62f3a-ae057b39bdfmr1676502066b.31.1750748683722;
        Tue, 24 Jun 2025 00:04:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ecbf72sm817956566b.47.2025.06.24.00.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:04:42 -0700 (PDT)
Message-ID: <c51b2b64-24a7-4e14-bdd8-c4a356423100@tuxon.dev>
Date: Tue, 24 Jun 2025 10:04:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: sam9x7: update pll clk ranges
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Patrice Vilchez <Patrice.Vilchez@microchip.com>
References: <20250610084503.69749-1-varshini.rajendran@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250610084503.69749-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_000446_127776_46EB20AC 
X-CRM114-Status: GOOD (  14.63  )
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

Hi, Varshini,

On 10.06.2025 11:45, Varshini Rajendran wrote:
> Update the min, max ranges of the PLL clocks according to the latest
> datasheet to be coherent in the driver. This patch apparently solves
> issues in obtaining the right sdio frequency.
> 
> Fixes: 33013b43e271 ("clk: at91: sam9x7: add sam9x7 pmc driver")
> Suggested-by: Patrice Vilchez <Patrice.Vilchez@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  drivers/clk/at91/sam9x7.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index cbb8b220f16b..ffab32b047a0 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -61,44 +61,44 @@ static const struct clk_master_layout sam9x7_master_layout = {
>  
>  /* Fractional PLL core output range. */
>  static const struct clk_range plla_core_outputs[] = {
> -	{ .min = 375000000, .max = 1600000000 },
> +	{ .min = 800000000, .max = 1600000000 },
>  };
>  
>  static const struct clk_range upll_core_outputs[] = {
> -	{ .min = 600000000, .max = 1200000000 },
> +	{ .min = 600000000, .max = 960000000 },
>  };
>  
>  static const struct clk_range lvdspll_core_outputs[] = {
> -	{ .min = 400000000, .max = 800000000 },
> +	{ .min = 600000000, .max = 1200000000 },
>  };
>  
>  static const struct clk_range audiopll_core_outputs[] = {
> -	{ .min = 400000000, .max = 800000000 },
> +	{ .min = 600000000, .max = 1200000000 },
>  };
>  
>  static const struct clk_range plladiv2_core_outputs[] = {
> -	{ .min = 375000000, .max = 1600000000 },
> +	{ .min = 800000000, .max = 1600000000 },
>  };
>  
>  /* Fractional PLL output range. */
>  static const struct clk_range plla_outputs[] = {
> -	{ .min = 732421, .max = 800000000 },
> +	{ .min = 400000000, .max = 800000000 },
>  };
>  
>  static const struct clk_range upll_outputs[] = {
> -	{ .min = 300000000, .max = 600000000 },
> +	{ .min = 300000000, .max = 480000000 },
>  };
>  
>  static const struct clk_range lvdspll_outputs[] = {
> -	{ .min = 10000000, .max = 800000000 },
> +	{ .min = 175000000, .max = 550000000 },
>  };
>  
>  static const struct clk_range audiopll_outputs[] = {
> -	{ .min = 10000000, .max = 800000000 },
> +	{ .min = 0, .max = 300000000 },

Is this min value something valid?

Thank you,
Claudiu

