Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A194C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 19:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2W+qfsEAUclS3rHGg1rqVyLJ0A2NtvBKn6a5gu/HE+Q=; b=t77qRSL0HmpeeOB4ZKP3G3LTbX
	N9PrG6lc2SrnBfyKDejB7WiQSDIZEyfdESwiILmBqT1dxA0e8mu4ZJXvlVdm2hn/v7Iz0+Mdlc4cd
	K1+77+ZN7oRqQ3tR0fgHaUlUYA5FLoKfLg18NW5KOIML5MTiY69Hj6sw/eqzRNDZ+6VEdoGv/kG1p
	xV0SV6hprAQo6l7zSR9GFtbbYMf0OCGSWk2U8WHtrMsl0z9pzw8UqQGwIZOSN03X7fKWUIg1qHcRY
	4t9yYcOurUX965CHYRK+48sDhGJAp10/ssyXx6psF+KoWmazc5Ebv5XUgfLgUfVCmR/AQun5wwL3C
	jYtoGZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tagNf-0000000B4sr-36DI;
	Wed, 22 Jan 2025 19:27:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tagMM-0000000B4j6-0kAN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 19:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2W+qfsEAUclS3rHGg1rqVyLJ0A2NtvBKn6a5gu/HE+Q=; b=zgM0RouzKSxSBhQv/D2XkgVoiw
	e8l+KkrofWnaCxW/VswXEPsvHyftp4soRON+mPixqjvrT2AITkMnzKN1rWqrs/Wxp2ezmVGKPkNdu
	cRnsRKEQEhOTsibHhZJqu0ckUkvOO94eOz1ecA+lN7FeJdsyhLkM8gfh64JDVS5eaN6h8D0yD3yEA
	cEFQnGMnIFZFu72GgIkctg9T67YAGC7LJr/Z891SSGX4Od3ZvoVqdBEJuQ0hCFTDxyZSzAvHl0BrE
	Nb1rs8od0pCKYzRUa6KI4B+cqA/Z762ewtE+2piYAXY/y4P7AaVEqDBqM6V7/8yoCfbVhxu3lK+1M
	wVmuLDGQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44086)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tagMA-0000Cl-1U;
	Wed, 22 Jan 2025 19:25:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tagM6-00059x-00;
	Wed, 22 Jan 2025 19:25:38 +0000
Date: Wed, 22 Jan 2025 19:25:37 +0000
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
Message-ID: <Z5FGMfF1ox-KhFAg@shell.armlinux.org.uk>
References: <20250122174252.82730-1-maxime.chevallier@bootlin.com>
 <20250122174252.82730-2-maxime.chevallier@bootlin.com>
 <Z5E_FUxSZJWRWVAq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5E_FUxSZJWRWVAq@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_112554_223675_614D824A 
X-CRM114-Status: GOOD (  21.35  )
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

On Wed, Jan 22, 2025 at 06:55:17PM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 22, 2025 at 06:42:46PM +0100, Maxime Chevallier wrote:
> > When referring to BaseT ethernet, we are most of the time thinking of
> > BaseT4 ethernet on Cat5/6/7 cables. This is therefore BaseT4, although
> > BaseT4 is also possible for 100BaseTX. This is even more true now that
> > we have a special __LINK_MODE_LANES_T1 mode especially for Single Pair
> > ethernet.
> > 
> > Mark BaseT as being a 4-lanes mode.
> 
> This is a problem:
> 
> 1.4.50 10BASE-T: IEEE 802.3 Physical Layer specification for a 10 Mb/s
> CSMA/CD local area network over two pairs of twisted-pair telephone
> wire. (See IEEE Std 802.3, Clause 14.)
> 
> Then we have the 100BASE-T* family, which can be T1, T2, T4 or TX.
> T1 is over a single balanced twisted pair. T2 is over two pairs of
> Cat 3 or better. T4 is over four pairs of Cat3/4/5.
> 
> The common 100BASE-T* type is TX, which is over two pairs of Cat5.
> This is sadly what the ethtool 100baseT link modes are used to refer
> to.
> 
> We do have a separate link mode for 100baseT1, but not 100baseT4.
> 
> So, these ethtool modes that are of the form baseT so far are
> describing generally two pairs, one pair in each direction. (T1 is
> a single pair that is bidirectional.)
> 
> It's only once we get to 1000BASE-T (1000baseT) that we get to an
> ethtool link mode that has four lanes in a bidirectional fashion.
> 
> So, simply redefining this ends up changing 10baseT and 100baseT from
> a single lane in each direction to four lanes (and is a "lane" here
> defined as the total number of pairs used for communication in both
> directions, or the total number of lanes used in either direction.
> 
> Hence, I'm not sure this makes sense.

Looking at patch 2, I don't see why you need patch 1. It's not really
improving the situation. Before the patch, the number of lanes for
some BASE-T is wrong. After the patch, the number of lanes for some
BASE-T is also wrong - just a different subset.

I think you should drop this patch and just have patch 2.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

