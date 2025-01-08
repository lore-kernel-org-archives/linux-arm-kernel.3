Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D4EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuC3b1sF21/ucOrjBssfXH7A6L2c5RCIlr7QteVMzwM=; b=wHf5O16OzCRkxBLr6D5cEOt5QQ
	ykRRrlSMtSve4hFsIyHUoGByLTFNmmc83Uxj7Szf0Sv2SkBJvrvJxKv5KlzJ3avs6jqlLFUhI08wi
	EUE/EzC3h07H/0/pqhxy+/3dzl/bht0AXY6xBrg5tTfnVBcP0upSIfts8zbET0HcOih2i8rEi+U7R
	NA0TmQTmPAqzUZ22M4GEWcLPMP+hap+HFDkIb6rJ6nmLdJ16TScIw9Wz3U9jvy75dcQaTSiqG144v
	PEzwq/TwnhxCWMbNOe2Ph7FXzh2tuPLMwyqd8Bgh2zf3TDshSNjIdg/61iMTfamkSR2mu6MCCkRcj
	CLxjGsyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVStl-00000007tvJ-22PZ;
	Wed, 08 Jan 2025 10:02:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSiN-00000007ryp-3cAg;
	Wed, 08 Jan 2025 09:51:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7618EA40A95;
	Wed,  8 Jan 2025 09:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A64EC4CEE0;
	Wed,  8 Jan 2025 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736329862;
	bh=29cWk1BMgfLD5wAcay/Bq/fTMXy4oV5VbyKl8GHHLpg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fV76BW8aIOK3acC6C9OCKVX5dMEOa0FTArVi9tby3Nw5mT82wg4yiEtahhiSN/Pb3
	 QOVy1df/KF6aq8y3L73kxNnHrwpIIi2ZW/L6tcw4K69QuBwb+wuEA7pJYw96NfY7li
	 H9j8kIn4XVGKxYXGPokyuS1kRBJ9vG1e9AbxJGeSkmBPvh0Qujm12beYbpOpSlKZog
	 GGFvAKKJZslHFUUGs7lWP9Mtb2VwgA48IFjXKdcVmRLO85lOE3uOgJR/J73QXw9c3p
	 7poqPkCp/r1TzrnhCsR21TXqaXndwIogALKvY+4X24XrGhtVNizxs2YY8SZIRymAew
	 76/PAAfXOcplw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 08 Jan 2025 10:50:40 +0100
Subject: [PATCH v6 1/5] PCI: mediatek-gen3: rely on
 clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-pcie-en7581-fixes-v6-1-21ac939a3b9b@kernel.org>
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
X-CRM114-CacheID: sfid-20250108_015103_967181_2583C0F9 
X-CRM114-Status: GOOD (  10.01  )
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

Replace clk_bulk_prepare() and clk_bulk_enable() with
clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up() routine.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index be52e3a123abd0d0086f9f1a603e3abaa18f319f..886d458df40d009424c2ae6f1564f51a669643ad 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -945,12 +945,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-	err = clk_bulk_prepare(pcie->num_clks, pcie->clks);
-	if (err) {
-		dev_err(dev, "failed to prepare clock\n");
-		goto err_clk_prepare;
-	}
-
 	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
 	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
 	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
@@ -963,17 +957,15 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
 	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
 
-	err = clk_bulk_enable(pcie->num_clks, pcie->clks);
+	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
 	if (err) {
 		dev_err(dev, "failed to prepare clock\n");
-		goto err_clk_enable;
+		goto err_clk_prepare_enable;
 	}
 
 	return 0;
 
-err_clk_enable:
-	clk_bulk_unprepare(pcie->num_clks, pcie->clks);
-err_clk_prepare:
+err_clk_prepare_enable:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);

-- 
2.47.1


