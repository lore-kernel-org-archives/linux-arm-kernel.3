Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF3DC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 23:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cWonVcXX3jqcfNp/b9lgu6z0q2BXOtRBQGBmf1D4SVQ=; b=ykzyTvAZa1iLwxBAXQUGeyiddD
	+WqAFM4Ll8WIRvYbqvS70bfDz9SrxQAOECujGJka7xBa6ijRP5bq2vDhGI/frDxv4/lBBFyx0XGc9
	vZDIsTBG274ozjxPE71XRkEid5C1uLjEx3EUTDBWrAg6MyO7Ekl/a67aDQtSY161nUJDOEe+HTXde
	W1p95l4FIM0KC6KWVVwdoN4aeDfwBQOMH5vzlCl4YlRRcQ+POR/N5nTgkTFtVjs3E5HAFj4Avuugp
	AVO+DP7KyvyhjNp4+StTrNZM/jhHajJGsGgOqIiSRFVKt9YuP5N9KAOIxNfHq6MljkKJxZpMSBbqB
	XLt7N3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vkq-00000002HOy-22iz;
	Mon, 07 Apr 2025 23:19:48 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vj4-00000002H7q-440P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 23:18:00 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744067875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cWonVcXX3jqcfNp/b9lgu6z0q2BXOtRBQGBmf1D4SVQ=;
	b=SgnrJsFAJgNi9WQ+rl1nhgeJ8/jKFu0Z1ceqFZKXJFSOU0aFCGLqqAQNIakS5vh508pWuH
	ZXTig3Oqa7Hl5tBUgAKuqZbCvXp0LPqoN1GgiGYAELr0mPP34Yh3WnW7wh65Ig2gKNQlrd
	Omk115Z2psF0DR9mJ9RfqEV0eWNXxQs=
From: Sean Anderson <sean.anderson@linux.dev>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	upstream@airoha.com,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Rob Herring <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robert Hancock <robert.hancock@calian.com>,
	Saravana Kannan <saravanak@google.com>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [net-next PATCH v2 00/14] Add PCS core support
Date: Mon,  7 Apr 2025 19:17:31 -0400
Message-Id: <20250407231746.2316518-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_161759_151643_97DE7C5D 
X-CRM114-Status: GOOD (  20.94  )
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

This series adds support for creating PCSs as devices on a bus with a
driver (patch 3). As initial users,

- The Lynx PCS (and all of its users) is converted to this system (patch 5)
- The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
- The Cadence MACB driver is converted to support external PCSs (namely
  the Xilinx PCS) (patches 9-10).

The last few patches add device links for pcs-handle to improve boot times,
and add compatibles for all Lynx PCSs.

This series depends on [1,2], and they have been included at the
beginning so CI will run. However, I expect them to be reviewed/applied
outside the net-next tree.

Care has been taken to ensure backwards-compatibility. The main source
of this is that many PCS devices lack compatibles and get detected as
PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
the devicetree to add appropriate compatibles.

There is another series [3] with the same goal by Christian Marangi. In
comparison, I believe this series

- Implements a simpler and more-robust method of PCS access.
- Provides a more-direct upgrade path for existing MAC and PCS drivers.

Due to popular demand, I have added support for #pcs-cells with this
revision.

[1] https://lore.kernel.org/all/20250407222134.2280553-1-sean.anderson@linux.dev/
[2] https://lore.kernel.org/all/20250407223714.2287202-1-sean.anderson@linux.dev/
[3] https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com/

Changes in v2:
- Add fallbacks for pcs_get* and pcs_put
- Add support for #pcs-cells
- Change base compatible to just xlnx,pcs
- Change compatible to just xlnx,pcs
- Defer devicetree updates for another series
- Drop #clock-cells description
- Drop PCS_ALTERA_TSE which was accidentally added while rebasing
- Move #clock-cells after compatible
- Move update to macb_pcs_get_state to previous patch
- Remove outdated comment
- Remove second example
- Remove unused variable
- Remove unused variable lynx_properties
- Rename pcs-modes to xlnx,pcs-modes
- Reorder pcs_handle to come before suffix props
- Reword commit message
- Rework xilinx_pcs_validate to just clear out half-duplex modes instead
  of constraining modes based on the interface.

Sean Anderson (13):
  dt-bindings: net: Add Xilinx PCS
  device property: Add optional nargs_prop for get_reference_args
  device property: Add fwnode_property_get_reference_optional_args
  scripts: kernel-doc: fix parsing function-like typedefs (again)
  net: phylink: Support setting PCS link change callbacks
  net: pcs: Add subsystem
  net: pcs: lynx: Convert to an MDIO driver
  net: phy: Export some functions
  net: pcs: Add Xilinx PCS driver
  net: axienet: Convert to use PCS subsystem
  net: macb: Move most of mac_config to mac_prepare
  net: macb: Support external PCSs
  of: property: Add device link support for PCS

Vladimir Oltean (1):
  net: dsa: ocelot: suppress PHY device scanning on the internal MDIO
    bus

 .../devicetree/bindings/net/xilinx,pcs.yaml   | 115 +++
 Documentation/networking/index.rst            |   1 +
 Documentation/networking/kapi.rst             |   4 +
 Documentation/networking/pcs.rst              | 107 +++
 MAINTAINERS                                   |   8 +
 drivers/base/property.c                       |  50 +-
 drivers/base/swnode.c                         |  13 +-
 drivers/net/dsa/ocelot/Kconfig                |   4 +
 drivers/net/dsa/ocelot/felix_vsc9959.c        |  15 +-
 drivers/net/dsa/ocelot/seville_vsc9953.c      |  16 +-
 drivers/net/ethernet/altera/Kconfig           |   2 +
 drivers/net/ethernet/altera/altera_tse_main.c |   7 +-
 drivers/net/ethernet/cadence/macb.h           |   1 +
 drivers/net/ethernet/cadence/macb_main.c      | 229 +++--
 drivers/net/ethernet/freescale/dpaa/Kconfig   |   2 +-
 drivers/net/ethernet/freescale/dpaa2/Kconfig  |   3 +
 .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  |  11 +-
 drivers/net/ethernet/freescale/enetc/Kconfig  |   2 +
 .../net/ethernet/freescale/enetc/enetc_pf.c   |   8 +-
 .../net/ethernet/freescale/enetc/enetc_pf.h   |   1 -
 .../freescale/enetc/enetc_pf_common.c         |   4 +-
 drivers/net/ethernet/freescale/fman/Kconfig   |   4 +-
 .../net/ethernet/freescale/fman/fman_memac.c  |  27 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   3 +
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |   6 +-
 drivers/net/ethernet/xilinx/Kconfig           |   1 +
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |   4 +-
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 104 +--
 drivers/net/pcs/Kconfig                       |  45 +-
 drivers/net/pcs/Makefile                      |   4 +
 drivers/net/pcs/core.c                        | 782 ++++++++++++++++++
 drivers/net/pcs/pcs-lynx.c                    | 110 +--
 drivers/net/pcs/pcs-xilinx.c                  | 479 +++++++++++
 drivers/net/phy/mdio_device.c                 |   1 +
 drivers/net/phy/phy_device.c                  |   3 +-
 drivers/net/phy/phylink.c                     |  24 +-
 drivers/of/property.c                         |  12 +-
 include/linux/fwnode.h                        |   2 +-
 include/linux/pcs-lynx.h                      |  13 +-
 include/linux/pcs-xilinx.h                    |  36 +
 include/linux/pcs.h                           | 195 +++++
 include/linux/phy.h                           |   1 +
 include/linux/phylink.h                       |  27 +-
 include/linux/property.h                      |   4 +
 scripts/kernel-doc                            |   2 +-
 45 files changed, 2181 insertions(+), 311 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/xilinx,pcs.yaml
 create mode 100644 Documentation/networking/pcs.rst
 create mode 100644 drivers/net/pcs/core.c
 create mode 100644 drivers/net/pcs/pcs-xilinx.c
 create mode 100644 include/linux/pcs-xilinx.h
 create mode 100644 include/linux/pcs.h

-- 
2.35.1.1320.gc452695387.dirty


