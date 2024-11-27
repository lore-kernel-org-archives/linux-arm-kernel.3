Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE95D609D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oZD0zN1OqlWY3Xl/s5KM7s42CEMCxfoFjW01Rsvl2k=; b=GgkhR8XNRxeuwoYd9ugl8BNzmn
	dQHPU6PGJpZ2ExWT7gkczzOnpOFhC2H6s4ZNidpEcWK0anMLNdymmo+D0oLODZS01+q9K2ZHX4PTM
	+Rt/yw4lCTd3dx32M7LlhWM47xLH6wee9J4jebc7zDrTfKz+XJO7JaSjEXS3TNwtel+glP70rwOXk
	CSa3ZyiyGHhPuUXjcfG2D1887emTfL8BDEkGHKnYoqQ8GyILteV6koQrgB7aGy1Gkj5zknOxXb4SJ
	SEqho68Ggfu8s151jKGHnJrnM2RnzegyCP808MB6TWeo0wAcm+RJ2S6BHeN7OZZ72O6miF1SpIolZ
	Os+kJFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFeH-0000000CuYf-0R6C;
	Wed, 27 Nov 2024 10:51:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFc9-0000000CuEV-2u2G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2oZD0zN1OqlWY3Xl/s5KM7s42CEMCxfoFjW01Rsvl2k=; b=n7IcBDDliXi1TXfixo+nibhjRC
	6tliHVfbJRuMjwL23r8zVzg2t5H4Eu8qlexTRfd2g4dc6gUxTz6Rm3rank02nURIiNzNLE2c+LhUZ
	4oSEg0Ey0R+GpljVnyaYxZiC8anJQ9Z316HzOqyRPbmjm0ciiUq4cirUEI2hzNC4LmQ4Wzxq0buk+
	nKryo2u06SvVDKDMVxK9xQh1SvgckM8HzDvlLmB9WrTEV1lu7GAb0SGIn1xdRu+VOjKAr1ZgmBaVs
	qAVAbmtbaWyuVgS/axf4ldaRatPkkEts3hPjocFD8igQ8pJsIUWGbfdLKQdG6n4ppaZu4BGzjrJX4
	cVObfl9g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38012)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tGFbu-00009L-1D;
	Wed, 27 Nov 2024 10:49:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tGFbp-00075l-2X;
	Wed, 27 Nov 2024 10:49:25 +0000
Date: Wed, 27 Nov 2024 10:49:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
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
Subject: Re: net: rtl8169: EEE seems to be ok (was: Re: [PATCH RFC net-next
 00/23] net: phylink managed EEE support)
Message-ID: <Z0b5NepJdXiEQ1IC@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_024946_013266_9387F0DF 
X-CRM114-Status: GOOD (  16.31  )
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

On Tue, Nov 26, 2024 at 12:51:36PM +0000, Russell King (Oracle) wrote:
> In doing this, I came across the fact that the addition of phylib
> managed EEE support has actually broken a huge number of drivers -
> phylib will now overwrite all members of struct ethtool_keee whether
> the netdev driver wants it or not. This leads to weird scenarios where
> doing a get_eee() op followed by a set_eee() op results in e.g.
> tx_lpi_timer being zeroed, because the MAC driver doesn't know it needs
> to initialise phylib's phydev->eee_cfg.tx_lpi_timer member. This mess
> really needs urgently addressing, and I believe it came about because
> Andrew's patches were only partly merged via another party - I guess
> highlighting the inherent danger of "thou shalt limit your patch series
> to no more than 15 patches" when one has a subsystem who's in-kernel
> API is changing.

Looking at the rtl8169 driver, it looks pretty similar to the Marvell
situation. The value stored in tp->tx_lpi_timer is apparently,
according to r8169_get_tx_lpi_timer_us(), a value in bytes, not in a
unit of time. So it's dependent on the negotiated speed, and thus we
can't read it to set the initial phydev->eee_cfg.tx_lpi_timer state,
because in the _probe() function, the PHY may not have negotiated a
speed.

However, this driver writes keee->tx_lpi_timer after
phy_ethtool_get_eee() which means that it overrides phylib, so hasn't
been broken.

Therefore, I think rtl8169 is fine.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

