Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF119D3CCAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 03:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T2dwiQU6KYh8NipdrPb6tu9wZI8hndZVqumTX0cyLnw=; b=KnX9hK1D9b+fY0
	yTXO0yiuENA9e0taHlATAQ76USYYgy7Ppw5WgaKJVR/uWhoiIe2bR7WWMHNrsYOli2tREpCLFwQUH
	5MXFoIhw60BSNsMHkW5F64DOJ5RwgpBP/Qoz13bMvw1UIQRqpbHAtKIF17J5TSJt6H0QjcBkoZfJn
	3gn3XJ9HNzNTE3dXFG3Hvo/0wUL0DREBwtWGkFX645OyTb+dK4SmumOnZ4HHKqBDxtGRX8Y23F7YT
	fzoHgPvMw22cwutrm2nVyfOZR6eECbTj/oPXxL8kuOBS8IXhXW541bqkIO0+c5wsjR3Eg/aHGgvY4
	s0psqGUY9XIy2zVL6r1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgE99-0000000BggZ-2vKU;
	Thu, 15 Jan 2026 03:35:43 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgE96-0000000BgfU-0woG;
	Thu, 15 Jan 2026 03:35:41 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 Jan
 2026 11:35:29 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 Jan 2026 11:35:29 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Subject: [PATCH v9 0/3] Add ASPEED PCIe PHY support
Date: Thu, 15 Jan 2026 11:35:28 +0800
Message-ID: <20260115-upstream_pcie_rc-v9-0-d6c82a1556a7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIBgaGkC/43QTWrDMBCG4asErSszo9Hop6veo5Qgy0qtlsTGd
 kxDyN2rZFEHYkiXn+B9BnQWYxpyGsXr5iyGNOcxd4cy/MtGxDYcPpPMTdlCgWJEIHnsx2lIYb/
 tY07bIUqnNVv2Te2QRMn6Ie3yz418/yi7zePUDafbhRmvrzcMDBIQAWBFyGTISpRfIX6ftrHtj
 m9h7FNqphTbKnZ7cZVmtdQWGUiTgkoxk/tPTUvtAYHZK1VhqZnhea3/agRlwbNTXKFDNPg85iV
 GtI9/OLMEWeuA3rE1Ie5WFbMoCnBFMUVx0TmAyKZGs6rYOwXNimKLokOqYccUdUyrirtTCFYUV
 xQg9i42jYPYPCiXy+UXEdQd1n4CAAA=
X-Change-ID: 20251103-upstream_pcie_rc-8445759db813
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768448129; l=5317;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=+ZKi5Nj/LRHiFgYwNq73TzvEGVM7ASddgqK3aHZnfC0=;
 b=gtBigwRJNwxJrArJmhqntrVevDM2ps4H1FHjgP5PenY0FIPu7yvTLT9ztQObYjJy4fNWqRguf
 MLS/JFEF9SaD983sRCJLUjJ+OGk1Y9t3rOvaQZpaKMErdkXHwBFseRg
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_193540_278695_AA152CDF 
X-CRM114-Status: GOOD (  17.94  )
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

This patch series adds support for the ASPEED PCIe PHY,
including device tree bindings and PCIe PHY driver. 
The patches introduce the necessary device tree nodes.

Summary of changes:
- Add device tree binding documents for ASPEED PCIe PHY
- Update MAINTAINERS for new bindings and driver
- Implement ASPEED PCIe PHY driver

This series has been tested on AST2600/AST2700 platforms and enables PCIe device
enumeration and operation.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
Changes in v9:
- Remove '[v8,2/4] ARM: dts: aspeed-g6: Add PCIe RC and PCIe PHY node'
  and send it separately.
- Use FIELD_MODIFY to configure register.
- Link to v8: https://lore.kernel.org/r/20251230-upstream_pcie_rc-v8-0-03598cdd80cd@aspeedtech.com

Changes in v8:
- Update the title of cover letter
- Remove 'default y' from Kconfig
- Change 'PHY:' to 'phy:' in the title of ASPEED PCIe PHY commit.
- Remove unnecessary headers from phy-aspeed-pcie.c.
- Add ASPEED PCIe PHY MAINTAINERS
- Remove applied patches
  [v7,2/7] dt-bindings: PCI: Add ASPEED PCIe RC support
  [v7,5/7] PCI: Add FMT, TYPE and CPL status definition for TLP header
  [v7,6/7] PCI: aspeed: Add ASPEED PCIe RC driver
  [v7,7/7] MAINTAINERS: Add ASPEED PCIe RC driver
- Link to v7: https://lore.kernel.org/r/20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com

Changes in v7:
- Add PCIe port into aspeed,ast2600-pci.yaml.
- Remove aspeed_pcie_init_ports() and merge aspeed_pcie_port_init() to
  aspeed_pcie_parse_port()
- Refactor aspeed remap pcie addr to aspeed_pcie_map_ranges()
- Link to v6: https://lore.kernel.org/r/20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com

Changes in v6:
- Refer to pci-cpi-bridge.yaml to update aspeed,ast2600-pcie.yaml and
  the pcie node of aspeed-g6.dtsi.
- 'dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add PCIe RC PERST#
  group' have applied, remove it from this version.
- Adjust the defnitions in pci.h. 
- Link to v5: https://lore.kernel.org/r/20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com

Changes in v5:
- Remove legacy-interrupt-controller and the INTx points to pcie node itself.
- Correct bar mapping description and implementation to PCIe address
  configuration in pcie-aspeed.c driver.
- Link to v4: https://lore.kernel.org/r/20251027095825.181161-1-jacky_chou@aspeedtech.com/

Changes in v4:
- Remove aspeed,ast2700-pcie-cfg.yaml
- Add more descriptions for AST2600 PCIe RC in aspeed,ast2600-pcie.yaml
- Change interrupt-controller to legacy-interrupt-controller in yaml
  and dtsi
- Remove msi-parent property in yaml and dtsi
- Modify the bus range to starting from 0x00 in aspeed-g6.dtsi
- Fixed the typo on MODULE_DEVICE_TABLE() in phy-aspeed-pcie.c
- Add PCIE_CPL_STS_SUCCESS definition in pci/pci.h
- Add prefix ASPEED_ for register definition in RC driver
- Add a flag to indicate clear msi status twice for AST2700 workaround
- Remove getting domain number
- Remove scanning AST2600 HOST bridge on device number 0
- Remove all codes about CONFIG_PCI_MSI
- Get root but number from resouce list by IORESOURCE_BUS
- Change module_platform_driver to builtin_platform_driver
- Link to v3: https://lore.kernel.org/r/20250901055922.1553550-1-jacky_chou@aspeedtech.com/

Changes in v3:
- Add ASPEED PCIe PHY driver
- Remove the aspeed,pciecfg property from AST2600 RC node, merged into RC node
- Update the binding doc for aspeed,ast2700-pcie-cfg to reflect the changes
- Update the binding doc for aspeed,ast2600-pcie to reflect the changes
- Update the binding doc for aspeed,ast2600-pinctrl to reflect the changes
- Update the device tree source to reflect the changes
- Adjusted the use of mutex in RC drivers to use GRAND
- Updated from reviewer comments
- Link to v2: https://lore.kernel.org/r/20250715034320.2553837-1-jacky_chou@aspeedtech.com/

Changes in v2:
- Moved ASPEED PCIe PHY yaml binding to `soc/aspeed` directory and
  changed it as syscon
- Added `MAINTAINERS` entry for the new PCIe RC driver
- Updated device tree bindings to reflect the new structure
- Refactored configuration read and write functions to main bus and
  child bus ops
- Refactored initialization to implement multiple ports support
- Added PCIe FMT and TYPE definitions for TLP header in
  `include/uapi/linux/pci_regs.h`
- Updated from reviewer comments
- Link to v1: https://lore.kernel.org/r/20250613033001.3153637-1-jacky_chou@aspeedtech.com/

---
Jacky Chou (3):
      dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
      phy: aspeed: Add ASPEED PCIe PHY driver
      MAINTAINERS: Add ASPEED PCIe PHY driver

 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      |  42 +++++
 MAINTAINERS                                        |   8 +
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/aspeed/Kconfig                         |  14 ++
 drivers/phy/aspeed/Makefile                        |   2 +
 drivers/phy/aspeed/phy-aspeed-pcie.c               | 194 +++++++++++++++++++++
 7 files changed, 262 insertions(+)
---
base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
change-id: 20251103-upstream_pcie_rc-8445759db813

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>


