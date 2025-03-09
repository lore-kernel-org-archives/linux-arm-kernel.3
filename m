Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A89CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIhdSeA+sKY04sYaP/yGGu7Uf1h3HX4WesIt7XvRbuE=; b=3zI7c3wsRQQEY9UoogJwsAuiWB
	2fTtJmLp0o1ImwXov29UWItrYUfk5ySACV7r57WuHd58GV8VdDiYWfrCCpS6NlkN75WR6YeiF61fc
	Bu2kHUqQZW1wOMswbO2VhPKGSoriQtfKhHFrgXf7r35OYLdeUtwnLeJFCt1/MV9/W6SGIKDTySjT2
	Rp6O108cYylTsp2rJZfxYwxSbcPLt0FG1cbK8ai1BEBAWFDdQJgLuRNHOJognfvRVbV113R7aj0JZ
	6ho0Yl0+rBGVQ35qa/RT7u3D5BpflBc7vn3RVTK7DdGgMWvzj4VkQmSf0siqxKKBuVNoULHfQMibl
	V3tAqY1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trL2F-00000000vSE-0cX5;
	Sun, 09 Mar 2025 18:05:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKuA-00000000tyi-30g8;
	Sun, 09 Mar 2025 17:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dIhdSeA+sKY04sYaP/yGGu7Uf1h3HX4WesIt7XvRbuE=; b=dc5fL2Pap+D9k82kWKY/cDDfZu
	iYILHTxmGsAQsiVsrzo8CHuB98dMQ38Jm1ctAkrGymRJnBUth5n79xKv46sDqw8cbEjiLTwXHchW2
	8+MNISEP1foTylRjLfCrDZeiIjG/ZIPzFJkD/wxtw3V/Lr+oeVeS5XBmIVe2fNMiL4cS4fS1SeDKq
	d9llRg6SOXq/m0zRSmU0RcSsWHI9Z6K2rlHPWnkyTpQjU6xEtLqzxdKk0SEjeyvZnw+u5B/uOiBSR
	z6QBRB1XDGGTKcMAac9HTmIGLH9JXDB/eNfVW6dn+K4+cR+NmyAd2UeWAvrs9mS79HZaYGj7Vjl2K
	rnIil4Ug==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42970)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1trKtw-0001ar-2h;
	Sun, 09 Mar 2025 17:57:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1trKts-0001dj-36;
	Sun, 09 Mar 2025 17:57:21 +0000
Date: Sun, 9 Mar 2025 17:57:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v12 12/13] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <Z83WgMeg_IxgbxhO@shell.armlinux.org.uk>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-13-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309172717.9067-13-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_105738_909336_98597539 
X-CRM114-Status: GOOD (  21.04  )
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

On Sun, Mar 09, 2025 at 06:26:57PM +0100, Christian Marangi wrote:
> +static int an8855_port_enable(struct dsa_switch *ds, int port,
> +			      struct phy_device *phy)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +
> +	return regmap_set_bits(priv->regmap, AN8855_PMCR_P(port),
> +			       AN8855_PMCR_TX_EN | AN8855_PMCR_RX_EN);

Shouldn't you wait for phylink to call your mac_link_up() method?

> +}
> +
> +static void an8855_port_disable(struct dsa_switch *ds, int port)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +	int ret;
> +
> +	ret = regmap_clear_bits(priv->regmap, AN8855_PMCR_P(port),
> +				AN8855_PMCR_TX_EN | AN8855_PMCR_RX_EN);
> +	if (ret)
> +		dev_err(priv->ds->dev, "failed to disable port: %d\n", ret);

Doesn't the link get set down before this is called? IOW, doesn't
phylink call your mac_link_down() method first?

...

> +static void an8855_phylink_mac_link_up(struct phylink_config *config,
> +				       struct phy_device *phydev, unsigned int mode,
> +				       phy_interface_t interface, int speed,
> +				       int duplex, bool tx_pause, bool rx_pause)
> +{
> +	struct dsa_port *dp = dsa_phylink_to_port(config);
> +	struct an8855_priv *priv = dp->ds->priv;
> +	int port = dp->index;
> +	u32 reg;
> +
> +	reg = regmap_read(priv->regmap, AN8855_PMCR_P(port), &reg);
> +	if (phylink_autoneg_inband(mode)) {
> +		reg &= ~AN8855_PMCR_FORCE_MODE;
> +	} else {
> +		reg |= AN8855_PMCR_FORCE_MODE | AN8855_PMCR_FORCE_LNK;
> +
> +		reg &= ~AN8855_PMCR_FORCE_SPEED;
> +		switch (speed) {
> +		case SPEED_10:
> +			reg |= AN8855_PMCR_FORCE_SPEED_10;
> +			break;
> +		case SPEED_100:
> +			reg |= AN8855_PMCR_FORCE_SPEED_100;
> +			break;
> +		case SPEED_1000:
> +			reg |= AN8855_PMCR_FORCE_SPEED_1000;
> +			break;
> +		case SPEED_2500:
> +			reg |= AN8855_PMCR_FORCE_SPEED_2500;
> +			break;
> +		case SPEED_5000:
> +			dev_err(priv->ds->dev, "Missing support for 5G speed. Aborting...\n");
> +			return;
> +		}
> +
> +		reg &= ~AN8855_PMCR_FORCE_FDX;
> +		if (duplex == DUPLEX_FULL)
> +			reg |= AN8855_PMCR_FORCE_FDX;
> +
> +		reg &= ~AN8855_PMCR_RX_FC_EN;
> +		if (rx_pause || dsa_port_is_cpu(dp))
> +			reg |= AN8855_PMCR_RX_FC_EN;
> +
> +		reg &= ~AN8855_PMCR_TX_FC_EN;
> +		if (rx_pause || dsa_port_is_cpu(dp))
> +			reg |= AN8855_PMCR_TX_FC_EN;
> +
> +		/* Disable any EEE options */
> +		reg &= ~(AN8855_PMCR_FORCE_EEE5G | AN8855_PMCR_FORCE_EEE2P5G |
> +			 AN8855_PMCR_FORCE_EEE1G | AN8855_PMCR_FORCE_EEE100);

Why? Maybe consider implementing the phylink tx_lpi functions for EEE
support.

> +	}
> +
> +	reg |= AN8855_PMCR_TX_EN | AN8855_PMCR_RX_EN;
> +
> +	regmap_write(priv->regmap, AN8855_PMCR_P(port), reg);
> +}
> +
> +static unsigned int an8855_pcs_inband_caps(struct phylink_pcs *pcs,
> +					   phy_interface_t interface)
> +{
> +	/* SGMII can be configured to use inband with AN result */
> +	if (interface == PHY_INTERFACE_MODE_SGMII)
> +		return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
> +
> +	/* inband is not supported in 2500-baseX and must be disabled */
> +	return  LINK_INBAND_DISABLE;

Spurious double space.

> +}
> +
> +static void an8855_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
> +				 struct phylink_link_state *state)
> +{
> +	struct an8855_priv *priv = container_of(pcs, struct an8855_priv, pcs);
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, AN8855_PMSR_P(AN8855_CPU_PORT), &val);
> +	if (ret < 0) {
> +		state->link = false;
> +		return;
> +	}
> +
> +	state->link = !!(val & AN8855_PMSR_LNK);
> +	state->an_complete = state->link;
> +	state->duplex = (val & AN8855_PMSR_DPX) ? DUPLEX_FULL :
> +						  DUPLEX_HALF;
> +
> +	switch (val & AN8855_PMSR_SPEED) {
> +	case AN8855_PMSR_SPEED_10:
> +		state->speed = SPEED_10;
> +		break;
> +	case AN8855_PMSR_SPEED_100:
> +		state->speed = SPEED_100;
> +		break;
> +	case AN8855_PMSR_SPEED_1000:
> +		state->speed = SPEED_1000;
> +		break;
> +	case AN8855_PMSR_SPEED_2500:
> +		state->speed = SPEED_2500;
> +		break;
> +	case AN8855_PMSR_SPEED_5000:
> +		dev_err(priv->ds->dev, "Missing support for 5G speed. Setting Unknown.\n");
> +		fallthrough;

Which is wrong now, we have SPEED_5000.

> +	default:
> +		state->speed = SPEED_UNKNOWN;
> +		break;
> +	}
> +
> +	if (val & AN8855_PMSR_RX_FC)
> +		state->pause |= MLO_PAUSE_RX;
> +	if (val & AN8855_PMSR_TX_FC)
> +		state->pause |= MLO_PAUSE_TX;
> +}
> +
> +static int an8855_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
> +			     phy_interface_t interface,
> +			     const unsigned long *advertising,
> +			     bool permit_pause_to_mac)
> +{
> +	struct an8855_priv *priv = container_of(pcs, struct an8855_priv, pcs);
> +	u32 val;
> +	int ret;
> +
> +	/*                   !!! WELCOME TO HELL !!!                   */
> +
[... hell ...]
> +	ret = regmap_write(priv->regmap, AN8855_MSG_RX_LIK_STS_2,
> +			   AN8855_RG_RXFC_AN_BYPASS_P3 |
> +			   AN8855_RG_RXFC_AN_BYPASS_P2 |
> +			   AN8855_RG_RXFC_AN_BYPASS_P1 |
> +			   AN8855_RG_TXFC_AN_BYPASS_P3 |
> +			   AN8855_RG_TXFC_AN_BYPASS_P2 |
> +			   AN8855_RG_TXFC_AN_BYPASS_P1 |
> +			   AN8855_RG_DPX_AN_BYPASS_P3 |
> +			   AN8855_RG_DPX_AN_BYPASS_P2 |
> +			   AN8855_RG_DPX_AN_BYPASS_P1 |
> +			   AN8855_RG_DPX_AN_BYPASS_P0);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

Is this disruptive to the link if the link is up, and this is called
(e.g. to change the advertisement rather than switch interface mode).
If so, please do something about that - e.g. only doing the bulk of
the configuration if the interface mode has changed.

I guess, however, that as you're only using SGMII with in-band, it
probably doesn't make much difference, but having similar behaviour
in the various drivers helps with ongoing maintenance.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

