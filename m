Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5ECCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiLXvYR3SAh3lzG8T3IGcW7j/zOR5abUB7/PBrsQY6A=; b=uXIq1XUmIEzktQPHPDDrZ3Hzl8
	q3mxCYitXS0NLvSAZ1Ckr5EOq2vDaMyoTOhj+7hbd+D5s6vkdfDABMp2K5M8ScjxzUt28ugoVtzeR
	9lO/epskCIZRylzkJcgZ+/3nKV2998kIXFIe+XwEfvnRPUOHhKR2liJnVIrvFpBBdMuiMELtHPrB0
	h58itMuyWzKkRUaa25wU15srsPFTrPO/DE9aUsYaYY+1yqndcruqVFqaIAX0xbscFEHIW4xQPeneJ
	KtogBqTzjcLSnPQBywU3RtK8dAnaH3UEx1ZyWYaKiY4s8JFm87jaNnMQZ2FznQAmb0m1nTfLoBG/c
	TinCsm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHKV-000000004X6-3GQu;
	Tue, 18 Nov 2025 08:44:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHKT-000000004WV-1X99
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:44:50 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so28067125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763455487; x=1764060287; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BiLXvYR3SAh3lzG8T3IGcW7j/zOR5abUB7/PBrsQY6A=;
        b=meK8y5Fz3X2gdHiBngC3xe2Wwp8BKACZkDJK2884lStU/SOv1ejMNmV1qRpxE8rsIB
         6I62Np6xAe2MSVgV55+MppYjDQn0WLeSQQR4XTyzav8/RYauD4xnGaVc/AfGOCyb2qeW
         ccPo4YXWG0YG4ivx/YDf+qp7lPLUHypfiObOx5lG098mc2ZhLWJRQUd9M3GHnaoFN30R
         X/5nwYx3N886mqWzKNE6DUBIk6x5LD6NMuQbBxp/rwX3LGYZ/fMKafK3024CtAI4eVZR
         9q/luu8eZgTfIX40NenJDMGPUKu6hrh5z1W8lnB6WO/qV7n8UShFWQSunh7JGSajkwcO
         PArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455487; x=1764060287;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiLXvYR3SAh3lzG8T3IGcW7j/zOR5abUB7/PBrsQY6A=;
        b=a8g9Bs2Hokj1AL32sMf0JLY3MHFNBuUZje2UlnM664JasbynDRfGd4rVTNY3XLW585
         /Ifd62VyBvM/MGT0nXkJ6q0Q8HuknSabA0/0O8ghovnFM0YOlzd7/wnNgfFtjOmL90EG
         UmG2g/wJJDY6ABCEGTMEIt5lM2v0uXok7SKNvjGNzC1y3QtXHjXtY8ic4cGb1McliYit
         wRNCxXvA1j3BLV0pvr/6zC6qcO8NBHB5JhABwuuWkJMWXrLJCmMvQMeCFFIpKAFAQQB7
         2cwDaq/VQo2cCvRite/bWpFq5sNIGLWM0TBlvAGLAw8Vc0vpmATwKloDfPA+lHlJuMNA
         1Fvw==
X-Forwarded-Encrypted: i=1; AJvYcCWfwyaxdNGFwFdB/XVfVUIE8QjOHGhOW3CIUUVqIsVGBjSDDoMpTPfqMx7ZTZFb1uEZ9aVPlGK20SuJRtrdlZh8@lists.infradead.org
X-Gm-Message-State: AOJu0YxBFT6VEc7coDgtZP/2mXscikYnesWsYKAqYMQcmh9SqyF1BXvw
	EHWgH5JH7hCB61WOiAhSv00U17MyN3gHqKTOLy2cRpcwK8EyIsIkJE09ymhSWbIS0lI=
X-Gm-Gg: ASbGncuhKePX7cBHithoP4ffRG9J7tL2G534YQM6BDh3B3K0VdNocpmGe5ydyM0Vtwj
	q/ChhFZVTKuwJvGIs/zw2qAqVNG835vaca2uhP+nXT0Y3BEEXDc1PDgkf1bw4tS+cyF7x+g+EEA
	uIs1/xvIKLE6WJ8dLfgrtmiD69aTJdYZFejyxOqfipZ6kcVIB/wMKGSEvf0Hj3Y2vfRlXRL/5TX
	irXx6/OWlJcfusulusJZDqmu/eEdDgFOnDl1FhYAyWEqQeXjfa/mpjFDaX9DTF6U3o15eU8zuip
	0HsbuZpRowNkLmSv5MExYrYLWVlZyf+rw8H2tsNTpXGNC1RLL3hO1HHdwZRAFXo9kORzIXkS8AV
	Hu/S/pXkxvBYhSQBZi+oCdptTPKWf4CruAbMVXs6tY9f/YfR5mTIbIO/za714WbrC2MuSNWdCr7
	WNmFWq3Oh9j8cMQ4MN+2vIdGlFZSFhZzDuQe6HJ5sWEQ4C2o9LwXoUIHj/lj3DN/ejGHDTfD6ab
	UzNK2TX3Jkt
X-Google-Smtp-Source: AGHT+IGJqAXhGGSb6TQDs+/kJY+mvonLz1d9fwow8P219ibyRskSfl5sWQxul2oAsZJHK4/xFqAfuQ==
X-Received: by 2002:a05:600c:1f88:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-4778fea7579mr123949675e9.32.1763455487194;
        Tue, 18 Nov 2025 00:44:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dcbca9sm11108095e9.6.2025.11.18.00.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 00:44:46 -0800 (PST)
Message-ID: <5401d99e-fa43-4c9c-8eb2-c3bb126ff75e@linaro.org>
Date: Tue, 18 Nov 2025 09:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 05/11] drm/panel: ronbo-rb070d30: fix warning with gpio
 controllers that sleep
To: Josua Mayer <josua@solid-run.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
 <20251117-imx8mp-hb-iiot-v3-5-bf1a4cf5fa8e@solid-run.com>
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
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-5-bf1a4cf5fa8e@solid-run.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_004449_437628_945E8B75 
X-CRM114-Status: GOOD (  17.39  )
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

On 11/17/25 13:28, Josua Mayer wrote:
> The ronbo-rb070d30 controles the various gpios for reset, standby,
> vertical and horizontal flip using the non-sleeping gpiod_set_value()
> function.
> 
> Switch to using gpiod_set_value_cansleep() when controlling reset_gpio to
> support GPIO providers that may sleep, such as I2C GPIO expanders.
> 
> This fixes noisy complaints in kernel log for gpio providers that do
> sleep.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>   drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> index ad35d0fb0a167..c3fbc459c7e0d 100644
> --- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> +++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> @@ -54,9 +54,9 @@ static int rb070d30_panel_prepare(struct drm_panel *panel)
>   	}
>   
>   	msleep(20);
> -	gpiod_set_value(ctx->gpios.power, 1);
> +	gpiod_set_value_cansleep(ctx->gpios.power, 1);
>   	msleep(20);
> -	gpiod_set_value(ctx->gpios.reset, 1);
> +	gpiod_set_value_cansleep(ctx->gpios.reset, 1);
>   	msleep(20);
>   	return 0;
>   }
> @@ -65,8 +65,8 @@ static int rb070d30_panel_unprepare(struct drm_panel *panel)
>   {
>   	struct rb070d30_panel *ctx = panel_to_rb070d30_panel(panel);
>   
> -	gpiod_set_value(ctx->gpios.reset, 0);
> -	gpiod_set_value(ctx->gpios.power, 0);
> +	gpiod_set_value_cansleep(ctx->gpios.reset, 0);
> +	gpiod_set_value_cansleep(ctx->gpios.power, 0);
>   	regulator_disable(ctx->supply);
>   
>   	return 0;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

