Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89140C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMYiRXMoedjydkMWi7aq5mntKyVVNxUPoNVSwHHbIuI=; b=gQNx6QaAdoNkD5YZJa3vLIkkfq
	AjWaIYYSBfqQZI6C8a4V/IrYthp8ELcLtpaqDXY5+ktvK8/RHAQa6UOE52G39vzFMfXqy3lhsvrY5
	aniF+bBrkBbS9AwdEj5y4xdwZBYD4HcCLMc/CM28VIZb5gqo085Qx3EnSZgDSWI7SlOhux6Pp8S4C
	StvJ3pbOdJ7oBP2UXfrW4xlsROeoAgy6Hd1MOKGyJswl3pMk/DlNcbSHx1ie1tFCeAw7er246HVRL
	afAwc5l2cnsZJkniJYyItZwMbOOLKqd1FLnJpoFl7bEeDcS/L5U6NoQW7TE7eRbaLSOwRTSJfyBCs
	X57psYjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixPB-0000000As7Q-3TZC;
	Mon, 04 Aug 2025 15:47:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwue-0000000AlBH-2Z2y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 15:15:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-458bece40fcso10082035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754320543; x=1754925343; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMYiRXMoedjydkMWi7aq5mntKyVVNxUPoNVSwHHbIuI=;
        b=FLr9MCewyx8008IYWY1ZKWahDUhlEY/nB9cF4I+QH/L/ef/eV2p/pb0Mx50BZcO19I
         r+j7XbEL3rkb9Bu+Zdfamf2nEBG6SDG08/roVZebgKt0Nl7BywTuxzFL0d4MbIaeZ+li
         W0gWAudzArkbuQTJw/PiQXc//QwTMjg0HdOlQkoO16nbNc4mQ2EiueWdI4KPgeK18Oaa
         lg2JwMg23lpKwr2agMznKSo255E1Fz93nUzoVZzfEIvgXKuPEz3mIk0EkGM8JwUypqzW
         bxWry7NLJvhLy28EpLlV+5HJPbLG7sVnVTwJwyUC61j1toA2UZkLdk026Z2jHJO2FRZa
         O+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754320543; x=1754925343;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CMYiRXMoedjydkMWi7aq5mntKyVVNxUPoNVSwHHbIuI=;
        b=lasAD83vAx/xGrzSFoxxaEXKpOEkb6LbrMo6JrDn2d/VA1r0z5c6L0A04FtV9qwu4H
         LtDlgMhaQgmNQ2xeP5dD7wRFTZMP8I9A998Qk/+Rsi8h2Vy1Ht2KhcSztRSY3cbf0lfh
         l3M6btBN7uro42LVxDXxOV2z/DtNdizFwhXwk27ODxamp8+hvpJfbGJEk3kQSdIvYLGU
         dorA2D8XXEwQJ+A9W6lrs4oUVDifHLTtgtPsoZTx5ZxY/7kQZKPvwdzTSGPMkyF3hXWu
         8STdqjgg9bAskmFoirF9IP71EmG6QukZo/7SPATYtsop0+d89GKz6P2vD+fR/53O6k9k
         QYZw==
X-Forwarded-Encrypted: i=1; AJvYcCWXz1ywcGCG6IeVzuGfufo27UgnFZBRd5YtkeH4MhF1/UdZ6VTZZVmmQyXENaxxsIMtM+NXcCFjmWlJj3xs3wV2@lists.infradead.org
X-Gm-Message-State: AOJu0YwCvAIJyFsNWt8P6O2X628Y4ZjTtBYAIUr266asi/UQ4Z9Ab5L5
	+Mk4B3K6VDNOhCIALHvcDLOUfHboLtv2Me98PMuH3Em4mzPHVb5RXPuSE0beNfkCO8s=
X-Gm-Gg: ASbGnct6oWOnvQjjUcgfBAgJx7zVItEZ/MpXBfNb9VwXEszct0pN31rEhij43x9MSQ7
	0M4EkdntwzxbSZAfHmmwDp3AMwgSL4m9G4zW19yr98WkQQl3ABYycKzbav01Uy5fkXvlMf0FIMv
	uEypKJ+DTQ/Lc12qSqOUnBq/Oie/CGNC0GZssPfcbtxKSbpRECmF8Xjivvd+rUVrzl20N+Mt73x
	I0ep1ePc/DySE2RBXB2Q/dyAnrxnVOTDvN1DvuY6xA4NHWiu7MYziaomadE1wm3HGzMPqZKSj3f
	LddAnpwSbwKXTFP4KXwFDZ7LHAd437x7exprMng7ib+EQq70c7yJ0vzZhoBEBqmnjtlwhWYQekY
	rF3HrJ4r0LHNzN6FZlFlbe+Lg34ofegCqY/nAe4WXArR92uLKe00/TVtyecXJczMoA6pPuu2PFt
	E9pZKpb8tc5FsXlymQPGaT
X-Google-Smtp-Source: AGHT+IEr6cmOOwDSjxgdpQtx4m7PijiOu0vwQxDdoA1/nkq5lSHu7HpzwGQERaUKnohUCx/+2yzIag==
X-Received: by 2002:a05:600c:4f08:b0:459:dfa8:b854 with SMTP id 5b1f17b1804b1-459dfa8bb6dmr14866075e9.5.1754320542960;
        Mon, 04 Aug 2025 08:15:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3030:f63e:fedd:700f? ([2a01:e0a:3d9:2080:3030:f63e:fedd:700f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589edf5638sm171780825e9.4.2025.08.04.08.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 08:15:42 -0700 (PDT)
Message-ID: <16537c3f-824a-4268-a51e-5efc88a671bf@linaro.org>
Date: Mon, 4 Aug 2025 17:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 02/13] drm/panel: ilitek-ili9881c: move display_on/_off
 dcs calls to (un-)prepare
To: Heiko Stuebner <heiko@sntech.de>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, andyshrk@163.com, nicolas.frattaroli@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-3-heiko@sntech.de>
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
In-Reply-To: <20250707164906.1445288-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_081544_644778_D4D9B93A 
X-CRM114-Status: GOOD (  21.85  )
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
> At least for panel-bridges, the atomic_enable call is defined as being
> called right after the preceding element in the display pipe is enabled.
> 
> It is also stated that "The bridge can assume that the display pipe (i.e.
> clocks and timing signals) feeding it is running when this callback is
> called"
> 
> This means the DSI controller driving this display would have already
> switched over to video-mode from command mode and thus dcs functions
> should not be called anymore at this point.
> 
> This caused a non-working display for me, when trying to enable
> the rk3576 dsi controller using a display using this controller.
> 
> Therefore move the display_on/off calls the more appropriate
> prepare/unprepare callbacks.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 27 +++++--------------
>   1 file changed, 7 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index d7a17dca2a9c..a20b52181ea0 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -1315,35 +1315,24 @@ static int ili9881c_prepare(struct drm_panel *panel)
>   	if (ret)
>   		goto disable_power;
>   
> -	return 0;
> -
> -disable_power:
> -	regulator_disable(ctx->power);
> -	return ret;
> -}
> -
> -static int ili9881c_enable(struct drm_panel *panel)
> -{
> -	struct ili9881c *ctx = panel_to_ili9881c(panel);
> -
>   	msleep(120);
>   
> -	mipi_dsi_dcs_set_display_on(ctx->dsi);
> +	ret = mipi_dsi_dcs_set_display_on(ctx->dsi);
> +	if (ret)
> +		goto disable_power;
>   
>   	return 0;
> -}
>   
> -static int ili9881c_disable(struct drm_panel *panel)
> -{
> -	struct ili9881c *ctx = panel_to_ili9881c(panel);
> -
> -	return mipi_dsi_dcs_set_display_off(ctx->dsi);
> +disable_power:
> +	regulator_disable(ctx->power);
> +	return ret;
>   }
>   
>   static int ili9881c_unprepare(struct drm_panel *panel)
>   {
>   	struct ili9881c *ctx = panel_to_ili9881c(panel);
>   
> +	mipi_dsi_dcs_set_display_off(ctx->dsi);
>   	mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
>   	regulator_disable(ctx->power);
>   	gpiod_set_value_cansleep(ctx->reset, 1);
> @@ -1499,8 +1488,6 @@ static enum drm_panel_orientation ili9881c_get_orientation(struct drm_panel *pan
>   static const struct drm_panel_funcs ili9881c_funcs = {
>   	.prepare	= ili9881c_prepare,
>   	.unprepare	= ili9881c_unprepare,
> -	.enable		= ili9881c_enable,
> -	.disable	= ili9881c_disable,
>   	.get_modes	= ili9881c_get_modes,
>   	.get_orientation = ili9881c_get_orientation,
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

