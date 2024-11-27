Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987A7D609DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pnFazxY8HzLhh4gTcIsD9NoAcCruO+q2t9IKoBKYJw=; b=ia8uR/PHTELo4sV/UiNpVCcS5U
	dks17O8X4rWgQUy4g2ZUs9WBOnzaBJx9uMxRO8b0TKJYulZ5u5/4fvBzDOFxbfnY340JyrGnx5EWL
	JPE4s+StqtciMpYWzYCOWsWImzaV32ufghHzeYzYbj3GvMR2Q9Vmqxi294HY2PQb7uI1LrRXCQvMu
	F0k6H71GKLs3dTk4qkIgAx/PCStPp2jJoUc4t8PVdPlAIJ4ELoP/S2BeAztsqo/Li2kQ/W/kAbpwF
	Nb3DvfzpjM8A3j6MUcs/eO4O7+7XFFzoJU6w1HYny07CQrY26LRmTt47UoW+gD4y+EMa1aHksLRaN
	CZq8/a2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGBA-0000000D0YG-07xI;
	Wed, 27 Nov 2024 11:25:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG5l-0000000CzFE-1JGn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3pnFazxY8HzLhh4gTcIsD9NoAcCruO+q2t9IKoBKYJw=; b=MSah3XyKasAIMaryEwuVLGuety
	aV5UulyDIACFz2Fga7NQ4B3f+aS2m3NVO7MErNGrPkCd3cj/0I1CpmFK0f4Ngqiq0FOL/ZHPTHOvK
	/ckaHb7ObAZDGfZtkQIbsB102cURe9h/f7H//YFkWHFEbMlOJ6mlDiRcwIsXyRrSlbWogeyFpZH8v
	qCZJuSTKO4Eg4WLoFCef52QMAcuoAjzp0fhe7MaZOiagtSYi2jKQ1gpB4aXKd36D3Uco9+7Oy0Vag
	3tdkB8WZ1RZzSbHq9VUXWLF0kcS5OmlnP6WvlS+M8IZz8IAYiAkS+SCG1V+Y0jU2Adsb1r7PDqsdX
	GfM0qPQg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36484)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tGG5b-0000FS-2u;
	Wed, 27 Nov 2024 11:20:12 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tGG5Y-00076z-1d;
	Wed, 27 Nov 2024 11:20:08 +0000
Date: Wed, 27 Nov 2024 11:20:08 +0000
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
Subject: Re: net: ti: weirdness (was Re: [PATCH RFC net-next 00/23] net:
 phylink managed EEE support)
Message-ID: <Z0cAaH30cXo38xwE@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_032021_347696_D401CA1B 
X-CRM114-Status: GOOD (  15.41  )
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

Looking at the two TI offerings that call phy_ethtool_get_eee(), both
of them call the phylib functions from their ethtool ops, but it looks
like the driver does diddly squat with LPI state, which makes me wonder
why they implemented the calls to phy_ethtool_get_eee() and
phy_ethtool_set_eee(), since EEE will not be functional unless the PHY
has been configured with a SmartEEE mode outside the kernel.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

