Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33040CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 07:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkpJii8tv30gQeyVix9/XICxyBov61uU4hi0wKikcJ8=; b=Rsr7Gajuik3ukE1nLOgdOF8fYK
	c7F2FjqOKMZg3VH/agOpd0p4iDgOv/n0/XVqMQMuy9cvzvDbvANvhpDjxJlKQJzSz2MlGfaVXho9e
	Cefjkr+Y9dRKKf1BLoIniRgJPphrGpGIP+2ZW6fS3VHs8EBNFOVD5EgpxSQtIrdTU9LrYUcCuxH+p
	LrmhScikvoMddKK+5T0/b0H+lb7VGlb3VpLJNdOU0KFoPkfP1T5QcBMeFFmZe8y4OrYIH7tWCjM+1
	W2XlEsKpXjVMEL7wWN/jgPYHLpLu+8GZvRd7DISYG8Vm+knk3OUfsS6tRlRYQNi9FwJSGe9/N1Z5+
	ZDPPPZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEyN-00000000WKn-0cNj;
	Tue, 19 May 2026 07:34:39 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEyK-00000000WIC-150q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 07:34:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso31209445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 00:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779176074; x=1779780874; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkpJii8tv30gQeyVix9/XICxyBov61uU4hi0wKikcJ8=;
        b=UH1deV97oO8vSfI4G4i3T7MOxqN5IyJsNfw+2cpVNZy5EKMKPybO4OBmOjY4Ap67UI
         GqzvJPBrJuv8mYMeCah4htakM6IsXvMxzGR33VHF58Co5gBSea1XPvmNPpRnn4LcljH8
         kBhaFG3XzSn16WAyq1M+sX9NwLOyKYKo2q85lsaviFgyag/rb/o7hubJe7hEtTCa1t1+
         DKlX8Ly3SR4xeFIxUMaSgM/GC+XU5O+K/8B/nT42iuZBo3zujjcaKQyS0F6A9DiFO2x2
         jWxuLko+G0/yoU73RmRMIOPwVk+747/c3Dmcwt+ZnYI149qPEJP3FquS33DAzq8U/Am8
         o49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779176074; x=1779780874;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkpJii8tv30gQeyVix9/XICxyBov61uU4hi0wKikcJ8=;
        b=RPQ3yxbEwRG7pUzqe4cFrvyFrtaPMFs64cGN7B23xqSA8cWRGa8oxAPFJlAu2i47SS
         +6ndW00Jj5sxrP9Rm5DvCpBzvAbdcAhZYqkwxmb4waoQU7Zsv5OW1aeLe0rqB+FMEPR/
         nq4K2pMVb6S63DHtHKRya92mcBrCB2W8ENIiFEMW7VzU1vnIkE2PRGIpRnJ3IzbX846H
         DkfFv0mWP1Eg+ncrihiCACvQsEkMVgmSHE7FTLsqdHzL+AhAcZFVhtnlmHCePNf+koST
         zjV/jID6xZll6ZrfZvAegPCV6zB5d4gYyQf79iD04/kuL+ZcpJeZXVFgMWS+MEG+f9mu
         Ijug==
X-Forwarded-Encrypted: i=1; AFNElJ9dKyUVv2VE3Oq/Q6VGgT6rKPNFGMAYl/weAls2KhiEdQajEBoYNkXFtKoSPnaiUXAx1FxSFGUo/anuR9DXRDr5@lists.infradead.org
X-Gm-Message-State: AOJu0YyX+jB+LHwGF561nvA62yRNBtdXjxvC40p9DF4z609hnb4InBOY
	8gI+/weDuaFrOXbf6As4b4CFd1HnGg93cEddT45D+oYKGbYqICP4o2zGp1dkTnNl7Mg=
X-Gm-Gg: Acq92OEbxYTRQgbmkEGas+lFbY1+4op43fNFC6XdK6UvDxoQH8oK8KTshx6qBbwYq40
	GqJa2uHV4mvgUl9wunUjN8jUu2C/Z2vfCs2ikipxyOOrq/3JwkuIQDXYbtZVqV85UGoZYPdd4ZV
	ZkZUZtRr1bT1AVP/CdIz86rjl/s97z+sgK8eqVJau/YHWc9Pb/1B3HZwjD9Un1eouMl6KAPQSpx
	rel8LWs1kTOX6B+6r9E/AylOw4kREwv6eTzkk2UT2XksbsDHrXf0Mqc8hLBiIImzYxfi9q9fgS4
	8j4VsTrhvb98BUmejQDB9iJOEfrfZBRns8Xgeb6WrkRHxm87pN2CaI+Z7FGWftZsDlkaPeEBI5d
	7JXUkC+GeOu33H7t9UHldIcy9+u5OT8r+rYkNFqWoBHE2BkZxb/xAIvANT3rUJUnm2yYVRayzlw
	2efd0WOIsU4U5iuJdirKv/X+PHemQf/GsFcPuhjiGjACgRQQuIcjC//W8OkaHcwhJCx2nO/AB+x
	hw/thK/25fvlAs=
X-Received: by 2002:a05:600c:4692:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-48fe632661bmr293018735e9.19.1779176074203;
        Tue, 19 May 2026 00:34:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a17a22sm43795418f8f.22.2026.05.19.00.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:34:33 -0700 (PDT)
Message-ID: <c5b417b6-1430-4a4e-a0ea-207221a4d344@linaro.org>
Date: Tue, 19 May 2026 09:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 10/13] drm/meson: dw-hdmi: Use dev_err_probe() to report
 errors
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
 <20260518194744.2483580-11-jonas@kwiboo.se>
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
In-Reply-To: <20260518194744.2483580-11-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_003436_343113_57F54E36 
X-CRM114-Status: GOOD (  16.10  )
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
> Change to use dev_err_probe() to report bind() errors consistently.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 65 +++++++++++++--------------
>   1 file changed, 30 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index d0cf2042d41c..1dd59196ff7f 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -650,10 +650,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	DRM_DEBUG_DRIVER("\n");
>   
>   	match = of_device_get_match_data(dev);
> -	if (!match) {
> -		dev_err(dev, "failed to get match data\n");
> -		return -ENODEV;
> -	}
> +	if (!match)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Failed to get match data\n");
>   
>   	meson_dw_hdmi = devm_kzalloc(dev, sizeof(*meson_dw_hdmi),
>   				     GFP_KERNEL);
> @@ -667,50 +666,45 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   
>   	ret = devm_regulator_get_enable_optional(dev, "hdmi");
>   	if (ret < 0 && ret != -ENODEV)
> -		return ret;
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get/enable hdmi regulator\n");
>   
>   	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
>   						"hdmitx_apb");
> -	if (IS_ERR(meson_dw_hdmi->hdmitx_apb)) {
> -		dev_err(dev, "Failed to get hdmitx_apb reset\n");
> -		return PTR_ERR(meson_dw_hdmi->hdmitx_apb);
> -	}
> +	if (IS_ERR(meson_dw_hdmi->hdmitx_apb))
> +		return dev_err_probe(dev, PTR_ERR(meson_dw_hdmi->hdmitx_apb),
> +				     "Failed to get hdmitx_apb reset\n");
>   
>   	meson_dw_hdmi->hdmitx_ctrl = devm_reset_control_get_exclusive(dev,
>   						"hdmitx");
> -	if (IS_ERR(meson_dw_hdmi->hdmitx_ctrl)) {
> -		dev_err(dev, "Failed to get hdmitx reset\n");
> -		return PTR_ERR(meson_dw_hdmi->hdmitx_ctrl);
> -	}
> +	if (IS_ERR(meson_dw_hdmi->hdmitx_ctrl))
> +		return dev_err_probe(dev, PTR_ERR(meson_dw_hdmi->hdmitx_ctrl),
> +				     "Failed to get hdmitx reset\n");
>   
>   	meson_dw_hdmi->hdmitx_phy = devm_reset_control_get_exclusive(dev,
>   						"hdmitx_phy");
> -	if (IS_ERR(meson_dw_hdmi->hdmitx_phy)) {
> -		dev_err(dev, "Failed to get hdmitx_phy reset\n");
> -		return PTR_ERR(meson_dw_hdmi->hdmitx_phy);
> -	}
> +	if (IS_ERR(meson_dw_hdmi->hdmitx_phy))
> +		return dev_err_probe(dev, PTR_ERR(meson_dw_hdmi->hdmitx_phy),
> +				     "Failed to get hdmitx_phy reset\n");
>   
>   	meson_dw_hdmi->hdmitx = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(meson_dw_hdmi->hdmitx))
>   		return PTR_ERR(meson_dw_hdmi->hdmitx);
>   
>   	clk = devm_clk_get_enabled(dev, "isfr");
> -	if (IS_ERR(clk)) {
> -		dev_err(dev, "Unable to get isfr pclk\n");
> -		return PTR_ERR(clk);
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "Failed to get isfr pclk\n");
>   
>   	clk = devm_clk_get_enabled(dev, "iahb");
> -	if (IS_ERR(clk)) {
> -		dev_err(dev, "Unable to get iahb pclk\n");
> -		return PTR_ERR(clk);
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "Failed to get iahb pclk\n");
>   
>   	clk = devm_clk_get_enabled(dev, "venci");
> -	if (IS_ERR(clk)) {
> -		dev_err(dev, "Unable to get venci pclk\n");
> -		return PTR_ERR(clk);
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "Failed to get venci pclk\n");
>   
>   	dw_plat_data->regm = devm_regmap_init(dev, NULL, meson_dw_hdmi,
>   					      &meson_dw_hdmi_regmap_config);
> @@ -724,10 +718,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_top_irq,
>   					dw_hdmi_top_thread_irq, IRQF_SHARED,
>   					"dw_hdmi_top_irq", meson_dw_hdmi);
> -	if (ret) {
> -		dev_err(dev, "Failed to request hdmi top irq\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to request hdmi top irq\n");
>   
>   	meson_dw_hdmi_init(meson_dw_hdmi);
>   
> @@ -752,14 +745,16 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	meson_dw_hdmi->hdmi = dw_hdmi_probe(pdev, &meson_dw_hdmi->dw_plat_data);
>   	if (IS_ERR(meson_dw_hdmi->hdmi)) {
>   		devm_free_irq(dev, irq, meson_dw_hdmi);
> -		return PTR_ERR(meson_dw_hdmi->hdmi);
> +		return dev_err_probe(dev, PTR_ERR(meson_dw_hdmi->hdmi),
> +				     "Failed to probe dw-hdmi bridge\n");
>   	}
>   
>   	meson_dw_hdmi->bridge = of_drm_find_and_get_bridge(dev->of_node);
>   	if (!meson_dw_hdmi->bridge) {
>   		devm_free_irq(dev, irq, meson_dw_hdmi);
>   		dw_hdmi_remove(meson_dw_hdmi->hdmi);
> -		return -ENODEV;
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Failed to find dw-hdmi bridge\n");
>   	}
>   
>   	DRM_DEBUG_DRIVER("HDMI controller initialized\n");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

