Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97583CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 21:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoLMA7YAWuosvmrIBLI8Zurj/FpRrXqerMkVboDNB+Y=; b=bduYgMHGQHZF+1gQaU8xtrMHjn
	QHm8skV0wUSPnh2vpVCXd1741Ntck4I/DMPUWpirBAsfG7X5ONZsK9zClM97wXKweatyDjrvOh4VQ
	XvYlx3VW6JR9Z32tuXxZTiUEUS7vAVP8X+SRVTXN/WT2UexZVmRsjVx0aDfPh0xgutDYjcZ7Ihn1L
	26mNj1KLmPFgaZXh1OOvxNLKj1za4C9mU/Zn8XOgYmIEgNfMITwuzpJnkXb+Rm2fmNY06Rw17d2Pe
	IpQCd3ezdNl/hGhstuc6iI6jZthd75vizat2rM1Dq6PqH35mcTJge0HJrCZXCOHZ/ymcHx9iOFtEY
	JbK40dSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBgbR-00000004Nnw-22pt;
	Wed, 22 Oct 2025 21:42:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBgbN-00000004NmU-3jAm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 21:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RoLMA7YAWuosvmrIBLI8Zurj/FpRrXqerMkVboDNB+Y=; b=2o0zIKaGyuU7jtl6xkuRA757+/
	As1Ixp9TgpYCJDhpfUu1tGXwnnJp89Oxc92MQcKIqa1/B82750L/nqFG+MHAVGVbDX/ljYXwf4ptn
	Mszwaf22Z0j5sZeu62hOivGPjEZMSXwueveV3YZbNwS/5syABoUZ7lmMIjcqFgBc2bLw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vBgbA-00Boc8-AG; Wed, 22 Oct 2025 23:42:24 +0200
Date: Wed, 22 Oct 2025 23:42:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH net-next v14 03/16] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
Message-ID: <cb217bf8-763e-4c48-9233-e577b32b14a8@lunn.ch>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
 <20251013143146.364919-4-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013143146.364919-4-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_144237_927574_A77DAA5C 
X-CRM114-Status: GOOD (  13.00  )
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

On Mon, Oct 13, 2025 at 04:31:29PM +0200, Maxime Chevallier wrote:
> In an effort to have a better representation of Ethernet ports,
> introduce enumeration values representing the various ethernet Mediums.
> 
> This is part of the 802.3 naming convention, for example :
> 
> 1000 Base T 4
>  |    |   | |
>  |    |   | \_ lanes (4)
>  |    |   \___ Medium (T == Twisted Copper Pairs)
>  |    \_______ Baseband transmission
>  \____________ Speed

Dumb question. Does 802.3 actually use the word lanes here?

I'm looking at the commit which added lanes:

commit 012ce4dd3102a0f4d80167de343e9d44b257c1b8

    Add 'ETHTOOL_A_LINKMODES_LANES' attribute and expand 'struct
    ethtool_link_settings' with lanes field in order to implement a new
    lanes-selector that will enable the user to advertise a specific number
    of lanes as well.

    $ ethtool -s swp1 lanes 4
    $ ethtool swp1
      Settings for swp1:
            Supported ports: [ FIBRE ]
            Supported link modes:   1000baseKX/Full
                                    10000baseKR/Full
                                    40000baseCR4/Full
                                    40000baseSR4/Full
                                    40000baseLR4/Full
                                    25000baseCR/Full
                                    25000baseSR/Full
                                    50000baseCR2/Full
                                    100000baseSR4/Full
                                    100000baseCR4/Full
            Supported pause frame use: Symmetric Receive-only
            Supports auto-negotiation: Yes
            Supported FEC modes: Not reported
            Advertised link modes:  40000baseCR4/Full
                                    40000baseSR4/Full
                                    40000baseLR4/Full
                                    100000baseSR4/Full
                                    100000baseCR4/Full


For these link modes we are talking about 4 PCS outputs feeding an
SFP module. The module when has one fibre pair, the media.

For baseT4 what you call a lane is a twisted pair, the media.

These two definitions seem to contradict each other.

For SGMII, 1000BaseX, we have 1 PCS lane, feeding a PHY with 4 pairs.

It gets more confusing at 10G, where the MAC might have 4 lanes
feeding 4 pairs, or 1 lane feeding 4 pairs.

Also, looking at the example above, if i have a MAC/PHY combination
which can do 10/100/1G and i did:

    $ ethtool -s swp1 lanes 2

would it then only advertise 10 and 100, since 1G need four 'lanes'?

Is reusing lanes going to cause us problems in the future, and maybe
we should add a pairs member, to represent the media? And we can
ignore bidi fibre modules for the moment :-)

       Andrew

