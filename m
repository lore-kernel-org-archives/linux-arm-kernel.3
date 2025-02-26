Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ADDC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJaZnLfOjI4LHuqpMppLemf30WiM8BMZnVVa5Y1FR+4=; b=zu4mM71/1PAR8RNh60COIgYOQh
	ebAPM3fP0APHs0eFnUn7xAI6porikATOU/I9ibUXGnSbSzIGtn20NgDLBLlSzlCJ8vMl2F9y3q/bq
	niRE/9HDhpF47a/p/J7KQJx99i0gakZ/+5EdDedm5ikJf5sV9Z77WQ+IA4OqikCt876Uf9LUrF5tH
	RwLbcingBHQVYZQASuLV0bXDcSwAZajr0y86rxY6Kt6s9ecIu26Ny5Bt6aIT592qzfU71dSId89mm
	hVYzTE6mg6ji2YfW+ftMOtZpQeOlQyhCp4QSOzb6TSZZdaZkp11gG1s6YuI5JZ2NvsNNNupIQM0Ib
	gbGVqLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJFm-00000004HGr-2XdK;
	Wed, 26 Feb 2025 15:23:18 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJ9P-00000004EYa-2Vsz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 15:16:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CF6E4433C;
	Wed, 26 Feb 2025 15:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740583000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJaZnLfOjI4LHuqpMppLemf30WiM8BMZnVVa5Y1FR+4=;
	b=oQYj+R7WOnYA+MwRlTQIzmLyjq+90/o3hskqoEiVmNBKzmv/6rvFw3UgwaZHhz6jMc2OyI
	9y0kuwsHY6qlDLb5e0z1Xm/6QmttvRq5lOpiQE/Lu02zCkUyYHSKcgXbY2AtU4M67KN3pW
	W1n1ocgqqeVvlDNaw81c1/Ae47EhCR/djL9MNHB9nj9DjDod0rT0/YfSPMduXOTsPLpMuA
	KhN8xZRXSf+BFuaABamiBdWznDI3hE+6RfJDVarHq/ZAhjEByQ8onXeBje9yMdSkltML50
	dliR5gV7ykHjenp5GXJJwgJy/VlRqg7ecWeiutKp2d7ZFHfedKZy9zX+GyV2/g==
Date: Wed, 26 Feb 2025 16:16:37 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next v2 09/13] net: phy: phylink: Use
 phy_caps_lookup for fixed-link configuration
Message-ID: <20250226161637.58597e28@fedora.home>
In-Reply-To: <Z78e1dmEuQzMER5L@shell.armlinux.org.uk>
References: <20250226100929.1646454-1-maxime.chevallier@bootlin.com>
	<20250226100929.1646454-10-maxime.chevallier@bootlin.com>
	<Z78e1dmEuQzMER5L@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtt
 hhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_071643_775355_8FF9AC0B 
X-CRM114-Status: GOOD (  20.03  )
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

Hi Russell,

On Wed, 26 Feb 2025 14:01:57 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> Please use a subject line of "net: phylink: " for phylink patches, not
> "net: phy: " which is for phylib.

Sure thing, I wasn't sure about the subject line for this one.

> On Wed, Feb 26, 2025 at 11:09:24AM +0100, Maxime Chevallier wrote:
> > When phylink creates a fixed-link configuration, it finds a matching
> > linkmode to set as the advertised, lp_advertising and supported modes
> > based on the speed and duplex of the fixed link.
> > 
> > Use the newly introduced phy_caps_lookup to get these modes instead of
> > phy_lookup_settings(). This has the side effect that the matched
> > settings and configured linkmodes may now contain several linkmodes (the
> > intersection of supported linkmodes from the phylink settings and the
> > linkmodes that match speed/duplex) instead of the one from
> > phy_lookup_settings().
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

[...]

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
> What's this for? Surely phy_caps_lookup() should not return a link mode
> that wasn't in phy_caps_lookup()'s 3rd argument.

The new lookup may return a linkmode that wasn't in the 3rd argument,
as it will return ALL linkmodes that matched speed and duplex, provided
that at least one of said linkmodes matched the 3rd parameter.

Say you pass SPEED_1000, DUPLEX_FULL and a bitset containing only
1000BaseTFull, you'll get :

 - 1000BaseTFull, 1000BaseKX, 1000BaseT1, etc. in c->linkmodes.

That's the reason for re-andf'ing the modes afterwards.

If that API is too convoluted or error-prone, I can come up with an API
returning only what matched.

Maxime

