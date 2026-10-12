Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08C3CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 12:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNBmIpHaVMdDPWDAgphNw6C+bWviKjN+J5cDaNCeyIo=; b=OdR7DpPTlMe0PvpYQQ5FQOFj0S
	Sq/Eh+N4upH7QYpi2nw9SdFT2sv4hSNm8aXkLacyOvlz+lCc2R/pxqvjHbfrSq3xovB3ly6Hc8lCd
	g34tIxYZoZMZBnsAktTbqO7X5UnPHs6UvuUU7VglaCpLOqMPXbVX/kBmrx+0fS3+gat1ohu8rIZdn
	8sGFJ9xcp3ig2dHt+4XSK5rKTh0OIvW+xRIzjJR6w48/bVMwQkWEK+y3CYlP3JC5e4D0T3e0ZDHIZ
	hzWztRAkUBybZuHycR/5NcNTja0sLFWFywEekLJg3I/w03n36vkp6jFpil5bv4cNN6fDL3S1rTVkX
	o0e/V7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFBO-0000000ASS5-3VnU;
	Mon, 12 Oct 2026 12:31:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFBK-0000000ASRX-3KVj;
	Mon, 12 Oct 2026 12:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uNBmIpHaVMdDPWDAgphNw6C+bWviKjN+J5cDaNCeyIo=; b=cVoH3PQ31cx1sQg57/ZA8m9wCK
	PvVS1ul4HIWVPnW9Om2PVZ2B86SpoZyXddX+lTNtISRmgyR1elC3HkehvNXEEwPXdkQB0oyiGfRqA
	szBprodQMJvDOJ6QFUYd0B3/GIhxeSf8ZSPFM3V8ViOqO+t+pg2095sMw3pKUtv4XG+M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xGFB3-00AJyk-VM; Mon, 12 Oct 2026 14:30:49 +0200
Date: Mon, 12 Oct 2026 14:30:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII
 delays the T7 way
Message-ID: <a1c0b76b-7b67-43e9-af15-3139f17d7fe7@lunn.ch>
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-5-tanure@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010105900.247342-5-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_053107_489110_B6643B42 
X-CRM114-Status: GOOD (  21.65  )
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

> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> @@ -82,6 +82,7 @@ struct meson8b_dwmac_data {
>  	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
>  	bool has_prg_eth1_rgmii_rx_delay;
>  	bool has_pipeline_clk;
> +	bool mac_applies_dt_delays;

Please can you invert this and call it broken delays.

We should make it clear that new devices should not set this, because
it wrong, broken.

> +static int meson_dwmac_init_dt_delays(struct meson8b_dwmac *dwmac,
> +				      struct plat_stmmacenet_data *plat_dat)
> +{
> +	struct device_node *np = dwmac->dev->of_node;
> +	u32 tx_delay_ps = 0, rx_delay_ps = 0;
> +	phy_interface_t phy_mode;
> +	bool mac_tx, mac_rx;
> +
> +	mac_tx = !of_property_read_u32(np, "tx-internal-delay-ps", &tx_delay_ps);
> +	mac_rx = !of_property_read_u32(np, "rx-internal-delay-ps", &rx_delay_ps);
> +
> +	/* one step is a quarter of the RGMII clock period, 2ns at 1Gbit/s */
> +	if (tx_delay_ps > 6000 || tx_delay_ps % 2000)
> +		return dev_err_probe(dwmac->dev, -EINVAL,
> +				     "The RGMII TX delay must be 0, 2000, 4000 or 6000ps\n");

tx-internal-delay is not listed in amlogic,meson-dwmac.yaml. Please
could you add it, and list the valid values.

Do you have access to the datasheet? Could you check these numbers are
correct, because they are larger than typical. 4ns, and 6ns makes no
sense, the RGMII standard only calls for 2ns.

> +
> +	/* the RX delay line moves in 200ps steps and reaches 3000ps */
> +	if (rx_delay_ps > 3000 || rx_delay_ps % 200)
> +		return dev_err_probe(dwmac->dev, -EINVAL,
> +				     "The RGMII RX delay range is 0..3000ps in 200ps steps\n");

Please could you listing these values in the binding.

Also, mark that amlogic,tx-delay-ns & amlogic,rx-delay-ns are not
valid for this compatible.

> +
> +	phy_mode = phy_fix_phy_mode_for_mac_delays(dwmac->phy_mode, mac_tx,
> +						   mac_rx);

This is not correct. This function assumes mac_tx and mac_rx are
Boolean values, the MAC is applying the full 2ns delay. However, if
rx-internal-delay-ps is only providing 200ps, that is not true.

I would prefer you keep to the usual way of doing things. Allow the
MAC to apply small tuning delays, but have the PHY do the 2ns. So
don't make any modification to phy-mode.

>  static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>  {
>  	u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
> @@ -411,32 +455,34 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>  	dwmac->dev = &pdev->dev;
>  	dwmac->phy_mode = plat_dat->phy_interface;
>  
> -	/* use 2ns as fallback since this value was previously hardcoded */
> -	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
> -				 &dwmac->tx_delay_ns))
> -		dwmac->tx_delay_ns = 2;
> -
> -	/* RX delay defaults to 0ps since this is what many boards use */
> -	if (of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
> -				 &dwmac->rx_delay_ps)) {
> -		if (!of_property_read_u32(pdev->dev.of_node,
> -					  "amlogic,rx-delay-ns",
> -					  &dwmac->rx_delay_ps))
> -			/* convert ns to ps */
> -			dwmac->rx_delay_ps *= 1000;
> -	}
> -
> -	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
> -		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
> -			dev_err(dwmac->dev,
> -				"The RGMII RX delay range is 0..3000ps in 200ps steps");
> -			return -EINVAL;
> +	if (!dwmac->data->mac_applies_dt_delays) {

I suggest you do this at a higher level. Either call this function if
_broken_delay is set, or the other one.

	Andrew

