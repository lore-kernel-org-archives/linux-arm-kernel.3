Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D84103E183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAUsju3w6+seco0DBwBvgWL+6NjPkS7WGoDZc8oY+gw=; b=ELXwvJ45+CHAg61mU/l9tJ3VrP
	AA+vXc+QbSWwCZ9WXZMafJ3W035gTliMcu2+0GomZifd2eADwkALeYxqk2Umb++hrGyNspjA7C8gN
	StHkaWeZRhMWXxldliFbNBKOGws1h90kA2jpmqVl8NYApoAX+OcTGvPngLXRFE+AFP60U+12pDiq2
	oFsqjU65TUT1f5HBRpeNJMJhAfb3glY9HmKCocgDj333NYBLntOYX64mXPTbORoyB0azsPOPLQT0C
	Mki1CcgvAXN3mGpi1WSjNmRAyAk6hbOqLSd9+STG/5iRbnMEtEp6kQ4MEJ/vIqEQdBacHzbN+uzL7
	n0qEHWBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sB2-00000008clt-1mQZ;
	Wed, 18 Mar 2026 14:47:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sAz-00000008clV-1s7q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 14:47:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F82B42D8D;
	Wed, 18 Mar 2026 14:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CE2C19421;
	Wed, 18 Mar 2026 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773845231;
	bh=sOGhleK/nOFjGylRZPX91uK0mo+r2D9Kaglk5zGCV1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lNEXEXFHtHqqr5+jSR8/WPIZ+t95wCNVVoFyFK6S3X5ngF1Z0hz/dGpE0/8EVWyzB
	 7mFxzM+0bUnUaAhTlEuc+9AknVBfSI9p5RHBxJWrrAvHGw/j+0E6tA3hZYfaqyW8OI
	 3qeaNgswbe4lvpsnrdMYYgKytxx1PEPv7MSrbOGaa3g8CmFStN9NXTdAjn8hQtLhjO
	 8VQ1bPGUgw/WxjL8g9punuvgQVYnky6+kVtBTz+q+WuZUomr0+eYyGnze5a5zLO7rs
	 Xul8ho2Ds77F5cnV2Odc+IaNBY2ZPyljYTpCY3FqWe/wRWhVHahuEr8FNWykrSONbu
	 lV9haUJJi9Hxg==
From: Simon Horman <horms@kernel.org>
To: wei.fang@nxp.com
Cc: Simon Horman <horms@kernel.org>,
	f.fainelli@gmail.com,
	krzk+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	claudiu.manoil@nxp.com,
	xiaoning.wang@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk,
	pabeni@redhat.com,
	conor+dt@kernel.org,
	chleroy@kernel.org,
	edumazet@google.com,
	frank.li@nxp.com,
	kuba@kernel.org,
	vladimir.oltean@nxp.com,
	linuxppc-dev@lists.ozlabs.org,
	robh@kernel.org,
	davem@davemloft.net,
	andrew+netdev@lunn.ch
Subject: Re: [net-next,11/14] net: dsa: netc: add phylink MAC operations
Date: Wed, 18 Mar 2026 14:46:51 +0000
Message-ID: <20260318144651.1891670-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316094152.1558671-12-wei.fang@nxp.com>
References: <20260316094152.1558671-12-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_074713_548015_288D5AFB 
X-CRM114-Status: GOOD (  19.78  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: dsa: netc: add phylink MAC operations

This commit adds phylink MAC operations to the NETC DSA switch driver,
including support for different PHY interface modes (RGMII, RMII, MII,
REVMII, SGMII, 2500BASE-X).

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc_main.c
> index bc7d48b99610..884ee899fc89 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> @@ -595,10 +595,221 @@ static void netc_switch_get_ip_revision(struct netc_switch *priv)
>  	priv->revision = val & IPBRR0_IP_REV;
>  }
>
> +static void netc_phylink_get_caps(struct dsa_switch *ds, int port,
> +				  struct phylink_config *config)
> +{
> +	struct netc_switch *priv = ds->priv;
> +
> +	priv->info->phylink_get_caps(port, config);
> +}
> +
> +static void netc_port_set_mac_mode(struct netc_port *np,
> +				   unsigned int mode,
> +				   phy_interface_t phy_mode)
> +{
> +	u32 mask = PM_IF_MODE_IFMODE | PM_IF_MODE_ENA;
> +	u32 val = 0;
> +
> +	switch (phy_mode) {
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		val |= IFMODE_RGMII;
> +		/* Enable auto-negotiation for the MAC if its
> +		 * RGMII interface supports In-Band status.
> +		 */
> +		if (phylink_autoneg_inband(mode))
> +			val |= PM_IF_MODE_ENA;
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		val |= IFMODE_RMII;
> +		break;
> +	case PHY_INTERFACE_MODE_REVMII:
> +		val |= PM_IF_MODE_REVMII;
> +		fallthrough;
> +	case PHY_INTERFACE_MODE_MII:
> +		val |= IFMODE_MII;
> +		break;

Does the mask need to include PM_IF_MODE_REVMII? Looking at
netc_port_set_mac_mode(), the mask is set to:

    u32 mask = PM_IF_MODE_IFMODE | PM_IF_MODE_ENA;

which expands to GENMASK(2,0) | BIT(15) = 0x8007. When the REVMII
case sets val |= PM_IF_MODE_REVMII (BIT(3)), this makes val = 0x9.

In netc_mac_port_rmw(), there's a check:

    WARN_ON((mask | val) != mask)

This check would fire on every REVMII configuration since 0x800F != 0x8007.

Additionally, REVMII is reachable because imx94_switch_phylink_get_caps()
advertises PHY_INTERFACE_MODE_REVMII as supported for port 2. When
transitioning FROM REVMII to another mode, PM_IF_MODE_REVMII (BIT(3))
won't be cleared since it's not in the mask, leaving stale configuration.

Should the mask be:

    u32 mask = PM_IF_MODE_IFMODE | PM_IF_MODE_REVMII | PM_IF_MODE_ENA;

> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_2500BASEX:
> +		val |= IFMODE_SGMII;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	netc_mac_port_rmw(np, NETC_PM_IF_MODE(0), mask, val);
> +}

[ ... ]

> +static void netc_port_force_set_rgmii_mac(struct netc_port *np,
> +					  int speed, int duplex)
> +{
> +	u32 mask, val;
> +
> +	mask = PM_IF_MODE_ENA | PM_IF_MODE_SSP | PM_IF_MODE_HD |
> +	       PM_IF_MODE_M10 | PM_IF_MODE_REVMII;
> +
> +	switch (speed) {
> +	default:
> +	case SPEED_1000:
> +		val = FIELD_PREP(PM_IF_MODE_SSP, SSP_1G);
> +		break;
> +	case SPEED_100:
> +		val = FIELD_PREP(PM_IF_MODE_SSP, SSP_100M);
> +		break;
> +	case SPEED_10:
> +		val = FIELD_PREP(PM_IF_MODE_SSP, SSP_10M);
> +		break;
> +	}
> +
> +	if (duplex != DUPLEX_FULL)
> +		val |= PM_IF_MODE_HD;
> +
> +	netc_mac_port_rmw(np, NETC_PM_IF_MODE(0), mask, val);
> +}
> +
> +static void net_port_set_rmii_mii_mac(struct netc_port *np,

This isn't a bug, but should this function be named
netc_port_set_rmii_mii_mac() instead of net_port_set_rmii_mii_mac()?
All other functions in this driver use the netc_ prefix
(netc_port_set_speed, netc_port_force_set_rgmii_mac,
netc_port_set_mac_mode, etc.).

> +				      int speed, int duplex)
> +{
> +	u32 mask, val = 0;
> +
> +	mask = PM_IF_MODE_ENA | PM_IF_MODE_SSP | PM_IF_MODE_HD |
> +	       PM_IF_MODE_M10;
> +
> +	if (speed == SPEED_10)
> +		val |= PM_IF_MODE_M10;
> +
> +	if (duplex != DUPLEX_FULL)
> +		val |= PM_IF_MODE_HD;
> +
> +	netc_mac_port_rmw(np, NETC_PM_IF_MODE(0), mask, val);
> +}

[ ... ]

> +static void netc_mac_link_up(struct phylink_config *config,
> +			     struct phy_device *phy, unsigned int mode,
> +			     phy_interface_t interface, int speed,
> +			     int duplex, bool tx_pause, bool rx_pause)
> +{
> +	struct dsa_port *dp = dsa_phylink_to_port(config);
> +	struct netc_port *np;
> +
> +	np = NETC_PORT(dp->ds, dp->index);
> +	netc_port_set_speed(np, speed);
> +
> +	if (phy_interface_mode_is_rgmii(interface) &&
> +	    !phylink_autoneg_inband(mode)) {
> +		netc_port_force_set_rgmii_mac(np, speed, duplex);
> +	}
> +
> +	if (interface == PHY_INTERFACE_MODE_RMII ||
> +	    interface == PHY_INTERFACE_MODE_REVMII ||
> +	    interface == PHY_INTERFACE_MODE_MII) {
> +		net_port_set_rmii_mii_mac(np, speed, duplex);
> +	}
> +
> +	netc_port_set_hd_flow_control(np, duplex == DUPLEX_HALF);
> +	netc_port_mac_rx_enable(np);
> +}
> +
> +static void netc_mac_link_down(struct phylink_config *config,
> +			       unsigned int mode,
> +			       phy_interface_t interface)
> +{
> +	struct dsa_port *dp = dsa_phylink_to_port(config);
> +
> +	netc_port_mac_rx_graceful_stop(NETC_PORT(dp->ds, dp->index));
> +}
> +
> +static const struct phylink_mac_ops netc_phylink_mac_ops = {
> +	.mac_config		= netc_mac_config,
> +	.mac_link_up		= netc_mac_link_up,
> +	.mac_link_down		= netc_mac_link_down,
> +};
> +
>  static const struct dsa_switch_ops netc_switch_ops = {
>  	.get_tag_protocol		= netc_get_tag_protocol,
>  	.setup				= netc_setup,
>  	.teardown			= netc_teardown,
> +	.phylink_get_caps		= netc_phylink_get_caps,
>  };
>
>  static int netc_switch_probe(struct pci_dev *pdev,
> @@ -639,6 +850,7 @@ static int netc_switch_probe(struct pci_dev *pdev,
>  	ds->num_ports = priv->info->num_ports;
>  	ds->num_tx_queues = NETC_TC_NUM;
>  	ds->ops = &netc_switch_ops;
> +	ds->phylink_mac_ops = &netc_phylink_mac_ops;
>  	ds->priv = priv;
>
>  	priv->ds = ds;

[ ... ]

