Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321AFCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+N76mxcxihAP3O+FLFRElIM/tYwXLZuPej3Jupgfxo=; b=sj49G56HxgiAu9UwH8WQAghuss
	NNAVj59J1osf+BJBZWQVAPHT53PaT7RxMeEZ2SIcipT+9GypfC6LyhpKkFhUKthSkRaw8N08Ktvts
	umqOHJZTnOkPlK+6kcTCmQKs1kxc8BJC2ZiFwuKakWV64DlLB5klS65iNMKkz+DgwKf0Ugc9tGyd1
	AMVtjNMF0+9ZO2CyeVkUWbp6qJR013JQKdwSOLewyYp+eCJavj//bnvvMJ2DgTT1387gZdvX5fFfn
	J6gKau7qCN+Axf4CUX/mejUcgRa8CtwzOK7uIMJnuH5duLLhd4L2bPjwdzKOOlJeaQcZVBdtC57PG
	PpR9BRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRDq-00000005Qcl-0XXz;
	Mon, 10 Nov 2025 12:42:14 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRDm-00000005Qbg-3dzt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:42:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42b2dc17965so1523825f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762778529; x=1763383329; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+N76mxcxihAP3O+FLFRElIM/tYwXLZuPej3Jupgfxo=;
        b=F/Son1xS3nOevVwuzfg1/Xj2HblhHiSx5duV2f2aY47EQrnDYVZVfLhOxQWBD6Pl4X
         diwqTKj6WxM81gP5hT7DzHNUbyvL+X7350V0w7o60oHeQgi9/6MXClssh9+nwMtXVFTL
         /Sp82nG2QgbyaSPQ9w4byI5TtN3pjUxCLM0cubCUhMBd4F1LwfBwclMVzLyiadG68AeP
         JfQJgbj2KbbZ1wMuD0lRvHJYHRZYO3gbOjhzsZZzwX2bjWNotoi7vrQhtkJ9XPn8hZGl
         JLjn8yhFq8xLCEWnmkFFHknCkEXh1nt0NIWti9+ZmKWgoHRp/D2Pr2Qaq5NrsNXj7E8A
         RNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762778529; x=1763383329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+N76mxcxihAP3O+FLFRElIM/tYwXLZuPej3Jupgfxo=;
        b=wlb4mQk2br9ew/enQMGDNzzCub43AHMz4s6gVNq70qcMzHep6awVptZkOEk6XrAsv0
         aCfjWjIr6jdmhzirt5HYxAegGsRaIhPohrwlzrNao49J8Erh219hOXiVXmuHdobPK5S2
         WXkxl1hHgv8qvLC8Jn0Lzzp4HKKotxbRp5ZIVgUmeamJpPubcTRghSedXD79p1nucI89
         pF3W9dfjijAsU9wQP1sLuG1LnDUz12OBkLTqb+zKJYm0nWhDyQnVHCs1WDVb5gXIVdUC
         YDFzlDcgHm4pm1cvUnlWJUgP8C/c5woIFxZ0gXtcxf3CLGrU5LWcq7Qu32zGxEljL4/+
         aBgA==
X-Forwarded-Encrypted: i=1; AJvYcCUX1ZKzMYdCHLjmAU+wo3r+wbcZpjhthnUVm6Ft7GKJY3gq77nRneSLxxqS/nAg+WThdNEf5puLOIeXAmxp2dnX@lists.infradead.org
X-Gm-Message-State: AOJu0YzHNJsA81VNDCflrIuxHMB3+sMEoixE8u5WnGc+eiZi5uhVew0W
	yuqhMaOd0HqiO2XpdcM9a+QqorvDjH+M1K5uj/NAZM/2HnjbwvUnv/wogHEigLH927I=
X-Gm-Gg: ASbGncvtQZb//EMq49b9vfewrdNi4sSlqcqorre425Yqu5Ge0L1mfPhvyboEQgeT2kC
	tyADsLfUYyfUfdsQ9n0SoZYjHOaKYaiG3H7q7m+/UZB62KHSAwspqyCoV0RC/o9CyMJL7JJSCwd
	a009zVvTO4GIovKzfy0DVor+uUvIHgUl3tE3LxMcUr+WNhPBdGa/1QcloJLRNk768nMdSxnvuAB
	aXd+8G8UZEwkIvq851OeW4SiPSADXVfhFuWK6OEnhHR5P1BWvq6sHiogIUd0pMnvOpP1yJTzoyH
	77/054aW1CL4r4lOX8vJufmsPsefNjvjae0bCR8wxzCRhjIR9NVbhQ9ixJ3IVTzjt6wxPry4eav
	/+MXFVjVStnpjVe5ld0pLX42gImyG9aJpT1aUUbdlttbN0oDdJLbjzbrr/81VkzddKom3Mi7Ywd
	8RHAQKYZeKEyPdZqZ+b7hwEPcDCs8bz6gNokV5izA46t+7drOBkFEvxf/2qVOUdNXdSw==
X-Google-Smtp-Source: AGHT+IGNKo1M31mUDoARlNl8zibaXqZMwervmekEB8cz3HVAafXXSH8iFrMG/LkjJqzdboVDP9+/mg==
X-Received: by 2002:a5d:5d81:0:b0:42b:2c54:d9ba with SMTP id ffacd0b85a97d-42b2dc1e51bmr6642107f8f.20.1762778528609;
        Mon, 10 Nov 2025 04:42:08 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:2b20:d700:6e9c:533c? ([2a05:6e02:1041:c10:2b20:d700:6e9c:533c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b35ad7c16sm9213468f8f.15.2025.11.10.04.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 04:42:07 -0800 (PST)
Message-ID: <84b9fd00-ce75-43bf-a53b-48818628f7e2@linaro.org>
Date: Mon, 10 Nov 2025 13:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 3/9] thermal/drivers/mediatek/lvts: Guard
 against zero temp_factor in lvts_raw_to_temp
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: nfraprado@collabora.com, arnd@arndb.de, colin.i.king@gmail.com,
 u.kleine-koenig@baylibre.com, andrew-ct.chen@mediatek.com,
 lala.lin@mediatek.com, bchihi@baylibre.com, frank-w@public-files.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 Chen-Yu Tsai <wenst@chromium.org>, Fei Shao <fshao@chromium.org>
References: <20251016142158.740242-1-laura.nao@collabora.com>
 <20251016142158.740242-4-laura.nao@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251016142158.740242-4-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_044210_939060_8BACDF98 
X-CRM114-Status: GOOD (  20.46  )
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

On 10/16/25 16:21, Laura Nao wrote:
> Add a guard against zero temp_factor in lvts_raw_to_temp() to prevent
> division by zero and ensure safe conversion.

Is the temp_factor something else than a ro data statically initialized 
by the lvts_data structure ?

It is pointless to handle the case where the temp_factor is zero. If we 
read the temperature the kernel crashes immediately (which means it was 
not tested).

The temp_factor is an internal value of the driver. If the temp_factor 
is zero, the driver is buggy and should be fixed.


> Fixes: 6725a29321e4 ("thermal/drivers/mediatek/lvts_thermal: Make coeff configurable")
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 1c54d0b75b1a..4ef549386add 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -284,11 +284,14 @@ static int lvts_raw_to_temp(u32 raw_temp, int temp_factor)
>   
>   static u32 lvts_temp_to_raw(int temperature, int temp_factor)
>   {
> -	u32 raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
> +	u32 raw_temp;
>   
> -	raw_temp = div_s64(raw_temp, -temp_factor);
> +	if (temp_factor == 0)
> +		return temperature;
>   
> -	return raw_temp;
> +	raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
> +
> +	return div_s64(raw_temp, -temp_factor);
>   }
>   
>   static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
> @@ -1346,6 +1349,9 @@ static int lvts_probe(struct platform_device *pdev)
>   	if (irq < 0)
>   		return irq;
>   
> +	if (!lvts_data->temp_factor)
> +		dev_warn(dev, "temp_factor should never be zero; check platform data.\n");
> +
>   	golden_temp_offset = lvts_data->temp_offset;
>   
>   	ret = lvts_domain_init(dev, lvts_td, lvts_data);
If





-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

