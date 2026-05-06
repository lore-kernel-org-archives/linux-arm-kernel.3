Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37FFCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNlQdkQkqMvv6TX3zSIUZJDpuOz3OCXPy5mPofQZIh8=; b=TFcqXldGm1AGv0aqfadZd9dfZf
	x6XgLB07mjad6J9UHTj4K6sPzyYFmcVeC43g7R0icpgzEm6JRP5qliXsyB1/1VTJuMUCbGrN3gNcN
	Us3BXLwQ/IPRr/BOxXZvJqOvsaCCj4widNWD9XDgNOuvoioFJvqqRXl80S0cUTdB2UrqSmoMxL8xQ
	wRYEYYusKRHHx3P7MGD3fuoHj3b1/N+7QTPwOf+4hApJRitqNBb0QnsTSh5u0yO37z49L3WQn4m8W
	k7siHEZ3KBL3WwS3P3U8ah2HsEUFzSwBYCJcHVU3fslTUi9YMdRgWluVydIflORiTbOYFibcZZrmN
	9CI1hReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdZk-00000001AJO-3GWM;
	Wed, 06 May 2026 14:50:12 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdZj-00000001AH0-0ehk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:50:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso50667455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778079009; x=1778683809; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNlQdkQkqMvv6TX3zSIUZJDpuOz3OCXPy5mPofQZIh8=;
        b=Jc3qWrly5HyEB1u/s4K8gMGI5CxNvxZbHiMiw6PT+HMeVYbaauQdX1D1GMeYcvUp/7
         TwDH5JGEuCMZSB/5cKfIM7wVr/n1ogk11wDSdbUj6Z7xLYuQHqcvIwtX3mHJXCAnJNQn
         8KYWaKJc/aa34iOhAlCPmK3nQVm58P87d2xMZmGTmKeIfDBo8CauR4oEjX8Jgc9IksgA
         8uHwH0Ay49n0rcIs0DJPMIpL15Iq/YtLFTjjMTNAAx02Cr9qvqcAKSDPJfnRIImpJJAb
         TpAKWSgnT8D70aYmB9uwA/vTHJSc/95H67rHTNboPqrikMBSV1g5ynKf5V66WLFs1dyV
         uDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079009; x=1778683809;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNlQdkQkqMvv6TX3zSIUZJDpuOz3OCXPy5mPofQZIh8=;
        b=dcF6rmLbT+idfE7SW9eXzlu0qTG3X8KPjDhNTtQoOdJp040DMm+LwLYnGJyJBhsBdO
         6aYfgcKVJT98bhwgSUMj+4SOuYpUncpHXIhxNm4VWhqwAOA0kkpySrMl+acg/TRy4vjp
         JHbHXmS0U3dtXOm0ITK5WshwwbiIky8FQTNex2VuwnxjRwwODRfFlSvqi+ZwMw9HGETe
         9dAJxUjgIy6VxoOKpHMRUYfy54u5WoZ+iSrHo5a63Qp/oyDQ7aTau49fL1DSVrRFqWd2
         2CPlqQ3dAdq6fBtio+921Ngcz7SfWSnmN7AbE93W2SQrvfoECmSXrLRW/AmByyT4FAj7
         sJIw==
X-Forwarded-Encrypted: i=1; AFNElJ/XkK4XfoRRblRHI9sX8D4tAzUoAZ0EExrjzCifeLDU8SWnrvYIiTpNNCtvzOmqIa37lSzryssiCVFN1s9JMoOm@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp/RvQJ2tIwlEhQSZ77j1BoH4HO3AR69dsWqNQOqNDySzPKwPp
	NgYgC4yk6JQ5N3v1ApHNCiGAV9yZGqNmvoXJWxULGQ/JOhuyXaBl93pXtnqFgFqRvww=
X-Gm-Gg: AeBDietUykDdExXtTW8ez48Ji5kgbjDUqXdKEXu0nvzsXkXLrCapcG/Z1wWksWOooDl
	e5mxwH8yFmpkPPaSTq0OGN57RKkWy/hBtbAV5OKLitef40cuIqAs01hRlADvacq3OBfynII4jAD
	1wWexc98ZTXv/rnPw+4tzNAftkW2SgSEvgX9BssJuSf4L+cJN37YX+QMqJH2wPPaPHznDwE3Zev
	icjRGHzlliUxIPwmp3jvGztJk4Z2tsZAg5fkNfUPLP6x21IXwLJGDaQtbysvSEpNIculv0c7CM9
	yCJfTG4fXGAx3ORtJLS698/zVsjznyF5ronTFyVGDaVT0OkNfSs7NMzLNCxVJXjHQbEDQmSAqHn
	/cpmID+UwNxQUmC9+sLBvRVqPtaxGRK7k52FixVqyLk8MIEEMMpNDqRRK7t8xcv9TOxd8rJ1SOf
	ujpb92iE1i6XYLBPwnXsLwaNAykr9S5EgbjbE3Xi6IHn+QGrTySt/AwRTj+ULuF0vzPQZz4m3dI
	21ueSN/kqY82kYEZlp+Stp3h/kO
X-Received: by 2002:a05:6000:268a:b0:451:3b12:9bca with SMTP id ffacd0b85a97d-4515ce1cde3mr6569525f8f.25.1778079009130;
        Wed, 06 May 2026 07:50:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052483166sm12894076f8f.7.2026.05.06.07.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:50:06 -0700 (PDT)
Message-ID: <7430e331-5bc4-4814-baf1-e87a9104045f@linaro.org>
Date: Wed, 6 May 2026 16:50:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 06/16] phy: rockchip: usbdp: Add missing mode_change
 update
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 devicetree@vger.kernel.org
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
 <20260428-rockchip-usbdp-cleanup-v4-6-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-6-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_075011_229121_5E0216DF 
X-CRM114-Status: GOOD (  19.44  )
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

On 4/28/26 18:13, Sebastian Reichel wrote:
> rk_udphy_set_typec_default_mapping() updates the available modes,
> but does not set the mode_change as required. This results in
> missing re-initialization and thus non-working DisplayPort.
> 
> Fix this issue by introducing a new helper to update the available
> modes.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index 97e53b933225..febc148a754e 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -619,6 +619,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
>   	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
>   }
>   
> +static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
> +{
> +	if (udphy->mode == mode)
> +		return;
> +
> +	udphy->mode_change = true;
> +	udphy->mode = mode;
> +}
> +
>   static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
>   {
>   	if (udphy->flip) {
> @@ -649,7 +658,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
>   		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
>   	}
>   
> -	udphy->mode = UDPHY_MODE_DP_USB;
> +	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
>   }
>   
>   static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
> @@ -1385,10 +1394,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
>   			usleep_range(750, 800);
>   			rk_udphy_dp_hpd_event_trigger(udphy, true);
>   		} else if (data->status & DP_STATUS_HPD_STATE) {
> -			if (udphy->mode != mode) {
> -				udphy->mode = mode;
> -				udphy->mode_change = true;
> -			}
> +			rk_udphy_mode_set(udphy, mode);
>   			rk_udphy_dp_hpd_event_trigger(udphy, true);
>   		} else {
>   			rk_udphy_dp_hpd_event_trigger(udphy, false);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

