Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7CDC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 20:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IOvRCaeU2dh9qCzyT4cj/QLVuaRH9ZU7loSGJGjyNw=; b=0WNgs5pgwrHXVfxtIU7H4VNbb/
	FncOHmyLi1W/Gw9zWc4UqGhTVpMO/PH2hTK/KoHmsV9SNkR+3UHBrJWsxi3JShUFWCIPpkDlOxQo5
	PFJuYsu5sJr2gLaixPpxRMv/UDVUZe4k6NVQ0gNMMNkIj7LluGT7W0s+kfxAzTpqzV+eOZFuqPehV
	woWZdIc4iS7h/TC3oCpVXb6hBMD+jGh52RIs9G6odkDepehf68YE7xT4Ohy2Ezm+fUmHtH5dpT/QW
	lSLv+KaRg7WfkQ85Nk+F2FE09Cxlc+EIZy8Vb/Iv8BrQvk+wElTsxd8bmc8NxfcmIVwXrRfoYkbxG
	HnFJs9rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uflcx-0000000BrQZ-09Je;
	Sat, 26 Jul 2025 20:36:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uflaP-0000000BrBv-12Sj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 20:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0IOvRCaeU2dh9qCzyT4cj/QLVuaRH9ZU7loSGJGjyNw=; b=pu4x+6J/Q5hOdj+NEyYZ5raFsg
	jCIDvwFHmz7KQWUH0oDDhyTBYatlBOtOYZEIICDmPmyfLGPWOi23j9PNcrO0x+ET3Trsq6/ccMv+0
	lUy1BNGTKxDQjJNF4gOowmSwFFityHocQVR/NFCsUcp8+AI36Cp1m5hYwpussAVO797Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uflaH-002xqk-Ma; Sat, 26 Jul 2025 22:33:33 +0200
Date: Sat, 26 Jul 2025 22:33:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v10 04/15] net: phy: Introduce PHY ports
 representation
Message-ID: <a915e167-1490-4a20-98a8-35b4e5c6c23c@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-5-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121623.609732-5-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_133341_287506_E4FBCBB8 
X-CRM114-Status: GOOD (  14.12  )
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

> +
> +/**
> + * phy_caps_medium_get_supported() - Returns linkmodes supported on a given medium
> + * @supported: After this call, contains all possible linkmodes on a given medium,
> + *	       and with the given number of lanes.

Maybe nit picking, but maybe append:

, or less.

> +		/* For most cases, min_lanes == lanes, except for 10/100BaseT that work
> +		 * on 2 lanes but are compatible with 4 lanes mediums
> +		 */
> +		if (link_mode_params[i].mediums & BIT(medium) &&
> +		    link_mode_params[i].lanes >= lanes &&
> +		    link_mode_params[i].min_lanes <= lanes) {

We should only care about min_lanes here. I don't think the
link_mode_params[i].lanes >= lanes is needed.

Maybe you can add a BUILD_BUG_ON() into the macro to ensure
min_lanes <= lanes?

> +struct phy_port *phy_of_parse_port(struct device_node *dn)
> +{
> +	struct fwnode_handle *fwnode = of_fwnode_handle(dn);
> +	enum ethtool_link_medium medium;
> +	struct phy_port *port;
> +	const char *med_str;
> +	u32 lanes, mediums = 0;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(fwnode, "lanes", &lanes);
> +	if (ret)
> +		lanes = 0;

The DT binding says that both properties are required. So i think this
should be:

		return ret;

> + * phy_port_get_type() - get the PORT_* attribut for that port.

attribut_e_

> +	 * If the port isn't initialized, the port->mediums and port->lanes
> +	 * fields must be set, possibly according to stapping information.

st_r_apping

	Andrew

