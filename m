Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC22C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZICbs1ZKFUXAVw8Uv53chEaSv1izJm54XChd7BXTSFI=; b=vAE17YT4vN1PRbHvWRXlY86d/Z
	qQ1eoiY5i2TjtnOWZfS014BN7azgeY2njQevuYcKD2qW3pB1g9Zmnia6odmNt9FMURhWcS6cYF4KV
	nVh9AIMfUUgOWIWcsB7QjvZQb30lJhJPBRRSyslF5zLBogZLOt7zilkv4DOWLWz2VVUJuW16kYyKy
	0WIYorVnAm9czw3/xbMJ74ygXN+5xuU2GxWjjZmr53uhs66GOPoCKF/G1+GISAcrhrp50WroP3uPb
	xEo6Gdxocee2wcftGtEfZU/ahOwUwoF6RetwD315qWrdDyuYzohk/4fu+gmzm6n7GTlHg37izbYuK
	ynS0F7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmFV-0000000BatR-3Q6C;
	Mon, 05 Jan 2026 15:12:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmFS-0000000BasA-2Wms
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:12:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso199505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 07:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767625917; x=1768230717; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZICbs1ZKFUXAVw8Uv53chEaSv1izJm54XChd7BXTSFI=;
        b=BltVfcdxXqj8NQk21/9GhftU26DJA/A7mOU/wZnubvoySKObb50B1kBcxUn8aE4yUr
         VUzH4AtsNDLpcGLBJfaY3ZmZA4EuklSqfw2ZSrL2/AviHALXq+1YsKTT9VKE3I//W8zF
         usSa6rqvNo20mylI4J4Zc8cJDUiEPE5z4Z/zwdNw606qHe0PLLY8EokTH9M+Da8H7oBl
         bI1PVALwvZgzHH0wcXXObniD11JKbhkcv7RMhwJ0BPSZgKR+vQe4y5QIoqYyJVjwGiWZ
         FU+8hUZOwJVs4RfwrKyG1QWRJ7BCqz0DEXB2G+jKhhpir9CZH1XNlJRtgbLEUkFh9OOy
         DM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625917; x=1768230717;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZICbs1ZKFUXAVw8Uv53chEaSv1izJm54XChd7BXTSFI=;
        b=WZl2EH5gBPv8zct24Y1En0UjpwmULcL8qOCkpGggQN4siP+32km7mn6dajbDWOY/7R
         1GqO2BldXYlutrXLRvI0AUSKJ2pH4rOIN0Fnui7l0bQ6eYP/viHnymAHNQbdZrfesoK0
         SododpPbVpIDxHY3H7CqT8I66jla9sQOqlyBSpMBR4WHmBYFJ1GdFSKYvUUIXz5Mn6FI
         /IPRSNPc0mBjKv8Dj1SjFdBZmH+qtiWRYVREAsdZkcgmCX5KHE7dVoIlx0Rv4jIXCMzh
         HH3AHgn6Hrq/Ikf889Dt6EymX7u5XX23C+1+yzsr6pCun6HAZhFYGvwdw03pVxQbPW8I
         tmsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+9rhPsyA3WTAyJeCB5uE/3y7PuiogXgT7gpqVFc7oBWA52mjSq/Qkq5kas+XHunonI9DTi0sNXZF8rtte95e4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnz3/WebOXzyW+5N4m3Lgscwq/NtAWdDbADjiELh+M2OgKvUO4
	mF98OMd8FlDUMt+IpuHH7QVDvcsKFIN51S7Wyf43+HmZs/5V5leEFtPYloV9tjKj3HDCaYaLdSQ
	Q/84U
X-Gm-Gg: AY/fxX5Y1C1Mh/MFklvHNP8e7rK/9zJGQdIir1Cb0zzQdz1iB7gFyz5aujm0zk3cUa2
	xD5jcRtM3dqrHsYRpc+kODI1EuzMsIwibVjA10Cg7QOwE6xGs77My5vokQACam9ez9/t2wWSdg7
	rDv44b0NX5/+h0AdfQHc7BPycvEfNmohOJ6JrLVKofdIBBHUVOUU+KUoYRcJso3/GHjm2qxYl0O
	mi4WT691zXHZlggqkJs45vtqA4SE5AhhhYSNr7ezNTOfOIWEQZZC9pL5m9XGnwmR2cZyXs+kn8h
	6e/SPbaBPqE0FvOSEJNLeaSZ2cKCSwBAHwJHCZFyQYkhb86RJspc6x6a1IBnQx7m0hofjFhAG73
	FyvVQ/WdHMjMvw0QBp0r723d93GqtzvJSOW6Hb/q6Ui9o04YN1GaKsDdXJ1mcoGPKv97lZl5CZr
	RaHSxMXpORLIN/OPGRM6ej7l/Rba/D/3wCPih2duPBFkiG45+M4/SVCbQfWYGLQ9Y=
X-Google-Smtp-Source: AGHT+IHRLvC8RFN1wxpNMmjmLXPXlAzEc9S+ADXuomF/jWk/3+qxIvBtpEcUlQn4VBvzYM2OCRH1ZA==
X-Received: by 2002:a05:600c:154b:b0:477:55c9:c3ea with SMTP id 5b1f17b1804b1-47d1958e7b9mr656916475e9.35.1767625916649;
        Mon, 05 Jan 2026 07:11:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d4c1:5589:eadb:1033? ([2a01:e0a:3d9:2080:d4c1:5589:eadb:1033])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d13e2e0sm197844145e9.1.2026.01.05.07.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 07:11:56 -0800 (PST)
Message-ID: <9fbeb95f-8f79-4983-857c-659566206835@linaro.org>
Date: Mon, 5 Jan 2026 16:11:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/4] drm/panel-edp: Move FriendlyELEC HD702E
To: Robin Murphy <robin.murphy@arm.com>, heiko@sntech.de,
 dianders@chromium.org, thierry.reding@gmail.com, sam@ravnborg.org
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <cover.1767111804.git.robin.murphy@arm.com>
 <027763b36fbad2005d09eeb289b7716c57f65e76.1767111809.git.robin.murphy@arm.com>
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
In-Reply-To: <027763b36fbad2005d09eeb289b7716c57f65e76.1767111809.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_071158_707738_E2DE3DCF 
X-CRM114-Status: GOOD (  16.04  )
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

On 12/30/25 18:20, Robin Murphy wrote:
> FriendlyELEC's HD702E module is an eDP panel (in as much as it's some
> LVDS LCD behind a Chrontel CH7511B eDP bridge), so move its data over
> to the eDP driver, also resolving the warning about the missing bpc
> value in the process.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++++++++++++++
>   drivers/gpu/drm/panel/panel-simple.c | 25 -------------------------
>   2 files changed, 26 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 415b894890ad..dd53ccc209ce 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1256,6 +1256,29 @@ static const struct panel_desc boe_nv140fhmn49 = {
>   	},
>   };
>   
> +static const struct drm_display_mode friendlyarm_hd702e_mode = {
> +	.clock		= 67185,
> +	.hdisplay	= 800,
> +	.hsync_start	= 800 + 20,
> +	.hsync_end	= 800 + 20 + 24,
> +	.htotal		= 800 + 20 + 24 + 20,
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 4,
> +	.vsync_end	= 1280 + 4 + 8,
> +	.vtotal		= 1280 + 4 + 8 + 4,
> +	.flags		= DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
> +static const struct panel_desc friendlyarm_hd702e = {
> +	.modes = &friendlyarm_hd702e_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width	= 94,
> +		.height	= 151,
> +	},
> +};
> +
>   static const struct drm_display_mode innolux_n116bca_ea1_mode = {
>   	.clock = 76420,
>   	.hdisplay = 1366,
> @@ -1663,6 +1686,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "boe,nv140fhmn49",
>   		.data = &boe_nv140fhmn49,
> +	}, {
> +		.compatible = "friendlyarm,hd702e",
> +		.data = &friendlyarm_hd702e,
>   	}, {
>   		.compatible = "innolux,n116bca-ea1",
>   		.data = &innolux_n116bca_ea1,
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index b26b682826bc..3ea52667b858 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2359,28 +2359,6 @@ static const struct panel_desc frida_frd350h54004 = {
>   	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   };
>   
> -static const struct drm_display_mode friendlyarm_hd702e_mode = {
> -	.clock		= 67185,
> -	.hdisplay	= 800,
> -	.hsync_start	= 800 + 20,
> -	.hsync_end	= 800 + 20 + 24,
> -	.htotal		= 800 + 20 + 24 + 20,
> -	.vdisplay	= 1280,
> -	.vsync_start	= 1280 + 4,
> -	.vsync_end	= 1280 + 4 + 8,
> -	.vtotal		= 1280 + 4 + 8 + 4,
> -	.flags		= DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> -};
> -
> -static const struct panel_desc friendlyarm_hd702e = {
> -	.modes = &friendlyarm_hd702e_mode,
> -	.num_modes = 1,
> -	.size = {
> -		.width	= 94,
> -		.height	= 151,
> -	},
> -};
> -
>   static const struct drm_display_mode giantplus_gpg482739qs5_mode = {
>   	.clock = 9000,
>   	.hdisplay = 480,
> @@ -5235,9 +5213,6 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "frida,frd350h54004",
>   		.data = &frida_frd350h54004,
> -	}, {
> -		.compatible = "friendlyarm,hd702e",
> -		.data = &friendlyarm_hd702e,
>   	}, {
>   		.compatible = "giantplus,gpg482739qs5",
>   		.data = &giantplus_gpg482739qs5

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

