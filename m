Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC29AC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 04:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UA9WVjEDN9IXL+AcnME2x3yVc4Y0zRQ+FWtK13UcSNc=; b=lUkm2ITrbSn+PceBbvPnRI0PPh
	nYVg+d9SONf+izO8OHO7vhCFwj9tOG4twz2if2w0k8w8dgMMiyv5jWr404AXjQpdByPS0CWehtEKo
	cGVUE5Tkga3gWBnqJHjmomvwhHk3OmbRPuiTQqVRl7LEDQZbC3ycJfpxia1O6u4k9TjkvtVUCG2c3
	/ST7WfCYlVCc7pnAhdZWkVs0mja55B4q0cz22nVBAsB4sKkWjX1m/e3FyFMIF1nxvOclASEqDdp0n
	hjXYPqpwojZfLvPbg+W4Hvz8NMNSktbPvxlCflJrhA7BVn/80KNMoZAerXclgy+SQzvOhJMnnDBo8
	4tiU33cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5FTt-00000000Wwb-0FdX;
	Sat, 12 Sep 2026 04:36:49 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5FTq-00000000WwC-0vnO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 04:36:47 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6356256so123503f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 21:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789187803; x=1789792603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UA9WVjEDN9IXL+AcnME2x3yVc4Y0zRQ+FWtK13UcSNc=;
        b=gFMkqWMhdTyqDzoHzXDBnWTeBdeoU93MhsmcCi0PbdaRurh+5oW1QBNzcx7YmRM1Ru
         lN9KoQUe8K/6rwS3ku6px+9Gatc7LYhf4bSZ3sHFiUHSPpRjGGueAu0MC7hJtLvbFWiA
         S3y69qVfNrqW/fWEid75gjQZwBWdmldAvbZYSymkxarUMCf3aGlvWl+vf+0GR1pa0fQI
         396zxLM0EoCW5JJzidF4YxcV+PtR/rkDZUfv0083mLatE+1SJfJsIwW7Oiu4tY8l9WZy
         5Vt3SwWFyHWqbsCeLSNvM620rP3vWXLUB0mC/kE/gThicx6uJWNZk4vCONRTMm1nW0yq
         a4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789187803; x=1789792603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UA9WVjEDN9IXL+AcnME2x3yVc4Y0zRQ+FWtK13UcSNc=;
        b=pkAfRIaZGwFHKIvSL7wv5hmekzh7t3HUSPrfuvC0ZpcTGFVCXSLsdr4BxmzfYAz2U1
         dWUR/f1zSlY64oXb6yndcUPHHPvQJdtje6RxfYnhifAi2gHRhTng49V0XiLyQQMs+m/6
         nMJisBgl5Lic1GsAp4XpRm5kA76C9QCBaiAogBT6wZuDR/MVvFNr1P6dH7NeGmKEMH4Z
         yOCwUkfKCwtwJiw7VTMXy01bAbmF6YVDhpRjl7WbFCSJlIzyIBpnL4VLeJBCbBkMpmVd
         6oS9ZJPbxJgXVJQdZU819Rv3+HQc1RTP8uUi43JVb23K0sCZHNjmZ7ovz0ngbwgmvPEZ
         gbXA==
X-Forwarded-Encrypted: i=1; AKwUvBzt/QC5DkZferCLMc2Nu9MUOUmHSky0qls6KBtP4z2Xn69P+fePHA6xwDvG4VHb4jUaWVqmIWREtLfwb3c2W6/0@lists.infradead.org
X-Gm-Message-State: AFuF++nGu05OmSJX+p9FGCt7HcgmzWUPTxhx+wZf9/378SKNSE0ohMtQ
	qzbtqocxKxRiZemjS+iD7mZcDW9hfIgKy3Z+NHfGyCVVgn702UmL35Ov
X-Gm-Gg: AYBFou13qqHKx2Q1jWY+hiXFS7rXKw41pn0mJ/WfwowC1gNungNf3MgUbpVqKQ7igDo
	wkUz7SO03HvKJ+Qkt5Ysg/DvzIv4MaeUITO/3Drr3xjOjs9VOdLnoxAeZF19rVwZGgT9hVIdD34
	aSwC43yvIN5nREkkn4pLkSDqH7y4e1e6FTc/5I2GWeTuw4BWX8aaqt3BN0th+2ZRaFsj9keAUaB
	beXdNwDNYbHSgJjHTbR5kUSGcLOEk4hD9h262hez4P4J5EZZ2du0/XIaqruzi6rNyw2Ws+NVct4
	9ebHGxTz3UYZ00QQFXJvrq4RWXxeBmUYId/OYt487nI2HNXzRGfo7DB2HOKgFyIg8mvgmqXSZjs
	mjATU2pu/DolH3u0UAFp3y41Mr35taryM/MyjfKfa4BEyFZivfV1DVa6C9YYxXXKIgW4g7o9Ihg
	edX4pIqJUHc84F8MDxrmuWMam1XMcn0d/WzXQxgj0pv06evL4nsk+7aJJl7PrnGGVuY8wt3+LzE
	urUjcNWDVRmigJr20tiygPJgayqcbXoNgELpiMDCXVwsG/FHOXUmNPqAJFG16fK/lmFk/w=
X-Received: by 2002:a05:600c:e547:20b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-49e63cc640dmr46960215e9.6.1789187803072;
        Fri, 11 Sep 2026 21:36:43 -0700 (PDT)
Received: from SVR.localdomain ([158.173.156.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6cc11607sm21988015e9.12.2026.09.11.21.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 21:36:42 -0700 (PDT)
From: Semih Baskan <strst.gs@gmail.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	rafal@milecki.pl,
	zajec5@gmail.com,
	florian.fainelli@broadcom.com,
	arnd@arndb.de
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rosenp@gmail.com,
	rani.hod@gmail.com,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
Date: Sat, 12 Sep 2026 07:36:26 +0300
Message-ID: <20260912043626.437-1-strst.gs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAsRjR=F7_7M-_tC_u1WRxB4Toj8nbcQh0WeXuNhzCQAs=vbuA@mail.gmail.com>
References: <CAAsRjR=F7_7M-_tC_u1WRxB4Toj8nbcQh0WeXuNhzCQAs=vbuA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_213646_300002_1D9C5CE6 
X-CRM114-Status: GOOD (  23.91  )
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

The BCMA driver takes its register base and, since commit 552aa843e4c5
("PCI: iproc: Use the EROM outbound window on BCMA"), its outbound
window from what bcma read out of the enumeration ROM. It still
allocates its host bridge with devm_pci_alloc_host_bridge(), which since
commit 669cbc708122 ("PCI: Move DT resource setup into
devm_pci_alloc_host_bridge()") parses ranges, dma-ranges and bus-range
from the device's OF node and requests the windows it finds. None of
that reaches the hardware here: need_ob_cfg is only ever set by the
platform driver, so iproc_pcie_setup() never maps the parsed windows,
and the EROM commit above had to throw them away again to keep them
from colliding with its own window.

Allocate the bridge with pci_alloc_host_bridge() instead, so nothing
from the devicetree is requested or handed to the PCI core, and free it
on the error paths and in remove(). The driver now sets
bridge->dev.parent itself, as devm_pci_alloc_host_bridge() did, since
the wifi nodes under pcie_bridge0 in bcm4709-netgear-r8000.dts are
resolved through the root bus. The window request
moves from devm to request_resource() and release_resource() because
the resource lives inside the bridge allocation and has to be released
before the bridge is freed.

The ranges property is still read, but only to compare. bcm-ns.dtsi
describes the same window for the platform driver, and on core revision
0x01 it points at an address the hardware does not decode. The warning
from the EROM commit stays for that reason: a wrong dts is visible on
BCMA boots, where nothing else would show it. Without bus-range the
root bus also logs "No busn resource found for root bus, will use
[bus 00-ff]" again, which changes nothing else.

With PCIE_IPROC_PLATFORM and PCIE_IPROC_BCMA both enabled, the platform
driver binds the same nodes first and claims the devicetree window. On
core revision 0x07 that is the EROM window, so this driver's request
still fails and the probe backs out as before. On revision 0x01 the
devicetree window is elsewhere, so this driver now probes as well, next
to a platform driver instance whose window the hardware does not decode.
That instance does not work either; the only difference is that the
second probe is no longer stopped by the collision.

Tested on an ASUS RT-N18U (BCM47081, core revision 0x01): the warning
lines are identical to the applied version, /proc/iomem and the
enumerated devices are unchanged.

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Link: https://lore.kernel.org/r/20260911191429.GA549927@bhelgaas/
Signed-off-by: Semih Baskan <strst.gs@gmail.com>
---
 drivers/pci/controller/pcie-iproc-bcma.c | 70 +++++++++++++++++-------
 1 file changed, 49 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc-bcma.c b/drivers/pci/controller/pcie-iproc-bcma.c
index 06a471f4a..fcae83ed5 100644
--- a/drivers/pci/controller/pcie-iproc-bcma.c
+++ b/drivers/pci/controller/pcie-iproc-bcma.c
@@ -11,6 +11,7 @@
 #include <linux/phy/phy.h>
 #include <linux/bcma/bcma.h>
 #include <linux/ioport.h>
+#include <linux/of_address.h>
 
 #include "pcie-iproc.h"
 
@@ -31,18 +32,42 @@ static int iproc_bcma_pcie_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
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
 	struct iproc_pcie *pcie;
 	struct pci_host_bridge *bridge;
-	struct resource_entry *win, *tmp;
 	int ret;
 
-	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
+	bridge = pci_alloc_host_bridge(sizeof(*pcie));
 	if (!bridge)
 		return -ENOMEM;
 
+	bridge->dev.parent = dev;
+
 	pcie = pci_host_bridge_priv(bridge);
 
 	pcie->dev = dev;
@@ -51,7 +76,8 @@ static int iproc_bcma_pcie_probe(struct bcma_device *bdev)
 	pcie->base = bdev->io_addr;
 	if (!pcie->base) {
 		dev_err(dev, "no controller registers\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_free_bridge;
 	}
 
 	pcie->base_addr = bdev->addr;
@@ -60,37 +86,39 @@ static int iproc_bcma_pcie_probe(struct bcma_device *bdev)
 	pcie->mem.end = bdev->addr_s[0] + SZ_128M - 1;
 	pcie->mem.name = "PCIe MEM space";
 	pcie->mem.flags = IORESOURCE_MEM;
-
-	resource_list_for_each_entry_safe(win, tmp, &bridge->windows) {
-		if (resource_type(win->res) != IORESOURCE_MEM)
-			continue;
-
-		if (win->res->start != pcie->mem.start ||
-		    win->res->end != pcie->mem.end)
-			dev_warn(dev, "DT window %pR does not match EROM window %pR, using EROM\n",
-				 win->res, &pcie->mem);
-
-		devm_release_resource(dev, win->res);
-		resource_list_destroy_entry(win);
-	}
-
+	iproc_bcma_pcie_check_dt_window(pcie);
 	pci_add_resource(&bridge->windows, &pcie->mem);
-	ret = devm_request_resource(dev, &iomem_resource, &pcie->mem);
-	if (ret)
-		return ret;
+	ret = request_resource(&iomem_resource, &pcie->mem);
+	if (ret) {
+		dev_err(dev, "can't claim %pR\n", &pcie->mem);
+		goto err_free_bridge;
+	}
 
 	bridge->map_irq = iproc_bcma_pcie_map_irq;
 
 	bcma_set_drvdata(bdev, pcie);
 
-	return iproc_pcie_setup(pcie, &bridge->windows);
+	ret = iproc_pcie_setup(pcie, &bridge->windows);
+	if (ret)
+		goto err_release_mem;
+
+	return 0;
+
+err_release_mem:
+	release_resource(&pcie->mem);
+err_free_bridge:
+	pci_free_host_bridge(bridge);
+	return ret;
 }
 
 static void iproc_bcma_pcie_remove(struct bcma_device *bdev)
 {
 	struct iproc_pcie *pcie = bcma_get_drvdata(bdev);
+	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(pcie);
 
 	iproc_pcie_remove(pcie);
+	release_resource(&pcie->mem);
+	pci_free_host_bridge(bridge);
 }
 
 static const struct bcma_device_id iproc_bcma_pcie_table[] = {
-- 
2.43.0


