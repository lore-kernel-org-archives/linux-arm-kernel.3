Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E83BC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 16:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RnuSiKm23JcWF6Ab/jVuKak1mZScr6nXYjmv1TYGs0=; b=H8wnNLyS3Q+MmAutmqFw1ukDAh
	WRIKowmsj9YNZXJLTtza9H7dkaRISVZ1DxN5dJAQxZgIPpxfkvarX5if2FljK6HkN85F7+cWtBGSh
	3L5kUqW7XN++fHtWDr6Vwra6PJntVxwEY4Nvem1Wqn4XqkQqwb+NiHUMZzOB+ylv7/ly95Q6i9zC7
	4Fj71pjuYtp/qCLjVYC/zzLcP9jzNaLVwanf9bCPJ8u4+fLSv6hjpgI44O+v0I9SBijlRw/2m9xzt
	TsRXC8jHv2/uXK82bUVP68awbCKJuSwBBGq23xGpDIk84Tt5O5baw5iv5XPgJTAAwu2qHAk8tDqu+
	CmSs75/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2xZ-0000000Bbrr-1Q6J;
	Fri, 28 Feb 2025 16:11:33 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to2iI-0000000BYzY-480Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:55:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 663534427A;
	Fri, 28 Feb 2025 15:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740758144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0RnuSiKm23JcWF6Ab/jVuKak1mZScr6nXYjmv1TYGs0=;
	b=C44xf0995MYpPrlcX0hzyrpkAsnPXj/LzWnxJyT5CJzvDEDCqeeP+hCobGvr6vrq8y5Dmd
	vY+UiA5fo8swhT6DRWgEmAiiIHTxsrxRin5lPZuUmEhjvtl/u4XxBaUFmojIqmrX0BJoD4
	7VgoJSgoyyCNr8k31F4c5WqzvboAisu6Ftabe8b3I28qzMUwztRn+/nl55p1FHpvIMCxh6
	lOGEXl0VDgYNtfka6Rv6hKxSBj0jHI30lvSsFqSa/JpK6Zg615HnkxyooikSwsZjP3kuxN
	bHMmdgwVWjyye4qZMHM4+iWNjeytT/pb7Bq9+C8WFJobKbVC3z17Z3BwXzkrog==
Date: Fri, 28 Feb 2025 16:55:41 +0100
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
Subject: Re: [PATCH net-next v3 02/13] net: phy: Use an internal, searchable
 storage for the linkmodes
Message-ID: <20250228165541.04b6ba3c@fedora.home>
In-Reply-To: <Z8HZJo9GE23uq5ew@shell.armlinux.org.uk>
References: <20250228145540.2209551-1-maxime.chevallier@bootlin.com>
	<20250228145540.2209551-3-maxime.chevallier@bootlin.com>
	<Z8HZJo9GE23uq5ew@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtt
 hhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_075547_481323_C0B25D5F 
X-CRM114-Status: GOOD (  28.85  )
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

Hello Russell,

On Fri, 28 Feb 2025 15:41:26 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Fri, Feb 28, 2025 at 03:55:27PM +0100, Maxime Chevallier wrote:
> > The canonical definition for all the link modes is in linux/ethtool.h,
> > which is complemented by the link_mode_params array stored in
> > net/ethtool/common.h . That array contains all the metadata about each
> > of these modes, including the Speed and Duplex information.
> > 
> > Phylib and phylink needs that information as well for internal
> > management of the link, which was done by duplicating that information
> > in locally-stored arrays and lookup functions. This makes it easy for
> > developpers adding new modes to forget modifying phylib and phylink
> > accordingly.
> > 
> > However, the link_mode_params array in net/ethtool/common.c is fairly
> > inefficient to search through, as it isn't sorted in any manner. Phylib
> > and phylink perform a lot of lookup operations, mostly to filter modes
> > by speed and/or duplex.
> > 
> > We therefore introduce the link_caps private array in phy_caps.c, that
> > indexes linkmodes in a more efficient manner. Each element associated a
> > tuple <speed, duplex> to a bitfield of all the linkmodes runs at these
> > speed/duplex.
> > 
> > We end-up with an array that's fairly short, easily addressable and that
> > it optimised for the typical use-cases of phylib/phylink.
> > 
> > That array is initialized at the same time as phylib. As the
> > link_mode_params array is part of the net stack, which phylink depends
> > on, it should always be accessible from phylib.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
[...]
> > +static int speed_duplex_to_capa(int speed, unsigned int duplex)
> > +{
> > +	if (duplex == DUPLEX_UNKNOWN ||
> > +	    (speed > SPEED_1000 && duplex != DUPLEX_FULL))
> > +		return -EINVAL;
> > +
> > +	switch (speed) {
> > +	case SPEED_10: return duplex == DUPLEX_FULL ?
> > +			      LINK_CAPA_10FD : LINK_CAPA_10HD;
> > +	case SPEED_100: return duplex == DUPLEX_FULL ?
> > +			       LINK_CAPA_100FD : LINK_CAPA_100HD;
> > +	case SPEED_1000: return duplex == DUPLEX_FULL ?
> > +				LINK_CAPA_1000FD : LINK_CAPA_1000HD;
> > +	case SPEED_2500: return LINK_CAPA_2500FD;
> > +	case SPEED_5000: return LINK_CAPA_5000FD;
> > +	case SPEED_10000: return LINK_CAPA_10000FD;
> > +	case SPEED_20000: return LINK_CAPA_20000FD;
> > +	case SPEED_25000: return LINK_CAPA_25000FD;
> > +	case SPEED_40000: return LINK_CAPA_40000FD;
> > +	case SPEED_50000: return LINK_CAPA_50000FD;
> > +	case SPEED_56000: return LINK_CAPA_56000FD;
> > +	case SPEED_100000: return LINK_CAPA_100000FD;
> > +	case SPEED_200000: return LINK_CAPA_200000FD;
> > +	case SPEED_400000: return LINK_CAPA_400000FD;
> > +	case SPEED_800000: return LINK_CAPA_800000FD;  
> 
> I think one of the issues you mentioned is about the need to update
> several places as new linkmodes are added.
> 
> One of the side effects of adding new linkmodes is that they generally
> come with faster speeds, so this is a place that needs to be updated
> along with the table above.
> 
> I'm not sure whether this makes that problem better or worse - if a
> new linkmode is added with a SPEED_*, the author of such a change has
> to be on the ball to update these, and I'm not sure that'll happen.

That's true indeed, and it seems that's already the case today (there's
no MAC_800000FD in phylink for example). It seems to me that NICs
with very fast speeds don't care at all about phylib nor phylink...

So yeah this work does not address the complexity of adding a new speed
:(

To solve that, we could consider some macro magic to define new speeds
with an associated LINK_CAPA, however that's quite the overhaul.

Do you see that new enum for link_caps as a blocking point for that
series ? 

Maxime

