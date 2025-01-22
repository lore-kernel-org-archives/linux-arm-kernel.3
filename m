Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D84C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 18:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCpKDdKg4rdX1fCkNUFQGWyQg+xKmQk23jdejo83T+A=; b=4aOo3b5Szc9rRPzvmXGkf6AcNs
	uEMBXzecHH+ukdEg3g8g/PB+2+m3KonyUCmm4ppSy/MFDUdotNkSX3FtSs0PD1wmZTht2KRgoHCfj
	FDkKTNkjqkF6flCVmJWZ4m3h9pcmrl7Uxl3AhS+swNbMCNg5oANAwgIUWbLn+quYkQ0e7Q6vMMGaj
	RV5EIzJ+HYjq2KMVh3tZ/wUXw5r4bLjwxRGjn3Rw5pVyEs7G1mIywHO7ei+DypZqLGmELBHqVk9zS
	ao5ORzAUzuO6Mo8bL+Wl65JGu4WiNN4FqsTytjIUjAklFOGVnir68yTJvQFGTVIQc6+pfT7NfGv6y
	d+C5Eevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tafuN-0000000B2He-3yYk;
	Wed, 22 Jan 2025 18:56:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taft4-0000000B26J-2us7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 18:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hCpKDdKg4rdX1fCkNUFQGWyQg+xKmQk23jdejo83T+A=; b=wbw8FXVSTVYJs6N8NQRDei+kf6
	WhboiXTxBHYWqR43xrZcxr76M1+HrYgItDRbn7sdkVbRhzuGIjvZfG9UWajqYcyVnjIxGPVPzRAzg
	e1c1qx2eV5Wp822RD8Qq03WJFckWovLhpZVWwKwE2FpyNILvpIjqgZA+3ziUYuMNKsA/T6N6hnEwi
	ElC4MioxwSWGsODlYGMPJg+8msO2fkUvf36hQ923+6RXdVwx/U6wZ7ycldajzITiFhwW+wmgqxIkO
	jDQN1Ut68J4I76GTic1c9RFytpUQ6BKVfW41d56RqwKgzGbQWR1HU+ta3tz2wpLUbuG0WJIweeMZd
	YrjstVLA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53750)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tafso-0000Ax-17;
	Wed, 22 Jan 2025 18:55:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tafsj-00058Q-3C;
	Wed, 22 Jan 2025 18:55:18 +0000
Date: Wed, 22 Jan 2025 18:55:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
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
	Antoine Tenart <atenart@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH net-next RFC v2 1/6] net: ethtool: common: Make BaseT a
 4-lanes mode
Message-ID: <Z5E_FUxSZJWRWVAq@shell.armlinux.org.uk>
References: <20250122174252.82730-1-maxime.chevallier@bootlin.com>
 <20250122174252.82730-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122174252.82730-2-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_105539_000874_0D0A9637 
X-CRM114-Status: GOOD (  11.13  )
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

On Wed, Jan 22, 2025 at 06:42:46PM +0100, Maxime Chevallier wrote:
> When referring to BaseT ethernet, we are most of the time thinking of
> BaseT4 ethernet on Cat5/6/7 cables. This is therefore BaseT4, although
> BaseT4 is also possible for 100BaseTX. This is even more true now that
> we have a special __LINK_MODE_LANES_T1 mode especially for Single Pair
> ethernet.
> 
> Mark BaseT as being a 4-lanes mode.

This is a problem:

1.4.50 10BASE-T: IEEE 802.3 Physical Layer specification for a 10 Mb/s
CSMA/CD local area network over two pairs of twisted-pair telephone
wire. (See IEEE Std 802.3, Clause 14.)

Then we have the 100BASE-T* family, which can be T1, T2, T4 or TX.
T1 is over a single balanced twisted pair. T2 is over two pairs of
Cat 3 or better. T4 is over four pairs of Cat3/4/5.

The common 100BASE-T* type is TX, which is over two pairs of Cat5.
This is sadly what the ethtool 100baseT link modes are used to refer
to.

We do have a separate link mode for 100baseT1, but not 100baseT4.

So, these ethtool modes that are of the form baseT so far are
describing generally two pairs, one pair in each direction. (T1 is
a single pair that is bidirectional.)

It's only once we get to 1000BASE-T (1000baseT) that we get to an
ethtool link mode that has four lanes in a bidirectional fashion.

So, simply redefining this ends up changing 10baseT and 100baseT from
a single lane in each direction to four lanes (and is a "lane" here
defined as the total number of pairs used for communication in both
directions, or the total number of lanes used in either direction.

Hence, I'm not sure this makes sense.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

