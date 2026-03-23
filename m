Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB10EC01A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3rUhqBT1KeCDZlm1nLAVKvFKDzC8SHFz9yiyugPwjo=; b=TShVI3FLY5wW/7eOYg0f2vMRcy
	wobbMCVXSaf2NbLIFu4l8uJVIUmzZLlu1VHJRoifNGwYFvA23gzTdvLyf21fBRpjgl4MI6II1Fm+F
	KqvH0tCldwRW+LcpkL/wx783saYO4rBzwP4iC2DRIdvWWDHYEWYxPSQjgWbrKHF22GrmiNn5TtWWd
	aIG14zTUhN5VF5oJkjhQFRw7beDXFdtXrWqoXvYSbuF8cq4ZIQdHsocVXIQpngGkglQHS9XkWjrnD
	hy5u8VnKa0/SH/m1AWJO4LN2uMgdP7a2JwgWCq+ixlPf2OVVTNEBSHplTjN5MgqcpCYBT29qAz0Kd
	wEJ62WVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bcj-0000000GNib-2uY6;
	Mon, 23 Mar 2026 09:31:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bch-0000000GNiA-0JHP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:31:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F3rUhqBT1KeCDZlm1nLAVKvFKDzC8SHFz9yiyugPwjo=; b=etqlIQfJSSDSaWC3g3CkplcGX+
	Az+ECRx6Cd67IDOLKoApAzDji/xzE74lFrsxHONaOYr/6D8zl1uKVNXf+EdkRlQYLvjekUSCPPgJl
	B6elVyuHZdADUUDQxvi7dFUr7eCVzXxl8y2zVjFz6YGCEZb/UGk5ApAGJIymWdcY2ByE5R4P2SXkH
	Ay/gkmTp1OTxO+62vbYDEZ5Od3e1c1wGDJ+xblhu518mcW5l5nCzOv6lbc8gCjnEYU8H1l13kthWV
	ugySbdVObDVq418ku/v3FG963j2qdsGQbxQthOMQsnw+tUTC+AWi/TwUKK55j1kpSSqv+mCKZgNAf
	EpjKTHNA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58958)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w4bcS-000000000Cw-41vC;
	Mon, 23 Mar 2026 09:30:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w4bcQ-000000003up-3Y8E;
	Mon, 23 Mar 2026 09:30:42 +0000
Date: Mon, 23 Mar 2026 09:30:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, f.fainelli@gmail.com,
	frank.li@nxp.com, chleroy@kernel.org, horms@kernel.org,
	andrew@lunn.ch, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 net-next 11/14] net: dsa: netc: add phylink MAC
 operations
Message-ID: <acEIQqI-_oyCym8O@shell.armlinux.org.uk>
References: <20260323060752.1157031-1-wei.fang@nxp.com>
 <20260323060752.1157031-12-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323060752.1157031-12-wei.fang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_023059_117185_E27E92BD 
X-CRM114-Status: GOOD (  19.95  )
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

On Mon, Mar 23, 2026 at 02:07:49PM +0800, Wei Fang wrote:
> +static void netc_port_set_mac_mode(struct netc_port *np,
> +				   unsigned int mode,
> +				   phy_interface_t phy_mode)
> +{
> +	u32 mask = PM_IF_MODE_IFMODE | PM_IF_MODE_REVMII | PM_IF_MODE_ENA;
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

I would prefer newer drivers not to use phylink_autoneg_inband()
anymore. Note that there is no need to support RGMII inband in the
kernel (nor is there any proper support without a "phylink_pcs"
being present to provide the inband status.)

> +static void netc_port_set_hd_flow_control(struct netc_port *np, bool en)
> +{
> +	if (!np->caps.half_duplex)
> +		return;
> +
> +	/* The HD_FCEN is used in conjunction with the PM_HD_FLOW_CTRL
> +	 * register, which has a default value, so currently we do not
> +	 * set it in the driver. The half duplex flow control works by
> +	 * the backpressure, and the backpressure is essentially just
> +	 * a long preamble transmitted on the link intended to create
> +	 * a collision and get the half duplex link partner to defer.
> +	 */
> +	netc_mac_port_rmw(np, NETC_PM_CMD_CFG(0), PM_CMD_CFG_HD_FCEN,
> +			  en ? PM_CMD_CFG_HD_FCEN : 0);

We don't support half duplex backpressure in the kernel. I notice
you always enable this whenever HD mode is negotiated, which means
there's no way for the user to disable it. Flow control can cause
problems. Ethernet relies on packet dropping for congestion
management.

> +static void imx94_switch_phylink_get_caps(int port,
> +					  struct phylink_config *config)
> +{
> +	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> +				   MAC_1000FD;
> +
> +	switch (port) {
> +	case 0 ... 1:
> +		__set_bit(PHY_INTERFACE_MODE_SGMII,
> +			  config->supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> +			  config->supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> +			  config->supported_interfaces);
> +		config->mac_capabilities |= MAC_2500FD;
> +		fallthrough;
> +	case 2:
> +		config->mac_capabilities |= MAC_10 | MAC_100;
> +		__set_bit(PHY_INTERFACE_MODE_MII,
> +			  config->supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_RMII,
> +			  config->supported_interfaces);
> +		if (port == 2)
> +			__set_bit(PHY_INTERFACE_MODE_REVMII,
> +				  config->supported_interfaces);

The "case 2" above already ensures that port is 2 here.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

