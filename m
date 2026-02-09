Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203B8E81BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sh23NSounPEoAE2h79+DwlVVBDgNeh1OQatWs/Guhyc=; b=YCV5taqgoQU980Txk+yiJqS/+W
	HVlRH9pwR1WTxbHHwD87Wk+SxmwiDZ4Yaw5zZSv+17VPTSmDTazLy+fjh/heX4USaiVScHdu3ohuZ
	glDbD9NePlsHJRFGRS2aLylV6CPUhPTAO9ed7w+vrhzING8k6x62BZPrE3rI9mJr5hz2TzpUZGtCl
	YryywP9scUTf+z1Jd2RthJGg5G2yMjqONlwXLF9B+TfenS8JB9XxcpzJpI4DKtPPUXwijqP4f0qOf
	ud7pp457UAmtLSyVfGoTll2JM+hmaNPmXTVWLa2oPH8hFuPy1Ul3njYO66Vhw/hMqQOJoMF8hinH8
	L9xk5kww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRPd-0000000FRqY-2vQ4;
	Mon, 09 Feb 2026 13:34:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRPW-0000000FRpc-22EF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 13:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Sh23NSounPEoAE2h79+DwlVVBDgNeh1OQatWs/Guhyc=; b=Xa+QQuRAVaTq3QfgkF6otHND6P
	1tX50Y+PCdAxCTR75mp2UWO7wGqTlAXch2y+oT1au3UH+6n6Tn5vc22nPjgJIgScn+dfxz2scnG/R
	v8cJOik1at9Yt/X7jKqKC0AUini3O6AC+8xAQprfzp1oq6WKGdBEohe/mJ5XhJpe9BR4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vpRPL-006j5z-20; Mon, 09 Feb 2026 14:34:31 +0100
Date: Mon, 9 Feb 2026 14:34:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: [PATCH v2 2/2] net: stmmac: eic7700: enable clocks before syscon
 access and correct RX sampling timing
Message-ID: <1392e400-9901-4f65-b44b-d257d8196abf@lunn.ch>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
 <20260209094832.932-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209094832.932-1-lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_053443_834071_3A61E5E3 
X-CRM114-Status: GOOD (  16.15  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

>  static int eic7700_dwmac_init(struct device *dev, void *priv)
>  {
>  	struct eic7700_qos_priv *dwc = priv;
> +	u32 eth_phy_ctrl_regset;
> +	int ret = 0;
> +
> +	ret = eic7700_clks_config(dwc, true);

No point initialising ret if the first thing you do is assign to it.

> +	if (ret)
> +		return ret;
> +
> +	regmap_read(dwc->eic7700_hsp_regmap, dwc->eth_phy_ctrl_offset,
> +		    &eth_phy_ctrl_regset);
> +	eth_phy_ctrl_regset |=
> +		(EIC7700_ETH_TX_CLK_SEL | EIC7700_ETH_PHY_INTF_SELI);
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_phy_ctrl_offset,
> +		     eth_phy_ctrl_regset);

regmap_set_bits(dwc->eic7700_hsp_regmap, dwc->eth_phy_ctrl_offset,
		EIC7700_ETH_TX_CLK_SEL | EIC7700_ETH_PHY_INTF_SELI);

> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_axi_lp_ctrl_offset,
> +		     EIC7700_ETH_CSYSREQ_VAL);
> +
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_txd_offset, 0);
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_rxd_offset, 0);
>  
> -	return eic7700_clks_config(dwc, true);
> +	return ret;

returning ret here seems pointless. You already know it is 0.


>  }
>  
>  static void eic7700_dwmac_exit(struct device *dev, void *priv)
> @@ -88,17 +124,33 @@ static int eic7700_dwmac_resume(struct device *dev, void *priv)
>  	return ret;
>  }
>  
> +static void eic7700_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
> +{
> +	struct eic7700_qos_priv *dwc = (struct eic7700_qos_priv *)priv;
> +	u32 dly_param = dwc->eth_clk_dly_param;
> +
> +	switch (speed) {
> +	case SPEED_1000:
> +		if (dwc->eth_rx_clk_inv)
> +			dly_param |= EIC7700_ETH_RX_INV_DELAY;
> +		break;
> +	case SPEED_100:
> +	case SPEED_10:
> +		break;
> +	default:
> +		dev_err(dwc->dev, "invalid speed %u\n", speed);
> +		break;
> +	}
> +
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_clk_offset, dly_param);
> +}
> +
>  static int eic7700_dwmac_probe(struct platform_device *pdev)
>  {
> +	const struct eic7700_dwmac_data *data;
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct eic7700_qos_priv *dwc_priv;
> -	struct regmap *eic7700_hsp_regmap;
> -	u32 eth_axi_lp_ctrl_offset;
> -	u32 eth_phy_ctrl_offset;
> -	u32 eth_phy_ctrl_regset;
> -	u32 eth_rxd_dly_offset;
> -	u32 eth_dly_param = 0;
>  	u32 delay_ps;
>  	int i, ret;
>  
> @@ -116,13 +168,23 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
>  	if (!dwc_priv)
>  		return -ENOMEM;
>  
> +	dwc_priv->dev = &pdev->dev;
> +
> +	data = device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return dev_err_probe(&pdev->dev,
> +				     -EINVAL, "no match data found\n");
> +
> +	dwc_priv->eth_rx_clk_inv = data->rgmii_rx_clk_invert;
> +
>  	/* Read rx-internal-delay-ps and update rx_clk delay */
>  	if (!of_property_read_u32(pdev->dev.of_node,
>  				  "rx-internal-delay-ps", &delay_ps)) {
> -		u32 val = min(delay_ps / 100, EIC7700_MAX_DELAY_UNIT);
> +		u32 val = min(delay_ps / 20, EIC7700_MAX_DELAY_STEPS);

If the value it too big, please return -EINVAL. You have listed in the
DT binding what the valid range is, not that you clamp to the maximum
value.

>  
> -		eth_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
> -		eth_dly_param |= FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
> +		dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
> +		dwc_priv->eth_clk_dly_param |=
> +				 FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
>  	} else {
>  		return dev_err_probe(&pdev->dev, -EINVAL,
>  			"missing required property rx-internal-delay-ps\n");

RX and TX internal delays are generally optional, because most boards
don't require them. Default to 0 if not supplied.

    Andrew

---
pw-bot: cr

