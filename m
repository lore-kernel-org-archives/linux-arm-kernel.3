Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280BAC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 18:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Aq4zy6PfsqGNGjFtyNQAEe67ibyvhyM2nHkT21RqtJM=; b=dJhjqdy1cmG5vFLCCBio5lGPsR
	i3JHC7bh8OunaItG3jwk00P8z/8K72K8PSqZsVdK6oeWSZ/2oTFOjd2ITK9g/hNpVT0MIuIu0AKq3
	hXPXfuusd/ohYZb+ywuiaTAWAZlERwoNQLAj7jj4WdyHHpWrIlEelX0JW3SNtoNq7iUad1qkmjEHw
	ysMiTvtVrUECfU/6/EPS8QuXa/WQ+8zte5RtE0aVXX6MhvVvKClOOifi+ean8SoWHdsFTrFDAkg7Z
	P1vA8yY6ze4NJxjsGp74pSySPsuRV+pncvtUyOp0uCjuuUWylgcXlAOAUuIAEHX4YIXY2BRCfPEJA
	2H9pq2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pQ7-00000001wUa-1Rh0;
	Sun, 13 Sep 2026 18:59:19 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pQ4-00000001wTQ-2nRG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 18:59:18 +0000
Received: by mail-pj2-x0a.google.com with SMTP id d9443c01a7336-2cf49dc298bso21622855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 11:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789325955; x=1789930755; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aq4zy6PfsqGNGjFtyNQAEe67ibyvhyM2nHkT21RqtJM=;
        b=DtpzyPs6gbPD+EQ5QBLC0ZNr7mOqey3V51hsrbNBVsYm8vg3E0ol6QAF7S/UmlF30y
         pRjlFQ/RgudmlZuuRlrADjkVweQo3GDs9zERIrQEMDq61PR6Kmy9MozUQreQh/XfIg9A
         ClO8Y6A1CqUKQ49haw7tGcnuOKKb5+QNmfTeb8uYBvFEbhEAghygXWf4X0pQqvlQyZ2y
         Z+iBVr6wSlHGurUgcyV3+CnlShgH132jVMIhH0ziIr+UiMl3nZxmuLzpar172GbVXq9F
         PSREtI9SwyM++VVLjn9cG5WCz1qmAyyHHaRN3pOVBI49LOSmgtjMuJey0qIBOanHJEFr
         OcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325955; x=1789930755;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aq4zy6PfsqGNGjFtyNQAEe67ibyvhyM2nHkT21RqtJM=;
        b=gYUfvSyvEBAsjn+/8yJJjdXQtKSo01hhDnsqjhSMM/fiGj0ckJ+PHPryz8Y0qVY6iy
         5SFRzmDMnzeZBHthRLH2mSH6a+A1IFo41lPpIF61+4qGCt7V/k6BlJP0d4Q9VH2zrdKe
         489hvCkTAKDpgS+0+Kac4vOwfsyg9kEcphq7f0fm3aBVpI3jegCzmt/V5c2uUuRxfu6H
         Z62mZlpRDCm88mlv0bnUjvpMu8YrKf5oJmIO8nfBDrdJa0ftRszJ5/RRSBrVYp1bdkme
         0dWEu0UXvd3slHLspje8i9bYw+YvbBdfuu1Sr6uC2QWqABwsegJB2NEXIr3Id9e63e/p
         p59g==
X-Forwarded-Encrypted: i=1; AKwUvByBcN41fxI98nTQDoYel0IZDSmTzQ768iya/6CBh3Z7/+0rSdpNiTrRQmWFQI8v4hjGI89M9MRA9DI7gkdEjluF@lists.infradead.org
X-Gm-Message-State: AFuF++kdXHGegsi2H9ecWTYMJVrt6PKRau+qW1VowOIKuhtyGUYwErEh
	L3NN9Q3upW5cLqlQp2vJqR1XRfqb6coW00CDCDTibUFb9qDllpnxFSm+
X-Gm-Gg: AYBFou1wX2QbNqfrPTA0jP5v3UAlFJzH7VRekNP7p88Wvlux4sGg8rWzCxF54dpYZg0
	KP10U1Dlza4fuHtqL+/6NL7bueYBqkyVDDTDiZLFGoabt79mu+yMNUeUZeqINOLaA82jDnImUfH
	vwc4WubQpvsqGuEB53xdqzdiZXVoC5FpmlVcEy+Rj9TsrX19a4DbsbVYrnIeR3whPPcBBeC0HL4
	v7O4eJ4dXMUqsUYxYjgzEc0tt2ir0XanfpZidN6FKQpFk5IYEQUQzRXK/XJujU1HfrGOuVol7MR
	WJZuk6Lz7cCBzrVx8JGXmgA7jyQf+A6TmaIEznDHtfzVUAtGlmVSWI6NZhXgjWOrm2MWA/A4vG9
	e2C8ZU9ZYlpGUDmYjLv3QhQJ2UmGwbsiY694IxZtXHjaE4BWQMv3UC9s8+a8uaKgQUiZbDyZq1r
	wBFxljUt6RoONcLHE9AxvU52gqbO8pZFZkc69rbdTmycwYODpayyjAXZ2VoDSAj1HLuk9Scg==
X-Received: by 2002:a17:902:f68e:b0:2d9:2fc9:570f with SMTP id d9443c01a7336-2dd2a3502e9mr246863745ad.16.1789325955422;
        Sun, 13 Sep 2026 11:59:15 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.11.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:59:14 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v5 00/11] net: pcs: add basic support for RK3568 XPCS
Date: Mon, 14 Sep 2026 02:58:35 +0800
Message-ID: <20260913185849.907479-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_115916_753439_505C6BDF 
X-CRM114-Status: GOOD (  24.80  )
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

This series adds proper SGMII support for the Rockchip RK3568 SoC
using the integrated Synopsys DesignWare XPCS, along with necessary
fixes and refactoring in the stmmac core and XPCS driver.

Motivation
==========
The RK3568 integrates a DW XPCS accessed via APB3 and connected to
a Naneng Combo SerDes PHY.  Several boards (e.g., Ariaboard
Photonicat) use this interface for Gigabit Ethernet.  However, the
current upstream stmmac driver does not support this configuration,
and the XPCS driver has issues in SGMII poll mode that cause the
link to be reported incorrectly.

This series addresses these issues by:
- Refactoring stmmac PCS lifetime management to allow platform drivers
  full control over PCS creation/destruction
- Fixing the XPCS driver's SGMII link recovery
- Adding a Rockchip XPCS platform glue driver and wiring it up in
  dwmac-rk

Series overview
===============

Generic:
  Patch 1: move XPCS lifetime management to platform drivers

PHY:
  Patch 2: DT binding for Naneng Combo PHY SGMII MAC selection
  Patch 3: implement the PHY SGMII MAC selection in driver

RK3568 XPCS/SGMII:
  Patch 4: DT binding for Rockchip RK3568 XPCS
  Patch 5: add XPCS and fixed-clock nodes to rk3568.dtsi
  Patch 6: add ANRESTART support for SGMII link recovery
  Patch 7: implement the Rockchip XPCS platform glue driver
  Patch 8: DT binding for Rockchip DWMAC PCS
  Patch 9: wire up SGMII support in dwmac-rk
  Patch 11: update MAINTAINERS

Board enablement:
  Patch 10: enable SGMII LAN port on Photonicat board

Changelog
=========

Changes since v4:

Patch 1 (net: stmmac: move XPCS lifetime management to platform drivers)
- Corrected commit message: pcs_init/pcs_exit callbacks already exist in
  the baseline; this patch simplifies the dispatch, not introduces them
- Fixed description of the priv->hw->xpcs clobber: it happens on the
  plat->pcs_init branch, not the else branch
- Corrected the list of affected platform drivers: only Intel mGbE moves
  its XPCS creation; renesas-gbeth, rzn1 and socfpga only get the
  explicit NULL assignment in pcs_exit()
- Changed the "No xPCS found" message to a more generic "Failed to
  initialize PCS", since three of the four pcs_init() implementers do
  not create an XPCS
- Dropped the redundant NULL initializer in intel_mgbe_pcs_init()

Patch 3 (phy: rockchip: naneng-combphy)
- Added the TRM bit polarity (0 = GMAC0, 1 = GMAC1) and the hardware
  reset value (1) to the commit message

Patch 4 (dt-bindings: net: pcs: rockchip-rk3568)
- Renamed from rockchip-dwxpcs.yaml to rockchip,rk3568-xpcs.yaml
- Renamed pcs@ / pcs-mii@N to ethernet-pcs@ / ethernet-pcs-mii@N to match
  the sibling snps,dw-xpcs.yaml binding

Patch 5 (arm64: dts: rockchip: rk3568)
- Renamed clock nodes to clock-xpcs-gmac0 / clock-xpcs-gmac1 to match
  the preferred clock-<name> pattern in fixed-clock.yaml
- Aligned the labels (clk_gmac0_xpcs_mii / clk_gmac1_xpcs_mii) with
  clock-output-names

Patch 6 (net: pcs: xpcs: add ANRESTART support)
- Updated the comment in xpcs_config_aneg_c37_sgmii() to explain that
  although the DesignWare databook says AN restart is not needed for
  MAC side SGMII, some implementations (RK3568) require it
- Propagated the return value of xpcs_modify() so errors on the restart
  path are visible

Patch 7 (net: pcs: xpcs: add Rockchip RK3568 platform glue driver)
- Added GENERIC_PHY and PM_GENERIC_DOMAINS dependencies to Kconfig
- Derived the EEE multiplier at runtime from clk_get_rate(), and call
  xpcs_config_eee_mult_fact() in xpcs_rk_create()
- Moved device_link_add() inside the device_lock() critical section to
  close the race window where the supplier could be unbound

Patch 8 (NEW)
- dt-bindings: net: rockchip-dwmac: document pcs-handle

Patch 9 (net: stmmac: dwmac-rk)
- Added a rk3568_set_to_rmii() callback that explicitly clears CON1 bit 7
- Updated the commit message: the clock enable reorder prepares for the
  SGMII path that skips rk_get_phy_intf_sel(), it does not fix a
  pre-existing SError
- Documented the in-band-only limitation of the SGMII support
- Kept supports_sgmii unconditional to match the existing RGMII/RMII
  handling; phy-mode is fixed by DT and does not change at runtime

Patch 10 (arm64: dts: rockchip: rk3568-photonicat)
- Reordered properties in &combphy2, &gmac0 and &xpcs to follow the
  file's convention (alphabetical, status last)
- Corrected the changelog to say the property is added to an already
  enabled combphy2

Key design decisions
====================
- The stmmac core now delegates XPCS creation entirely to platform
  drivers via pcs_init/pcs_exit.  This is necessary because the
  generic XPCS creation logic would override any XPCS set up by the
  platform driver.

- The Rockchip XPCS driver creates a virtual MDIO bus over the APB3
  registers and implements address remapping.  The generic XPCS core
  handles all PCS configuration via phylink_pcs_ops.

- On RK3568 in SGMII mode, the MAC clock is fixed at 125 MHz and
  cannot be dynamically changed.  In-band mode is used, and the
  generic stmmac set_clk_tx_rate callback is disabled to prevent
  incorrect clock updates that would break RX.

- The SerDes and power domain are attached to the XPCS device tree
  node rather than the MAC node. This reflects the actual hardware
  topology and simplifies the dwmac-rk driver by keeping all PCS-related
  resources self-contained. It also prepares for possible future QSGMII
  support, where a single SerDes serves multiple MACs and would be
  more naturally managed under the XPCS node.

Testing
=======
Board: Ariaboard Photonicat (RK3568)
OS: Armbian (trixie)
Kernel: 6.18 (backports)
Result: The SGMII interface obtains an IP address, SSH works, and
        ping traffic passes without loss.

Notes
=====
- When testing out-band mode with set_clk_tx_rate, only 1000Mbps
  works on both TX/RX; 10/100Mbps only works on TX side.

Dependencies
============
None. All patches apply cleanly on top of torvalds master tree (v7.3).

Acknowledgments
===============
This work was inspired by and builds upon the excellent work of others:
- Serge Semin's Synopsys DesignWare XPCS platform driver (pcs-xpcs-plat.c)
- Clément Léger's Renesas MIIC driver (pcs-rzn1-miic.c)
- The Rockchip TRM and downstream OEM drivers

Thanks in advance,
Coia Prant
---
Coia Prant (11):
  net: stmmac: move XPCS lifetime management to platform drivers
  dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel
    property
  phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
  dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  net: pcs: xpcs: add ANRESTART support for SGMII link recovery
  net: pcs: xpcs: add Rockchip RK3568 platform glue driver
  dt-bindings: net: rockchip-dwmac: document pcs-handle
  net: stmmac: dwmac-rk: add SGMII support for RK3568
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
  MAINTAINERS: add entry for Rockchip XPCS driver

 .../net/pcs/rockchip,rk3568-xpcs.yaml         | 110 ++++
 .../bindings/net/rockchip-dwmac.yaml          |  15 +
 .../phy/phy-rockchip-naneng-combphy.yaml      |  13 +
 MAINTAINERS                                   |   9 +
 .../boot/dts/rockchip/rk3568-photonicat.dts   |  74 ++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  45 ++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  44 +-
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      |   7 +-
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 134 ++++-
 .../net/ethernet/stmicro/stmmac/dwmac-rzn1.c  |   7 +-
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |   7 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |  39 +-
 drivers/net/pcs/Kconfig                       |  25 +
 drivers/net/pcs/Makefile                      |   5 +-
 drivers/net/pcs/pcs-xpcs-rk.c                 | 559 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    |  35 +-
 .../rockchip/phy-rockchip-naneng-combphy.c    |   8 +
 include/linux/pcs/pcs-xpcs-rk.h               |  11 +
 19 files changed, 1076 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

-- 
2.47.3


