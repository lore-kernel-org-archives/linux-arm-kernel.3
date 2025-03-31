Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52077C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytyW6Ib7JG7PXGq9nIWUTfnzofsAb7FeQ+Sz3N7/aBA=; b=kU84irhWe7lZ1jRTeO+bzGaCan
	JcAKawA6xIXYxKULs8+X+QRliflq7dJpdrCQIl/RNTfYm7vko7xlY/d6RRaVJz2+eCnfE42ZPvyQb
	ktFibAF47hXKk/dcRz/28+bNdRYcCUi21MA3l9Ea8TDsKSSX8khYvv6CIcnDO3OL3u0u4CJnMgQo8
	NvEl8Vawleisx/xNojEYj7+tMNpyzWEWWjrxsqIA1X9a3zA1aneBlszW5XjmikVLypWSs7MRIzodr
	1lCzN4bp3rfRZpFXF+IPePzrGVGjcAr0PqdbhSH5xSLAYT/m/2icVV4hWl8JRQE+nNzv8CcdhogZ+
	fmDdkSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHtb-00000000xvp-344I;
	Mon, 31 Mar 2025 16:21:55 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHrs-00000000xkV-2dU1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 16:20:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EAAF444FD;
	Mon, 31 Mar 2025 16:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743438006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ytyW6Ib7JG7PXGq9nIWUTfnzofsAb7FeQ+Sz3N7/aBA=;
	b=BSO6MxqpZban1/3AGE86T0zuVdxHLOfZ8zSYuybSVfZ/B2G7lXHXGU8dw3v0WCRgEY4RPa
	KuMZOc3PUYOt/9G5xWKgXq7bZVZvg0P+hTuI8PAoKT5ykkTSII+UB2onkDcyPcuZR+F4qt
	rzcLGexPwJbsTpcnZQ/GrYVPSwJH1RNwo1PvfTYfvsm7UxXddNvuXX3a14S5j/MWXi4kJq
	6+GvMGVZf8zRo8Xz8zxuWo1za1p+xeoP6r9JbPwpVSKGjTo5mCslu5afiPzBmAuU4haEoi
	fcmztvXOZ3zfodOCmYrl4KU06KOhXAxBffuyN0zQNavonYVu0PvMg9EVCgJMaw==
Date: Mon, 31 Mar 2025 18:20:00 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Duyck
 <alexander.duyck@gmail.com>, davem@davemloft.net, Jakub Kicinski
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
Subject: Re: [PATCH net-next v5 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
Message-ID: <20250331182000.0d94902a@fedora.home>
In-Reply-To: <Z-qsnN4umaz0QrG0@shell.armlinux.org.uk>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
	<20250307173611.129125-10-maxime.chevallier@bootlin.com>
	<8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
	<20250328090621.2d0b3665@fedora-2.home>
	<CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
	<12e3b86d-27aa-420b-8676-97b603abb760@lunn.ch>
	<CAKgT0UcZRi1Eg2PbBnx0pDG_pCSV8tfELinNoJ-WH4g3CJOh2A@mail.gmail.com>
	<02c401a4-d255-4f1b-beaf-51a43cc087c5@lunn.ch>
	<Z-qsnN4umaz0QrG0@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegrlhgvgigrnhguvghrrdguuhihtghksehgmhgrihhlrdgto
 hhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_092008_821591_C5ACE80B 
X-CRM114-Status: GOOD (  37.44  )
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

On Mon, 31 Mar 2025 15:54:20 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Mon, Mar 31, 2025 at 04:17:02PM +0200, Andrew Lunn wrote:
> > On Fri, Mar 28, 2025 at 04:26:04PM -0700, Alexander Duyck wrote:  
> > > A serdes PHY is part of it, but not a traditional twisted pair PHY as
> > > we are talking about 25R, 50R(50GAUI & LAUI), and 100P interfaces. I
> > > agree it is a different beast, but are we saying that the fixed-link
> > > is supposed to be a twisted pair PHY only?  
> > 
> > With phylink, the PCS enumerates its capabilities, the PHY enumerates
> > its capabilities, and the MAC enumerates it capabilities. phylink then
> > finds the subset which all support.
> > 
> > As i said, historically, fixed_link was used in place of a PHY, since
> > it emulated a PHY. phylinks implementation of fixed_link is however
> > different. Can it be used in place of both a PCS and a PHY? I don't
> > know.  
> 
> In fixed-link mode, phylink will use a PCS if the MAC driver says there
> is one, but it will not look for a PHY.
> 
> > You are pushing the envelope here, and maybe we need to take a step
> > back and consider what is a fixed link, how does it fit into the MAC,
> > PCS, PHY model of enumeration? Maybe fixed link should only represent
> > the PHY and we need a second sort of fixed_link object to represent
> > the PCS? I don't know?  
> 
> As I previously wrote today in response to an earlier email, the
> link modes that phylink used were the first-match from the old
> settings[] array in phylib which is now gone. This would only ever
> return _one_ link mode, which invariably was a baseT link mode for
> the slower speeds.
> 
> Maxime's first approach at adapting this to his new system was to
> set every single link mode that corresponded with the speed. I
> objected to that, because it quickly gets rediculous when we end
> up with lots of link modes being indicated for e.g. 10, 100M, 1G
> but the emulated PHY for these speeds only indicates baseT. That's
> just back-compatibility but... in principle changing the link modes
> that are reported to userspace for a fixed link is something we
> should not be doing - we don't know if userspace tooling has come
> to rely on that.
> 
> Yes, it's a bit weird to be reporting 1000baseT for a 1000BASE-X
> interface mode, but that's what we've always done in the past and
> phylink was coded to maintain that (following the principle that
> we shouldn't do gratuitous changes to the information exposed to
> userspace.)
> 
> Maxime's replacement approach is to just expose baseT, which
> means that for the speeds which do not have a baseT mode, we go
> from supporting it but with a weird link mode (mostly baseCR*)
> based on first-match in the settings[] table, to not supporting the
> speed.

I very wrongfully considered that there was no >10G fixed-link users, I
plan to fix that with something like the proposed patch in the
discussion, that reports all linkmodes for speeds above 10G (looks less
like a randomly selected mode, you can kind-of see what's going on as
you get all the linkmodes) but is a change in what we expose to
userspace.

Or maybe simpler, I could extend the list of compat fixed-link linkmodes
to all speeds with the previous arbitrary values that Russell listed in
the other mail (that way, no user-visible changes :) )

I was hoping Alexander could give option 1 a try, but let me know if
you think we should instead adopt option 2, which is probably the safer
on.

Maxime

