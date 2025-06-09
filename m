Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF93C71131
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 18:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCNoRj8OvkbWY83EWwe7S1ChrayvpWwSG5jIbf3fsDA=; b=qAYsYtfN6vvDwu3bDA0WCPVEqr
	NDKMnsb2W0ddgX5TqJPSybaFG6MqA9mNfVInIkLAMmjKqo+WW6bZ7bdD6PKz3f4lSeEUZ6dOMtSgJ
	SRSlK8xMEiy99RreYCPV4FkweQRz5jmWDiNbow4euyO6QVXFJHscZZCq7F9NfTfODi5PE+7VHXRN9
	AInZwsB3ekJV+oLfZHde4cEveNDLgp60mgeuNTympdwKlkZnBn4lcaldBfZ+3owmv40SihfVUZvgf
	5sy5Ic4tnUz8TmHkkBkiWQBeR4YrMM7OCHyMaekeHo32T41PwqpJhbgrB5yKAd3VQtEZD0gSsnevi
	PJ+0K8Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOhZJ-00000004whH-08kP;
	Mon, 09 Jun 2025 18:50:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgNu-00000004oaA-01AA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 17:34:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45305c280a3so5945795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 10:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749490448; x=1750095248; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCNoRj8OvkbWY83EWwe7S1ChrayvpWwSG5jIbf3fsDA=;
        b=H4kojOx6zI914sFWPhYRbfWgRfl6OYmAaQ/WSjeAd0/gmeavyLuxtY8h9z4yA3eTmn
         ZkEZ+7dt4mZHKLaMjuKYoq37qIZpsXoJfebBLVFHwttyrh5UOQIfRLpoCsdazQFuCyKq
         RK4BDVZzUybNSnNynHgVU8PvgnVsqaEa5FhYp3n92POWhK4Zdgk0Ex4Q5BAHA63PNd5m
         feauEfzqOUXFnTZPku+vIY/1FK0U0o6lIQ2+zXMMGHf/ZlO6AQz7RvqK5d2zZMeGdyyk
         +R9pPxg2SRrFtE7IIGrP/ut6L+OZ8NBrOQoKs3mmU/WjT6Jd/c7BLmv+L8ma3byx9t7a
         YfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749490448; x=1750095248;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZCNoRj8OvkbWY83EWwe7S1ChrayvpWwSG5jIbf3fsDA=;
        b=Q68PSswp1MG7vngSnm1A5jTeI0/l4SfYM1ohsNwHuBCRsqiDQLNhM9UcbifZFuGPf/
         h7dVE6QqWdsmCm6IWo6/NUUVVgsIWK6L51iWmRBMJ1oBpSLjCFD5dsPRXKKfyeA9RlMf
         7mi/WY25eNiwZsTEaZertbV9uvv0vye2RqDOs3UX9xW18RgU6QPaEI8unF61AA24h82D
         85KZB6QZvkQuOQgS6W8KwHenn/qFzWdGK0pEe5TG0kOH2BvB0Oda+LEJONriBh+I0KJt
         4/t/nO1z/PZfa/SHU+Gv0zNPvW3DZSPFHsqhw2IaAq1bha/xRngm2wkjuUFA5uBWPqan
         l/uA==
X-Gm-Message-State: AOJu0YwMLYjFRBZfkbzuxAOO5EiidPIsVO4EvyvRXdM88dHRlwFKTv5c
	maZiPLS6VTlA8+rQx4fho1APW2nkYqjN75Bw5bQajPvpTZjB4guCOIGUa1YgZjpZzTw=
X-Gm-Gg: ASbGncvlAWCOfSKPlrEJbbpS7lbGX2dO15KgCo0jobnRhWDMf/Mw+Of2zAHPzbsK8n6
	vOgo8E7NvdTXXh0JPITk9bEKopDh39HuTF8jkRuZgD2qIys+7SoxDe7WmS1Szfqfl43dLGoKqTC
	hudwodPclEnZMpTTG6KtlwiujrtbGVmanHk+gghEobVXD4bZ2fJkYcb7PT2JWXWm/TXhXLMrth8
	laA4+zsEB095SIXUtROEdCgtMHtFV1sJk7EWrqpogfwVAxhM/DmYwF6sgC/HIl4EDH7LyUlfQmM
	snL/EAhhOY5ln2mLtIwK1B9/rsHVeymwYSMR6EVUJJNohoj4au6XeS0NUzK9UZ6mCMzRXi2YcMy
	0WEgaVyTPirR0nbv+u/RcDUqhnAqH
X-Google-Smtp-Source: AGHT+IHjGXyFvXdDAggENskwqk5z1F3qFDATDXWh/Gh5Xbnntn1Cd+D5lXKZIFiINl589SC7CggLdw==
X-Received: by 2002:a05:600c:8b23:b0:450:d37c:9fc8 with SMTP id 5b1f17b1804b1-452013898d8mr137331575e9.13.1749490447982;
        Mon, 09 Jun 2025 10:34:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:d049:de0c:efef:b94d? ([2a01:e0a:3d9:2080:d049:de0c:efef:b94d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730d162asm113789415e9.39.2025.06.09.10.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 10:34:07 -0700 (PDT)
Message-ID: <6400f504-eef7-489d-bf06-4a0a13cd5ee5@linaro.org>
Date: Mon, 9 Jun 2025 19:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: fix debug log statement when setting the HDMI
 clocks
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_103410_036311_80B0A5B7 
X-CRM114-Status: GOOD (  15.00  )
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

On 06/06/2025 22:37, Martin Blumenstingl wrote:
> The "phy" and "vclk" frequency labels were swapped, making it more
> difficult to debug driver errors. Swap the label order to make them
> match with the actual frequencies printed to correct this.
> 
> Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 47136bbbe8c6..ab08d690d882 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -109,7 +109,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>   		venc_freq /= 2;
>   
>   	dev_dbg(priv->dev,
> -		"vclk:%lluHz phy=%lluHz venc=%lluHz hdmi=%lluHz enci=%d\n",
> +		"phy:%lluHz vclk=%lluHz venc=%lluHz hdmi=%lluHz enci=%d\n",
>   		phy_freq, vclk_freq, venc_freq, hdmi_freq,
>   		priv->venc.hdmi_use_enci);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

