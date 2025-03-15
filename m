Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB3AC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 20:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETI5JIwMaLYszF8ULu8d7j+vLyUoN2P4VsLTI2rnD3M=; b=Kl8i8F33Dl7YnoLiiEZJDgspkv
	xeCT28TcIt5U30g5+hvq12t2W4qPs72DKHaM352EGe/xNFpNdVEgmOWDs1UOrtQil3agqgiyX7Hxr
	aTr3v4GcdszOl2FEKUA675UzwKodYGEvc+rVs+ENaig9NwD0/QHLgE6LMtMdjPXSalClmqfB2+kjN
	jBju6keSPAkjOqqOSUYl5y2GP7C1i2ObleX3FbntxbT4dIVKsxMENxMwAA+PX038P7yMZruNRUNqS
	FyeLOr8fSV9uaO54rmEp3N4D8dtjcoF7Iej7PTqnWfM+99jwfy4vpUWt+OfsEAgTuO2eyZf1pgqkr
	QA7SpjQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttY2g-0000000Goga-13RK;
	Sat, 15 Mar 2025 20:23:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXvN-0000000GnS8-2nQB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 20:16:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3604E5C4638;
	Sat, 15 Mar 2025 20:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76520C4CEE5;
	Sat, 15 Mar 2025 20:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742069760;
	bh=UQ59zv9FuaqX9nZDy1KqpQxejNQdEppJ2cczOe71XF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CizdI21kCtv5eit8m4INMznvOqkXezGWSbe6h7pQUBBhLuNPA935WXkxxavRCLAUs
	 ezUatl5+zp8Zcged/GR2MnT7ol/xmlRmOfl0Mql76Bz/eDmCp9UDOAS4KhjLHINsIB
	 Ry7314Du3l6g3Hdk6lowrsAmPWsgdvZeCUqYeY7XtLTjD7/VB4JesE8cCpwOW3XX+k
	 A2JpHxLj/COP/2laWlwkm+QcLUH3uPAzgV4SIQqY70q8+wmm/sxV86Nga3gm5+HX6X
	 lw/DDGN1Szdp39qR6zV8n6m/IYlCz5drnN09ueOvLzn+tYvnvFokOhBvldtI/8WmUR
	 DFzkKul4Lnllw==
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
	Fabio Estevam <festevam@gmail.com>,
	Niklas Cassel <cassel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v12 03/13] PCI: dwc: Call devm_pci_alloc_host_bridge() early in dw_pcie_host_init()
Date: Sat, 15 Mar 2025 15:15:38 -0500
Message-Id: <20250315201548.858189-4-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250315201548.858189-1-helgaas@kernel.org>
References: <20250315201548.858189-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_131601_749393_2D88005D 
X-CRM114-Status: GOOD (  10.26  )
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

From: Frank Li <Frank.Li@nxp.com>

Move devm_pci_alloc_host_bridge() to the beginning of dw_pcie_host_init().

devm_pci_alloc_host_bridge() is generic code that doesn't depend on any DWC
resource, so moving it earlier keeps all the subsequent devicetree-related
code together.

[bhelgaas: reorder earlier in series]
Link: https://lore.kernel.org/r/20250313-pci_fixup_addr-v11-4-01d2313502ab@nxp.com
Signed-off-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 1206b26bff3f..5636243fb90e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -431,6 +431,12 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 
 	raw_spin_lock_init(&pp->lock);
 
+	bridge = devm_pci_alloc_host_bridge(dev, 0);
+	if (!bridge)
+		return -ENOMEM;
+
+	pp->bridge = bridge;
+
 	ret = dw_pcie_get_resources(pci);
 	if (ret)
 		return ret;
@@ -448,12 +454,6 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (IS_ERR(pp->va_cfg0_base))
 		return PTR_ERR(pp->va_cfg0_base);
 
-	bridge = devm_pci_alloc_host_bridge(dev, 0);
-	if (!bridge)
-		return -ENOMEM;
-
-	pp->bridge = bridge;
-
 	/* Get the I/O range from DT */
 	win = resource_list_first_type(&bridge->windows, IORESOURCE_IO);
 	if (win) {
-- 
2.34.1


