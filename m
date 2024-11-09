Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197B9D5E362
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 09:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWwXI703z6GIyclqEi+TlVBoEPg3BkQ6aWpcxyY5XoQ=; b=ktkwY7tNbmORBGGluE37wZTmcC
	DKAgc8ZiEVM/ODFnwM9EqwisCizCfRt+67v6s8CG+m5egOANHZeFrNiOT6C2yemxQpF4TgGA6HvLF
	/L+6X2cfqJqhqoQipkWxwVCkiptw70CFySAg15YNq+asWHXdNyD4XeVKfr0J1fJUWYJjE6EDqj0I1
	bAJkfDqIUVZKtNgc48aWoxpCydAEARJ4a6kVZ7M3DOk55QgBaXOgdp8AFGzoMBydc5phB/j70mCqM
	fVZOWaW1ETkFwsYeuT5BtTPGjz9d3/AN5Tp031PZKU789AuYT4yDThyj3LtoCHI1/1IOew57MsPJs
	BqwH26tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hri-0000000Czd6-20kb;
	Sat, 09 Nov 2024 09:34:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hmY-0000000CywY-2Hrn;
	Sat, 09 Nov 2024 09:29:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D5C7A40273;
	Sat,  9 Nov 2024 09:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21087C4CECE;
	Sat,  9 Nov 2024 09:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731144565;
	bh=b7sY8eeXTXCv7mml0kvVahhj89cw5WkIPMaWEq+tesY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dZD88OtH+gYFHPjg33MNygeYJkvaJE0LQW7CM3cno8MbuUB4pO7xWGQozMZ6gjScN
	 x+wmlUSICc0B5d3f2K+fLQa/KfIVRxHwmjm1hnQ/fC7Ny6Vn8kuvo88gfJ/HCDd/gA
	 MMi5IIqmMU7s4YinGdgZEbenrFODb2wn3troLGGGxajZn1MDelAOQAwoGH95KFKAZy
	 KEiRkhJBXdomHLbtm4BFcIpllBqQJ0hiTkcBzB5S4BhU5pSGSGE1f5NQDWyU3tiESo
	 vyGYDAd55C8oPHgcL12aHBCZKoL9ZiEa9z4SdRRmvXfiUUoYQFu9OMtwpIvsfrBTm1
	 nDRgL24JOAHiQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 09 Nov 2024 10:28:38 +0100
Subject: [PATCH v2 2/4] PCI: mediatek-gen3: rely on
 clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-pcie-en7581-fixes-v2-2-0ea3a4af994f@kernel.org>
References: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
In-Reply-To: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_012926_670234_878366BE 
X-CRM114-Status: UNSURE (   9.63  )
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

Squash clk_bulk_prepare() and clk_bulk_enable() in
clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up() routine

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 0fac0b9fd785e463d26d29d695b923db41eef9cc..8c8c733a145634cdbfefd339f4a692f25a6e24de 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -903,12 +903,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
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
@@ -921,17 +915,15 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
 	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
 
-	err = clk_bulk_enable(pcie->num_clks, pcie->clks);
+	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
 	if (err) {
 		dev_err(dev, "failed to prepare clock\n");
-		goto err_clk_enable;
+		goto err_clk_init;
 	}
 
 	return 0;
 
-err_clk_enable:
-	clk_bulk_unprepare(pcie->num_clks, pcie->clks);
-err_clk_prepare:
+err_clk_init:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 	reset_control_assert(pcie->mac_reset);

-- 
2.47.0


