Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995D3C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 23:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFUBkPdrvb3+Gb+g41wZJKmSb+tO09XbzEaZdRyDfMM=; b=aV9hFLQRYKVkSdi3TiM357H+0f
	tr4MhNz0SS5L3n6yPzNm9nP6SYzvPCcdDOkvsCSoKShfArrAaTLcZdHMYN0rrVeZsV7h/6Gz5tuwS
	PffrKB5KcGMhGBtVVablFxcC6tb6M0+ZfgWcH8a9cRaHSYdVbR1EVtRZHkLOHug6x0DuzlKB282BL
	YM5HbP3mr2B3QKg2dy6LCcID+1Vle+QJHTu4pLvUPV6g1/nrT/vrFLUhq8S7zzJ3CVhjdMWrO+JQq
	fN+GV56zpiOrQIzClxtx5VFZs0prl2HjlZcD5dShIe96yYa8uyRbmFMqrgy6OI2vbRlnDIz7WqvxY
	CRePYNpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhOQ-0000000FqmB-0Ipz;
	Fri, 07 Mar 2025 23:46:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhGW-0000000FpVv-1Df0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 23:38:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9DDE8A45627;
	Fri,  7 Mar 2025 23:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0311C4CEEE;
	Fri,  7 Mar 2025 23:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741390682;
	bh=9huYHohH+gOJUkoeThHaODlEFocAowbh3DJVYqegdA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=exc99kmdGHpYV6kL6OhjqqdbMWYSyTNNn80GYi2Uc+VGV55ZsasQb1TE6cGi5R6to
	 38jeJdJmaoQrR9WMNt9kfO/wzRwJ8vSP1XRtHW22eTs9DdavO/Ye5cXvtEY5hYsMXZ
	 PbTWPMGSCekt20ls3uamd0Xi2PLFd/LjElBtXUnHmepsGBFqztBbEDGcurcL+6iGUM
	 0PG9WS0ohUvDp11N5TeD1pnusirSM1jZiMfVNEqF41rVNMqttdhmHsv5IT8DusD+Vs
	 gm9ePcCelLJErYpjQlWNp8P3gqtxbqrVukcyKMtvW5n9Rur+rjzM8YTbUUq51t0R6p
	 lxFlFr0Tfm6ag==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas Cassel <cassel@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 3/4] PCI: dwc: Look up 'config' address
Date: Fri,  7 Mar 2025 17:37:43 -0600
Message-Id: <20250307233744.440476-4-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307233744.440476-1-helgaas@kernel.org>
References: <20250307233744.440476-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_153804_503374_6B55DA26 
X-CRM114-Status: GOOD (  13.50  )
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

From: Bjorn Helgaas <bhelgaas@google.com>

Set pp->parent_bus_offset based on the parent bus address from the "config"
reg entry if it exists.

.cpu_addr_fixup(res->start) (if implemented) should return the parent bus
address corresponding to res->start.

Sets pp->parent_bus_offset, but doesn't use it, so no functional change
intended yet.
---
 .../pci/controller/dwc/pcie-designware-host.c | 42 +++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h  |  1 +
 2 files changed, 43 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index b9eaba157dae..e22f650ada5a 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -423,7 +423,11 @@ static int dw_pcie_cfg0_setup(struct dw_pcie_rp *pp)
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct device *dev = pci->dev;
 	struct platform_device *pdev = to_platform_device(dev);
+	struct device_node *np = dev->of_node;
 	struct resource *res;
+	int index;
+	u64 reg_addr, fixup_addr;
+	u64 (*fixup)(struct dw_pcie *pcie, u64 cpu_addr);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "config");
 	if (!res) {
@@ -434,6 +438,44 @@ static int dw_pcie_cfg0_setup(struct dw_pcie_rp *pp)
 	pp->cfg0_size = resource_size(res);
 	pp->cfg0_base = res->start;
 
+	/* [mem 0x7ff00000-] in example */
+	dev_info(dev, "%pR config CPU physical\n", res);
+
+	/* Look up "config" address on parent bus */
+	reg_addr = 0;
+	index = of_property_match_string(np, "reg-names", "config");
+	if (index >= 0) {
+		of_property_read_reg(np, index, &reg_addr, NULL);
+		/* [ia  0x8ff00000-] in example */
+		dev_info(dev, "%#010llx config reg[%d] parent bus addr\n",
+			 reg_addr, index);
+	} else {
+		reg_addr = res->start;
+		dev_warn(dev, "%#010llx assumed parent bus addr (no config reg-names entry)\n",
+			 reg_addr);
+	}
+
+	fixup = pci->ops->cpu_addr_fixup;
+	if (fixup) {
+		fixup_addr = fixup(pci, res->start);
+		dev_info(dev, "%#010llx result of %ps(%#010llx)\n",
+			 fixup_addr, fixup, res->start);
+		if (reg_addr == fixup_addr) {
+			dev_info(dev, "%#010llx config reg[%d] == %#010llx; %ps is redundant\n",
+				 reg_addr, index, fixup_addr, fixup);
+		} else {
+			dev_warn(dev, "%#010llx config reg[%d] != %#010llx fixed up addr; DT is broken\n",
+				 reg_addr, index, fixup_addr);
+			reg_addr = fixup_addr;
+		}
+	}
+
+	/* 0x7ff00000 - 0x8ff00000 == 0xf0000000 */
+	pp->parent_bus_offset = res->start - reg_addr;
+	dev_info(dev, "%#010llx config parent bus offset\n",
+		 pp->parent_bus_offset);
+
+
 	pp->va_cfg0_base = devm_pci_remap_cfg_resource(dev, res);
 	if (IS_ERR(pp->va_cfg0_base))
 		return PTR_ERR(pp->va_cfg0_base);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index ac23604c829f..eeca38ec3a2b 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -362,6 +362,7 @@ struct dw_pcie_rp {
 	u64			cfg0_base;
 	void __iomem		*va_cfg0_base;
 	u32			cfg0_size;
+	u64			parent_bus_offset;
 	resource_size_t		io_base;
 	phys_addr_t		io_bus_addr;
 	u32			io_size;
-- 
2.34.1


