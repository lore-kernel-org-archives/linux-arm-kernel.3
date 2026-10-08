Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7948CA600F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J0lKCE3RmRvCGQ3yXVZPn/3i5EvH6SPYE4vOGbYePsM=; b=rS8WLDac9k4cYk
	zT7GC6KKxtmlwQYz36Wmnuf+vPwBWmU6UdcxQq92JJBRdcdtjCmPeJ2eYm2EwpAQwue2XUi+vQt48
	Cq9cUN3CXngJoijZVa3hxfCwzldd1kWvcsU0R6jte5GFhziQpZDnZ2hT/MpODNbTfRYHadDgRhog2
	E+/ldDlwW0khNrUMOZHsmKGnXLTYun31PS7FKsaKk9L2Q8MtK6MREodvKRfsmdKMZm/QKPwYXGijT
	/YlXnq52wlBO5xPQDYHUwILq0DeohoE+IsWle+W+YXxL28UhygJdD9ybnAvyfiAnX5WFLpXzFsteB
	ReJI2CP+7p1HMltKZWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmIk-00000004Ezh-1laO;
	Thu, 08 Oct 2026 11:28:42 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmIh-00000004Eyu-0xi3;
	Thu, 08 Oct 2026 11:28:40 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 8 Oct
 2026 19:28:28 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 8 Oct 2026 19:28:28 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Subject: [PATCH 0/3] phy: aspeed: Add ASPEED PCIe PHY support
Date: Thu, 8 Oct 2026 19:28:18 +0800
Message-ID: <20261008-aspeed_pcie_phy-v1-0-96764937aef0@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJ+x2oC/x3MSwqAIBRG4a3EHSf4CIm2EiGmf3UnJQpRRHtPG
 n6Dcx4qyIxCQ/NQxsmFj71CtQ2Fze8rBMdq0lJbaY0UviQguhQYLm23MJ2yapamtwZUq5Sx8PU
 fx+l9P07DBk1hAAAA
X-Change-ID: 20260630-aspeed_pcie_phy-34161b03863e
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Manivannan Sadhasivam
	<mani@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791458908; l=1483;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=iu4Zl2XLhk1c2sygQvsZ6Yp6z//xHF44lf3a3D+enh0=;
 b=WEva4gZIureOwV8wbKrsmtAfd2JtufHc6mn7kCstj8/nqIh8PqvVumxtDKzG2pskx3VXMDz6L
 iHViDNsxYxrADPJ3jP7f1HmbExdLIosqCQl8al7SFuRz5mUjoDKKNM/
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_042839_273545_D1F2CE6A 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

Add the ASPEED PCIe PHY binding and driver for AST2600 and AST2700
SoCs. The PHY provides the physical layer used by the PCIe controller
when it is configured to run in root complex mode.

The driver registers an ASPEED PCIe PHY provider through the generic PHY
framework and programs the SoC-specific PEHR registers from set_mode().
For AST2600 this selects the root complex port type. For AST2700 this
also configures the posted/completion credit values, local scaling,
device type, internal reset selection, and downstream port setting
needed by the controller.

This series also adds the devicetree binding for the PHY provider and a
MAINTAINERS entry for the ASPEED PCIe PHY driver.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
Jacky Chou (3):
      dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
      phy: aspeed: Add ASPEED PCIe PHY driver
      MAINTAINERS: Add ASPEED PCIe PHY driver

 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      |  49 +++++
 MAINTAINERS                                        |   8 +
 drivers/phy/aspeed/Kconfig                         |  12 +-
 drivers/phy/aspeed/Makefile                        |   1 +
 drivers/phy/aspeed/phy-aspeed-pcie.c               | 237 +++++++++++++++++++++
 5 files changed, 306 insertions(+), 1 deletion(-)
---
base-commit: ea01f446f0682a5e7bd7a275889a890b7e0c6e02
change-id: 20260630-aspeed_pcie_phy-34161b03863e

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>


