Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45C4CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 22:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCSgEGxqrKkW4tQWVEb2obBRfbgXfhgd/LNbZr68fQU=; b=Ns1N0p+s3VSU/SKtFxgOnvapSq
	fjRoFPl36w471D6f94R/mjCZu2Xv/SvZNpbcBTzksD1gWfWp7Dbbwlr+65usA1TtiVzkmxCgj+Y2f
	cG5et1iEG8LX9LalFF9GkaAdZ/c4qL/ibvSwDVEYrmhnAfg1Ax35FqcYVcId2SbVGNl6d6WEyWSZP
	z36eWYPJuaD3aFCmvVZm977cqkya1JwsAc78gZAxMJ8ETBOR7EdKTyLzO/15Z2vv1FqgszEi0UZ6Z
	hHSDDRf8LgUAQGb0H99RawoaQI5WSE9N+t8xGVjpbt02OiL3dpu/xoi+Ia9lhNVmzOIEyVruaUtY1
	3y3WZDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGkc6-0000000E7B4-2ciE;
	Tue, 13 Oct 2026 22:04:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGkc5-0000000E7Ag-2FfN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 22:04:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E2AFA60214;
	Tue, 13 Oct 2026 22:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4091F00898;
	Tue, 13 Oct 2026 22:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791929088;
	bh=jCSgEGxqrKkW4tQWVEb2obBRfbgXfhgd/LNbZr68fQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BN+4oJ02D0ywdFvJsLoN0AZeasbdwaRZALns4Gp/E/6dhp55FMwxlEzqXc+pCNpBI
	 MNFDdBozSYdFJthvwqSaj3pYp5kCj2qoUqGg/HnMK5qTvsRuCmDN7P8uT3INiiK/5l
	 hlLthbK7AYGAYMhLopqCs9HIah7cJ2TuzAti7DRNNXHLTJLNz8Oso++Tunh77hXnPG
	 J6RPHdJ7twpeE2saZHosSMCLXuPglg37Q30BevonXhotN696a/3ge1JGUPslGNVvJz
	 pomKqU4e/OALAW2hwmT24001gqKte1QSQ4VGGH6m8PWYw4RjuR8JYXzYWGWlXZa0e1
	 /bMC7kJCgp6nQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Semih Baskan <strst.gs@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Rosen Penev <rosenp@gmail.com>,
	Rani Hod <rani.hod@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v4 2/2] PCI: iproc: Use the EROM outbound window on BCMA
Date: Tue, 13 Oct 2026 17:04:21 -0500
Message-ID: <20261013220421.1588051-3-bhelgaas@google.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013220421.1588051-1-bhelgaas@google.com>
References: <20261013220421.1588051-1-bhelgaas@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The PCIe outbound window base on Northstar depends on the PCIe Gen2 core
revision. Revision 0x01 uses 0x08000000, 0x40000000 and 0x48000000 for
controllers 0 to 2, while revision 0x07 (NS-B0) uses 0x08000000,
0x20000000 and 0x28000000. Broadcom's own driver branches on the core
revision for exactly this reason.

bcm-ns.dtsi is shared by every Northstar SoC, so it cannot carry a value
that is correct on both. Commit 767012397976 ("ARM: dts: BCM5301X:
Describe PCIe controllers fully") gave the controllers a ranges property.
The commit shipped in v7.1.

With that property present, two things go wrong with this driver:

  1) devm_pci_alloc_host_bridge() parses those ranges and requests them,
     then this driver adds its own window and requests the whole list a
     second time, so every controller fails to probe with -EBUSY.

  2) The DT window itself is only correct on core revision 0x07. On
     revision 0x01 it points at an address the hardware does not decode,
     and the first MMIO access to a BAR takes an imprecise external abort.

The enumeration ROM reports the correct base for the revision actually
present, and bcma already provides it as addr_s[0].

To solve 1), use pci_alloc_host_bridge() directly to avoid the request of
all the DT resources done in pci_parse_request_of_pci_ranges(). Instead,
request the memory window from the EROM.

To solve 2), parse the memory resources from DT and emit a warning if it
describes a window that doesn't match the window from the EROM.  The
mismatch means the devicetree describes a window the hardware does not
decode, and that should be fixed in the dts rather than ignored silently.

The driver is correct whether or not the DT describes a window.

The same commit also added compatible = "brcm,iproc-pcie", so these
nodes now match pcie-iproc-platform. With CONFIG_PCIE_IPROC_PLATFORM
enabled, which is the default on ARCH_BCM_IPROC, that driver binds them
first and this driver's probe fails inside devm_pci_alloc_host_bridge().
This commit fixes the configurations where the BCMA driver is the one in
use; OpenWrt builds that way, with PCIE_IPROC_PLATFORM disabled. The
platform path takes the DT window as-is and has the same wrong address
on core revision 0x01, so that side needs a devicetree fix either way.

Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")

Based on:
  https://patch.msgid.link/20260807160526.379-1-strst.gs@gmail.com
  https://patch.msgid.link/20260912043626.437-1-strst.gs@gmail.com
---
 drivers/pci/controller/pcie-iproc-bcma.c | 40 ++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc-bcma.c b/drivers/pci/controller/pcie-iproc-bcma.c
index 593418c2bc3a..1e258cd8fed4 100644
--- a/drivers/pci/controller/pcie-iproc-bcma.c
+++ b/drivers/pci/controller/pcie-iproc-bcma.c
@@ -11,7 +11,9 @@
 #include <linux/phy/phy.h>
 #include <linux/bcma/bcma.h>
 #include <linux/ioport.h>
+#include <linux/of_address.h>
 
+#include "../pci.h"
 #include "pcie-iproc.h"
 
 
@@ -31,6 +33,29 @@ static int iproc_bcma_pcie_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 	return bcma_core_irq(bdev, 5);
 }
 
+static void iproc_bcma_pcie_check_dt_window(struct iproc_pcie *pcie)
+{
+	struct device_node *np = pcie->dev->of_node;
+	struct of_pci_range_parser parser;
+	struct of_pci_range range;
+	struct resource res;
+
+	if (!np || of_pci_range_parser_init(&parser, np))
+		return;
+
+	for_each_of_pci_range(&parser, &range) {
+		if ((range.flags & IORESOURCE_TYPE_BITS) != IORESOURCE_MEM)
+			continue;
+
+		if (of_pci_range_to_resource(&range, np, &res))
+			continue;
+
+		if (res.start != pcie->mem.start || res.end != pcie->mem.end)
+			dev_warn(pcie->dev, "DT window %pR does not match EROM window %pR, using EROM\n",
+				 &res, &pcie->mem);
+	}
+}
+
 static int iproc_bcma_pcie_probe(struct bcma_device *bdev)
 {
 	struct device *dev = &bdev->dev;
@@ -38,10 +63,20 @@ static int iproc_bcma_pcie_probe(struct bcma_device *bdev)
 	struct pci_host_bridge *bridge;
 	int ret;
 
-	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
+	bridge = pci_alloc_host_bridge(sizeof(*pcie));
 	if (!bridge)
 		return -ENOMEM;
 
+	bridge->dev.parent = dev;
+
+	ret = devm_add_action_or_reset(dev, devm_pci_alloc_host_bridge_release,
+				       bridge);
+	if (ret)
+		return -ENOMEM;
+
+	bridge->swizzle_irq = pci_common_swizzle;
+	bridge->map_irq = iproc_bcma_pcie_map_irq;
+
 	pcie = pci_host_bridge_priv(bridge);
 
 	pcie->dev = dev;
@@ -59,13 +94,12 @@ static int iproc_bcma_pcie_probe(struct bcma_device *bdev)
 	pcie->mem.end = bdev->addr_s[0] + SZ_128M - 1;
 	pcie->mem.name = "PCIe MEM space";
 	pcie->mem.flags = IORESOURCE_MEM;
+	iproc_bcma_pcie_check_dt_window(pcie);
 	pci_add_resource(&bridge->windows, &pcie->mem);
 	ret = devm_request_pci_bus_resources(dev, &bridge->windows);
 	if (ret)
 		return ret;
 
-	bridge->map_irq = iproc_bcma_pcie_map_irq;
-
 	bcma_set_drvdata(bdev, pcie);
 
 	return iproc_pcie_setup(pcie, &bridge->windows);
-- 
2.53.0


