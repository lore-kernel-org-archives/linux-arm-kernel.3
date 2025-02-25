Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CE3C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mY5FfQ+FK/SGrOr5TQi4sZrUW2dqPRYoNVeQLnDmxMg=; b=1UJRjl52nbzf1C/Nhd/faX9cwQ
	Vz1FKpiz6UMqrNdVFPoak+jFbX0T4zPfuQJBHtL/gn4hZEWoH40YyzA475gBzeXFDWBMVx2om21iV
	YB9Pkw69dSX07hO1juZzPyDOOQTto1jUShYlbCYxjKgBsXzesQC1mV8X8z9l3oOpmGFfjgAG2/9Ku
	VzLynotN8VBvA9lLGwjmuUXdzKOv6HZ+MA9EpmGIzz6nGsCBBGin+ybZ3dgWHSx8Y71/pSDA+pwMh
	G/bq/cdOo7oD1uRuP6Ob7gTjLjyxdIupWWaXNvuU6Lhs8UJ2U7FbiAbZ437NfSEDC7MUxrOgX8GIz
	zKw6XJcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxyQ-00000000Hxy-15co;
	Tue, 25 Feb 2025 16:39:58 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvkU-0000000HV3I-3JjV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:17:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6E4043425;
	Tue, 25 Feb 2025 14:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740493042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mY5FfQ+FK/SGrOr5TQi4sZrUW2dqPRYoNVeQLnDmxMg=;
	b=hGy97bFZf5CYDUbjbclD2/EryWItej2SmmkPIpvJcm5/vQRnqwCPoMwpaE3Sc4N0n4ncS9
	264lUdNYZvNOG1I4IIS55EMlKC5aR7vuW6jpEIIlX2+rS+vN4tszJTsidhgFuDUpbSZAZZ
	FlPZc8RU1Fwz7Mdw4YyqsaCgTa25u0Pp8zqV2pC/nkpfeUoYxsv6/eFApt2jekCY8FIj0D
	/zlP+xkMS5jrI0JIr6F4b2QZh8SFabLUItIcMb0JPiNH8qmGETMMbF314nj6cBzM69ZLm0
	Kn+IQM5qQwr73LZVAm6HZsqwaXSIuNSo7kcqx4c5ZRQQKN94uFLd8/vWLXAfDg==
Date: Tue, 25 Feb 2025 15:17:20 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, davem@davemloft.net,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Simon
 Horman <horms@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 12/13] net: phy: phylink: Use phy_caps_lookup
 for fixed-link configuration
Message-ID: <20250225151720.29911b4b@fedora.home>
In-Reply-To: <20250224150440.7fe5458d@kmaincent-XPS-13-7390>
References: <20250222142727.894124-1-maxime.chevallier@bootlin.com>
	<20250222142727.894124-13-maxime.chevallier@bootlin.com>
	<20250224144431.2dca9d19@kmaincent-XPS-13-7390>
	<Z7x52C5dE3eXWomq@shell.armlinux.org.uk>
	<20250224150440.7fe5458d@kmaincent-XPS-13-7390>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemtggtfegtmeeglehfgeemfeeiheehmegsheejgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegttgeftgemgeelfhegmeefieehheemsgehjeegpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhof
 hhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_061726_985403_E46E2136 
X-CRM114-Status: GOOD (  23.70  )
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

On Mon, 24 Feb 2025 15:04:40 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> On Mon, 24 Feb 2025 13:53:28 +0000
> "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> 
> > On Mon, Feb 24, 2025 at 02:44:31PM +0100, Kory Maincent wrote:  
> > > On Sat, 22 Feb 2025 15:27:24 +0100
> > > Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> > >     
> > > > When phylink creates a fixed-link configuration, it finds a matching
> > > > linkmode to set as the advertised, lp_advertising and supported modes
> > > > based on the speed and duplex of the fixed link.
> > > > 
> > > > Use the newly introduced phy_caps_lookup to get these modes instead of
> > > > phy_lookup_settings(). This has the side effect that the matched
> > > > settings and configured linkmodes may now contain several linkmodes (the
> > > > intersection of supported linkmodes from the phylink settings and the
> > > > linkmodes that match speed/duplex) instead of the one from
> > > > phy_lookup_settings().    
> > > 
> > > ...
> > >     
> > > >  
> > > >  	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, mask);
> > > >  	linkmode_set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, mask);
> > > > @@ -588,9 +591,9 @@ static int phylink_parse_fixedlink(struct phylink *pl,
> > > >  
> > > >  	phylink_set(pl->supported, MII);
> > > >  
> > > > -	if (s) {
> > > > -		__set_bit(s->bit, pl->supported);
> > > > -		__set_bit(s->bit, pl->link_config.lp_advertising);
> > > > +	if (c) {
> > > > +		linkmode_or(pl->supported, pl->supported, match);
> > > > +		linkmode_or(pl->link_config.lp_advertising,
> > > > pl->supported, match);    
> > > 
> > > You are doing the OR twice. You should use linkmode_copy() instead.    
> > 
> > No, we don't want to copy pl->supported to
> > pl->link_config.lp_advertising. We just want to set the linkmode bit
> > that corresponds to the speed/duplex in each mask.
> > 
> > That will result in e.g. the pause mode bits will be overwritten despite
> > being appropriately set in the advertising mask in the code above this.  
> 
> Ok, so the right thing should be this:
> linkmode_or(pl->link_config.lp_advertising, pl->link_config.lp_advertising,
> 	    match)

That looks right indeed, I'll address that for the next iteration.

Thanks for reviewing,

Maxime

