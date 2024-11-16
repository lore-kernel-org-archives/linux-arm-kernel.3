Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8513DD68BDF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 08:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0azmPeFW9BcCd3b207TxRRn0Hqxh8BXoT5Gn6Uowqc=; b=2D2AEB5YgX0nr52+dYZypWO787
	DCYDrpfSwWb2I+aR1bhdkosQKet/d07ZBE8Io8D7iYa6dTnHycG5+DHdEsbQp0k1n57zbGjJkd21A
	oxWS7QQAjRz6yg+W4IHgbQyiURFttUvHBip8h4qZHRkCsH89MKb6lKw26L9djbGYHcFiDOHEio3Na
	619SGvqKlYDpyM/uDqOBsTT1sShuk/j3viWcS4AaVTlIc4J0xqdFy9+cdb3QBSf4C/Pyqo5RuUiDu
	/Zgy21hwHcS1h5xZiZUB+opbgkeSsP4fIy0SJrffxR2TGlivt2Ds9r3Y/p3yJd6OuVVaxo6W2UQe4
	7YgDPb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCE54-00000005DiN-1b0I;
	Sat, 16 Nov 2024 08:22:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCE1g-00000005D7r-1Fo7;
	Sat, 16 Nov 2024 08:19:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9ACF45C2720;
	Sat, 16 Nov 2024 08:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D218C4CEC3;
	Sat, 16 Nov 2024 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731745167;
	bh=CUcpugj82iytRhkjUR6sYhraDFJqW4jyvGhHZ4iOlOk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P7DdJ2rGanYqWy+VDkD9X3pI8THRiN03JohFbl667luBJl7Yn3yoG/P63tawO39Jq
	 8rQafq1KqXYnU0O+jt5uek9eCUHJCy9Iuu1c9wykYNnOQml7FtbLFRNqNg8ToIiyo5
	 a+pIQxDoS5N2TAYSqYah0QyOv6PpikXr0+zAk0wD479Z04Q/yXmZejx8tfc0mTY2sb
	 M94xBZXdDPhT49KaBvCZP2/tVfWldWhDWe4YOVB490prK45are4cqYB/1rkK39C+NO
	 QeZ8asnNf4g/LDsdrzT2I14S/DNCRL+CPydhtUjknBoIVfEs42VOCmzCT/G6Iesicy
	 V6+J902OoXlvg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 16 Nov 2024 09:18:24 +0100
Subject: [PATCH v3 3/6] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-pcie-en7581-fixes-v3-3-f7add3afc27e@kernel.org>
References: <20241116-pcie-en7581-fixes-v3-0-f7add3afc27e@kernel.org>
In-Reply-To: <20241116-pcie-en7581-fixes-v3-0-f7add3afc27e@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_001928_525158_A3F1FB67 
X-CRM114-Status: GOOD (  14.32  )
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

In order to make the code more readable, the reset_control_bulk_assert()
for PHY reset lines is moved to make it pair with
reset_control_bulk_deassert() in mtk_pcie_power_up() and
mtk_pcie_en7581_power_up(). The same change is done for
reset_control_assert() used to assert MAC reset line.

Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
complete PCIe reset on MediaTek controller.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 3cfcb45d31508142d28d338ff213f70de9b4e608..2b80edd4462ad4e9f2a5d192db7f99307113eb8a 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -125,6 +125,8 @@
 
 #define MAX_NUM_PHY_RESETS		3
 
+#define PCIE_MTK_RESET_TIME_US		10
+
 /* Time in ms needed to complete PCIe reset on EN7581 SoC */
 #define PCIE_EN7581_RESET_TIME_MS	100
 
@@ -912,6 +914,14 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	int err;
 	u32 val;
 
+	/*
+	 * The controller may have been left out of reset by the bootloader
+	 * so make sure that we get a clean start by asserting resets here.
+	 */
+	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
+				  pcie->phy_resets);
+	reset_control_assert(pcie->mac_reset);
+
 	/*
 	 * Wait for the time needed to complete the bulk assert in
 	 * mtk_pcie_setup for EN7581 SoC.
@@ -986,6 +996,15 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
 	struct device *dev = pcie->dev;
 	int err;
 
+	/*
+	 * The controller may have been left out of reset by the bootloader
+	 * so make sure that we get a clean start by asserting resets here.
+	 */
+	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
+				  pcie->phy_resets);
+	reset_control_assert(pcie->mac_reset);
+	usleep_range(PCIE_MTK_RESET_TIME_US, 2 * PCIE_MTK_RESET_TIME_US);
+
 	/* PHY power on and enable pipe clock */
 	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
 	if (err) {
@@ -1070,14 +1089,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	 * counter since the bulk is shared.
 	 */
 	reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
-	/*
-	 * The controller may have been left out of reset by the bootloader
-	 * so make sure that we get a clean start by asserting resets here.
-	 */
-	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
-
-	reset_control_assert(pcie->mac_reset);
-	usleep_range(10, 20);
 
 	/* Don't touch the hardware registers before power up */
 	err = pcie->soc->power_up(pcie);

-- 
2.47.0


