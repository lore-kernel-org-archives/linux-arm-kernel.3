Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700A9CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j54wOZWYBv+WbN005PAbMoK18i+fCxKDRhnfRbi4+us=; b=BUk2nPuz+wttz2QRVVzjBcvzrX
	dpoEjKVXc5oHJffl7+BRol886a6mbqivPfkwK5Q/BSCFXqS4PTAOk+1oezuHwpsV7IMPKJzdJ8i8V
	O2basGxvf4SjNO0VSWg999IG65jK7O3mTKlXR7XJlXq2q605kyJ8+LYHOUIPuHLxPaep4x2r3jlM5
	xR87AFo5xFSfw80zfOZZRK0NaCyyWW0W19cKkbTRPU1MOTF60dPULYosu5CasSMYG84jHNjbrJJHm
	SucVsn8/QoFuTgFP8O52X+qxDZ3CYnmYFIA4lL4Q5R8f0U+V7eiwbn6chywCXSxzSzFci1QS1mzYx
	8Q2NRdjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ajZ-000000098nJ-2edC;
	Mon, 22 Sep 2025 07:13:13 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ajU-000000098hR-3MOk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 07:13:10 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58M7CtrF1183992;
	Mon, 22 Sep 2025 02:12:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758525175;
	bh=j54wOZWYBv+WbN005PAbMoK18i+fCxKDRhnfRbi4+us=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ODtkd9rvjsNmSLZAf1hHJLQWGt8iDGDyUsmgQDF+VzVh6/eFBIgBsFplpdpj6cDzP
	 WN8yOUfrnkMHZLZ0gYHyGPiqJqfWre+pQV/HXb6GZi/QOQ0v2pQXDsLJYImx7O+b63
	 x1aigCD7Ryelsnw/9wrcfsyHo9JNBnPmz/TQlKeo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58M7CtXs118005
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 02:12:55 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 02:12:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 02:12:54 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58M7CN0V2369246;
	Mon, 22 Sep 2025 02:12:48 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <christian.bruel@foss.st.com>, <quic_wenbyao@quicinc.com>,
        <inochiama@gmail.com>, <mayank.rana@oss.qualcomm.com>,
        <thippeswamy.havalige@amd.com>, <shradha.t@samsung.com>,
        <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>, <jirislaby@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v3 4/4] PCI: keystone: Add support to build as a loadable module
Date: Mon, 22 Sep 2025 12:42:16 +0530
Message-ID: <20250922071222.2814937-5-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922071222.2814937-1-s-vadapalli@ti.com>
References: <20250922071222.2814937-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_001308_939689_B978B34B 
X-CRM114-Status: GOOD (  16.09  )
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

v2 of this patch is at:
https://lore.kernel.org/r/20250912122356.3326888-11-s-vadapalli@ti.com/
Changes since v2:
- Based on Mani's feedback, all code changes associated with driver
  removal have been discarded.

 drivers/pci/controller/dwc/Kconfig        | 6 +++---
 drivers/pci/controller/dwc/pci-keystone.c | 6 ++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

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
index f9f8235ea3cd..2fbc714bb6e5 100644
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
@@ -1134,6 +1135,7 @@ static const struct of_device_id ks_pcie_of_match[] = {
 	},
 	{ },
 };
+MODULE_DEVICE_TABLE(of, ks_pcie_of_match);
 
 static int ks_pcie_probe(struct platform_device *pdev)
 {
@@ -1382,3 +1384,7 @@ static struct platform_driver ks_pcie_driver = {
 	},
 };
 builtin_platform_driver(ks_pcie_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("PCIe host controller driver for Texas Instruments Keystone SoCs");
+MODULE_AUTHOR("Murali Karicheri <m-karicheri2@ti.com>");
-- 
2.43.0


