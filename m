Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205A1CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z9DCHnUskoAQsh4r0zX0pM3YjsFlNAkxg7COa2SK03s=; b=hjVY2PenQaIfoLqecQ32RERNN3
	u79+fYCfOl8dLdxU+dd8X4Kn7yt6zwTyv4mqfiX2/FnW+Jm8cSYCEPfZb8BmiJN5Ae+OGZQwrXR7Q
	k3fDwdtV5wc6rEunlaLtoc+9R17PQhT31L+E7UBwdGpHMFxn4TxMZV/gPvQXYa/Dc53XbuJOhGiIf
	hRERYMCU1LIMBuIQqt0HpScMbrJA/EIlMscanW6gPhEARzXnPiTi+UPIe94T0ozkC6QOSDJCZp19E
	eXZCJZJiPItgLESWMBaOlq7og7Zcc2+/toYNaxps9P+gCP28gcDNjVxApWbxBK6Eiby80CCWwJsI0
	UCcH52oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytpD-0000000CZn0-0GTW;
	Wed, 17 Sep 2025 15:12:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytpA-0000000CZl0-3ILY;
	Wed, 17 Sep 2025 15:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z9DCHnUskoAQsh4r0zX0pM3YjsFlNAkxg7COa2SK03s=; b=paOB4LDXN15KG0UXWrMKam+OMH
	aZOO7D2SyGG0TEQzk8TvwQx527ujk+cjVaq9dB5vejyXfhPCSkTUJs64LU/CTQ9tZThfqn88jGwO8
	5wR9xFtWLStSP/S1t5sY9e6o64ps6PeMAJZYb8HxbyPmmhvY0fy1s2iKuXnGotbZEEAJkyS58BUHC
	Qun28H6WmBZUyEPcX2PntSb2b1KeGYKAvV63EpVbPs4MLVG4js2lHn1wNFqUU1cHEDDPwpqasmdj3
	9NcyfYEEP1QUudsP4DznsTI7pEdsn5dJeYOyBJ7cC7Zj1oI4BWiC+boI55TDbz201JJx0ijh+qH0Z
	1ZyX2ONA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43408)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uytot-000000004jS-0P44;
	Wed, 17 Sep 2025 16:11:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uytoj-000000000Hx-11GN;
	Wed, 17 Sep 2025 16:11:33 +0100
Date: Wed, 17 Sep 2025 16:11:33 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <fustini@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH net-next 00/10] net: stmmac: remove mac_interface
Message-ID: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_081200_827366_8821015F 
X-CRM114-Status: GOOD (  26.75  )
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

The dwmac core supports a range of interfaces, but when it comes to
SerDes interfaces, the core itself does not include the SerDes block.
Consequently, it has to provide an interface suitable to interface such
a block to, and uses TBI for this.

The driver also uses "PCS" for RGMII, even though the dwmac PCS block
is not present for this interface type - it was a convenice for the
code structure as RGMII includes inband signalling of the PHY state,
much like Cisco SGMII does at a high level.

As such, the code refers to RGMII and SGMII modes for the PCS, and
there used to be STMMAC_PCS_TBI and STMMAC_PCS_RTBI constants as well
but these were never set, although they were used in the code.

The selection of the PCS mode was from mac_interface. Thus, it seems
that the original intention was for mac_interface to describe the
interface mode used within the dwmac core, and phy_interface to
describe the external world-accessible interface (e.g. which would
connect to a PHY or SFP cage.)

It appears that many glue drivers misinterpret these. A good exmple
is socfpga. This supports SGMII and 1000BASE-X, but does not include
the dwmac PCS, relying on the Lynx PCS instead. However, it makes use
of mac_interface to configure the dwmac core to its GMII/MII mode.

So, when operating in either of these modes, the dwmac is configured
for GMII mode to communicate with the Lynx PCS which then provides
the SGMII or 1000BASE-X interface mode to the external world.

Given that phy_interface is the external world interface, and
mac_interface is the dwmac core interface, selecting the interface
mode based on mac_interface being 1000BASEX makes no sense.

Moreover, mac_interface is initialised by the stmmac core code. If
the "mac-mode" property is set in DT, this will be used. Otherwise,
it will reflect the "phy-mode" property - meaning that it defaults
to phy_interface. As no in-kernel DT makes reference to a "mac-mode"
property, we can assume that for all in-kernel platforms, these two
interface variables are the same. The exception are those platform
glues which I reviwed and suggested they use phy_interface, setting
mac_interface to PHY_INTERFACE_MODE_NA.

The conclusion to all of this is that mac_interface serves no useful
purpose, and causes confusion as the platform glue code doesn't seem
to know which one should be used.

Thus, let's get rid of mac_interface, which makes all this code more
understandable. It also helps to untangle some of the questions such
as:
- should this be using the interface passed from phylink
- should we set the range of phylink supported interfaces to be
  more than one
- when we get phylink PCS support for the dwmac PCS, should we be
  selecting it based on mac_interface or phy_interface, and how
  should we populate the PCS' supported_interface bitmap.

Having converted socfpga to use phy_interface, this turns out to
feel like "the right way" to do this - convert the external world
"phy_interface" to whatever phy_intf_sel value that the dwmac core
needs to achieve the connection to whatever hardware blocks are
integrated inside the SoC to achieve the requested external world
interface.

As an illustration why - consider that in the case of socfpga, it
_could_ have been implemented such that the dwmac PCS was used for
SGMII, and the Lynx PCS for 1000BASE-X, or vice versa. Only the
platform glue would know which it is.

I will also note that several cores provide their currently configured
interface mode via the ACTPHYIF field of Hardware Feature 0, and thus
can be read back in the platform-independent parts of the driver to
decide whether the internal PCS or the RGMII (or actually SMII) "PCS"
should be used.

This is hot-off-the-press, and has only been build tested. As I have
none of these platforms, this series has not been run-tested, so
please test on your hardware. Thanks.

 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    | 20 +++++++-------
 .../net/ethernet/stmicro/stmmac/dwmac-ingenic.c    | 25 ++++++++++-------
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |  2 --
 .../net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c    |  1 -
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   |  6 ++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c  | 26 +++++++++---------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |  4 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 24 ++++++++---------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  6 ++++-
 include/linux/stmmac.h                             | 31 ++++++++++++++--------
 12 files changed, 82 insertions(+), 67 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

