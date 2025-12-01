Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247DCD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 06:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=auOrK6QC8ZZqXeB5c9szEPb35+gZsLGXqefCfOqhSNY=; b=hs2J1vQGqrgjCQ
	oRvzlhDSWWapdjNmeUnC2v3ddIDhJufsdkLIIyElC5vWTXhMpoDwXKzumYmqROpZ69FcuRA412XXs
	OwIL8Hy9hiCP3lZ8ASubtkj9K/Tmibt1e/imCf32XLfkwsvVX8qhAw3oI3u0eJtSe9MGrxUIIiIgG
	W8I9dmGANZ0I+vokLGkiSsFhYdjOxm0H0/yrLF2y3kB7ejQsLvE9PygKdzQKIHu6c6fTgJVr2+LgA
	UhgRLJZ7yQtQHS4IGJVUDUYThSUnm1AkQQk9qtCvqijytHjhST8I/JCNHMapW6T5DtSmawILNryF8
	I4fWMCjmcWkSZkeaxZ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxPg-00000002yZC-3Fo0;
	Mon, 01 Dec 2025 06:29:32 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxPd-00000002yY1-3Hub;
	Mon, 01 Dec 2025 06:29:31 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Dec
 2025 14:29:16 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Dec 2025 14:29:16 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Subject: [PATCH v6 0/7] Add ASPEED PCIe Root Complex support
Date: Mon, 1 Dec 2025 14:29:10 +0800
Message-ID: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALY1LWkC/43QQW7DIBCF4atErIs1wzAGd9V7VJVFMKlpldgCx
 0oU+e4hXtSLLNLlQ/r+kbiJHFIMWbzvbiKFOeY4nMqo33bC9+70HWTsyhYKFCMCyfOYpxTcsR1
 9DG3y0mrNhptub5FEYWMKh3hZk59fZfcxT0O6rhdmfLyuMaiRgAgAK0KmmoxE+eP877X1/XD+c
 HkMoZuC7ys/HMWjNKtNG2QgTQoqxUz2P5o23QACc6NUhUUzw2ut/zSCMtCwVVyhRazxNeYNI5r
 nP5xZgtxrh41lUzt/eKosy3IHIntzS6wBAAA=
X-Change-ID: 20251103-upstream_pcie_rc-8445759db813
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764570556; l=5149;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=PYc7RKtTrKYB/n8rcchUdu0GnArVjz+/Dm3h2uX0+i4=;
 b=uRcfSGhjD7whqD1XeVr1g7UGZxa8lZrhPpg7xE+9FtUCo3zPezpdK44JKgXLgYdm4src5LK7n
 7jPU9tj2zLeA2+GBEcaLc98QK4VQHAHgoWLG2rNUGxVqMuryWvziy7y
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_222929_852719_6CBE244C 
X-CRM114-Status: GOOD (  16.35  )
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

This patch series adds support for the ASPEED PCIe Root Complex,
including device tree bindings, pinctrl support, and the PCIe host controller
driver. The patches introduce the necessary device tree nodes, pinmux groups,
and driver implementation to enable PCIe functionality on ASPEED platforms.
Currently, the ASPEED PCIe Root Complex only supports a single port.

Summary of changes:
- Add device tree binding documents for ASPEED PCIe PHY, PCIe Config, and PCIe RC
- Update MAINTAINERS for new bindings and driver
- Add PCIe RC node and PERST control pin to aspeed-g6 device tree
- Implement ASPEED PCIe PHY driver
- Implement ASPEED PCIe Root Complex host controller driver

This series has been tested on AST2600/AST2700 platforms and enables PCIe device
enumeration and operation.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
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
Jacky Chou (7):
      dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
      dt-bindings: PCI: Add ASPEED PCIe RC support
      ARM: dts: aspeed-g6: Add PCIe RC and PCIe PHY node
      PHY: aspeed: Add ASPEED PCIe PHY driver
      PCI: Add FMT, TYPE and CPL status definition for TLP header
      PCI: aspeed: Add ASPEED PCIe RC driver
      MAINTAINERS: Add ASPEED PCIe RC driver

 .../bindings/pci/aspeed,ast2600-pcie.yaml          |  150 +++
 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      |   42 +
 MAINTAINERS                                        |   12 +
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |    5 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |   51 +
 drivers/pci/controller/Kconfig                     |   16 +
 drivers/pci/controller/Makefile                    |    1 +
 drivers/pci/controller/pcie-aspeed.c               | 1117 ++++++++++++++++++++
 drivers/pci/pci.h                                  |   15 +
 drivers/phy/Kconfig                                |    1 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/aspeed/Kconfig                         |   15 +
 drivers/phy/aspeed/Makefile                        |    2 +
 drivers/phy/aspeed/phy-aspeed-pcie.c               |  209 ++++
 14 files changed, 1637 insertions(+)
---
base-commit: e1afacb68573c3cd0a3785c6b0508876cd3423bc
change-id: 20251103-upstream_pcie_rc-8445759db813

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>


