Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323B3D29DE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 08:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/MQilqGTab22ugg1CT5X4KmAKEpSnq+i+RZKZLJx6I=; b=1hgmuarCuLzAM+HBrtZpQJAY4m
	7JQcHH8KNG1CsOLlVDaWpzxaia3xZZmOzaht7+ARRBM/ym5r0HdYL5PfZRhyr1GMQlF+Y3t7z/Jyo
	1B+5IxSbCa4bedME0EbVbdmG7jjYyG8zDUd2dQZ8ycwsBJu2szHrJVKD6SGwSQnGkwQ54zL0Szmcz
	m7tfeE1ku+ajzRFaQsV7nJ027Mmx/hfguxzuHzP3Q/TF7ZBEBc65AGXHRhAY0y/c+guM8IyoIWbqq
	oBrCON+DKp57XOA+si0NUK43JKK7V5CD6JY3/8N9+jewvNU0/QVYUu1TrIC6aWbpcVeSUZvz03qd9
	1pyRWtEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZVT-00000006i4M-2mah;
	Tue, 13 Jan 2026 08:12:03 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZVR-00000006i2r-2mIa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 08:12:02 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-42fed090e5fso4068373f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 00:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768291920; x=1768896720; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/MQilqGTab22ugg1CT5X4KmAKEpSnq+i+RZKZLJx6I=;
        b=xrerd7SOs+54/3fJp5P0hWG+NWb181dEaxyjyQVJSwiz8p6o+P4nkM62D1Q+1gUiVT
         jnDkj4KmOhT0XlLUITWAFVDbe3+SLE4gx7dH+j2V8t98vWMOjlmJvIg0XUy9FhZ5q7fi
         GJ8ToPQJlMaLY/lIR8RllxoWXToeHFrQU5x6GDGrojGPsPye2ejXLNgqrEkuE6CrmwnT
         I9bIMg/UmI1mtCKaTnSTKXd4htKYXceEqw6iotlk7SzEtq5Cir56hMvwpsHhdvegsPDp
         VibXDZPpFEzgj02tgqfonjD0A9hGZKKtB3/AJ+hnVqRq9KBNdrprIIojU4GUwv7MiRU5
         baWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291920; x=1768896720;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/MQilqGTab22ugg1CT5X4KmAKEpSnq+i+RZKZLJx6I=;
        b=cNsHMGZd2N5ST2M9MwzH8PR0PQzj0QWVCIVTHEGc+DtB/oP7BzhgjVK35k6KdBHSWu
         YCqgKKcMqGV8uh3tX/wsTB8RIWG2IT5lDU0G5FKH83EcciYf1pi361zNJ/IyssuJgQjm
         cvsbEwN9bxemtnQ9aHgcmEKhbA3aBD4fmOgs49FBIb3newBtZe1m5RIBfuFztUByKNlm
         QLqE0UgroPQjZNtHMRvTYsgRiAF4BvcqzJ4o0Yl7DHX1YBvKZPIe2qA4XrDoEfLwLIeK
         LHeWiV4tuWnMFu33C4+5KjPY4796OZZY3uuRXXdl1njj9XOv6mbvzZeXwxRlxZWSfGs7
         Q9FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHlgWZYbzBfse/4Edg9KZUQKWJ0E/+iY1quKgZYKtgeaX4g/pk18GLzoyajzX6CU2sZDpF59iG78kmHuXGYYTl@lists.infradead.org
X-Gm-Message-State: AOJu0YyimCplWfzyVU1WnkYr2LK0QQIQgPL+ncaQczalADRbs8H09as8
	onRI4km4cSMQgT2840FD6+UkszZklWAZjeuXRoXxVIm3XElvh5hMyme9d7aSec2I4h0=
X-Gm-Gg: AY/fxX5vuW2j1KXadFI3lDRfcl/eYRn/LyxdU0j0aNdqA7s21ehJYcBbbkCbcpc2B/7
	ieDKe7zpJclMb4aSvMKVktsWfX3eAwgbrxqk34qCRPCVPr3HhawiEPruJCMzKYMukbi+qnIbrKo
	LyqTzZBylow9hYhP9uIJe/HmtG9Dxsg3AGxieApyQAJR9qjO2rRbTyvh+SnupWLIiUHA9U5rtLS
	6rt1xm9WAZW0oD1lIOp2mSSphn8TydZgCiZEhON3XpKmVv9OSOpa+f/wD71EnA6JAl/N8fjAlM+
	d9DKPQTPj8UOEptZ2YhcX0T9VmS5Jny307SHl+zpBOmEdY0/bIhKfHlzLtKhPkMpgGEJCPPKBMj
	97vWwechAeJkPEGCW8mwdYDetPjr6Z+58lft0iSy4qGdo2e8qP4USlxhvlmp6jViLjNd674/1sc
	HdN8EFZJSLqxGHdgiJLAr/31UXeEmi3tBPIye+97o=
X-Google-Smtp-Source: AGHT+IF/E4DZmoNj85KKl/suQ05NfvV4pzSTyO36+Rt7tlIRyvZ+VngI5jHuau30KK8jUlb3532Tjw==
X-Received: by 2002:a05:6000:4013:b0:432:8585:6830 with SMTP id ffacd0b85a97d-432c3760f78mr24536676f8f.45.1768291919604;
        Tue, 13 Jan 2026 00:11:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768? ([2a01:e0a:3d9:2080::fa42:7768])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm42043981f8f.4.2026.01.13.00.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:11:55 -0800 (PST)
Message-ID: <bc3d3416-2f7c-4f4a-a90e-2b3d086ff568@linaro.org>
Date: Tue, 13 Jan 2026 09:11:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 03/11] phy: rockchip: samsung-hdptx: Fix coding style
 alignment
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260113-phy-hdptx-frl-v6-0-8d5f97419c0b@collabora.com>
 <20260113-phy-hdptx-frl-v6-3-8d5f97419c0b@collabora.com>
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
In-Reply-To: <20260113-phy-hdptx-frl-v6-3-8d5f97419c0b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_001201_724610_33D867FB 
X-CRM114-Status: GOOD (  12.88  )
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

On 1/13/26 00:20, Cristian Ciocaltea wrote:
> Handle a bunch of reported checkpatch.pl complaints:
> 
>    CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 89710066d70c..3f8a7f4f5cd8 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -1624,11 +1624,11 @@ static void rk_hdptx_phy_set_voltage(struct rk_hdptx_phy *hdptx,
>   		regmap_update_bits(hdptx->regmap, LANE_REG(030a) + offset,
>   				   LN_TX_JEQ_EVEN_CTRL_RBR_MASK,
>   				   FIELD_PREP(LN_TX_JEQ_EVEN_CTRL_RBR_MASK,
> -				   ctrl->tx_jeq_even_ctrl));
> +					      ctrl->tx_jeq_even_ctrl));
>   		regmap_update_bits(hdptx->regmap, LANE_REG(030c) + offset,
>   				   LN_TX_JEQ_ODD_CTRL_RBR_MASK,
>   				   FIELD_PREP(LN_TX_JEQ_ODD_CTRL_RBR_MASK,
> -				   ctrl->tx_jeq_odd_ctrl));
> +					      ctrl->tx_jeq_odd_ctrl));
>   		regmap_update_bits(hdptx->regmap, LANE_REG(0311) + offset,
>   				   LN_TX_SER_40BIT_EN_RBR_MASK,
>   				   FIELD_PREP(LN_TX_SER_40BIT_EN_RBR_MASK, 0x1));
> @@ -1638,11 +1638,11 @@ static void rk_hdptx_phy_set_voltage(struct rk_hdptx_phy *hdptx,
>   		regmap_update_bits(hdptx->regmap, LANE_REG(030b) + offset,
>   				   LN_TX_JEQ_EVEN_CTRL_HBR_MASK,
>   				   FIELD_PREP(LN_TX_JEQ_EVEN_CTRL_HBR_MASK,
> -				   ctrl->tx_jeq_even_ctrl));
> +					      ctrl->tx_jeq_even_ctrl));
>   		regmap_update_bits(hdptx->regmap, LANE_REG(030d) + offset,
>   				   LN_TX_JEQ_ODD_CTRL_HBR_MASK,
>   				   FIELD_PREP(LN_TX_JEQ_ODD_CTRL_HBR_MASK,
> -				   ctrl->tx_jeq_odd_ctrl));
> +					      ctrl->tx_jeq_odd_ctrl));
>   		regmap_update_bits(hdptx->regmap, LANE_REG(0311) + offset,
>   				   LN_TX_SER_40BIT_EN_HBR_MASK,
>   				   FIELD_PREP(LN_TX_SER_40BIT_EN_HBR_MASK, 0x1));
> @@ -1653,11 +1653,11 @@ static void rk_hdptx_phy_set_voltage(struct rk_hdptx_phy *hdptx,
>   		regmap_update_bits(hdptx->regmap, LANE_REG(030b) + offset,
>   				   LN_TX_JEQ_EVEN_CTRL_HBR2_MASK,
>   				   FIELD_PREP(LN_TX_JEQ_EVEN_CTRL_HBR2_MASK,
> -				   ctrl->tx_jeq_even_ctrl));
> +					      ctrl->tx_jeq_even_ctrl));
>   		regmap_update_bits(hdptx->regmap, LANE_REG(030d) + offset,
>   				   LN_TX_JEQ_ODD_CTRL_HBR2_MASK,
>   				   FIELD_PREP(LN_TX_JEQ_ODD_CTRL_HBR2_MASK,
> -				   ctrl->tx_jeq_odd_ctrl));
> +					      ctrl->tx_jeq_odd_ctrl));
>   		regmap_update_bits(hdptx->regmap, LANE_REG(0311) + offset,
>   				   LN_TX_SER_40BIT_EN_HBR2_MASK,
>   				   FIELD_PREP(LN_TX_SER_40BIT_EN_HBR2_MASK, 0x1));
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

