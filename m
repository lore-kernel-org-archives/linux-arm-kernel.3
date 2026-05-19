Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F11CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 07:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CptfMWX/OnKpQAZK1ljSyYDr+otcGVWKuHyIusA7+I4=; b=XNr7JoihOhnXK6Zp2V7O3+3+23
	mlNjnWm1l4vV/oHaYh4CW26ntKbNauNFzV1HdZhSHys/HiEqbJXYEwCfWzggkOH0XIvUafKXxUuFZ
	/R/gR5aPjyvGu9vD3ztkpnjUIdvKgQv/HufTGwmzfRpkq1Bx67O1XT0A98nDf2V3VEuuWH5wJSJHO
	lKVe1Y7adH+uUM1vf85M/yqzvgnln3urGYHm7Rf6Z2P2K3fhvnjYQiT9wQ5eACFXNau6El01llwMX
	BvfDCwQxDTMuT7vnyCQFiXroPpAtLRXZcKioocXWPrra7eAyvyd+Bwcf6StsyNC6d0dIqTeG0m+af
	S+mP+SpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPExC-00000000Vx4-44K9;
	Tue, 19 May 2026 07:33:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPExB-00000000Vvz-0g4d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 07:33:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48909558b3aso33545255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 00:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779176003; x=1779780803; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CptfMWX/OnKpQAZK1ljSyYDr+otcGVWKuHyIusA7+I4=;
        b=UqeDWTtyLT88yGGCyyIWWibMKHBrzrXzm/9kwhHdlIw27bVbt1JnVJNrOpGGiGHIQR
         HAfw1BEvF6SR85W+wJMDQzqi5yza7QFB0oBP3q5q9r3eYQl4NkRAWV1gMEFYp26xseUs
         VAzEkRZMv6JukWzFhkRuPsosoJISep4e0+hIdxcAI4tdkwW6kmIkXHiugzYTf0ZWVpPX
         5xEJJfHuk+bLOIt5P9LyW+S057Wdoy6elseaS+tvLmNv816s31toSbVX/oTYlcvcNKPq
         zYE00zElTGCU8dPNi8Q4b+vBpjIqwoXTfkvmHfU2B5yMdYjyIvjEVgIZFXKjVJHS8cAC
         GV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779176003; x=1779780803;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CptfMWX/OnKpQAZK1ljSyYDr+otcGVWKuHyIusA7+I4=;
        b=Rn0MoyQPUXko/IiOeeU8cAl7uxf6tgFQaFSjr7Zztqx1mWX4iZqo3pEtR9eKEhvPUc
         aQHmRH6mpRrhvIbPwoIf+bnc9kbXCwX4lZkLcaLvsfAGGR8yu9fbFSTzhzZAwhH0hOLE
         rC7dmdgxT1DSwIkn2z77aavvIW8ioeyGs6nKB6zD9TUxO0C4jC8WagipWq94ALavcPqj
         PTFdo4xv70CpVDvRUg0opJjmv/2NQlrz3JfNrxKCo9jcr3fj9reKYlo/hp07gNLdiYEL
         GwIT5WJid5/4uzwTBd6AnpRBHbUyWwTvewVlQ+F7q6ptHJoceC4LNY1oRw/UuJjDU6jC
         ZoOg==
X-Forwarded-Encrypted: i=1; AFNElJ++wC5U5GYNk2Ej7zhanX6kIRi9sIbqwDPwf4RPb1kEJvYMHzjsWrbiN86uRXFZNVXY8uwS3GQ+exfVbYXCDOSY@lists.infradead.org
X-Gm-Message-State: AOJu0YzGtBHsd+4wvSWLn6R43X/Xb7bt/x+l3jG6JM/boLgEKpgI3+Kj
	nEdNMwvxuPMg7jPigzqS4sRBMA3VjznagDe8Gt6dWV6VPzhY2/Tz0eRzn9IkemA2MAo=
X-Gm-Gg: Acq92OGRWkmHG+BWG/DDnIz4pSW/8yguDcsM3FTuprkT///+cXEDRCBg54BZjH1gPbs
	0ST2RsgNkiZkituHslAXb/yTmbXYifXbr6XdawYFcE41dRV/XELrtRMVPkfjeFp+mLG1xeQC0ss
	Smr1Yih23/pZ5DFZ24HHDw6PJ2M45HdYVr9Oya14y06ixyudaHENKdYeJq49B4XBcceZ6ob3oVh
	zt+VclYGQD1RohwGZkmLXXkUWGrrIhs10zXPfPd1GXAagYDBwewB6FiGT/i6JWgQicRUjdd3v8h
	aY2s+iTl04T9jwFieWTNN1DwBn/UzxxnAz2yVKfy1/yW+mPUqs5WikU0J2PZXPQaAglxum8U/qJ
	fbqg3zAI2bntozp5ffwpV+tpUhQx07ujHBjp6bLDiZAqRbRStpkworMa2ugRcndEcEL+EifxlJc
	IgtNApzVRvcM65KbNCGpgyYFO/HGt3jMtu/GiiM+Ola4abcFp+hiziIWpJP5vUT72980W+vvyjY
	BLH
X-Received: by 2002:a05:600c:a406:b0:48a:9540:1a3a with SMTP id 5b1f17b1804b1-48fe60e56abmr233108995e9.8.1779176003502;
        Tue, 19 May 2026 00:33:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537ccf5sm301918365e9.14.2026.05.19.00.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:33:23 -0700 (PDT)
Message-ID: <59760925-a19d-460e-afc9-015dd210f193@linaro.org>
Date: Tue, 19 May 2026 09:33:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 09/13] drm/meson: dw-hdmi: Use devm_clk_get_enabled()
 helper
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
 <20260518194744.2483580-10-jonas@kwiboo.se>
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
In-Reply-To: <20260518194744.2483580-10-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_003325_230723_E44E693D 
X-CRM114-Status: GOOD (  17.96  )
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
> Change to use the devm_clk_get_enabled() helper instead of using an
> open-coded variant.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 48 +++++++++------------------
>   1 file changed, 16 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index fcd2426af9fc..d0cf2042d41c 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -634,29 +634,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>   
>   }
>   
> -static void meson_disable_clk(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
> -static int meson_enable_clk(struct device *dev, char *name)
> -{
> -	struct clk *clk;
> -	int ret;
> -
> -	clk = devm_clk_get(dev, name);
> -	if (IS_ERR(clk)) {
> -		dev_err(dev, "Unable to get %s pclk\n", name);
> -		return PTR_ERR(clk);
> -	}
> -
> -	ret = clk_prepare_enable(clk);
> -	if (!ret)
> -		ret = devm_add_action_or_reset(dev, meson_disable_clk, clk);
> -
> -	return ret;
> -}
> -
>   static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   				void *data)
>   {
> @@ -666,6 +643,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	struct drm_device *drm = data;
>   	struct meson_drm *priv = drm->dev_private;
>   	struct dw_hdmi_plat_data *dw_plat_data;
> +	struct clk *clk;
>   	int irq;
>   	int ret;
>   
> @@ -716,17 +694,23 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	if (IS_ERR(meson_dw_hdmi->hdmitx))
>   		return PTR_ERR(meson_dw_hdmi->hdmitx);
>   
> -	ret = meson_enable_clk(dev, "isfr");
> -	if (ret)
> -		return ret;
> +	clk = devm_clk_get_enabled(dev, "isfr");
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "Unable to get isfr pclk\n");
> +		return PTR_ERR(clk);
> +	}
>   
> -	ret = meson_enable_clk(dev, "iahb");
> -	if (ret)
> -		return ret;
> +	clk = devm_clk_get_enabled(dev, "iahb");
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "Unable to get iahb pclk\n");
> +		return PTR_ERR(clk);
> +	}
>   
> -	ret = meson_enable_clk(dev, "venci");
> -	if (ret)
> -		return ret;
> +	clk = devm_clk_get_enabled(dev, "venci");
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "Unable to get venci pclk\n");
> +		return PTR_ERR(clk);
> +	}
>   
>   	dw_plat_data->regm = devm_regmap_init(dev, NULL, meson_dw_hdmi,
>   					      &meson_dw_hdmi_regmap_config);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

