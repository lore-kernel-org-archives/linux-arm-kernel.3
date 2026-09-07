Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4010AC79FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hq1rNKVGmliGTWsiFEwtrdEOPueQghmo9INX52ut/jY=; b=IQh9R7gTKv2aq/+L100RfTHXCY
	36XUa6jb9PlqNk+wHSeaHBoTuwH7SqNetvuc8aDtB/CYaSgWh+gd0xZkvUaZLRdII9SeV2shSoYsW
	QvL0maAswQwgEvRjr86lwjq8TRiQroXYxXHKN9eoAMDrouzPJ805MLv9HBnFQwhttrA4nVlywPtab
	lPf7AUI8m0WcZ29i4BZot8V4VPYyj763D+VyxNAjN/HeA3531kJ775Qga7X/7Kr6ckAB9FVBxy44A
	Gax3CJWa18pWY/H8JGlhi81YpcCVE/XvCQPyO0PvjdwVuisRPy1dW3j9fqyT9cDZydSdeFNUwyLvP
	PSyPNqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bQf-00000007Bt8-1km1;
	Mon, 07 Sep 2026 15:38:41 +0000
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bQb-00000007BrZ-09VP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:38:40 +0000
Received: by mail-pj2-x05.google.com with SMTP id d9443c01a7336-2d6f230d1easo852765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795516; x=1789400316; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hq1rNKVGmliGTWsiFEwtrdEOPueQghmo9INX52ut/jY=;
        b=HJ+8fflLaC1x+ciQh8aqqY45GdL3iwbnmW0iwWuRKruC9/Pkl+u+DGGBd2qPLbwpZ9
         U7+2mKjlwCte0GrUopsyVrRZoYMc7Bq9+qaMVK4J7HgISzNob+/sbsFLzGSMj8B0s9UJ
         ZMuwjqD/d3hOE3fQHURFz88rddPBceiqC2b3mp5JjK/Tvvyju7mrbCJssQk9JuCclM8K
         qqE4AT2lSSrRXNSd5L3V+ZF3WZy8COsOJdRJuSboP+QraATt0hcUMouBLMtuO2Jc0iX6
         qDlKWbYz6CREqL+xWjNizHPeDiPy6OaY2Mr1zQzMqmCyy0w3z1PTw3J8Gn7mYs1/gvWK
         qYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795516; x=1789400316;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hq1rNKVGmliGTWsiFEwtrdEOPueQghmo9INX52ut/jY=;
        b=gxceZSXtLDV563gYtnQITiRBMBnFUtKVwcdzGZ5EQ1iBH8DVBxyXWw6VbIRDVF9YqU
         0EYjEfh8G8XHUvqIjm59862BNL/gzKLgZvLiu61mhhkHZAV+N3gAO+o4bCjrYfppa1Vd
         YnBvj469dP2MNdHL5HsCPgQqNYhKfEqZlbk8BOYWe3Cvi2iVnTYLJtaAoLHZB9Px01fL
         A26mtp5y6cE/2W4nPwT7jZv9/NdMe17veNeVmpz65LemEXyF+GMkEcE0o/6SLokUxX1D
         8LmN5arttFuXjX7xQ1cqsQs1I8N3qfXrU7S1OE6Tu/S0jY8E8Ulu3wAyRX7wwTstsM2J
         hg4w==
X-Forwarded-Encrypted: i=1; AKwUvBwPXvc0h9DjaqmXBFbVoB4REsUQsyz9cqF7by9C1TkkbPOXMQjHp7F1kf39EkB5VnXRwEKyknnwE2p0wjwE7+/0@lists.infradead.org
X-Gm-Message-State: AFuF++mNS4BnSIgiDNEsEfQWSd/tKpg4ivJq+0ekbTIuIoeh9b9/wuKU
	ZhAPAXmTygDoMBQvKFsGHW1/YyTlQGXGTHZA9r5kt4+hhut2kOrFDa8S
X-Gm-Gg: AYBFou2tPiJpkYIZ2/Hx+RXHmtRzK1KQYm0ejs0wo/vVIoVa8SfAA6QBEbYjyQ+Eq0u
	kRK17klB5kZYiq0LnV5r5sNxi8OvX2xwcvwntK4eYhhoyEo4vGuQoI/hIDDUhrMVOt6+52FJi7W
	UhxMkROlz/SK9cFI1NsiICAkblhAuerHaInXyHNINuCGNqNlSxPf8Pmyo4WQXz3afM8WUnpwMhz
	JqDbj9+I//pEz+GFagWsr+t+bGRXv2adKy46axSObRwtMUyAN1KznBHhhOUyeDUTcQJ69s07eBw
	SdPc+VTEbOJeAcF5E4Z9N+itkfNn0SZfTTLCHvoIMbgdjheCwJrgqhtUn7dNYJmzRwBagvgY2iP
	A9ia+UuPuCRLU2gHFquy6Y7KYFPTPnQKgurPO8g3G18Oi8mfUUZABbLjWGgVl+jVbXGxOdWRRom
	evdzGkHBnYeWgA3t8fa9vl/7wlckm0ZMd3Ok/LMeA9HiGIC7qJJ64TYU5kZPA=
X-Received: by 2002:a17:90b:5110:b0:390:84db:888e with SMTP id 98e67ed59e1d1-39b8bd4aef3mr1404027a91.7.1788795516238;
        Mon, 07 Sep 2026 08:38:36 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:38:35 -0700 (PDT)
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
Subject: [PATCH net-next v4 00/10] net: pcs: add basic support for RK3568 XPCS
Date: Mon,  7 Sep 2026 23:37:03 +0800
Message-ID: <20260907153713.2572547-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_083837_079574_19C15102 
X-CRM114-Status: GOOD (  20.05  )
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

Changes since v3:

Patch 7 (net: pcs: xpcs: add Rockchip RK3568 platform glue driver)
- Reverted Makefile change to keep pcs_xpcs as a composite module
- Switched from manual `devm_pm_runtime_enable()` to `pm_runtime_enable()`
  and use `pm_runtime_force_suspend()` in `xpcs_rk_exit_clk()`
- Removed `xpcs_rk_remove()` callback entirely; cleanup is now fully
  managed by devres via `xpcs_rk_exit_clk()`.

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
 drivers/net/pcs/Makefile                      |   5 +-
 drivers/net/pcs/pcs-xpcs-rk.c                 | 543 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    |  16 +-
 .../rockchip/phy-rockchip-naneng-combphy.c    |   8 +
 include/linux/pcs/pcs-xpcs-rk.h               |  11 +
 18 files changed, 1015 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

-- 
2.47.3


