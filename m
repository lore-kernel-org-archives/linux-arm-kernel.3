Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219F6C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXqazLDcNN+nNV7C/3qAYrA4z9CX2iKq+iwX27rl4Qk=; b=FRdwHV8Dw4EVtVBkeemG17rYIJ
	foQxN16OZ0bDq/1e69evILkxuzLVOVdab+9BYVYShHF0xByWMMeiMkqAEQVk3tFsVaQxeIWkHU4X7
	FXtaG3P+jYvARCIv3/TmgCpLrET8WrPiXjTB+GtabxupjarFsNOLxiLlzK++ZTkuTDHf2sloYHvnV
	guY9dyjZYOkiuMP8cSpYfZeRKdSrpdq/o8DXsBfu24f6YLpLzj3/aXhEgb5ptIakWuGcKfQ+7mcv8
	xo/yVuuT6uD9zpCZrk3JtMziHqJp6VxwPais3LdMC1miDlKKuIybJdZLBm1DzIkmXgtlKg9xN+j7p
	UakDn/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQf-00000006Wbm-1Iw7;
	Tue, 15 Sep 2026 12:38:29 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQb-00000006WZL-3SoI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:38:27 +0000
Received: by mail-pj2-x0a.google.com with SMTP id 98e67ed59e1d1-39e00a5b8e7so452795a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475905; x=1790080705; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXqazLDcNN+nNV7C/3qAYrA4z9CX2iKq+iwX27rl4Qk=;
        b=W038rP5OGY0NwBjSgGYxVbMo41/sRtfSwt/dI+7LoMq8WW6+oqx1dkaTlGMRpdclmZ
         OQhMStpfwvYx0Gw+PDyU7/mm85x0rSnSGBL5Kva9O8G+CXTyUHIziJHR0iASY/8SQoW3
         Od3+sc+BvW6lxNmwBecCOjak/b3opTNGLD0NLJHr7eOsksrTRgCTrgW84NltrO7LQHve
         ZLINfTeC+209L7ZkarU7FmMUX8P+oxGE9bDxLbEjcmMGqV6RwuHsckMun+EbvjpUzKDX
         N68x+o493rMKlNnX12KxuhNGzqgbMS8Mb/9LiclZM12SxMZpBtLz5KXFrt4d5ioN7vY4
         iOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475905; x=1790080705;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SXqazLDcNN+nNV7C/3qAYrA4z9CX2iKq+iwX27rl4Qk=;
        b=uUPs2iY2wExAKgVAPHWtwgCNkc8mfsumjsuamci3xvFQ19I8dn2a+aDgg3jndOYdtU
         PBFIx7WcZHKiPYT7R4cXlpwgoFPO4VSC21r0/qIHc0rR8RxxlgE2r/vhaOKX0IydsusG
         SIqVlgx8kH47kOjjcMoPi9lF4rl98XbmC2SfM+ekSVeoU/byq7DuCsTZHWUu7UaogntH
         dCmtpNj4+DddOo6qjjIEcnlpGOBTmjqNBt499dDX0x2JF1g1Po4tbjKmfVGa5Q5oIIlr
         W3xYOpmfJq9+OplVg77GUrHcJolrEZfrZ9gkxgxU9sgoSQWiTPgD2QoVqrZwxcWxMqlp
         pYXA==
X-Forwarded-Encrypted: i=1; AKwUvBxtv1JxzuVB5SCCZfFh83Fw6FZyRM6hDb/Oetlz2aqLhbtEZCjzqyyHyFVngegPYpml4QHU7QHFRCd6DcbZflgs@lists.infradead.org
X-Gm-Message-State: AFuF++nOdg8+oj9fz+8v3I0HdBllJaD4G+eI/XwsDMT3WXVwZbbgvEUV
	bH+rv1tmcYZtRs8YNzWRMULQRMnYyt7yhh34TOSiOea/qPzIKSh2ALIj
X-Gm-Gg: AYBFou0/w0hjZh+scp7STeCI2JQ5MT9kiJE0EIBlyd0kcOOi/A1nfaGRoC5IkXZ45aw
	n5vYz861xWzDT6tygMqaUy5XGcOXk7eyzqblaOtd+SIUsYUxfnqHcTL9H+xeAry7YhMaBYwZSbX
	egbsC1gLCW+1bkiszN3Seo4aQDXeY6NPh5nlK9RtYCp0StPploNJqhy08XsQNut4ftAXib7Fvnc
	yEljLX+n6GmzyspmhZQDsDkqP0xPM1D2vzY22vxDYulHuVY4p4Q0KGrUOA5ln5B4/2ObKec+J4z
	TBD3TAU3KftpJTKXyRXDH5m9Y4vaNAj6Hapz1k2lj6IirJ54Tvsk77AQyIcGFY6TmmAA2dVYwMB
	Fc6g+zPeiMiCr+iK9IOTDr38qkEupU8IjWpOKkEemkCkaIGISWoLHmzPuhtZYjkJUAsSxjL/59I
	2c8rx/KbyBQRWbsJgn7MRKSdCheMfX5x7isHCYKqPGKof6iM8Hhvbi+CTVZMxw+p7fDGJN7g==
X-Received: by 2002:a17:90b:582b:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39dec0aac20mr14226976a91.19.1789475904683;
        Tue, 15 Sep 2026 05:38:24 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:23 -0700 (PDT)
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
Subject: [PATCH net-next v6 00/11] net: pcs: add basic support for RK3568 XPCS
Date: Tue, 15 Sep 2026 20:37:49 +0800
Message-ID: <20260915123802.1561724-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_053825_879379_A5D30343 
X-CRM114-Status: GOOD (  24.29  )
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

Changes since v5:

Patch 6 (net: pcs: xpcs: add ANRESTART support)
- Document the DW_VR_MII_AN_INTR_STS clear and the return value change
  in xpcs_config_aneg_c37_sgmii()

Patch 7 (net: pcs: xpcs: add Rockchip RK3568 platform glue driver)
- Fix eee_mult_fact overflow on 32-bit builds: use a 64-bit intermediate
  and clamp the result to the 4-bit DW_VR_MII_EEE_MULT_FACT_100NS field
- Drop the nested device_lock() in xpcs_rk_create() and establish the
  device link before reading the supplier's drvdata, to avoid lockdep
  recursive-locking warnings. The link is removed explicitly on failure
  paths, since DL_FLAG_AUTOREMOVE_CONSUMER only removes it when the
  consumer device is released.
- Select GENERIC_PHY and PM_GENERIC_DOMAINS from PCS_XPCS_ROCKCHIP
  instead of depending on them, so DWMAC_ROCKCHIP can select it without
  unmet-dependency warnings
- Document why the EEE multiplier is derived at runtime rather than
  hardcoded (the clock is muxed between 200 MHz and 125 MHz and can be
  changed by the board), and the MII write remapping in
  xpcs_rk_mdio_write_remapping()
- Add TRM reference for CRU_CLKSEL_CON29

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
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 133 +++-
 .../net/ethernet/stmicro/stmmac/dwmac-rzn1.c  |   7 +-
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |   7 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |  39 +-
 drivers/net/pcs/Kconfig                       |  25 +
 drivers/net/pcs/Makefile                      |   5 +-
 drivers/net/pcs/pcs-xpcs-rk.c                 | 573 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    |  35 +-
 .../rockchip/phy-rockchip-naneng-combphy.c    |   8 +
 include/linux/pcs/pcs-xpcs-rk.h               |  11 +
 19 files changed, 1089 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

-- 
2.47.3


