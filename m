Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C3FD462A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 14:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VyM8A9osJtCiCjqqphmEmzYlRZSNsP2IKroB+kkCsps=; b=ahvhXfFcKU0FS8C4WP+5TLQr02
	5ufYsU/t73WGyET6/haPb3ZChHzpdCuwu1hneDPe31HcwvASEJTV87NEIEqAQZ34G4SUDF+c9wSI6
	73DgvCDiptmCZFXtWNy4yNniPjb3kHxATS5CphMMKenbO2mB9op5JBsKRPJ6EWLLPpC9mYXf7LYDV
	MgzyWbHZzomAwrea0i1du97rIV/MJ+R1hhcb84Q9ntho03mQqTAOdxBDWQajrk/gnzNPBq1RQwvi8
	QJmKqwTMiRsaeHgDJuGjT79ZMfFPWghMWmCmuz1YtTqlTUoQFVBNNTDRv5O5jU56ai87I+QNr/CiP
	39cOnV5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDv9-000000071Wh-2PLv;
	Wed, 13 Nov 2024 14:00:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDtG-000000071A1-29SB;
	Wed, 13 Nov 2024 13:58:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE7C85C56BE;
	Wed, 13 Nov 2024 13:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29656C4CEC3;
	Wed, 13 Nov 2024 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731506316;
	bh=RVFQobb65WikWsYb0GyKswQ/UxNLGQliuaFMCqmi6/E=;
	h=From:Date:Subject:To:Cc:From;
	b=GfRm5rcfSWG5ouyAvetwvpLkhBhF8/eP2gRKZXKzn38A23q9K9qMALG3z+eysNoex
	 nN6rVCFD8zIz5oZjPf85FenloAq35it235SN/eO0NMEaQwWxIv6YhU0oKpsmaKfP8O
	 CpnmbElceFztxpT1+2DXD7WHmzM2p/RFu93Z8oV5+2xNkwARI+CbukltnUdNFCW/h3
	 1bydaxYnv2ZS5gYPtUWPLEnSYCnEps/MaOINpqllwJQ1hzp9y85r+27T1hIIH8R8BO
	 Ywx7hwqrgP/v9hN0sX2j/E0Y9R701CpEzZmbPGzrzgJtqh0idcIYA8Hupe9fJCDpCC
	 7lD4p9L0EdKFg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 13 Nov 2024 14:58:08 +0100
Subject: [PATCH v3] PCI: mediatek-gen3: Avoid PCIe resetting via PCIE_RSTB
 for Airoha EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-pcie-en7581-rst-fix-v3-1-23c5082335f7@kernel.org>
X-B4-Tracking: v=1; b=H4sIAG+wNGcC/33NwQrCMAwG4FcZPVtp2q3rdvI9xIN26VaUbrSjK
 GPvbraDIIjk9P8kXxaWMHpMrC0WFjH75MdAQR0KZodr6JH7jjKTQpaikYJP1iPHUFcGeEwzd/7
 JDWjQlbGgbMnocopI9a6eL5QHn+YxvvYnGbb2v5eB04hSuZtWztnmdMcY8HEcY882MMsPArT3G
 5GEOIeVUY2tdWe+kHVd3xkrQS/8AAAA
X-Change-ID: 20240920-pcie-en7581-rst-fix-8161658c13c4
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, Hui Ma <hui.ma@airoha.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_055838_793003_7E90BBD2 
X-CRM114-Status: GOOD (  16.76  )
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

Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
causing occasional PCIe link down issues. In order to overcome the
problem, PCIE_RSTB signals are not asserted/released during device probe or
suspend/resume phase and the PCIe block is reset using REG_PCI_CONTROL
(0x88) and REG_RESET_CONTROL (0x834) registers available in the clock
module running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().

Introduce flags field in the mtk_gen3_pcie_pdata struct in order to
specify per-SoC capabilities.

Tested-by: Hui Ma <hui.ma@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v3:
- cosmetics
- Link to v2: https://lore.kernel.org/r/20241104-pcie-en7581-rst-fix-v2-1-ffe5839c76d8@kernel.org

Changes in v2:
- introduce flags field in mtk_gen3_pcie_flags struct instead of adding
  reset callback
- fix the leftover case in mtk_pcie_suspend_noirq routine
- add more comments
- Link to v1: https://lore.kernel.org/r/20240920-pcie-en7581-rst-fix-v1-1-1043fb63ffc9@kernel.org
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 60 ++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 16a55711a7f3bdc8d6620029e3d2cfdd40b537b7..443072adb9b52a6934a5d1e38eb6fca5f86a1e13 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -128,10 +128,18 @@
 
 struct mtk_gen3_pcie;
 
+enum mtk_gen3_pcie_flags {
+	SKIP_PCIE_RSTB	= BIT(0), /* skip PCIE_RSTB signals configuration
+				   * during device probing or suspend/resume
+				   * phase in order to avoid hw bugs/issues.
+				   */
+};
+
 /**
  * struct mtk_gen3_pcie_pdata - differentiate between host generations
  * @power_up: pcie power_up callback
  * @phy_resets: phy reset lines SoC data.
+ * @flags: pcie device flags.
  */
 struct mtk_gen3_pcie_pdata {
 	int (*power_up)(struct mtk_gen3_pcie *pcie);
@@ -139,6 +147,7 @@ struct mtk_gen3_pcie_pdata {
 		const char *id[MAX_NUM_PHY_RESETS];
 		int num_resets;
 	} phy_resets;
+	u32 flags;
 };
 
 /**
@@ -405,22 +414,34 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
 	writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
 
-	/* Assert all reset signals */
-	val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
-	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
-	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
-
 	/*
-	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
-	 * and 2.2.1 (Initial Power-Up (G3 to S0)).
-	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
-	 * for the power and clock to become stable.
+	 * Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
+	 * causing occasional PCIe link down. In order to overcome the issue,
+	 * PCIE_RSTB signals are not asserted/released at this stage and the
+	 * PCIe block is reset configuting REG_PCI_CONTROL (0x88) and
+	 * REG_RESET_CONTROL (0x834) registers available in the clock module
+	 * running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().
 	 */
-	msleep(100);
-
-	/* De-assert reset signals */
-	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
-	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
+		/* Assert all reset signals */
+		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
+		val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
+		       PCIE_PE_RSTB;
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+
+		/*
+		 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
+		 * and 2.2.1 (Initial Power-Up (G3 to S0)).
+		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
+		 * for the power and clock to become stable.
+		 */
+		msleep(PCIE_T_PVPERL_MS);
+
+		/* De-assert reset signals */
+		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
+			 PCIE_PE_RSTB);
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	}
 
 	/* Check if the link is up or not */
 	err = readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, val,
@@ -1179,10 +1200,12 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
 		return err;
 	}
 
-	/* Pull down the PERST# pin */
-	val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
-	val |= PCIE_PE_RSTB;
-	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
+		/* Pull down the PERST# pin */
+		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
+		val |= PCIE_PE_RSTB;
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	}
 
 	dev_dbg(pcie->dev, "entered L2 states successfully");
 
@@ -1233,6 +1256,7 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
 		.id[2] = "phy-lane2",
 		.num_resets = 3,
 	},
+	.flags = SKIP_PCIE_RSTB,
 };
 
 static const struct of_device_id mtk_pcie_of_match[] = {

---
base-commit: ff80d707f3cb5e8d9ec0739e0e5ed42dea179125
change-id: 20240920-pcie-en7581-rst-fix-8161658c13c4

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


