Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D320C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhXEF+8ubYhO3s0wOnwv4NQl+UAMbcESvejL8PtfgWE=; b=nE2eJTx4jVJqNdjx1SHByLvZJ5
	FczK65apTY/eZRc2GQzRjeXWQJeTwe0ingZjpcDGszr6hRtPPTHqnZXv4buuvN8vwAw30hQMB2Zf1
	HkxjPx375lnW927K29fdgTJZbJ89PkCEqOEMJwsLF5pWE/HMfkV1CrLVYzxcTV0mhlo6L5tBvpOJM
	Cun/oDTG151jOJLS3l2MuPQk5dfSj/KVMD23b2zXW5uWY/Z4ZHh8XVOKI3yWtL+ZTXPmEOVwO5mH6
	qgoZtb+a53rvPzleecum5d1HxCsUUWdTR7o1DKy8djG71dA5EuJL8aL7ofz4AhspOPLp9VBr/LED7
	3x9+nwsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqB6q-0000000B1nc-1ueq;
	Thu, 06 Mar 2025 13:17:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAhB-0000000AyL9-3CfI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 12:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JhXEF+8ubYhO3s0wOnwv4NQl+UAMbcESvejL8PtfgWE=; b=Wym7Z1pzeGNrdZxFtFrLtDnnhy
	XSd5wTO0pvEQ8OCTyz3tnz/MX+8cXXsI+6i4N4dqufKLYmo3LDFpO6bEUY1Wu4Jr7/qSPcqPakMkO
	rC/lbF+DhtmmEgSdj7qc+UKfPhDnre+mt2DC67fno6CdBrpQjSqA/hs81FnlWOZOUvyHjZmpcUnMg
	r49QypYYxWFe+4USv9tnYmCqkSdpyeSafrc6XsQOodvlfdGh1BOXXzrOrHNZMQzxdwDep7cHvxwwV
	ixLJJa/exIopKtbLp3r3So7mdoVKrmdXseJVI24IWVOZVu+LrjCAarlfOHTlE4X2Vb6wcdcx9UGNp
	HSPjCCPQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48006)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tqAh4-0005sB-2f;
	Thu, 06 Mar 2025 12:51:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tqAh3-0006nz-0O;
	Thu, 06 Mar 2025 12:51:17 +0000
Date: Thu, 6 Mar 2025 12:51:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
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
Subject: Re: [PATCH net-next v4 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
Message-ID: <Z8maRNYsn1LzjryX@shell.armlinux.org.uk>
References: <20250303090321.805785-1-maxime.chevallier@bootlin.com>
 <20250303090321.805785-10-maxime.chevallier@bootlin.com>
 <350bb4f6-f4b5-44c3-a821-ac53c8641705@redhat.com>
 <20250306111220.28798e6b@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306111220.28798e6b@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_045125_819845_43A1ACD2 
X-CRM114-Status: GOOD (  18.29  )
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

On Thu, Mar 06, 2025 at 11:12:20AM +0100, Maxime Chevallier wrote:
> On Thu, 6 Mar 2025 09:56:32 +0100
> Paolo Abeni <pabeni@redhat.com> wrote:
> 
> > On 3/3/25 10:03 AM, Maxime Chevallier wrote:
> > > @@ -879,8 +880,10 @@ static int phylink_parse_fixedlink(struct phylink *pl,
> > >  	linkmode_copy(pl->link_config.advertising, pl->supported);
> > >  	phylink_validate(pl, pl->supported, &pl->link_config);
> > >  
> > > -	s = phy_lookup_setting(pl->link_config.speed, pl->link_config.duplex,
> > > -			       pl->supported, true);
> > > +	c = phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
> > > +			    pl->supported, true);
> > > +	if (c)
> > > +		linkmode_and(match, pl->supported, c->linkmodes);  
> > 
> > How about using only the first bit from `c->linkmodes`, to avoid
> > behavior changes?
> 
> If what we want is to keep the exact same behaviour, then we need to
> go one step further and make sure we keep the same one as before, and
> it's not guaranteed that the first bit in c->linkmodes is this one.
> 
> We could however have a default supported mask for fixed-link in phylink
> that contains all the linkmodes we allow for fixed links, then filter
> with the lookup, something like :
> 
> 
> -       linkmode_fill(pl->supported);
> +       /* (in a dedicated helper) Linkmodes reported for fixed links below
> +        * 10G */
> +       linkmode_zero(pl->supported);
> +
> +       linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, pl->supported);
> +       linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, pl->supported);
> +       linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, pl->supported);
> +       linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, pl->supported);
> +       linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, pl->supported);
> +       linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, pl->supported);
> +       linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, pl->supported);
> +       linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, pl->supported);
> +       linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, pl->supported);

Good idea, but do we have some way to automatically generate the baseT
link modes?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

