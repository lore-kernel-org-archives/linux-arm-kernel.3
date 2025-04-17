Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE532C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8M88KBaqHzx9aYK5NMXzvXq7V91girAkEFtv41NSl4=; b=PE8oURUY5dvTem3b3egrKURH1W
	Ww5Kkc0zfWBXOTMlCOXLiAr2qBJGexSyrjE8gGrW+xgHMkPnLwk/4yHeeICwJIu9Fti0qP7gGM2m0
	LQWauzZXXAUaCBF6LAs0Bz6i57I6C44r+wqryVX1KVzZ+3hJ6BqgQB706ePhdp+crrsxpZBD2EO3k
	Jo0MYTnNaPlFSe8VcMHDMSsRG5SV68DnIsWe3LaYF7N1OusjmdTQrUjf813XD0BNUNA/F1iX+iwZd
	GxpOOZ/KGQMzFlWH0dkyDi0eRZuk/7Qdm3qv/m9Uo92IvjRwskukY96D3YRaOFZ14w+ImxIgs3khb
	BfVp482g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PlB-0000000DEFx-0VOb;
	Thu, 17 Apr 2025 13:58:33 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Obb-0000000D1kD-1uD2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 12:44:38 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCiJ2P628373
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744893859;
	bh=e8M88KBaqHzx9aYK5NMXzvXq7V91girAkEFtv41NSl4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pU6DwdqcUyMAgCu5NRahhQQvuy+emX543+4ZZ2GP3kxOqdW7emg/1Y9WhcD455zkq
	 sI7aIF5ehOTeH/QN0TOMset4Pp9G6P7HXgg06SIvTK5eVnCHbKuE7apG4a+4LoZgMo
	 y0WdAS49U3ynonBnbBcsgptv7lxXkYW5Da/9MFuc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCiJHb101141
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:44:19 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:44:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:44:19 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HCi9XC048918;
	Thu, 17 Apr 2025 07:44:14 -0500
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
Subject: [PATCH v4 1/4] PCI: cadence: Add support to build pcie-cadence library as a kernel module
Date: Thu, 17 Apr 2025 18:14:05 +0530
Message-ID: <20250417124408.2752248-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417124408.2752248-1-s-vadapalli@ti.com>
References: <20250417124408.2752248-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_054435_593746_5CBEA059 
X-CRM114-Status: GOOD (  14.95  )
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

From: Kishon Vijay Abraham I <kishon@ti.com>

Currently, the Cadence PCIe controller driver can be built as a built-in
module only. Since PCIe functionality is not a necessity for booting, add
support to build the Cadence PCIe driver as a loadable module as well.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

v3 patch is at:
https://lore.kernel.org/r/20250410104426.463453-2-s-vadapalli@ti.com/
No changes since v3.

Regards,
Siddharth.

 drivers/pci/controller/cadence/Kconfig             |  6 +++---
 drivers/pci/controller/cadence/pcie-cadence-ep.c   |  6 ++++++
 drivers/pci/controller/cadence/pcie-cadence-host.c |  9 +++++++++
 drivers/pci/controller/cadence/pcie-cadence.c      | 12 ++++++++++++
 drivers/pci/controller/cadence/pcie-cadence.h      |  4 ++--
 5 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
index 8a0044bb3989..82b58096eea0 100644
--- a/drivers/pci/controller/cadence/Kconfig
+++ b/drivers/pci/controller/cadence/Kconfig
@@ -4,16 +4,16 @@ menu "Cadence-based PCIe controllers"
 	depends on PCI
 
 config PCIE_CADENCE
-	bool
+	tristate
 
 config PCIE_CADENCE_HOST
-	bool
+	tristate
 	depends on OF
 	select IRQ_DOMAIN
 	select PCIE_CADENCE
 
 config PCIE_CADENCE_EP
-	bool
+	tristate
 	depends on OF
 	depends on PCI_ENDPOINT
 	select PCIE_CADENCE
diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
index 599ec4b1223e..b4bcef2d020a 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
@@ -6,6 +6,7 @@
 #include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pci-epc.h>
 #include <linux/platform_device.h>
@@ -751,3 +752,8 @@ int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(cdns_pcie_ep_setup);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Cadence PCIe endpoint controller driver");
+MODULE_AUTHOR("Cyrille Pitchen <cyrille.pitchen@free-electrons.com>");
diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 8af95e9da7ce..96055edeb099 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -5,6 +5,7 @@
 
 #include <linux/delay.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/list_sort.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
@@ -72,6 +73,7 @@ void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
 
 	return rc->cfg_base + (where & 0xfff);
 }
+EXPORT_SYMBOL_GPL(cdns_pci_map_bus);
 
 static struct pci_ops cdns_pcie_host_ops = {
 	.map_bus	= cdns_pci_map_bus,
@@ -495,6 +497,7 @@ int cdns_pcie_host_init(struct cdns_pcie_rc *rc)
 
 	return cdns_pcie_host_init_address_translation(rc);
 }
+EXPORT_SYMBOL_GPL(cdns_pcie_host_init);
 
 int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
 {
@@ -519,6 +522,7 @@ int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(cdns_pcie_host_link_setup);
 
 int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 {
@@ -581,3 +585,8 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(cdns_pcie_host_setup);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Cadence PCIe host controller driver");
+MODULE_AUTHOR("Cyrille Pitchen <cyrille.pitchen@free-electrons.com>");
diff --git a/drivers/pci/controller/cadence/pcie-cadence.c b/drivers/pci/controller/cadence/pcie-cadence.c
index 204e045aed8c..70a19573440e 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.c
+++ b/drivers/pci/controller/cadence/pcie-cadence.c
@@ -4,6 +4,7 @@
 // Author: Cyrille Pitchen <cyrille.pitchen@free-electrons.com>
 
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 
 #include "pcie-cadence.h"
@@ -23,6 +24,7 @@ void cdns_pcie_detect_quiet_min_delay_set(struct cdns_pcie *pcie)
 
 	cdns_pcie_writel(pcie, CDNS_PCIE_LTSSM_CONTROL_CAP, ltssm_control_cap);
 }
+EXPORT_SYMBOL_GPL(cdns_pcie_detect_quiet_min_delay_set);
 
 void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 busnr, u8 fn,
 				   u32 r, bool is_io,
@@ -100,6 +102,7 @@ void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 busnr, u8 fn,
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_CPU_ADDR0(r), addr0);
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_CPU_ADDR1(r), addr1);
 }
+EXPORT_SYMBOL_GPL(cdns_pcie_set_outbound_region);
 
 void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie,
 						  u8 busnr, u8 fn,
@@ -134,6 +137,7 @@ void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie,
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_CPU_ADDR0(r), addr0);
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_CPU_ADDR1(r), addr1);
 }
+EXPORT_SYMBOL_GPL(cdns_pcie_set_outbound_region_for_normal_msg);
 
 void cdns_pcie_reset_outbound_region(struct cdns_pcie *pcie, u32 r)
 {
@@ -146,6 +150,7 @@ void cdns_pcie_reset_outbound_region(struct cdns_pcie *pcie, u32 r)
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_CPU_ADDR0(r), 0);
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_CPU_ADDR1(r), 0);
 }
+EXPORT_SYMBOL_GPL(cdns_pcie_reset_outbound_region);
 
 void cdns_pcie_disable_phy(struct cdns_pcie *pcie)
 {
@@ -156,6 +161,7 @@ void cdns_pcie_disable_phy(struct cdns_pcie *pcie)
 		phy_exit(pcie->phy[i]);
 	}
 }
+EXPORT_SYMBOL_GPL(cdns_pcie_disable_phy);
 
 int cdns_pcie_enable_phy(struct cdns_pcie *pcie)
 {
@@ -184,6 +190,7 @@ int cdns_pcie_enable_phy(struct cdns_pcie *pcie)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(cdns_pcie_enable_phy);
 
 int cdns_pcie_init_phy(struct device *dev, struct cdns_pcie *pcie)
 {
@@ -243,6 +250,7 @@ int cdns_pcie_init_phy(struct device *dev, struct cdns_pcie *pcie)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(cdns_pcie_init_phy);
 
 static int cdns_pcie_suspend_noirq(struct device *dev)
 {
@@ -271,3 +279,7 @@ const struct dev_pm_ops cdns_pcie_pm_ops = {
 	NOIRQ_SYSTEM_SLEEP_PM_OPS(cdns_pcie_suspend_noirq,
 				  cdns_pcie_resume_noirq)
 };
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Cadence PCIe controller driver");
+MODULE_AUTHOR("Cyrille Pitchen <cyrille.pitchen@free-electrons.com>");
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 39ee9945c903..4b7f295e24e7 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -519,7 +519,7 @@ static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
 	return true;
 }
 
-#ifdef CONFIG_PCIE_CADENCE_HOST
+#if IS_ENABLED(CONFIG_PCIE_CADENCE_HOST)
 int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc);
 int cdns_pcie_host_init(struct cdns_pcie_rc *rc);
 int cdns_pcie_host_setup(struct cdns_pcie_rc *rc);
@@ -548,7 +548,7 @@ static inline void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int d
 }
 #endif
 
-#ifdef CONFIG_PCIE_CADENCE_EP
+#if IS_ENABLED(CONFIG_PCIE_CADENCE_EP)
 int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep);
 #else
 static inline int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
-- 
2.34.1


