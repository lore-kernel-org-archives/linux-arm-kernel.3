Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9E8C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 14:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p2cmtp3VyguNZ1YwnWT1LsNqPKC7k3AOpkhFk6RHh98=; b=qN2CdY8XXGqITh8I2vGoftAbf2
	iuwLc0OnaOODoRnGe29YokN8li/M+q6jzzJ6keP9r0/gPBbgT8jHyVZs2QYTwrYxFNz/EkjdzDXzq
	tbqOV+FBVk9oR74+7KHRZyKLVZugi4App0+/GDTlRNV7J+e6U9/pstM0tCnORogNDE4KPAtmYNIh1
	Cb+BDqeZvTKugCME7X3IR8vNVDpPVxMd60I5Fkd1mM5HKwBnEtZVExXCHjDxIlwH5AHHCErmpk9TL
	KhqjP1s8Utkf3GTcOK5fthzxsnxyReRCaIRInXjUxXTF5DPrYePKRrTz4DYmrTYKfZJhpeFc5do/c
	f+OWO5FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqAcP-0000000EiIn-3WNC;
	Sat, 01 Aug 2026 14:23:17 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqAcN-0000000EiHT-23Hm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 14:23:17 +0000
Received: by mail-pj2-x00.google.com with SMTP id d9443c01a7336-2cc73acd2d0so515185ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594194; x=1786198994; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2cmtp3VyguNZ1YwnWT1LsNqPKC7k3AOpkhFk6RHh98=;
        b=hM9vpiTUmXX8ngq+jh84KwfcLkGT/Gr+c8Dg59+nkHo9mEjmchVXYjn3HJX5beTpxY
         FvndMCzAzI0SS9B7bhMPEudFkpcUPlqfOzNIxeIGQcjZjyEA4WY5kEEU4TxJRXUAxg4/
         IyXtUZYJdrVvSSAH3hdYWa8slaAv8xzcmWuMdOY9VNcpgZ97wjV1pjaQ9snRCPec4WJ8
         5/TWEb7poaBEkRnX3rUdsZ0dZhefTrZwiwWtbvEUsOPoGmXCGeyYmYrMxwpacnrf14lA
         8WUDJZA6fgOYiA4mxacfPFGm9S+f6QlEwjBstIq49l6NQZU4RNKfAOtbYPToVVlfdutN
         IdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594194; x=1786198994;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p2cmtp3VyguNZ1YwnWT1LsNqPKC7k3AOpkhFk6RHh98=;
        b=HXw9JTtQJ8Kwb/89Vjif039G5AxtF4c/7FMuFeGpGhSkfuHOiejNJneaOsC9tMeeJ2
         8LhW1oTEoosDzYtMPmoO6iywQlHZ1CG1Rm+ALeFRwhnhFaZd+Bdw7Wi/8NmvgjLh2eDY
         WiDnRAWAG72AR14YexzssQYa1UPXUPeeVQQRpYixxxu4pH504iW8xwvenf8y6xYJZ3+L
         o7Bjxor969TlCYJPE6LpYZTRwjMCfFosKbZ6M3ZeHAbBEU2r9Wew+LrFISu+oJmybqjl
         sSUo1+ILS9VgeFBXnybtyCaSnygk5YnvsJu1tfwpmHfYMGT/hq0ceKusYUnDjfrpyaQL
         OZQA==
X-Forwarded-Encrypted: i=1; AHgh+Rqf0YYvzDp4matnMjrkigw+c7BYkZrdtlVk8YkBP4wtCcLOqYxxt8hWOZx9mefzaJkIEsQ76MrP/iMiI7ioiV/e@lists.infradead.org
X-Gm-Message-State: AOJu0YxeWtC8cYiMAzCEy3oL8F97kQx+mcSh2LeXmMFw/5KZWUXj0sFr
	2opQ1tOdsLMaF7Ib48m1J5Lp8tkaoDoWXTWvGvkaPRkUS3NobLpQFZKo
X-Gm-Gg: AR+sD11xQ+kzo5srXcNp1dOKpzv91t8u2R096kGGMvGfS823pCfolxqRlbZ616arjhZ
	x60nzBn3TGIAEBCj/n8dynxFx5cy6DkMwDPvy9s0d1FP00ijx8GQEMuHKD+p8dS82554Uly8Qj8
	6NQmg0nqiRtTUjyZ0Mhw1zE9HjZ+XE/at8WUzGmDafs0/SP+h0crnYyqV4sRiAQtuthj4GEkEHj
	w/YDbNx66Je4WMi4Gh7JHYIqTn5x1Zm6bWPaqW4Ik4pw3CjzPKQ+vqkz4qH48lT3wc9rgIO48Nr
	FBAE3zShWfV2Owx+FVEeChYJku6ykBvMNPJgd77pv6BDYMqEE6w1IevdKP7LpY8cAsu5fUrzAz0
	q9yySsAJZcbcCekP2vhUBlh+l5FT3jr2udTnu5l1FONlD3Gef2oicGFMi8IjwIih0bgvCDmpZoz
	dthKnlB+XDFBCxkaUHUwjKA/byCYHLdtmx7i6xONpuFANnD7XEW57BMZ8=
X-Received: by 2002:a17:903:3905:b0:2cc:80d6:b72 with SMTP id d9443c01a7336-2d0536caf12mr31901555ad.20.1785594193454;
        Sat, 01 Aug 2026 07:23:13 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:23:11 -0700 (PDT)
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
Subject: [PATCH v2 00/10] net-next: add basic support for RK3568 XPCS
Date: Sat,  1 Aug 2026 22:22:24 +0800
Message-ID: <20260801142244.679437-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_072315_593937_A10DC37A 
X-CRM114-Status: GOOD (  25.61  )
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

Changes since v1:

Patch 2 (dt-bindings: phy: naneng-combphy)
- Changed `rockchip,sgmii-mac-sel` default from 0 to 1 to match
  hardware reset value (GMAC1)
- Added `if-then` conditional in `allOf` to restrict the property
  to `rockchip,rk3568-naneng-combphy` only
- Updated commit message to reflect hardware default

Patch 3 (phy: rockchip: naneng-combphy)
- Changed `priv->sgmii_mac_sel` initial value from 0 to 1 to match
  hardware default
- Updated commit message to align with binding changes

Patch 4 (dt-bindings: net: pcs: rockchip-dwxpcs)
- Fixed `reg` format in example to pass `dt_binding_check`
- Added missing `#include <dt-bindings/phy/phy.h>` in example

Patch 5 (arm64: dts: rockchip: rk3568)
- Clarified commit message: "all nodes disabled" refers to XPCS
  device nodes, not fixed-clock nodes
- Noted that `assigned-clock-parents` are applied at board level
  (Patch 9), not in SoC dtsi

Patch 6 (net: pcs: xpcs: add ANRESTART support for SGMII link recovery)
- Split the original RFC patch into two: the SGMII state reading fix was
  sent separately to the net tree and has been merged. This patch now
  only adds the ANRESTART functionality as a new feature for net-next.
- Removed unintentional `BMCR_ANRESTART` change in c37_1000basex
  (this was not tested and should not have been included)
- Kept SGMII path changes for RK3568 only

Patch 7 (net: pcs: xpcs: add Rockchip RK3568 platform glue driver)
- Added `.remove` callback with `pm_runtime_force_suspend()` to fix
  potential CSR clock leak on device removal
- Added compatible string validation in `xpcs_rk_create()` before
  dereferencing drvdata (using `of_match_node(xpcs_rk_of_ids, pcs_np)`)
- Removed `__maybe_unused` from PM runtime callbacks
- Add `depends on PM` in Kconfig to ensure `CONFIG_PM` is enabled for 
  this driver

Patch 8 (net: stmmac: dwmac-rk)
- Moved `gmac_clk_enable()` call before SGMII check to ensure clocks are
  enabled before register access in SGMII mode
- Added unified error handling (`clk_disable` label) for all failure paths
- Added error handling for default (unhandled interface) case

===

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
- Fixing the XPCS driver's SGMII AN state handling
- Refactoring stmmac PCS lifetime management to allow platform drivers
  full control over PCS creation/destruction
- Adding a Rockchip XPCS platform glue driver and wiring it up in
  dwmac-rk

Series overview
===============

Generic:
  Patch 1: move XPCS lifetime management to platform drivers
           (introduces pcs_init/pcs_exit callbacks)

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
None. All patches apply cleanly on top of torvalds master tree (v7.2).

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
  dt-bindings: net: pcs: add rockchip,rk3568-xpcs binding
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  net: pcs: xpcs: add ANRESTART support for SGMII link recovery
  net: pcs: xpcs: add Rockchip RK3568 platform glue driver
  net: stmmac: dwmac-rk: add SGMII support for RK3568
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
  MAINTAINERS: add entry for Rockchip XPCS driver

 .../bindings/net/pcs/rockchip-dwxpcs.yaml     | 127 +++++
 .../phy/phy-rockchip-naneng-combphy.yaml      |  13 +
 MAINTAINERS                                   |   9 +
 .../boot/dts/rockchip/rk3568-photonicat.dts   |  77 ++-
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
 drivers/net/pcs/pcs-xpcs-rk.c                 | 538 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    |  17 +-
 .../rockchip/phy-rockchip-naneng-combphy.c    |   8 +
 include/linux/pcs/pcs-xpcs-rk.h               |  11 +
 18 files changed, 1030 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

-- 
2.47.3


