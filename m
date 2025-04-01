Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C1CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DI/uIgABP4Y3ZOODtItV+UJ8AlzzvTWEXR4AkcopqNk=; b=YVOpaUFo4wPIGbL36xPus65ID1
	hpd3ZQr3mL1DJyrec8MIE5RRz/7P+hBxC4avk6pgHaZEZ8wELqNLO168nkVQ2ttBqCFaSc5nUS9VD
	vYR8vZakGWR19iY1Fr9t8kG7Lm53AxAknGGzq/a2O9mdllUwV8ZjRID35D/tNalOtaB2BYphkDCyu
	MlBbzuxTYBn5/FvT9JB5s+Rg1CYs+iwi06vkjezLWBNg1ip312bhrQ9Y0ePS6IstDpTUHbEy/kn4n
	i7n4Eigw/AhgYfa11gG0Vwnov1vLlAnEUnmzwy2L79/+o7HGqELe/ltDkiQVW2Pj5WAMjCFf2XlHl
	rb+O4e9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeWc-00000003t9N-3rkj;
	Tue, 01 Apr 2025 16:31:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeHw-00000003peV-2zO9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DI/uIgABP4Y3ZOODtItV+UJ8AlzzvTWEXR4AkcopqNk=; b=CWCcwtscKHyCA2hRf538Qcm+I8
	QVyW0WYPTllm9WtlHc8zbFGk8laKuMFvGZYsXkYpHUhDFu720OkZjsyc2HTpJHVJLIbFA3+SF601V
	zQiuAaCWE1dW/WYu3tZTl9UACvLp8+TNU2gNlPY6boPIpHHgYyJPKsHVGFmO0A1Bm+P+QHKCgDjru
	NQZ++2IBzT8OE1ud0m22At/E4yhLg0sI2THUOYWRT1kz/GJ4hUjdfRe2DoD8AK/6v4mIZhmUiBsAZ
	9IWGfl9oNSVQs+1Bg32FRxcotQHx8v8lWboVrucTFSJKV9/1/8UexfP7KKh79CRMR+7QIX9WoXe8N
	c3jocreA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54120)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tzeFk-0006b5-1R;
	Tue, 01 Apr 2025 17:14:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tzeFg-0002pe-2a;
	Tue, 01 Apr 2025 17:14:12 +0100
Date: Tue, 1 Apr 2025 17:14:12 +0100
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
Message-ID: <Z-wQ1Ml_9xNz0XtV@shell.armlinux.org.uk>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
 <20250307173611.129125-10-maxime.chevallier@bootlin.com>
 <8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
 <20250328090621.2d0b3665@fedora-2.home>
 <CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
 <20250331091449.155e14a4@fedora-2.home>
 <3517cb7b3b10c29a6bf407f2e35fdebaf7a271e3.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3517cb7b3b10c29a6bf407f2e35fdebaf7a271e3.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_091633_026461_4253B801 
X-CRM114-Status: GOOD (  23.87  )
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

On Tue, Apr 01, 2025 at 08:28:29AM -0700, Alexander H Duyck wrote:
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 16a1f31f0091..380e51c5bdaa 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -713,17 +713,24 @@ static int phylink_parse_fixedlink(struct phylink *pl,
>                 phylink_warn(pl, "fixed link specifies half duplex for %dMbps link?\n",
>                              pl->link_config.speed);
>  
> -       linkmode_zero(pl->supported);
> -       phylink_fill_fixedlink_supported(pl->supported);
> -
> +       linkmode_fill(pl->supported);
>         linkmode_copy(pl->link_config.advertising, pl->supported);
>         phylink_validate(pl, pl->supported, &pl->link_config);
>  
>         c = phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
>                             pl->supported, true);
> -       if (c)
> +       if (c) {
>                 linkmode_and(match, pl->supported, c->linkmodes);
>  
> +               /* Compatbility with the legacy behaviour:
> +                * Report one single BaseT mode.
> +                */
> +               phylink_fill_fixedlink_supported(mask);
> +               if (linkmode_intersects(match, mask))
> +                       linkmode_and(match, match, mask);
> +               linkmode_zero(mask);
> +       }
> +
>         linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, mask);
>         linkmode_set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, mask);
>         linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, mask);
> 
> Basically we still need the value to be screened by the pl->supported.
> The one change is that we have to run the extra screening on the
> intersect instead of skipping the screening, or doing it before we even
> start providing bits.
> 
> With this approach we will even allow people to use non twisted pair
> setups regardless of speed as long as they don't provide any twisted
> pair modes in the standard set.
> 
> I will try to get this tested today and if it works out I will submit
> it for net. I just need to test this and an SFP ksettings_set issue I
> found when we aren't using autoneg.

This code used to be so simple... and that makes me wonder whether
Maxime's work is really the best approach. It seems that the old way
was better precisely because it was more simple.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

