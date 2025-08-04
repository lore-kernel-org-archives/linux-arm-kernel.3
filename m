Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0A5C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTIRINgYoitHnaoAkXeOGbYRP3hdr9fcn0B1qbh2HyA=; b=rnwFJtpAeiep7luf4aiJnV7/bk
	QjegfKWfNt+wYyBHvqBaRVtXvttPpW649iheSysWYdTbwWici6Xb5z4igylnEOm0CNUxSDoHYN0mq
	smTQEFedCQ3DwbD7/X5pMj+Bkgj5t0hCSgBfltWJWjFRkKy2pchf4kKfpkRIKg6AlvRcvrBJawgfj
	mzmVa9dBhuSTShDPqnA2eIvxzEVfuhOoXU/WM3T4/7tK+Q8CnjYz+5Gj4KHT70w7GVD+8TnIZ1v7P
	VZxI/Eh8qg/ltX02YAg1SetfHZcfgMtT1rVO9ACqIhr3+qMTThglbRCgaJ35ICkxLwnShWKHtehep
	8NJbJ8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwIQ-0000000Ageb-11J9;
	Mon, 04 Aug 2025 14:36:14 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivS1-0000000AZNP-1G8l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 13:42:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D956D438D4;
	Mon,  4 Aug 2025 13:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754314923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iTIRINgYoitHnaoAkXeOGbYRP3hdr9fcn0B1qbh2HyA=;
	b=jHS+AlRT/xivxi8w6KVC4d7BOyw0a0dgZsgX3ZEe5gw7MPT2JoePgpFlx0mGhXRGGYjeJD
	4V4WLk5m72CK5Cv96Bptp7YlKCve5UXkU/rF2uGZDPK3iOssi05yeSQClcUf9bT4SOF5I5
	XhXXCTyjjM+NmxiEO/lFFQAmSousbTuoSTdq180BpubARulbWw3Tdd3jECazDhwhPuYxnH
	C9OKxqDYfvwYOXdwxPl581LpcZuiW3U0RMabjsT8rNoB5IGHmisAxjZGfKcgGvj3DpCE2Y
	g0uy/fOhfgVu5uirI/IQu6XMZoiTRzIXvmYwIzYx6i1ED/gltjuDRUja3ftPGA==
Date: Mon, 4 Aug 2025 15:41:57 +0200
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
Subject: Re: [PATCH net-next v10 04/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20250804154157.4c507cf9@fedora.home>
In-Reply-To: <bec1b52f-d33d-4088-9d88-3345ecd0fa69@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-5-maxime.chevallier@bootlin.com>
	<bec1b52f-d33d-4088-9d88-3345ecd0fa69@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvgeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_064205_673004_57EFBC45 
X-CRM114-Status: GOOD (  15.11  )
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

On Sat, 26 Jul 2025 22:38:32 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +static int phy_default_setup_single_port(struct phy_device *phydev)
> > +{
> > +	struct phy_port *port = phy_port_alloc();
> > +
> > +	if (!port)
> > +		return -ENOMEM;
> > +
> > +	port->parent_type = PHY_PORT_PHY;
> > +	port->phy = phydev;
> > +
> > +	/* Let the PHY driver know that this port was never described anywhere.
> > +	 * This is the usual case, where we assume single-port PHY devices with
> > +	 * no SFP. In that case, the port supports exactly the same thing as
> > +	 * the PHY itself.  
> 
> I wounder if you should hook into __set_phy_supported() so that DT
> max-speed, and the MAC driver calling phy_set_max_speed() are covered?

This code runs after of_set_phy_supported(), so any speed limitation
enforced through the max-speed DT property will also apply to the
ports's supported field. Hopefully, now that we have a port
representation in DT we can get rid of some of the max-speed use-cases,
such as a 1G PHY connected to a Fast Ethernet port :)

For phy_set_max_speed(), the phy device's supported field will be
update, but not the port's. So indeed, I think we should update the
port's supported upon calling phy_set_max_speed(), I'll add and test
that for the next iteration.

Thanks,

Maxime

