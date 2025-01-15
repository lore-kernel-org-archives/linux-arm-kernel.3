Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAC2C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 18:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ChwN7W5WW1L4KxE96DJ8H15Fstz1e2+SimsWbETS6tA=; b=qjjAt3qYlGMx1bZjF/2d0Y78Uf
	8D3DlxI0GjfILbbkXDu2nvz2HyqyVCLXQrDnXpI8lEzvx0koEblggdJZMwEFeHq+5Ki3WRygv5f49
	X5/WdQM9303kgy1IMWKgZZZpChRvtxyIF6QMKk1v63G6+Z1E43jGNVZQukJUNPu+mTfJfXAP9Q1hK
	7qAEF91yBPGFSCQYhQKChpLyZSZRJ7JwWiZDTwwnCyeQ81MIXENZvvDoZKH+t6VooP63BYxP2J6uU
	XDKYM3xaNpSx3E+xkoPDYgeXBFy9ajP2R5MYP7nBmBiI1LDN3ZFcgtLHPefKqDCck9rLhL9GUhVHX
	XhLj39UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7ge-0000000ChPE-15po;
	Wed, 15 Jan 2025 18:00:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7fM-0000000ChFl-14TH;
	Wed, 15 Jan 2025 17:58:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4ADEDA41FE5;
	Wed, 15 Jan 2025 17:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD11C4CED1;
	Wed, 15 Jan 2025 17:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736963935;
	bh=gZKYktDOO8kDP3psA1BVFTEyIt8B5t7fHIsUu2BTE+M=;
	h=From:Date:Subject:To:Cc:From;
	b=PP1l71W/lWn5a/5Wo8IGE+lxTF2vZAXcnb7GTVXUWvpuMjAKJNlyVD2tYQyKxAHVS
	 RZRL7kxLOJzNqFetUCJLu8glLoVmXnJH1miFKcVAyKCwaUzFTe/mIzWyp3KOhS4akl
	 GiJF0ByINvfr7QLNSROo7ZDW+mD1IZQ6t82vQ6/2gO5SW58JLYHN3OqtY/YPoFOtm2
	 hXU9xbZgSKKN8NFgNKPBBR9vfJo3mcWZGolV1qCjZmeSA3T9HOBFzHoQ3oS7N1Y8ng
	 okBwOdlkg/k+KMYBo3GTcxbNWeBW/bwAWoFKfYUrm6PGEOjs8JqWz6bbfg7e1WBOJN
	 4jiGjzWjfi0Rw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Jan 2025 18:58:34 +0100
Subject: [PATCH] PCI: mediatek-gen3: Remove leftover mac_reset assert for
 Airoha EN7581 SoC.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-pcie-en7581-remove-mac_reset-v1-1-61c2652e189f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEn3h2cC/x3MQQqDMBAF0KvIrDvgCMG0VylSQvK1szDKREQQ7
 25w+TbvpAJTFPo0Jxl2LbrkCnk1FP8hT2BN1dS1nWtFHK9Rwci988KGednBc4g/Q8HGyQWP9yg
 +RaFarIZRj6f/Dtd1A3zIoVFuAAAA
X-Change-ID: 20250115-pcie-en7581-remove-mac_reset-d5a8e9f18dc1
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
X-CRM114-CacheID: sfid-20250115_095856_360590_5D071A56 
X-CRM114-Status: UNSURE (   8.88  )
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

Remove a leftover assert for mac_reset line in mtk_pcie_en7581_power_up().
This is not armful since EN7581 does not requires mac_reset and
mac_reset is not defined in EN7581 device tree.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index aa24ac9aaecc749b53cfc4faf6399913d20cdbf2..0f64e76e2111468e6a453889ead7fbc75804faf7 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -940,7 +940,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	 */
 	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
 				  pcie->phy_resets);
-	reset_control_assert(pcie->mac_reset);
 
 	/* Wait for the time needed to complete the reset lines assert. */
 	msleep(PCIE_EN7581_RESET_TIME_MS);

---
base-commit: d02e16e4e05d5d2530a4836ca92318c6a6b21b01
change-id: 20250115-pcie-en7581-remove-mac_reset-d5a8e9f18dc1

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


