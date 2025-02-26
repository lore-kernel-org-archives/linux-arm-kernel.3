Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A910BC021BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5HzTLv7sfh35EQ2e6vDNCEEGGk0nP1LY8agEPskJ2I=; b=Bu2/nP1ZthEc98qvM9Fn9dz5US
	IAH05xX8Knn4xz4DgFnrcOUqDcVVnH8+/2fhPDh/qPs+A0N5eTxjhbbOkecX56lWJSp3JiLSqAxTI
	aGceV2UKkANA2P+C2TOaNlAvKTQBuUkm6a24MCQ9jq11eTpkpwp5gGH9N4zD497j8m1vpEz/uisxv
	MuqKlvrSoypp4zVlO4chnYD06+sSarfzo6JlzmmtamsExUWmS89OJSRvTLqYDE/V0gVarRuavwamn
	w+CgfWvqEWWJcyRlKzQFDe85ks4TRC5kHN1jVPGhzaDEmWLtbC9BdQhjbf01fAwhxfXzTSFHKtfBx
	dBt0K12w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnI1T-000000040TS-3vDX;
	Wed, 26 Feb 2025 14:04:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHzG-0000000408M-2rq3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y5HzTLv7sfh35EQ2e6vDNCEEGGk0nP1LY8agEPskJ2I=; b=eDzRA9aG3dT4rI9lZkaMzOrjmZ
	rv+C9d15o3IJ3+YtPHUnTHtWlK8hAESaVfGfspCo975JDCmV933K8L7yqpkpuIQGH2gWjQG9ewtPV
	YwtyJzU3OShw94RtyU2yApCNZ8C/kCh0AcduQYQP0CNK74cLRzN1uW2ebUwfOTChvcA102kfx7AkV
	zH64ql/uIcsoXQDW5Xs9n1hDWlUmHrnGSivSXOOMIsFQ8wDIcooZvfUgY3MlVMeq2m/XgchSRV8a1
	u2N5xutn/cXHlqVmuQkojsEy8VVnPTrkuSy7U8uE3eSRGSZi3c3GvwSts6+EDiRi/DIdtdbQmc87h
	4//QnB4A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58138)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tnHz6-0004Pb-13;
	Wed, 26 Feb 2025 14:02:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tnHz3-00078s-0d;
	Wed, 26 Feb 2025 14:01:57 +0000
Date: Wed, 26 Feb 2025 14:01:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
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
Subject: Re: [PATCH net-next v2 09/13] net: phy: phylink: Use phy_caps_lookup
 for fixed-link configuration
Message-ID: <Z78e1dmEuQzMER5L@shell.armlinux.org.uk>
References: <20250226100929.1646454-1-maxime.chevallier@bootlin.com>
 <20250226100929.1646454-10-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226100929.1646454-10-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_060210_724074_6F808F5F 
X-CRM114-Status: GOOD (  24.87  )
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

Please use a subject line of "net: phylink: " for phylink patches, not
"net: phy: " which is for phylib.

On Wed, Feb 26, 2025 at 11:09:24AM +0100, Maxime Chevallier wrote:
> When phylink creates a fixed-link configuration, it finds a matching
> linkmode to set as the advertised, lp_advertising and supported modes
> based on the speed and duplex of the fixed link.
> 
> Use the newly introduced phy_caps_lookup to get these modes instead of
> phy_lookup_settings(). This has the side effect that the matched
> settings and configured linkmodes may now contain several linkmodes (the
> intersection of supported linkmodes from the phylink settings and the
> linkmodes that match speed/duplex) instead of the one from
> phy_lookup_settings().
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V1 -> V2: - fixed pl->link_config.lp_advertising setting
> 
>  drivers/net/phy/phylink.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 6c67d5c9b787..63fbf3d8708a 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -805,9 +805,10 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
>  static int phylink_parse_fixedlink(struct phylink *pl,
>  				   const struct fwnode_handle *fwnode)
>  {
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(match) = { 0, };
>  	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
> +	const struct link_capabilities *c;
>  	struct fwnode_handle *fixed_node;
> -	const struct phy_setting *s;
>  	struct gpio_desc *desc;
>  	u32 speed;
>  	int ret;
> @@ -879,8 +880,10 @@ static int phylink_parse_fixedlink(struct phylink *pl,
>  	linkmode_copy(pl->link_config.advertising, pl->supported);
>  	phylink_validate(pl, pl->supported, &pl->link_config);
>  
> -	s = phy_lookup_setting(pl->link_config.speed, pl->link_config.duplex,
> -			       pl->supported, true);
> +	c = phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
> +			    pl->supported, true);
> +	if (c)
> +		linkmode_and(match, pl->supported, c->linkmodes);

What's this for? Surely phy_caps_lookup() should not return a link mode
that wasn't in phy_caps_lookup()'s 3rd argument.

Otherwise...

>  	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, mask);
>  	linkmode_set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, mask);
> @@ -889,9 +892,10 @@ static int phylink_parse_fixedlink(struct phylink *pl,
>  
>  	phylink_set(pl->supported, MII);
>  
> -	if (s) {
> -		__set_bit(s->bit, pl->supported);
> -		__set_bit(s->bit, pl->link_config.lp_advertising);
> +	if (c) {
> +		linkmode_or(pl->supported, pl->supported, match);
> +		linkmode_or(pl->link_config.lp_advertising,
> +			    pl->link_config.lp_advertising, match);
>  	} else {
>  		phylink_warn(pl, "fixed link %s duplex %dMbps not recognised\n",
>  			     pl->link_config.duplex == DUPLEX_FULL ? "full" : "half",
> @@ -1879,21 +1883,21 @@ static int phylink_register_sfp(struct phylink *pl,
>  int phylink_set_fixed_link(struct phylink *pl,
>  			   const struct phylink_link_state *state)
>  {
> -	const struct phy_setting *s;
> +	const struct link_capabilities *c;
>  	unsigned long *adv;
>  
>  	if (pl->cfg_link_an_mode != MLO_AN_PHY || !state ||
>  	    !test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state))
>  		return -EINVAL;
>  
> -	s = phy_lookup_setting(state->speed, state->duplex,
> -			       pl->supported, true);
> -	if (!s)
> +	c = phy_caps_lookup(state->speed, state->duplex,
> +			    pl->supported, true);
> +	if (!c)
>  		return -EINVAL;
>  
>  	adv = pl->link_config.advertising;
>  	linkmode_zero(adv);
> -	linkmode_set_bit(s->bit, adv);
> +	linkmode_and(adv, pl->supported, c->linkmodes);

... this is wrong since this is basically doing the same as the above
parsing.

I'm not sure why you're generating different code for what is
essentially the same thing.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

