Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B96C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 00:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yoolCrktKrQ0DqzoLMe7SabSkDhHjeFchBm7FftX1xY=; b=SxWexTPF9t4Ebn7E0fnfloI5Nh
	gK7bTtiucfo2bVUuhWm+4vNy0vDiMqUsKuxW4V5NFueTLaM++X3GOXe1VfZFwWofX1Tn7JmagUM/G
	0bfzJ0RtlKIe0ClUAqjYexFfRf/dPmWw1GwKDp5aVIgloxxfm2dWnYxNDv/SqLaFaH+rW9Bt6ks1d
	4kaMKI45qHmpv4NhnzdsOXJsb+qJu5XO5OzBP6sMxxxDeL8Dsqns0tsm9OwVjJGUuVZO76rkzsCdY
	kicOz09RNnC8fYux7wp+W5Zrzn9JyAJmYx/D1WO2BFVinJXaXK/Ks87blV1XHmDK13iz7uQMzpOtc
	tkvbmASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9Ua-00000008Uhs-3Flt;
	Wed, 11 Jun 2025 00:39:00 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8Rg-00000008OOf-35Hq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 23:31:58 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749598302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yoolCrktKrQ0DqzoLMe7SabSkDhHjeFchBm7FftX1xY=;
	b=Lya1RBkMqPAplov5/wq9KnKWKpPNxT78Xgh7Frue1nyDqCNCS1y7c1Wq//j8whdODOTAv6
	dZPLiApe9kgLw7J5RNfVuLVnN6ke8tImnQqXNZQeBy1jxYG8PNxMIBQ9cLNt/JK3bvgh//
	G06LFbN5rXVss5iole/8asmRl1ZKwtQ=
From: Sean Anderson <sean.anderson@linux.dev>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kory Maincent <kory.maincent@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Simon Horman <horms@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lei Wei <quic_leiwei@quicinc.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Rob Herring <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robert Hancock <robert.hancock@calian.com>,
	Saravana Kannan <saravanak@google.com>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [net-next PATCH v6 00/10] Add PCS core support
Date: Tue, 10 Jun 2025 19:31:24 -0400
Message-Id: <20250610233134.3588011-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_163156_907690_0547DBE4 
X-CRM114-Status: GOOD (  22.95  )
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

- The Lynx PCS (and all of its users) is converted to this system
  (patches 4-5)
- The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-7)
- The Cadence MACB driver is converted to support external PCSs (namely
  the Xilinx PCS) (patches 8-9).

Care has been taken to ensure backwards-compatibility. The main source
of this is that many PCS devices lack compatibles and get detected as
PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
the devicetree to add appropriate compatibles.

There is another series [1] with the same goal by Christian Marangi. In
comparison, I believe this series

- Implements a simpler and more-robust method of PCS access.
- Provides a more-direct upgrade path for existing MAC and PCS drivers.

[1] https://lore.kernel.org/netdev/20250511201250.3789083-1-ansuelsmth@gmail.com/

Changes in v6:
- Define lynx_pcs_of_match only when OF_MATCH is enabled
- Fix use of spin_lock instead of spin_unlock
- Introduce config for compatibility helpers
- Move axienet_pcs_fixup to AXI Ethernet commit
- Reduce line lengths to under 80 characters
- Remove duplicate include of phylink.h
- Remove unneccessary Kconfig selects
- Use an empty statement for next label
- Use guard(srcu)

Changes in v5:
- Export get_phy_c22_id when it is used
- Expose bind attributes, since there is no issue in doing so
- Rebase onto net-next
- Use MDIO_BUS instead of MDIO_DEVICE

Changes in v4:
- Add a note about the license
- Adjust variable ordering in pcs_find_fwnode
- Annotate pcs_wrapper.wrapped with __rcu
- Fix PCS lookup functions missing ERR_PTR casts
- Fix documentation for devm_pcs_register_full
- Fix incorrect condition in pcs_post_config
- Fix linking when PCS && !OF_DYNAMIC
- Fix linking when PCS && OF_DYNAMIC && PHYLIB=m
- Re-add documentation for axienet_xilinx_pcs_get that was accidentally
  removed
- Reduce line lengths to under 80 characters
- Remove unused dev parameter to pcs_put
- Use a spinlock instead of a mutex to protect pcs_wrappers

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

Sean Anderson (9):
  dt-bindings: net: Add Xilinx PCS
  net: phylink: Support setting PCS link change callbacks
  net: pcs: Add subsystem
  net: pcs: lynx: Convert to an MDIO driver
  net: pcs: Add Xilinx PCS driver
  net: axienet: Convert to use PCS subsystem
  net: macb: Move most of mac_config to mac_prepare
  net: macb: Support external PCSs
  of: property: Add device link support for PCS

Vladimir Oltean (1):
  net: dsa: ocelot: suppress PHY device scanning on the internal MDIO
    bus

 .../devicetree/bindings/net/xilinx,pcs.yaml   | 114 ++++
 Documentation/networking/index.rst            |   1 +
 Documentation/networking/kapi.rst             |   4 +
 Documentation/networking/pcs.rst              | 102 +++
 MAINTAINERS                                   |   8 +
 drivers/net/dsa/ocelot/felix_vsc9959.c        |  15 +-
 drivers/net/dsa/ocelot/seville_vsc9953.c      |  16 +-
 drivers/net/ethernet/altera/altera_tse_main.c |   7 +-
 drivers/net/ethernet/cadence/macb.h           |   1 +
 drivers/net/ethernet/cadence/macb_main.c      | 229 ++++---
 drivers/net/ethernet/freescale/dpaa2/Kconfig  |   1 +
 .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  |  11 +-
 .../net/ethernet/freescale/enetc/enetc_pf.c   |   8 +-
 .../net/ethernet/freescale/enetc/enetc_pf.h   |   1 -
 .../freescale/enetc/enetc_pf_common.c         |   4 +-
 drivers/net/ethernet/freescale/fman/Kconfig   |   2 +-
 .../net/ethernet/freescale/fman/fman_memac.c  |  25 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |   6 +-
 drivers/net/ethernet/xilinx/Kconfig           |  13 +
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |   4 +-
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 160 +++--
 drivers/net/pcs/Kconfig                       |  47 +-
 drivers/net/pcs/Makefile                      |   4 +
 drivers/net/pcs/core.c                        | 628 ++++++++++++++++++
 drivers/net/pcs/pcs-lynx.c                    | 113 ++--
 drivers/net/pcs/pcs-xilinx.c                  | 427 ++++++++++++
 drivers/net/phy/phy_device.c                  |   3 +-
 drivers/net/phy/phylink.c                     |  24 +-
 drivers/of/property.c                         |   2 +
 include/linux/pcs-lynx.h                      |  13 +-
 include/linux/pcs.h                           | 205 ++++++
 include/linux/phy.h                           |   1 +
 include/linux/phylink.h                       |  27 +-
 34 files changed, 1931 insertions(+), 296 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/xilinx,pcs.yaml
 create mode 100644 Documentation/networking/pcs.rst
 create mode 100644 drivers/net/pcs/core.c
 create mode 100644 drivers/net/pcs/pcs-xilinx.c
 create mode 100644 include/linux/pcs.h

-- 
2.35.1.1320.gc452695387.dirty


