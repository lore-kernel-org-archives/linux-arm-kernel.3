Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D80C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+sTNY2jHQX3N1IbFvWuBInGou+e1McHIVysg4ljgKw=; b=RQsoFbej/ABhOXUS3LOQPdY9aY
	CWHjwzvs5wlCIfz1T1aHFKPmICTYpMwrt5jx8N+5gHwjyL1FCuBljHBfOvRpTI7W0pItVgRCCTDLu
	t51VkFqZOPeV6OVLrqvBoqhoGHPEKUwhrlq6kCI9d3dfAd2pNQctSX6YjNPSYXOIDQGRD/hMqh6nb
	hpP88tSJ8L2voe0EX2O8BOdg4hyLNT2vMOaHkOefSbA21HhRcPtxMP6g5njiulsdpPFtAE+lDV5oY
	WPNwyxk/OdjJyG13ZYuUyPjJkKaJw6vLP3NMqpwP5B/+UMmWD79gd+tJXIP8tIn1KhHK78kO+z4SV
	eLDVCOog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThvl-0000000300C-0nkQ;
	Mon, 23 Jun 2025 14:13:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfrH-00000002aqU-3EEO;
	Mon, 23 Jun 2025 12:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680066;
	bh=tABn/FJ82Le+j08iE0OB/YyH0TeyciA9txoBoYQ1Hzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FcINmgcwaK5zRPUrFPtU0z0vn1ScOK8Kj5+yOFrqxGPXYZjRGzFmGpdORy8/NRvH9
	 P9YEgFyc2zzfdYzoSwcCgQ3sXw5i4Zdc/NUVOFBTWkNpsfxTQ9QsAgZMS/yik0K+A0
	 3XCsKJJOh8qV5csiPorkgGfMABmJuasrAt7X/HGGTAkyVkSsA+BfLAQqlM1XSCed5w
	 A5QAvFCfaCfYpNcdM/2L9G6rb9gc7STGbA70u3d08imh9CbxG+apvgiS+OQB44R0iR
	 934shlkaaVMlvb50f4fgXC/Qp4J2SfFNYv1sBPsET0UQJomGxpQ2p8LpiP/3RTEdSr
	 gkHlJLp2XY1PA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F09117E0EC0;
	Mon, 23 Jun 2025 14:01:05 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jianjun.wang@mediatek.com
Cc: ryder.lee@mediatek.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/3] PCI: mediatek-gen3: Implement sys clock ready time setting
Date: Mon, 23 Jun 2025 14:00:56 +0200
Message-ID: <20250623120058.109036-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120058.109036-1-angelogioacchino.delregno@collabora.com>
References: <20250623120058.109036-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050107_961115_E9521267 
X-CRM114-Status: GOOD (  13.62  )
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

In preparation to add support for the PCI-Express Gen3 controller
found in newer MediaTek SoCs, such as the Dimensity 9400 MT6991
and the MT8196 Chromebook SoC, add the definition for the PCIE
Resource Control register and a new sys_clk_rdy_time_us variable
in platform data.

If sys_clk_rdy_time_us is found (> 0), set the new value in the
aforementioned register only after configuring the controller to
RC mode, as this may otherwise be reset.

Overriding the register defaults for SYS_CLK_RDY_TIME allows to
work around sys_clk_rdy signal glitching in MT6991 and MT8196.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b55f5973414c..00c9f2532870 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -101,6 +101,9 @@
 #define PCIE_MSI_SET_ADDR_HI_BASE	0xc80
 #define PCIE_MSI_SET_ADDR_HI_OFFSET	0x04
 
+#define PCIE_RESOURCE_CTRL_REG		0xd2c
+#define PCIE_RSRC_SYS_CLK_RDY_TIME_MASK	GENMASK(7, 0)
+
 #define PCIE_ICMD_PM_REG		0x198
 #define PCIE_TURN_OFF_LINK		BIT(4)
 
@@ -148,6 +151,7 @@ enum mtk_gen3_pcie_flags {
  * struct mtk_gen3_pcie_pdata - differentiate between host generations
  * @power_up: pcie power_up callback
  * @phy_resets: phy reset lines SoC data.
+ * @sys_clk_rdy_time_us: System clock ready time override (microseconds)
  * @flags: pcie device flags.
  */
 struct mtk_gen3_pcie_pdata {
@@ -156,6 +160,7 @@ struct mtk_gen3_pcie_pdata {
 		const char *id[MAX_NUM_PHY_RESETS];
 		int num_resets;
 	} phy_resets;
+	u8 sys_clk_rdy_time_us;
 	u32 flags;
 };
 
@@ -436,6 +441,15 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		writel_relaxed(val, pcie->base + PCIE_CONF_LINK2_CTL_STS);
 	}
 
+	/* If parameter is present, adjust SYS_CLK_RDY_TIME to avoid glitching */
+	if (pcie->soc->sys_clk_rdy_time_us) {
+		val = readl_relaxed(pcie->base + PCIE_RESOURCE_CTRL_REG);
+		val &= ~PCIE_RSRC_SYS_CLK_RDY_TIME_MASK;
+		val |= FIELD_PREP(PCIE_RSRC_SYS_CLK_RDY_TIME_MASK,
+				  pcie->soc->sys_clk_rdy_time_us);
+		writel_relaxed(val, pcie->base + PCIE_RESOURCE_CTRL_REG);
+	}
+
 	/* Set class code */
 	val = readl_relaxed(pcie->base + PCIE_PCI_IDS_1);
 	val &= ~GENMASK(31, 8);
-- 
2.49.0


