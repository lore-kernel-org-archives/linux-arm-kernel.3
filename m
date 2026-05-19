Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6374ECD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 07:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHs1pX0u3NNghxESRV2f8uVEQJJT3wKuX92QnXmS80Q=; b=XGHcnhqeRyR4+9h3WH0yjJDhbK
	j4lHpvf5S1Q8r9s61ha+65PBcn3Pp62HyF0He4YBnAFmIy5B26zmV9dnciL2WUSHmaL9RnWlDnvmq
	PNIuouVZiJ38lzruVYpk+YU0g8NuUJ54yxZDd1w+y/VHoIl4Sr9XhocQx382D7noVMWMC7KBj935+
	p3jxY8saAPHJoSdZKq1oWTtwij8vPphY95Jz6l6JHxyH7LiiZGbkxThohZ3Om89DcFinC5IB/9paD
	Xjj30MZtHZXbpCsapP87Dd8XhyW7+qqEf3rldSs03Nqeagl6JEn89WN3y9N+RJkVX8DnMRvdbDmJk
	2LhVbf3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEuT-00000000VEo-3zf8;
	Tue, 19 May 2026 07:30:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEuP-00000000VCX-1WcK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 07:30:36 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso25085265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 00:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779175831; x=1779780631; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHs1pX0u3NNghxESRV2f8uVEQJJT3wKuX92QnXmS80Q=;
        b=dhKhJEFgaBPQsYqwdp97QuPM+oEEp82W/GcpnGbP9Sl2JeheXYO7S9bdnwINtlkMjq
         HAElSxBPwn5A7NLElvTxC4cY6PmlvylJzn/dFJRiWCcrKvYZ9w5SS0tsHcawhYPJSSdw
         a7JIJErOk4ta0xWBVpcRuXSbN7D0sY9kHtEaK6Jgtp6izg9yz5Mx4fv7FhIXKi7EmeU8
         JnIzozaAqgvLYctBtxxwQWadxdqkFjTMVxAl9uZ1eRFJLwFpeQwRDLN/Gv9Elt+L/0Fs
         gsq8FqrVD+BaSA4x1CUOwKUkXJayannGxIlO7d7pIPzv5zPfJvzoJ7Srhzma3nosZFMi
         d0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175831; x=1779780631;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHs1pX0u3NNghxESRV2f8uVEQJJT3wKuX92QnXmS80Q=;
        b=ohHPf/fV+AtmwcaLym/BowX5NXuYczhJsO1rGRtvDYTTh95KEHQ3GxNZAWBTVJheoD
         5WbTpgvb69iCVzcqjMEAgv9p8AiGv1+aolh/ofcK0c3Xnie4W1HA5SWs9HMaoAYoqL46
         Uu9yBn6GJlR7pxMINQ2lOxDXAStJFJ+PAtZ+JiwEP6VtVj6l02mSzZlUcXNK3iIulVdD
         A4DtHkb1ayXk80IadY/sV/zPumK8vqKtPCwj4CJdBhashBSZGw6sKLPAzZf/OZ1GLRC5
         B/YyprRGZwsULiMYcYlr4xq6yL2ZMIAyG74wq77eoPZvZriIyPnv7eyN058k96CPJs/N
         lQrA==
X-Forwarded-Encrypted: i=1; AFNElJ+C5BUbf8WsBEzTm4EWhymUCsdTdWXwHQhwPHKUQkZVIPj+Zcif/BkNlartJYsE4jfiRjy0SG9O4KIw4JC5JgG3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtu4U0GJ4CaOzdVxztfB0BLHXksAYG3WG7BFsaDZnU4BSrjU6h
	zYbbVbZ6jrmbMRATDqlE7cGwqBihGJFWivjmHRrIkcXwjY18g0MVPGVPLnJbX8G/hdc=
X-Gm-Gg: Acq92OHoPKyQaBvkngM/XkBHDBnSiouqiqhiekO56Vhpv/qXyOydD46/knU4rmYapkk
	Ck5ushEFGs1YKDtQrdFrRpm3UokANZmSo+tYBcUX3rOWIq2Ai2gL47pEoXboOg+jxu3HGsApplJ
	2reQPuHEYXTU45o373QQ+o0B5du2zRO3Gx5SOMpaMD4NXxptqGloDyLPcZbU3Nm18ymNQajMI8x
	VP/3JxifJBpfcmQQTneQYpPpaqel78Q4eDFyUGnahWsN7qMPioPgrGG1b781LonFlUEoEqE3yxZ
	odLZZUmZbPbWIEofvkNkCjrHAxkLfzEwGvrIpEyRlSsrfxH0oGd6rmkIaoE29UTycgbCFPTEIse
	AFxYTW6N7aIaunglIpO1ixiDN7WMe0cdrnn4u5qJbFJ2clTeBxr2Y9gLSVeozXhmxfoZE0V7Zbi
	4hWHeayA7hns0L+++F0Si67Fp+kAPvcjWDdNbiKu0JrFbJGBbbPl4xSmcKYf8NGKGARxA0nSvcp
	bf+cKbITQ8jvU4=
X-Received: by 2002:a05:600c:350b:b0:48a:58ae:9938 with SMTP id 5b1f17b1804b1-48ff3346102mr208556935e9.19.1779175831272;
        Tue, 19 May 2026 00:30:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf0fb46sm100860345e9.11.2026.05.19.00.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:30:30 -0700 (PDT)
Message-ID: <78f3211e-cdb8-4f76-a311-d4d66fc68d3d@linaro.org>
Date: Tue, 19 May 2026 09:30:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 06/13] drm/meson: encoder_hdmi: Use bridge connector CEC
 notifier
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
 <20260518194744.2483580-7-jonas@kwiboo.se>
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
In-Reply-To: <20260518194744.2483580-7-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_003034_260866_9938EAA6 
X-CRM114-Status: GOOD (  22.71  )
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
> The dw-hdmi bridge detect() func now updates EDID and CEC phys addr for
> the connector and any registered generic CEC notifier.
> 
> Replace the open-coded CEC notifier handling with use of the bridge CEC
> notifier op.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>   drivers/gpu/drm/meson/Kconfig              |  1 +
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 85 +++++-----------------
>   2 files changed, 19 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
> index 417f79829cf8..0dc5ca21e4fc 100644
> --- a/drivers/gpu/drm/meson/Kconfig
> +++ b/drivers/gpu/drm/meson/Kconfig
> @@ -13,6 +13,7 @@ config DRM_MESON
>   	select REGMAP_MMIO
>   	select MESON_CANVAS
>   	select CEC_CORE if CEC_NOTIFIER
> +	select DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER if CEC_NOTIFIER
>   
>   config DRM_MESON_DW_HDMI
>   	tristate "HDMI Synopsys Controller support for Amlogic Meson Display"
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 1b9a1d9ed3d3..45104ef35344 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -16,8 +16,6 @@
>   #include <linux/regulator/consumer.h>
>   #include <linux/reset.h>
>   
> -#include <media/cec-notifier.h>
> -
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_bridge.h>
>   #include <drm/drm_bridge_connector.h>
> @@ -41,7 +39,6 @@ struct meson_encoder_hdmi {
>   	struct drm_connector *connector;
>   	struct meson_drm *priv;
>   	unsigned long output_bus_fmt;
> -	struct cec_notifier *cec_notifier;
>   };
>   
>   #define bridge_to_meson_encoder_hdmi(x) \
> @@ -57,14 +54,6 @@ static int meson_encoder_hdmi_attach(struct drm_bridge *bridge,
>   				 &encoder_hdmi->bridge, flags);
>   }
>   
> -static void meson_encoder_hdmi_detach(struct drm_bridge *bridge)
> -{
> -	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
> -
> -	cec_notifier_conn_unregister(encoder_hdmi->cec_notifier);
> -	encoder_hdmi->cec_notifier = NULL;
> -}
> -
>   static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>   					const struct drm_display_mode *mode)
>   {
> @@ -321,27 +310,9 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
>   	return 0;
>   }
>   
> -static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
> -					  struct drm_connector *connector,
> -					  enum drm_connector_status status)
> -{
> -	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
> -
> -	if (!encoder_hdmi->cec_notifier)
> -		return;
> -
> -	if (status == connector_status_connected)
> -		cec_notifier_set_phys_addr(encoder_hdmi->cec_notifier,
> -					   connector->display_info.source_physical_address);
> -	else
> -		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
> -}
> -
>   static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
>   	.attach = meson_encoder_hdmi_attach,
> -	.detach = meson_encoder_hdmi_detach,
>   	.mode_valid = meson_encoder_hdmi_mode_valid,
> -	.hpd_notify = meson_encoder_hdmi_hpd_notify,
>   	.atomic_enable = meson_encoder_hdmi_atomic_enable,
>   	.atomic_disable = meson_encoder_hdmi_atomic_disable,
>   	.atomic_get_input_bus_fmts = meson_encoder_hdmi_get_inp_bus_fmts,
> @@ -374,9 +345,9 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
>   
>   	meson_encoder_hdmi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
>   	if (!meson_encoder_hdmi->bridge.next_bridge) {
> -		ret = dev_err_probe(priv->dev, -EPROBE_DEFER,
> -				    "Failed to find HDMI transceiver bridge\n");
> -		goto err_put_node;
> +		of_node_put(remote);
> +		return dev_err_probe(priv->dev, -EPROBE_DEFER,
> +				     "Failed to find HDMI transceiver bridge\n");
>   	}
>   
>   	/* HDMI Encoder Bridge */
> @@ -384,6 +355,13 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
>   	meson_encoder_hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>   	meson_encoder_hdmi->bridge.interlace_allowed = true;
>   
> +	pdev = of_find_device_by_node(remote);
> +	of_node_put(remote);
> +	if (pdev) {
> +		meson_encoder_hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER;
> +		meson_encoder_hdmi->bridge.hdmi_cec_dev = &pdev->dev;
> +	}
> +
>   	drm_bridge_add(&meson_encoder_hdmi->bridge);
>   
>   	meson_encoder_hdmi->priv = priv;
> @@ -391,30 +369,24 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
>   	/* Encoder */
>   	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
>   				      DRM_MODE_ENCODER_TMDS);
> -	if (ret) {
> -		dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
> -		goto err_put_node;
> -	}
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
>   
>   	meson_encoder_hdmi->encoder.possible_crtcs = BIT(0);
>   
>   	/* Attach HDMI Encoder Bridge to Encoder */
>   	ret = drm_bridge_attach(&meson_encoder_hdmi->encoder, &meson_encoder_hdmi->bridge, NULL,
>   				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> -	if (ret) {
> -		dev_err_probe(priv->dev, ret, "Failed to attach bridge\n");
> -		goto err_put_node;
> -	}
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret, "Failed to attach bridge\n");
>   
>   	/* Initialize & attach Bridge Connector */
>   	meson_encoder_hdmi->connector = drm_bridge_connector_init(priv->drm,
>   							&meson_encoder_hdmi->encoder);
> -	if (IS_ERR(meson_encoder_hdmi->connector)) {
> -		ret = dev_err_probe(priv->dev,
> -				    PTR_ERR(meson_encoder_hdmi->connector),
> -				    "Unable to create HDMI bridge connector\n");
> -		goto err_put_node;
> -	}
> +	if (IS_ERR(meson_encoder_hdmi->connector))
> +		return dev_err_probe(priv->dev,
> +				     PTR_ERR(meson_encoder_hdmi->connector),
> +				     "Unable to create HDMI bridge connector\n");
>   
>   	/*
>   	 * We should have now in place:
> @@ -437,32 +409,11 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
>   	/* Handle this here until handled by drm_bridge_connector_init() */
>   	meson_encoder_hdmi->connector->ycbcr_420_allowed = true;
>   
> -	pdev = of_find_device_by_node(remote);
> -	of_node_put(remote);
> -	if (pdev) {
> -		struct cec_connector_info conn_info;
> -		struct cec_notifier *notifier;
> -
> -		cec_fill_conn_info_from_drm(&conn_info, meson_encoder_hdmi->connector);
> -
> -		notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
> -		if (!notifier) {
> -			put_device(&pdev->dev);
> -			return -ENOMEM;
> -		}
> -
> -		meson_encoder_hdmi->cec_notifier = notifier;
> -	}
> -
>   	priv->encoders[MESON_ENC_HDMI] = meson_encoder_hdmi;
>   
>   	dev_dbg(priv->dev, "HDMI encoder initialized\n");
>   
>   	return 0;
> -
> -err_put_node:
> -	of_node_put(remote);
> -	return ret;
>   }
>   
>   void meson_encoder_hdmi_remove(struct meson_drm *priv)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

