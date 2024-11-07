Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4CDD43360
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 13:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01nEnPrHr/KB6tX2/rLObtEkZwgoa/NK4Y4p1QWGNTc=; b=Hgl0Uz8Yh29qc6SNkcDjm0uYKg
	EzvxlpNfBO+Y2TJSb4/NEx3uIN6VlLXo+VhnI1yXDxU1sWcLBM0jddC6PcO/tMhKOvEl6DppGaUN3
	l+mQF5vYpVkziPe67vgX+HwfDL7G2oxWr9lKD37moYtiScK9dkv8KktmjwAZ3zbTg15pdZyQZMt/x
	LCUCXZpXqN8Kvda3DTzuykOtPadrGnzdCHy3e8Sd+qcCqBhJud/s9DpeIN7fdGsH1Cv2YXFPGuRhD
	kLp3ISjw934tchr488H3Jo6Vw085Y3346PkJWgJIGuJkZUN78wazpezpHHeNVRSocFnvhEi0yksCG
	1G748YAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9300-00000007CQ2-3BRn;
	Thu, 07 Nov 2024 13:56:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t92uz-00000007BX5-3LOk;
	Thu, 07 Nov 2024 13:51:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 779C15C58E6;
	Thu,  7 Nov 2024 13:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBB6C4CECC;
	Thu,  7 Nov 2024 13:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730987484;
	bh=WjKW4w6m9vxglUpKnIKGk6mwn72chjGL/VfCQGNIAxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ExGndzmsAu9yPvANhTikksjegfEO+gzD/zauKwUogXN0B4EhHorTvDxNnlxhF2RIv
	 aOLG0RQ6HCywBNB8fJRWXcPvi7seUek9snum1XkoQBmfmKPOKwImKPD/xdkEqkfn2U
	 50oUpSQd84YFiZxHhbG3tH2NvGdiUxNkNkO79grcxDTydShRmbYqnrZ1LtdvpcNrTQ
	 d1e/mDu7rcnUs9IPw/oVU5knuJnWEMI0IWP/tZ7v9G7SH88+0/Qzv9GAHf7AU1Gboi
	 8l3SogVe1V1KMC0vkQYX87wuBDWxZf13iU8Wd5bWCFH4cCG/J9VpmTWOVXd8y2G3T2
	 bJMkuClCQZCMw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 07 Nov 2024 14:50:53 +0100
Subject: [PATCH 1/3] PCI: mediatek-gen3: Add missing reset_control_deassert
 for mac_rst in mtk_pcie_en7581_power_up
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-pcie-en7581-fixes-v1-1-af0c872323c7@kernel.org>
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
X-CRM114-CacheID: sfid-20241107_055125_911883_1DDFFC95 
X-CRM114-Status: UNSURE (   9.72  )
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

Even if this is not a real issue since Airoha EN7581 SoC does not require
the mac reset line, add missing reset_control_deassert() for mac reset
line in mtk_pcie_en7581_power_up callback.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 66ce4b5d309bb6d64618c70ac5e0a529e0910511..0fac0b9fd785e463d26d29d695b923db41eef9cc 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -897,6 +897,9 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	 */
 	mdelay(PCIE_EN7581_RESET_TIME_MS);
 
+	/* MAC power on and enable transaction layer clocks */
+	reset_control_deassert(pcie->mac_reset);
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
@@ -931,6 +934,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 err_clk_prepare:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
+	reset_control_assert(pcie->mac_reset);
 	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
 err_phy_deassert:
 	phy_power_off(pcie->phy);

-- 
2.47.0


