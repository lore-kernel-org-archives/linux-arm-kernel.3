Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A976CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhTVObqHGZbC/8+Qwgzi1SIGB0Oq1yZ2x9f+q6AQfVw=; b=r400oNYCS6C7/s8C6Vdcc7v5YY
	pNyQg77bmK4Q6LuDeGYcZ0HixPqglyOtfGb5g9PMePgvAXw+smyMJ0CuK5Cq0Q9kgnuk8m+2gAcM2
	1k0qf4eSnOXEzXPayKCuoH5eFY8Mzqks6s5PSC27CkJtbbgoWbmRmbMZYv8Hb0Sj8YYavOPw8O+Hj
	xt6HSg4APudIx4afpPCGg6rusWTlf3t0XBUgUz++KbLIa252sVcic7USJBZnKJI8h5BDlZMoxHeai
	Tb4YhgV3NVA2WKnJX/Ypc5rLjEh56o7W2imRHZkTWgmN811fI9nV8CJO+IidD7XYBnW7uCQH1kHEC
	3HabbceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdVI-000000018qY-2WQV;
	Wed, 06 May 2026 14:45:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdVG-000000018p9-3TSZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:45:34 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso3519098f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778078733; x=1778683533; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhTVObqHGZbC/8+Qwgzi1SIGB0Oq1yZ2x9f+q6AQfVw=;
        b=anCjFYZQqOZkhjRlb/N7IFT7j3KcLSQTE6v/t9veBY8glqrRaAn/Pf/69Xg8DyRDqG
         zYJu+u5ujlhZ/LKaHdCRrCvM0ztwugPEuQoLXhypVKRiGPKL4wlujnsOoKZjr9QtqtRR
         KtJdu4mYJ093FfBMb536b80nJuhpAbo+t521bWb8xNhDtJGQAqeFev8TYbuNX41W2st9
         HTtIhvc9VPf5NCcVCRrGFhYvA4eRfrWjGIHQIdY2T4jO8H+BHTE9PZbthvBkpoJv36Mm
         h2FHB5ZeA2I1EO/Re39BNT2vWD+mUjNVh9Q13fLBnMuiU1D4IYc/dLtKkpXkjG120k/6
         4gEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078733; x=1778683533;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhTVObqHGZbC/8+Qwgzi1SIGB0Oq1yZ2x9f+q6AQfVw=;
        b=G6HpzYUJs2jBszydCDnML88OzHardoCRiO4NdUFxb82eFbVOiKKRBNi0CAd7COBbeJ
         1+VNm/v/gpfnmgd+UZBSjOwDamHb9pgxbXMJJPqqctrgc1boM2NB3+RooOiIYl7Z2bqP
         oHaeZAP5DX9yOGJmRed7EzmhiD2HQPMM/iSlE6pLrS4koUWxA5hI6NVAw695dlqASSch
         w7/gFYD7U92eAti+PA6BNpxHzj8DzqjtN8EDoYx4hLVf6DZgqMyYZ29FzOJamY3BZ/4B
         Vh1UK9RRd+hx8WCzwScxkLnyUvQUp9dLJAuQl+ESVLzWP1iZG+V1I0Ryo2T3YA3NhFa9
         rEWg==
X-Forwarded-Encrypted: i=1; AFNElJ/CniHMDp8ryyRR1j+7HMYaWQR4UK1YQSKkAzVLKiKUzbf9Ed+NFe7DXj0LEm69gYRfSAD6mGppS9fiuvxbdoJt@lists.infradead.org
X-Gm-Message-State: AOJu0YynmU3iF3kCrAXUQ9aeUc81nN5AK8FqZQy+1xiILTpSYZCbocDn
	up70fXrpzG3FMF3acVHL64FyLpZbE+GTrV8KTYabwlngGKhPgGSuO0aFjLB1JkjcXD0=
X-Gm-Gg: AeBDietMnbTFw5f/5R2hjSIMD8p3cre47BikSumaHlxhaVr35bC6mJCvqXJIM8K0xA2
	wnsjIYqUAe7+c2q8cB8qAZIvj2ceQFmXqb2HiMTOAZkceLkfrd/7Axeh+fsFsm1poSgTIyAuuGy
	bKwa7Nvz0TPStOXR6f0If38gwEh0drNXJl/GU+kZ6rnszqaqfvQg3mYYiwCOPokyNxFcKtrHpOX
	byBzVYqanmjn7t3LVawV1r7t8LN8w8pYlC3VseKnS+gC+6emhowLzq7OdkvuPecjOtXNO/QQeQR
	zSkOViUbDA5yur2IU4E1l6r10lgnM3tidfnefuxUplyP4oTo6SbavxdGT6lPk/5QZ3+ZepGxrMK
	X+MzkyQsIFAhmMco34pg2zyk13no78YMr3EaL3D4OwKpeZ20s79REM8jKLGTWdnkaX2RsaYdUQc
	kdE2XK9GyW0zswleBn2rZMv/5hKwSBwTV+ZzzA1JhyfnUrXQUtWCedKiwuCgCSQ/9/szAfd1bHm
	d+NhQfJFYNO82Hwog==
X-Received: by 2002:a5d:64e3:0:b0:449:cfea:ca91 with SMTP id ffacd0b85a97d-4515da96254mr5892163f8f.37.1778078732399;
        Wed, 06 May 2026 07:45:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm12906801f8f.32.2026.05.06.07.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:45:31 -0700 (PDT)
Message-ID: <4d41044a-1b09-4d78-a99d-53c0cd1cc539@linaro.org>
Date: Wed, 6 May 2026 16:45:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/5] phy: rockchip: inno-usb2: Add clkout_ctl_phy
 support
To: Heiko Stuebner <heiko@sntech.de>, vkoul@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, jonas@kwiboo.se
References: <20260505170410.3265305-1-heiko@sntech.de>
 <20260505170410.3265305-5-heiko@sntech.de>
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
In-Reply-To: <20260505170410.3265305-5-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_074534_929702_A67A6E0E 
X-CRM114-Status: GOOD (  26.04  )
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

On 5/5/26 19:04, Heiko Stuebner wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> The 480m clk is controlled using regs in the PHY address space and not
> in the USB GRF address space on e.g. RK3528 and RK3506.
> 
> Add a clkout_ctl_phy usb2phy_reg to handle enable/disable of the 480m
> clk on these SoCs.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 47 +++++++++++++++----
>   1 file changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> index 7cec45192393..d8879fcd4291 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> @@ -179,6 +179,7 @@ struct rockchip_usb2phy_cfg {
>   	unsigned int	num_ports;
>   	int (*phy_tuning)(struct rockchip_usb2phy *rphy);
>   	struct usb2phy_reg	clkout_ctl;
> +	struct usb2phy_reg	clkout_ctl_phy;
>   	const struct rockchip_usb2phy_port_cfg	port_cfgs[USB2PHY_NUM_PORTS];
>   	const struct rockchip_chg_det_reg	chg_det;
>   };
> @@ -228,6 +229,7 @@ struct rockchip_usb2phy_port {
>    * struct rockchip_usb2phy - usb2.0 phy driver data.
>    * @dev: pointer to device.
>    * @grf: General Register Files regmap.
> + * @phy_base: USB PHY regmap.
>    * @clks: array of phy input clocks.
>    * @clk480m: clock struct of phy output clk.
>    * @clk480m_hw: clock struct of phy output clk management.
> @@ -245,6 +247,7 @@ struct rockchip_usb2phy_port {
>   struct rockchip_usb2phy {
>   	struct device	*dev;
>   	struct regmap	*grf;
> +	struct regmap	*phy_base;
>   	struct clk_bulk_data	*clks;
>   	struct clk	*clk480m;
>   	struct clk_hw	clk480m_hw;
> @@ -312,15 +315,33 @@ static void rockchip_usb2phy_clk_bulk_disable(void *data)
>   	clk_bulk_disable_unprepare(rphy->num_clks, rphy->clks);
>   }
>   
> -static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
> +static void
> +rockchip_usb2phy_clk480m_clkout_ctl(struct clk_hw *hw, struct regmap **base,
> +				    const struct usb2phy_reg **clkout_ctl)
>   {
>   	struct rockchip_usb2phy *rphy =
>   		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
> +
> +	if (rphy->phy_cfg->clkout_ctl_phy.enable) {
> +		*base = rphy->phy_base;
> +		*clkout_ctl = &rphy->phy_cfg->clkout_ctl_phy;
> +	} else {
> +		*base = rphy->grf;
> +		*clkout_ctl = &rphy->phy_cfg->clkout_ctl;
> +	}
> +}
> +
> +static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
> +{
> +	const struct usb2phy_reg *clkout_ctl;
> +	struct regmap *base;
>   	int ret;
>   
> +	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
> +
>   	/* turn on 480m clk output if it is off */
> -	if (!property_enabled(rphy->grf, &rphy->phy_cfg->clkout_ctl)) {
> -		ret = property_enable(rphy->grf, &rphy->phy_cfg->clkout_ctl, true);
> +	if (!property_enabled(base, clkout_ctl)) {
> +		ret = property_enable(base, clkout_ctl, true);
>   		if (ret)
>   			return ret;
>   
> @@ -333,19 +354,23 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
>   
>   static void rockchip_usb2phy_clk480m_unprepare(struct clk_hw *hw)
>   {
> -	struct rockchip_usb2phy *rphy =
> -		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
> +	const struct usb2phy_reg *clkout_ctl;
> +	struct regmap *base;
> +
> +	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
>   
>   	/* turn off 480m clk output */
> -	property_enable(rphy->grf, &rphy->phy_cfg->clkout_ctl, false);
> +	property_enable(base, clkout_ctl, false);
>   }
>   
>   static int rockchip_usb2phy_clk480m_prepared(struct clk_hw *hw)
>   {
> -	struct rockchip_usb2phy *rphy =
> -		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
> +	const struct usb2phy_reg *clkout_ctl;
> +	struct regmap *base;
> +
> +	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
>   
> -	return property_enabled(rphy->grf, &rphy->phy_cfg->clkout_ctl);
> +	return property_enabled(base, clkout_ctl);
>   }
>   
>   static unsigned long
> @@ -1336,9 +1361,13 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
>   
>   	if (!dev->parent || !dev->parent->of_node ||
>   	    of_property_present(np, "rockchip,usbgrf")) {
> +		rphy->phy_base = device_node_to_regmap(np);
> +		if (IS_ERR(rphy->phy_base))
> +			return PTR_ERR(rphy->phy_base);
>   		rphy->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,usbgrf");
>   	} else {
>   		rphy->grf = syscon_node_to_regmap(dev->parent->of_node);
> +		rphy->phy_base = rphy->grf;
>   	}
>   	if (IS_ERR(rphy->grf))
>   		return PTR_ERR(rphy->grf);

The logic is not easy to follow, but it looks right.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

