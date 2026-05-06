Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE92CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHnQqBp2EqYY1JYoxE69LuzOdZ85YxE7rj/VHd3SUqU=; b=m0ENGJlSSSV51jb+0YqZHV36Ac
	f+yLLRimwTgfSAYcZPRpNghabXJq9DykkyPB9719Wee7puIgVggPRMUCAMxWgDRBmPXlQqz2gxHyg
	FJWlbBNmgE/vqb4hUgEYFN6FGwdz+f/0GDGFpSyt/DTWI881CmVawCsn3z4BvMfX/t8EIIEEFwWGY
	P6ktqHIGUWy8u5tttwXCmLLO+GG27vuJC4vI0/o6FK0VYcqNrlCFUB0KcEmBiaVdlEnmGROEZBGMm
	MPenokqcijFcxXpDoTVOgM2inJnteY1zwizKW/cug7NiYHKdfkB60XnmWgO1CnH4CKZtFDKqVW9YG
	UCfO4d+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdRx-0000000185O-429m;
	Wed, 06 May 2026 14:42:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdRx-00000001843-1YOJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:42:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so62094325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778078527; x=1778683327; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHnQqBp2EqYY1JYoxE69LuzOdZ85YxE7rj/VHd3SUqU=;
        b=eqR820Bqn+QlmFOGO7pCw8s9NeEsBCFnvlOKHhmG34LLn/slur502s+SZL1EssRAA9
         9ZQikztsMx8/Z3rAMTa5aRdiIcYGaV8pPuNlxq8IS9Abci7B0n0cOdlbgRlXKycZpihA
         3nSCa36QUknuUGKu8xYhj5vD+VIlLwM5dUyknkj72ffijQbpzzyMlekJkQKswkp+3GuG
         Z+qKc3Xu0nGWMnfCFAiudKxo6uZwjqz7Dttf5vBEln3lf8CpQ/QLNQhBwEBfagjyQrhe
         nKiYy08SNcGShSUzXQvJ63AS9zgniUxctKKqKTpwKpyYo/aEadkgAGf3Ltwx1UiDf7qA
         R5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078527; x=1778683327;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHnQqBp2EqYY1JYoxE69LuzOdZ85YxE7rj/VHd3SUqU=;
        b=gf7BAbo7hpbtkS7QUVY24pcbHEjIesgTym14BNksNH1+pKqKIFRRQk032/OBQSpT8z
         6BKHGMjeEtgSlT1fFDP3bqELuXAzzzBYVMSJ57rwTEWJQCRZRAo8GZ/wvxtW/2b/93FU
         eKxkKX4dENvYnsTeK4uNxTC0ScYdc6oZ6sIwIuUWw3ug4Kh8Q/Xh1HxPHdTjQC/gUqJD
         M6Mg6SK6tC6O8WAquNh/uuxl/AFRbRUvbNFFYuWrZ38Ugm462ipD2Z7nO4y9QQjpvnFS
         7gVtH9sY9rrfH3XftJ1O6BeIwH9OjNBl0kPVsyiczH7wjQM7Xa9twRvq1/XZHKloQL/0
         JvwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NR1sCsYEi4361W9kgL1OOiw64VutcwPPhlWznyzye83PsYjxqxHAV5DO8ghlBo/FfSn3iYdx33GOlPAHB+7mT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh3mOtLCQQsqQcKX+ECLknfKj2tNPDPw2Svi2QTULRYHtgh9Bx
	Yl4X/3ftAP4OJSM2c2UoQz63bxfKVrvqhsi1UNe09HWZSNFNCRBmmhIQdXLm174uKnM=
X-Gm-Gg: AeBDiet2OpfCmn/2auVYosxAAooh3HrP9OCBMJZVLF34vR/lHM0sxkvbjuQCx3bJNBR
	sgDJDxM1h9KnP55VMy2FwEXGsoPEaG09VrYkhBHa2kghAmqi/k7B7QqjaloMQxA4aOrY/f9/lUO
	+OHfMyqUow8RJ4UFI2ARN2oHxcxmHU9uqIGWmoHAlL6xUrMIrbra7BBiEIJYbNzh0At3OoP2yuK
	U1+pjMBYyH/M13GtWRqUjb9QssdcwE4fy1UnFh48qnN9afUucmXKJo/4hZI6i99wBSxbpWUuAVP
	wNHAt9Gpc17mPjp8ZfF23eSDPgLkQRIXfXE9qrbuw2MUcIwHxqCxZfgsfg/fRQ3D1R9IyF9HCZp
	c2SQfvTGdWue2DDtMDVZgCSk5CcxjX8IEyix5guNGrdcRk35ickOAk5ibUINIrpG4XNdsMhGRxf
	JnPVT37bQcjEmZIloQOb10FOtIy/drF42aJ+zRjGHY5QJ0Yvr45xiiEM2I3ShHNYIo3NDQ1/DWm
	Mygd70YskrhKZyw9rMCK/XNmzKs
X-Received: by 2002:a05:600c:1f0d:b0:488:b8bc:6a32 with SMTP id 5b1f17b1804b1-48e51f45874mr66049915e9.23.1778078526488;
        Wed, 06 May 2026 07:42:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53141f0dsm18681035e9.25.2026.05.06.07.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:42:05 -0700 (PDT)
Message-ID: <75e21bd6-1247-4366-b336-b5517cbc715a@linaro.org>
Date: Wed, 6 May 2026 16:42:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/5] phy: rockchip: inno-usb2: Simplify rockchip,usbgrf
 handling
To: Heiko Stuebner <heiko@sntech.de>, vkoul@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, jonas@kwiboo.se
References: <20260505170410.3265305-1-heiko@sntech.de>
 <20260505170410.3265305-3-heiko@sntech.de>
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
In-Reply-To: <20260505170410.3265305-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_074209_462622_925509F9 
X-CRM114-Status: GOOD (  28.40  )
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
> The logic to decide if usbgrf or grf should be used is more complex than
> it needs to be. For RK3568, RV1108 and soon RK3528 we can assign the
> rockchip,usbgrf regmap directly to grf instead of doing a usbgrf and grf
> dance.
> 
> Simplify the code to only use the grf regmap and handle the logic of
> what regmap should be used in driver probe instead.
> 
> The only expected change from this is that RK3528 can be supported
> because of an addition of a of_property_present() check.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 68 +++++--------------
>   1 file changed, 18 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> index 8f4c08e599aa..7cec45192393 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> @@ -228,7 +228,6 @@ struct rockchip_usb2phy_port {
>    * struct rockchip_usb2phy - usb2.0 phy driver data.
>    * @dev: pointer to device.
>    * @grf: General Register Files regmap.
> - * @usbgrf: USB General Register Files regmap.
>    * @clks: array of phy input clocks.
>    * @clk480m: clock struct of phy output clk.
>    * @clk480m_hw: clock struct of phy output clk management.
> @@ -246,7 +245,6 @@ struct rockchip_usb2phy_port {
>   struct rockchip_usb2phy {
>   	struct device	*dev;
>   	struct regmap	*grf;
> -	struct regmap	*usbgrf;
>   	struct clk_bulk_data	*clks;
>   	struct clk	*clk480m;
>   	struct clk_hw	clk480m_hw;
> @@ -261,11 +259,6 @@ struct rockchip_usb2phy {
>   	struct rockchip_usb2phy_port	ports[USB2PHY_NUM_PORTS];
>   };
>   
> -static inline struct regmap *get_reg_base(struct rockchip_usb2phy *rphy)
> -{
> -	return rphy->usbgrf == NULL ? rphy->grf : rphy->usbgrf;
> -}
> -
>   static inline int property_enable(struct regmap *base,
>   				  const struct usb2phy_reg *reg, bool en)
>   {
> @@ -323,12 +316,11 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
>   {
>   	struct rockchip_usb2phy *rphy =
>   		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
> -	struct regmap *base = get_reg_base(rphy);
>   	int ret;
>   
>   	/* turn on 480m clk output if it is off */
> -	if (!property_enabled(base, &rphy->phy_cfg->clkout_ctl)) {
> -		ret = property_enable(base, &rphy->phy_cfg->clkout_ctl, true);
> +	if (!property_enabled(rphy->grf, &rphy->phy_cfg->clkout_ctl)) {
> +		ret = property_enable(rphy->grf, &rphy->phy_cfg->clkout_ctl, true);
>   		if (ret)
>   			return ret;
>   
> @@ -343,19 +335,17 @@ static void rockchip_usb2phy_clk480m_unprepare(struct clk_hw *hw)
>   {
>   	struct rockchip_usb2phy *rphy =
>   		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
> -	struct regmap *base = get_reg_base(rphy);
>   
>   	/* turn off 480m clk output */
> -	property_enable(base, &rphy->phy_cfg->clkout_ctl, false);
> +	property_enable(rphy->grf, &rphy->phy_cfg->clkout_ctl, false);
>   }
>   
>   static int rockchip_usb2phy_clk480m_prepared(struct clk_hw *hw)
>   {
>   	struct rockchip_usb2phy *rphy =
>   		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
> -	struct regmap *base = get_reg_base(rphy);
>   
> -	return property_enabled(base, &rphy->phy_cfg->clkout_ctl);
> +	return property_enabled(rphy->grf, &rphy->phy_cfg->clkout_ctl);
>   }
>   
>   static unsigned long
> @@ -574,7 +564,6 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
>   {
>   	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
>   	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
> -	struct regmap *base = get_reg_base(rphy);
>   	int ret;
>   
>   	dev_dbg(&rport->phy->dev, "port power on\n");
> @@ -586,7 +575,7 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
>   	if (ret)
>   		return ret;
>   
> -	ret = property_enable(base, &rport->port_cfg->phy_sus, false);
> +	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, false);
>   	if (ret) {
>   		clk_disable_unprepare(rphy->clk480m);
>   		return ret;
> @@ -615,7 +604,6 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
>   {
>   	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
>   	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
> -	struct regmap *base = get_reg_base(rphy);
>   	int ret;
>   
>   	dev_dbg(&rport->phy->dev, "port power off\n");
> @@ -623,7 +611,7 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
>   	if (rport->suspended)
>   		return 0;
>   
> -	ret = property_enable(base, &rport->port_cfg->phy_sus, true);
> +	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, true);
>   	if (ret)
>   		return ret;
>   
> @@ -787,28 +775,22 @@ static const char *chg_to_string(enum power_supply_type chg_type)
>   static void rockchip_chg_enable_dcd(struct rockchip_usb2phy *rphy,
>   				    bool en)
>   {
> -	struct regmap *base = get_reg_base(rphy);
> -
> -	property_enable(base, &rphy->phy_cfg->chg_det.rdm_pdwn_en, en);
> -	property_enable(base, &rphy->phy_cfg->chg_det.idp_src_en, en);
> +	property_enable(rphy->grf, &rphy->phy_cfg->chg_det.rdm_pdwn_en, en);
> +	property_enable(rphy->grf, &rphy->phy_cfg->chg_det.idp_src_en, en);
>   }
>   
>   static void rockchip_chg_enable_primary_det(struct rockchip_usb2phy *rphy,
>   					    bool en)
>   {
> -	struct regmap *base = get_reg_base(rphy);
> -
> -	property_enable(base, &rphy->phy_cfg->chg_det.vdp_src_en, en);
> -	property_enable(base, &rphy->phy_cfg->chg_det.idm_sink_en, en);
> +	property_enable(rphy->grf, &rphy->phy_cfg->chg_det.vdp_src_en, en);
> +	property_enable(rphy->grf, &rphy->phy_cfg->chg_det.idm_sink_en, en);
>   }
>   
>   static void rockchip_chg_enable_secondary_det(struct rockchip_usb2phy *rphy,
>   					      bool en)
>   {
> -	struct regmap *base = get_reg_base(rphy);
> -
> -	property_enable(base, &rphy->phy_cfg->chg_det.vdm_src_en, en);
> -	property_enable(base, &rphy->phy_cfg->chg_det.idp_sink_en, en);
> +	property_enable(rphy->grf, &rphy->phy_cfg->chg_det.vdm_src_en, en);
> +	property_enable(rphy->grf, &rphy->phy_cfg->chg_det.idp_sink_en, en);
>   }
>   
>   #define CHG_DCD_POLL_TIME	(100 * HZ / 1000)
> @@ -820,7 +802,6 @@ static void rockchip_chg_detect_work(struct work_struct *work)
>   	struct rockchip_usb2phy_port *rport =
>   		container_of(work, struct rockchip_usb2phy_port, chg_work.work);
>   	struct rockchip_usb2phy *rphy = dev_get_drvdata(rport->phy->dev.parent);
> -	struct regmap *base = get_reg_base(rphy);
>   	bool is_dcd, tmout, vout, vbus_attach;
>   	unsigned long delay;
>   
> @@ -834,7 +815,7 @@ static void rockchip_chg_detect_work(struct work_struct *work)
>   			rockchip_usb2phy_power_off(rport->phy);
>   		/* put the controller in non-driving mode */
>   		if (!vbus_attach)
> -			property_enable(base, &rphy->phy_cfg->chg_det.opmode, false);
> +			property_enable(rphy->grf, &rphy->phy_cfg->chg_det.opmode, false);
>   		/* Start DCD processing stage 1 */
>   		rockchip_chg_enable_dcd(rphy, true);
>   		rphy->chg_state = USB_CHG_STATE_WAIT_FOR_DCD;
> @@ -898,7 +879,7 @@ static void rockchip_chg_detect_work(struct work_struct *work)
>   	case USB_CHG_STATE_DETECTED:
>   		/* put the controller in normal mode */
>   		if (!vbus_attach)
> -			property_enable(base, &rphy->phy_cfg->chg_det.opmode, true);
> +			property_enable(rphy->grf, &rphy->phy_cfg->chg_det.opmode, true);
>   		rockchip_usb2phy_otg_sm_work(&rport->otg_sm_work.work);
>   		dev_dbg(&rport->phy->dev, "charger = %s\n",
>   			 chg_to_string(rphy->chg_type));
> @@ -1353,27 +1334,14 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
>   	if (!rphy)
>   		return -ENOMEM;
>   
> -	if (!dev->parent || !dev->parent->of_node) {
> +	if (!dev->parent || !dev->parent->of_node ||
> +	    of_property_present(np, "rockchip,usbgrf")) {
>   		rphy->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,usbgrf");
> -		if (IS_ERR(rphy->grf)) {
> -			dev_err(dev, "failed to locate usbgrf\n");
> -			return PTR_ERR(rphy->grf);
> -		}
>   	} else {
>   		rphy->grf = syscon_node_to_regmap(dev->parent->of_node);
> -		if (IS_ERR(rphy->grf))
> -			return PTR_ERR(rphy->grf);
> -	}
> -
> -	if (of_device_is_compatible(np, "rockchip,rv1108-usb2phy")) {
> -		rphy->usbgrf =
> -			syscon_regmap_lookup_by_phandle(dev->of_node,
> -							"rockchip,usbgrf");
> -		if (IS_ERR(rphy->usbgrf))
> -			return PTR_ERR(rphy->usbgrf);
> -	} else {
> -		rphy->usbgrf = NULL;
>   	}
> +	if (IS_ERR(rphy->grf))
> +		return PTR_ERR(rphy->grf);
>   
>   	if (of_property_read_u32_index(np, "reg", 0, &reg)) {
>   		dev_err(dev, "the reg property is not assigned in %pOFn node\n", np);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

