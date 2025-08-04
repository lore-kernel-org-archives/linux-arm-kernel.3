Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6544C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 14:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hP+zIvyoBGYMCE15FD3haQLr1XBrKDkbsIDrg0+NHfc=; b=fseSoP2ex0wY8nQuyOiSW/+RHK
	5Mf3V3ZX9WDC+6daq6Gv4n2R2XWZZ8DgSKOYj3LWk5ap33F6bBnAe1L980gIednUhzwbb5LK03AN/
	A4frO9yN1od6h0XNw+P5yaUzFFeXx/DPmELdYq3+D/wkbw5UDKX4yltMQX+yx2Za7oWAxE/ovhTPY
	vdI0HIEyu8FekEy73N4mgISs8zp/f0tQSScqo9Uj87/FfrD1c3NEuXe7FDCN26vUvsr7kxzoVSXg7
	mga1/cQhXOARPcFIk7G++sVFZvcWLugzBQ6ijD8dyy4dvSm3kmEmxs4llpzOIajFq8nJiJ0te9YY9
	EX6p3ELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwNS-0000000AhIQ-3rlU;
	Mon, 04 Aug 2025 14:41:26 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivb1-0000000AaVk-1uW6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 13:51:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28CA242D7F;
	Mon,  4 Aug 2025 13:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754315480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hP+zIvyoBGYMCE15FD3haQLr1XBrKDkbsIDrg0+NHfc=;
	b=BnZFOCJH/+d+WMYUzst8s3sUTgn/XaS7tm0B2eDJh9galaxY99J9zWvefMBQEydZd61EMw
	zfSmFBZ7gPuFdvl+ZIfFR6X/GRpKH9m7QRoozJ8OsF3VRtRnPaQvtadqCz5vqeIojhRkBW
	1pZtykKv0y+HtV/JhvELF7yCkT21wpEJJEWxhzJPDXAKV32STBKZ5qPg3uNTHfgu5H76Q+
	WIVjMsu7m17+jqaMdAQHjvq+JZYLLRRb9GSrGflPeJra96yjkawBeR6mnJUWcJNInWiKE5
	lLydblU3gPYygdpL0/JchNuQesvgKJxvVW8U7zm/pmS9Wib4TgDGJFFOQPf9gg==
Date: Mon, 4 Aug 2025 15:51:15 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
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
Message-ID: <20250804155115.4a301cdc@fedora.home>
In-Reply-To: <aIX35MUxx-OkvX4G@shell.armlinux.org.uk>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-8-maxime.chevallier@bootlin.com>
	<aIX35MUxx-OkvX4G@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlr
 dhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_065123_652889_1DB5F171 
X-CRM114-Status: GOOD (  19.76  )
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

On Sun, 27 Jul 2025 10:56:52 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Tue, Jul 22, 2025 at 02:16:12PM +0200, Maxime Chevallier wrote:
> > +static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
> > +{
> > +	struct phy_device *phydev = upstream;
> > +	struct phy_port *port = phy_get_sfp_port(phydev);
> > +
> > +	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
> > +	DECLARE_PHY_INTERFACE_MASK(interfaces);
> > +	phy_interface_t iface;
> > +
> > +	linkmode_zero(sfp_support);
> > +
> > +	if (!port)
> > +		return -EINVAL;
> > +
> > +	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
> > +
> > +	if (phydev->n_ports == 1)
> > +		phydev->port = sfp_parse_port(phydev->sfp_bus, id, sfp_support);
> > +
> > +	linkmode_and(sfp_support, port->supported, sfp_support);
> > +
> > +	if (linkmode_empty(sfp_support)) {
> > +		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);  
> 
> I've been moving phylink away from using sfp_select_interface() because
> it requires two stages of translation - one from the module capabilties
> to linkmodes, and then linkmodes to interfaces.
> 
> sfp_parse_support() now provides the interfaces that the optical module
> supports, and the possible interfaces that a copper module _might_
> support (but we don't know for certain about that until we discover a
> PHY.)
> 
> The only place in phylink where this function continues to be used is
> when there's an optical module which supports multiple different
> speeds, and we need to select it based on the advertising mask provided
> by userspace. Everywhere else shouldn't use this function, but should
> instead use the interfaces returned from sfp_parse_support().

Thanks for the input, it'll make things even simpler so I'm all in for
that. I'll rework this for the next iteration, thanks a lot for taking
a look at this !

Maxime

> 


