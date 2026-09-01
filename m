Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650DCC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G4upqtk25tpRU54+kLrj9L2TKzcfs0ynaE33ROHv7ww=; b=j6baX/++GgQROG9hNrKk5y1paf
	xhT5dqjGnO8AOU2CP0aTLmMEAWqtw7Q5RNZ1mtmvYUtHqXms29VynCAhynZujp5/pOTbyym3YDrNt
	z7NAHmal5FpAKMVi8iN2DHJlog/T3CsU+l4lD6G6iIqo5NQQtP9q4onvB0b29HxtF1Relko2uP6ks
	leqIJYvZEBStW7kpnBe8AIcgjrt+SSC2NKxKWoSxDv01s/zS89kToc9h9uvDVE1P/Hhk6hPY5wocR
	lSVayt/Wk5cxeHXLaXtt/92ObANGblVKek2wH4MHwD52J6H4fL33o6CVb0u/PYiLEtQUgcnSthsFB
	9C0v/wvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Pzu-0000000CP8m-2ofr;
	Tue, 01 Sep 2026 15:02:02 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Pzq-0000000CP6i-0zFd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:02:00 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-c9fe62e0da3so1695086a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788274916; x=1788879716; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4upqtk25tpRU54+kLrj9L2TKzcfs0ynaE33ROHv7ww=;
        b=r4QagH35Rv3IGIzZLDaLJ+VqnSjBCexsD/z7N+0hZpqR21WAvN87QHNZhQCL5ydYS8
         7etOWta4+X6Ktr5Qngye+d8n4naT5b+YI2t8AZ6u0iD0UC4Z4h1VOa2rktC2ryREj68I
         xs4gq1ukGKYDNYMNdmFqhs8TbiaQ9rScJf3Xe5MfRIb9XRC0COUmZ1xJ45fSJMBNaG2r
         62bcxTBIanECMXlOV7aBps4HCW1MdTsxdrH6boldT5fnpra5syATEq7CbsboMn+hvQRz
         9IpCc/70MiHOrbczIwfVvJxMNqKKweQhFwQ9DNbpTBPOHK4fC/Hco2j61oYaFCWfES7M
         J9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274916; x=1788879716;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G4upqtk25tpRU54+kLrj9L2TKzcfs0ynaE33ROHv7ww=;
        b=U8fbBZvJHxssdztBWKRqhTvmNxaJ1ZKcMeU9NEfoKN7UrO07qSuizmmB/qJX/NJRdv
         yFQS7wPh0dep3xwizGfw6qx2xAXP9d7a+J72J/e2cBk5jPzZLz1x4HB1Eo7nxpS/RwZy
         /ra5ZPyMXOZZ485Bs3bs9f6JZYz4PmR1MaKx7MIBawFD5jufUiEa17rFMLW8L9EZmUfD
         gsXk/JuCEWR7fJQwxN9CcmH6CG+gOZnIUGO2Tu2M4X7AzoUcj9SoaEYBKcsNWrtN7WTb
         V6iF9S+kLLFy9K6+QP2GSqsUssk9jagi/D3YRxnG+Ha72Rgfx7cZI/6mkgWX0Ed8tuPo
         mA6w==
X-Forwarded-Encrypted: i=1; AHgh+RrSdlYojFBJN6HFYmIrBruOKyLWnTJSgbbTy2i4XZO9web379jJky8qekeuGqfwvlKoY5mEkdQ+UzfScqiLWcVd@lists.infradead.org
X-Gm-Message-State: AFuF++kFct3478ope3dspLoE6FC8FZEVB7qGrNxAKgDa2q/t04E776Qf
	c1xSaoc7kh0gLlA0Z95V7mp9L2/A8PteJ+dWouMvDGmKOF+hfpvO4V/V
X-Gm-Gg: AR+sD10CWWVdpmk83SMnRA9fk+XKbBDW7UkT5WrkoS5baKlj4vSTIxUN3zGMweCoTmq
	isaqUbJbnWkNNci1Jm8+ESmQl+mujsN69kp6xbuiXyaVIR/hKY7Z4dEvE4T2BXMNGYpmGfNcMmW
	+YQFsgoeNVIs+KMcXbhKkhvlzpCByk0ChZ68GvgQqduvhdC03tXfVIrYpBMDzhasBQr/oOl5ht9
	//db8Jxmml2LGCMxARuloD8tU2vEVFaZgdrUnksTucXX10VmaYHYPg8vrur8p74fp/5FQIUEEqG
	vXeDut9iIrRAjlqSMhj9c2ta+luMQc+CZcC8LzMATLPFSF7UkPpMdCAPDAGV6yrJL5Ytu+O8uzi
	3PFgG3RCQvpqakGYEafGkA9CmLAJM9heXaGSsOXoSjQv8AN+0JP1Sfrx8kV+Y6lVVrxNAS2dpIJ
	7dptuIRc3+iVllv5Cff5K/W332ZqcwrzjbcjcbcdP/qrHtVMLFXFolcs8IfK0=
X-Received: by 2002:a05:6a00:2d82:b0:857:73e2:9106 with SMTP id d2e1a72fcca58-85773e29373mr34165922b3a.22.1788274915955;
        Tue, 01 Sep 2026 08:01:55 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc0716846sm27914b3a.45.2026.09.01.08.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:01:54 -0700 (PDT)
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
Subject: [PATCH net-next v3 00/10] net: pcs: add basic support for RK3568 XPCS
Date: Tue,  1 Sep 2026 23:01:00 +0800
Message-ID: <20260901150111.141037-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_080158_289298_A8E54421 
X-CRM114-Status: GOOD (  20.80  )
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
  Patch 8: wire up SGMII support in dwmac-rk
  Patch 10: update MAINTAINERS

Board enablement:
  Patch 9: enable SGMII LAN port on Photonicat board

Changelog
=========

Changes since v2:

Patch 4 (DT binding for Rockchip RK3568 XPCS)
- Made phys, phy-names, power-domains required properties
- Removed redundant descriptions
- Fixes reg ranges requirements for MII port

Patch 7 (net: pcs: xpcs: add Rockchip RK3568 platform glue driver)
- Removed `depends on PM || COMPILE_TEST` from Kconfig,
  ARCH_ROCKCHIP already selects PM.
- Added `default ARCH_ROCKCHIP` in Kconfig
- Added comment in xpcs_rk_serdes_phy_poweron() and xpcs_rk_remove()
- Added device_lock()/device_unlock() around platform_get_drvdata()
  in xpcs_rk_create() to prevent concurrent drvdata access
- Added error handling for device_link_add() failure
- Switched from SET_RUNTIME_PM_OPS to DEFINE_RUNTIME_DEV_PM_OPS
- Changed .pm from direct pointer to pm_ptr() for proper PM handling

Patch 9 (arm64: dts: rockchip: rk3568-photonicat)
- Changed PHY compatible from "ethernet-phy-id0000.011a" to
  "ethernet-phy-ieee802.3-c22" (generic C22 PHY)
- Removed eee-broken-* properties (unused properties)

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
Coia Prant (10):
  net: stmmac: move XPCS lifetime management to platform drivers
  dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel
    property
  phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
  dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  net: pcs: xpcs: add ANRESTART support for SGMII link recovery
  net: pcs: xpcs: add Rockchip RK3568 platform glue driver
  net: stmmac: dwmac-rk: add SGMII support for RK3568
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
  MAINTAINERS: add entry for Rockchip XPCS driver

 .../bindings/net/pcs/rockchip-dwxpcs.yaml     | 110 ++++
 .../phy/phy-rockchip-naneng-combphy.yaml      |  13 +
 MAINTAINERS                                   |   9 +
 .../boot/dts/rockchip/rk3568-photonicat.dts   |  74 ++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  45 ++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  44 +-
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      |   7 +-
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 121 +++-
 .../net/ethernet/stmicro/stmmac/dwmac-rzn1.c  |   7 +-
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |   7 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |  37 +-
 drivers/net/pcs/Kconfig                       |  23 +
 drivers/net/pcs/Makefile                      |   7 +-
 drivers/net/pcs/pcs-xpcs-rk.c                 | 561 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    |  16 +-
 .../rockchip/phy-rockchip-naneng-combphy.c    |   8 +
 include/linux/pcs/pcs-xpcs-rk.h               |  11 +
 18 files changed, 1033 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

-- 
2.47.3


