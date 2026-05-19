Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B1FCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 07:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3SA13elET4TYgmxY3hJVngIm5W/klIYH+PuWe1fxys=; b=j1gWk0YGZU2qUwH93ZdchLOQEe
	8BWtnu1JJo203SQjndSyt0yy8ipZcWn69tXIFmIVzZtHFUJCpCunt6FgFYgo3nxDMQFxqfV9JDb6S
	16LeRPaMJIi/5mymms/7sh3pOOSbznGqYexRKDiUKBC+0DnvLWaUAGBuivil3P0mjTWVhLJRYv4F4
	4b0b+Mk0LLhL40JOs0Pb/iqH0wG7RwAPbCsKeyzYHI3Zj+bIv4Nd9hUZ6lMEZZ3Ca7QdU4BjW9mGO
	NtyV3XpoFlBj2fBBdtQTCSWC8saCSxowRBrY3TTkg3qDm2p9YPI0NBG871s2eWFPFDhIqAsVG0VCR
	zgBWcA0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEvZ-00000000VU6-2Hvt;
	Tue, 19 May 2026 07:31:45 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEvX-00000000VSn-1vR9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 07:31:44 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5a87edf88b3so3490319e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 00:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779175901; x=1779780701; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3SA13elET4TYgmxY3hJVngIm5W/klIYH+PuWe1fxys=;
        b=DFefCnsjqx1HmK5U0W7xQY7si7/ojzbr7B5NA1eYkdUxTEEnXFnrN+kGYUBt9epHr2
         UjP3c87eMEJB08sCAeiByEfqE24ENkuZz9CJ62L0b90o2BuqbEGxdTVxNpm31tWXI84x
         HembTw/txwuH741yrCUJMVyRUYanhas1buh4ZgNBM+hxd3z15Z/uOh9RhectCI1poOaU
         RwdYG9p62F3QwRVeyXRIZ4DD8LzcSDm/a/hiRrGijlmsUDUMYyCEdts3PqHyUp3hkWZ4
         X4sMmaISq/4MWSD+8HDLiwnmHLPq1mOus/pzz9vAzKQeAeFchYjGCI4mwtpYmzpwKlyX
         pwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175901; x=1779780701;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3SA13elET4TYgmxY3hJVngIm5W/klIYH+PuWe1fxys=;
        b=dL9KAkwUx3B0lqu6L6E6g6BUJZuhl8S5xku99wu5eyUnzSi3rjjgKzb3Dmc1bLW7af
         jh79P6dulKISoLdGqzvbCOolKSP1Gkr8H7oQ9hik9FbsQqyKYiJuJSwNkN8GJk8A52Qw
         qHsHh+bfT6KNzR0NB6p0HRFH/TCH6aZaxYs6svrjB3AK85sFa6+COfDUo8V0UkWgZy1K
         ySWqVdvhAFfYXsOOa7ftV1ZydVNMx/S74hTwsrj8VI+aha8lzuc4p6NNH3vEb80KelmR
         bsVRM5DzV5ZteTPXWi+Az0JEe63+rpfqjaNw6BjY+Vm8cBkpLDjqIWX6OIMpeW7yWSqS
         4ILg==
X-Forwarded-Encrypted: i=1; AFNElJ/rlOrb/d8k5VEYgiNhcJEiFwPxu1o8NjUXg18sTQ3edCCqlPXLmniHP4okjg7B+rTAq8G6BnJm6DGxZwmwqFpU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0ltimO8mLwBWzSadpczbcE2Iyb02Bu1WLcG01b2zOXQHZzS40
	x0NrfgONntvBiBt5I1BSGGMRPA8345FmthpXHglvkSDMOs51q5F3+Kk2gQO1Rr3pFus=
X-Gm-Gg: Acq92OG4ucPVaanojyfY001BXQP1cOd5mAoiHlvRsd3JiDhkTwOKMLgqG2gzC+UjY4c
	Su7XXsi2cZSK42134WgqEztj0HddaaAMy1ZiHpOrE16TyyDE+3b7F7bdMko0bmPQcAqdq6Q0RdZ
	KIPX0z9zHCTnAvuwqZg1ZpWYsAnP5D0U4O49juQKvtZDG+8V9r5CMbzPKPXdqdVLaiu6dsNUhkU
	VTFzBkf9JLgfoXjzDC84/ZewAp4v1cngbIse5dDtQ4qoq16cmJ9yY6KKm7sEuIVme+dYHo6t4cg
	jgdJrXO0kfAQi/kFFmyrlw/rt7i/vFjfqLPDEeuKIFtbLfwPR6attE3YbCy7vASpl27VfHZ8x6Q
	PeCuRFxn1hIjOkdyKqQTZsK+DPl5RyNRnTShN6OwlfHgnhCsIJ03XWDuhqkL5FuWILngeztYTvn
	o9kY7X7tB6ip5nvtx3jTamfU/0crEIaw+zk+BEJdU6lj9fLHfTUXi3usPVbMd18iBX94wrg9yDo
	zbb
X-Received: by 2002:a05:6512:1317:b0:5a8:fbe0:bc71 with SMTP id 2adb3069b0e04-5aa0e611478mr5339169e87.15.1779175901177;
        Tue, 19 May 2026 00:31:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe2464sm44941676f8f.32.2026.05.19.00.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:31:40 -0700 (PDT)
Message-ID: <c6beeeb7-f764-4a84-aff7-5e29250027a1@linaro.org>
Date: Tue, 19 May 2026 09:31:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 07/13] drm/meson: encoder_hdmi: Report ycbcr_420_allowed
 from encoder
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
 <20260518194744.2483580-8-jonas@kwiboo.se>
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
In-Reply-To: <20260518194744.2483580-8-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_003143_533756_6AE0E8F6 
X-CRM114-Status: GOOD (  15.11  )
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
> The bridge connector report ycbcr_420_allowed support when all bridges
> in the chain support ycbcr_420_allowed.
> 
> Report ycbcr_420_allowed on the encoder bridge so that the bridge
> connector automatically can report correct ycbcr_420_allowed support.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 45104ef35344..484675cb8284 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -354,6 +354,7 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
>   	meson_encoder_hdmi->bridge.of_node = priv->dev->of_node;
>   	meson_encoder_hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>   	meson_encoder_hdmi->bridge.interlace_allowed = true;
> +	meson_encoder_hdmi->bridge.ycbcr_420_allowed = true;
>   
>   	pdev = of_find_device_by_node(remote);
>   	of_node_put(remote);
> @@ -406,9 +407,6 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
>   
>   	drm_connector_attach_max_bpc_property(meson_encoder_hdmi->connector, 8, 8);
>   
> -	/* Handle this here until handled by drm_bridge_connector_init() */
> -	meson_encoder_hdmi->connector->ycbcr_420_allowed = true;
> -
>   	priv->encoders[MESON_ENC_HDMI] = meson_encoder_hdmi;
>   
>   	dev_dbg(priv->dev, "HDMI encoder initialized\n");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

