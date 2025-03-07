Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D38C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 23:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySsn7dF/7Om+1GZfPcsWhSV1dmkm+FN1w5E4eHT2ni8=; b=eNF4IhfpAoApuNo6DMRWrwyNmT
	zhu6JsYrWrcEoLHNEU3sQxEJPExwyI6wPFNglkZ1p3E6jpcoEq9bdHltB5qIPL6//fNZKM2xrB0vB
	Awgban/FqMUwxclEB1TZET2XQMG6LuwveU/YVr++Cb8pXffIm6zc3TD1CNNFi+1XLb9peBD6qrOge
	2yFR7B0mOsRe7dB+ogO7MnVJpycqX45mKZDVXe0OZ0gisKSMCNxFspZIq35yPwzdBTbtEAKsZWSqS
	FS7ZIpz94yZO9889Y2iitEFOI/+HAMKG3WuI94RAhXZ2W8sCKBkMfWOgMKQ5kFM2Moq5skAF9lax+
	l1BBq9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhQ0-0000000Fquv-34Dm;
	Fri, 07 Mar 2025 23:47:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhGX-0000000FpWg-1Oqs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 23:38:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D8B3C5C64F6;
	Fri,  7 Mar 2025 23:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CD0C4CEE9;
	Fri,  7 Mar 2025 23:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741390684;
	bh=awyxVGLYLrPGk2ph0vC9xWww4UwkrrLl5cXRfJqJlA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CTVoSv901qPSH0kq0SRi45h38A2I+kzNId6N7kN8mUDSfb6d97vw8m4klIvm5tqeU
	 GAAPZ5h8bTAR47cLw04L8I7NjH5O/CDqd25IsGFixaVCi5ZEhO4yXYmreSFZzmYMrK
	 XaHNENqH+Q/S6PlDJq0DxFh0/6b+0WoOEf2ZXcZhM2du4yDrJASDBW4+8oX8QNwjdN
	 p54qwFQwhzKPPTNYZw6cjZYMCH1dPSzf3d1OomHr3NmfONYvc+Yfozq1yDf9csiFzw
	 uL8QR7UnDcubB4ogUeQwavpsm9bsM3+0DxVajnJXq4IXlJIuaAT4Ry1NxjECm27jxA
	 wcuiivr40Jl9w==
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
Subject: [PATCH 4/4] PCI: dwc: Use parent_bus_offset
Date: Fri,  7 Mar 2025 17:37:44 -0600
Message-Id: <20250307233744.440476-5-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307233744.440476-1-helgaas@kernel.org>
References: <20250307233744.440476-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_153805_486829_93B3BC58 
X-CRM114-Status: GOOD (  13.02  )
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

We know the parent_bus_offset, either computed from a DT reg property (the
offset is the CPU physical addr - the 'config' address on the parent bus)
or from a .cpu_addr_fixup() (which may have used a host bridge window
offset).

Apply that parent_bus_offset instead of calling .cpu_addr_fixup() again.

This assumes that all intermediate addresses are at the same offset from
the CPU physical addresses.
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 12 ++++++------
 drivers/pci/controller/dwc/pcie-designware.c      |  3 ---
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index e22f650ada5a..3378f905b3bd 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -670,7 +670,7 @@ static void __iomem *dw_pcie_other_conf_map_bus(struct pci_bus *bus,
 		type = PCIE_ATU_TYPE_CFG1;
 
 	atu.type = type;
-	atu.parent_bus_addr = pp->cfg0_base;
+	atu.parent_bus_addr = pp->cfg0_base - pp->parent_bus_offset;
 	atu.pci_addr = busdev;
 	atu.size = pp->cfg0_size;
 
@@ -695,7 +695,7 @@ static int dw_pcie_rd_other_conf(struct pci_bus *bus, unsigned int devfn,
 
 	if (pp->cfg0_io_shared) {
 		atu.type = PCIE_ATU_TYPE_IO;
-		atu.parent_bus_addr = pp->io_base;
+		atu.parent_bus_addr = pp->io_base - pp->parent_bus_offset;
 		atu.pci_addr = pp->io_bus_addr;
 		atu.size = pp->io_size;
 
@@ -721,7 +721,7 @@ static int dw_pcie_wr_other_conf(struct pci_bus *bus, unsigned int devfn,
 
 	if (pp->cfg0_io_shared) {
 		atu.type = PCIE_ATU_TYPE_IO;
-		atu.parent_bus_addr = pp->io_base;
+		atu.parent_bus_addr = pp->io_base - pp->parent_bus_offset;
 		atu.pci_addr = pp->io_bus_addr;
 		atu.size = pp->io_size;
 
@@ -790,7 +790,7 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
 
 		atu.index = i;
 		atu.type = PCIE_ATU_TYPE_MEM;
-		atu.parent_bus_addr = entry->res->start;
+		atu.parent_bus_addr = entry->res->start - pp->parent_bus_offset;
 		atu.pci_addr = entry->res->start - entry->offset;
 
 		/* Adjust iATU size if MSG TLP region was allocated before */
@@ -812,7 +812,7 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
 		if (pci->num_ob_windows > ++i) {
 			atu.index = i;
 			atu.type = PCIE_ATU_TYPE_IO;
-			atu.parent_bus_addr = pp->io_base;
+			atu.parent_bus_addr = pp->io_base - pp->parent_bus_offset;
 			atu.pci_addr = pp->io_bus_addr;
 			atu.size = pp->io_size;
 
@@ -956,7 +956,7 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 	atu.size = resource_size(pci->pp.msg_res);
 	atu.index = pci->pp.msg_atu_index;
 
-	atu.parent_bus_addr = pci->pp.msg_res->start;
+	atu.parent_bus_addr = pci->pp.msg_res->start - pci->pp.parent_bus_offset;
 
 	ret = dw_pcie_prog_outbound_atu(pci, &atu);
 	if (ret)
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 9d0a5f75effc..640caf4a084f 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -474,9 +474,6 @@ int dw_pcie_prog_outbound_atu(struct dw_pcie *pci,
 	u32 retries, val;
 	u64 limit_addr;
 
-	if (pci->ops && pci->ops->cpu_addr_fixup)
-		parent_bus_addr = pci->ops->cpu_addr_fixup(pci, parent_bus_addr);
-
 	limit_addr = parent_bus_addr + atu->size - 1;
 
 	if ((limit_addr & ~pci->region_limit) != (parent_bus_addr & ~pci->region_limit) ||
-- 
2.34.1


