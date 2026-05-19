Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CD7CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVQp/cA7Et9VS7l3eduBKFhTtN4ZONdXEaRfRIEiTJc=; b=JnsmNcmICe7sCrmxP1hSEVcGf7
	jfEEo21GmyMmD+V5Wzo94GgvOGolMQibHHW8OVkWN3vERqTIO+cDBP2C8eGmpwULFr7mhD2YIrGqN
	5w+60jk0SMy/ohsbzjCLzSf0j4KHIbNcx1IMpmC/Dn98iBPx7N9NZfim7mb88QTZprn+XjCUhzBoW
	YJ0WCPOMO2MKWCcRbTFa/q87r2RuhQHg6csujt5KS8AG8Md1vZPiXxI6N9Cdi4JJJuAdCYEn4o5G7
	FUWr1lptZRBmWQWnVwTe9QZ9poX+SSfX0fMT8hfQlX3EotmfcncdnlWFcOrqCzUJjHzuNPGl+uP3P
	Wh0Pi2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPM7m-00000001xXd-3XQm;
	Tue, 19 May 2026 15:12:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPM7k-00000001xWr-0Odv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:12:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so30743505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779203565; x=1779808365; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVQp/cA7Et9VS7l3eduBKFhTtN4ZONdXEaRfRIEiTJc=;
        b=taqTbZmv8bkqCFaFBzqumKi8HXFEmxlmWU8HPuJaBjv6xSuDMaSGD2oXQDrrDqz+Kp
         M9RUytOvFWib7VTwBAP2bKgEVmb7fQNOtpelmQWHB1OBFjHKE4uozzZhi+MxV3aVtfjs
         iFtxkWeP7OKeaMvxXGOLVAeyKLpv7zWSDAqFv1HrhpZ6gFkWIhI1EiccG3bA8Pzfe93E
         fsrO8f2oQIerdsH5qihxtaG+/WiHDLEyflYeOo9YxFHwu9Dp77WFsucMYGNJQ2Cc16dU
         1Ga/3Qr+3xYystjlnFvPoV1js1Q8tprIwOW+mZuZ0Wzt/GC0krEX2e8IpM6sWnotz+r3
         5axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203565; x=1779808365;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVQp/cA7Et9VS7l3eduBKFhTtN4ZONdXEaRfRIEiTJc=;
        b=TbmsmiAOvFxXAkcEpgfON6CKsHKWhCrxFbKaju2nN9DccnKgZEZakG6+3cLsmjI3Rr
         WEUy+PmjVJkFyDNvjvKWMq/nYJt+smp8hPe8+mNkDF0ag2UnP1Ejx/G7I5yz/AZpT+92
         /fbIpF80UzqJ5N6ei1nP6TCkzzVZmNMPjFzZclBOfSwFt5z42s0eM2FJo6qJKTEkRnvE
         akS/deNkq8Nn/MT15Eh4CHR/WXXu9TG5anE+ZOLvjBBVeZQeQnEg+n6DIWD9jgCb3PSg
         ZEApeZqrKEfIQ8F13shC4HiOW8rqGiLcS3T8SvYzx+cYSjsbqDm807TcCqrJ5INfJHVY
         AE1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/WpMSQcvGAg51pTYR51YbpectDR0m0Ak5U+HEO1+8qiyi2T+LUrrewCXfL/8FqfMGCct31Xn9qN4mnHo66omUh@lists.infradead.org
X-Gm-Message-State: AOJu0YzbkI70n5FlprY4GNnNbQfDY49Vhd2GUmRzsrf+7Mcq/gwonnC6
	aTjk/LW+RIp6m5u4yxOCQGy4qCDUqCACljWl9ph86XstRtbsVzd77kN/37Z/EhRfM/g=
X-Gm-Gg: Acq92OEWhaENZYrfSUwmttRe5GegKiLmQAJvrFXcIAICdVMNUyGh7YPckbX0FLkmh2H
	ASqpstTGvysnjeFBWGly6I1NgloU6wsZtvtK4215dyW9m2cBM8nxJGG0XDPvqYxzfZfe6D2KXv+
	hQnS9sVBd48muS/C+tCCRKXIZUGfY6nM1mc0MJWu7eMlx4Kr35uKd9pkAV5u/H7fhAxVKkHz4iK
	v5mZwzToDSyNAAHvS9rLAtUvdDAGD0mvRQKw5b+x6n2UFbQodd35V1puboM0l68h95NgJTtvyAB
	egsVcdgN8MlemUhezVcqurcn/82XeITyyo2NQBSO+Br7BKSwckqE6Clx+W+7Y4pPHlS6FfcCI9k
	8nRwSNOhD+gUAX0GLnHqR/hd4o9HMH4/Tjdb2rsyRPRVv8WL2TSK4lup+kyFwor9CqgInNIK38x
	KZjzO/QydtqXv1uUVcwMS6eUcQn/DpMJSe48F8BySADaM8sqKdhSTrbehLGeneoQs/v6DHymz8k
	FK02Kg=
X-Received: by 2002:a05:600c:314f:b0:490:389:7644 with SMTP id 5b1f17b1804b1-49006db5bc0mr175326005e9.17.1779203565446;
        Tue, 19 May 2026 08:12:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:45b7:1191:7413:7781? ([2a01:e0a:106d:1080:45b7:1191:7413:7781])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab7c5sm354389755e9.12.2026.05.19.08.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:12:45 -0700 (PDT)
Message-ID: <2de87295-aa31-404a-8e69-5ee7b14bf8c1@linaro.org>
Date: Tue, 19 May 2026 17:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 31/37] drm/bridge: panel: implement .is_tail
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-31-45e2bdb3dfb4@bootlin.com>
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
In-Reply-To: <20260519-drm-bridge-hotplug-v1-31-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_081248_173838_DA087550 
X-CRM114-Status: GOOD (  17.91  )
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

On 5/19/26 12:37, Luca Ceresoli wrote:
> This bridge is always a tail bridge, i.e. it never needs a following bridge
> to complete the pipeline. Add a is_tail func to expose this.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/bridge/panel.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 4978ec98a082..102f987b1235 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -58,6 +58,11 @@ static const struct drm_connector_funcs panel_bridge_connector_funcs = {
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>   };
>   
> +static bool panel_bridge_is_tail(struct drm_bridge *bridge)
> +{
> +	return true;
> +}
> +
>   static int panel_bridge_attach(struct drm_bridge *bridge,
>   			       struct drm_encoder *encoder,
>   			       enum drm_bridge_attach_flags flags)
> @@ -206,6 +211,7 @@ static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
>   }
>   
>   static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
> +	.is_tail = panel_bridge_is_tail,
>   	.attach = panel_bridge_attach,
>   	.detach = panel_bridge_detach,
>   	.atomic_pre_enable = panel_bridge_atomic_pre_enable,
> @@ -297,7 +303,7 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
>   	panel_bridge->panel = panel;
>   
>   	panel_bridge->bridge.of_node = panel->dev->of_node;
> -	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
> +	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_IS_TAIL;
>   	panel_bridge->bridge.type = connector_type;
>   	panel_bridge->bridge.pre_enable_prev_first = panel->prepare_prev_first;
>   
> 

This looks reasonable

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

