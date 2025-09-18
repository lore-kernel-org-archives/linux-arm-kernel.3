Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F3DCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=534+lwp2XT2+BE76GPOqNHw9H4NtzKsVjc9xzAvBcWw=; b=jNg574QMdyhu6aZw/iDHJ2awnv
	1F3Kk1MAMP/fNKIs9aGJ6YsvFr1A9fTMduG24nrq1vSH2Yf7k+Y9OSuAIbaXxyocMNrY5y0Im0U1B
	VmaUNNoXv7jrrMKkm3rjIDlQoWb9QxHo8DR8pk7bFGKn4QzlIdBzSik8W4b3HrtMn6IgmCYOwAXk0
	iULbUGpP2yLkNGFyQ9CkzoX2n2wFZzbRFRzM/reY7Z1xQr6yqTZAdjKBzTIInDAg4sylT1VkHhHUa
	QglcRLYsgZxHkdwZV9lgje5OzR2HIXjIMCU1fZT989eU6EB6SYeQjhb1R7iG3kWEIKbesoYA6c5lt
	8CfvRLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGeu-00000000QJH-2om9;
	Thu, 18 Sep 2025 15:34:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGes-00000000QH9-0e0V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=534+lwp2XT2+BE76GPOqNHw9H4NtzKsVjc9xzAvBcWw=; b=DQWGvp0pq6RVj00wUirYjFs+2y
	fORCEVeztn3KYnmhvxMZuL3pGJCZ5u2Pbwpx2PelEmLP3Bs/600/BAt624JQARAK0TjUifSWMdIcA
	wyxhY+8kEnaHts3bxEWdVPCtoTBxlw+oNDLdpClbdAl0TdQi/dm8aA/Zgun5JO+Ckuuw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uzGeY-008qQn-7z; Thu, 18 Sep 2025 17:34:34 +0200
Date: Thu, 18 Sep 2025 17:34:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/4] net: stmmac: stm32: add WoL from PHY
 support
Message-ID: <46f9bdf8-a35c-4e94-9d4d-c87219444029@lunn.ch>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
 <aMriVDAgZkL8DAdH@shell.armlinux.org.uk>
 <72ad4e2d-42fa-41c2-960d-c0e7ea80c6ff@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ad4e2d-42fa-41c2-960d-c0e7ea80c6ff@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_083454_191049_3AA9B8BB 
X-CRM114-Status: GOOD (  23.01  )
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

> > Andrew has previously suggested that MAC drivers should ask the PHY
> > whether WoL is supported, but this pre-supposes that PHY drivers are
> > coded correctly to only report WoL capabilities if they are really
> > capable of waking the system. As shown in your smsc PHY driver patch,
> > this may not be the case.
> 
> So how can we distinguish whether a PHY that implements WoL features
> is actually able (wired) to wake up the system? By adding the
> "wakeup-source" property to the PHY node?
> 
> Therefore, only set the "can wakeup" capability when both the PHY
> supports WoL and the property is present in the PHY node?

There are layering issue to solve, and backwards compatibility
problems, but basically yes.

I would prefer to keep the phylib API simple. Call get_wol() and it
returns an empty set if the PHY is definitely not capable of waking
the system. Calling set_wol() returns -EOPNOTSUPP, or maybe -EINVAL,
if it definitely cannot wake the system. 

However, 'wakeup-source' on its own is not sufficient. It indicates
the PHY definitely can wake the system. However, it being missing does
not tell us it cannot wake the system, because old DT blobs never had
it, but i assume some work, and some are broken.

We need the PHY driver involved as well. If the driver only supports
WoL via interrupts, and phy_interrupt_is_valid() returns False, it
cannot wake the system.

There other tests we can make, like device_can_wakeup(). In the end,
we probably have some cases where we know it should work, some cases
we know it will not work, and a middle ground, shrug our shoulders, it
might work, try it and see.

> However, this does not solve the actual static pin function
> configuration for pins that can, if correct alternate function is
> selected, generate interrupts, in PHY drivers.
> 
> It would be nice to be able to apply some kind of pinctrl to configure
> the PHY pins over the MDIO bus thanks to some kind of pinctrl hogging.

I don't think it needs to be hogging. From what i remember of pinctrl,
when a driver is probed, pinctrl-0 is activated. It is not limited to
pins which the driver directly uses. So if LED2 is connected to a pin,
pinctrl can at least select the needed function for that pin.

	Andrew

