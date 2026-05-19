Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590DFCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 07:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zpUdooh7j5y1dGwvoNb/vpfm79eAZcPY2dZ8iHzeV8=; b=5AiM477lNNim8vnMveeBQ9NmZl
	rfKhtRa1N0IwlBw5MXhK49QtgAKBmSftR6tkrAjo0ooUIL1dbDdn61+YvwdVd3rUXMc+XhUR1g0BE
	+hvjbzRpb+1wmdWs9Ub1GaHSxOP5GwbMZbkdyq71fIsCZQj2LcCX1UMqGqmFdw5/j0DfN6JUdBMOP
	p2BrDge5nBhuCC18v1sw09c16NFRMygmGFmRgroC8D74sD0bZ0XPnWhIf7Dtatkgg3EopwaIoULl3
	sWIDZi+pLXMAcPbkU3DArp89dnx8ManQcZDfOnfPF4n4M7AouUhQyda6K/4AVDJn7Bc9ofi0wz9IB
	OjVFWDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPErj-00000000UlK-1Ozw;
	Tue, 19 May 2026 07:27:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPErg-00000000Ujo-49jc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 07:27:46 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so34763905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 00:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779175663; x=1779780463; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zpUdooh7j5y1dGwvoNb/vpfm79eAZcPY2dZ8iHzeV8=;
        b=H8yr1F/PKbipzimUtt5OCHWwA38BZFWq/ZAkHhDZ0Z3yKvUAox/HNaiwIxxUTYHrqZ
         O2A10BAaDaRD3gqZ66OWPYZ7QhhuEKztEko3jyr73s1RWNfVW7TPGlyH8WPmJnscYD1p
         zRltxktprFvU491vOTLfz/Pz4RZG77wsD4oRTRSU3K/3QdgdEng27MbmLZk76PzqCieR
         K4iVOKULOMbAuJFxZWiUWnD51/kFvXPUM5/gmaT66T+E0EQS3bQo9CoGpWOU0b3jMn+X
         v74FfHgnM7RmNO/OkcNJgn5/OPiTYYKGQW1Ap7LkAyQ5m2aBprhIFTs/W13jv9y3fdnA
         KSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175663; x=1779780463;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zpUdooh7j5y1dGwvoNb/vpfm79eAZcPY2dZ8iHzeV8=;
        b=EG1VkidIQGti8pBkJ+8zPXYzsSTPdLx+IqH4vMkDAXR8mw20/55VkptueyNuOc3gVn
         vJ400+KXyncP8tTyK5iiG1mwJUqf/vrpYe6ZY7LgMQujPheB4dHX3ap9seXZ5hP/D8wE
         5w062yoLgtnXWJuaAE0FIWnWHUDTGSbl298pP8GUGLE/3KM0BXONnQJAswo7k+8tj0xL
         Po3f3DBwUe72ql6n3W7cCCC52u/aKbQA8KET24PFdw4VoWM6+FamyaOpyp8M3U4ttSLc
         I0A+omhE/D+Mx5VMtl9sYlFMXfdxYGCDOc3aJ7t9Vi67zuBLSBwowosCDmZInOkRCtld
         vEZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tmdDW/gAl3PqvUR+Hol9Uxic55XMCr893WDjP70dHEwIp/ZBK/32fyy0kSacGBuIdbVFmtHkfl38o6RdWcyF3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp8qC2t6wluvGR5ipXmYm2Rj9WoK0h4trEQhG7mSPZ9jzXzPRj
	VT2SDt8BQwZdqgfy87DoyXYSp8dB3ZDm5eNkyV8ZxCNvKR2MDdsrh4ArjPCx4ZIFuYc=
X-Gm-Gg: Acq92OGRpnnCmmdbzXmBhkmuDAYuCAphMmUqcedZ3kH6fz9NTEwM1Zc9tFt3UySbydQ
	okcm98hXDKWzX1kl7INtJHmq87llJ6ihXOmauFnjlQjYWKjY+L/rlPqj8vpaVEPMuypD5p15SLi
	WqCQhdyZt1CJhqDbIQjvYPAj4iHL5fZfETW+bZSj+86yv0NWVnqkEFF8wzjEcJc2yxvBtrfzRS3
	fnR5kS96wVV6R1ro4WXjPfzTbNEjV1Dfr31bh/Nvwy/92Hhxli1zdDuKS8H5kWNbZ9u/8EglAuR
	QIkpiBkkm1IwZum17q7EnEFLtUhUnUcKxK2fICnN18nVs1IVjErpNa+jBbKoq4uOl3H9f5Cf1go
	dYjDlMMT4IEXQOz9ufFqQznUXFWSekpWbtYAG+Z/JGjUVjTZwBxh3yMA5MC8e81vKyTTpPvX6zI
	67ZkVeqta4QJZKyndpwHys28i3ZXI/aq628dWXQPOnolSt+3s5y9yt3svqExIvm43nix4IB62ac
	LQe
X-Received: by 2002:a05:600c:a406:b0:489:e126:b757 with SMTP id 5b1f17b1804b1-48fe63297b9mr233398525e9.25.1779175663120;
        Tue, 19 May 2026 00:27:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm299805555e9.4.2026.05.19.00.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:27:42 -0700 (PDT)
Message-ID: <21609bd9-7a94-41cc-bbe2-2478278b0497@linaro.org>
Date: Tue, 19 May 2026 09:27:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 05/13] drm/meson: encoder_hdmi: Use CEC phys addr from
 display_info
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
 <20260518194744.2483580-6-jonas@kwiboo.se>
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
In-Reply-To: <20260518194744.2483580-6-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_002745_071077_4E8957C8 
X-CRM114-Status: GOOD (  19.60  )
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
> The dw-hdmi bridge detect() func now updates EDID for the connector.
> Something that ensures that display_info.source_physical_address has an
> updated CEC phys addr when the hpd_notify() func is called.
> 
> Change to use display_info source_physical_address directly instead of
> re-reading EDID to set the CEC phys addr at HPD interrupt.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 26 ++++------------------
>   1 file changed, 4 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 55c0601df3c6..1b9a1d9ed3d3 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -330,28 +330,10 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
>   	if (!encoder_hdmi->cec_notifier)
>   		return;
>   
> -	if (status == connector_status_connected) {
> -		const struct drm_edid *drm_edid;
> -		const struct edid *edid;
> -
> -		drm_edid = drm_bridge_edid_read(encoder_hdmi->bridge.next_bridge,
> -						encoder_hdmi->connector);
> -		if (!drm_edid)
> -			return;
> -
> -		/*
> -		 * FIXME: The CEC physical address should be set using
> -		 * cec_notifier_set_phys_addr(encoder_hdmi->cec_notifier,
> -		 * connector->display_info.source_physical_address) from a path
> -		 * that has read the EDID and called
> -		 * drm_edid_connector_update().
> -		 */
> -		edid = drm_edid_raw(drm_edid);
> -
> -		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
> -
> -		drm_edid_free(drm_edid);
> -	} else
> +	if (status == connector_status_connected)
> +		cec_notifier_set_phys_addr(encoder_hdmi->cec_notifier,
> +					   connector->display_info.source_physical_address);
> +	else
>   		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
>   }
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

