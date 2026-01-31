Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5589D7977F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 16:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MlGEqpxPuA5ARImYdl/1cKu2LSvKdYbg1W1S81a7ZI=; b=IGJ53Z7u9Gef66gpUSWVZxgwDe
	S2/oVBwwdycoXQAQLJjfGrBwwVTeMocIaDKXgTcEHYgKNgLi1P9PwEwQwBi84ItG0VNN7j1eOdV4i
	jhUMkJFKuh7MM0q8dUcRqgMSkVbtnPmGjxA3vflGVIPMaImzo87aOuTFgNMI2KIJrUfizjv3maag6
	G++a7H9M6q7W4CopGGiCVvXQfiENRZGA66DZzFv6H9t320LsRJtqnQL5SMgF4Ca4laqL6PSUSNwgr
	uynRXFYMB4rO/12OKw7kBzR+SbgQes66r2fUlp46zEbC41W4g20mRerkUQ2WJpIHVnDuwamgs7jpE
	E4IHdAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDRf-00000002mtv-0rZw;
	Sat, 31 Jan 2026 16:03:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDRc-00000002mtJ-1BW1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 16:03:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4806bf39419so25159695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 08:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769875410; x=1770480210; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0MlGEqpxPuA5ARImYdl/1cKu2LSvKdYbg1W1S81a7ZI=;
        b=iv4B1dWl2PkV2jSFppX57ZZ5+YzoPJaN0zTK/cEcmGeUeCI7pRJSMetIiFO1pTdaji
         ahF28QbvZD+gaF2MfJGLhjAFE6H34Oqbcen13QCGjv5yFBMe7LFwOf/kKe+/wTMd07mY
         lRBa9kgRruhWQzQg473nQfe11ADAvZCVXzKGBOACUAALXKzlowehnCD1kLpSoO8LIp0+
         8hIqJlybJGyVkZpUNDTFdhC1+R+uukGD/daxJiW3Rka7BcPqR8K0268hMN9i1G0MlUdN
         3S4LIrBA/ZniYsKAPPmcrCDNHNdpYWNaqXpsF3LwNjdAEBx2ha3S+TBksWVN0KjQUE4y
         /k3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769875410; x=1770480210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MlGEqpxPuA5ARImYdl/1cKu2LSvKdYbg1W1S81a7ZI=;
        b=Qk0Rq8C1Rv0ursGrKj41kswu4dABweNban0fGlkiXys0fXYx/EfCbGwXxGXfZ4FPO7
         b9fqON+g1IVnH+1k8+kqxC5koo4FBve+jGs2SHD6sBMaylmD9g6BRGrrb9IV2Q8Zg9In
         8Tuaaru4pIazUNjvRBrOGGT4STw0p7hY5P1L0BhF3YAEGO2ZupUqf7Jj6wt922OHRc5f
         2fa26w+23lJIKLmZGqL5iTic7ODr9uy3dMtUVJx2rLawKMTKoRpkzTbuswk4QH1HQ5Nw
         UoJP650sSNtXw9wlkeuO8o/WMSMmh5vgixxDAwkKspW1ghXL8yM9cARJVdqrJmWeOFew
         9mog==
X-Forwarded-Encrypted: i=1; AJvYcCVs9i8+pHff4nNfwwSSayRRLBIZ1/yTTk/CkgWBt/MyomJgX+wvPJXnOLQX60COVeTfRd64O/NbhhOejGx24ihp@lists.infradead.org
X-Gm-Message-State: AOJu0YzMjBxWyb/AkPD81Uh0exWTt3wrH8RFi9vK5EWewGwi5t1wHlXF
	OoGScvh/aWP1V/XzOMCTXmUan21CgKmMTl0x1naeND2t15jMPePJb2yOfSe4Do8noTw=
X-Gm-Gg: AZuq6aIPKlwMLD9h0BhuF/USC2rgoi9WW/t/EUoQwF6FFxsLAVWLkKym2QUsFvhrdtV
	wAcnUmnMhIpojAxIQsopVqRRXRwZEVNsvTwFdPSIFpsNsb3WNhgZ7QcAXeER6OJObFxJs8fIPV2
	skU6059ymkPRQ2LyO/WrimD9+IDqEASB1WST2snQuqY57giWevkIsLZdtBYEnHSz5zFQLVXc/mT
	1enAO4bhi9FsxsGGVQGb6ctD46FGUGsu95oMY24ylceRHorYoelGpeb/nciCL0L5390D9GcxJoE
	q8XdV+i0B5dHjLzRimLQU5hkU9A8fN7IX3ILWUB8Hb1vaEWWmgLK9Iion85V65OYRSe3LXblUex
	Cl9ngspHUHH43xJfLdXzkGs2+3iNVbnvoVozbnvurFOkA9xZalpaiYSCcVOA4lcvaKkTQxcE3vi
	8Mb3iZ2OPbBWf4CuZHUA==
X-Received: by 2002:a05:600c:470b:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-482db2591f5mr86282515e9.3.1769875409921;
        Sat, 31 Jan 2026 08:03:29 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1353f8bsm29406760f8f.39.2026.01.31.08.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 08:03:29 -0800 (PST)
Message-ID: <e0047afc-2109-4062-bc51-045ccd7f868a@tuxon.dev>
Date: Sat, 31 Jan 2026 18:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/19] nvmem: microchip-otpc: Enable necessary clocks
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-7-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120154502.1280938-7-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_080332_344331_229869F2 
X-CRM114-Status: GOOD (  18.99  )
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
> Without enabling the main rc clock, initializing the packet list leads
> to a read timeout on the first packet, at least on sam9x60.
> 
> According to SAM9X60 datasheet (DS60001579G) section "23.4 Product
> Dependencies" the clock must be enabled for reading and writing.
> 
> Tested on sam9x60-curiosity board.
> 
> Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u

Why this link here?

> Signed-off-by: Alexander Dahl <ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
> 
> Notes:
>      v3:
>      - Rewrap lines
>      
>      v2:
>      - Rewrite to enable _all_ clocks defined in dts
> 
>   drivers/nvmem/microchip-otpc.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
> index d39f2d57e5f5e..34c0d7611f3e4 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -8,6 +8,7 @@
>    */
>   
>   #include <linux/bitfield.h>
> +#include <linux/clk.h>
>   #include <linux/iopoll.h>
>   #include <linux/module.h>
>   #include <linux/nvmem-provider.h>
> @@ -241,6 +242,7 @@ static struct nvmem_config mchp_nvmem_config = {
>   static int mchp_otpc_probe(struct platform_device *pdev)
>   {
>   	struct nvmem_device *nvmem;
> +	struct clk_bulk_data *clks;
>   	struct mchp_otpc *otpc;
>   	u32 size;
>   	int ret;
> @@ -253,6 +255,10 @@ static int mchp_otpc_probe(struct platform_device *pdev)
>   	if (IS_ERR(otpc->base))
>   		return PTR_ERR(otpc->base);
>   
> +	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Error getting clocks!\n");
> +
>   	otpc->dev = &pdev->dev;
>   	ret = mchp_otpc_init_packets_list(otpc, &size);
>   	if (ret)


