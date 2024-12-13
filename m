Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39475E77182
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 10:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WA6drCMppYdVISfpkuD87PDa0h+Hfy91b3d0JmUIEnc=; b=g28ISIH9neonZocR8c7aUAxxU+
	uH1fiMveMJGL/FsrXihjSZaVtEBAgys+f9wjpPZkhfMMPnn2vf7fghTsb1MCkTAdcyAHyCgHLG958
	sR8T8gf6ujAjEQGgLIEiHv3p7g4FaM8pZBBVejNyfb84GdrZFeO5n9zNYN8fNJEIhkNUMiHzRdZEP
	u9c1DCjBHjtPkiTE/7Fr/q8Rri9Lj+3pohySu36ls9EOzYZjvWxq+8FH+LeLXqYZvhif9mBFcL6T9
	gKv/wS5xPS77Atj9FyoMQL45W0aG532ZCCNH5+xT9zVgPZir4tGQA1/3i5jg8ULdnPfZPeGigkGQu
	qvfMrk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM31y-00000003RUq-3ASK;
	Fri, 13 Dec 2024 10:36:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM30E-00000003R8t-3hLw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 10:34:36 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso16618505e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 02:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734086073; x=1734690873; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WA6drCMppYdVISfpkuD87PDa0h+Hfy91b3d0JmUIEnc=;
        b=PMGQOxzrrtBNEvGocHzwHgbVanIB/Dc7x3U9FceaL3MUdG2D2bDB6r/2A4KYimsn2S
         vkgaygFoUp5TAVIpcYg/0z1HdtsSt5cKTIYa0SiqIIN/UZufKKdfi4jjEXFr64iiCbQ6
         74DtFvPHauzJE1sWCzBUKHjyZlL8dAAx0F6v0KpbKheT/CE0ToARUHZ4nmoOXM/7gr3t
         ow65dP8srAHnMzTK5LPfE8NwaCGtbDvfD1zRuUsDAwhjT8fQvFF3SeommRtarU1UbK1O
         SXIsodlrKZyj2YHQUDWo17qDsTPr7W9rDXpP4O3d7ALJGZKe7pmROJILIrqM/P0r5F0p
         t03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734086073; x=1734690873;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WA6drCMppYdVISfpkuD87PDa0h+Hfy91b3d0JmUIEnc=;
        b=w1pweihDFKs3qwmlsTSdaArM+IFGMo+KY14SkHl++8KdYrt6FXDVHKdj+wWJ5geCjl
         KfkFDGqJoYVU2oUMWjbAIqwo32AW7W+8YML38AiNx32M4ibfZkMBBvLgFxcOODv5okHj
         Bt7frWw6dg0HTGsEIzJjssapYRTPOy7QpU6y241nqzxhXDFT1Txmnv0U2Ua2KDCSCNvW
         OnvibrKwoco9VYYkTxNDyCIAeV386RpvLCP1gQlo9CzVRMQgyjjmai2PDUwnMTwNKGvW
         k3let2WFfNMOlHQD6snPbOE9xrBG6mMMKsZg7q3UurGaBdUx76yv8xcXJ71stD+fFK4N
         w/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ5MOQMKOXxasA0kMV2KsVjVFFwysy9P9Nkp7LqY4BUKt3QlE7NlsVCBMF72ancZNtCI6HtV7mOe7IRVT7a9uH@lists.infradead.org
X-Gm-Message-State: AOJu0YxmuEzwF2JHlKX6ByllUu2gq9qmom0NIBJA5C5gd5fcY69xd5RY
	zptbZd1seu3g7RCXU9+EpsegMuUGeyx3sKCFx+QbgJOcioNOAOw+0QgVge8egUI=
X-Gm-Gg: ASbGncubSSwytt1uejEa/jqry1vF52clk5/+RbnVHURIDqdWKI6DyM9Qa9TWoEX9qLU
	yIlMtVFDqCb+ywADQs5E6zMeuJR7+u3c9hYnoHFIhIfRM8IZwv7WGeQc6BdYvdW/HCDYl+b6EMD
	MGOgeOwCiHkrQe66hrCSOWkFOMKEC8AEH93j5rTO/F+rDMztKXPOXzNvinET+52nkdRZqStNX1m
	9fQ5HelEvNNTPe2AUrY4snB0p8+60X0J3PuQ6Ff7CRJMbFJzmYevNgxJk5MoIDAP5MA85UeI0FK
	FgpZNiFvxPqGtt5IPIe0SbDWkHAuss8KiA==
X-Google-Smtp-Source: AGHT+IE8QIvOjYdMGFe/6r6ILHvAeGLSVV3a3eXEBuyeoNQwwo9IPedJWyk14Nak5HhAqjkv4xRTYQ==
X-Received: by 2002:a05:600c:3503:b0:434:ff25:19a0 with SMTP id 5b1f17b1804b1-4362aa94379mr15608885e9.21.1734086073135;
        Fri, 13 Dec 2024 02:34:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4795:2d16:2587:ed70? ([2a01:e0a:982:cbb0:4795:2d16:2587:ed70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm45453865e9.41.2024.12.13.02.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 02:34:32 -0800 (PST)
Message-ID: <cbf51c06-2183-4423-ab61-65a93f903a04@linaro.org>
Date: Fri, 13 Dec 2024 11:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] clk: amlogic: g12a: fix mmc A peripheral clock
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241213-amlogic-clk-g12a-mmca-fix-v1-1-5af421f58b64@baylibre.com>
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
In-Reply-To: <20241213-amlogic-clk-g12a-mmca-fix-v1-1-5af421f58b64@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_023434_947696_D58832D4 
X-CRM114-Status: GOOD (  17.93  )
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

On 13/12/2024 11:03, Jerome Brunet wrote:
> The bit index of the peripheral clock for mmc A is wrong
> This was probably not a problem for mmc A as the peripheral is likely left
> enabled by the bootloader.
> 
> No issues has been reported so far but it could be a problem, most likely
> some form of conflict between the ethernet and mmc A clock, breaking
> ethernet on init.
> 
> Use the value provided by the documentation for mmc A before this
> becomes an actual problem.
> 
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/g12a.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index d3539fe9f7af5538201a78ce560f662ddb3935f2..20be7b037c07535bd2115f6e70404a95a7832756 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -4311,7 +4311,7 @@ static MESON_GATE(g12a_spicc_1,			HHI_GCLK_MPEG0,	14);
>   static MESON_GATE(g12a_hiu_reg,			HHI_GCLK_MPEG0,	19);
>   static MESON_GATE(g12a_mipi_dsi_phy,		HHI_GCLK_MPEG0,	20);
>   static MESON_GATE(g12a_assist_misc,		HHI_GCLK_MPEG0,	23);
> -static MESON_GATE(g12a_emmc_a,			HHI_GCLK_MPEG0,	4);
> +static MESON_GATE(g12a_emmc_a,			HHI_GCLK_MPEG0,	24);
>   static MESON_GATE(g12a_emmc_b,			HHI_GCLK_MPEG0,	25);
>   static MESON_GATE(g12a_emmc_c,			HHI_GCLK_MPEG0,	26);
>   static MESON_GATE(g12a_audio_codec,		HHI_GCLK_MPEG0,	28);
> 
> ---
> base-commit: 52fd1709e41d3a85b48bcfe2404a024ebaf30c3b
> change-id: 20241213-amlogic-clk-g12a-mmca-fix-c9ebacf34d9c
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

