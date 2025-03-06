Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEDCC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FryI2wdxqmeOjmXxF70lohF85fEbGcS6dJS4YcW85A=; b=S/l2OZnwDU7jQLyymxSiogsp62
	Qv/AynkzC+uDsqUDvcD1PT8aYDI95N4cX6xIj64u96o6cHz/5AW6J2K2y+DhMEnn2JMHfrpIpRBXr
	Rd40oPzuxGIdJvxBAWhfboqeJxuMVzTvCmHOi5ol0pmYcClOGfH1iTy0pMA1jHmqQIJPjMy3cuoTJ
	CtswYlZtJliMQQYycGxUWRzXSFCbNINglYGGAfVkerSRjanm4Np7ib3RHLNxMjwuJKO1wUUHw5Pcn
	t7UXIJt78Oa9yKiRV/WrpQhPAfIwUc8SlBMY7UUgkW6NyXYuq9uCIBjGu6VGlsTxehfWjaZN+/7De
	BXmrCV6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBO7-0000000B4X9-112U;
	Thu, 06 Mar 2025 13:35:47 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBF6-0000000B3Y2-0qtC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 13:26:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62EDC442ED;
	Thu,  6 Mar 2025 13:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741267585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FryI2wdxqmeOjmXxF70lohF85fEbGcS6dJS4YcW85A=;
	b=EGIPGdpi293reUIuQ5IOmLJ/SOpH2Vp8rMxZl3DBdm5zBFV92jViNMxq/dV1CcxUz1fu2r
	ppmGhLFpAVp1+QFWxRudk1IWw/6tHwnD61TCPm8m+dh27wtbKg8USA5zUuwIKnm6FRNjsd
	uS6fCzpFGJkJhHrk8HeS0Uc/zTdjHMbPgIpZIDV0m7I+XaepLVc5L+W/WX9NssZk0yC3ZG
	a01VVfvH9P23M62TMGS/ToKMSB6D7qeaPSw5ZMrl8d2Q/fz2uoS0wW2d9toqT8CVAVMwAA
	4ceIY9EaY3tkI6tvqQFXodmRV2F5B0NhWAB2lKmByslgEoyeXglYEwB2XFxAOQ==
Date: Thu, 6 Mar 2025 14:26:20 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net, Andrew Lunn
 <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet
 <edumazet@google.com>, Heiner Kallweit <hkallweit1@gmail.com>,
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
Message-ID: <20250306142620.002d8b8a@fedora.home>
In-Reply-To: <Z8maRNYsn1LzjryX@shell.armlinux.org.uk>
References: <20250303090321.805785-1-maxime.chevallier@bootlin.com>
	<20250303090321.805785-10-maxime.chevallier@bootlin.com>
	<350bb4f6-f4b5-44c3-a821-ac53c8641705@redhat.com>
	<20250306111220.28798e6b@fedora.home>
	<Z8maRNYsn1LzjryX@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudfgleelvddtffdvkeduieejudeuvedvveffheduhedvueduteehkeehiefgteehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopegur
 ghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_052628_398213_46D8A0F1 
X-CRM114-Status: GOOD (  23.46  )
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

On Thu, 6 Mar 2025 12:51:16 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Thu, Mar 06, 2025 at 11:12:20AM +0100, Maxime Chevallier wrote:
> > On Thu, 6 Mar 2025 09:56:32 +0100
> > Paolo Abeni <pabeni@redhat.com> wrote:
> >   
> > > On 3/3/25 10:03 AM, Maxime Chevallier wrote:  
> > > > @@ -879,8 +880,10 @@ static int phylink_parse_fixedlink(struct phylink *pl,
> > > >  	linkmode_copy(pl->link_config.advertising, pl->supported);
> > > >  	phylink_validate(pl, pl->supported, &pl->link_config);
> > > >  
> > > > -	s = phy_lookup_setting(pl->link_config.speed, pl->link_config.duplex,
> > > > -			       pl->supported, true);
> > > > +	c = phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
> > > > +			    pl->supported, true);
> > > > +	if (c)
> > > > +		linkmode_and(match, pl->supported, c->linkmodes);    
> > > 
> > > How about using only the first bit from `c->linkmodes`, to avoid
> > > behavior changes?  
> > 
> > If what we want is to keep the exact same behaviour, then we need to
> > go one step further and make sure we keep the same one as before, and
> > it's not guaranteed that the first bit in c->linkmodes is this one.
> > 
> > We could however have a default supported mask for fixed-link in phylink
> > that contains all the linkmodes we allow for fixed links, then filter
> > with the lookup, something like :
> > 
> > 
> > -       linkmode_fill(pl->supported);
> > +       /* (in a dedicated helper) Linkmodes reported for fixed links below
> > +        * 10G */
> > +       linkmode_zero(pl->supported);
> > +
> > +       linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, pl->supported);
> > +       linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, pl->supported);
> > +       linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, pl->supported);
> > +       linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, pl->supported);
> > +       linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, pl->supported);
> > +       linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, pl->supported);
> > +       linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, pl->supported);
> > +       linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, pl->supported);
> > +       linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, pl->supported);  
> 
> Good idea, but do we have some way to automatically generate the baseT
> link modes?

I think we could with some of the preliminary phy_port patches I had
sent before going into that phy_caps series :

https://lore.kernel.org/netdev/20250213101606.1154014-2-maxime.chevallier@bootlin.com/

It adds the information about medium, maybe we could adapt that, making
sure we filter out BaseT1 for example, but that would be a generic way
of generating that list indeed.

I don't necessarily mean to add this "mediums" thing into this series
right now, we could for now set that list of all BaseT modes in an
internal helper, then later on convert it to the mediums-based
linkmodes listing. I'll go back to phy_ports after phy_caps :)

Thanks,

Maxime


