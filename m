Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B58FCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 07:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sARt/XEtoBYHi4fyCJzLGB+SNU2tjajyLFXV5tLDUL0=; b=HBTxB1zbMFHfBnOfUi0kMw5xCw
	Kf2pOA2jVpAZwyp/M6nbAF9LfrLR9/dhzMnKz4tgH9iTFBNwo17tz5zh3uZXevy/WENp4vIW2DWSp
	KdqLyCLV+4+x/dPJ0AEm/3OmkxXaRJtBH0UQiN4ODLQmeNktLueVVwxUEy2sXPGRnDxWc0UZ7NubN
	kIq54f88Cgk5p3IBcuufOC+bMV/9SPCCnzhfJeivgJlFQeZFPVj93Kfntcl+ihCr3QH1Z9gj6Gk+3
	KHFNyNUHzpdRaOYa+HZj06tV/uqO1e4uORgQx/QgFzs2UhwRMcST/zODfnJYjT/UzWGIXiLRiwI3P
	tic3/Thw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEnm-00000000Typ-0fpn;
	Tue, 19 May 2026 07:23:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEni-00000000TvX-3imN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 07:23:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so1816418f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 00:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779175417; x=1779780217; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sARt/XEtoBYHi4fyCJzLGB+SNU2tjajyLFXV5tLDUL0=;
        b=pCYzEu4zEE11B5mER+krfy1JrG8s5xbgYbvnk6zXbwQBgGo4l3NYzMU53BjYPcD/SK
         3ZvvZI0ufYQ4bkZEGcImat30P7t6/rS5bNjxG90QbwQr9Q7Madd+HfRgRW8SnmPnh5Kd
         fBEg+v6fELAbohQYkdJ3fTbkQagRYW5HDu3BNK1hyj60QZDEIuJvOX90skd0Vp/K1Jyl
         O3b2k3gjPyJJEU4Ze6aZ8dS55C32aiUJXhS1gVP9Z8y7gQxFjotd9cBI9QCNInwj8vkB
         bIYqpOymcuJvH7+lzf7QaY4mFN7V5u8DPWmcbOYhmoACfiIGZWaWKbABuGnWIkMCW8dW
         YxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175417; x=1779780217;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sARt/XEtoBYHi4fyCJzLGB+SNU2tjajyLFXV5tLDUL0=;
        b=dR0tCJ7wPfbOUp06FTSwaTtP0xcH7GoSdwQ0Inh5gRykjxruBCG28aeYwqIWfmJouX
         Y2IwvP1PwR3vKC0Ah41PiY4DueGWNIDfUmXbNb0EmX5cICN20kxnMOxgrKtRYOnHYk3x
         7Ma6620x4rIl0dohEbYZQyZr27IgoyBtzhujEEymxyhrHBH7aqGCPvhSnO1Z7CgdrqNs
         hNqEXatC3+KJt0MGBO5vuwCkRxKUT6AbyzaJzCPJdbG0fE2sA5mkrpHBWPxfs+wvnTFp
         QVlD//uN43r4S6vfHElYxTA9nRqhNmyFpHpqCvJGvmuB+/XWgBip1OMrBv7uyvqt5Nsk
         KFyQ==
X-Forwarded-Encrypted: i=1; AFNElJ91Ui4mjZbL0N8uXmoLBC5YOM7p5E0n7DKB4Tf7I1rK2mxdPJxYN1TL3iFkS6/2ypzRB6HcRtYO+I/r8Mc8qHgY@lists.infradead.org
X-Gm-Message-State: AOJu0YyClWJc9/0swOiNTmGQhABOK6m+nmGpUjYqTL9QgvgMA7zRVXps
	J3hpQhEaZHukCgWtTTYKokz+BZi+ChRtHAAsB1Lp9upAThIduaZ50Ba4JXSsfTpzmBM=
X-Gm-Gg: Acq92OGUX3DbiCqWYuV/gawFZR04eYGL74UgjYT21NzX9uMRIt2xeGPmI7JvhT1fYAC
	D0e4UG+fW2UkNVKK7RLqOrBQ/Jl+JdhNAt9Gnt74oZK2L2+dTi4MTAqJT50b4cy9vQSi8uYW/QK
	vDN0jc1weAYO6vCF3p3HaIe1CA5funskVfTf0Oz8edrjCDZt/MbMZTkl/N4ZePPIypwd0cXDAbL
	PPhbqf6Yeyit05TwHVIp+oQPIDKivp9H3paZaGi3NMnSRp7AWA6WFxJb1IYjKRHL6ppldhYYrCm
	ilFcN0p4msCo/JfWmKdUGSJ/iyR/gF1OvRNv1hNBfWXH2UGuxTn0KKlHObNnmZ6M/r6hdXlystC
	JWvM/dsXCGcjdv7oSOn7ymwWNCIn5HeNWbXTviTWUXdQKSaZ2crlLeU7vjHlW6antgWvMRBw/+5
	+E9EInLV5+bwSQ5fCRBooYlwo4+LrzqbEZXPUn13cKV6ic3gEO8MFb9UM3hkOJBLegg+l6sXXDC
	/I9o0FM0yFLWqY=
X-Received: by 2002:a05:6000:40df:b0:45d:b14b:2409 with SMTP id ffacd0b85a97d-45e5c35dd7bmr29424483f8f.2.1779175416876;
        Tue, 19 May 2026 00:23:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a5653sm43847302f8f.35.2026.05.19.00.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:23:36 -0700 (PDT)
Message-ID: <6db86d54-b463-49bb-ae7f-35c694e624bc@linaro.org>
Date: Tue, 19 May 2026 09:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 02/13] drm/meson: dw-hdmi: Protect from possible NULL
 pointer dereference
To: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20260518194744.2483580-1-jonas@kwiboo.se>
 <20260518194744.2483580-3-jonas@kwiboo.se>
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
In-Reply-To: <20260518194744.2483580-3-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_002338_959392_81AA3700 
X-CRM114-Status: GOOD (  20.33  )
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
> The IRQ handler can be called at any time after the call to
> devm_request_threaded_irq() completes, even before dw_hdmi->bridge has
> been assigned later in meson_dw_hdmi_bind().
> 
> Protect from a possible NULL pointer dereference in IRQ handler by only
> calling drm_helper_hpd_irq_event() when bridge has been assigned.
> 
> Fixes: e67f6037ae1b ("drm/meson: split out encoder from meson_dw_hdmi")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> I only observed this NULL pointer dereference one time, without being
> able to reliably re-create a similar timing scenario. I still think this
> is an issue that possible could happen and likely should be fixed.
> 
> Note that patches later in this series will fully replace this change.
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 993f6d5d4b29..eafe7daf6ff1 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -520,7 +520,8 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
>   	u32 stat = dw_hdmi->irq_stat;
>   
>   	/* HPD Events */
> -	if (stat & (HDMITX_TOP_INTR_HPD_RISE | HDMITX_TOP_INTR_HPD_FALL)) {
> +	if (stat & (HDMITX_TOP_INTR_HPD_RISE | HDMITX_TOP_INTR_HPD_FALL) &&
> +	    dw_hdmi->bridge) {
>   		bool hpd_connected = false;
>   
>   		if (stat & HDMITX_TOP_INTR_HPD_RISE)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

