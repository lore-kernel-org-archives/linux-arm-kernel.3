Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3055C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lp4/LaCOxhgTD9ld3zM3tC7T8uIic+jBJ97jkYwzPPM=; b=t0hV7cjAw2DrE1+ivU7xcM805H
	SfiKez83Fng8Ocno6uyLLloKjccz+rc0kuqdVROWcJ8skSf3/2HL1Io8KErFQaVd2sKgfkFhO4gJx
	YdhO60XYQnASIot/KVFc2olox7XAFFi+J/rQht6mcG+OdIqht1H5aTau5G/wcO/54Ozbd9Gze4+Wi
	Kv8X84A5NXK1FsiKS7akfC5sBaSsj6N+0r1G/jXCSQAMRIsFDYVYyPlqoz9QvCNqlPdvYNqxjbpLw
	xBGibmQx+sovExhlb5QTXDHQbzGkNLMXOR2XSjG6yhU18QEq9yKxf/22U4sh4+4O0uFrjWEcPRzdZ
	lXc6nePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZLY-0000000E4vK-2bND;
	Mon, 24 Feb 2025 14:22:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYtz-0000000DyuR-3Y8A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Lp4/LaCOxhgTD9ld3zM3tC7T8uIic+jBJ97jkYwzPPM=; b=IFDXK8ML/4e5xZmJuFegO5PCVw
	vEPdtsztGy5uQFW+6doHgWRr6UChPFlNs/0JLPzF2N9d7gjKpJpMq88IuRmFhMAc4kXVQciyYytSB
	lLm3fC5bPW1Cq/cXDowLG11ASeR3wtkjvFSNjl3tL/CGGwhiRTvJa6hOoZVD7P4TGOU1UCke6OLAT
	jJG/kav21ybLkc2W7RyYycfsIR9gefq9Cz6AmkdlIpLiCANAq0EMELHcC232tCKls/08wLbobPYfL
	Cd7H6wJ+WLlVkmSOo7yCHEOLiyJjXa/uFOfJwFUFmdpYH77oz5VVQcwxZgvTanjxRPfbEQRHfrsxs
	pja2YzGw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50418)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tmYtn-0006TQ-2U;
	Mon, 24 Feb 2025 13:53:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tmYtk-00052t-1u;
	Mon, 24 Feb 2025 13:53:28 +0000
Date: Mon, 24 Feb 2025 13:53:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kory Maincent <kory.maincent@bootlin.com>
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
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Simon Horman <horms@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 12/13] net: phy: phylink: Use phy_caps_lookup
 for fixed-link configuration
Message-ID: <Z7x52C5dE3eXWomq@shell.armlinux.org.uk>
References: <20250222142727.894124-1-maxime.chevallier@bootlin.com>
 <20250222142727.894124-13-maxime.chevallier@bootlin.com>
 <20250224144431.2dca9d19@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224144431.2dca9d19@kmaincent-XPS-13-7390>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_055343_883779_EC5A9173 
X-CRM114-Status: GOOD (  18.27  )
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

On Mon, Feb 24, 2025 at 02:44:31PM +0100, Kory Maincent wrote:
> On Sat, 22 Feb 2025 15:27:24 +0100
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> 
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
> 
> ...
> 
> >  
> >  	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, mask);
> >  	linkmode_set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, mask);
> > @@ -588,9 +591,9 @@ static int phylink_parse_fixedlink(struct phylink *pl,
> >  
> >  	phylink_set(pl->supported, MII);
> >  
> > -	if (s) {
> > -		__set_bit(s->bit, pl->supported);
> > -		__set_bit(s->bit, pl->link_config.lp_advertising);
> > +	if (c) {
> > +		linkmode_or(pl->supported, pl->supported, match);
> > +		linkmode_or(pl->link_config.lp_advertising,
> > pl->supported, match);
> 
> You are doing the OR twice. You should use linkmode_copy() instead.

No, we don't want to copy pl->supported to
pl->link_config.lp_advertising. We just want to set the linkmode bit
that corresponds to the speed/duplex in each mask.

That will result in e.g. the pause mode bits will be overwritten despite
being appropriately set in the advertising mask in the code above this.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

