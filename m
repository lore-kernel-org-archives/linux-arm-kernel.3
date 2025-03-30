Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8D6C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftTUVa3F4ZhHp3yFPdSL/78GBPKqpz6M5cNECbhzEeo=; b=Et83ZKT5seX1144hzr4w/MnJQ/
	wyaqLV3ka8jRsH5ZbpoBaLREDHhUrguq/eE6H8zr1aVTj0SARme7i9TtHY3rdPnQ8hQiw8U9MvlNP
	fbuVTTrOcQaejyN7iG62eRdRL/kSPIwpuKdJlY/M1v5/Chd8cc7UOdTbXskObl5ImQIzzkHrr1lTH
	HvqdJnTywzH/1lhAQVhZmoUXYL0f19ZODSkX+aR/lC3VUU4eYM4kssLgNpEEOZWNsjRLYN/zzTz1W
	M7eq8Ie5oCtfXz2mirGvam/uqUCCAbsOF+RJz1y2dRWMkMSJRe/NKOCYKXIcGMqTLtNiuwOGkdzos
	texeJoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyoJf-0000000FyRS-3GVl;
	Sun, 30 Mar 2025 08:46:51 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyoD2-0000000FxiG-1zVn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 08:40:01 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52U8deG43063355
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 30 Mar 2025 03:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743323980;
	bh=ftTUVa3F4ZhHp3yFPdSL/78GBPKqpz6M5cNECbhzEeo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=roeoz/cLOJ0bVio9++8zpLY9v2qWnRHCzsZj6FRkvB0UQeZ5DeA1mY7bcJPIFbSjz
	 jKxlyTKHLLhJK+xEVHcDfq2tfVOlBKt0FzQPPsUFUSc/i1ILLiv8iFFqZdCoINDwTJ
	 m9wxQQ+ppmOmXzcfXrdHtbS0TQERxk5ym9DmbiIE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52U8deaL122957
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 30 Mar 2025 03:39:40 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 30
 Mar 2025 03:39:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 30 Mar 2025 03:39:39 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52U8dE4k015769;
	Sun, 30 Mar 2025 03:39:35 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <vigneshr@ti.com>, <kishon@kernel.org>,
        <18255117159@163.com>, <cassel@kernel.org>,
        <wojciech.jasko-EXT@continental-corporation.com>,
        <thomas.richard@bootlin.com>, <bwawrzyn@cisco.com>
CC: <linux-pci@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 4/4] PCI: j721e: Add support to build as a loadable module
Date: Sun, 30 Mar 2025 14:09:14 +0530
Message-ID: <20250330083914.529222-5-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250330083914.529222-1-s-vadapalli@ti.com>
References: <20250330083914.529222-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_014000_606908_0A4F0CBA 
X-CRM114-Status: GOOD (  18.89  )
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

The 'pci-j721e.c' driver is the application/glue/wrapper driver for the
Cadence PCIe Controllers on TI SoCs. Implement support for building it as a
loadable module.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1:
https://lore.kernel.org/r/20250307103128.3287497-5-s-vadapalli@ti.com/
Changes since v1:
- Based on feedback from Thomas at:
  https://lore.kernel.org/r/88b3ecbe-32b6-4310-afb9-da19a2d0506a@bootlin.com/
  the "check" for a non-NULL "pcie-refclk" in j721e_pcie_remove() has been
  dropped.

Regards,
Siddharth.

 drivers/pci/controller/cadence/Kconfig     |  6 ++--
 drivers/pci/controller/cadence/pci-j721e.c | 33 +++++++++++++++++++++-
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
index 82b58096eea0..72d7d264d6c3 100644
--- a/drivers/pci/controller/cadence/Kconfig
+++ b/drivers/pci/controller/cadence/Kconfig
@@ -43,10 +43,10 @@ config PCIE_CADENCE_PLAT_EP
 	  different vendors SoCs.
 
 config PCI_J721E
-	bool
+	tristate
 
 config PCI_J721E_HOST
-	bool "TI J721E PCIe controller (host mode)"
+	tristate "TI J721E PCIe controller (host mode)"
 	depends on ARCH_K3 || COMPILE_TEST
 	depends on OF
 	select PCIE_CADENCE_HOST
@@ -57,7 +57,7 @@ config PCI_J721E_HOST
 	  core.
 
 config PCI_J721E_EP
-	bool "TI J721E PCIe controller (endpoint mode)"
+	tristate "TI J721E PCIe controller (endpoint mode)"
 	depends on ARCH_K3 || COMPILE_TEST
 	depends on OF
 	depends on PCI_ENDPOINT
diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index ef1cfdae33bb..8bffcd31729c 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -15,6 +15,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
@@ -27,6 +28,7 @@
 #define cdns_pcie_to_rc(p) container_of(p, struct cdns_pcie_rc, pcie)
 
 #define ENABLE_REG_SYS_2	0x108
+#define ENABLE_CLR_REG_SYS_2	0x308
 #define STATUS_REG_SYS_2	0x508
 #define STATUS_CLR_REG_SYS_2	0x708
 #define LINK_DOWN		BIT(1)
@@ -116,6 +118,15 @@ static irqreturn_t j721e_pcie_link_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+static void j721e_pcie_disable_link_irq(struct j721e_pcie *pcie)
+{
+	u32 reg;
+
+	reg = j721e_pcie_intd_readl(pcie, ENABLE_CLR_REG_SYS_2);
+	reg |= pcie->linkdown_irq_regfield;
+	j721e_pcie_intd_writel(pcie, ENABLE_CLR_REG_SYS_2, reg);
+}
+
 static void j721e_pcie_config_link_irq(struct j721e_pcie *pcie)
 {
 	u32 reg;
@@ -633,9 +644,25 @@ static void j721e_pcie_remove(struct platform_device *pdev)
 	struct j721e_pcie *pcie = platform_get_drvdata(pdev);
 	struct cdns_pcie *cdns_pcie = pcie->cdns_pcie;
 	struct device *dev = &pdev->dev;
+	struct cdns_pcie_ep *ep;
+	struct cdns_pcie_rc *rc;
+
+	if (pcie->mode == PCI_MODE_RC) {
+		rc = container_of(cdns_pcie, struct cdns_pcie_rc, pcie);
+		cdns_pcie_host_disable(rc);
+	} else {
+		ep = container_of(cdns_pcie, struct cdns_pcie_ep, pcie);
+		cdns_pcie_ep_disable(ep);
+	}
+
+	if (pcie->reset_gpio) {
+		msleep(PCIE_T_PVPERL_MS);
+		gpiod_set_value_cansleep(pcie->reset_gpio, 1);
+	}
 
 	clk_disable_unprepare(pcie->refclk);
 	cdns_pcie_disable_phy(cdns_pcie);
+	j721e_pcie_disable_link_irq(pcie);
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
 }
@@ -730,4 +757,8 @@ static struct platform_driver j721e_pcie_driver = {
 		.pm	= pm_sleep_ptr(&j721e_pcie_pm_ops),
 	},
 };
-builtin_platform_driver(j721e_pcie_driver);
+module_platform_driver(j721e_pcie_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("PCIe controller driver for TI's J721E and related SoCs");
+MODULE_AUTHOR("Kishon Vijay Abraham I <kishon@ti.com>");
-- 
2.34.1


