Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3552D69112
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 14:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmKBbKYuoLleqExWJCCCSze5Rdx0CWrSTJ6oO6RpaSM=; b=YfOrqaTpLIPLl3aOvnM/oUFV4l
	6hFFNEdw2Q5C0BIGtUWNMplSoJZvyACALI7iEBRyfJ4LSbIe4RCRpkNbM318iCIRL1MnTYVe4LXpE
	g10KuxkSC/nxY87p4NhsF8K3Dnn4UcXBGjeMGN/g0MbWUnM4IvhPAaruhQh486QyFrG66+sQ0xTX6
	mONptuaHSY+OQ7gaFNfx1b3PBoPUdjIPa4/SgA88nCzNh4IVx2NQUlZMV/GiqCxhQPzl4XGNOpEhh
	F325nMH1GBPbtWP5MeRBrGKDlgi2VUFPjuZARcAV5t2Q2jYxjBUqDbYTQUXK6ZdcRldC5b9FIKOS1
	SIN1Mmyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfQG-0000000FkmU-0uVA;
	Thu, 28 Nov 2024 14:23:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfPH-0000000FkcS-1eZ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 14:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PmKBbKYuoLleqExWJCCCSze5Rdx0CWrSTJ6oO6RpaSM=; b=MW64YBdgJ+mct0zLl1Xod9CUgv
	lvEaoPD4oOeg9rzPup/jyaNJ8lfKoRZR8Ol8VNvh467jvNxNXa7HOCtTNtcu7MxaC47EhsDXY69AT
	tPY8pvSsDJHciOBE7d4+V+KaVUNbbuPE0AfLheBR1OyNg7Bi14obRx+WFPEhU8xU0dpI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tGfP5-00EiFo-8J; Thu, 28 Nov 2024 15:21:59 +0100
Date: Thu, 28 Nov 2024 15:21:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>, UNGLinuxDriver@microchip.com
Subject: Re: net: ti: weirdness (was Re: [PATCH RFC net-next 00/23] net:
 phylink managed EEE support)
Message-ID: <46498cdf-3582-4bbc-a00d-c02ff72cf600@lunn.ch>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
 <Z0cAaH30cXo38xwE@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0cAaH30cXo38xwE@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_062211_431101_B37A88AC 
X-CRM114-Status: GOOD (  21.99  )
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

On Wed, Nov 27, 2024 at 11:20:08AM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 26, 2024 at 12:51:36PM +0000, Russell King (Oracle) wrote:
> > In doing this, I came across the fact that the addition of phylib
> > managed EEE support has actually broken a huge number of drivers -
> > phylib will now overwrite all members of struct ethtool_keee whether
> > the netdev driver wants it or not. This leads to weird scenarios where
> > doing a get_eee() op followed by a set_eee() op results in e.g.
> > tx_lpi_timer being zeroed, because the MAC driver doesn't know it needs
> > to initialise phylib's phydev->eee_cfg.tx_lpi_timer member. This mess
> > really needs urgently addressing, and I believe it came about because
> > Andrew's patches were only partly merged via another party - I guess
> > highlighting the inherent danger of "thou shalt limit your patch series
> > to no more than 15 patches" when one has a subsystem who's in-kernel
> > API is changing.
> 
> Looking at the two TI offerings that call phy_ethtool_get_eee(), both
> of them call the phylib functions from their ethtool ops, but it looks
> like the driver does diddly squat with LPI state, which makes me wonder
> why they implemented the calls to phy_ethtool_get_eee() and
> phy_ethtool_set_eee(), since EEE will not be functional unless the PHY
> has been configured with a SmartEEE mode outside the kernel.

Probably because they did not know what they were doing, and it got
past reviewers.

Well, actually:

commit a090994980a15f8cc14fc188b5929bd61d2ae9c3
Author: Yegor Yefremov <yegorslists@googlemail.com>
Date:   Mon Nov 28 09:41:33 2016 +0100

    cpsw: ethtool: add support for getting/setting EEE registers
    
    Add the ability to query and set Energy Efficient Ethernet parameters
    via ethtool for applicable devices.
    
    This patch doesn't activate full EEE support in cpsw driver, but it
    enables reading and writing EEE advertising settings. This way one
    can disable advertising EEE for certain speeds.
    
    Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
    Acked-by: Rami Rosen <roszenrami@gmail.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>

Seems like somebody had an issue and did the minimum to work around
the issue. This also suggests the hardware is doing EEE by default,
hopefully with some sort of sensible hardware defaults.

	Andrew

