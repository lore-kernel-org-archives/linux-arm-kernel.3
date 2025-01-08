Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5DBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s94yAQ58FgHjQuCBKgRcYZJsQg5F1Fi36HEQmnVilDk=; b=EwGwz+YAY2Qxp7PxCIvynj3m83
	gHEQ5UJKTG4RXBCyaZhu5IMg3ICrTt4yJbIdVbcS0I4T+rWbw7OzsmcdwengiBGSi3xjvZjLKxI6C
	utF3gDiDvDLd2RedFD7/juggQbDTFgJtWAPvpZlmB3BzyQPdCiMzUMUd/iLJZ6md/Xv3FFcwX8/OD
	aVO0mzrbmR0S5s2PHA27/c9LtEv9Z0SodOU3XfQ7jugEt/yBVTRmKmUFRtwaYgYjoDi6/U8z11cQG
	AyvlusRr5sc57AZ08nxLDpeF8R8wRSIYBr0uPErs7GhCNd5WIAbdFFmMIw7dp688v6pDlGM42rAqO
	UNo4WzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSuv-00000007u4T-2q7A;
	Wed, 08 Jan 2025 10:04:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSiQ-00000007rzj-413Y;
	Wed, 08 Jan 2025 09:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5ABBBA40C8C;
	Wed,  8 Jan 2025 09:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46AB0C4CEE0;
	Wed,  8 Jan 2025 09:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736329865;
	bh=sSr7jnmf2lp/4KRHdrUAbnv/WR37msyTvdSzhf1tJ8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FhpNwLdxaKGsKIUHU1csO8vSGF2k8DXxx5RcT9VlytWKkeOH/ddhgLnwshaJY++hc
	 7fV09VmGUy2rIYZPgFV/Lf6ENx6LPN7/0PWatYRxwUj9hQUPYQpTJ3vUJT7g4Zm8fL
	 KvtEcULOfm72xr2hWqWqhh6QYOb/HC0ZysDm0iOyGIIFLE3F0y4OxxAx9jM3COLb1A
	 wjOcfU3hdAdpPWDvHr5gKB904jH4xxgMJEmvqI4aUq26GGT0uiC9HeJDboBE9BnZRL
	 s9HFqH1j0u8Igf2ISoz/d+k3VMZdBHbP44gmGlkvVk71yQ4AxqJi8DDUhAJ2tFxsSS
	 uJvs/IEY3C/fg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 08 Jan 2025 10:50:41 +0100
Subject: [PATCH v6 2/5] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-pcie-en7581-fixes-v6-2-21ac939a3b9b@kernel.org>
References: <20250108-pcie-en7581-fixes-v6-0-21ac939a3b9b@kernel.org>
In-Reply-To: <20250108-pcie-en7581-fixes-v6-0-21ac939a3b9b@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_015107_136488_14C0EC49 
X-CRM114-Status: GOOD (  14.62  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 886d458df40d009424c2ae6f1564f51a669643ad..4ce2b9d0dcd54e44cb645603d81865d26b2c8f23 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -125,6 +125,8 @@
 
 #define MAX_NUM_PHY_RESETS		3
 
+#define PCIE_MTK_RESET_TIME_US		10
+
 /* Time in ms needed to complete PCIe reset on EN7581 SoC */
 #define PCIE_EN7581_RESET_TIME_MS	100
 
@@ -913,9 +915,14 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	u32 val;
 
 	/*
-	 * Wait for the time needed to complete the bulk assert in
-	 * mtk_pcie_setup for EN7581 SoC.
+	 * The controller may have been left out of reset by the bootloader
+	 * so make sure that we get a clean start by asserting resets here.
 	 */
+	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
+				  pcie->phy_resets);
+	reset_control_assert(pcie->mac_reset);
+
+	/* Wait for the time needed to complete the reset lines assert. */
 	mdelay(PCIE_EN7581_RESET_TIME_MS);
 
 	err = phy_init(pcie->phy);
@@ -982,6 +989,15 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
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
@@ -1066,14 +1082,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
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
2.47.1


