Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8B5CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 08:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eaEshSke7WWsFjbgjKG91woJG61C7g3CnfzoHwJbTuA=; b=fmrgMDGiKLEhNs33FqTFQH8WFk
	a3pHUevKklpSrca1WU21nqPt0a7Rl6AtKLWmSr7Y8pknWvHS1PjyuhQxR+iRXz35F9DakAmPW7ymH
	2y82ZWi/RH+XDLmBLGYAU8U/ffxbUCC7lcW5mERqdeeugdxznM30x3I27+jypFdFLnUdzr9DVVZVa
	hTvDXIQ7FAW6LgfbJmKoBjfAFPERvLZbUYn+b3/rDn7qgOudIf+d5n0LJazzYV2sC3/wqCZ7cVwTt
	1L/Nr6pjbC0AJc0FENV54VEJvAXP+wNaROaNU93Z1OQ8GGH62qBPmnh4ad16yGY8U5uVh7weZr/xL
	NysLuufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nCb-0000000ETeZ-0gSQ;
	Sun, 28 Sep 2025 08:56:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nCY-0000000ETcm-47m2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 08:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eaEshSke7WWsFjbgjKG91woJG61C7g3CnfzoHwJbTuA=; b=oZuzW/vIzUPgZYfnMIHlje/k9/
	W6/8bkTFGJGj6A70h1Qv4oljN7MCn5VGdznOvEhJ0Ouf26iOZParIaKSaw+kOvwEtwUncHnH56IeM
	fCVFx/jpMWQje9yB0HJzWM2I+0xii4aqCTkELyDZ+ZN10PWMsQq3N0rghTPiLfTbN0V0gFVAzJFXp
	Ozpy7EFJtSN03M21ToYmNXJSiSdCi4BeTZPv3OyVsx9nweswCO+7fyhvAveQZtcC3BJiy06PIceBY
	drZ0PIJAX+j8MQYy5bX5PehiEqi+pIsHclH1VU0DHLCpFw9fqF6fvdPWex+0l5YEEl+02hAjChCR1
	5HqI/vOw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54172)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v2nCL-0000000059y-1F6D;
	Sun, 28 Sep 2025 09:56:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v2nCH-000000002RM-2cRk;
	Sun, 28 Sep 2025 09:55:57 +0100
Date: Sun, 28 Sep 2025 09:55:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>
Subject: [PATCH RFC net-next 0/6] net: add phylink managed WoL and convert
 stmmac
Message-ID: <aNj4HY_mk4JDsD_D@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_015615_021941_E81416A8 
X-CRM114-Status: GOOD (  18.41  )
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

Hi,

This experimental series is implementing the thoughts of Andrew,
Florian and myself in an attempt to improve the quality of Wake-on-Lan
(WoL) implementations.

This changes nothing for MAC drivers that do not wish to participate in
this, but if they do, then they gain the benefit of phylink configuring
WoL at the point closest to the media as possible.

We first need to solve the problem that the multitude of PHY drivers
report their device supports WoL, but are not capable of waking the
system. Correcting this is fundamental to choosing where WoL should be
enabled - a mis-reported WoL support can render WoL completely
ineffective.

The only PHY drivers which uses the driver model's wakeup support is
drivers/net/phy/broadcom.c, and until recently, realtek. This means
we have the opportunity for PHY drivers to be _correctly_ converted
to use this method of signalling wake-up capability only when they can
actually wake the system, and thus providing a way for phylink to
know whether to use PHY-based WoL at all.

However, a PHY driver not implementing that logic doesn't become a
blocker to MACs wanting to convert. In full, the logic is:

- phylink supports a flag, wol_phy_legacy, which forces phylink to use
  the PHY-based WoL even if the MDIO device is not marked as wake-up
  capable.

- when wol_phy_legacy is not set, we check whether the PHY MDIO device
  is wake-up capable. If it is, we offer the WoL request to the PHY.

- if neither wol_phy_legacy is set, or the PHY is not wake-up capable,
  we do not offer the WoL request to the PHY.

In both cases, after setting any PHY based WoL, we remove the options
that the PHY now reports are enabled from the options mask, and offer
these (if any) to the MAC. The mac will get a "mac_set_wol()" method
call when any settings change.

Phylink mainatains the WoL state for the MAC, so there's no need for
a "mac_get_wol()" method. There may be the need to set the initial
state but this is not supported at present.

I've also added support for doing the PHY speed-up/speed-down at
suspend/resume time depending on the WoL state, which takes another
issue from the MAC authors.

Lastly, with phylink now having the full picture for WoL, the
"mac_wol" argument for phylink_suspend() becomes redundant, and for
MAC drivers that implement mac_set_wol(), the value passed becomes
irrelevant.

 drivers/net/ethernet/stmicro/stmmac/stmmac.h       | 11 +--
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 31 +-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 45 ++++++-----
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  4 +-
 drivers/net/phy/phy_device.c                       | 14 +++-
 drivers/net/phy/phylink.c                          | 89 +++++++++++++++++++++-
 include/linux/phy.h                                | 21 +++++
 include/linux/phylink.h                            | 28 +++++++
 8 files changed, 179 insertions(+), 64 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

