Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE580C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 21:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKHW63eS4vhsiq6w1j0xdaM2ua1lyfOxwy9A13DXxwY=; b=R6K9a4CQsMISlYER/GKjQZnrlx
	uzQnFCS+WZ/VIfCrInYEAsgOG56FMAn/NHFlie9Cz8gevS9ReUFLvZXINN/a9GnYpSJufazzprJcp
	9F3868MOwoHdx+dqppWcgP5NcEDqEG9eXmgX08k9UvviHB9daYOdidRKlDbUO7424NiUefx9WUuYQ
	e3enXeMZy7MIHyeYq+hAHTzP/kChXYFGo0NBF4otzXBmovBmOxPZnSOX+U8tso/G3nSIuqnGjmFDy
	alA4C2cDHiXvkmWDWVLnondDugKdsyX42qhThyRPabkJ79IJxymNnyJADAUlK4vk2BftKPS+PfM1s
	5uql3pjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufmJ8-0000000BvSY-3Y2m;
	Sat, 26 Jul 2025 21:19:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufmGb-0000000BvIG-0Lqz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 21:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RKHW63eS4vhsiq6w1j0xdaM2ua1lyfOxwy9A13DXxwY=; b=oJVz5O3PaIy0LU9cDnAZlXPyno
	R+veBl7QJbWRkAf2pTm7637bQrp0MNhVqHYYJixxbfh5Vlvl34c/8wFRbagtFmR11sUCuNhTxaGg1
	DX54ZfLTubSCixKIqtMnFDov/gMyBBn+HQScGGSxxyddsvg5ryJOJGKjBuB37+3ShNMk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ufmGV-002y5Q-RC; Sat, 26 Jul 2025 23:17:11 +0200
Date: Sat, 26 Jul 2025 23:17:11 +0200
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
Subject: Re: [PATCH net-next v10 10/15] net: phy: marvell10g: Support SFP
 through phy_port
Message-ID: <b6498944-0d06-459f-9668-26813f037166@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-11-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121623.609732-11-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_141717_125016_951DCA81 
X-CRM114-Status: GOOD (  10.96  )
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

> +	} else if (port->not_described) {
> +		/* This PHY can do combo-ports, i.e. 2 MDI outputs, usually one
> +		 * of them going to an SFP and the other one to a RJ45
> +		 * connector. If we don't have any representation for the port
> +		 * in DT, and we are dealing with a non-SFP port, then we
> +		 * mask the port's capabilities to report BaseT-only modes
> +		 */
> +		port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
> +
> +		phy_port_filter_supported(port);

That seems a little bit error prone. Maybe add a helper to set
port->mediums, which also makes the phy_port_filter_supported() call?

	Andrew

