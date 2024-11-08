Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C4CD5E15A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 11:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSxeVaPlRH4R/1jmcFUVY/CzYVAx0pe3ADP7c3aPo+8=; b=oYv8bzwaeCCHVxawQ5NrHbzhOu
	2hxS3gcU9+NtDhWNhksQIID/ljvV+NsYWt28hbi8dS3kgl3naSf9UJu/mpeCKtejBL2Zqa6YADLH0
	GRQpcswIiQHs6djkmmAXOZgVIm4lX3o5OLSNXr8SmnTghXc543OqEbHit/nhHiLzf/r2kOf34WGSA
	j34pDZdT74uXUxNuSQ0LhNgxy5L+p6CV8jVtMfUrUApXhZO4CK8lb9UVimEelmYvh3q0Hbi5HKJyp
	LIgQyzWkVZ16QB05VkXS4mXjqdOQUd1sJiO/0rvxjBUxSetUSJbzlT1t8adiDZD19PgBuUr6M0wZL
	35fXTw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NEM-0000000AM4w-3GwL;
	Fri, 08 Nov 2024 11:32:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Mct-0000000ACk6-1znO;
	Fri, 08 Nov 2024 10:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZSxeVaPlRH4R/1jmcFUVY/CzYVAx0pe3ADP7c3aPo+8=; b=davprMUwoZuw9s1xZM2hywGQxR
	icVbkLwClj9aguIEBU9TkSS33HOsACjshGeh4aC9gDW+QMwzd8LArSJGbeH2D/AlZBlRvFYo85/zg
	iw6mu+jZk0Era68MYkpt4cB9kSM5Z2rIyMCB+uKivuGHFBoiUTZoKeujzGJnGdkTMl+voC+O2QQv+
	q3g3OvvHEASdwLMGN0SLWIhAJEV89kOR86jIFH8cp37qNzz3HYnFxFdMa1CEGYEUuOVZX0CK3fzdz
	g+Nzap66O20sc2E/4hWoiJHA+EenRc6hupDPl0B7r7PPVhAJV4s6ThatZndV8sLGfCZrN5c2pVLry
	hMd3oVnQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60982)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1t9Maf-0004wK-1a;
	Fri, 08 Nov 2024 10:51:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1t9Mab-0002DN-1v;
	Fri, 08 Nov 2024 10:51:41 +0000
Date: Fri, 8 Nov 2024 10:51:41 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v3 2/3] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <Zy3tPeWCHOH-CMoy@shell.armlinux.org.uk>
References: <20241106122254.13228-1-ansuelsmth@gmail.com>
 <20241106122254.13228-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106122254.13228-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_025403_543616_BDA599F7 
X-CRM114-Status: GOOD (  17.44  )
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

On Wed, Nov 06, 2024 at 01:22:37PM +0100, Christian Marangi wrote:
> +static int an8855_port_enable(struct dsa_switch *ds, int port,
> +			      struct phy_device *phy)
> +{
> +	int ret;
> +
> +	ret = an8855_port_set_status(ds->priv, port, true);
> +	if (ret)
> +		return ret;
> +
> +	if (dsa_is_user_port(ds, port))
> +		phy_support_asym_pause(phy);

This is unnecessary if you've set the phylink capabilities correctly
because phylink_bringup_phy() will setup the PHY accordingly.

> +static u32 en8855_get_phy_flags(struct dsa_switch *ds, int port)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +
> +	/* PHY doesn't need calibration */
> +	if (!priv->phy_require_calib)
> +		return 0;
> +
> +	/* Use BIT(0) to signal calibration needed */
> +	return BIT(0);

This should be a #define somewhere that preferably includes the PHY
name so we have an idea in future which PHY driver is going to be
making use of this random bit.

> +static struct phylink_pcs *
> +an8855_phylink_mac_select_pcs(struct phylink_config *config,
> +			      phy_interface_t interface)
> +{
> +	struct dsa_port *dp = dsa_phylink_to_port(config);
> +	struct an8855_priv *priv = dp->ds->priv;
> +
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_2500BASEX:
> +		return &priv->pcs;
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +static void
> +an8855_phylink_mac_config(struct phylink_config *config, unsigned int mode,
> +			  const struct phylink_link_state *state)
> +{
> +	struct dsa_port *dp = dsa_phylink_to_port(config);
> +	struct dsa_switch *ds = dp->ds;
> +	struct an8855_priv *priv;
> +	int port = dp->index;
> +
> +	priv = ds->priv;
> +
> +	switch (port) {
> +	case 0:
> +	case 1:
> +	case 2:
> +	case 3:
> +	case 4:
> +		return;
> +	case 5:
> +		break;
> +	default:
> +		dev_err(ds->dev, "unsupported port: %d", port);
> +		return;
> +	}

	if (port != 5) {
		if (port > 5)
			dev_err(ds->dev, "unsupported port: %d", port);
		return;
	}

is simpler, no?

> +static int an8855_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
> +			     phy_interface_t interface,
> +			     const unsigned long *advertising,
> +			     bool permit_pause_to_mac)
> +{
> +	struct an8855_priv *priv = container_of(pcs, struct an8855_priv, pcs);
> +	u32 val;
> +	int ret;
> +
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_RGMII:
> +		return 0;

This shouldn't happen. First, in an8855_phylink_mac_select_pcs(), you
don't return a PCS in this mode. Second, phylink is highly unlikely to
switch from SGMII/2500baseX to RGMII mode. Third, in commit
486dc391ef43 ("net: phylink: allow mac_select_pcs() to remove a PCS")
will ensure that if phylink does do such a switch, because
an8855_phylink_mac_select_pcs() returns NULL for RGMII, these PCS
functions will never be called for RGMII modes.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

