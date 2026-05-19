Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D18CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 07:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/UrhAX2VwHcFosaazEyQ389tsED90O5GiFK+5wV2WI=; b=khGLlfdTC5l/qKUhS3pH8kqfr1
	UmQssNaGJPiEVng3Bf4PLM7oFwMxAzIDcviIqRin8Tf4uSwrPPP9IETuuMBZnBw34ls6cVHX7/+JY
	iRlT/SKi1u9pUjrFdUdaxsdGy178JeoHm3YJMtJhn9UWgOp+8Oow4t8ZbTZtcxcOwAJvvu21c8Uy7
	xucm7V+7l/efK/A9JI34MvTGKPbX464uLPaUK3X3+B4mN4g9Bhs7mPQt+t65j5ZzQevTP+EnhX82c
	pDvO9L+DOgIv7yB6iLV3v1Fpn4+a36/jW/UW+Q9fDrJsuuT1j5MH2Au+N1bLnzi8IOW7edQrhLQvZ
	wLB8sUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEq1-00000000UQs-3sOt;
	Tue, 19 May 2026 07:26:01 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEpy-00000000UP9-3mIb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 07:26:00 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso2940927f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 00:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779175556; x=1779780356; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/UrhAX2VwHcFosaazEyQ389tsED90O5GiFK+5wV2WI=;
        b=lE3g3lbjDh7rlEwkeTcrYZO81mDYNwmHn3AntowQrYhVCSMUo8OC9Q++uo86Z2KiOA
         8y62/yoEHh5cx1vi5yT8H8LaVTNzvnXHnNCG/p+xlZSUIXmbY7MHyovCFsEoyam7IeuP
         LFkwAOsGrOUafa+LFgR7w+/xuLGrShOWqwVOgi6hhCOM7gyDG3FpSxCwz5/PbcfoA8vc
         Cw8mUV8k1pVdbZn2+GiJ4NeEFWs8j6+JU5E87Hhum3Hnn2K5Wv6xhNua+Go0RS5vKF9c
         wEEf4zaU3Crv52fZCxF7ajR/0uALL9heCghzwMaUJKHBdBNeP1sHXpnCys+YfRK6CUHg
         OELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175556; x=1779780356;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/UrhAX2VwHcFosaazEyQ389tsED90O5GiFK+5wV2WI=;
        b=B+KV3kek3e3dk0DYkHM0pqXzpsIgKy38bYKEUNJdM/8+AshVHtuaUuhhmVSq6NEolT
         i8nT8S3jbA7qngSl9ChU1RxZGV0TL+YvrVPH5HqbmrfGTfIbKBUK851nsVoaBXa4j9nV
         sdC/5KUZpix1GDCZCkRdrqO6DpQ6KDQONlJFUHYFPwjSTvxWvP/gx1UHjKQwAI6M3Lxm
         ou0X/NjQRZAZnwWQ3Q2T2hPyrk5v8nFjVEPRup00WXgjLqDT+ymToLCbU22WzdSfLNMF
         2uLSrj4Rpe77a19G3FUC7smuJ3HTPZtqTB9Rs6Qi1bjaUYhbW9hezym9qUmyyoS24XqY
         jQqw==
X-Forwarded-Encrypted: i=1; AFNElJ8cP58M9zqNvsj+EfQjcK6rhrJBYms3FHQMsZ4zgF1DVxPyPjDmZkmGISn1J30HqPqeXgc1cs7BbbE6zhS68tgL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1xkMYNcX6HtakNesMN/aj7lxTa9riTjMW2LU2Pdc6dbm1ZTdD
	OVijKcrzo77noIWKFfpP5Z+pRjcaml3CzBH6jIx7l4DfKsVrV47n1W+cWXXxa8AaQkE=
X-Gm-Gg: Acq92OFWrmmqI1KDyttKnndngAHUtgv3z0os5jvwdHrm0siubduXQN5GQLsW0gM1kpU
	f84yaxTbFMsyI5D8sY+JTfjNKjGiKjYDMDk2hAO2mMNAGkKZFde6LKY6sO+CXheaed9Ui1obWDJ
	PW27pTibH8Kj6R59F2VJ3QIH6u++GE7Wiqa7Ova7UlEZltM+6Yd677uKlSiYCS5aNEQRtgr3NGi
	vMSMk4WOjm8oocziIaq7oSzxmafLqU5c/XHhQqU/9dBixbjF0gwmbpGDXYplXEgny/l/8hos9eh
	ECLso3qY39T3F9Xzq0yr9UqoXxrx5Rhln4dLGfgAgr8eKmTlI8mGfCK90zf3SnveCvddIQW7gXl
	ea4Jo6ERMAY3CdZWqSyx/lyLLHhna+5R1MHcx7GSI0IGpiznejkW3G8Bp6yNJ0VTxS3YBK6ChfE
	hlZFszhPaThiILdn3ymmzl5qcztlj5CYgWwy/LtcwKNowbF1XH0ya4eVv/Q7/hrwV6aSVh4gk45
	MQ2MhJJ0ictXY8=
X-Received: by 2002:a5d:5d0e:0:b0:44e:639b:7d0f with SMTP id ffacd0b85a97d-45e5c36bd17mr28618808f8f.12.1779175556033;
        Tue, 19 May 2026 00:25:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed30110sm47358336f8f.13.2026.05.19.00.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:25:55 -0700 (PDT)
Message-ID: <0a91bf03-c94f-4519-a69c-b7f5e505ec1d@linaro.org>
Date: Tue, 19 May 2026 09:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 04/13] drm/meson: dw-hdmi: Drop call to
 drm_bridge_hpd_notify()
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
 <20260518194744.2483580-5-jonas@kwiboo.se>
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
In-Reply-To: <20260518194744.2483580-5-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_002558_983570_819D20A9 
X-CRM114-Status: GOOD (  18.10  )
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
> Calls to both drm_helper_hpd_irq_event() and drm_bridge_hpd_notify() in
> the IRQ handler causes multiple hotplug uevents and modesets during an
> HPD interrupt.
> 
> Change to only call drm_helper_hpd_irq_event() in IRQ handler to ensure
> only one hotplug uevent is triggered when the connection status or EDID
> has changed.
> 
> The bridge connectors detect() func help ensure that any hpd_notify()
> func is called for all bridges in the chain.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 9aafdc768f2b..30099bf71aad 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -521,17 +521,8 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
>   
>   	/* HPD Events */
>   	if (stat & (HDMITX_TOP_INTR_HPD_RISE | HDMITX_TOP_INTR_HPD_FALL) &&
> -	    dw_hdmi->bridge) {
> -		bool hpd_connected = false;
> -
> -		if (stat & HDMITX_TOP_INTR_HPD_RISE)
> -			hpd_connected = true;
> -
> +	    dw_hdmi->bridge)
>   		drm_helper_hpd_irq_event(dw_hdmi->bridge->dev);
> -		drm_bridge_hpd_notify(dw_hdmi->bridge,
> -				      hpd_connected ? connector_status_connected
> -						    : connector_status_disconnected);
> -	}
>   
>   	return IRQ_HANDLED;
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

