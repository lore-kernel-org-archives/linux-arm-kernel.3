Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA06BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 19:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T0s7laNZe+Ra4wMHJ2pL3MTfBGq+kD5jv59e6Nhd28g=; b=icX7W8WYfzRWc+QX3SJ+WJfbwu
	MFiTy2n8d18kMCxhw1PkCFq6gNLXSRpuIJUdfWfTecNLm+fTDm9bk8KdjZIpNsMbm0qUu94ZEa/+/
	5DozCnRx9RGpqzWayTW8YUjIdBa8s2oMnRtnWQwMIRgHfGmB6Vycxq+oLKSI+l4l8P4vTUkAFsNPJ
	4nCBn3QjNBenmUB3lEOwJV70eD06wk6U7VrRPk5TI/2Rz4+hHBDSh1cJEbAfaJiazgXrk1wUhpGM+
	Rt2KCq/ok8GKzku+neobndnJa6dvYSK4ncmqUP/0Hhi9YN5PrOvxYaZ+YMQ6N4Om5eSLiLFc57DJy
	Crnsk8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4m4F-00000006u4i-2gzq;
	Tue, 15 Apr 2025 19:35:35 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4m2O-00000006tZ8-3H9U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 19:33:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744745615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T0s7laNZe+Ra4wMHJ2pL3MTfBGq+kD5jv59e6Nhd28g=;
	b=N1oM4jQ4Lwu92X2S0t05SGm7yatDoaajqQms2NTdODIoyDLQrtVFgaxaPCaFUGyl80a7PJ
	/3eLC+yEjKRSjFz69q115+HcJ+BPeEjGZZKWzq8HNID5laWJxe7m7hMGA7zIW5XjdxrAPl
	rj8kk3uDjUTj0DAomRbaE2mSjGR1v8A=
From: Sean Anderson <sean.anderson@linux.dev>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: upstream@airoha.com,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kory Maincent <kory.maincent@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
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
Subject: [net-next PATCH v3 00/11] Add PCS core support
Date: Tue, 15 Apr 2025 15:33:12 -0400
Message-Id: <20250415193323.2794214-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_123341_487919_E2AA3081 
X-CRM114-Status: GOOD (  18.75  )
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

To build documentation without errors, this series requires commit
de258fa8ca8d ("scripts: kernel-doc: fix parsing function-like typedefs
(again)"), currently applied to docs-next [1].

Care has been taken to ensure backwards-compatibility. The main source
of this is that many PCS devices lack compatibles and get detected as
PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
the devicetree to add appropriate compatibles.

There is another series [2] with the same goal by Christian Marangi. In
comparison, I believe this series

- Implements a simpler and more-robust method of PCS access.
- Provides a more-direct upgrade path for existing MAC and PCS drivers.

[1] https://lore.kernel.org/all/e0abb103c73a96d76602d909f60ab8fd6e2fd0bd.1744106242.git.mchehab+huawei@kernel.org/
[2] https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com/

Changes in v3:
- Add '>' modifier for paragraph to description
- Adjust axienet_xilinx_pcs_get for changes to pcs_find_fwnode API
- Drop patches destined for other trees, as they have either already
  been applied or are no longer necessary.
- Edit description to reference clocks instead of resets
- Remove support for #pcs-cells. Upon further investigation, the
  requested functionality can be accomplished by specifying the PCS's
  fwnode manually.
- Select PCS_XILINX unconditionally

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

Sean Anderson (10):
  dt-bindings: net: Add Xilinx PCS
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

 .../devicetree/bindings/net/xilinx,pcs.yaml   | 114 +++
 Documentation/networking/index.rst            |   1 +
 Documentation/networking/kapi.rst             |   4 +
 Documentation/networking/pcs.rst              | 102 +++
 MAINTAINERS                                   |   8 +
 drivers/net/dsa/ocelot/Kconfig                |   4 +
 drivers/net/dsa/ocelot/felix_vsc9959.c        |  15 +-
 drivers/net/dsa/ocelot/seville_vsc9953.c      |  16 +-
 drivers/net/ethernet/altera/Kconfig           |   2 +
 drivers/net/ethernet/altera/altera_tse_main.c |   7 +-
 drivers/net/ethernet/cadence/macb.h           |   1 +
 drivers/net/ethernet/cadence/macb_main.c      | 229 ++++--
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
 drivers/net/ethernet/xilinx/Kconfig           |   7 +
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |   4 +-
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 104 +--
 drivers/net/pcs/Kconfig                       |  44 +-
 drivers/net/pcs/Makefile                      |   4 +
 drivers/net/pcs/core.c                        | 690 ++++++++++++++++++
 drivers/net/pcs/pcs-lynx.c                    | 110 +--
 drivers/net/pcs/pcs-xilinx.c                  | 477 ++++++++++++
 drivers/net/phy/mdio_device.c                 |   1 +
 drivers/net/phy/phy_device.c                  |   3 +-
 drivers/net/phy/phylink.c                     |  24 +-
 drivers/of/property.c                         |   2 +
 include/linux/pcs-lynx.h                      |  13 +-
 include/linux/pcs-xilinx.h                    |  15 +
 include/linux/pcs.h                           | 193 +++++
 include/linux/phy.h                           |   1 +
 include/linux/phylink.h                       |  27 +-
 40 files changed, 1997 insertions(+), 296 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/xilinx,pcs.yaml
 create mode 100644 Documentation/networking/pcs.rst
 create mode 100644 drivers/net/pcs/core.c
 create mode 100644 drivers/net/pcs/pcs-xilinx.c
 create mode 100644 include/linux/pcs-xilinx.h
 create mode 100644 include/linux/pcs.h

-- 
2.35.1.1320.gc452695387.dirty


