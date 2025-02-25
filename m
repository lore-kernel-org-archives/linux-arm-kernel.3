Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09587C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIEVpBfqzlAIj3t3+p9Xkb4HBEKJwXzTRtthqqzde8o=; b=PAvmggOu7KWCi5B8JfgxzF6plw
	4U+HkqischDqBle04Sm/VdgPGNkAyLjrO7w+mR+dgFNtXwz4f0OJm1kmVf9EAqw1HVDwsoYYva/31
	lZgSolJbkLgezd4FxDzjhM+pRxWeaS/9Vrq/OqOGrDlVgR9Zn0mzr5SX2cyZpmu+8zVwaA5h/9ZH/
	iHegEoDOyQjRRFxdVbB1otKqm5UIV3bQlPrxq2N29Wv38j+9zM9/Ceff+jcm9bl91lM3OUObkto92
	h5dYqCLp/K0zsxjlljKddCI27WVdKKCVcxOSXUgj3B/K3vrFKh/7lPvBjgVaEqvyVW9GH0l7qIQzZ
	ea1cU7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmt9P-0000000H2WH-3RfA;
	Tue, 25 Feb 2025 11:30:59 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrwD-0000000Gm7T-14RY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:13:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so37107765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 02:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740478395; x=1741083195; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIEVpBfqzlAIj3t3+p9Xkb4HBEKJwXzTRtthqqzde8o=;
        b=C1Vr8FNZg8hoOqiyriocihNbRzMyhz5xIsU1P4yss6fBw92kjCWsQ8+pQGb8Loo/Mv
         ybD0pRntKx7e5JUvAXjtBHCKVLUE7hYa5G7jd/LEnj46IzUcpLk6JJWg8wd3/uqBiiF8
         yqkY0xsXESJolkkac5ycSxon53juim//3kHuNoMjrX+QTLUc/Td+Eh5MYxhH2BYiGHBi
         8V5QQT5iRveKIeUqhatLB5iQygRyK9SWDMfkChW5SGNtb3u8iP3FtnRhjG0IoqtFIVFE
         1+r+XKpBabi+HAQHl6mE87E0zPsA4hfD952f4ZotiN3ZC5seWO3MnfvTZCrT/bJtIpqt
         oMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478395; x=1741083195;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UIEVpBfqzlAIj3t3+p9Xkb4HBEKJwXzTRtthqqzde8o=;
        b=KM0eGlnfjyqvDUQ/rhn779uIz5zOuYIEuwuLvs5iTrLsVeWwOFh4mplVfIWO6UDJ7w
         E6TMenBG7+K+be2S57KzX82J8fNOdq9ynlbLK6eFW703ExCLZTFOaRH0Lm0Y5lXmRatk
         yFMoWNG7PGFZz28328MoCAHbKtU8Gd2itWg4nE3ycNz+crCkh9F5hInlYes1NKI2x/jI
         lTO5Cz6OEGdJ/gnqfjNsrubKNiDBDHMrmWToP3Gcu+w3ZPS0g1gxSp7gfZ1oXCyFzFO+
         QmKeR80aL23FWsHRWO9x0hDFK45pF+D5kkWVd57FBvHJrTH8gj7g8/FVHzWU4K2l37hs
         y4vg==
X-Forwarded-Encrypted: i=1; AJvYcCVbBoFnSkllRAaIjLdVApXQa45XfSyxJ4XIBBbCiRkZEDaSMBpFNJdNI4HUQ9cyGuJM+b0f1R003clPlCH9DuYw@lists.infradead.org
X-Gm-Message-State: AOJu0YwWD4SuZNLobFa2YyBlv/dAQLebVbHU7nh0A3St8qqOsj9wlECp
	h2kuuiDmbXDGGQiDgrEf1dNLvDkhbrnsL5zdqqRjbrnq0kis3utuO4SGejn2A0A=
X-Gm-Gg: ASbGncsVW8hlTLCU8bTB1AwelgA+QQprEhci3LMuvJFmBFzz0omi/OdeiWtfJNgvbap
	sgW37R+1c16pS7WQh1q3K6r5uz02HSlkotqPpLAB+B0TYOSG+9YihtP1V6st8aznb0Hnepi/3sZ
	coSoqFLjW/tcSJa1Dvlqv+UtBd+T9Ks4RON4xbWf3D8UsR8J5wMvSn5bwGB/gkZ3waEtp8lqu+J
	f53W6WD8VQkjtvLLR62Tl5N0x+q7w4mqx7HNmnQcEiUBZePkaViiugqqExVSz55CjIzOadWz+VV
	LTU274C2WIBpFA2K3WAGCRItZRgnSc5w6emB
X-Google-Smtp-Source: AGHT+IHuxrFve4RrQxTJm/qq5KQxrxMVsYCL+f8dws0ADcO/Z7yzKKpEwdKKdpFUHyiamvR4ZVYVPw==
X-Received: by 2002:a05:600c:46ca:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-439ae2d1f3fmr129669155e9.3.1740478395441;
        Tue, 25 Feb 2025 02:13:15 -0800 (PST)
Received: from [192.168.1.100] ([37.167.173.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce615sm135803455e9.5.2025.02.25.02.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:13:15 -0800 (PST)
Message-ID: <d4903cb5-f876-4229-b89c-c1fafd77fc3c@linaro.org>
Date: Tue, 25 Feb 2025 11:13:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 08/14] drm/panel: simple: Add BOE AV123Z7M-N17 panel
To: maudspierings@gocontroll.com, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-8-5ccbbf613543@gocontroll.com>
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
In-Reply-To: <20250224-initial_display-v1-8-5ccbbf613543@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_021317_302278_C14E40BD 
X-CRM114-Status: GOOD (  15.47  )
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

On 24/02/2025 14:50, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Add support for the BOE AV123Z7M-N17 12.3" LVDS panel.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index a52977ab73dc2edab0d1954c702fd797d6a5b969..232b03c1a259eb15e423b9d452d28e2ff95c70f8 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1403,6 +1403,35 @@ static const struct panel_desc boe_av101hdt_a10 = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing boe_av123z7m_n17_timing = {
> +	.pixelclock = { 86600000, 88000000, 90800000, },
> +	.hactive = { 1920, 1920, 1920, },
> +	.hfront_porch = { 10, 10, 10, },
> +	.hback_porch = { 10, 10, 10, },
> +	.hsync_len = { 9, 12, 25, },
> +	.vactive = { 720, 720, 720, },
> +	.vfront_porch = { 7, 10, 13, },
> +	.vback_porch = { 7, 10, 13, },
> +	.vsync_len = { 7, 11, 14, },
> +	.flags = DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
> +};
> +
> +static const struct panel_desc boe_av123z7m_n17 = {
> +	.timings = &boe_av123z7m_n17_timing,
> +	.bpc = 8,
> +	.num_timings = 1,
> +	.size = {
> +		.width = 292,
> +		.height = 110,
> +	},
> +	.delay = {
> +		.prepare = 50,
> +		.disable = 50,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode boe_bp101wx1_100_mode = {
>   	.clock = 78945,
>   	.hdisplay = 1280,
> @@ -4845,6 +4874,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "boe,av101hdt-a10",
>   		.data = &boe_av101hdt_a10,
> +	}, {
> +		.compatible = "boe,av123z7m-n17",
> +		.data = &boe_av123z7m_n17,
>   	}, {
>   		.compatible = "boe,bp082wx1-100",
>   		.data = &boe_bp082wx1_100,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

