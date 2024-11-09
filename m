Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C83D5E362
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 09:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+6EYtkEOLFXtJD/n4t+mquwNQdkcEQqXZ2EtRPZgwY=; b=c/p0FtYi6fSuGGbAaNsOEGy3wm
	kL0HAKAmo3cuev7k7AV+hg9MAFG8pWKa8Rt7ktilrM6ij7fNZkz47mriZZicLNHnkFV1IryhTxaTp
	Ze/XXozbWjAGGkos3ez9C/IwFy5+6UffNe3RCzV1zlbKzgIsMCzv1zAoih/O3fXLAFOFtD/leltfo
	AGwewweXzdHoI7X3PRxmyLTiARSAqRU3W2ofPsGKcWEYFPQVwnp4jZ2Gwpqy50rlpOUCI1KRRIGEj
	InKrKkfQ71wS2t78ZFq0sIyzfc+Gndf/P1ey0O3wvAGLOod9YYR0xvCi0CH8FY3U/ui8VbRU32y8b
	ezynU9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hpz-0000000CzOR-1KmP;
	Sat, 09 Nov 2024 09:32:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hmW-0000000Cyvb-0FX2;
	Sat, 09 Nov 2024 09:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4FD6BA40165;
	Sat,  9 Nov 2024 09:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43447C4CECE;
	Sat,  9 Nov 2024 09:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731144562;
	bh=VItcQZD2Asoua4RQn/ctc3HUAFeoMyvrerFIagM4G4g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s3gJ9CfL0f6apB4GPtjwLcAZfuMS9+z1xXiCo9efswRQdLuJNm4XD1idFfgXVP6zt
	 tqWG+J+3NQTgPJgljj02miXxqgUeN33nLbO7n1cM+vcAFkxNLcswyOtT+WuF3Q0eOj
	 Dz6keJtB6C8wxVsTsm70T7OSmRNz22pX0xF5q1QCdfPUw9uJFwZ8Kkl2S5iR7/xDh+
	 xaZbmjk6/IHJR35KzyxO7DN9es5JiycMvQVTm5FvdNVsaqruAVh1UyyA0XQ91BXTRL
	 LNUQ7U3imOYOePqByUKjuKzRjCmmEC56CvHCjI0KmlHVz4mAH83vPyJ2XyD5A6PmVI
	 3c8Uf2vpEO60w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 09 Nov 2024 10:28:37 +0100
Subject: [PATCH v2 1/4] PCI: mediatek-gen3: Add missing
 reset_control_deassert() for mac_rst in mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-pcie-en7581-fixes-v2-1-0ea3a4af994f@kernel.org>
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
X-CRM114-CacheID: sfid-20241109_012924_200976_EFBB3B92 
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

Even if this is not a real issue since Airoha EN7581 SoC does not require
the mac reset line, add missing reset_control_deassert() for mac reset
line in mtk_pcie_en7581_power_up() callback.

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


