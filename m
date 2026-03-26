Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B93106F302
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqy37fTLBIgdrRRJV6oiAJlRmShF96nT8C9cnYI6+hQ=; b=Hjuh35e2H+H9g1Pjcv35HZppmu
	6trmLOsKcMNQgA5KJoDcAJxaNDT3kdGdq2DP+qcnb+MB2RYmncVAreoF8Inn7WMledD328+6WM8dt
	/Za+x/qE8N0W0ploJHwrWigv/u5lc74JMh6JH4hK1AJe19RWyEDKAAAOC2tDlpo/pwqfjfZLBYZLe
	yMq84Nw6PSeiZCIBmv4QLEih/oMAArRbIlF5JJP+i42HTyrb7/wteFbDTLXyK2B3WJkdb0o7zmRsw
	uc08GqG7wf4G1Tfywi7G3eTt8aTmtYr13045bgv4q042DnSBua7oAd7SDeU8QS7TyQLoG8VKa2k+g
	IufGLbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gEn-000000052Vk-0pRP;
	Thu, 26 Mar 2026 08:38:45 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gEl-000000052VK-0G3D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:38:44 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43b527ac5d0so330151f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774514320; x=1775119120; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqy37fTLBIgdrRRJV6oiAJlRmShF96nT8C9cnYI6+hQ=;
        b=YAzfqgncG2EmmPmzMOEpYYbl/sGXeypUwmN4ldcP/up/B63dMG6NA2rFh99lmlDs6V
         X5VzLbtynSuCKoxpGTjkUqz8R+3MPFngRhwZl66uJMrrpfEqRUG+4sKN0CCRPeS3CF0z
         DJT1p7vUKcUfiBHCDr5ZLh6GjVsK/Jj8r1KOa5acZZASZLRB/MX2Ct2NqNsZt/LnHqVT
         q3wlR7PSabzGcWKHVCMf4StC8Jsqb6u8oUwAE2NIl7xwKao+VVYWgU92U1wmsu288ZbE
         nMKx1dHyWPpzF0aT5zBANW2llKx3F7FfArNke06MxbwRGYGrWCoHrjrbZV7vnNBac2ZZ
         oBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514320; x=1775119120;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqy37fTLBIgdrRRJV6oiAJlRmShF96nT8C9cnYI6+hQ=;
        b=FS7F6SiJ3MngEHL9PKd+/khYQpTbaaobMlM6o0iKLpETIA6ovr7lqeN1IQYdTC81Ga
         WJk4kOYoA7pJO/whUWiR1remDz2Yj6oTBii6eHxlcSd8TFeG3DTomqDz0k4KAOUVyqlR
         YOy0lEM9EValPTc6UytAvq9kFA+tu4ZDEzlZox+N18CZ5lkuZqbaybi5awNCPSvBwTR8
         Rygkn5Q8jhmU2Je4sIWlJf68x2Z7Y2LQCZJ435IVRVQvWVHnyTavR9E3yFi+nK1d0bd4
         QJ5PU2CbUMgq5JGsY2Xe10mxHpjgH5RYf8tSBJA97S71FGilJ0v0YnDqoLk/RakcSo0N
         GjMA==
X-Forwarded-Encrypted: i=1; AJvYcCU4NNtNJ+n2EQvrDTZLHMzBv+fpgtymaPq7pLsBlFVZtAXTCw8I0dkx/hfmAWPEImmmQWnCDZ7FdFhg+uZjgG43@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhm+jaIsmWl1mPuAIM5kg5H1SRikXiH1TL5YfoYR6aoYac1Ccv
	pumhBGdFrQ7bZxafxgllYhDNPh9rsNoW8OgIFVuIKojDXsqUsVO3XmOjNOzNER9m1Kw=
X-Gm-Gg: ATEYQzyDTI68EDK0X+R1cCIGSP1uY6xQ2TcufAvosy4kbePNlCux35VdH1iEUVgSGyY
	LP5rGY2XznGqWSK7UgB4KzggFCHItKDP8pcM06wHPjDF8C6dOTsKv0kDghiN881qAAO6pC9gI/O
	L6wf+Kaxmfps/u3Iru6YvYuQh5iIhV3apV21uaJb4esGzTg7TpWFw9UTMyVHlk/GyVw5glSoVpc
	qltTAhnS8pqkLKpjDkKbD2CU4eH1+YXyZXeElyTCWvAc90qIAtUhZluQHSiHJCXLkF9HlAfcghB
	yNOD9nxCqz+b2SYj+cHZ3JYMzrBv9fWlB4Qwm/XoMb8W25SWEPZevZy3GYXvAvsQAleWDls9gpe
	ejqo9OW6UfDtDB2THp/HfOdt1mPySnscIJGfkV61HdzFuEKuc8ZbzLarWqH423XyC5gEiXF/+V2
	reToXSGEZw4mrOO2tzFJKnGGejUbaJLg66Thj0ZALufld9PqWqTrDGSxCY1Cm4PfbhOCnhhTJn0
	tmxQpUwadwph8G2uQ==
X-Received: by 2002:a05:6000:4381:b0:43b:4468:b114 with SMTP id ffacd0b85a97d-43b889db4b2mr9444918f8f.23.1774514320331;
        Thu, 26 Mar 2026 01:38:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e68a6sm7333599f8f.33.2026.03.26.01.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:38:39 -0700 (PDT)
Message-ID: <dc18d8b4-34d8-4c66-bcd3-e20c4af50319@linaro.org>
Date: Thu, 26 Mar 2026 09:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] drm/panel: simple: add JuTouch JT070TM041
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
 <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-2-10255d236439@pengutronix.de>
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
In-Reply-To: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-2-10255d236439@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_013843_134542_825F10B0 
X-CRM114-Status: GOOD (  13.74  )
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

On 3/25/26 12:32, Steffen Trumtrar wrote:
> Add JuTouch Technology JT070TM041 7" 1024x600 LVDS panel support.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 91ab280869bac..6ac263f83793b 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2940,6 +2940,35 @@ static const struct panel_desc innolux_zj070na_01p = {
>   	},
>   };
>   
> +static const struct display_timing jutouch_jt070tm041_timing = {
> +	.pixelclock = { 40800000, 51200000, 67200000 },
> +	.hactive = { 1024, 1024, 1024 },
> +	.hfront_porch = { 16, 160, 216 },
> +	.hback_porch = { 160, 160, 160 },
> +	.hsync_len = { 1, 1, 140 },
> +	.vactive = { 600, 600, 600 },
> +	.vfront_porch = { 1, 12, 127 },
> +	.vback_porch = { 23, 23, 23 },
> +	.vsync_len = { 1, 1, 20 },
> +};
> +
> +static const struct panel_desc jutouch_jt070tm041 = {
> +	.timings = &jutouch_jt070tm041_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 154,
> +		.height = 86,
> +	},
> +	.delay = {
> +		.enable = 50,
> +		.disable = 50,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct display_timing jutouch_jt101tm023_timing = {
>   	.pixelclock = { 66300000, 72400000, 78900000 },
>   	.hactive = { 1280, 1280, 1280 },
> @@ -5352,6 +5381,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "innolux,zj070na-01p",
>   		.data = &innolux_zj070na_01p,
> +	}, {
> +		.compatible = "jutouch,jt070tm041",
> +		.data = &jutouch_jt070tm041,
>   	}, {
>   		.compatible = "jutouch,jt101tm023",
>   		.data = &jutouch_jt101tm023,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

