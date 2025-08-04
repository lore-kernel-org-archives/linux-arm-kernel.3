Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39AFC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 14:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33C/cbbkFmBZEeMpAPusxnbTMNnhzWiivF3NeeXbwaQ=; b=4CSPOYyxdmPdRNa+h0Rb8iNIzS
	/q68yfCF+vwU1mUUlD4lgJusruvhJP6L6A5ojwhn5KAbvRddeX8PbqJppjlk1ui57XxLtM2S2Zx4U
	AU8q7KC3NXK4akq1i9vB7Z5N5Ln3/tyzQuTyvC8pn/rBCtsFwQZ3CTvGbupFWJjdoEWJCkTiDJyTv
	2NB9m1HrwJ78uQAd9SMbHX29fcly0sQe80M0DEzRe+chPyoVq4BaMOa7FR+qygSwck044nSWDtcdr
	MYed2YQL0kh1imdQkyCMQ2D3lUDbS9w2GiI3Nn69uLnJ+XYz+PWhjJVB/R+qwBvV45MI/G+RZ9rMR
	4ZKyvnKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwKw-0000000Ah2M-05sE;
	Mon, 04 Aug 2025 14:38:50 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivZZ-0000000AaPG-1wDS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 13:49:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FBCE205AF;
	Mon,  4 Aug 2025 13:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754315391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=33C/cbbkFmBZEeMpAPusxnbTMNnhzWiivF3NeeXbwaQ=;
	b=LVsw/QWmBTRTbTaooY8OnHQGNxXtUmmo6v2YWzKw31V5RczfmrOkRZ4Bg5AzK69ZJPP3CO
	efWANVtXHkcvmFzA/L/2olQwkjVVP1tLcZw2oHRlQH3VPKcgcMhQYkTSikD7sqHIPvWjAf
	YbVouWp4BlIgk+vhlCPc5jfGlziUsNos286bNNxObY+TQlhqQf4lD5egqj+lFZiuAuq2dt
	cSFFUhV25DvgSfFyIvXUHd0lACUzOUMcOjHV697dDEwF9IiiI92KjwGreFuTULR0eP3BiP
	iC4H8DOXMbvHrk6/Ly803rdONV25L/DPTPpgv3WDaIgC9UDqrEJwEGea4GfueQ==
Date: Mon, 4 Aug 2025 15:49:49 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v10 07/15] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <20250804154949.49cbed6f@fedora.home>
In-Reply-To: <762dd1dd-0170-4f7d-b418-1997c48e7f95@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-8-maxime.chevallier@bootlin.com>
	<762dd1dd-0170-4f7d-b418-1997c48e7f95@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_064953_689762_9E83A95A 
X-CRM114-Status: GOOD (  25.22  )
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

On Sat, 26 Jul 2025 23:05:33 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Tue, Jul 22, 2025 at 02:16:12PM +0200, Maxime Chevallier wrote:
> > There are currently 4 PHY drivers that can drive downstream SFPs:
> > marvell.c, marvell10g.c, at803x.c and marvell-88x2222.c. Most of the
> > logic is boilerplate, either calling into generic phylib helpers (for
> > SFP PHY attach, bus attach, etc.) or performing the same tasks with a
> > bit of validation :
> >  - Getting the module's expected interface mode
> >  - Making sure the PHY supports it
> >  - Optionnaly perform some configuration to make sure the PHY outputs  
> 
> Too man n's.
> 
> > +static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
> > +{
> > +	struct phy_device *phydev = upstream;
> > +	struct phy_port *port = phy_get_sfp_port(phydev);  
> 
> Strictly speeding, this is not allowed, reverse Christmas tree...
> 
> The assignment needs to move into the body of the function.
> 
> > +	if (linkmode_empty(sfp_support)) {
> > +		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
> > +
> > +	/* Check that this interface is supported */
> > +	if (!test_bit(iface, port->interfaces)) {
> > +		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");  
> 
> Maybe make this string different to the previous one, so somebody
> debugging issues knows which happened?
> 
> > +/**
> > + * phy_get_sfp_port() - Returns the first valid SFP port of a PHY
> > + * @phydev: pointer to the PHY device to get the SFP port from
> > + *
> > + * Returns: The first active SFP (serdes) port of a PHY device, NULL if none
> > + * exist.
> > + */
> > +struct phy_port *phy_get_sfp_port(struct phy_device *phydev)
> > +{
> > +	struct phy_port *port;
> > +
> > +	list_for_each_entry(port, &phydev->ports, head)
> > +		if (port->active && port->is_mii)  
> 
> Naming is hard, but this actually returns the first mii port.  Is
> there a clear 1:1 mapping? I don't think i've ever seen it, but such a
> SERDES port could be connected to a Ethernet switch? And when you get
> further, add support for a MUX, could it be connected to a MUX?

Hmmm correct, that's a bit fragile. With a mux or a switch that could
be different indeed. There may even be PHYs with 2 MII interfaces one
day ?

So yes it's most of a time a 1:1 mapping but it doesn't have to, I'll
see how I can make that more reliable...

Thanks for the review,

Maxim


