Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0441C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 20:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tLf44y0wjXekRKRabcqObNjHMHH8+Vthi1ry2XuMnz0=; b=LatfQlORT38hCAK4vFPd6buxyl
	tErs5udP8rocOQJQQxUM7kzRqU3U0Db6oVJfyJM0HYcmnlvZ0nzZiHXlQ8ATy+djFgVVWdtSM52oi
	N1W4Zs+FhFhfat5UwLW6CP/QF6RFq+edWK20RgVZWFPpBJGjP3NG0/jgWQrF49Pth4Qab+2IAhS57
	6nxNRi2PcchO47h30Ap/IUct5RjkZXav+PyyZLsVk/9YPwcjfu1bBPj2/GdwVTnZSDQJLnvS2h/WW
	1bCWyQNRPjtY/qYZVJiTouegKlBL8YZ8gnVuL6Oi4QKq+huJiGCqCkhFTzb7uUoJlRRm4aGP0glRw
	laxpnNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96iW-00000006TfR-2wOD;
	Tue, 22 Sep 2026 20:03:52 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96iT-00000006Te5-1iE3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 20:03:50 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2cb3f5bb19aso497685ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 13:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107428; x=1790712228; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLf44y0wjXekRKRabcqObNjHMHH8+Vthi1ry2XuMnz0=;
        b=kPDhM2+8VkO1MCfxQlrh3IyQCW0O9lrk/r3wA6amjsHkt+Tf8D+1hGtEM+nsG7m6zw
         hTmlyf80NicPBavNp2JZw/PqowZ77vNt74DMb6R/z6tmulCmvwE8LmXG6GU5B3Ecbs32
         q4hjVJWFX+4ZkfwVr3FoQwH+VHPmC64uO9TL+kf5W1JwFMx7pyq3c0Z9F7gtc2+FAvLc
         393DHADG2+fKZdUYq8W2fosu7UpetfiBzUtM6kCQnkE7nQYsaBRXXjS97B1A9PIBZzQs
         JSp9ML3jOKkfvfkalM9jE+qjFdbN0Hc64ce0pa4rgjnHF3pXsPkRNU7uz8HK8Ga52kos
         6EVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107428; x=1790712228;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLf44y0wjXekRKRabcqObNjHMHH8+Vthi1ry2XuMnz0=;
        b=JidVGev+QcTILMs2dYXD3Wx6GrXv2f97Xtq53GEkbmbVnpaKMmMMPWWUDwJmvD+GD+
         JCt9EMHTjoNd9PiTG1sYlTUdLnH6ORQCTeaiRptUqcnWRdY3sD2FHko2a22FFQMKUft8
         0DyGcwduoTnZwGIaDv0jAJeDb8zxI83140NzOtAx8+nroYBJ/l09QrS/B/Wg7QFgmwap
         bZ5L6nXTH8O18gd/H3vrodVtNeR0MblLdt+iRMqHjYiushHN87nmD8slQGrHRUDBXCBx
         4JpH2oKbU+MzQIl9GlZRn22PgZxIzQp0Fo68d/Rj4uHCBCipmGRtITmejh58R3O6+qZi
         cSYQ==
X-Forwarded-Encrypted: i=1; AKwUvByysARZg9YIEC1L5KSaLLfaAjk6EBMpvqjYN1T3NP9jWYVA6Eiav7f4wyhToH3XzbIua3qdF4AQCwMhsUiOVkxz@lists.infradead.org
X-Gm-Message-State: AFuF++mZSL5fYwyKZEhH1lwQ9NkcQPrAO4dJU89qw8tQVb7WPX4NKvqs
	hgkoYDgsq+tUfiYsOvU9MsJYKbRGauUwn3ReL2069P0W00vMfKCutaWs
X-Gm-Gg: AYBFou1g4KC7dyPl6Fsvz21DPKrf5KoQq1hHyD7yKdNeVSJxyS+B3T3RTxhCnaPSEFe
	3xhcwTdpF7N8sH4/lMnnV9RTaS3Mw35j5EMYGNUqgMtXC9CSVmT8JeEjjYyjUfOv94KYlEhP9P1
	OZJJbBr3Iqm7TunPpdD6H1f5n5M9I7JZfx18P1b9vjhyMnKC7zmJUdknUVGxPUShC1iJ3i8urJs
	xVD8QHRTJ5qMtxPlJG6onXEvlMFl10x1RbA8hxQSQCWg7qZw3Gz2Ed3hyZaxCaCzSNI1ZCS1Nxz
	BOMY34XW8V+IqWUiWvj42mvm0RwLctqYNWz0PW5uvVMpr6TUrrBQ23f3n5BrYsmJ6leDqkUqOXI
	fDoebBPtIYmB/esuIwxkzmPU5MOCCYh490pkFh6kAtsAdxLWqgVS0PJDYkSNUcWl2SPZ7tp67W3
	IfTVpQY4a3hFJ1ZlodGKy1KTBnc0qZhTGQlLn06r2ZTdu22b3kn5A9pUfT58aw+bY2+JEM2Zu8s
	RgBPWu4d4ArK0Xeag==
X-Received: by 2002:a17:902:fc4c:b0:2dd:c053:e0f7 with SMTP id d9443c01a7336-2df69ddf21cmr4274665ad.38.1790107427896;
        Tue, 22 Sep 2026 13:03:47 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:03:47 -0700 (PDT)
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v10 00/11] net: pcs: add basic support for RK3568 XPCS
Date: Wed, 23 Sep 2026 04:03:24 +0800
Message-ID: <20260922200336.2201212-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_130349_459770_96470501 
X-CRM114-Status: GOOD (  21.91  )
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

Changes since v9:

Patch 5 (arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes)
- Move the two fixed-clock nodes (clk_gmac0_xpcs_mii and
  clk_gmac1_xpcs_mii) from between the XPCS node and pipe_phy_grf0 to
  the top of the root node, alongside the other non-reg nodes, and
  sort them alphabetically. This addresses a DT coding style violation
  reported by the Sashiko AI review. No functional change.

Patch 7 (net: pcs: xpcs: add Rockchip RK3568 platform glue driver)
- Add system suspend/resume callbacks and switch from
  DEFINE_RUNTIME_DEV_PM_OPS to _DEFINE_DEV_PM_OPS so that system
  suspend and runtime suspend can use different callbacks.
- Mark the XPCS as part of the wakeup path in system suspend via
  device_set_wakeup_path(). PD_PIPE is shared with SATA and PCIe;
  without this, genpd would power the domain down once every consumer
  is suspended, killing the SerDes and breaking MAC WoL. Runtime PM
  behaviour is unchanged: the runtime callbacks only gate the CSR
  clock, and dev_pm_genpd_rpm_always_on() already keeps PD_PIPE on at
  runtime.
- Clarify the comment above the power domain access: the XPCS lives in
  PD_PIPE, and the domain must be powered before any register access.

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
 drivers/net/pcs/pcs-xpcs-rk.c                 | 619 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    |  35 +-
 .../rockchip/phy-rockchip-naneng-combphy.c    |   8 +
 include/linux/pcs/pcs-xpcs-rk.h               |  11 +
 19 files changed, 1135 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

-- 
2.47.3


