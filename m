Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C005C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9dfTQhvKJUnr7BaSVQY2KwiFgbJ8aZ5AL6smnlFNoY=; b=VkaFz4vBQc/pN3fa6gXqVG2QfK
	3jTucs6X3K5pAn8QPMl16T702ZE5wy30XKpEFq3HEo2/d4r9kzViCn1cGBJO/zdZyHmJBtJS7Or9q
	YMaTuEFYQb/YKb6c24lYPN7cxHoEY5vHRhsSA1TEeQnSjK4CyzqglJS8X2jLY6aem9O04hlcyxO8x
	BxMsjupYthM0bUZ0vMUf1eIKZfL0ky3Sep7abfn5rklI/oMIJOYJiUTEu78T5ZDHk4bHGsEItq9/f
	cAd7NvVumUU9yXxcq1dXelLNb3aSF5RdMaGyNu+ts2LPb0w7Qux7CiqJGej9ugUJaqF307EY/wmOm
	ET9JEBxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTi0P-00000003184-1krr;
	Mon, 23 Jun 2025 14:18:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfrK-00000002arA-079t;
	Mon, 23 Jun 2025 12:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680068;
	bh=hggLnCb5W6mqHyWLaRt+klzDu+LtdyTLXbh8FYBkU3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f+NovE4rNp5POOblkw5XkHQSywS6Lqih/nV+xeErNblFRaKE+u2YXKMPVxhdV+mxG
	 S4xiK7WI4ZIsJjeypaWTa2Kh4BLTJP05nM2RLEcLSuDrn7hFXvifHS0xDuH1l9DLsS
	 V8rken+bECTBlr6xUCJMF8X29j/L4GWOY4ZfsswXyosFweeUl41fZ0lXpbQUoXmphE
	 VEBZ6SMra0QscFpFuH+zp+v/gRgpRYV0XwQTzZz/YDt6GEa7fJSTq2fIgMWpDiFlut
	 erUL1aGxiRd4NcTxE7jI3zFn/2M8brM8mO17tZW9oAjofV22lICqngJQu29q0AxWe+
	 hf5+TKSxQTwXA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB74C17E1560;
	Mon, 23 Jun 2025 14:01:07 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jianjun.wang@mediatek.com
Cc: ryder.lee@mediatek.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 3/3] PCI: mediatek-gen3: Add support for MediaTek MT8196 SoC
Date: Mon, 23 Jun 2025 14:00:58 +0200
Message-ID: <20250623120058.109036-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120058.109036-1-angelogioacchino.delregno@collabora.com>
References: <20250623120058.109036-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050110_246499_8F0DA4C7 
X-CRM114-Status: GOOD (  10.27  )
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

Introduce support for the PCI-Express Gen3 controller found in the
MT8196 (and MT6991) SoC by adding a compatible string and platform
specific data.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 00c9f2532870..43b99779274f 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1359,6 +1359,15 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_mt8192 = {
 	},
 };
 
+static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_mt8196 = {
+	.power_up = mtk_pcie_power_up,
+	.phy_resets = {
+		.id[0] = "phy",
+		.num_resets = 1,
+	},
+	.sys_clk_rdy_time_us = 10,
+};
+
 static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
 	.power_up = mtk_pcie_en7581_power_up,
 	.phy_resets = {
@@ -1373,6 +1382,7 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
 static const struct of_device_id mtk_pcie_of_match[] = {
 	{ .compatible = "airoha,en7581-pcie", .data = &mtk_pcie_soc_en7581 },
 	{ .compatible = "mediatek,mt8192-pcie", .data = &mtk_pcie_soc_mt8192 },
+	{ .compatible = "mediatek,mt8196-pcie", .data = &mtk_pcie_soc_mt8196 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);
-- 
2.49.0


