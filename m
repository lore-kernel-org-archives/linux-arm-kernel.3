Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072EBCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArIiOc5BIENDbFYudfD+oY6YZVBcrif0Q7lUYU811cI=; b=xxPi6vwdNAauyxCH2PYjSiTgLf
	KEhs8S5sZgMfTVtiM7FtFelMC0u7pHvUE4NiA36N5w1zELvDyXRVL5KM9wTVyNmddaCIbhMWk4mRf
	UOnrEwiL86j0LPEdIT6mPQOAZXRUKSTEUP6xTkLSiD4wce8c5Q/GUcr3EMJxw7Q3NOS0WuKpAPg61
	he2tNtxzcuYvM0SluaXtiNXSw7WX5BIkU19SEHje4dnieDK4tpg8tPAnLgtrVqNPbtq5WIAvmX+Hq
	vXyc2NPwAcSyHEKoQC+TaoxcEso4fo4XfuQ604zVvOjhB84cxpO69N9WpV4O0JeGwkB9ncWeifhbz
	oyzN2N/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdYw-000000019q7-23y2;
	Wed, 06 May 2026 14:49:22 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdYu-000000019p5-43Z2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:49:21 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so5287042f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778078959; x=1778683759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArIiOc5BIENDbFYudfD+oY6YZVBcrif0Q7lUYU811cI=;
        b=N+4guF8XK8m/XhvU2w+xtX3AWuOfB5tVyEpyCONKLq/QtoSpqWKRPyif5ifHLXEdzP
         CoUZCa37K03NuYBTwSW8F76MXTtim+0nW5DToimH9j+KyxGYKTK0ljhfZEITcgR3dmFU
         jUm6vPVfUZp9qcp59bbBVaQWa8zELGb8M6o0chNRBPnZOg9PVbJqrDxyy87JuOOwZOoX
         dYdrIEFcuAcfrV8CUjIGnwaMBg8cS/7n82mH1aooWGA32jImPuQqUy029G34Tg254Yfy
         eqsrYZMh8BDubQuY1uPcjsbI+OUE7XoqJ39Y48kXajRLP0PzvsfeAJMgAhZg8SkaQA8I
         BCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078959; x=1778683759;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArIiOc5BIENDbFYudfD+oY6YZVBcrif0Q7lUYU811cI=;
        b=N5lcDW7ANSOPCZa23xT1zMiDYyAtcMEGt1QHpCJdUoAueEAAyGS/UNCQgHD3DK9Bum
         61SKakBXFr/NoapntiBg0XutKy5uD/DneDqMBEjTy02gbIULdRyEKNmur7qkIYnRjoaZ
         qYL7C5VjSQIsyE5cd1GbG5PJFqnF7/kIpsi7Jfn/G+JHrr0urUk6TA4FksKPNaiMe8pi
         pFLQ6re8z1T2W8ZSFKZ956I915hYF5siL+dRLjM2mWFUBQZHsyYUQpndIZvUyTfLSnp4
         AeNU8pVACJhNP1YnjTFn0oOlHFUPIMkowAr9eYp/ZC4RphoP7GFebbne2P+ifc+dNQf6
         rezQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wGJ2QOhxZOe9pXdjwzBAt0JLqh3GljOFU1+Vovi8E06JvcyowbqlPq3XkVtrCQF/bqNjnq7WD/RScveaFwTGj@lists.infradead.org
X-Gm-Message-State: AOJu0YyO6lVHRPV3tK0YfNtssbStnxmOnNSd8HQC0w4lJj9EEaJ9GOvS
	tMnUKskFUztcGWN7WdKgRb5fC0Z/KcmSF/6NKdVk9aJldJVe66VR2zOc4grRqU3DtUM=
X-Gm-Gg: AeBDietg58NzYR3xtmEcRDtfWoZHXWmHoPGA8MuXZJQpnYafEXaiceGNJPD2TWKNEeL
	eMdguNW+kKaxO+ZrtoQtHtW5JigUj2bPgojh5h6gDhn1O508CbeT/sm1VUHtO8Q3SxO7y5IqIei
	OiG/mOEvTgYShuyM3Kx1B4g/G3ZXP+XG9Ch3u3FksnVPvReI365ZIKtEZu1EHgL2cXgkd7FuZ+E
	qs3UnRa+olSM2G3rXFoRX6OFpzTnA1BL8qFKmFlZbWDflpshGX07RKs00RSPp0kixfcPZtD1ZMg
	fLpaGkArOIER6garSqUSfhjkIM1lQx2MwwOfvuMP8izdSvrnc6hZErOrQ3PyRcyuD5Ua5BuJ9pG
	KI0wZM14tb5KGb7lEQmPisXR/YvxStlMGyxUwIG/J/XJWyy72/WzgO2Y4LSboXJRCz4mGcoDDeV
	JJU+l70StPqKO6GCv7ORdOE9eiY9flNqUCnb9W3MyEPFH5QUBK3iQ6QDKlhpW9eDIyc6Bt+J1ki
	ok+20D9hxI8PHHM/g==
X-Received: by 2002:a05:6000:144b:b0:446:db72:e8ec with SMTP id ffacd0b85a97d-4515ce1c55fmr6486902f8f.23.1778078958886;
        Wed, 06 May 2026 07:49:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960973sm12936695f8f.30.2026.05.06.07.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:49:18 -0700 (PDT)
Message-ID: <2c913dd0-d49f-40c0-8951-ea8087d09c24@linaro.org>
Date: Wed, 6 May 2026 16:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 03/16] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
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
 <20260428-rockchip-usbdp-cleanup-v4-3-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-3-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_074921_059334_4C5181DB 
X-CRM114-Status: GOOD (  14.88  )
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
> When a mode change is required rk_udphy_power_on() disables
> the clocks and then calls rk_udphy_setup(), which then enables
> all the clocks again before continuing with rk_udphy_init().
> 
> Considering that rk_udphy_init() does assert the reset lines,
> re-enabling the clocks is just delaying things. Avoid it by
> directly calling rk_udphy_init().
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index 744cc7c642f4..98562a888b42 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1012,8 +1012,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
>   		if (udphy->mode == UDPHY_MODE_DP)
>   			rk_udphy_u3_port_disable(udphy, true);
>   
> -		rk_udphy_disable(udphy);
> -		ret = rk_udphy_setup(udphy);
> +		ret = rk_udphy_init(udphy);
>   		if (ret)
>   			return ret;
>   	}
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

