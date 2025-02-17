Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E0DC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wgJxscDmc93zijAMt2W3LnwyWz16Wm3n10sGDTSupA=; b=GJ2gjsSsWjh7MH
	6a/ban+jVDvUzEgRRwtLRrZGqv2/HST9rEyaKZNN+SIHZHboAWnBd8YN8O+kf96sbayR2VUp8XzCi
	gATfB2FhILLxYJiIx3b94roZj9/5fpAze9TnwIRg2xdIKLo52UmhHDwu/BUvxXsiqrvecIx8vCmRJ
	6wkdzoerSCs3nADZEl7tkc0mmqJDO35BMAqB3qq4gHYxArA57s6f9oztfYeZhj3mbT3XAJ6U/i4rn
	rkbk4YUhCSRW48M74V7KPZX0/IoJKXwQ0bdae52CaJDh3rtItu19VKfUxVKLXDi7jYbnqQ2S0AGI4
	mlqfordsTL/M0z180Q8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykQ-00000004AP4-35Mj;
	Mon, 17 Feb 2025 10:53:10 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjx8p-00000003scQ-0c3p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:10:16 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5deb956aa5eso5859495a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 01:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739783413; x=1740388213; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8wgJxscDmc93zijAMt2W3LnwyWz16Wm3n10sGDTSupA=;
        b=oP2BD0EGz81BcjKyImIPVzrL+ZjAc20n2ppjOlLFU+16oeYJNRJNFffQdI75OUax5a
         aW0R/EBbjyua9g2gQnhYukR5BQ6bcM2AcW5gOZRjRj1ynpsULsBoHyzu3UqUqu6PxRXd
         D145sKoUezjzPoeRLdAQnVFKjPC1ioiEDKrZYBHD9JhlITNKjjzolXm0EogrTjIcmFSl
         ag6irq22ruQFzIWZol9US1qSW2QjlWdSFf1yK+l6gicGY5wOwoaK9/u8yFDZBbAW9sza
         IAEDezp6KgdoF6KBREKe2QUNxkrZq25d0eWActEKaabfu2K8tl6El9kz/xNDil26G9sS
         3W1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783413; x=1740388213;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wgJxscDmc93zijAMt2W3LnwyWz16Wm3n10sGDTSupA=;
        b=ULe3BimINs7xq2ZWm8/9gQ0fH6ZhYs52PKs+p7uLA/2gt2Paf8s9fhkJ8Bw4a6Dik2
         dUufrn0D+Nb+wI2N6pqievOAh0ICBzxOtRauuzFtMozCLV+NRzt2QnneeT+2y1ZghQBc
         O7Hb0uuivYOFy9OvPSEMH00+3WpJ9DK2yM4vNUTDwqinba9O4usmSQEIr7XR7qEHSt7V
         9JZ4j5UjPs1COoMxHZWKsQt2t2N0UHcvRXnOxjhvvO5LWgV20NxKofwwF1E3HA8Dp2Dz
         7gxxeqNFRl0Ybfrbp5eF2MivkyrfBnQnVh4MdIet8KYn7tTkwY01ZS562/MAKXOcR3bu
         +suw==
X-Forwarded-Encrypted: i=1; AJvYcCXxxsl6lh3zV536otRt5rCaK4qn3EzsWoLI8Ve/Or1DahZsrwxFOsztlColVrH7ut2aVuwrWFYsqd5MXgr8WYdX@lists.infradead.org
X-Gm-Message-State: AOJu0YxiM8mOnv/CSl2AdJF7qAUSJ/nirtT8djPM65OEFJUsXBlL5N4g
	UB8S8zpfUg4+G+mAG3ewLgdB1kOYTs220GZNUxRhqlllzi6J3p2SmRSdTJj7bd4=
X-Gm-Gg: ASbGncvCUNWkkEoaiL9SmW/jeMx5oyxDVaOkWST3qJzgWhI1pgmcuYeOc6dqkCt9uR3
	igwCYbNSSj4/mf6iozZFtE27MhLaY4+VJsZNITWaziRM0xaY5ndvKpobr6kVYHo/pkvZmUv3Oee
	HqzY+Fk9a0FC6v7yKLEl9utCzdvL3FJDgrY9ZgTZEo7qAr82SnuPyrzGoX1cTQ+wE6tAgnUnRyj
	VI99OEKM+R2z9X3GJZLX4R541AClfSHssabPUnKlyerpiInGRrtkCe34C+y0lngdGmXqz6ITBbM
	i6U/ux3VHiJYaZg/Yao025o=
X-Google-Smtp-Source: AGHT+IGp/mriA1nqumOa8lLHSDzS7hm8UUj2lVCgT+kV+ET8dZlcSDmAKyr3/mzJIchHtsHlvM93eg==
X-Received: by 2002:a05:6402:518e:b0:5df:25e8:26d2 with SMTP id 4fb4d7f45d1cf-5e035ffa1a2mr21900403a12.5.1739783413260;
        Mon, 17 Feb 2025 01:10:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1d374fsm7279007a12.41.2025.02.17.01.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:10:12 -0800 (PST)
Message-ID: <f62d04f6-53fc-4d6e-8365-b919af1b5f26@tuxon.dev>
Date: Mon, 17 Feb 2025 11:10:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] nvmem: microchip-otpc: Enable necessary clocks
To: Alexander Dahl <ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250211065304.5019-1-ada@thorsis.com>
 <20250211065304.5019-3-ada@thorsis.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250211065304.5019-3-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_011015_190886_4347F1B1 
X-CRM114-Status: GOOD (  19.74  )
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
Cc: devicetree@vger.kernel.org, Ryan Wanner <ryan.wanner@microchip.com>, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi, Alexander,

On 11.02.2025 08:53, Alexander Dahl wrote:
> Without enabling the main rc clock, initializing the packet list leads
> to a read timeout on the first packet, at least on sam9x60.
> 
> According to SAM9X60 datasheet (DS60001579G) section "23.4 Product
> Dependencies" the clock must be enabled for reading and writing.
> 
> Tested on sam9x60-curiosity board.
> 
> Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>     v2:
>     - Rewrite to enable _all_ clocks defined in dts
> 
>  drivers/nvmem/microchip-otpc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
> index d39f2d57e5f5e..2c524c163b7e2 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/clk.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/nvmem-provider.h>
> @@ -241,6 +242,7 @@ static struct nvmem_config mchp_nvmem_config = {
>  static int mchp_otpc_probe(struct platform_device *pdev)
>  {
>  	struct nvmem_device *nvmem;
> +	struct clk_bulk_data *clks;
>  	struct mchp_otpc *otpc;
>  	u32 size;
>  	int ret;
> @@ -253,6 +255,11 @@ static int mchp_otpc_probe(struct platform_device *pdev)
>  	if (IS_ERR(otpc->base))
>  		return PTR_ERR(otpc->base);
>  
> +	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Error getting clocks!\n");

This fits on a single line.

> +
>  	otpc->dev = &pdev->dev;
>  	ret = mchp_otpc_init_packets_list(otpc, &size);
>  	if (ret)

General remark: please organize your patches as follows:
- dt-bindings patches
- driver patches
- device tree binding patches

Applying this to your series, will result the following order:
- dt bindings for clocks
- driver changes for clocks
- dt-bindings for nvmeme
- driver changes for nvmem
- device tree for clocks
- device tree for nvmem
Thank you,
Claudiu



