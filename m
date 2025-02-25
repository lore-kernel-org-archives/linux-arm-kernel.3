Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1522C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/CdZ+U93yCfAHM20K4VCGZK5tana82Sk9q6rPMpkaE=; b=w6r6tLdl/QSyS6gaDNI3SKRXf1
	9hwsSHuDprRGP+Le7SI7HiRncF+E3CJUNoTXoljho7Tp3Ssp/mGmQeQZ9tHCsjHrWEkZGwH4o4AA9
	qGy4XMgq5J8jGR464Z5vBgFxa7I+9RBYxAek4O8F8d2fxemiPPX9t3tppZ587cycJ+tVI5Ccu/qJi
	cGomQpXg9zyMBB7NcSXLcrjxtlW6tDmW09hHaKLXI3nD6opBhgnYK54BrCPc8+tx2j5nDdq3jdPZQ
	DxbiE2q0T3E3d3AErXudqH0jjX8BhFMfrjkZLiDyv8LP6nHE4bvfmXuP9LZd5VEFUZI7aqMLcctVv
	fik6sVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmt7u-0000000H2HL-0hq0;
	Tue, 25 Feb 2025 11:29:26 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrw0-0000000Gm3q-2kJS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:13:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38f488f3161so2927205f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 02:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740478383; x=1741083183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/CdZ+U93yCfAHM20K4VCGZK5tana82Sk9q6rPMpkaE=;
        b=oLNW81fhxSe37FyZF+6IWpFeOMP+ZnSw1sJ2nNPSSW8sqCMqb1Uew3Pe5AZNwXHt4F
         ZWgA3AGq58CLb6hPNR4WBzrQUvxWGhYNbKH/aGxTLRvxAqWfw3Qd5QyEJ0SYWviSz1LJ
         7JaSaZ6eKT6WAjcZhy/q8Bp51zuRXiDpRzRzlQ1NZKwR6zNK11fIe6Px8yR7HLS03yPT
         Avp2p//4/FoYO5RhBEnu53seo76kpFl0Mob0/5947pW+/wEkiT16N6KBx/MV0LGB3ziq
         HYi09fhMW/WrTrZO2TvbH9TEXV0GCsUo4JB4o1Fs0e//6iF0HiW/yUAfwAtuuUBCCN6l
         1AVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478383; x=1741083183;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j/CdZ+U93yCfAHM20K4VCGZK5tana82Sk9q6rPMpkaE=;
        b=gNaTE0nn/Bfl95/7Sf1p+WK3jujrN2OrXvEyxN406pyxS7/jl3QXUJltAnqwPdqH7a
         59QT0MUFxrybv3+wVfSyazBBKDOjDflM5OPfz6EWmTTZTEBvJ6rYohKenVM3Hmr/u20A
         jv2kCiic8pafJ6sNt2BTHwbV4ooCZ5AeAEnzIRPMIOIe2Fn/T32pnyGKSkPEeF15w2EP
         m/6VCAUCGbf+jpkEi1jAtjvGM4LYRAAiDMwq7PbIdElpqEWJrlI8S7DnJvXSyo59RsKD
         zLQpcj3Foz9/Y2rw8tGI3/mssO1pXyJS+7cOzqExbUuQ1JzdWHbfA1pyq0P37ByXbO0j
         BXcg==
X-Forwarded-Encrypted: i=1; AJvYcCWZRx8QRvHa2n8pJFa4ukFNF/1bcHc+akMV+q1ickDGs6TOwXcTJVydtAna8zndUl7Vg5yrSxADOcqIYex8Ln9m@lists.infradead.org
X-Gm-Message-State: AOJu0YwOLHInLBpS4kKtJeBsr4ozbUdr3HH+3YyII4a44GO7hpyhhic6
	0xViVanEkuUsWZfZaqGeoTwuclsCA3w+OLVQcOs1YUMIHXAD02NRzKIPdf1jRXw=
X-Gm-Gg: ASbGnctiWzo23Qq/bN1PfSNpwZMz8lVAzcvP4A49TdJS7bY6igIuY8syBzAgyQ3E/rM
	zKIXXVbTw5dMVA+wSX8TeBRx89vzX0gnUfdSf/hSBI2FOu6oHEme/vfC48agwSCberp9UVSBkgM
	ZJD7/16p200/Lu5xZP7eUc0CDduDp0hAsyhSozpIHkuhYXxjhR7kZuf89r8jPJywLoMC6wEYEe8
	dVh+OfOdUOvnrp/5fEW7fhR+/RVbd1DuCHafieWyEH/1AwVTQ5OdwfHlWOoz8I3kL56PMKiCi+2
	zTddtbMzqWgw1xElEsdjNXcli0UFvVvdOTJ/
X-Google-Smtp-Source: AGHT+IFG+1rFiHyvGAdLQom1xamSgtQXx5X9EhBwiiiWXiH5ajISwOfGmcfQGL3L3N7dQSd1xz/2Pg==
X-Received: by 2002:a05:6000:1fa3:b0:38d:d603:ff46 with SMTP id ffacd0b85a97d-38f7d1ffbfemr10982478f8f.14.1740478382825;
        Tue, 25 Feb 2025 02:13:02 -0800 (PST)
Received: from [192.168.1.100] ([37.167.173.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43a9d921c9csm93910385e9.11.2025.02.25.02.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:13:02 -0800 (PST)
Message-ID: <d08ce3dd-a639-4829-a9ca-c4f897336228@linaro.org>
Date: Tue, 25 Feb 2025 11:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 07/14] drm/panel: simple: add BOE AV101HDT-A10 panel
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
 <20250224-initial_display-v1-7-5ccbbf613543@gocontroll.com>
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
In-Reply-To: <20250224-initial_display-v1-7-5ccbbf613543@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_021304_700962_FAAC781F 
X-CRM114-Status: GOOD (  15.56  )
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
> add support for the BOE AV101HDT-A10 10.1" LVDS panel
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9b2f128fd3094bfb6731fc348b91cc101f495a86..a52977ab73dc2edab0d1954c702fd797d6a5b969 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1374,6 +1374,35 @@ static const struct panel_desc bananapi_s070wv20_ct16 = {
>   	},
>   };
>   
> +static const struct display_timing boe_av101hdt_a10_timing = {
> +	.pixelclock = { 74210000, 75330000, 76780000, },
> +	.hactive = { 1280, 1280, 1280, },
> +	.hfront_porch = { 10, 42, 33, },
> +	.hback_porch = { 10, 18, 33, },
> +	.hsync_len = { 30, 10, 30, },
> +	.vactive = { 720, 720, 720, },
> +	.vfront_porch = { 200, 183, 200, },
> +	.vback_porch = { 8, 8, 8, },
> +	.vsync_len = { 2, 19, 2, },
> +	.flags = DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
> +};
> +
> +static const struct panel_desc boe_av101hdt_a10 = {
> +	.timings = &boe_av101hdt_a10_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 224,
> +		.height = 126,
> +	},
> +	.delay = {
> +		.enable = 50,
> +		.disable = 50,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode boe_bp101wx1_100_mode = {
>   	.clock = 78945,
>   	.hdisplay = 1280,
> @@ -4813,6 +4842,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "bananapi,s070wv20-ct16",
>   		.data = &bananapi_s070wv20_ct16,
> +	}, {
> +		.compatible = "boe,av101hdt-a10",
> +		.data = &boe_av101hdt_a10,
>   	}, {
>   		.compatible = "boe,bp082wx1-100",
>   		.data = &boe_bp082wx1_100,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

