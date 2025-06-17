Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC172C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 09:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nCKA2NBdzp2xLG4y6buu2qcE4WyaNmgLnyxQpYpCxU=; b=GyEta8KHkYbPZtHiWbpsm3jMQX
	ViMRDKjTYUqhBzLED3F6tq7Ye8P+9XH2AF8vjdFEXeQ5bDf+A68KPoDKDS7nKPxiZHvFAVnVrZX6V
	wxbOU0jXhVyOQyNyXNDu09X6YS+P4Cp/7T2LeNyDiWEIJ5EcU4pnLJbrYLIM3ZpXvdsb6KsKsFfpr
	30wl4h+iYN1m7/TBusnO+nTVAD0rDwqYKuDG0TMGSsFM1mpJ9vTrLliNvKuohy/aiMbaMXr4FuBoF
	Q8b21pk4yjV1IUZUjM48wtvFuXi4QMABemWWz+9/A4jxBu03bw3dwbY6nsnk6Ibyt4/h55CP/rA3f
	aBFiJbtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSzA-00000006pYr-2uWg;
	Tue, 17 Jun 2025 09:52:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSkA-00000006mNM-3zbb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 09:36:40 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so40287745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 02:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750152997; x=1750757797; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nCKA2NBdzp2xLG4y6buu2qcE4WyaNmgLnyxQpYpCxU=;
        b=Ub5ty6p0v0VsLGdwyikGfa8bb7sUJ6mlUYCSZcfKUD82d/qEKTJIFQrCeHgLdz+x2z
         3NrOjPKrx7eAFFF7fDamQv05/Fwfmz7yX4u6S6c9TRHNTxdkCeFoB/o73y6ov2ryX/Rq
         L9FOycn6rXcK8ZPMT18jXciGRx/GB2nDsUjlf5MJd8KEftwabLd30wnQqwEB9e5k5aqb
         kBniDBMcwYdpusV5IIMNWTuoZBcFppH30lPOS+CtfWr/7RDfgvtfGZu+jA614VG6mb3c
         fR0tpKKCNP0IshgnqvNCwzVGlB/wUc03RF8b4ytGqGPnzmjxq1TfhNjzFXzWepsuf/GM
         CIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152997; x=1750757797;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8nCKA2NBdzp2xLG4y6buu2qcE4WyaNmgLnyxQpYpCxU=;
        b=kzjpN95RWP+OlGpMq74KrGIMB47ADObR0r2UVAurX3O21/7DFDFW+t7FpbAYS8/l0b
         ugCus12IRkO5RibdtW1DcuFeo78nHuxx2tPY5RKy5X6OQiqkrCiX1vc8zuo1y+t4l0JZ
         26KQCexW8Ia2XCSjpdhyXZmx9PdQWlv4K5B8R48NFnTMDP4ItoU3i0Y1WOFHj1jP/pXR
         56PRkvYbAPziOH0QXTDLiTVTHi74r8TfX9CoEVy3ZR9UwWl9OzD7LybU6bFbjb5px/Uf
         Lmv3BiNlFIgN/mM/lA4GRohAwsnrM2e3Iojo1J9Ot7tpAo8chEfIuQEq/N6ASOhUap0X
         IOoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVlsWd6WpCqr6J/M3zXtCWYJ48Rq7+/fjsehNi6zIAQ9o9oT2JtGDs9nSUKRkabVhOuHnz1VU0RpRSvDUOTVyp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2XiWmrk84tKBKoD+RPfHkkvmURA9RYIjKHTRlgSb4eE3rbGh9
	f9j19rp4GoDImGtBgBJlk+03UivLQpxChj8hUP4HKuLqStG1qczFBn6x7eqj9TeO7kZSo6oQ64R
	H2ND90Mo=
X-Gm-Gg: ASbGncvP6qTrsIE3V6vfRuogFajPZ1v77HL9coQC0W+BbMW70/MOM+utf+c612ec+pd
	IrtDFWJks9GQF8hcb2rGCPS2PDveLCSdqZBG+rjGvRROfBRO2WZK0mKKZizr8ZwJtX8/qVdR/DZ
	1IDWmSkisHhFnxvsIHnY0+oopCs9UUhleMYwvp29iZIekUA1F6clwHOOPOy8ziYrM9qHbmJUzNx
	GQuIH28DXghOcCC8usgqspw8DRvK9RWHydraCg1q9cyeDStBgIpFHOk9FPAVTjPGtzNmhGckTIf
	3+UDAeRykvHyWTZdZn36/Uavtrwd88jt48lxZJxjsUIiv24590tGecG4xMOH23YMXpsRAflNgJU
	JaC8vSSqaUtEau0gAXvparHA7bVvxelQORPrsGjI=
X-Google-Smtp-Source: AGHT+IFPR+wvTS8UzP7Kb30Ior0wbTC/3kLZgaa4u2lkQwq07xOKfLNrmGgBLem/dzm7DJB8DUeBJQ==
X-Received: by 2002:a05:600c:3545:b0:444:c28f:e81a with SMTP id 5b1f17b1804b1-4533cb4c99amr107660035e9.27.1750152997407;
        Tue, 17 Jun 2025 02:36:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3819:3250:4f73:db31? ([2a01:e0a:3d9:2080:3819:3250:4f73:db31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4c969sm13226726f8f.85.2025.06.17.02.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:36:36 -0700 (PDT)
Message-ID: <ac629489-5086-4cf9-80ed-f5e56b132cf4@linaro.org>
Date: Tue, 17 Jun 2025 11:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/5] phy: rockchip: phy-rockchip-inno-csidphy: add support
 for rk3588 variant
To: michael.riesch@collabora.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <20250616-rk3588-csi-dphy-v1-4-84eb3b2a736c@collabora.com>
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
In-Reply-To: <20250616-rk3588-csi-dphy-v1-4-84eb3b2a736c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_023639_000386_2DE31133 
X-CRM114-Status: GOOD (  21.40  )
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

On 17/06/2025 10:54, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip RK3588 MIPI CSI-2 DPHY can be supported using the existing
> phy-rockchip-inno-csidphy driver, the notable differences being
>   - the control bits in the GRF
>   - the additional reset line
> Add support for this variant.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> index 75533d071025..0840be668bfd 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> @@ -30,6 +30,8 @@
>   #define RK3568_GRF_VI_CON0		0x0340
>   #define RK3568_GRF_VI_CON1		0x0344
>   
> +#define RK3588_CSIDPHY_GRF_CON0		0x0000
> +
>   /* PHY */
>   #define CSIDPHY_CTRL_LANE_ENABLE		0x00
>   #define CSIDPHY_CTRL_LANE_ENABLE_CK		BIT(6)
> @@ -115,6 +117,12 @@ static const struct dphy_reg rk3568_grf_dphy_regs[] = {
>   	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3568_GRF_VI_CON0, 1, 8),
>   };
>   
> +static const struct dphy_reg rk3588_grf_dphy_regs[] = {
> +	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 0),
> +	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 4),
> +	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 1, 8),
> +};
> +
>   struct hsfreq_range {
>   	u32 range_h;
>   	u8 cfg_bit;
> @@ -373,6 +381,15 @@ static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
>   	.grf_regs = rk3568_grf_dphy_regs,
>   };
>   
> +static const struct dphy_drv_data rk3588_mipidphy_drv_data = {
> +	.pwrctl_offset = -1,
> +	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
> +	.calib_offset = RK3568_CSIDPHY_CLK_CALIB_EN,
> +	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
> +	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
> +	.grf_regs = rk3588_grf_dphy_regs,
> +};
> +
>   static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
>   	{
>   		.compatible = "rockchip,px30-csi-dphy",
> @@ -394,6 +411,10 @@ static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
>   		.compatible = "rockchip,rk3568-csi-dphy",
>   		.data = &rk3568_mipidphy_drv_data,
>   	},
> +	{
> +		.compatible = "rockchip,rk3588-csi-dphy",
> +		.data = &rk3588_mipidphy_drv_data,
> +	},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, rockchip_inno_csidphy_match_id);
> @@ -435,7 +456,7 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
>   		return PTR_ERR(priv->pclk);
>   	}
>   
> -	priv->rst = devm_reset_control_get(dev, "apb");
> +	priv->rst = devm_reset_control_array_get(dev, RESET_CONTROL_EXCLUSIVE);

It would be preferable to have the names of the resets lines and use devm_reset_control_bulk_get_exclusive(),
and probably add the reset names to dphy_drv_data

Neil

>   	if (IS_ERR(priv->rst)) {
>   		dev_err(dev, "failed to get system reset control\n");
>   		return PTR_ERR(priv->rst);
> 


