Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517B2C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 04:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QOTEEcWVIiz6O+GToF2cpyo+TZ3hUNgZ0JY3xul8rTA=; b=N6lwcTAcs/uyZn6UsBIEOaXf1A
	XBZNoFU4rtQwm+nfswzzxRsFI4Suqwktx7DNYTUHXqRkndFFn/F0kdQ0RRWIJK1SGDbBEYUQv0Ncn
	nim2/x5O1opwz/btWszsHXTmFsqeYrXkFVUyDNaMMpYsPgVnSdyBABjVnDuJVjfrHsSVvteOxEsmn
	uXEepEjfIZF+Sfbb95mlVo4tYvDj6WKXjbl1lJG82hii1Ug1sEyTrQUKaYXmZJsiZAe4IG+f5qD+C
	msi3vh53B0nfhS8MitQ5OX29k0PbOmsyBn+3+1KkFc1UigT0QOQ6XX/MkcsOCr7Bbizw5KIDGFDbs
	/yrCG0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwCQ-0000000FJXY-3db3;
	Fri, 13 Jun 2025 04:39:30 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPv7R-0000000FEOC-1R5f;
	Fri, 13 Jun 2025 03:30:18 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Jun
 2025 11:30:01 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Jun 2025 11:30:01 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <bhelgaas@google.com>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<mani@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <linus.walleij@linaro.org>,
	<p.zabel@pengutronix.de>, <linux-aspeed@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <elbadrym@google.com>, <romlem@google.com>, <anhphan@google.com>,
	<wak@google.com>, <yuxiaozhang@google.com>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 0/7] Add ASPEED PCIe Root Complex support
Date: Fri, 13 Jun 2025 11:29:54 +0800
Message-ID: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_203017_373088_29FB76F0 
X-CRM114-Status: GOOD (  10.72  )
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

Summary of changes:
- Add device tree binding documents for ASPEED PCIe PHY, PCIe Config, and PCIe RC
- Update MAINTAINERS for new bindings and driver
- Add PCIe RC node and PERST control pin to aspeed-g6 device tree
- Add PCIe RC PERST pin group to aspeed-g6 pinctrl
- Implement ASPEED PCIe Root Complex host controller driver

This series has been tested on AST2600/AST2700 platforms and enables PCIe device
enumeration and operation.

Feedback and review are welcome.

Jacky Chou (7):
  dt-bindings: phy: Add document for ASPEED PCIe PHY
  dt-bindings: pci: Add document for ASPEED PCIe Config
  dt-bindings: pci: Add document for ASPEED PCIe RC
  ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST ctrl pin
  ARM: dts: aspeed-g6: Add PCIe RC node
  pinctrl: aspeed-g6: Add PCIe RC PERST pin group
  pci: aspeed: Add ASPEED PCIe host controller driver

 .../bindings/pci/aspeed-pcie-cfg.yaml         |   41 +
 .../devicetree/bindings/pci/aspeed-pcie.yaml  |  159 +++
 .../bindings/phy/aspeed-pcie-phy.yaml         |   38 +
 MAINTAINERS                                   |   10 +
 .../boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |    5 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   53 +
 drivers/pci/controller/Kconfig                |   13 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-aspeed.c          | 1039 +++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    |   12 +-
 10 files changed, 1370 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pci/aspeed-pcie-cfg.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
 create mode 100644 drivers/pci/controller/pcie-aspeed.c

-- 
2.43.0


