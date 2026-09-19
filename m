Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BE8C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WeS5LqLOuIKT4KDWIZgKWwOtuHWnT7hUVImYY975124=; b=jWm63bXVvrGvVlBUf79WxMaHRp
	I/62Vel+emMh6x3jSvo1DhmCgGWB6zyiOYxsYg8e4svCckbqe5d5K4ANFgwa3VLUGIUlekQy8zz2o
	Nho/Z2Z4W8PnVL2H6lNy62ouU8F4muZlP8o3q47YF0PhZVdkrMqpTDVFuA2a61riZeXbInC8Qwurj
	VOx3D15gVzwFj3yRVLLEF9A/4O6YMNVNuOF3/LqJsXQFZQd+6XBmLD7m86VMaYxZoIfoxdkzGStDf
	D5qzy7ZBwfDGWln+IriCmun1VwCDe3AgHO5fFpI7KOvDV5n8c6flAR9MY/kmjKCAWWBI1VGx6U4u6
	ZRN6VtAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uXm-0000000GGi5-0na5;
	Sat, 19 Sep 2026 12:51:50 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uXi-0000000GGgr-3IXF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:51:49 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-39e0e245eadso664727a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822306; x=1790427106; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WeS5LqLOuIKT4KDWIZgKWwOtuHWnT7hUVImYY975124=;
        b=KFvrLO5xWDR4t0aZ9sjKOm7Ty6wzMJl/Sjns9rTdYdgsGzi7aiAGULtYxkehQ2264V
         m0DLpExfjf426jdNEiM+xyETvgpWYa7qCt2RFaDxc7OFnI75SbkH8tbQmhprwp4q3B5X
         CTgHRCNIBBKmSlNuxipAseMufuLuPpZ62EFeT3ctZaGiJRbFfcnNKUSQpfGBni9Nn796
         bm9pHY4gI4v9WuyKf9i3Hngn0y7BdkJHH2oPEe20Ls0KQtNHTJXDcm/2Xm572zpjp4Py
         aBwKDQe/248RBFoPpPtCKhDxgsNZN0dtow7P1WZiuGtEElebLKZ8CgO4XSRcA9qD55Oi
         n0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822306; x=1790427106;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WeS5LqLOuIKT4KDWIZgKWwOtuHWnT7hUVImYY975124=;
        b=Vm44n4VFdxjTqRzWdlVL+60gFodyWGcFAuJcanX3qGxMzCTdb8548VKGL5PpZeZhWq
         eICnDy0gM+9o+LMD0H6sWZ3oA881YAorDt1sYvAijDrbP+5WlI0ED07fBZ0d4U3sLJ/2
         DU38fd31qno6+2LA+qJ0dpOo1rbxUVEt4nFXTPKvK++dBjpCMtJQm3bV1uiLzCSWcc38
         3YT2QFotfIUur4dc93YiS1y7b4RrN9WSizpH53Qu+IoockMCPKtTQwv+JA5F66rzFe+5
         LWOWMPXvfaJlqHezWCVmLKuknbw+RQAzITp/FtJNGpVgd1KwiBwOS8I5dlfby0eL7jru
         FFFw==
X-Forwarded-Encrypted: i=1; AKwUvBwouCFppYr5jej6cvadmGGNCOyq1GmwwV9TaQM82eQy/H09YZMIWj7/Cb+a/mLBl/31M/Ajn8H2B5EnwV2Ti38T@lists.infradead.org
X-Gm-Message-State: AFuF++mvQypNIwvlD5SUr9zXFl0vL3YbGbVafF9bAKehl4TrTCRE/zBQ
	IYY/Tb+IZFeY36qARWDSeAc4r3JjmdoWjAR0/TpZvayLxsZgxaTZ8G0z
X-Gm-Gg: AYBFou1teXHwpO2TywMa5YcUdo6TIMiBvw3ac+lGotAmAHpXipDKftKCmU2xbMNuK7z
	EfP7gwGJaE/iV3dA095lu6+hDrgiSu8rSc86B0R43HkFOQQE43aBptE7SxOGdPQTM5922kbbAvA
	KPk6jdVm/zDdxOqqQcQ32VS1wxCeYMZ2Fvwzl1bFown0muuqbyp81OuYmuacDsWI5Jnm1TXt2RZ
	UWUo4PQLrxnCVB7Z1ZwbaMT/RLJGiHKe10hCLImia/CbSV3XFW9jXuMDU6OTgeo/oskri9zx6vf
	p0W460N4wCfRUZ6w3vCsAKuW/vKCItL+q1EO+BAQtR4KxYbIL2x7Lwt8MAxxRKCTAVcxGu4A95t
	bjK7c4Bv/d8VAhxXwGqIch1z0oXP0xCaDSobXNu2gEC1cEJJrab7J8OpEo6BWozBLUBMRSBXmW3
	YIQ1uYLzpFgNWu1AdcZF0BkZivJrjN3jcQjzVHRa/GPIO/LWM5QfcLk13XIG6hPa91E94x0w==
X-Received: by 2002:a05:6a00:4309:b0:874:708d:b636 with SMTP id d2e1a72fcca58-874df60bf54mr9495073b3a.34.1789822305666;
        Sat, 19 Sep 2026 05:51:45 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:51:44 -0700 (PDT)
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
Subject: [PATCH net-next v8 00/11] net: pcs: add basic support for RK3568 XPCS
Date: Sat, 19 Sep 2026 20:51:07 +0800
Message-ID: <20260919125119.2107089-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_055146_836262_11BE44CA 
X-CRM114-Status: GOOD (  23.11  )
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

Changes since v7:

Patch 7 (net: pcs: xpcs: add Rockchip RK3568 platform glue driver)
- Fix a use-after-free window in xpcs_rk_create(): device_link_add()
  does not fail on a supplier that is unbinding (it creates the link in
  DL_STATE_SUPPLIER_UNBIND), so the drvdata could be freed between the
  link creation and the platform_get_drvdata() call. Read the drvdata
  under the supplier's device_lock with a device_is_bound() check, so
  a concurrent unbind is detected and the probe defers.
- Correct the comment above device_link_add(): the link does not keep
  the supplier alive by itself; device_lock() plus device_is_bound() is
  what protects the drvdata read.
- Change the Kconfig select to "select PM_GENERIC_DOMAINS if PM" so a
  COMPILE_TEST build with CONFIG_PM=n does not force PM_GENERIC_DOMAINS
  on against its own dependency.

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
 .../bindings/net/rockchip-dwmac.yaml          |  18 +
 .../phy/phy-rockchip-naneng-combphy.yaml      |  13 +
 MAINTAINERS                                   |   9 +
 .../boot/dts/rockchip/rk3568-photonicat.dts   |  74 ++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  45 ++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  44 +-
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      |   7 +-
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 130 +++-
 .../net/ethernet/stmicro/stmmac/dwmac-rzn1.c  |   7 +-
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |   7 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |  39 +-
 drivers/net/pcs/Kconfig                       |  25 +
 drivers/net/pcs/Makefile                      |   5 +-
 drivers/net/pcs/pcs-xpcs-rk.c                 | 599 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    |  35 +-
 .../rockchip/phy-rockchip-naneng-combphy.c    |   8 +
 include/linux/pcs/pcs-xpcs-rk.h               |  11 +
 19 files changed, 1115 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

-- 
2.47.3


