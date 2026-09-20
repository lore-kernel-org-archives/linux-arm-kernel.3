Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F62BC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 17:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zvaA1R/5NGHCUWO468vfak0l7lZ8RN7fNc21wJSy80Q=; b=ilwXVeEN722PMQuMUo2Jlno5rb
	88o0Z2GZkF4mYdv5UsWQzKTFfBQkrmNZHbpS73yJLWu7cypIjCBJlvCxffxUvoS6mblzOZXEcNVIx
	BxUwRPvo6WXbMjPUNsli+bwL0IaOXWw0/3VIL/sCOMUd7pvKuv5BQFj+N69TR4Mwh6RMGcoiy58Ww
	ZS7EcXeGXZDJbRUt8jV3V7WhHAXATYLr1zWRpwRGcOpfy+uBYPDyO3Algsa0pEaijBNasjH6WsQGm
	ruKUil5MNVPMXYHRNvRWfeaRL5MvZ/a6i+xYgyKS5sNXikSggbxdhifqjlTJsv04rFDBy5DPRHX8B
	yeyiDdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Kvb-000000008dp-1Cuz;
	Sun, 20 Sep 2026 17:02:11 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8KvW-000000008ce-3eWS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 17:02:09 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so1274013a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923725; x=1790528525; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvaA1R/5NGHCUWO468vfak0l7lZ8RN7fNc21wJSy80Q=;
        b=sQRhlZ8OWSsRlFRmjowlFsC4L1ZmEdpERRztarx4GOkWZknfPFjsJngHKLAQCDZmSm
         5aiCxubMRLOtacOdovFLP8Qq6JQF0XOc2nRbu8SbQdDRKPlsC751uvqQQb5WoZXrSbLg
         ljEHnqYAyyGg90gz9OmIylHAnSkQqPBQFP9KbW38+OPkddeYdK7a+WyUriIeV20G32af
         GmcugYTapsXKztHGvNEVuG/8CHokjWBASzhr674m1h9OlxTVGsY+JS3WxThdSOxiKng5
         zjkveUgujTjW5PNsRxNhDor/DZjmmXuY8I0rCxus3oLQ49fGWNASsTVuOWtU6z8OItzd
         IYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923725; x=1790528525;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zvaA1R/5NGHCUWO468vfak0l7lZ8RN7fNc21wJSy80Q=;
        b=mvJ0xtZHO+9O3vefJx5iQkP8T36TWZd+43/kU/E4mxOopecTXKGIgfX4Qd+wohYZY/
         AEA2nmgGq6w6AwhaB6KIPsIReaFXtpr30l9GFPIRwdlm6jnFp/UM4TbCZWK8QmO4X/H7
         8Vj9M5pO86aDUH4Pjjj5P7KVcYBy7Dr224F/FqfSURNfm24/5utRt8BPX5VmdxR6U57D
         Cx0JWpG+LP0ra5Ccs7yBwSTCmVVq0joa5LJwechgAoOASAb802rQpx+Z6g4twVP+2ZAI
         5OL4N5serK1VFLdnSORuX2wKiXmBGuVWCdmh5CsVx35SWii+ayHOn9H4VoGmBEsCyrA3
         LauA==
X-Forwarded-Encrypted: i=1; AKwUvBzMTregher34u2g2B7WUZS3zMyuyPk5iY/64oKBMu3UVx0RolXwdLR8F4nwEh80XocnRxcfQCAcLc9ylH8OQdXr@lists.infradead.org
X-Gm-Message-State: AFuF++mNb+WPoqIj8qcdxv/yqa7vhhmEDWU1SmRuKbZ8ISyn8lzf1T4C
	rttAm+E1pKOy61vXCdRPxclNAAs+tFLzsp0WG19qbjvr4ijF1/OYepR/
X-Gm-Gg: AYBFou2Z/hprWm+dbBrg6nadFRIzRuk4BdBd61J/+fCSZS2NY+R2P+IZ8te6aKI2q3v
	MBEXgFBYsOUCxIHxhWAu8afBl09IYHh+sV8MqwDQcyT4ZHKDgaAquc8S3/Iaxl4b5zm4pPeLjDD
	HV64G/ZpsDDSajILn5AJnb86cCfHJZWOFQjmlRA+/hHooXf61WjgUpCo05QNU9Kj8mqrJdylqHV
	wp14tBZzaMah4Ef3cuG3nErSl97HT3IT3FkdPOMyFEQM7OwWKz5zeOnD6yzPG7bVJHTJM0G5Tl/
	muUt7pnfBeOSHUmFB6oAq6zr8D45EWcRxxBWqIzbr9mQnlr0/NgjufUmFbwR12NYwEJFeRkXDDU
	hPOpISGNyRZJoHDhjGLdtNDlyHlxzp2ss/m84BD7mnf7nlRfTcfseul57YBNMoRvpNwf7gVgTdK
	1WbMbTbyO9giWbvMLWNHE2enmBtlg2J0xYkj45WST1ewTTi8OXUBLPtOFAb2Pfm5VPgsZQdg==
X-Received: by 2002:a05:6a00:3a18:b0:871:41fa:d1c9 with SMTP id d2e1a72fcca58-874ddffca64mr11441916b3a.25.1789923725129;
        Sun, 20 Sep 2026 10:02:05 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9d07425sm2140646b3a.42.2026.09.20.10.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:02:03 -0700 (PDT)
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
Subject: [PATCH net-next v9 00/11] net: pcs: add basic support for RK3568 XPCS
Date: Mon, 21 Sep 2026 01:01:04 +0800
Message-ID: <20260920170116.3624104-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_100206_916688_530A9004 
X-CRM114-Status: GOOD (  22.73  )
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

Changes since v8:

Patch 7 (net: pcs: xpcs: add Rockchip RK3568 platform glue driver)
- Replace the device_lock()/device_is_bound() check in xpcs_rk_create()
  with a check on link->supplier->links.status. device_is_bound() only
  tests whether the supplier's driver pointer is set, and that pointer
  is cleared at the very end of the unbind path, after devres has
  already freed the drvdata. Checking the device link's supplier state
  instead tells us whether the link actually pins the supplier: if the
  supplier was DL_DEV_DRIVER_BOUND when the link was created, the link
  is in DL_STATE_CONSUMER_PROBE and unbind waits for this probe; any
  other state means the supplier is not usable and we defer.
- Drop the device_lock()/device_unlock() pair, which is no longer
  needed since the link state itself carries the protection.
- Update the comment above device_link_add() to describe the new
  reasoning.

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


