Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDFFC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 12:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eMi5/lczQNiBiqshlbN0fbzw9ejRfgeqUAlYl9qpIg=; b=RYS+xzEMVjqLvVIgkeN3XDX/U5
	IZBY5QIPWcKnHbHn/TavrTv/xfvgxWvNxgDgBHsHV8KivwXzIQOkenR3YBzRIWlXET3/r7NtroaZl
	sZN0lKy5CCP6znU+YHD6iHxpBTVOMujd0pw+eIXLd13nxvx7iYYjh9WCqHnJo2DaW8RDWdFaCvcWV
	2nmZl6Ffc+RquYdO3cIjRwrYPR1sHx0u7z9G8/8bnAgRzunr9kChcnqiTfdwGIBtJnb2+noNZGW8F
	+QVuK9Wa7CJrzVLHKsSgtpmTF06kiLRdlHVbsxLF8UqsN1YRB8NBxPlargjY9A4peW3XLQf4/reNp
	+eAk56VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzEfV-00000000P37-2xAi;
	Mon, 31 Mar 2025 12:55:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzEdm-00000000OiS-3Beh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 12:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2eMi5/lczQNiBiqshlbN0fbzw9ejRfgeqUAlYl9qpIg=; b=IlzP0CH4jRpFhrxHnDsiF5VoSv
	TEHTcyEhjYgMq81+mdn0a/0q3NmQ/Y6q9+k1h8H99zGPsY/x1csGV3hxdrujioo8ZbqnMZKvJGGkw
	bBWMQH71eKnnTtsa67hVb83aolECGaKaU2ooRJsivkEqZZ4sweufF9HId3jlSbgHC++npXBxrO1pZ
	WVXa4d8tfsdtIEA2WiIgfYRMxsiHJfoAskGXYEcs0Z+iCAgEDTqv+nLCmHFsvnoiLT42YSPdRjx5A
	VTddXBrFHl0ivIoRDR3hiL0uqXZ7xQxb0hNDMLznNSOcPf2Xm3mAZhis/falAlUcHyltw2H9iRdx2
	RfSghQqg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51288)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tzEbZ-0003zS-2D;
	Mon, 31 Mar 2025 13:51:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tzEbT-0001gK-2Q;
	Mon, 31 Mar 2025 13:50:59 +0100
Date: Mon, 31 Mar 2025 13:50:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander H Duyck <alexander.duyck@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Simon Horman <horms@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next v5 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
Message-ID: <Z-qPs7y8C09xh5_b@shell.armlinux.org.uk>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
 <20250307173611.129125-10-maxime.chevallier@bootlin.com>
 <8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_055322_840795_E766A81E 
X-CRM114-Status: GOOD (  28.36  )
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

On Thu, Mar 27, 2025 at 06:16:00PM -0700, Alexander H Duyck wrote:
> On Fri, 2025-03-07 at 18:36 +0100, Maxime Chevallier wrote:
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
> > ---
> >  drivers/net/phy/phylink.c | 44 +++++++++++++++++++++++++++------------
> >  1 file changed, 31 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index cf9f019382ad..8e2b7d647a92 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -802,12 +802,26 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
> >  	return phylink_validate_mac_and_pcs(pl, supported, state);
> >  }
> >  
> > +static void phylink_fill_fixedlink_supported(unsigned long *supported)
> > +{
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, supported);
> > +	linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, supported);
> > +}
> > +
> 
> Any chance we can go with a different route here than just locking
> fixed mode to being only for BaseT configurations?
> 
> I am currently working on getting the fbnic driver up and running and I
> am using fixed-link mode as a crutch until I can finish up enabling
> QSFP module support for phylink and this just knocked out the supported
> link modes as I was using 25CR, 50CR, 50CR2, and 100CR2.
> 
> Seems like this should really be something handled by some sort of
> validation function rather than just forcing all devices using fixed
> link to assume that they are BaseT. I know in our direct attached
> copper case we aren't running autoneg so that plan was to use fixed
> link until we can add more flexibility by getting QSFP support going.

Please look back at phylink's historical behaviour. Phylink used to
use phy_lookup_setting() to locate the linkmode for the speed and
duplex. That is the behaviour that we should be aiming to preserve.

We were getting:

speed	duplex	linkmode
10M	Half	10baseT_Half
10M	Full	10baseT_Full
100M	Half	100baseT_Half
100M	Full	100baseT_Full
1G	Half	1000baseT_Half
1G	Full	1000baseT_Full (this changed over time)
2.5G	Full	2500baseT_Full
5G	Full	5000baseT_Full

At this point, things get weird because of the way linkmodes were
added, as we return the _first_ match. Before commit 3c6b59d6f07c
("net: phy: Add more link modes to the settings table"):

10G	Full	10000baseKR_Full
Faster speeds not supported

After the commit:
10G	Full	10000baseCR_Full
20G	Full	20000baseKR2_Full
25G	Full	25000baseCR_Full
40G	Full	40000baseCR4_Full
50G	Full	50000baseCR2_Full
56G	Full	56000baseCR4_Full
100G	Full	100000baseCR4_Full

It's all a bit random. :(

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

