Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5968ED68BDF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 08:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/06yQXX4oLDfmETPIUoolewKNeHtEg0BJE3zuHxB90=; b=GJ8DfL38pX6FSX3V9QyBqog+IQ
	X7hYHebYl6gdFHQ8Fi9TMtdLpVnFKBJRHn3jPg1CzR1S/tETpzw8fHM1ymiACc1mY3733gyAGS03R
	fZY8s7ivzh3V7z95CjPcwCSLWUsVMboy3WBInmoXE3J0FDGLeymB26QzM3Z4LtZwWAdpMZ0Cn0qu1
	0do1TBrQWAwJ+JupkTCTGnY0s0L87X3GuDs0Aaqr7VuR8saHQ8iS4N2BvrQq1jiPhePZqjvgWWjm+
	aAzfprkyroq5V1dV/3G7kr0Fz9QhMGy3EBrKFtUTD9nOOA8QmjPGi3N7WRwrUx9yF5XQ6Ua4pM9+G
	aekP3g7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCE4B-00000005DbD-1O13;
	Sat, 16 Nov 2024 08:22:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCE1c-00000005D5n-2Jpw;
	Sat, 16 Nov 2024 08:19:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7FDDBA40458;
	Sat, 16 Nov 2024 08:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2C2C4CEC3;
	Sat, 16 Nov 2024 08:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731745163;
	bh=VOD7JgWg4ieAEy60C9NaBSC0zOJOaSCD6UKWyZp1TWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p4dytTL7PmB5uuVo8kHqNi+uQnyHKGGNHbqKHneCSAuSdHiiO+hCqv0zY33lUMdfW
	 PEir62JmXbl3OuC3s12c/RUedKzSQPf0r7DWk98BGH0c66Gr074jud0YAfCUj5J25M
	 cjkBuqPLr4S2GVA7ZFQRYqYyueSSaN7ORia/VAGeCJv5zjfFEB3/DdeOZrNtyleMXU
	 5XNsCtvAQm3g5LZXFD3NEhH9DJPNSq/BJ4syX/wzoo0rwLP6eaLPa4i4kPfT8o6zYM
	 ZLcXBVFcFb2hIommYc1Y5WD4xj4TJVsHvF2+SZ0yuRzGNcGKpK8n0arjmPKPGV1WLT
	 MZod396/j55SA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 16 Nov 2024 09:18:23 +0100
Subject: [PATCH v3 2/6] PCI: mediatek-gen3: rely on
 clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-pcie-en7581-fixes-v3-2-f7add3afc27e@kernel.org>
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
X-CRM114-CacheID: sfid-20241116_001924_660436_8C3B914E 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 4d1c797a32c236faf79428eb8a83708e9c4f21d8..3cfcb45d31508142d28d338ff213f70de9b4e608 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -948,12 +948,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
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
@@ -966,17 +960,15 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
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
 	reset_control_assert(pcie->mac_reset);

-- 
2.47.0


