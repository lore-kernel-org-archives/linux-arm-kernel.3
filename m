Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0FFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 09:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odDHdEKVo1ECoBHd6qSHP5bCx3nKUQG5008PYymM31w=; b=rfP851HwI/tdRFXJ839ArtKwE3
	1hcsKQPQ3CIzLgPuHFoPgYNhyPrijgn9yk6EFd7Lc9SzEaPmfXaJWHtiL6jj5rb1L4qZ9Xu99kAOJ
	6VHIdVYDOGd/PRLfoQM0tZzCNhQ9dzTVLNyBcIuwHUgUFIl4YZ1xNaPDNtwqiWrN8STfMvNrUIU/H
	5B2KG0M1/bwCQW9TB/uHLd/U9qp60Ds+oKCMHPOp2SGSjmOC215gNGUeLJyrirCEqW4ANdunOishu
	504/utdZrNjIaQhfrqffnZUdpHpH2xlI4r/jCmP3vZP1WY5v5MTaFIqXM5miLSrw3D/lY3wLP6azp
	591sz09Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHjR-0000000A4e1-0d5J;
	Thu, 02 Jan 2025 09:43:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHhN-0000000A4HA-2Xll
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 09:41:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso73336115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 01:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735810860; x=1736415660; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odDHdEKVo1ECoBHd6qSHP5bCx3nKUQG5008PYymM31w=;
        b=hrL7ymEkhDNjo/hVmSNM4YJe6EE5eulG6921+pzuqMFjs/EIPMdHgP8lfeNqD7Rzsq
         PsLok0NOKzIq8/bI4X9j2d3hivAUL47+d1/vUakbn7pN+tX65BiKaZqO2i+tLlejC5OH
         csSoMFyiwBZ4cTTjGY0ujNWnd8+pe4NfVxoJn8E5gVWc45KL6eTjTEqHQHDeffbgURp/
         bZck5kUzz44bNBBDUK7pm4EFwSHTJJQoLtLh0pU8VcjjBPnKolUBBlTByVdIQjlR5bZl
         iH7SlnA0FfyV0eykqaUuozulm7BgaXaWAP4jyrE72E0PGjMwp5arcX+VXXO7L57RHq4J
         YlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810860; x=1736415660;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=odDHdEKVo1ECoBHd6qSHP5bCx3nKUQG5008PYymM31w=;
        b=VIzCpLf8If7Sm2TTjMDgrrCQzR8GjFwI2dpH40FGi4KqBAV041PSVP6NMR2ngmO5m1
         KSBrscSqYAlvqHuk/7fRX09CihfwXSaaJzVkQSUFyJjr22Icf8+prv6iL+i4Pb9JrgcA
         +QeV5+hMlJ47PzyMbjOzsKO03xPyKwDF1ttKMkVZt9Eh0pCvyGItmvZzQDfrtRZaMf2R
         PldWjz2AakhHtosgWgECLh+KQ0cOIKWdoA0qmoyFM9QbOhQrsyITZCdnEW+AuPSvDmRI
         3i7NO9mgAkdquc7DF3lM5igBQT/O99XqjfjKXtbYn5IhrjchLxcPHGjtK/NIQbtER4we
         S88g==
X-Gm-Message-State: AOJu0YxDVmbLOPYA2oVR98f6BmZb9GGvI1vR3+ZQXeIUI8gvaUTPgMVV
	vDIbu6cFiymj0dxmNfRd4iU6GA3+AwQ8sskiwzOW1CgAGeZNvKMcMgh2NG1mchA=
X-Gm-Gg: ASbGnctoHEJVvNEPblhqCtCvFKGP+LCfH1V5CjT7c4XqzHdtDJ+fdxos3iahvzSbZmv
	I+l7a42RegoL5pucqHl5F3ShQWjItzwZiTDCZn5LL/md88Q2cOxub5gSPXmxXPymUY8YPDD0KDD
	AwbRnRzklvkWh1jM+6jLNLIVB7yQA5r+iT75Q/T/GRbe9QDAAI85tFehCWG+ZsImWrcEEQZ4ere
	LtrR/QN6NpG0jf9n3oJMoqdnKgYnla8/6qezb6MPY6dpM1ky/uxUgeHJbm8khAWPKwe99V/fjo+
	snSwHt8aAjPS7EuR3FVoVJ/uTl10Glnipg==
X-Google-Smtp-Source: AGHT+IFYDkDox7plguF5rgyeIEMg1cp8DLocgikphY1yErZzrrY6xhBUr9jUMcggCFeUOsushSH/Dg==
X-Received: by 2002:a05:600c:4f92:b0:436:488f:50a with SMTP id 5b1f17b1804b1-43668646896mr407348285e9.17.1735810859938;
        Thu, 02 Jan 2025 01:40:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1cfa:329a:aa2e:f0be? ([2a01:e0a:982:cbb0:1cfa:329a:aa2e:f0be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm37183733f8f.38.2025.01.02.01.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 01:40:59 -0800 (PST)
Message-ID: <e211b522-83ed-46f9-a114-9cae30f44977@linaro.org>
Date: Thu, 2 Jan 2025 10:40:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] phy: amlogic: meson8b-usb2: Use FIELD_PREP instead of
 _SHIFT macros
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, kishon@kernel.org
References: <20241231191718.2764065-1-martin.blumenstingl@googlemail.com>
 <20241231191718.2764065-2-martin.blumenstingl@googlemail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20241231191718.2764065-2-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_014101_711743_EA5FD914 
X-CRM114-Status: GOOD (  13.63  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 31/12/2024 20:17, Martin Blumenstingl wrote:
> This simplifies the code by re-using the FIELD_PREP helper. No
> functional changes inteded.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/phy/amlogic/phy-meson8b-usb2.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
> index d63147c41b8c..d9c761b7c15c 100644
> --- a/drivers/phy/amlogic/phy-meson8b-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
> @@ -5,6 +5,7 @@
>    * Copyright (C) 2016 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>    */
>   
> +#include <linux/bitfield.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/io.h>
> @@ -39,9 +40,7 @@
>   	#define REG_CTRL_TX_BITSTUFF_ENN		BIT(18)
>   	#define REG_CTRL_COMMON_ON			BIT(19)
>   	#define REG_CTRL_REF_CLK_SEL_MASK		GENMASK(21, 20)
> -	#define REG_CTRL_REF_CLK_SEL_SHIFT		20
>   	#define REG_CTRL_FSEL_MASK			GENMASK(24, 22)
> -	#define REG_CTRL_FSEL_SHIFT			22
>   	#define REG_CTRL_PORT_RESET			BIT(25)
>   	#define REG_CTRL_THREAD_ID_MASK			GENMASK(31, 26)
>   
> @@ -170,10 +169,10 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
>   			   REG_CONFIG_CLK_32k_ALTSEL);
>   
>   	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_REF_CLK_SEL_MASK,
> -			   0x2 << REG_CTRL_REF_CLK_SEL_SHIFT);
> +			   FIELD_PREP(REG_CTRL_REF_CLK_SEL_MASK, 0x2));
>   
>   	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_FSEL_MASK,
> -			   0x5 << REG_CTRL_FSEL_SHIFT);
> +			   FIELD_PREP(REG_CTRL_FSEL_MASK, 0x5));
>   
>   	/* reset the PHY */
>   	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

