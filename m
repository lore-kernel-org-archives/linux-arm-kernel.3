Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE5CC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJjeVcCtnXKnWhoVwXfMDE8hWmtcV5EpJXafPxt/CSU=; b=Qgxp2FotUio3dr2zt0xXkXDIhh
	N928u2fzbkS0Jqym3P2QUGWifRa3Z9IpTGoHeHiCoTiojxkfK0Xeueu/c4KuCidzhLV/l/JFN/pBf
	KlXw31W+bE7yJK+Y1khhRwmi2DXBWGv8hJEBwWpvqbkBy/BtG/dTOwGt2rd9f4cvK1+cOCQcQg2KX
	uKg/g4GhzOtAHJK3ytRjD9RlYzPO7r43obJaa8G+fKwi6gLxJ6orKG94oKbHDxx5CvajgPfTYPHfL
	X+r8bx7UYsdK9puExzI1N55uFLLAzBVcEdNDMJCxyipk+Qli4ZperqySUP3RLIHH5EwQHB9UxFEGA
	cFUAmUTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixMd-0000000Ara5-1Ydv;
	Mon, 04 Aug 2025 15:44:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwuZ-0000000AlA5-2HDa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 15:15:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso27661505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 08:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754320537; x=1754925337; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJjeVcCtnXKnWhoVwXfMDE8hWmtcV5EpJXafPxt/CSU=;
        b=JySwR2msVJDusrZR+bssA93c7xe/Wnh3XOcC992OlkOnSz4KQjp9iiDXkjmPArGj9K
         Ew/CWvAn0AoiDH7LTpxpS50ilpyLULZbZkg/YF09NeXfH8F3zQsBgnk6prBwvmie2LzN
         4ArFJRkFfo39vfP6mYTwo+VLMt8AQC2ULmdoIwTvki2v68g3q3xM29ukMcFKg1cYgo4M
         JtKv+T8iQMCR9HB6TfsBv7w9BQ4e2B+oYlFgoD08TSdakug92PJVs+YVG+1+ggxbonXm
         hQJ0Rc9HqZ15ekmgJurAJ29Bghj8RjxJ7MYlo8zd8jmcDINRgA30cH15QCESuCToQSEJ
         Vr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754320537; x=1754925337;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nJjeVcCtnXKnWhoVwXfMDE8hWmtcV5EpJXafPxt/CSU=;
        b=WHUbToqy2l7hRVRa19kTBzG9NX1pqbPVUoFoQ+II+5eQ9eqmfDchd55aDA3ntce5+u
         QNmuP31UYpt0/g7ohN1hci8uOwGBrS0tpmvlMmE6+p+yfLiXpBYEuQRLgvKSwmtoyAzA
         oT5Ra8u8jy7DmQXQ5TUam21ecH47lLFzk0V8+O/MqfcccuRjuafIjHlFv9COFjO2Q4J7
         98VrtYaLygxxk+xqrc74d9D0iGFK7SWfZYcgwP8bibv6p7X9y/RQh0iwqdGdEIbciZz8
         8/QOBy3OkPTDwcRUlwZ+ipS/1P5W2eQFaVt96bpSmOtf6139gxrgGmjKeTioNYAu6X04
         /sWA==
X-Forwarded-Encrypted: i=1; AJvYcCUXAOQFdZoGeEYSPODOtRNQo4Q3Cs2F6ihsUdZtCHefQCgYXwM7lSRQzY2KYCG9v/x4zNjL+4UFYaez4A8niql6@lists.infradead.org
X-Gm-Message-State: AOJu0YxYs1GQs2jYAhw6sRquPTt1D2DqIiGvy1lYjoL1I5vmrZtmPS48
	CABPwgjSQkWI4zdy4848omYxQsp6HAoADKo6cCIi8X2Vt8neAYoJoCeoVBW8Qe3Ja4g=
X-Gm-Gg: ASbGnctwlgdZ/c421PBn+NAkEbtF6kbgN54Crjn46efOJUGFxzDdkQtzVzhYSIz0Zu5
	eJsZbKhmhuX8qaot2ps8pJdO8SD8RawsoVAT3M7qtr9ZumsDL2lXm9RmwyGEeRFiTQbXy/aQBRV
	c23RKGqKmpKCyKITh0lIlqBbSOJn0gaGWUZunuQaNJnT2QiqXuOOBJ0xYEVlCAoSdgJHJxCTkoD
	tPhfwXiZBSk1FfNrZGpIrp5pVtWITSHHA/vvIpvw/shrgbYU2goU28LMoxnLx4/Copww0rYBEsJ
	nR+z4iGlP74cIXcONkmvkEeyRSlZF7hxlD7ibvB9ngqw1nOX8lM7NRRjt+g/ulvQzJHTyJNoyQY
	pUQoSlirDv5otEvtO2mo8pOfcfZME0NcEuvt5Bnqq/vqPNA98Pjb2lpxsqbPxx2OZ5q4sxYeOag
	8=
X-Google-Smtp-Source: AGHT+IEETbK5B9R4l4zfHSKM2IatUBsewiluok9u8cat8QEYDfF7e+N5lM3tAMhEwAekOpfuhYvQ+A==
X-Received: by 2002:a05:600c:4ec6:b0:458:c059:7da0 with SMTP id 5b1f17b1804b1-458c0597f5bmr62093385e9.2.1754320537459;
        Mon, 04 Aug 2025 08:15:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3030:f63e:fedd:700f? ([2a01:e0a:3d9:2080:3030:f63e:fedd:700f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589edf5638sm171780825e9.4.2025.08.04.08.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 08:15:37 -0700 (PDT)
Message-ID: <0a2963df-59a7-45a8-a74e-e6f4ff1f9868@linaro.org>
Date: Mon, 4 Aug 2025 17:15:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 01/13] drm/panel: ilitek-ili9881c: turn off power-supply
 when init fails
To: Heiko Stuebner <heiko@sntech.de>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, andyshrk@163.com, nicolas.frattaroli@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-2-heiko@sntech.de>
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
In-Reply-To: <20250707164906.1445288-2-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_081539_585958_FC8DC5D6 
X-CRM114-Status: GOOD (  16.41  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 07/07/2025 18:48, Heiko Stuebner wrote:
> The prepare function turns on the power-supply regulator first, when
> preparing the display. But in an error case, just returns the error
> code, but does not power off the regulator again, fix that.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 28cd7560e5db..d7a17dca2a9c 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -1292,7 +1292,7 @@ static int ili9881c_prepare(struct drm_panel *panel)
>   						      instr->arg.cmd.data);
>   
>   		if (ret)
> -			return ret;
> +			goto disable_power;
>   	}
>   
>   	ret = ili9881c_switch_page(ctx, 0);
> @@ -1304,18 +1304,22 @@ static int ili9881c_prepare(struct drm_panel *panel)
>   					 &ctx->address_mode,
>   					 sizeof(ctx->address_mode));
>   		if (ret < 0)
> -			return ret;
> +			goto disable_power;
>   	}
>   
>   	ret = mipi_dsi_dcs_set_tear_on(ctx->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>   	if (ret)
> -		return ret;
> +		goto disable_power;
>   
>   	ret = mipi_dsi_dcs_exit_sleep_mode(ctx->dsi);
>   	if (ret)
> -		return ret;
> +		goto disable_power;
>   
>   	return 0;
> +
> +disable_power:
> +	regulator_disable(ctx->power);
> +	return ret;
>   }
>   
>   static int ili9881c_enable(struct drm_panel *panel)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

