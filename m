Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D17D132C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUfVjhnhfs7U9Y5jmTlGSXQXztb0HinmxH0nNDtVtTI=; b=W8YvyORWtHRQVBAe8vApvsmPbi
	Rhk/HRx+NRftKiTf05YEBHi69SGGP4q59uVZvYhWaPvDWR+nksSJNHvlDSO8UY2fgaVhClz90uVHF
	UsFP/stVmZAianj0sKw1HDoTONnu9u4cQQV43CbQXZ/7zRW5EOJ6m5LC8nwqMNxvgMLcYPgPtnSJS
	JSRXqltlnE0p6qwIeC21NY+bd0cZw7S7HGfEMmGAIou/3wwlyzQDI+7vMhMdu6vprF8ZFGjAuvbz7
	o0DUK5ZRc/cPcUN7M7SyNz+lTwE0R2qRhHcqFP7AKP6PXY25LbzFkrhOhAUqe1j/DNQedYEVmQZX4
	FZ6mbLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wwC-0000000DoD2-3pVE;
	Mon, 04 Nov 2024 13:16:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vb3-0000000DbC4-3n93;
	Mon, 04 Nov 2024 11:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730721012;
	bh=nj/c1dA8VqkoUIukvT2VQyD6AGQGr8wLOJTvFTd9PVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b9dhOiFLDvAr4phSZu89cBgulvoYky2FpUx0AgHB+pchjTFQmc5nY6amU+KeicdYk
	 H41oKSWZ7M8o25NRO9xwHueultYm6K4vW+i5eOInbOCAQf4d7ErpTWcUqoS5W4Yoir
	 oNomBqtpxOqGC34t/JL+SxwY5DJNUxslsvq9v1W40jioEroDA7Xq/E/nyXYrma4psr
	 xGGN7QK9AUslY7vFXrpBcCIrOdIvwa7wBoooIubphmJEjO+ensbOG73ZVD8X6//B4n
	 bxDjWyU6OhKQiiYffJyFe93MnrvEG9Oi+l45H+27G39U8xaf7zt6T6bsR/XcIX4Yg2
	 Fg5ccoehzA4lQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4C0D17E3613;
	Mon,  4 Nov 2024 12:50:11 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	fshao@chromium.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 2/2] PCI: mediatek-gen3: Add support for restricting link width
Date: Mon,  4 Nov 2024 12:49:35 +0100
Message-ID: <20241104114935.172908-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241104114935.172908-1-angelogioacchino.delregno@collabora.com>
References: <20241104114935.172908-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_035014_352993_99F15464 
X-CRM114-Status: GOOD (  14.44  )
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

Add support for restricting the port's link width by specifying
the num-lanes devicetree property in the PCIe node.

The setting is done in the GEN_SETTINGS register (in the driver
named as PCIE_SETTING_REG), where each set bit in [11:8] activates
a set of lanes (from bits 11 to 8 respectively, x16/x8/x4/x2).

Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index c27beef75079..fa7f36a0284d 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -32,6 +32,7 @@
 #define PCIE_BASE_CFG_SPEED		GENMASK(15, 8)
 
 #define PCIE_SETTING_REG		0x80
+#define PCIE_SETTING_LINK_WIDTH		GENMASK(11, 8)
 #define PCIE_SETTING_GEN_SUPPORT	GENMASK(14, 12)
 #define PCIE_PCI_IDS_1			0x9c
 #define PCI_CLASS(class)		(class << 8)
@@ -168,6 +169,7 @@ struct mtk_msi_set {
  * @clks: PCIe clocks
  * @num_clks: PCIe clocks count for this port
  * @max_link_speed: Maximum link speed (PCIe Gen) for this port
+ * @num_lanes: Number of PCIe lanes for this port
  * @irq: PCIe controller interrupt number
  * @saved_irq_state: IRQ enable state saved at suspend time
  * @irq_lock: lock protecting IRQ register access
@@ -189,6 +191,7 @@ struct mtk_gen3_pcie {
 	struct clk_bulk_data *clks;
 	int num_clks;
 	u8 max_link_speed;
+	u8 num_lanes;
 
 	int irq;
 	u32 saved_irq_state;
@@ -401,6 +404,14 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 			val |= FIELD_PREP(PCIE_SETTING_GEN_SUPPORT,
 					  GENMASK(pcie->max_link_speed - 2, 0));
 	}
+	if (pcie->num_lanes) {
+		val &= ~PCIE_SETTING_LINK_WIDTH;
+
+		/* Zero means one lane, each bit activates x2/x4/x8/x16 */
+		if (pcie->num_lanes > 1)
+			val |= FIELD_PREP(PCIE_SETTING_LINK_WIDTH,
+					  GENMASK(fls(pcie->num_lanes >> 2), 0));
+	};
 	writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
 
 	/* Set Link Control 2 (LNKCTL2) speed restriction, if any */
@@ -838,6 +849,7 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource *regs;
+	u32 num_lanes;
 
 	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-mac");
 	if (!regs)
@@ -883,6 +895,14 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 		return pcie->num_clks;
 	}
 
+	ret = of_property_read_u32(dev->of_node, "num-lanes", &num_lanes);
+	if (ret == 0) {
+		if (num_lanes == 0 || num_lanes > 16 || (num_lanes != 1 && num_lanes % 2))
+			dev_warn(dev, "Invalid num-lanes, using controller defaults\n");
+		else
+			pcie->num_lanes = num_lanes;
+	}
+
 	return 0;
 }
 
-- 
2.46.1


