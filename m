Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792ACCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAySrM3bN8yQAz+pyh9tgVeeAYL6w3U2oSQp8JsglNA=; b=H36AUQYYNfEJQjHWRbLj06ZVzv
	GZfEGa6Nj8dpB7ZkkZBvuDC67fZvDs8k5RZybfmbHCc0i6EfgxNu3TVzeZA0MewwBaz9eOXNO0jIE
	ysrnTF+rfUvEPCrMslsQ/ZTeY6dathss6g0qQVfFd4+vpNIzlxowycq2Dy2KcTJTgHnpgpFQv6E/H
	VsrFYNfPhB0GvLsBlHjIuzRKFpXbtK/nGUo95BtVPnvdCsGKtWrs9IWQx9CgwYgcEcMxwZ+vAMV1Y
	lT3lFUEojby3c0jEKAL/o7pQ6RXxMZMlDof78cfhI5BjgIRSHiWZIkhWQHcyckLe4QYmJXfqR5Wwp
	XrmepVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdce-00000001BMN-41fm;
	Wed, 06 May 2026 14:53:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdcd-00000001BL8-0B1y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:53:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso3719005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778079189; x=1778683989; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAySrM3bN8yQAz+pyh9tgVeeAYL6w3U2oSQp8JsglNA=;
        b=sQjEG8gdpq+V2HLFeFpizp03XNu46cARfdZ+rigEAC/daB+JspnXm2LzpeksHU4pH1
         Y8nHT1DIWJX71FKN2+VWhQfyu6GuuklmcmXWVxVJPh8g5HPvRZlN7FyKYAzmo6e9/GH/
         rdDobLCFJPIIDpcYDLsqrDl7cKKhVLapVEAHQiHI7qnrQMDUNkIYHZ5mpM8kdTtAoPMX
         f62+tBRQmBwSQ7b7SbARBPF6waXErtTup31igHmTNRyuNl6KlKKfINd80/4/Yclpkphd
         NDMyqW1BeKP4k/jh/GPF/iSanDrozmJxES9bn10XBY9H8I9Mr7hg/VdZ7monBYHGJKxN
         WX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079189; x=1778683989;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAySrM3bN8yQAz+pyh9tgVeeAYL6w3U2oSQp8JsglNA=;
        b=p4AaZSN9aXcy2XZf+GBh/+rvl4aZ7mKWMW5ZmGGVNJiwEqD6hC2vljwwR0oZTNnaVv
         kCUgWtb7Rffw0E/W2eyxD3rWlEFQivgQpuqzFOSRpMvYWGHcOt8tg+J4vqyqVZDa9vSb
         IEew7x1gyzOdo8dxyn6FjelTPmaCKtDqzMjGNPkEntJTAdCThpmd7jdkIkZXagttaOIa
         9BVgui1wV+6Szzuez+mGzzswh4l6gCyh2kNUXALv7VfpTMydu94USuHK/7YZwCM5CUBY
         QSlPN4oBfmxxDV6JvUOjbxx1+V4ALGegTqtvgsX14YXItSCV17kgIeC7zIGOFqMyYo0X
         UXsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sPBakcBinuCybPk/4+DAbg7rgGrD8djaHD80okcrZf6N5/kjN6PSNTAVJjZ3CJD/Y2Fy1ZJ/GOPI24uod+cN/@lists.infradead.org
X-Gm-Message-State: AOJu0YwvH1ZrmModHzOO1e9vgBdIqRu6ZO40fZYCDnDixu01jAi1/mjg
	MR+q1hUKfvxbQRgOEjisaNQKKpFziuRYUjl5jbdbntCaEXea9PSHls1BATJV1G8yUFg=
X-Gm-Gg: AeBDietvNrXN7w72VK8y6K9k2bvJ0pBl0w2dxdimMkBVy9pntscJkqZc72AZ4NqtfwG
	BMrk1vRs4jmefdwIVGTE8QfIFCTbzESebnkmnkAWthAZlc6+WcLzvzqMV+Wv7lLYvDBaRj4Na7G
	G60mZGy+f+X8G4eSt/0cYUJ6BV4OLcBFH/VrC+IvpS/CRdAoMqvzfgF1clF6v3Wge0qpQ9aP/yQ
	n4mma2CRfDgipx+HYZ4GjWO7B9nIRPlcNxw/yH0YRI9WTT2Rpt28wV0p218son08wz/naSBDklf
	Ih2zXaOuScyk2YNSEXBNEECxZiQp664qoYLcbKuDcIgV3bgdX+Do7QgW6irv0FPBb6VWN3FUStS
	Ey2ldm5YrRdnp5tAqn7Mk2Jjfdj9Aya0HzvGhHFunb6mODeYds36hcnMf0La4A500zD7V+/fkaU
	HJk+0sRsEzYp8vJ+mXmn8ZpiwhxtZ7pO+/Zs7kZ6dMe46Mz9YdYOOMZCk9tptb4A//8f/BwgluN
	SPXv8IyrdfzSPcvug==
X-Received: by 2002:a05:600c:3e8d:b0:48a:6268:18a9 with SMTP id 5b1f17b1804b1-48e51f32797mr68799045e9.13.1778079188986;
        Wed, 06 May 2026 07:53:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b05d9sm25672695e9.3.2026.05.06.07.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:53:08 -0700 (PDT)
Message-ID: <f29df43b-111d-471b-8579-0196596fc32b@linaro.org>
Date: Wed, 6 May 2026 16:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 07/16] phy: rockchip: usbdp: Support single-lane DP
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
 <20260428-rockchip-usbdp-cleanup-v4-7-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-7-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_075311_137599_DB9D8629 
X-CRM114-Status: GOOD (  20.45  )
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
> From: Zhang Yubing <yubing.zhang@rock-chips.com>
> 
> Implement support for using just a single DisplayPort line.
> 
> Signed-off-by: Zhang Yubing <yubing.zhang@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 61 +++++++++++++------------------
>   1 file changed, 25 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index febc148a754e..bf8394174294 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -193,6 +193,7 @@ struct rk_udphy {
>   	int id;
>   
>   	bool dp_in_use;
> +	int dp_lanes;
>   
>   	/* PHY const config */
>   	const struct rk_udphy_cfg *cfgs;
> @@ -537,6 +538,13 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
>    * <0 1>                  dpln0         dpln1       usbrx         usbtx
>    * <2 3>                  usbrx         usbtx       dpln0         dpln1
>    * ---------------------------------------------------------------------------
> + * if 1 lane for dp function, 2 lane for usb function, define rockchip,dp-lane-mux = <x>;
> + * sample as follow:
> + * ---------------------------------------------------------------------------
> + *                        B11-B10       A2-A3       A11-A10       B2-B3
> + * rockchip,dp-lane-mux   ln0(tx/rx)    ln1(tx)     ln2(tx/rx)    ln3(tx)
> + * <0>                    dpln0         \           usbrx         usbtx
> + * ---------------------------------------------------------------------------
>    */
>   
>   static void rk_udphy_dplane_select(struct rk_udphy *udphy)
> @@ -544,18 +552,18 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
>   	const struct rk_udphy_cfg *cfg = udphy->cfgs;
>   	u32 value = 0;
>   
> -	switch (udphy->mode) {
> -	case UDPHY_MODE_DP:
> -		value |= 2 << udphy->dp_lane_sel[2] * 2;
> +	switch (udphy->dp_lanes) {
> +	case 4:
>   		value |= 3 << udphy->dp_lane_sel[3] * 2;
> +		value |= 2 << udphy->dp_lane_sel[2] * 2;
>   		fallthrough;
>   
> -	case UDPHY_MODE_DP_USB:
> -		value |= 0 << udphy->dp_lane_sel[0] * 2;
> +	case 2:
>   		value |= 1 << udphy->dp_lane_sel[1] * 2;
> -		break;
> +		fallthrough;
>   
> -	case UDPHY_MODE_USB:
> +	case 1:
> +		value |= 0 << udphy->dp_lane_sel[0] * 2;

What's the point of keeping this no-op calculation ?

>   		break;
>   
>   	default:
> @@ -568,28 +576,6 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
>   		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
>   }
>   
> -static int rk_udphy_dplane_get(struct rk_udphy *udphy)
> -{
> -	int dp_lanes;
> -
> -	switch (udphy->mode) {
> -	case UDPHY_MODE_DP:
> -		dp_lanes = 4;
> -		break;
> -
> -	case UDPHY_MODE_DP_USB:
> -		dp_lanes = 2;
> -		break;
> -
> -	case UDPHY_MODE_USB:
> -	default:
> -		dp_lanes = 0;
> -		break;
> -	}
> -
> -	return dp_lanes;
> -}
> -
>   static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
>   {
>   	u32 val = 0;
> @@ -659,6 +645,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
>   	}
>   
>   	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
> +	udphy->dp_lanes = 2;
>   }
>   
>   static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
> @@ -897,7 +884,7 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
>   		return 0;
>   	}
>   
> -	if (num_lanes != 2 && num_lanes != 4)
> +	if (num_lanes != 1 && num_lanes != 2 && num_lanes != 4)
>   		return dev_err_probe(udphy->dev, -EINVAL,
>   				     "invalid number of lane mux\n");
>   
> @@ -923,7 +910,8 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
>   	}
>   
>   	udphy->mode = UDPHY_MODE_DP;
> -	if (num_lanes == 2) {
> +	udphy->dp_lanes = num_lanes;
> +	if (num_lanes == 1 || num_lanes == 2) {
>   		udphy->mode |= UDPHY_MODE_USB;
>   		udphy->flip = (udphy->lane_mux_sel[0] == PHY_LANE_MUX_DP);
>   	}
> @@ -1074,18 +1062,17 @@ static int rk_udphy_dp_phy_exit(struct phy *phy)
>   static int rk_udphy_dp_phy_power_on(struct phy *phy)
>   {
>   	struct rk_udphy *udphy = phy_get_drvdata(phy);
> -	int ret, dp_lanes;
> +	int ret;
>   
>   	mutex_lock(&udphy->mutex);
>   
> -	dp_lanes = rk_udphy_dplane_get(udphy);
> -	phy_set_bus_width(phy, dp_lanes);
> +	phy_set_bus_width(phy, udphy->dp_lanes);
>   
>   	ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
>   	if (ret)
>   		goto unlock;
>   
> -	rk_udphy_dplane_enable(udphy, dp_lanes);
> +	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
>   
>   	rk_udphy_dplane_select(udphy);
>   
> @@ -1365,6 +1352,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
>   		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
>   		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
>   		mode = UDPHY_MODE_DP;
> +		udphy->dp_lanes = 4;
>   		break;
>   
>   	case TYPEC_DP_STATE_D:
> @@ -1381,6 +1369,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
>   			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
>   		}
>   		mode = UDPHY_MODE_DP_USB;
> +		udphy->dp_lanes = 2;
>   		break;
>   	}
>   
> @@ -1529,7 +1518,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
>   		ret = PTR_ERR(udphy->phy_dp);
>   		return dev_err_probe(dev, ret, "failed to create DP phy\n");
>   	}
> -	phy_set_bus_width(udphy->phy_dp, rk_udphy_dplane_get(udphy));
> +	phy_set_bus_width(udphy->phy_dp, udphy->dp_lanes);
>   	udphy->phy_dp->attrs.max_link_rate = 8100;
>   	phy_set_drvdata(udphy->phy_dp, udphy);
>   
> 


