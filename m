Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9628DC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZ+Ey73e1w44lbC3w0VcbTTtAhvrBPf9nerbBI+C4fk=; b=QLVD2+5NpGchyBF849ZSgllM5F
	QObd7Wq/khxDNhHmAp5mYs2Zn34Z85dCgNNv6OLkMTip9gclV37Afi8hgEZysnE57Yl9ZFtDvnfe6
	YqTEIciu4ZHtzz9TimxzMvdeGAHri/VTI5HyZvefv3DkHWSkKb0xuCyK641LaTcfxVu0QzpH4749V
	eoCpYgV6yOvp2kw6oFZlmgXCe8wXCa5TInG2NLBeGh3k9FTMetODKa2szHO25PzdxDO1dnkB+KgKy
	V0AWRYtWuLl/RBF4BTOMPWVmBlAfFvcN7Q24zgF38BjuVadRNjIgDk3IDq3N/QU4cCRJ8CzLTtWNW
	SEFrle1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyKp-00000004v04-1SiN;
	Tue, 24 Jun 2025 07:44:51 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTy4c-00000004rhN-3nYh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:28:08 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso51509f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 00:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750750085; x=1751354885; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZ+Ey73e1w44lbC3w0VcbTTtAhvrBPf9nerbBI+C4fk=;
        b=ct6neZY2LhuqdhjLmpOggg8THKTZNH8I8dMbbqh1eNJlLLI5DHR0U5XTUz5tBpxvNj
         Xnj96Ls2O4AZqZ3hGoOsHi8PIQGq835XuawLSlKWjZMHaW5rkiaaJ15ET58ux2qsKbMu
         Qtt6k7SvO052mh9+R+uA8sELQ+KUi6wDa+Gn3vLn/wq/8tpRgzGCitiTQcsNWZFXwski
         oNXlDyNjBZgmTCEbrs9YZRVMB2tZ8yR4kJKJ8yzWBhaYpCdAW4pXxP2u+9HEfxayrv6K
         IaKG/YJgYKsKtt2G9Eo/byx+hVy9Hvosc3sxs2U+RoAGVOBOJLfLbvSHkdaodu8rqd3Q
         nbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750085; x=1751354885;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NZ+Ey73e1w44lbC3w0VcbTTtAhvrBPf9nerbBI+C4fk=;
        b=lsu9KVZH2tDSPILNOMAR9jpkilUwWJr88ZGs2rRObSr3rNT94+MI6HL5/cgnepSHn9
         zXzWC0XW7rC2PRldDor0xaP+ndYx67XHUkZcA5CCslU5+flKGapyP7QSrA4ix2t4S+D8
         Ft/B59WN4gv9iueuCQRoJ8AYM+zoLEX/2hrh3TDTt1MNGz2fvjuDdrLMiYwBs0T5iKZG
         Yl5ltM7NBb50eZzzSvTIvaOy6DdYIaDCnnlKKu8Ce2mree0Q+ckrnaQP/xpp+cDJEVdB
         4RqBBQxSOVlHGl3W2z1AdOMprAMFin7aHpliKQXgi1qbM2GbEojVhHrPR5bQxLTN80UV
         hNgw==
X-Forwarded-Encrypted: i=1; AJvYcCXYi0N4/UAHozDBzlbcFupBkN6fuGoY1oGe+0V/vecdmnoXnc/0QoBXDEW7iWPo1yr8nFYwgQXMMoWuBXR5l6NL@lists.infradead.org
X-Gm-Message-State: AOJu0YwRMkP3PMzRaBOyn3rAwx2Cc01FQNk3xrI9RRfva+HvAORCsMHl
	JY3leO2wgiYxVDs3nNXnCB9Rqlaqz24F5mF5RLLeZ4zNsn2tCpLgDBuk9sVgvId+q88=
X-Gm-Gg: ASbGnctZpizBlBjwW1bpmIYNosd1kZE6esdsqMgzdajQZvg1bztqNSDXy2Tr780oPXb
	ToToYhOm8beWohL0Aw+eFkrSo/LTK9hb/i79IXhLZ4t1gIrNzv+NytE3EhTLb7vGLkut8+xWVau
	inupYmQfwNFZKPkfZ2HBN9vyX5Cs84xJruiUVOHtdIFvUnNP4YZcvPoKsj/4H88quNFcKRH9WWI
	p6zR+WR0bFO9OyX1HNsx3RvQnr4IDDAzvIutT5Se8ey0KDdGy0+4KyOjl0+tROjdYWIz/MBsmNg
	MvONIc0YZmwACZbH9uddkWGssR+zXFsL4Uk2fR3a3DG8cmjA0b0xhywGVrbN7rSZ/244dF928o/
	cGNQQVDjQYHmw1PFybxyNYca2vrKi1Ef2qjFXqMY=
X-Google-Smtp-Source: AGHT+IG0LntEwTlFHFmNmL2P11XMbrWbJ4Hrr4lC9yhAzGFG33fGfZoe9KQDKcPk08xD6i9MHwDWGA==
X-Received: by 2002:a05:6000:40cb:b0:3a5:8a68:b815 with SMTP id ffacd0b85a97d-3a6d12e68ccmr12188188f8f.46.1750750085304;
        Tue, 24 Jun 2025 00:28:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:6fea:600c:ca20:f54a? ([2a01:e0a:3d9:2080:6fea:600c:ca20:f54a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45365af83easm126469055e9.25.2025.06.24.00.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:28:04 -0700 (PDT)
Message-ID: <7cba4f34-3ea7-4ddc-b2f6-f7d8f286472e@linaro.org>
Date: Tue, 24 Jun 2025 09:28:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 2/2] phy: mediatek: tphy: Cleanup and document slew
 calibration
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org, kishon@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
 <20250623120315.109881-3-angelogioacchino.delregno@collabora.com>
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
In-Reply-To: <20250623120315.109881-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_002806_960687_2083BE13 
X-CRM114-Status: GOOD (  30.18  )
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

On 23/06/2025 14:03, AngeloGioacchino Del Regno wrote:
> While it's true that, generally, the T-PHY V3 does not support the
> slew calibration process, some minor versions of it actually do,
> moreover, some SoCs may not support this even though the version
> of the PHY IP does.
> 
> The reference clock and rate coefficient parameters are used only
> for slew calibration: move those to platform data, then document
> and change the checks in hs_slew_rate_calibrate() to perform the
> calibration only if:
>   - EYE value was not supplied (pre-calculated calibration); and
>   - Slew reference clock value is present (not zero); and
>   - Slew coefficient is present (not zero).
> 
> Moreover, change the probe function to always check if both the
> slew reference clock and coefficient properties are present and,
> if not, assign the value from platform data (which, as reminder,
> if not added means that it's zero!), instead of checking the PHY
> IP version.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/phy/mediatek/phy-mtk-tphy.c | 45 +++++++++++++++++------------
>   1 file changed, 27 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
> index 858824b4476e..e5ce1255d735 100644
> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> @@ -210,8 +210,6 @@
>   #define P2F_USB_FM_VALID	BIT(0)
>   #define P2F_RG_FRCK_EN		BIT(8)
>   
> -#define U3P_REF_CLK		26	/* MHZ */
> -#define U3P_SLEW_RATE_COEF	28
>   #define U3P_SR_COEF_DIVISOR	1000
>   #define U3P_FM_DET_CYCLE_CNT	1024
>   
> @@ -285,12 +283,16 @@ enum mtk_phy_version {
>    * @sw_efuse_supported:       Switches off eFuse auto-load from PHY and applies values
>    *                            read from different nvmem (usually different eFuse array)
>    *                            that is pointed at in the device tree node for this PHY
> + * @slew_ref_clk_mhz:         Default reference clock (in MHz) for slew rate calibration
> + * @slew_rate_coefficient:    Coefficient for slew rate calibration
>    * @version:                  PHY IP Version
>    */
>   struct mtk_phy_pdata {
>   	bool avoid_rx_sen_degradation;
>   	bool sw_pll_48m_to_26m;
>   	bool sw_efuse_supported;
> +	u8 slew_ref_clock_mhz;
> +	u8 slew_rate_coefficient;
>   	enum mtk_phy_version version;
>   };
>   
> @@ -686,12 +688,14 @@ static void hs_slew_rate_calibrate(struct mtk_tphy *tphy,
>   	int fm_out;
>   	u32 tmp;
>   
> -	/* HW V3 doesn't support slew rate cal anymore */
> -	if (tphy->pdata->version == MTK_PHY_V3)
> -		return;
> -
> -	/* use force value */
> -	if (instance->eye_src)
> +	/*
> +	 * If a fixed HS slew rate (EYE) value was supplied, don't run the
> +	 * calibration sequence and prefer using that value instead; also,
> +	 * if there is no reference clock for slew calibration or there is
> +	 * no slew coefficient, this means that the slew rate calibration
> +	 * sequence is not supported.
> +	 */
> +	if (instance->eye_src || !tphy->src_ref_clk || !tphy->src_coef)
>   		return;
>   
>   	/* enable USB ring oscillator */
> @@ -1516,12 +1520,16 @@ static const struct phy_ops mtk_tphy_ops = {
>   
>   static const struct mtk_phy_pdata tphy_v1_pdata = {
>   	.avoid_rx_sen_degradation = false,
> +	.slew_ref_clock_mhz = 26,
> +	.slew_rate_coefficient = 28,
>   	.version = MTK_PHY_V1,
>   };
>   
>   static const struct mtk_phy_pdata tphy_v2_pdata = {
>   	.avoid_rx_sen_degradation = false,
>   	.sw_efuse_supported = true,
> +	.slew_ref_clock_mhz = 26,
> +	.slew_rate_coefficient = 28,
>   	.version = MTK_PHY_V2,
>   };
>   
> @@ -1532,6 +1540,8 @@ static const struct mtk_phy_pdata tphy_v3_pdata = {
>   
>   static const struct mtk_phy_pdata mt8173_pdata = {
>   	.avoid_rx_sen_degradation = true,
> +	.slew_ref_clock_mhz = 26,
> +	.slew_rate_coefficient = 28,
>   	.version = MTK_PHY_V1,
>   };
>   
> @@ -1561,7 +1571,7 @@ static int mtk_tphy_probe(struct platform_device *pdev)
>   	struct resource *sif_res;
>   	struct mtk_tphy *tphy;
>   	struct resource res;
> -	int port;
> +	int port, ret;
>   
>   	tphy = devm_kzalloc(dev, sizeof(*tphy), GFP_KERNEL);
>   	if (!tphy)
> @@ -1591,15 +1601,14 @@ static int mtk_tphy_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	if (tphy->pdata->version < MTK_PHY_V3) {
> -		tphy->src_ref_clk = U3P_REF_CLK;
> -		tphy->src_coef = U3P_SLEW_RATE_COEF;
> -		/* update parameters of slew rate calibrate if exist */
> -		device_property_read_u32(dev, "mediatek,src-ref-clk-mhz",
> -					 &tphy->src_ref_clk);
> -		device_property_read_u32(dev, "mediatek,src-coef",
> -					 &tphy->src_coef);
> -	}
> +	/* Optional properties for slew calibration variation */
> +	ret = device_property_read_u32(dev, "mediatek,src-ref-clk-mhz", &tphy->src_ref_clk);
> +	if (ret)
> +		tphy->src_ref_clk = tphy->pdata->slew_ref_clock_mhz;
> +
> +	ret = device_property_read_u32(dev, "mediatek,src-coef", &tphy->src_coef);
> +	if (ret)
> +		tphy->src_coef = tphy->pdata->slew_rate_coefficient;
>   
>   	port = 0;
>   	for_each_child_of_node_scoped(np, child_np) {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

