Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7288DC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFqK7fZR0TmLvJNaC6gEPC6OF78JWtmfQ3Z2qsh5268=; b=XDVb+DijKmYOTPb/AQmpHQdN/8
	BfhPLxJgqUUQvgGBWxr60ZPlbUhHB8c9NTR819e/0QZl2OVd7XP3uCgFA5a4dOBRE0IqBpM4atIMu
	aaYuDok4g+E2HGWI7/3jT0kHOJ3hvxz7bPa5HF8RTEQjhOhKdM62hoehU55q2JZlYAAecqUbmAmij
	OqH9b7YW1sU0/W0mWrm/KPOoS7TyCzlJpyr+jUisb+5VdWLocNzaOYiHHQ/rbTXyVtkVEQyPnL7rf
	+1l2iyhXK3s92djkcqbVxmaCvF3P0pdP6yDlqTnvomAxJNh6PgnBWThUhSHIXxz1r5PEOpKCBwU15
	UYH3Kjgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8Ez-0000000Ac1I-1Abs;
	Thu, 06 Mar 2025 10:14:09 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8DM-0000000AbTN-1cKJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 10:12:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCE0E4316C;
	Thu,  6 Mar 2025 10:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741255944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SFqK7fZR0TmLvJNaC6gEPC6OF78JWtmfQ3Z2qsh5268=;
	b=IYTXaMViXgT4KDoKBENK6wDNSEV6WK78C9Au7GqDTJzzAT2HcOM7fAAZJSA8MwgO7w+jNY
	5IwSkf6puZecNxcMRlYPdotuX+ILjvpfD4OMVpC8rKHEGIMseZLKhZto/yvChJ5fTpjpt6
	W38VbKmpRiVWpRf7Dv/+KEJRPBmMim7AOSvLhKbow+PP9cCdNDirlyKQIrdjsOo1qe6+78
	Ta/oj1Q/VrSkeYjHQzw7WDqHLo8O/1vaQn5eUpb6w/FMAm22cIn0qXM2FClpmoMaKdpLET
	tQ66l08Xfge6lqjH5Htj5r4Ui4QuTPuYmBYGMjtwsXje6T88ogtgVEBYMlGD2A==
Date: Thu, 6 Mar 2025 11:12:20 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Russell King
 <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next v4 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
Message-ID: <20250306111220.28798e6b@fedora.home>
In-Reply-To: <350bb4f6-f4b5-44c3-a821-ac53c8641705@redhat.com>
References: <20250303090321.805785-1-maxime.chevallier@bootlin.com>
	<20250303090321.805785-10-maxime.chevallier@bootlin.com>
	<350bb4f6-f4b5-44c3-a821-ac53c8641705@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepk
 hhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_021228_756783_05F8F547 
X-CRM114-Status: GOOD (  13.64  )
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

On Thu, 6 Mar 2025 09:56:32 +0100
Paolo Abeni <pabeni@redhat.com> wrote:

> On 3/3/25 10:03 AM, Maxime Chevallier wrote:
> > @@ -879,8 +880,10 @@ static int phylink_parse_fixedlink(struct phylink *pl,
> >  	linkmode_copy(pl->link_config.advertising, pl->supported);
> >  	phylink_validate(pl, pl->supported, &pl->link_config);
> >  
> > -	s = phy_lookup_setting(pl->link_config.speed, pl->link_config.duplex,
> > -			       pl->supported, true);
> > +	c = phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
> > +			    pl->supported, true);
> > +	if (c)
> > +		linkmode_and(match, pl->supported, c->linkmodes);  
> 
> How about using only the first bit from `c->linkmodes`, to avoid
> behavior changes?

If what we want is to keep the exact same behaviour, then we need to
go one step further and make sure we keep the same one as before, and
it's not guaranteed that the first bit in c->linkmodes is this one.

We could however have a default supported mask for fixed-link in phylink
that contains all the linkmodes we allow for fixed links, then filter
with the lookup, something like :


-       linkmode_fill(pl->supported);
+       /* (in a dedicated helper) Linkmodes reported for fixed links below
+        * 10G */
+       linkmode_zero(pl->supported);
+
+       linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, pl->supported);
+       linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, pl->supported);
+       linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, pl->supported);
+       linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, pl->supported);
+       linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, pl->supported);
+       linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, pl->supported);
+       linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, pl->supported);
+       linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, pl->supported);
+       linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, pl->supported);
+
        linkmode_copy(pl->link_config.advertising, pl->supported);
        phylink_validate(pl, pl->supported, &pl->link_config);
 
-       s = phy_lookup_setting(pl->link_config.speed, pl->link_config.duplex,
-                              pl->supported, true);
+       c = phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
+                           pl->supported, true);
+       if (c)
+               linkmode_and(match, pl->supported, c->linkmodes);

That way we should have a consistent behaviour with what we currently
have, and to me it's more explicit what will the  fixed-link linkmodes
be.

I'd like to make sure Russell is OK with that though :)

Thanks you for the review Paolo !

Maxime

