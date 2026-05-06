Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762BECD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MideM2n02iIKTDCku+HSAt6i6mJ+89mrIgdH74VDGvI=; b=eYK5S9gkriEeQ4I+X+RFQSUfEK
	5WxIrPLgMd63f7lAkwOma9tw6OiBzdURY4gBfnBSp/3epuZcRAaEYv0oi9tvTpQq0H7TOmWxUhVVU
	b1jzy1/5QpaMNrKv6/Bm3YF36WY75aP0O78+GMldPP7Prr1Ut8OHjwAYsKCeeVRBeefWn2wt8owdP
	B3IE1ZvQMlGF7oSZyR+/IliMqaGX68RPsyghx1rUY2cOljmKNNcrZELOwsQqQElfMZd1/3ZCSGv6f
	LOFSfDMVo7oF/n/wIJM5Abyu2Vr3+cF7u9jCSR55OxcNl47bg33fKFRXRo1gfc1Mxw+nxr/zUNK6D
	uQ+dGIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdfL-00000001CC9-27sc;
	Wed, 06 May 2026 14:55:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdfK-00000001CAu-11Ww
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:55:58 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso50066565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778079356; x=1778684156; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MideM2n02iIKTDCku+HSAt6i6mJ+89mrIgdH74VDGvI=;
        b=gy5y+HQm9JwXSZOys28Jkf0g0SXhQCk+V7lT13pWwM5EVooeJMkwsmbdCYU5TH8jGY
         RlPWYZeHunYWKOkQr4bvdB1bW+5b8g43rtnJ+7xbmM1X7ZxqrIOdL1lH5Aw1fq+M7feH
         E27px2eQOTbemdYR6T90UMexwxqXq2+d/tU566WwvIbVbsC37IlY05vxVYxGHp/tL0Ta
         3XG5dixf+MFwowNx3ogni5GxRVHlLds7HH7DCBU/lia8Eg9xaE1tDV3VogJJ09Ot1PxA
         /vWdqg+t5kpRUCKh+HUyrADXWtBxjsxKB2LCL2ERS0siwzz7bU0rbClQVo8UQhNBbLdN
         QgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079356; x=1778684156;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MideM2n02iIKTDCku+HSAt6i6mJ+89mrIgdH74VDGvI=;
        b=T0p6FEhr0GPtRjPPX6RH9dxY5HaUz82h8u8rBezdvuCiShpkvFUaSEdX0WWeQWU3e9
         tWWqb8IFgD9pEk8RJCJeItw/cXG0iY0kM7jNNFAXu+VyeNjhK3C8hR5PIw6/VLqb+15t
         mnlEE6Lrl22WgrF1Op/YBEVneeGC+j0n7xUZMhaO0x6lsYF8+kMw3nqnKJs4Xyn0QDWt
         zPQgcTGXYk2fRjQjO8OA4dxHILGCLvw5HmGGooWZSAfDHnLqw1Lepjs7GEYtYVXZFCQa
         ww3se2OCS+nZQUKOE0WGOU5TrMCshfKVdsN94MF55LQ0uxMMwZxgc4KMiYRMkRVaSqJG
         Ly9A==
X-Forwarded-Encrypted: i=1; AFNElJ/qwVOSX/+ykQRVuJdmx0h5iIsauuVRRwrUncPYYQdMaDTvNianjRTO5xSeGUdkEPXpByhs2xu4+Oe09nAylfu1@lists.infradead.org
X-Gm-Message-State: AOJu0YwNHFqb0Q9QxQSKN6UefI5SBrjjXbZPk0FP+WKIbmv3HOT+O/dg
	Bc4IHcEtwSi4O2lLBZns9/djtEg0gO8YjPI0HZqEtW+62mThzxE7agODKN4lcOaBYeo=
X-Gm-Gg: AeBDietdHQ8zgOnpfVsvBwEBVqPV+2AViQ0/WCf8CUxWTmZbpOekmuRfVXHsvPG3lXd
	vVD+HGlezJvJgbAp9XYP8KiXDHJfc3aErS1j5E1wjS/xwa7m4p3M2uursLdQlf0HCpoqUN/qV/O
	qOduXNNbTGkcj+WXMIDlYJL+7Q6XQstUug7fbCIQWgbz2DcvCAIjKbk01YjJwCqIwOC4s3Y/Z6f
	jdS64GKFcbNZUCyXkebpngtTIqTS+nHBXY1wl88ogNZb3MQ8w7wmAWnvJyjhps50BljW51lDRwD
	w4EKSqW+7TogLqZEXHzsE+27KKhC8mqif0vm3HJFER/LMOB23d47JU9pRZTCekDcrbbXzOAv5OR
	UQBS8jSp17PNyVUi/q8deagKt4NOO0XD6Sd6uyLDnVpwzDLGhWvCLCJFkUf0N74ZXXYly/+gdnl
	dX5q2wEzAGeQ/QPaf9k3/5dO5xMLedJh4yPdXFkUDTmA1dzKv80kdPUEwLw7S3q77OjsRJhX+6i
	MbRUUE7hBvbyFGfXA==
X-Received: by 2002:a05:600c:a317:b0:488:a977:8d6 with SMTP id 5b1f17b1804b1-48e52bd4f32mr44117515e9.19.1778079356162;
        Wed, 06 May 2026 07:55:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530a67dcsm29024575e9.2.2026.05.06.07.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:55:55 -0700 (PDT)
Message-ID: <18fb5696-8eb1-4d71-a35a-a26c3a8445f4@linaro.org>
Date: Wed, 6 May 2026 16:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 10/16] phy: rockchip: usbdp: Cleanup DP lane selection
 function
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
 <20260428-rockchip-usbdp-cleanup-v4-10-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-10-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_075558_335916_4849B007 
X-CRM114-Status: GOOD (  14.86  )
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
> Use FIELD_PREP_WM16() helpers to simplify the DP lane selection
> logic.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 28 +++++++---------------------
>   1 file changed, 7 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index 1bfc365e2b2c..beab20e4c512 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -550,30 +550,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
>   static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
>   {
>   	const struct rk_udphy_cfg *cfg = udphy->cfgs;
> -	u32 value = 0;
> -
> -	switch (udphy->dp_lanes) {
> -	case 4:
> -		value |= 3 << udphy->dp_lane_sel[3] * 2;
> -		value |= 2 << udphy->dp_lane_sel[2] * 2;
> -		fallthrough;
> -
> -	case 2:
> -		value |= 1 << udphy->dp_lane_sel[1] * 2;
> -		fallthrough;
> +	u32 value = FIELD_PREP_WM16(DP_LANE_SEL_ALL, 0);
> +	int i;
>   
> -	case 1:
> -		value |= 0 << udphy->dp_lane_sel[0] * 2;
> -		break;
> +	for (i = 0; i < udphy->dp_lanes; i++)
> +		value |= field_prep(DP_LANE_SEL_N(udphy->dp_lane_sel[i]), i);
>   
> -	default:
> -		break;
> -	}
> +	value |= FIELD_PREP_WM16(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel);
> +	value |= FIELD_PREP_WM16(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel);
>   
> -	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg,
> -		     ((DP_AUX_DIN_SEL | DP_AUX_DOUT_SEL | DP_LANE_SEL_ALL) << 16) |
> -		     FIELD_PREP(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel) |
> -		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
> +	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg, value);
>   }
>   
>   static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

