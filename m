Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996C2CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 07:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfKsH9xwm+tQ3snlH8Sxro/uZ5qaHdIhEycOMeeCONk=; b=q/X1C4WqgIITYJ7RG0xOn8hR0M
	tHqNeiC7d7GETNPUxSmFsuUfc2xLxU+z1qyzHT6RV4eEWeIZ9cvG0fksMi0K4Sz5/nQkTEfi324JH
	C09BZwPVB61ObxwYQf58PnXZFbzEmq3AtqB+U1DgrTzHemQSLKyFY16l9SmFASDJIWOgxyvQ6Cu6F
	Dw8ilJQh9/P4uNsdNH0kvZk3gB5vyKQQyLbRHGjHnrlK4Ftk3H6GG9v7VyhpFixuuxKYCzL4MzXZw
	njQS7qNvwGfMv+5lfOrRcZh8VeS7Gh0Ca400ISmtOM9LLycN+/dUztBj99a7HHwab7hltIXl8wRs4
	YDYSZKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEnR-00000000To7-3Bih;
	Tue, 19 May 2026 07:23:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEnP-00000000TmN-0LUd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 07:23:20 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso38918285e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 00:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779175397; x=1779780197; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfKsH9xwm+tQ3snlH8Sxro/uZ5qaHdIhEycOMeeCONk=;
        b=BdvnapbeLp0KU3On21Sj56eP3leMpN2hL7tc6pdk4XGpCc8tIHyjxXZC+Od/yEafC3
         DF5n0gfE4HI1/P1keL4tn8yAMZy3jG10bgo2My70nKNfxJiUDMn6zutFJAdJyzaNGpGJ
         CSrboVvg2je0p2mZI1aPG4k5qudmqvKt16FmK7zjNvM3DKxQBVnIiaN+mjTFqSQzllin
         k03/wSvGeSI7/DcyNSca3W2xzvyn87LBrpmkiyT1M+YN83QsWGDMTOdeHNiWCEx39Zg9
         5eBlgzS3u30A9651kUpztYghZNAE4Fxj+ExARchorqfUkVjVzlO1gY/CZTjwsTaYFL75
         GGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175397; x=1779780197;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfKsH9xwm+tQ3snlH8Sxro/uZ5qaHdIhEycOMeeCONk=;
        b=TsUYC+5+tvge41oBNsXhznA+5ufnR81ZRti0XZFrzblhJoj72WocvzSsua07A/zHb9
         Qeyd2DYkxrBYw32nZK0i2CqJF6V9aL0ow15dBvwSe3CVh25ZyunVIrkSUaXTFZTdQ35v
         G2pnWtrGadrqNzQeA1Hy58mTHbTuQ0ixf9Z0/gTYOYwWSceYo9W6TJ3zsTn0/RGiDTF8
         w18e6/1e20rixX+kKQ0Yi+1UwLKe0mg4barm8PLc/RrvaDWEmpstjc855zeQt10Te6A0
         egx5Cem6yMRo9FuXNH3a8Z/63eM3hGaeZB24hhOTURjcfPgyOQq5frga/PDO1pdUQGSa
         U7JA==
X-Forwarded-Encrypted: i=1; AFNElJ+C+lpSOiOYhsTRmmjwl7UVWDJCgnNZOMX7fx0P7cRIzW01iWrj4HN3No0bHnusGUmQnuKi2kKxF3eVGkZpM1RU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe6E9N0zggdaGqr+Y03d/S9ZQzlyyIQ3dUaYjTAVuIuBGu3RFH
	O2xcHESfKbnBu9Is4GZNUE7DSVZX4JLWL+upLD2jxNFx5rLaLIYyPsLnsbaxoKKv1b0=
X-Gm-Gg: Acq92OFvhvNpM4T3SewOrc2XmgaccmOeC3wRwFxK2HLvbN2LIS60xLEmWw14mhb0EDR
	v0wvZ9XNNuGFhNkW8c6LjKV9FCqwsgFDWAlXhGOZ6xsqmC2NvYVXSJOKZDZ0wdPYTiDF9MOjh3v
	9XSaL37cnXJMVFdm99MhR+VwdlgITDtouV9uwnVZEO2ajqr7WiwZGJdAQaD8frgNCXqRPK/HZ5K
	9AQBvtLv8zraJ2NTGP+jsrpIfszZ0yjTsYpJ7YtwZVmzWsyHxv+LroFGxi5tKZq0vo5PkliTYHe
	tBVEyNcdTR4kFwXxW6K5Mtvxfbdy/P/GJEvGvxRO7MnZmEgz7+TqMRTvcYapgRUIHrKszyecnns
	rKXNqYw0yOkhCd2NTiFP7E27STd7R+ryvWGNyFKSeMZvHj1Osz7gib49ch8ltabk96XOe5Bvm+F
	hEYRCW+71lLXp8HAdb5oDWBiEY4iPiLAm4xfBF8mXSA8N3h+4G8R5etGFLaf0r8yiKj+BfYiECO
	z7Bx6teTdkM/ZIoFu4BC+1qdQ==
X-Received: by 2002:a05:600c:4fc9:b0:48f:d612:3c40 with SMTP id 5b1f17b1804b1-48fe60e47bfmr256329325e9.7.1779175396985;
        Tue, 19 May 2026 00:23:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm43240799f8f.37.2026.05.19.00.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:23:16 -0700 (PDT)
Message-ID: <77cff8e2-11a6-4fd0-ac02-7468441f7476@linaro.org>
Date: Tue, 19 May 2026 09:23:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 01/13] drm/meson: dw-hdmi: Report connector status based
 on HPD bit
To: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20260518194744.2483580-1-jonas@kwiboo.se>
 <20260518194744.2483580-2-jonas@kwiboo.se>
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
In-Reply-To: <20260518194744.2483580-2-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_002319_158855_A460CA74 
X-CRM114-Status: GOOD (  18.84  )
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

On 5/18/26 21:47, Jonas Karlman wrote:
> G12A added support for RX-SENSE, status for both HPD and RX-SENSE is
> reported in the TOP_STAT0 register.
> 
> Limit read_hpd() phy ops to only report connected status based on the
> HPD status bit in TOP_STAT0, to help ensure that EDID can be read from
> the sink in the connector detect() func.
> 
> Fixes: 3b7c1237a72a ("drm/meson: Add G12A support for the DW-HDMI Glue")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 ++++--
>   drivers/gpu/drm/meson/meson_dw_hdmi.h | 3 +++
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 2a8756da569b..993f6d5d4b29 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -457,9 +457,11 @@ static enum drm_connector_status dw_hdmi_read_hpd(struct dw_hdmi *hdmi,
>   			     void *data)
>   {
>   	struct meson_dw_hdmi *dw_hdmi = (struct meson_dw_hdmi *)data;
> +	unsigned int stat;
>   
> -	return !!dw_hdmi->data->top_read(dw_hdmi, HDMITX_TOP_STAT0) ?
> -		connector_status_connected : connector_status_disconnected;
> +	stat = dw_hdmi->data->top_read(dw_hdmi, HDMITX_TOP_STAT0);
> +	return stat & HDMITX_TOP_STAT0_HPD ? connector_status_connected :
> +					     connector_status_disconnected;
>   }
>   
>   static void dw_hdmi_setup_hpd(struct dw_hdmi *hdmi,
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.h b/drivers/gpu/drm/meson/meson_dw_hdmi.h
> index 08e1c14e4ea0..cb4616daf667 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.h
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.h
> @@ -157,4 +157,7 @@
>    */
>   #define HDMITX_TOP_STAT0                        (0x00E)
>   
> +#define HDMITX_TOP_STAT0_HPD		BIT(0)
> +#define HDMITX_TOP_STAT0_RXSENSE	BIT(1)
> +
>   #endif /* __MESON_DW_HDMI_H */

Thanks, pretty sure the RXSENSE needs some setup in the PHY to work
and Amlogic never enabled it, but this version is clearly better.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

