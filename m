Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93743C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6WSIJ12G6yyEXd84X7xxhSCpXDNFy6p10iieXMp1K6w=; b=FQcpHwjhK7HtFMtRo6sO0agK11
	KumlIp/ndWvWw2dLCfTkZNonGkgq/S1cnnN6E4VfDXv49hGW/fxovcQ3yQ5iYD9swfjNTSAqfcSyv
	zOjY1N/FFwdFOUTGdRi0Ejs5X72KuOZirq5CWHjwuld2Puq3YMrD98k2KajZRJ9uxL6m1zw3c+fo3
	DjNeVZREH/5uxwtmnKuDKbFQcP/PFnN0i+xuQJA6NInDAM3+fh1Jlx/aOQFG4ZdDPeN871IOMspEL
	Y47ZtYQSvHAmhiocqjFM+Dj8xB88kCYrxLrzvQCfTELpc59y1GsjmJuezG3v9Jjy70GB/QDQ3RDCD
	sOLbdxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J0i-0000000CSMY-2JQS;
	Thu, 17 Sep 2026 20:47:12 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J0f-0000000CSL4-1rEb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:47:11 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-39e4b1e7d12so128242a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 13:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678028; x=1790282828; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WSIJ12G6yyEXd84X7xxhSCpXDNFy6p10iieXMp1K6w=;
        b=BWp3rHP+kc+D3LH+fQKe5h3qELUOh9IhqEfwBAqChecl87kjtMG3/jm9GzmjKJAd+x
         sX1gh3KV3W5eUjMtOtKTssJBq3ep+4yc15nJT7LE8q/RWs0yQGt0xLAbcYaGV9QzI+U5
         3woojZszPA1Lanajt1yz6/9Is5Es74fn6r9zEuRD/0Ii+WBMGYNq1WScc0/CJPaTLerS
         nWbZUZ5wyxvEIS8lG1imSdQzQq+ucqXTtf/sGLi28xetTZ+JHDpu9ypi/x2F1TSIlYi+
         t4w9V+XZzYu2H9Ix9jvrnNJrT1EcjnGLwSnVnBsOzeZKAZd4I0el1Nh4oyTq8kdVuLsR
         ExGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678028; x=1790282828;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6WSIJ12G6yyEXd84X7xxhSCpXDNFy6p10iieXMp1K6w=;
        b=0Gi87MxiRNIExMo5KBZnIQj5RzVAE4X7YnuCM69/+yE7TqugW6flGAfGc4m14cntU9
         cfUr43+5tbXPXjM/DezAfAA3uu4iW+XF8WmDBqz4ZCpGHx3YHehxfZEEsmaKfE0h8x/5
         MqeR322rqPDNA3++owZ7S9l5aPCXaMJM6WrW67cWWcB99TssDsH0wqcmzzHmb9533s96
         Lxtqkjgcm8+9DMeMnpgt/Q+cdRi1s0zzrmb3re2DmnNFJvhjPJyVBv4ecXwy4dd9SWoB
         upLPQkZ9TKLejfFBMJJrtZaiHKvYTbtWn6bRNXZV9IQkTsQV9NFCjo0fnZ8O6i0Sa9wL
         Lm8g==
X-Forwarded-Encrypted: i=1; AKwUvBwkwSt/sImN6grimjBeWoevr2XGfEkLwBU+K6U3LLrl5KDynNilhvCNoatZwQEw2O2O9+3b9nnk2v/p4lfyZdG4@lists.infradead.org
X-Gm-Message-State: AFuF++kJOHL90qXciuhVCRsvsrV5p3etMfpZVhP7Fpghop8PjGmOzgx0
	geNQlBhupI7AS/tF0QKJU5qayGVi8wc5ao87y8IbxtKUQ6tz8aX4zM8b
X-Gm-Gg: AYBFou2+FeU80LOoXyJJXk6QZnVKW9PN7+DK++useLuRn/gfzPWScn/6qb2zm+Gh7Xu
	k+C7QazVxHVbeA6SMkDHTjyhULkZD9EIsUY9L0X/QRhe1fFj+BIp9+CRzueqDPGPbAxvFVXlPEI
	SdIZMSXG/X3sbUp9Oo2BjHayj1hAt+b3fe+jJiTcI3aytrEAYkvIZwukrKfG4/GQqQeyB+M2ddW
	pmglvpdp+r751+DlhiwFOlngI4G9Ab9MOPHmGU18IACQbv46l73hGoMsIDRVXLHJDUm4oKR8S62
	H8fm8P5kiCC/YflfyJMDPwnEbgJ2SMmZasJU1t0I8fZG+wj6FPvGtUHY18+kosxOPBUYNonkr2Z
	rxUaw56jHX/Hgm8P3I5CGwXFBhjiXfS0A1z6FY2PuLPZKnrw+xuMletBNDYV8AxDJ39J++8B+E5
	5ydC6/I+JHBE9KR1L4vAQSO5ZLHvXkCNV7FOgbiHIsA3COE3y8RT03dkKtQl4c2q6lT6Y4IQ==
X-Received: by 2002:a17:90b:164a:b0:39e:4d7b:b247 with SMTP id 98e67ed59e1d1-39e54ea66cbmr680543a91.19.1789678028235;
        Thu, 17 Sep 2026 13:47:08 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e50a4bc22sm1232196a91.17.2026.09.17.13.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:47:07 -0700 (PDT)
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
Subject: [PATCH net-next v7 00/11] net: pcs: add basic support for RK3568 XPCS
Date: Fri, 18 Sep 2026 04:46:11 +0800
Message-ID: <20260917204624.2427486-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_134709_492201_723512B1 
X-CRM114-Status: GOOD (  25.64  )
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

Changes since v6:

Patch 1 (net: stmmac: move XPCS lifetime management to platform drivers)
- Reworded "the created XPCS is never used" to acknowledge that
  priv->hw->xpcs is still consulted by stmmac_phylink_setup() and
  stmmac_init_phy() even without select_pcs()
- Added a note that the generic "pcs-handle" parsing is removed, and
  that no in-tree platform relies on it

Patch 4 (dt-bindings: net: pcs: add rockchip,rk3568-xpcs support)
- Documented which patches consume the ethernet-pcs-mii@N child nodes
- Documented that phys/phy-names are provided at board level because
  dtbs_check skips disabled nodes and the SerDes link is board-specific
- Documented that the CRU reset lines are intentionally left out

Patch 5 (arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes)
- Fixed the changelog to use the actual node names (clock-xpcs-gmac0
  and clock-xpcs-gmac1), and noted that clock-output-names matches the
  CRU mux parent names in clk-rk3568.c
- Noted that phys/phy-names are supplied at board level

Patch 6 (net: pcs: xpcs: add ANRESTART support)
- Documented why the restart cannot go through the .pcs_an_restart op
  (phylink only calls it for 802.3z, and SGMII is not one)
- Documented why the latch is cleared before issuing the restart

Patch 7 (net: pcs: xpcs: add Rockchip RK3568 platform glue driver)
- Removed the device_link_remove() calls on the failure paths:
  DL_FLAG_AUTOREMOVE_CONSUMER is a managed link, and dropping it
  manually triggers a WARN in device_link_put_kref()
- Updated the commit message for the Kconfig and EEE multiplier changes
- Change xpcs_rk_create() to return -EPROBE_DEFER instead of -ENOMEM
  when device_link_add() fails, so the MAC probe retries if the XPCS
  supplier is not bound yet

Patch 8 (dt-bindings: net: rockchip-dwmac: document pcs-handle)
- Reworded the commit message to future tense, since rk_pcs_init()
  arrives in the next patch
- Gated the new required-property conditional on
  rockchip,rk3568-gmac, and marked pcs-handle as invalid for the
  other variants

Patch 9 (net: stmmac: dwmac-rk: add SGMII support for RK3568)
- Removed SGMII from rk_get_interfaces(): it is supplied by the XPCS's
  supported_interfaces, merged by stmmac_phylink_setup()
- Added a note in the commit message explaining why the SerDes is
  managed by the XPCS driver rather than through the legacy stmmac
  serdes_poweron/serdes_poweroff callbacks
- Noted that PCS_XPCS is already selected by STMMAC_ETH and PM by
  ARCH_ROCKCHIP

Patch 10 (arm64: dts: rockchip: rk3568-photonicat)
- Noted in the commit message that RK3568 has three Combo PHYs that
  can carry SGMII, and that using combphy2 is a board-level choice

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
 drivers/net/pcs/pcs-xpcs-rk.c                 | 582 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    |  35 +-
 .../rockchip/phy-rockchip-naneng-combphy.c    |   8 +
 include/linux/pcs/pcs-xpcs-rk.h               |  11 +
 19 files changed, 1098 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

-- 
2.47.3


