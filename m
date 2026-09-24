Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C078C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Oz3plDiKZZCia6T0UyGOKiCd1d6w6OxiQiVqDt00Z8=; b=O4wAeikJm+h2Q/fofJBJUKgI4a
	GQZw0wvgTuNjp/fhYSTf524RvQbe/K6Qjjg2G7IQRL7ucpmBv85wHFDAhW+BJvtjV9WxeRVxF+8eA
	5OWHP+fVvU97/kg1xZCUdgoJYH47zu9iVuy6AdyTrFWEK5Gl/jlDXnL6+mcygLlNOzVzWB0lxTQUD
	1YsZsSTape24Orimp9patQa0hGsUenmXkQBHCi2V957QkSeBANn30XbjK7WwQfnSB7/MwIiZajznZ
	4Xgfw/Xy5FK2SYM+R88K7ry5S7e+uv244wTBsdr2gSJWI+61h1eI4ncPePmiGqlO0ThmfaXa+AWkp
	yjgWazDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jYe-0000000B6CZ-48yz;
	Thu, 24 Sep 2026 13:32:17 +0000
Received: from mail-wm2-f13.google.com ([74.125.225.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jYc-0000000B6Ab-1fXg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:32:15 +0000
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so18829335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790256732; x=1790861532; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Oz3plDiKZZCia6T0UyGOKiCd1d6w6OxiQiVqDt00Z8=;
        b=A/z2Cbt7XBcgk0bg+0BMk2NJeJg57EMreskA0lidLX095oKYeN+o8sExaMxgvU5bks
         ae2TooWIkJ/Osm/yUC6TLvpm9L6ylDOfiIhHiwxDSoDsJ3ZBvi3FJUeL5w18aJ2+Jhc0
         3ifEtAbQ76JCF5LQ5bIqxmmSqRgfyUQiwOuwkIMnhWsbZSzC/9m5sFqvzDzOzBqOyQ54
         BSFeLr8fDabrpdrg54SQy4QKmlcTefSmULji326RC/6sP5PNZi5qCui5fvx+1N/Swu43
         bBnVKbmw5jX6O7aeXuJze+IKbX0zxbeg4pZUGb2usCuX81s9DGfNC6dS+lQJ84KY2UPN
         NoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256732; x=1790861532;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Oz3plDiKZZCia6T0UyGOKiCd1d6w6OxiQiVqDt00Z8=;
        b=w6PBRDgwiAXwglK/1/D5B3KSBUtkNzkUYi2/eXJN8Zihd4X/WiTM+1b/k7F180c4oC
         HzpMeur/hTOTP/8FZ0ESm7XzB8QHR1cybpLMBk/4MavZk3AqCjKe9ir/r1GlJwRtPN24
         kadwMCGMezOUavC/X+CYT+XvFgt9fjGz86KuZP8qLOMaBynzD/auERD4SZGkBXO2vKJZ
         fN43X6k0W7ePxy3p8/KmXv0eCtgDpo3IyjL54imkHYzNNijRPeY8pqIaPegW9AUtLE0y
         N7JPPqal5EPX15VJwxmFG+tV6Qog7X5Plcm2/kYaFBkZvvAwES7tux4KHic68a7cR0mf
         KlYw==
X-Forwarded-Encrypted: i=1; AKwUvBzCehzPwXl1lKz3kKLirdehAfjeuvqTjGnJHIb0YeI8rVUAqRwdDLfRzwFtm1JpbMPVGbEPuKkn0nYtrpJvKm6Q@lists.infradead.org
X-Gm-Message-State: AFuF++k9WUvlshqb5TvRVJVk4IGoBSdq04iDnCSphrtO6omxveMkqSOe
	wNiONftQhVYWHRSNGX5VsonCkq82Dm3Fae2cMjcREwECxQiZ7B7tzhkGR5I89eMmchs=
X-Gm-Gg: AYBFou3gmSXLakMPOzaPqInxg/fKlaE4H6EJl7ml+Wr+eeLAhKBtZA0FbLWLWvrvuaX
	EyRMqEgF1qjekaSX0PdQAungi7k7/l+K37Jsz88rnPw8MX2U4wMxZpMzgIuKXHR4keS65nPebsW
	5YsGrdwqNSQpkiJWY2MhpeM6ywfm2ZxnhtX8cF6zf0Hpix0+2ofJU+wHdOBiiPerlo5psSiRU9u
	fiJ2XY9m858TPRNsLyuF53woGlfHMdeszXgZjrKGuexeM/ggbitdMoitW0XU2bLUXxriXNG5Sbi
	Qw/kaclMczLO9jOqwjsim33HECphAG9LDq2NG7H0jczRu/jn9dTa1F6YWrbl5rnl04cd52x196B
	xqpiDZqAxvKM7XmbCbH4+pSGU/dqnD4mi3JUzy7diDtnWIchQiLM6YTITvU/sNgALsCvGPv85cw
	TTzDNIrcFGLlHEGihB3Q8lcGhZBhLv5I+nNWLx/Ywd1oFyuegc7e4paRT5hdvj/Ezt76sIU7ezb
	KdrTIpUxX2YOov2mUYu0XMIlT43fNnmMv2o6qhPY8NuIuGBzZLTbg==
X-Received: by 2002:a05:600c:1d1c:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49fe66c9ae3mr43287325e9.3.1790256731984;
        Thu, 24 Sep 2026 06:32:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5ce4941sm66794335e9.6.2026.09.24.06.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:32:11 -0700 (PDT)
Message-ID: <42dea883-cbbf-4835-b8f0-b27a016ec339@linaro.org>
Date: Thu, 24 Sep 2026 15:32:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/3] MAINTAINERS: Add myself and Ryan Brue as
 maintainers of NT51021 panel driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>,
 Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260917-qcom-novatek-nt51021-panels-v4-0-30afbc35d70c@mainlining.org>
 <20260917-qcom-novatek-nt51021-panels-v4-3-30afbc35d70c@mainlining.org>
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
In-Reply-To: <20260917-qcom-novatek-nt51021-panels-v4-3-30afbc35d70c@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_063214_464106_EBE6C60F 
X-CRM114-Status: GOOD (  12.34  )
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

On 9/17/26 14:51, Nickolay Goppen wrote:
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>   MAINTAINERS | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7291238bc09f..743c785b4558 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8354,6 +8354,13 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>   F:	drivers/gpu/drm/panel/panel-novatek-nt37801.c
>   
> +DRM DRIVER FOR NOVATEK NT51021 PANELS
> +M:	Ryan Brue <ryanbrue.dev@gmail.com>
> +M:	Nickolay Goppen <setotau@mainlining.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
> +F:	drivers/gpu/drm/panel/panel-novatek-nt51021.c
> +
>   DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
>   M:	Lyude Paul <lyude@redhat.com>
>   M:	Danilo Krummrich <dakr@kernel.org>
> 

Send again with a commit message.

Neil

