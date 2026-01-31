Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CF9D7977D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 16:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wt0nnlrDw5KDdKulBm7PH7mhYJ/mBjNcrtsksFarjCk=; b=UT63zrqvbQFTVAhAuIZl2AQE7b
	AaNoATof3gM7S15xGPxjLmZ+FiIQHqsKtUTQQU/ne58BYt0r7RvCeD5nuoPec2bQl9UXllt26T1zD
	hIpajfjnRAxVg/oI4sOQTd5UBvLP/CbCYIwaAmr0WCfOao/t5ZAilNyx0P7ao1dn9x3oMnrH5YevP
	JAHbsYLU+ycR8/WSEmgtozsY2BhyT+3o8a7+fSo/1qwQJsVIDZtJf/Ow2ZS5qE96xeecBMX6vGroZ
	IoM6LO4EADChQRZpcSRGnM5c5n0cJLrfSYzPwbyjRzeLFAT9vXVnPcHS98FdtwyMSdU/dmFKXG+x6
	2lKT8Stw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDZs-00000002nA7-0lmY;
	Sat, 31 Jan 2026 16:12:04 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDZo-00000002n9m-3BMM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 16:12:02 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4359a316d89so2379093f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 08:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769875919; x=1770480719; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wt0nnlrDw5KDdKulBm7PH7mhYJ/mBjNcrtsksFarjCk=;
        b=B7tmWtv2z6zHkD4SL7NU5CuVIkTE7fBqGwsfmTWEbct9jYjIegehN9w0HqkRE4jQ6N
         OwDjQ4tIyAIxoYnNiHWELy1w+Y1B2RdfOfZfqyidEf24s22mEY5ZyyY22mFwFsFOs8A4
         EqlRyhUZOzFoL9LfF19g6x4bsncs7I341L1ceyzc475RS6hHWM04sCGXPndVjNJd1uMf
         gB+SHBewWTur0hmKUhjzIXLVEWzUD6qzHPGArgWP38O9h/vlArBoLP6ziyaKxQmK0JCv
         WSUrE4CxEvXirlkoRivdATN+HUojcDOUQb8V9WwNcUGdHCY1oM3+52aWGddPa4NArdw7
         Cyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769875919; x=1770480719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wt0nnlrDw5KDdKulBm7PH7mhYJ/mBjNcrtsksFarjCk=;
        b=GZ1luvL4MVEK8f0BcLdVA9CoQKTKov/9byG76WUeCkz4jamm5U5bvB+4J/Z8qk8wuA
         sEKKSaba/RslPawevo3caewd3IjntmQ4nx3BVi4bXVFkeTPOtDfFnc8k7WWnAP2LDLFZ
         odX1fJzf4FXQOui5gQEVkR1i6Mnm9VxWl3Yacz13d5QgbpxdTMbAvzOPx/INqmpXVVlC
         CaAEFqyg3eqq5xGTHN8/qi9nyURf+XjkTxS4uY5XftImI0SPwVVMydhbneUlnEyYkoUO
         7QlukTGdx+n2SqPWHrmKH3dpHNJeoUZtyfX54bgq2IyhJjlUaIkePxDuBlnAriRBHAU+
         oMVw==
X-Forwarded-Encrypted: i=1; AJvYcCWAJmnKuYTSDGq+wztNSjIG2XPdNRVUvLk1A8q4CAueMKLn/2Ud2JlywlSJpy1zEdKyRALn0tXUDrjCTwoMEF1u@lists.infradead.org
X-Gm-Message-State: AOJu0YwR9FhY5YMyPjEy+ATiGm6nPX2ntNQI++u+LJpq3i9bSgto+BDn
	6b3b9z+Rb3sLk2duSyEYUKe/PIwk5PIA1o1Fi5FwTiZr+vpm9OYlwtiKD0ga9HQtvXI=
X-Gm-Gg: AZuq6aKqiPUle3fhgMLdvP5+PqtGqIrCcxNizgjZE6hX488ROcImKBOQQ9bOOgbcS7p
	pQW0JHglUvGxuB5s7syXHW+VKBKyVdGZIbIuzz5sCGryyYRhL+ZqJR+mGIwXr+R4erkosdHgyab
	hG77HPt2DdUus1O7Psx4b3zF2al/wMN7D7ua/mYhQ4cdry6Pi8iH+hvT+5AB4GNBCH+WOI09Him
	3fQj5XV9jsOjFjF/8B4F4joxkAmMYaQJoy5ZuR+KzoYN6CNBQX4Ts0LdH7pHlGwlKa99PzjMyA8
	B0psLDVMAqmmUOSgXy5ZaOQy8SAcdKtC4HCHpA8wHAaXFB0QUvKyFiSlBPJTM8XuzKXcu2HweRm
	lDjHezNV0ddmm0fxS3YjleZHJ6My25Xo1yPF4PMg3bray9QN/MzkQo/bHw/4vivX6CM1mm53t54
	vCEIfFA8P4/ZxQYMEHpw==
X-Received: by 2002:a05:6000:1a8d:b0:431:3a5:d9b2 with SMTP id ffacd0b85a97d-435f3aa7aa0mr9659948f8f.39.1769875918622;
        Sat, 31 Jan 2026 08:11:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee078sm30719880f8f.16.2026.01.31.08.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 08:11:58 -0800 (PST)
Message-ID: <05128a16-553d-49d5-b09d-2c3e03cb4421@tuxon.dev>
Date: Sat, 31 Jan 2026 18:11:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/19] nvmem: microchip-otpc: Expose UID registers as
 2nd nvmem device
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-8-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120154502.1280938-8-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_081200_829140_EA2E0D14 
X-CRM114-Status: GOOD (  24.77  )
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



On 1/20/26 17:44, Alexander Dahl wrote:
> For SAM9X60 the Product UID x Register containing the Unique Product ID
> is part of the OTPC registers. 

SAMA7G5 as well.

> We have everything at hand here to just
> create a trivial nvmem device for those.

Please massage a bit the patch description to match 
https://www.kernel.org/doc/html/v6.13/process/submitting-patches.html#describe-your-changes

> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v3:
>      - no changes
>      
>      v2:
>      - Use dev_err_probe() for error reporting (thanks Claudiu)
>      - Move required register definition over here from removed patch
> 
>   drivers/nvmem/microchip-otpc.c | 38 +++++++++++++++++++++++++++++++++-
>   1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
> index 34c0d7611f3e4..b35ed13b004bb 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -25,10 +25,14 @@
>   #define MCHP_OTPC_HR			(0x20)
>   #define MCHP_OTPC_HR_SIZE		GENMASK(15, 8)
>   #define MCHP_OTPC_DR			(0x24)
> +#define MCHP_OTPC_UID0R			(0x60)
>   
>   #define MCHP_OTPC_NAME			"mchp-otpc"
>   #define MCHP_OTPC_SIZE			(11 * 1024)
>   
> +#define MCHP_OTPC_UID_NAME		"mchp-uid"
> +#define MCHP_OTPC_UID_SIZE		16

I think you can drop these as they are used (individually) in a single place.

> +
>   /**
>    * struct mchp_otpc - OTPC private data structure
>    * @base: base address
> @@ -230,6 +234,16 @@ static int mchp_otpc_init_packets_list(struct mchp_otpc *otpc, u32 *size)
>   	return 0;
>   }
>   
> +static int mchp_otpc_uid_read(void *priv, unsigned int offset,
> +			      void *val, size_t bytes)
> +{
> +	struct mchp_otpc *otpc = priv;
> +
> +	memcpy_fromio(val, otpc->base + MCHP_OTPC_UID0R + offset, bytes);

Include <asm-generic/logic_io.h> for this one?

> +
> +	return 0;
> +}
> +
>   static struct nvmem_config mchp_nvmem_config = {
>   	.name = MCHP_OTPC_NAME,
>   	.type = NVMEM_TYPE_OTP,
> @@ -239,6 +253,15 @@ static struct nvmem_config mchp_nvmem_config = {
>   	.reg_read = mchp_otpc_read,
>   };
>   
> +static struct nvmem_config mchp_otpc_uid_nvmem_config = {
> +	.name = MCHP_OTPC_UID_NAME,

Should the type be filled here?


> +	.read_only = true,
> +	.word_size = 4,
> +	.stride = 4,
> +	.size = MCHP_OTPC_UID_SIZE,
> +	.reg_read = mchp_otpc_uid_read,
> +};
> +
>   static int mchp_otpc_probe(struct platform_device *pdev)
>   {
>   	struct nvmem_device *nvmem;
> @@ -269,8 +292,21 @@ static int mchp_otpc_probe(struct platform_device *pdev)
>   	mchp_nvmem_config.size = size;
>   	mchp_nvmem_config.priv = otpc;
>   	nvmem = devm_nvmem_register(&pdev->dev, &mchp_nvmem_config);
> +	if (IS_ERR(nvmem)) {
> +		return dev_err_probe(&pdev->dev, PTR_ERR(nvmem),
> +				     "Error registering OTP as nvmem device\n");
> +	}
>   
> -	return PTR_ERR_OR_ZERO(nvmem);
> +	mchp_otpc_uid_nvmem_config.dev = otpc->dev;
> +	mchp_otpc_uid_nvmem_config.priv = otpc;
> +
> +	nvmem = devm_nvmem_register(&pdev->dev, &mchp_otpc_uid_nvmem_config);
> +	if (IS_ERR(nvmem)) {
> +		return dev_err_probe(&pdev->dev, PTR_ERR(nvmem),
> +				     "Error registering UIDxR as nvmem device\n");
> +	}
> +
> +	return 0;
>   }
>   
>   static const struct of_device_id __maybe_unused mchp_otpc_ids[] = {


