Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB552C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 14:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgwV+fOXVrQs+Zt5dFjBh21EJNlqb8OXXzjZNjPngpM=; b=K1sRk2z81wfNtr34cCJaSVr1Qg
	SJ0GLC6ueG/n1kwdoX/qZRjc0Sc4YmypYbdJ03PtuM0Ei3yZ8J/lzY+Z1pTHK12nYZTGUNqxT1lwr
	kwnfXumX18R+599UlgU4itV/4aw1xDQMl+eqMmGRL7Lvo7ohkElqnLbqeHr/Okd52F++Ia98QME/f
	DtVG4TJtg37+fiwR9JqUQ1ktUOYJWS3w+TL5c4PeIrUxJZjvyF95q7S0chK7xE6qcZ3vgK5d3qI0O
	lIC9owdnB9DNIZ+OSRG4Oh92ZrUCL4O/XpJdwjY33eVBkPia/NuzdLECuAc0LaeQXOA5p6fuv9Ggj
	3cRRFe2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwDM-0000000Afuz-2iUQ;
	Mon, 04 Aug 2025 14:31:00 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivUT-0000000AZdB-3Xek
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 13:44:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E20CC205A4;
	Mon,  4 Aug 2025 13:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754315075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgwV+fOXVrQs+Zt5dFjBh21EJNlqb8OXXzjZNjPngpM=;
	b=cn1iVYZFX0jUTmSyC5w/5e6EI47N+q6Fu9FjRlF81cT9C1t3/qclIKDqXQuit6thzC2Dwm
	/7Xjmv0Njv76DbeYwvS/4nUaWU2Hy7rai1AuKmW8DULAVF4f3XxHoKjgSTlYvT9DN7yDox
	b8EVmhe2KkkAhZ43Sp1d2P5UndZa8g9iHRHIWspq8oi7Th+2FUmpRDvfMnq8G/ei4Z1VdU
	jPAExvJF0VxlEE3ddGK4GfAZw6mkS6y0YRPkP27B96Y+00GWCOLFAiXvLILrFIGwFAc1cr
	c5mTYnbNf7YL2B4aFohic47T3qfrgcWHmPm2BrPuRZxbvch9hDjSnAR9m9H8XA==
Date: Mon, 4 Aug 2025 15:44:30 +0200
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
Subject: Re: [PATCH net-next v10 05/15] net: phy: dp83822: Add support for
 phy_port representation
Message-ID: <20250804154430.3896b385@fedora.home>
In-Reply-To: <6721b691-bae8-4a91-b14b-276b14b89244@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-6-maxime.chevallier@bootlin.com>
	<6721b691-bae8-4a91-b14b-276b14b89244@lunn.ch>
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
X-CRM114-CacheID: sfid-20250804_064438_037563_0CA7EC86 
X-CRM114-Status: GOOD (  15.75  )
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

On Sat, 26 Jul 2025 22:50:08 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +#if IS_ENABLED(CONFIG_OF_MDIO)
> > +		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> > +			dp83822->fx_signal_det_low =
> > +				device_property_present(&phydev->mdio.dev,
> > +							"ti,link-loss-low");
> > +
> > +		/* ti,fiber-mode is still used for backwards compatibility, but
> > +		 * has been replaced with the mdi node definition, see
> > +		 * ethernet-port.yaml
> > +		 */
> > +		if (!dp83822->fx_enabled)
> > +			dp83822->fx_enabled =
> > +				device_property_present(&phydev->mdio.dev,
> > +							"ti,fiber-mode");  
> 
> Could be my grep fu is broken but:
> 
> ~/linux$ grep -r fiber-mode arch/*
> ~/linux$ 
> 
> So it does not even appear to be used. If it is not used, do we have
> to consider backwards compatibility?
> 
> Maybe consider marking the property deprecated and point to the new
> binding?

I'd love that :)

Let's mark it as deprecated then, I'll do that for the next iteration.

Maxime

> 
> 	Andrew


