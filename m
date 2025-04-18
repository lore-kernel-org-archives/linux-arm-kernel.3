Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551F4C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALx3OwONbiKV86DkkxNexBFSZ9zvI3K6YFsdRD8NtRk=; b=2UjUdVSsKeil063sMDIgd7QMBK
	io7LwP4bZcTdykqi8suMR166FPS90PlxJLdlzapXn46gaOlH7PHFi9LioO5beab6YrS9A4+EAwKzM
	jpuZ8ZGt3aezFIWkt/Yv1MXC8mEHacHMEmIocu1nY3Tt/jP6DifYVTwaE0tL8eXwMuXtYBsb9wd2B
	lqUXWnwzX2lZTbhDoGfjBHCtYLWRJlvQE7eUpu9wX1xaNrcEKwjdxcdI3A5V1Tw9wE50p9AV84ltf
	f+5thlWxGbhOy9wcoR5bmUpObaMedqvdwj4IgSvkQZ+hS61D16B+e4PYwKf9S9h98SA8WQO+3HSqA
	GioiJmhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gig-0000000FZOr-1CEc;
	Fri, 18 Apr 2025 08:05:06 +0000
Received: from mta-64-227.siemens.flowmailer.net ([185.136.64.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gC6-0000000FTjv-14zI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:31:27 +0000
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202504180731223c4d484e9a6d28b59f
        for <linux-arm-kernel@lists.infradead.org>;
        Fri, 18 Apr 2025 09:31:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ALx3OwONbiKV86DkkxNexBFSZ9zvI3K6YFsdRD8NtRk=;
 b=FGR5STVpHPnc737lEOHV92SGfESAT3wC999XDSSTRxtJoJfvwUOXmmWGfwDzNDQjWq9GTr
 BsRdrs4u7vOxmFEJ0fVbsVFds4XqCbr5bC7binOncA+IGZxamh/0hKIWvqr3ge5LN8xqOzZ+
 Jv2nT8Q+19YS7mlmKdt+lxn0aB4lKUK2aq6lXhDdyEETFhE61KIL93FwV9AB+B39Zolu2rMD
 LX4x86telj8rRvbyIRTiU/9e3lMbYmWF2jrK6eXHVA+YRfJq0SSfNPZQp+qCbdJPO5+fTM5C
 f/c7Rrd3k+5ECYEB2QZsbSNGDj7e3qgBOdGvEkFSyLq28jd7l3LlzaJA==;
From: huaqian.li@siemens.com
To: helgaas@kernel.org,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Cc: baocheng.su@siemens.com,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diogo.ivo@siemens.com,
	huaqian.li@siemens.com,
	jan.kiszka@siemens.com,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	nm@ti.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	ssantosh@kernel.org,
	vigneshr@ti.com,
	iommu@lists.linux.dev
Subject: [PATCH v7 4/8] PCI: keystone: Add support for PVU-based DMA isolation on AM654
Date: Fri, 18 Apr 2025 15:30:22 +0800
Message-Id: <20250418073026.2418728-5-huaqian.li@siemens.com>
In-Reply-To: <20250418073026.2418728-1-huaqian.li@siemens.com>
References: <20241030205703.GA1219329@bhelgaas>
 <20250418073026.2418728-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_003126_440338_3B652E8D 
X-CRM114-Status: GOOD (  20.43  )
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

From: Jan Kiszka <jan.kiszka@siemens.com>

The AM654 lacks an IOMMU, thus does not support isolating DMA requests
from untrusted PCI devices to selected memory regions this way. Use
static PVU-based protection instead. The PVU, when enabled, will only
accept DMA requests that address previously configured regions.

Use the availability of a restricted-dma-pool memory region as trigger
and register it as valid DMA target with the PVU. In addition, enable
the mapping of requester IDs to VirtIDs in the PCI RC. Use only a single
VirtID so far, catching all devices. This may be extended later on.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
---
 drivers/pci/controller/dwc/pci-keystone.c | 106 ++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 76a37368ae4f..30aaaf28d6a4 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -19,6 +19,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/msi.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_pci.h>
 #include <linux/phy/phy.h>
@@ -26,6 +27,7 @@
 #include <linux/regmap.h>
 #include <linux/resource.h>
 #include <linux/signal.h>
+#include <linux/ti-pvu.h>
 
 #include "../../pci.h"
 #include "pcie-designware.h"
@@ -111,6 +113,16 @@
 
 #define PCI_DEVICE_ID_TI_AM654X		0xb00c
 
+#define KS_PCI_VIRTID			0
+
+#define PCIE_VMAP_xP_CTRL		0x0
+#define PCIE_VMAP_xP_REQID		0x4
+#define PCIE_VMAP_xP_VIRTID		0x8
+
+#define PCIE_VMAP_xP_CTRL_EN		BIT(0)
+
+#define PCIE_VMAP_xP_VIRTID_VID_MASK	0xfff
+
 struct ks_pcie_of_data {
 	enum dw_pcie_device_mode mode;
 	const struct dw_pcie_host_ops *host_ops;
@@ -1137,6 +1149,94 @@ static const struct of_device_id ks_pcie_of_match[] = {
 	{ },
 };
 
+static int ks_init_vmap(struct platform_device *pdev, const char *vmap_name)
+{
+	struct resource *res;
+	void __iomem *base;
+	u32 val;
+
+	if (!IS_ENABLED(CONFIG_TI_PVU))
+		return 0;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, vmap_name);
+	base = devm_pci_remap_cfg_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	writel(0, base + PCIE_VMAP_xP_REQID);
+
+	val = readl(base + PCIE_VMAP_xP_VIRTID);
+	val &= ~PCIE_VMAP_xP_VIRTID_VID_MASK;
+	val |= KS_PCI_VIRTID;
+	writel(val, base + PCIE_VMAP_xP_VIRTID);
+
+	val = readl(base + PCIE_VMAP_xP_CTRL);
+	val |= PCIE_VMAP_xP_CTRL_EN;
+	writel(val, base + PCIE_VMAP_xP_CTRL);
+
+	return 0;
+}
+
+static int ks_init_restricted_dma(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct of_phandle_iterator it;
+	struct resource phys;
+	int err;
+
+	if (!IS_ENABLED(CONFIG_TI_PVU))
+		return 0;
+
+	/* Only process the first restricted DMA pool, more are not allowed */
+	of_for_each_phandle(&it, err, dev->of_node, "memory-region",
+			    NULL, 0) {
+		if (of_device_is_compatible(it.node, "restricted-dma-pool"))
+			break;
+	}
+	if (err)
+		return err == -ENOENT ? 0 : err;
+
+	err = of_address_to_resource(it.node, 0, &phys);
+	if (err < 0) {
+		dev_err(dev, "failed to parse memory region %pOF: %d\n",
+			it.node, err);
+		return 0;
+	}
+
+	/* Map all incoming requests on low and high prio port to virtID 0 */
+	err = ks_init_vmap(pdev, "vmap_lp");
+	if (err)
+		return err;
+	err = ks_init_vmap(pdev, "vmap_hp");
+	if (err)
+		return err;
+
+	/*
+	 * Enforce DMA pool usage with the help of the PVU.
+	 * Any request outside will be dropped and raise an error at the PVU.
+	 */
+	return ti_pvu_create_region(KS_PCI_VIRTID, &phys);
+}
+
+static void ks_release_restricted_dma(struct platform_device *pdev)
+{
+	struct of_phandle_iterator it;
+	struct resource phys;
+	int err;
+
+	if (!IS_ENABLED(CONFIG_TI_PVU))
+		return;
+
+	of_for_each_phandle(&it, err, pdev->dev.of_node, "memory-region",
+			    NULL, 0) {
+		if (of_device_is_compatible(it.node, "restricted-dma-pool") &&
+		    of_address_to_resource(it.node, 0, &phys) == 0) {
+			ti_pvu_remove_region(KS_PCI_VIRTID, &phys);
+			break;
+		}
+	}
+}
+
 static int ks_pcie_probe(struct platform_device *pdev)
 {
 	const struct dw_pcie_host_ops *host_ops;
@@ -1285,6 +1385,10 @@ static int ks_pcie_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_get_sync;
 
+	ret = ks_init_restricted_dma(pdev);
+	if (ret < 0)
+		goto err_get_sync;
+
 	switch (mode) {
 	case DW_PCIE_RC_TYPE:
 		if (!IS_ENABLED(CONFIG_PCI_KEYSTONE_HOST)) {
@@ -1366,6 +1470,8 @@ static void ks_pcie_remove(struct platform_device *pdev)
 	int num_lanes = ks_pcie->num_lanes;
 	struct device *dev = &pdev->dev;
 
+	ks_release_restricted_dma(pdev);
+
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
 	ks_pcie_disable_phy(ks_pcie);
-- 
2.34.1


