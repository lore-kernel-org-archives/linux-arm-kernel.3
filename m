Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9EECF45C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 19:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xpxn4R0gOPfxcyAbXyc3KA0CINt5vkULnqTOZ4ZLzic=; b=sq0rcbd7HEKA2LrLGqhf8QLUr7
	MNQNdqZXdZ9yf0KlQEPY8XSKTrS7EZPKNtz/2rq9jtSCzB0TApLctr+cWPhQNlj5H8cd8FnLIGdjz
	NM8z5Ev+qpAT93fHfI1eFHCykr20zQUl+bRZrNLwxkVwBB4qulqXXKDp/VibCoWy4LOHDDipCOjFd
	P8XjNT4lc8KkohCAZ1k4HZkW4n1vNMdXLUIksSpIZgC/MOUfQNDoffLJq3dfwVRh80DVP+vElnuPj
	Szgw6BRm5uJ1l9FdkkCu09gRoPlB8i4+zxiglV3VwHj8E/XcbRERVjuHC22q74AXQB3tr1fNVjG7B
	k1upBklA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNQ6-00000005yJQ-3BnU;
	Mon, 12 Jan 2026 19:17:42 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNQ4-00000005yHG-1bcW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 19:17:42 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vfNPd-0003nP-0Y; Mon, 12 Jan 2026 20:17:13 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 12 Jan 2026 20:17:11 +0100
Subject: [PATCH] PCI: layerscape: Allow to compile as module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-v6-19-topic-layerscape-pcie-v1-1-1cd863fce50e@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIALZIZWkC/x3MQQqAIBAAwK/EnltwrQT7SnQw22ohSjSiiP6ed
 JzLPJA4Cidoiwcin5Jk3zKoLMAvbpsZZcwGrbRRRBpPg2Tx2IN4XN3NMXkXGIMXRjuSGkxTa6o
 s5CFEnuT6965/3w/uII1AbQAAAA==
X-Change-ID: 20260112-v6-19-topic-layerscape-pcie-9d10b6542139
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
 Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_111740_450743_6B52F401 
X-CRM114-Status: GOOD (  14.83  )
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

From: Sascha Hauer <s.hauer@pengutronix.de>

The layerscape pcie host controller could also be compiled as module.
Add the necessary infrastructure to allow building as module instead of
only as builtin driver.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/pci/controller/dwc/Kconfig          |  2 +-
 drivers/pci/controller/dwc/pci-layerscape.c | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 519b59422b479..abfa4a6e62c25 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -121,7 +121,7 @@ config PCI_IMX6_EP
 	  DesignWare core functions to implement the driver.
 
 config PCI_LAYERSCAPE
-	bool "Freescale Layerscape PCIe controller (host mode)"
+	tristate "Freescale Layerscape PCIe controller (host mode)"
 	depends on OF && (ARM || ARCH_LAYERSCAPE || COMPILE_TEST)
 	depends on PCI_MSI
 	select PCIE_DW_HOST
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index a44b5c256d6e2..14d6ac4fc53fd 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -13,6 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
+#include <linux/module.h>
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
 #include <linux/of_address.h>
@@ -403,8 +404,16 @@ static const struct dev_pm_ops ls_pcie_pm_ops = {
 	NOIRQ_SYSTEM_SLEEP_PM_OPS(ls_pcie_suspend_noirq, ls_pcie_resume_noirq)
 };
 
+static void ls_pcie_remove(struct platform_device *pdev)
+{
+	struct ls_pcie *pcie = platform_get_drvdata(pdev);
+
+	dw_pcie_host_deinit(&pcie->pci->pp);
+}
+
 static struct platform_driver ls_pcie_driver = {
 	.probe = ls_pcie_probe,
+	.remove = ls_pcie_remove,
 	.driver = {
 		.name = "layerscape-pcie",
 		.of_match_table = ls_pcie_of_match,
@@ -412,4 +421,9 @@ static struct platform_driver ls_pcie_driver = {
 		.pm = &ls_pcie_pm_ops,
 	},
 };
-builtin_platform_driver(ls_pcie_driver);
+module_platform_driver(ls_pcie_driver);
+
+MODULE_AUTHOR("Minghuan Lian <Minghuan.Lian@freescale.com>");
+MODULE_DESCRIPTION("Layerscape PCIe host controller driver");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(of, ls_pcie_of_match);

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260112-v6-19-topic-layerscape-pcie-9d10b6542139

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>


