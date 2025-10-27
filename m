Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D05CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oga9ogGf0jTX/pA6LeSnCcJbghZKPh2bXwtElqu1MLY=; b=EhhocCyroJDMDFDtFl9gbxHtjU
	MRgHJT8Ok0Pxi4I69kOGThO2h+CZ/wRFpRh74SUzlEw6uHgBGA1z1r8ziB01ybZ6xW3u2KpJIURpe
	RBSx7Vcdsw43TAKdxDk5qOSL4t5b+LvUPOPL0UwVZGdeGokp49InPyCAuiWhVNtqiPKUJdncTZKa2
	I80LlQDR+yIbJCqgbs4S/1ujoNUf/7oYTpuo/yRAwpQohsMS6uDumfs5U+S9OC3ZtsB5y2Ww+LLPO
	pKISnkjIg0BiHjpTjEo/zhh1l6vDjZo4sK/xmQ/sgC02xxMHCFasDZ67PbLLbfKU9bvDSTvxWcLPA
	4RPTfHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJzm-0000000Dark-3Iu2;
	Mon, 27 Oct 2025 09:58:34 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJzj-0000000DaqR-1Udh;
	Mon, 27 Oct 2025 09:58:32 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 27 Oct
 2025 17:58:25 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 27 Oct 2025 17:58:25 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
	<robh@kernel.org>, <bhelgaas@google.com>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <linus.walleij@linaro.org>,
	<p.zabel@pengutronix.de>, <linux-aspeed@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <jacky_chou@aspeedtech.com>
Subject: [PATCH v4 0/9] Add ASPEED PCIe Root Complex support
Date: Mon, 27 Oct 2025 17:58:16 +0800
Message-ID: <20251027095825.181161-1-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_025831_416047_3E72F905 
X-CRM114-Status: GOOD (  17.01  )
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

Jacky Chou (9):
  dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
  dt-bindings: PCI: Add ASPEED PCIe RC support
  dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add PCIe RC PERST# group
  ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST#
  ARM: dts: aspeed-g6: Add PCIe RC and PCIe PHY node
  PHY: aspeed: Add ASPEED PCIe PHY driver
  PCI: Add FMT, TYPE and CPL status definition for TLP header
  PCI: aspeed: Add ASPEED PCIe RC driver
  MAINTAINERS: Add ASPEED PCIe RC driver

 .../bindings/pci/aspeed,ast2600-pcie.yaml     |  168 +++
 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml |   42 +
 .../pinctrl/aspeed,ast2600-pinctrl.yaml       |    2 +
 MAINTAINERS                                   |   11 +
 .../boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |    5 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   54 +
 drivers/pci/controller/Kconfig                |   16 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-aspeed.c          | 1122 +++++++++++++++++
 drivers/pci/pci.h                             |   15 +
 drivers/phy/Kconfig                           |    1 +
 drivers/phy/Makefile                          |    1 +
 drivers/phy/aspeed/Kconfig                    |   15 +
 drivers/phy/aspeed/Makefile                   |    2 +
 drivers/phy/aspeed/phy-aspeed-pcie.c          |  209 +++
 15 files changed, 1664 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
 create mode 100644 drivers/pci/controller/pcie-aspeed.c
 create mode 100644 drivers/phy/aspeed/Kconfig
 create mode 100644 drivers/phy/aspeed/Makefile
 create mode 100644 drivers/phy/aspeed/phy-aspeed-pcie.c

---
v4:
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
v3:
 - Add ASPEED PCIe PHY driver
 - Remove the aspeed,pciecfg property from AST2600 RC node, merged into RC node
 - Update the binding doc for aspeed,ast2700-pcie-cfg to reflect the changes
 - Update the binding doc for aspeed,ast2600-pcie to reflect the changes
 - Update the binding doc for aspeed,ast2600-pinctrl to reflect the changes
 - Update the device tree source to reflect the changes
 - Adjusted the use of mutex in RC drivers to use GRAND
 - Updated from reviewer comments

v2:
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
---

-- 
2.34.1


