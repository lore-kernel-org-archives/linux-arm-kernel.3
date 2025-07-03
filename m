Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBB1C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 13:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCb0zklagnkhGOPR+XQOXEF23edE1l/FA5YMWSiH/H8=; b=C4PXD4RLde/ZptqsXBhO3wh7tK
	0bqTpUgYmLqXlQqs2ks+Zukpxn5HFowTZRJQIkMgR7bNAqZv8PVgxSooMagYA8I1Ys0MGtH/F+Mjw
	+f5B4hEHzBEDHcqz3btSUmcY6uAgGcL46S8xL1PtEtM9YYx62n2H5ggVQBYlXpMUxXq87fTcndFTK
	2FbIF7nZLLmtFJe2z5bRUAKsOTBzOTgOZ/H98uENp3nXbts8zzC08TeAGn8vmvBMW4ITHYgmcNe1X
	xmiQYJlMA/jaZQYE3rQoaJkha2rbmr5VwukV2hjbqGtpateybxI/TUQDGD5U7AReQNOeelKbct4eN
	XPQ+C4ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXK4j-0000000BVgz-1oIp;
	Thu, 03 Jul 2025 13:34:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIkJ-0000000BGlv-3tyF;
	Thu, 03 Jul 2025 12:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751544534;
	bh=tzB00E/eA47pTyzdZtsolZ62VuMIChKHgXq99sgnpPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fyhQzmtgnvMwxyCzSIm0Saiwdy4JoV85pA174oRhj1BMIN1sVouL7PTh8RvrzIs1G
	 YbRtE80P2NE2YpBxlqvzJutsI6KwI2ptN0Ys8Ahf99IbBuZNhd1fWDkWjyRhnggCig
	 M+sC4kqYD9sKaArkAXRbeYmsYYS0qYysaxwdmQM7aznnyyCK+8n33mvL98k3lcx1vI
	 EQ9h6ScbpWVBhB8j72MceUR7xcA0R6xxVi4HepEVdttZ8jV9AQb7bCIiSC/yFN/DsF
	 f8Qx5qHSdwM6iP5rae/BnQTdh/teCFZiZ6X8MecVwez73N/xrt33hBmqKhe89QaDwR
	 nIEgRNTJMXkEQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F1EF17E0EBD;
	Thu,  3 Jul 2025 14:08:53 +0200 (CEST)
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
Subject: [PATCH v2 3/3] PCI: mediatek-gen3: Add support for MediaTek MT8196 SoC
Date: Thu,  3 Jul 2025 14:08:47 +0200
Message-ID: <20250703120847.121826-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703120847.121826-1-angelogioacchino.delregno@collabora.com>
References: <20250703120847.121826-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_050856_140761_2FC4CB8A 
X-CRM114-Status: GOOD (  10.20  )
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
index 8035f7f812aa..f8adf88d19b0 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1358,6 +1358,15 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_mt8192 = {
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
@@ -1372,6 +1381,7 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
 static const struct of_device_id mtk_pcie_of_match[] = {
 	{ .compatible = "airoha,en7581-pcie", .data = &mtk_pcie_soc_en7581 },
 	{ .compatible = "mediatek,mt8192-pcie", .data = &mtk_pcie_soc_mt8192 },
+	{ .compatible = "mediatek,mt8196-pcie", .data = &mtk_pcie_soc_mt8196 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);
-- 
2.49.0


