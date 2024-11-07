Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FD2D4335D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 14:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unLD63mlfnLbbsnPXGXQINMsXcJV84XB4kO84Db/lAo=; b=t3qYQDrmMIFVozkrt6KwXVuFvk
	AMEh2x2/fT9QvrmTDY93I3qt0zupSJcwsw7BqRhoqzRU8cjep32IEh4Xky0VEaYQmTlihymFe6cO7
	N6/XvEdfjW1NcghQPV6D5rTRNgplNH9wwJr6awyeYC4ZScmMQ/dQP0O3pcVHck0bEsWh6DRz0NfT9
	ykrMjVQ4+eKxG/pUj2f2IC6hsCB+xs3TV0tcTLA2t/CGOWpKpraP2Whf2o20ekJ/k8x93uk/IeDRn
	dCNutK6LuMJ47FXsoPHu42O2ooEyG3x3MERDeHuXRSgjpGryiVK5bl+7mUeBr6pCzMZRatsV/EPi0
	38Zta1RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t933R-00000007CzC-31fE;
	Thu, 07 Nov 2024 14:00:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t92v2-00000007BYV-0lbO;
	Thu, 07 Nov 2024 13:51:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 094B45C58BD;
	Thu,  7 Nov 2024 13:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123BAC4CED0;
	Thu,  7 Nov 2024 13:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730987487;
	bh=EyDwIt88XF1ie7BfiMN0PnlL3XgXILjIU8/naicxr1A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KrrO1sAWC/yWE+U/fKXp2U0WRJrLNKqbduLjYdaKGr7aUOFo1pA6YcWtxSkQ+XD+y
	 63w9cjDUX/6NBHKjF9QsEJCEe+mf39xKnH/+suYjhl2uWiJ4xQs8JBKCm6eASY+zjR
	 bxOcJN0d9llvXnZlXV1eo1Bsb27z0t2dzLoww1s9o6eJa8zZ/DUVcCygU5CGvGdjWh
	 XjniDYse61zmVo9knPZBjpeRtQ//VtXqFi3rdVvGNNOP3PJe5lZnk1mqRxy55a4LRB
	 BJmW7KeZY55Uv29JioF+rjw99U6Lv4MMdAZxbI90a1cKNV1oXM3YmTKKi2vPkehTAE
	 htHd0YpGjDBsg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 07 Nov 2024 14:50:54 +0100
Subject: [PATCH 2/3] PCI: mediatek-gen3: rely on clk_bulk_prepare_enable in
 mtk_pcie_en7581_power_up
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-pcie-en7581-fixes-v1-2-af0c872323c7@kernel.org>
References: <20241107-pcie-en7581-fixes-v1-0-af0c872323c7@kernel.org>
In-Reply-To: <20241107-pcie-en7581-fixes-v1-0-af0c872323c7@kernel.org>
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
X-CRM114-CacheID: sfid-20241107_055128_301434_05798608 
X-CRM114-Status: UNSURE (   9.60  )
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

Squash clk_bulk_prepare and clk_bulk_enable in
clk_bulk_prepare_enable in mtk_pcie_en7581_power_up routine

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


