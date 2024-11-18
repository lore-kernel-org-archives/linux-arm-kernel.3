Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC23D43FE6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 08:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKmLplaTa6QLDlf3NaD78wvmVhXmikiylJwYqpde5UM=; b=BzIe3J4hR/9DmN9P+iIKwr1Gvc
	w+8jCYQFRD0/Ew0G7pZF5fKvhpn5rBXFW05ghzPaeGQMTUQG+EMRG/6GBmO9LTHWVBd9AjWK1Ifoj
	x4VJ+J7T15gnsoAh7y/90dbhDiwlGbvSn8ggfz512zNg92t8HdKG3zVUc4JqryJ6YVmsXzc1XtXDD
	eW8cuGu4XxVcphCOi41hTfu1PJJIe80RLa6Xrz1Rujh+isutq/LuED1p8nOgj6lkwnMmMoxrRE5Zx
	9htvyfs5TaS+79PlCLC/2QJBds00RnVAPPy0v1gd33oD1bxuxmOUyfanOKdUvKkCIHxo2/HFdiHS+
	pE4l5MEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwn4-00000008iTa-03u1;
	Mon, 18 Nov 2024 08:07:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwl9-00000008iA2-2ulJ;
	Mon, 18 Nov 2024 08:05:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4A3BEA417FD;
	Mon, 18 Nov 2024 08:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFBFC4CECC;
	Mon, 18 Nov 2024 08:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731917122;
	bh=hl2S2LZwn2smx9ARAoEF8vIrYGRpQBw8WQAXlixKIJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UTMcp8lb8VTB7/w5vMKlDp5d3ulNJVMvYpU4tZ7Mp26/ZyvPckbM4WfD7g/xwAbNM
	 cVznwUcfiZF9tJXDP9wA/+JD7JIBiArhPl2l2hos+xznCyADSiV2Dv9l1ccFoWE/kS
	 3GgZ1K+pmw8acrJkuDsvQ8G1YiRn3QilPFn1+i5LFvqAlxDrczeYvHeAsG4X51NYeY
	 Ol+Ept29Pux5feeZ8cXm6XSoj8nHrKwf4UOZWaWuFEK/wCk3oC/nXtWL/fBnkF/hPW
	 TErv3v1yoC/Orc5wZkxeiIu4cLRC4PFjx4unttj80KVCO5tuJehdHgFoo9Xvh+ALz6
	 1dKUQgOLLP6gQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 18 Nov 2024 09:04:53 +0100
Subject: [PATCH v4 1/6] PCI: mediatek-gen3: Add missing
 reset_control_deassert() for mac_rst in mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-pcie-en7581-fixes-v4-1-24bb61703ad7@kernel.org>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
In-Reply-To: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
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
X-CRM114-CacheID: sfid-20241118_000523_797035_82D8C3B4 
X-CRM114-Status: UNSURE (   9.71  )
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 64ef8ff71b0357b9bf9ad8484095b7aa60c22271..4d1c797a32c236faf79428eb8a83708e9c4f21d8 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -942,6 +942,9 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	 */
 	mdelay(PCIE_EN7581_RESET_TIME_MS);
 
+	/* MAC power on and enable transaction layer clocks */
+	reset_control_deassert(pcie->mac_reset);
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
@@ -976,6 +979,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 err_clk_prepare:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
+	reset_control_assert(pcie->mac_reset);
 	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
 err_phy_deassert:
 	phy_power_off(pcie->phy);

-- 
2.47.0


