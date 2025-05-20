Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99E7C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 07:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PraJM74r5citST/Q0Ihg9JGi75iqGhVSp5Hm6UV5dqE=; b=mjsQZZqQWrE+4VukvKAi1ThyG5
	YNfMWJfLRf+8sdAtKxTOAS1ZdRqKMMcTZGp/dMqvWGp9EzpMDxVmtY33+cqhgZDbw4cmDU9SGyhkV
	1W7gYv8T2nBLlIiIRaThfICUy3enVkT74p974HdL8w/sRew11W21CCNK1kwr4WCj66+Q3qIQ+S8Wx
	iCTvKPkedbIUVH3N3m+Sg6a/3CQarkFDHcbNaM5HGLBHGAjmfmVM078c+QUJJHMlEJ7MQfJlV2fh7
	YJTRP1B3zMEeXzLhRLCsl3kJTae+jkpK5rVh1kB+Nx0FTjrmGqBZKwCBeJ64/+hiJ+f/j0k9b7qp0
	pPWezZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHHLI-0000000BqVY-0AfE;
	Tue, 20 May 2025 07:24:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHHJ3-0000000Bq9Z-2RKX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 07:22:34 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a375e72473so832157f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 00:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747725752; x=1748330552; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PraJM74r5citST/Q0Ihg9JGi75iqGhVSp5Hm6UV5dqE=;
        b=BUFmmmsn0RpDBIAaEFraWiVOzmzusCIz5z1Bb2l/c/MR9GkSNes71eUFhGBnKPBvyb
         GDY+8M8H6Olui7QJZzkbK+Q27rrDEIxOzTlGnyGTczfOveoEVIVykAADaQ3UCo1p6tgr
         W18Iwc/ugMyEi5VqNA5+1HO2cPl9/cZKjlV1cqtMb0d9xj2GnS3ZQ3P4bbpUve8wH7tZ
         +JMjcl2C3H5Qk8ryrXe4xFxOlDaXze1plSrnmP+OP8RQ7v5D9k5FC7yeQ6Tkksjn5PHX
         6fn6O+a3BW2IAU1LlngT/jiuEJc+bQ6qf43+HEUdc5m2nEri/JjH7+pfKPz8iV/SLP6k
         S5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747725752; x=1748330552;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PraJM74r5citST/Q0Ihg9JGi75iqGhVSp5Hm6UV5dqE=;
        b=Y14/GhaRRdd4HfaQie2/LgXkP+kmJo7xqf8ksvHEnVveW36iTEUDRzoI3v24Zmr1J3
         8PnIiSv+GXTIylC0Qo5TvjiavVMBmQb412R+aFAPYEd6RgDqgTTWGPPHC3M7IS15+MuB
         LvdAjeaAKf5ktlbTe1RlIpkHcgajF7lZ5S8JY9QNx9pMkxXS1xTnzunoF/hrelGBJZ2L
         tWUM4696AAuiDTnxn2RbDtFrlQWJCARzxo30bgOr56mu0apxQDg7wZoiqd10rpdfrZV+
         A0bKqqkWYvPepbliOIsockQQNqFMLodFNd91p7LiPKlvv9OqWYQKTfRDagFehseUb3Jx
         vazg==
X-Forwarded-Encrypted: i=1; AJvYcCXMbhi9jaBG4oL7x+5kjuBpXG/XGVuE02d7C74LKa/ZBt7gfi41Db6a85DfMG3YMuSgylbrx/bvY4lj+RF3QRnQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/0nteiWRHCNhiq6FLW/6fWJgIMYEBKB4uL/xWbUEvSec5v/GP
	wZJ6s92P69m1ed4xeBpUt7ouQ3lofMwP+J5LLg46URTAQCOrFlBjBnAr+CjVmpMFfzU=
X-Gm-Gg: ASbGncv7wZD8VxEZnxXyNmiU44sI6HlXUQadmNJNOSVBi0SLG6/TygQHv627BgtIc4G
	JpskillALRu7zVmw9EF9Yr32ST2p2tgtNRW024NGhTizi05KRkvv7+6ZsGdkWC0TSEN3iwsJUvA
	q4AEDv0xhBwYQbjLo72t1hDSUE4ukEJ+kN315Yf38dLNODDsWO68XZsomhPJu2skKNwYR0YEULN
	XzSL0A27N4jmD/MHVWb2Kycd4JhSw0J7I08nrhsa1Adp/6yCzKPLxxqJHoHkhV622g25JKWKTEw
	QwxEWxTycv35knD0CjP6paHqKPCA56Q/SIpRGYTVgyOEJ31hbdY2MtK2z9qUM93YTiWQxta2ED6
	kv2B3V39xHPi7HSF8AXCBgO7cYsvT3oTtmV9RCSc=
X-Google-Smtp-Source: AGHT+IFhpLTWJlAxFBTqXrFKSfTKeSY8UrKx04WYGcxfsIkYdRJSck3G+a/yi6ikofc/3aO5z3egFA==
X-Received: by 2002:a05:6000:2dc7:b0:3a3:706f:f2be with SMTP id ffacd0b85a97d-3a3706ff4d1mr5197818f8f.46.1747725751681;
        Tue, 20 May 2025 00:22:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5aba3sm15088097f8f.40.2025.05.20.00.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:22:31 -0700 (PDT)
Message-ID: <74ef310c-e0c4-47bf-b880-fa1addfa298d@linaro.org>
Date: Tue, 20 May 2025 09:22:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 4/5] phy: rockchip: naneng-combphy: Add RK3528 support
To: Yao Zi <ziyao@disroot.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250519161612.14261-1-ziyao@disroot.org>
 <20250519161612.14261-5-ziyao@disroot.org>
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
In-Reply-To: <20250519161612.14261-5-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_002233_642454_30BA1F0B 
X-CRM114-Status: GOOD (  25.38  )
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

On 19/05/2025 18:16, Yao Zi wrote:
> Rockchip RK3528 integrates one naneng-combphy that is able to operate in
> PCIe and USB3 mode. The control logic is similar to previous variants of
> naneng-combphy but the register layout is apperantly different from the
> RK3568 one.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   .../rockchip/phy-rockchip-naneng-combphy.c    | 186 +++++++++++++++++-
>   1 file changed, 185 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> index 1d1c7723584b..bf00a85a113b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -20,7 +20,46 @@
>   #define REF_CLOCK_25MHz			(25 * HZ_PER_MHZ)
>   #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
>   
> -/* COMBO PHY REG */
> +/* RK3528 COMBO PHY REG */
> +#define RK3528_PHYREG6				0x18
> +#define RK3528_PHYREG6_PLL_KVCO			GENMASK(12, 10)
> +#define RK3528_PHYREG6_PLL_KVCO_VALUE		0x2
> +#define RK3528_PHYREG6_SSC_DIR			GENMASK(5, 4)
> +#define RK3528_PHYREG6_SSC_UPWARD		0
> +#define RK3528_PHYREG6_SSC_DOWNWARD		1
> +
> +#define RK3528_PHYREG40				0x100
> +#define RK3528_PHYREG40_SSC_EN			BIT(20)
> +#define RK3528_PHYREG40_SSC_CNT			GENMASK(10, 0)
> +#define RK3528_PHYREG40_SSC_CNT_VALUE		0x17d
> +
> +#define RK3528_PHYREG42				0x108
> +#define RK3528_PHYREG42_CKDRV_CLK_SEL		BIT(29)
> +#define RK3528_PHYREG42_CKDRV_CLK_PLL		0
> +#define RK3528_PHYREG42_CKDRV_CLK_CKRCV		1
> +#define RK3528_PHYREG42_PLL_LPF_R1_ADJ		GENMASK(10, 7)
> +#define RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE	0x9
> +#define RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	GENMASK(6, 4)
> +#define RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE 0x7
> +#define RK3528_PHYREG42_PLL_KVCO_ADJ		GENMASK(2, 0)
> +#define RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE	0x0
> +
> +#define RK3528_PHYREG80				0x200
> +#define RK3528_PHYREG80_CTLE_EN			BIT(17)
> +
> +#define RK3528_PHYREG81				0x204
> +#define RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X	BIT(5)
> +#define RK3528_PHYREG81_SLEW_RATE_CTRL		GENMASK(2, 0)
> +#define RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW	0x7
> +
> +#define RK3528_PHYREG83				0x20c
> +#define RK3528_PHYREG83_RX_SQUELCH		GENMASK(2, 0)
> +#define RK3528_PHYREG83_RX_SQUELCH_VALUE	0x6
> +
> +#define RK3528_PHYREG86				0x218
> +#define RK3528_PHYREG86_RTERM_DET_CLK_EN	BIT(14)
> +
> +/* RK3568 COMBO PHY REG */
>   #define RK3568_PHYREG6				0x14
>   #define RK3568_PHYREG6_PLL_DIV_MASK		GENMASK(7, 6)
>   #define RK3568_PHYREG6_PLL_DIV_SHIFT		6
> @@ -398,6 +437,147 @@ static int rockchip_combphy_probe(struct platform_device *pdev)
>   	return PTR_ERR_OR_ZERO(phy_provider);
>   }
>   
> +static int rk3528_combphy_cfg(struct rockchip_combphy_priv *priv)
> +{
> +	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
> +	unsigned long rate;
> +	u32 val;
> +
> +	/* Set SSC downward spread spectrum */
> +	val = FIELD_PREP(RK3528_PHYREG6_SSC_DIR, RK3528_PHYREG6_SSC_DOWNWARD);
> +	rockchip_combphy_updatel(priv, RK3528_PHYREG6_SSC_DIR, val, RK3528_PHYREG6);
> +
> +	switch (priv->type) {
> +	case PHY_TYPE_PCIE:
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_pcie, true);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_pcie, true);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con2_for_pcie, true);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con3_for_pcie, true);
> +		break;
> +	case PHY_TYPE_USB3:
> +		/* Enable adaptive CTLE for USB3.0 Rx */
> +		rockchip_combphy_updatel(priv, RK3528_PHYREG80_CTLE_EN, RK3528_PHYREG80_CTLE_EN,
> +					 RK3528_PHYREG80);
> +
> +		/* Set slow slew rate control for PI */
> +		val = FIELD_PREP(RK3528_PHYREG81_SLEW_RATE_CTRL,
> +				 RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW);
> +		rockchip_combphy_updatel(priv, RK3528_PHYREG81_SLEW_RATE_CTRL, val,
> +					 RK3528_PHYREG81);
> +
> +		/* Set CDR phase path with 2x gain */
> +		rockchip_combphy_updatel(priv, RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X,
> +					 RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X, RK3528_PHYREG81);
> +
> +		/* Set Rx squelch input filler bandwidth */
> +		val = FIELD_PREP(RK3528_PHYREG83_RX_SQUELCH, RK3528_PHYREG83_RX_SQUELCH_VALUE);
> +		rockchip_combphy_updatel(priv, RK3528_PHYREG83_RX_SQUELCH, val, RK3528_PHYREG83);
> +
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txcomp_sel, false);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txelec_sel, false);
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->usb_mode_set, true);
> +		break;
> +	default:
> +		dev_err(priv->dev, "incompatible PHY type\n");
> +		return -EINVAL;
> +	}
> +
> +	rate = clk_get_rate(priv->refclk);
> +
> +	switch (rate) {
> +	case REF_CLOCK_24MHz:
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_24m, true);
> +		if (priv->type == PHY_TYPE_USB3) {
> +			/* Set ssc_cnt[10:0]=00101111101 & 31.5KHz */
> +			val = FIELD_PREP(RK3528_PHYREG40_SSC_CNT, RK3528_PHYREG40_SSC_CNT_VALUE);
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_CNT, val,
> +						 RK3528_PHYREG40);
> +		} else if (priv->type == PHY_TYPE_PCIE) {
> +			/* tx_trim[14]=1, Enable the counting clock of the rterm detect */
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG86_RTERM_DET_CLK_EN,
> +						 RK3528_PHYREG86_RTERM_DET_CLK_EN, RK3528_PHYREG86);
> +		}
> +		break;
> +	case REF_CLOCK_100MHz:
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_100m, true);
> +		if (priv->type == PHY_TYPE_PCIE) {
> +			/* PLL KVCO tuning fine */
> +			val = FIELD_PREP(RK3528_PHYREG6_PLL_KVCO, RK3528_PHYREG6_PLL_KVCO_VALUE);
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG6_PLL_KVCO, val,
> +						 RK3528_PHYREG6);
> +
> +			/* su_trim[6:4]=111, [10:7]=1001, [2:0]=000, swing 650mv */
> +			writel(0x570804f0, priv->mmio + RK3528_PHYREG42);
> +		}
> +		break;
> +	default:
> +		dev_err(priv->dev, "Unsupported rate: %lu\n", rate);
> +		return -EINVAL;
> +	}
> +
> +	if (device_property_read_bool(priv->dev, "rockchip,ext-refclk")) {
> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_ext, true);
> +
> +		if (priv->type == PHY_TYPE_PCIE && rate == REF_CLOCK_100MHz) {
> +			val = FIELD_PREP(RK3528_PHYREG42_CKDRV_CLK_SEL,
> +					 RK3528_PHYREG42_CKDRV_CLK_CKRCV);
> +			val |= FIELD_PREP(RK3528_PHYREG42_PLL_LPF_R1_ADJ,
> +					  RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE);
> +			val |= FIELD_PREP(RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ,
> +					  RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE);
> +			val |= FIELD_PREP(RK3528_PHYREG42_PLL_KVCO_ADJ,
> +					  RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE);
> +			rockchip_combphy_updatel(priv,
> +						 RK3528_PHYREG42_CKDRV_CLK_SEL		|
> +						 RK3528_PHYREG42_PLL_LPF_R1_ADJ		|
> +						 RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	|
> +						 RK3528_PHYREG42_PLL_KVCO_ADJ,
> +						 val, RK3528_PHYREG42);
> +
> +			val = FIELD_PREP(RK3528_PHYREG6_PLL_KVCO, RK3528_PHYREG6_PLL_KVCO_VALUE);
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG6_PLL_KVCO, val,
> +						 RK3528_PHYREG6);
> +		}
> +	}
> +
> +	if (priv->type == PHY_TYPE_PCIE) {
> +		if (device_property_read_bool(priv->dev, "rockchip,enable-ssc"))
> +			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_EN,
> +						 RK3528_PHYREG40_SSC_EN, RK3528_PHYREG40);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct rockchip_combphy_grfcfg rk3528_combphy_grfcfgs = {
> +	/* pipe-phy-grf */
> +	.pcie_mode_set		= { 0x0000, 5, 0, 0x00, 0x11 },
> +	.usb_mode_set		= { 0x0000, 5, 0, 0x00, 0x04 },
> +	.pipe_rxterm_set	= { 0x0000, 12, 12, 0x00, 0x01 },
> +	.pipe_txelec_set	= { 0x0004, 1, 1, 0x00, 0x01 },
> +	.pipe_txcomp_set	= { 0x0004, 4, 4, 0x00, 0x01 },
> +	.pipe_clk_24m		= { 0x0004, 14, 13, 0x00, 0x00 },
> +	.pipe_clk_100m		= { 0x0004, 14, 13, 0x00, 0x02 },
> +	.pipe_rxterm_sel	= { 0x0008, 8, 8, 0x00, 0x01 },
> +	.pipe_txelec_sel	= { 0x0008, 12, 12, 0x00, 0x01 },
> +	.pipe_txcomp_sel	= { 0x0008, 15, 15, 0x00, 0x01 },
> +	.pipe_clk_ext		= { 0x000c, 9, 8, 0x02, 0x01 },
> +	.pipe_phy_status	= { 0x0034, 6, 6, 0x01, 0x00 },
> +	.con0_for_pcie		= { 0x0000, 15, 0, 0x00, 0x110 },
> +	.con1_for_pcie		= { 0x0004, 15, 0, 0x00, 0x00 },
> +	.con2_for_pcie		= { 0x0008, 15, 0, 0x00, 0x101 },
> +	.con3_for_pcie		= { 0x000c, 15, 0, 0x00, 0x0200 },
> +};
> +
> +static const struct rockchip_combphy_cfg rk3528_combphy_cfgs = {
> +	.num_phys	= 1,
> +	.phy_ids	= {
> +		0xffdc0000,
> +	},
> +	.grfcfg		= &rk3528_combphy_grfcfgs,
> +	.combphy_cfg	= rk3528_combphy_cfg,
> +};
> +
>   static int rk3562_combphy_cfg(struct rockchip_combphy_priv *priv)
>   {
>   	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
> @@ -1213,6 +1393,10 @@ static const struct rockchip_combphy_cfg rk3588_combphy_cfgs = {
>   };
>   
>   static const struct of_device_id rockchip_combphy_of_match[] = {
> +	{
> +		.compatible = "rockchip,rk3528-naneng-combphy",
> +		.data = &rk3528_combphy_cfgs,
> +	},
>   	{
>   		.compatible = "rockchip,rk3562-naneng-combphy",
>   		.data = &rk3562_combphy_cfgs,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

