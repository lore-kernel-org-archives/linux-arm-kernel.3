Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51640C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNmSyDJcR//atUZ0VI/KDC8D5+6hGjhamZjsGf8geS4=; b=EbZ4Zk0Bk6lLMqizqG8Sza3wFL
	G1zUNhhcjeVjfz3mlFY0N+GaI2+MKuNsQhO/N8IM25HuUBTscST8OOO7gP6OCu6EYEmKXtisAPoC3
	Pd8B2HHE3D3LJ9oksm1f7YFGun+zWsr2REWbDvvXUsAE++LeIpSJBdhHBOOMQ+1TYelnkJ71LzxRS
	xO1F79cVVdvg5Mrx11J0D2qyKhVI4uLsEfVwl+ANJV7LMXT/ByJLRJg+c8HA7Lje4dhwjr8VOVXge
	rfIMZcjAteapkCLt/KtC3cntERc71RJiPMkxOjQE3VUmXQKC2CsfuVPmuzqqj//cBpL62aluKKaga
	j4yyu+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1QN-00000004ij5-0czl;
	Mon, 17 Feb 2025 13:44:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1Ot-00000004iQi-0ctH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 13:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PNmSyDJcR//atUZ0VI/KDC8D5+6hGjhamZjsGf8geS4=; b=qbmgE286BZdak7XL+mky6WmBud
	gXG1+IgkUstfuDE1scOhlcH7TQ4lak5O6zX8AV48CgzfDqTAZXOlhEWfPGBpN/9nJIuzWokMi6vW8
	U9S/zGMf35rtCnx4/LC8mKlts+Mn01GO3jRTvH+M6KzfKAExz+SF2ak1Nrfvu43ZDguU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tk1Om-00Eyt6-AD; Mon, 17 Feb 2025 14:43:00 +0100
Date: Mon, 17 Feb 2025 14:43:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH net-next v4 05/15] net: phy: Create a phy_port for
 PHY-driven SFPs
Message-ID: <5d618829-a9bc-4dd4-8a2e-6ce3a4acd51e@lunn.ch>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
 <20250213101606.1154014-6-maxime.chevallier@bootlin.com>
 <Z7DjfRwd3dbcEXTY@shell.armlinux.org.uk>
 <20250217092911.772da5d0@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217092911.772da5d0@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_054307_184984_8D7DCD60 
X-CRM114-Status: GOOD (  11.18  )
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

> One way to avoid that would be to extract out of phylink/phylib all the
> functions for linkmode handling that aren't tied to phylink/phylib
> directly, but are about managing the capabilities of each interface,
> linkmode, speed, duplex, etc. For phylink, that would be :
> 
> phylink_merge_link_mode
> phylink_get_capabilities
> phylink_cap_from_speed_duplex
> phylink_limit_mac_speed
> phylink_caps_to_linkmodes
> phylink_interface_max_speed
> phylink_interface_signal_rate
> phylink_is_empty_linkmode
> phylink_an_mode_str
> phylink_set_port_modes

...

> These would go into linkmode.c/h for example, and we'd have a shared set
> of helpers that we can use in phylink, phylib and phy_port.

Please be careful with the scope of these. Heiner is going through
phylib and trying to reduce the scope of some of the functions we
exporting in include/linux/phy.h to just being available in
drivers/net/phy. That will help stop MAC drivers abuse them. We should
do the same here, limit what can actually use these helpers to stop
abuse.

	Andrew

