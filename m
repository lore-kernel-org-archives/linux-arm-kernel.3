Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABFBCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3wNqasuPPpJNRZvnxmgSVHOkxs2jXZ6/IsjcnNJii8=; b=gBlNt3myuUMfopuAA74LVJgo9e
	R3nPUcRk/Q0h+Nf/HDG8yR7LRdLxM7x5fXbv3UMugdgWrn/BuUUIYnvfZ12AkT/frL6xhnXV3epXO
	2kx7knVUiGNXVhwoUF1YwTXtsepIM5vpZK2qBYNAjxm3qknW2sIGHOSaXwU4yMHTIxD7hJF0gNaRX
	SUQWCEd+fAT9kMO9nqT+42zSuHb3+aiJQ1ylV230YzTNyMkIo9cqIqooNc52msTDWhhYz+WRxnHDp
	YCwB5I94H1r/UYfsaT37jSR07GD1kSDiKxF4Tc1lsFoFqc9WzZ6mgN3TpxJmCKFf2kuH9MaASTARf
	fvE8VfHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2qN-00000009EEg-3nMO;
	Fri, 12 Sep 2025 12:25:35 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2qI-00000009E9p-0HAw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:25:34 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CCPE65968259;
	Fri, 12 Sep 2025 07:25:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757679914;
	bh=W3wNqasuPPpJNRZvnxmgSVHOkxs2jXZ6/IsjcnNJii8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sga40TPbvjpvMJSKV3OTySsYpLMeyuYrTyLC7WNggLMultoS43/tpiKtMCAzfBXQS
	 fniBw15seitUR9P2KOIQXTYBwZ06SqUOl1gNhQeGz24W2MYo46s7sr4TpAOSGkCCIA
	 KHUgLc/KoT4EKWnuRU4cWXztv04tche0ZphoEkus=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CCPEX91291704
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 07:25:14 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 07:25:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 07:25:14 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CCNuLc3589278;
	Fri, 12 Sep 2025 07:25:07 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <christian.bruel@foss.st.com>, <qiang.yu@oss.qualcomm.com>,
        <mayank.rana@oss.qualcomm.com>, <thippeswamy.havalige@amd.com>,
        <shradha.t@samsung.com>, <quic_schintav@quicinc.com>,
        <inochiama@gmail.com>, <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>
CC: <jirislaby@kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 10/10] PCI: keystone: Add support to build as a loadable module
Date: Fri, 12 Sep 2025 17:46:21 +0530
Message-ID: <20250912122356.3326888-11-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912122356.3326888-1-s-vadapalli@ti.com>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_052530_235467_4B14DDA6 
X-CRM114-Status: GOOD (  22.96  )
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

The 'pci-keystone.c' driver is the application/glue/wrapper driver for the
Designware PCIe Controllers on TI SoCs. Now that all of the helper APIs
that the 'pci-keystone.c' driver depends upon have been exported for use,
enable support to build the driver as a loadable module.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1: https://lore.kernel.org/r/20250903124505.365913-12-s-vadapalli@ti.com/
Changes since v1:
- Based on the feedback from Manivannan Sadhasivam <mani@kernel.org> at:
  https://lore.kernel.org/r/2gzqupa7i7qhiscwm4uin2jmdb6qowp55mzk7w4o3f73ob64e7@taf5vjd7lhc5/
  builtin_platform_driver() is being retained in the driver due to which
  the change made in the v1 patch of replacing builtin_platform_driver()
  with module_platform_driver() has been discarded in this patch.

 drivers/pci/controller/dwc/Kconfig        |  6 +++---
 drivers/pci/controller/dwc/pci-keystone.c | 22 ++++++++++++++++++++++
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 34abc859c107..46012d6a607e 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -482,10 +482,10 @@ config PCI_DRA7XX_EP
 	  This uses the DesignWare core.
 
 config PCI_KEYSTONE
-	bool
+	tristate
 
 config PCI_KEYSTONE_HOST
-	bool "TI Keystone PCIe controller (host mode)"
+	tristate "TI Keystone PCIe controller (host mode)"
 	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
 	depends on PCI_MSI
 	select PCIE_DW_HOST
@@ -497,7 +497,7 @@ config PCI_KEYSTONE_HOST
 	  DesignWare core functions to implement the driver.
 
 config PCI_KEYSTONE_EP
-	bool "TI Keystone PCIe controller (endpoint mode)"
+	tristate "TI Keystone PCIe controller (endpoint mode)"
 	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
 	depends on PCI_ENDPOINT
 	select PCIE_DW_EP
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index e85942b4f6be..661e31b60a48 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -17,6 +17,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
@@ -132,6 +133,7 @@ struct keystone_pcie {
 	struct			device_node *msi_intc_np;
 	struct irq_domain	*intx_irq_domain;
 	struct device_node	*np;
+	struct gpio_desc	*reset_gpio;
 
 	/* Application register space */
 	void __iomem		*va_app_base;	/* DT 1st resource */
@@ -1211,6 +1213,7 @@ static const struct of_device_id ks_pcie_of_match[] = {
 	},
 	{ },
 };
+MODULE_DEVICE_TABLE(of, ks_pcie_of_match);
 
 static int ks_pcie_probe(struct platform_device *pdev)
 {
@@ -1329,6 +1332,7 @@ static int ks_pcie_probe(struct platform_device *pdev)
 			dev_err(dev, "Failed to get reset GPIO\n");
 		goto err_link;
 	}
+	ks_pcie->reset_gpio = gpiod;
 
 	/* Obtain references to the PHYs */
 	for (i = 0; i < num_lanes; i++)
@@ -1440,9 +1444,23 @@ static void ks_pcie_remove(struct platform_device *pdev)
 {
 	struct keystone_pcie *ks_pcie = platform_get_drvdata(pdev);
 	struct device_link **link = ks_pcie->link;
+	struct dw_pcie *pci = ks_pcie->pci;
 	int num_lanes = ks_pcie->num_lanes;
+	const struct ks_pcie_of_data *data;
 	struct device *dev = &pdev->dev;
+	enum dw_pcie_device_mode mode;
+
+	ks_pcie_disable_error_irq(ks_pcie);
+	data = of_device_get_match_data(dev);
+	mode = data->mode;
+	if (mode == DW_PCIE_RC_TYPE) {
+		dw_pcie_host_deinit(&pci->pp);
+	} else {
+		pci_epc_deinit_notify(pci->ep.epc);
+		dw_pcie_ep_deinit(&pci->ep);
+	}
 
+	gpiod_set_value_cansleep(ks_pcie->reset_gpio, 0);
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
 	ks_pcie_disable_phy(ks_pcie);
@@ -1459,3 +1477,7 @@ static struct platform_driver ks_pcie_driver = {
 	},
 };
 builtin_platform_driver(ks_pcie_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("PCIe host controller driver for Texas Instruments Keystone SoCs");
+MODULE_AUTHOR("Murali Karicheri <m-karicheri2@ti.com>");
-- 
2.43.0


