Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9D1C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlssJ1za+rvmiGBg5+y230lU6WEOZ50WqDacWudXeoY=; b=JzK8VwE+0x6Wvh7mLkxMVgC1XN
	4p6dF1rD45ZHVPJgJwUPjNpuDyV6FjkmHXcnwgVqYwU2D9oQYYPVZkYu1GtRf6/rcXetzqGZupkQI
	CHdW+e3W5SDxvNaERJMmUrF2iQMxcfx1erG0qU91Du9jSrDOA772mO3o1fMb8j7PEq+78EFWZTQWp
	9sh5WAfmiE0Cm2oWLUiJDJ8ErnPeZoEKGM1MOBQ1YbuHko5E21IFUqelD74wEuiAzHNunijB9g3wS
	1dNNWWEhDolJUlzLK1kYhtVczubVg2ijE6jXH37RgfH44ip7JnrKvHjzhze0z4aAJP3A1Rf4/rk2b
	TRkf6KMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThr7-00000002z48-3CXI;
	Mon, 23 Jun 2025 14:09:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfr7-00000002anW-0D6K;
	Mon, 23 Jun 2025 12:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680055;
	bh=ynNjCYWY9OpY9ODTpNTte5w8auGVt0pVguNPVv+omyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j1CsyIVi8GkACgQWt4etOQ6+2ZM59CLWcjCwtsjqc6aYtESU+UTJYdZ7KCquEZ+tP
	 LQ70CnzSstnsvQWWTCR19wiLb3HhiruYlKMrbwfopokkLIR7hw9PGzvv1AokKclvWZ
	 piB9ubabBIeJewMJXHK2SkyzlLJlIG+FyzVXYiAwPYtxkjM11wlC10F9dLt9sfYx7X
	 N6kOqybP+V7OwvppH88qsLwLlz/+zm6hvWC8T8jJZ0YJq6YI78FUj51Qa8y8SrG3YY
	 c5oLkEulVi0Us1UX25x9J7G9xSoL+y6FLCzoSrVUQqPLCxmGzIxfUHgTLGu6Xs1ina
	 5koqsw5zldT0A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 16F1F17E156E;
	Mon, 23 Jun 2025 14:00:55 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsin-hsiung.wang@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 5/5] spmi: mtk-pmif: Add support for MT8196 SPMI Controller
Date: Mon, 23 Jun 2025 14:00:47 +0200
Message-ID: <20250623120047.108961-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120047.108961-1-angelogioacchino.delregno@collabora.com>
References: <20250623120047.108961-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050057_236349_C5CBE29E 
X-CRM114-Status: UNSURE (   9.67  )
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

Add support for the SPMI controller found in the MT8196 SoC:
this supports SPMI 2.0 and features two SPMI buses.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spmi/spmi-mtk-pmif.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index ad7b0cc9cdaa..719753651234 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -636,6 +636,14 @@ static const struct pmif_data mt8195_pmif_arb = {
 	.soc_chan = 2,
 };
 
+static const struct pmif_data mt8196_pmif_arb = {
+	.regs = mt8195_regs,
+	.spmimst_regs = mt8195_spmi_regs,
+	.soc_chan = 2,
+	.spmi_ver = 2,
+	.num_spmi_buses = 2,
+};
+
 static int mtk_spmi_irq_init(struct device_node *node,
 			     const struct pmif_data *pdata,
 			     struct pmif_bus *pbus)
@@ -834,6 +842,9 @@ static const struct of_device_id mtk_spmi_match_table[] = {
 	}, {
 		.compatible = "mediatek,mt8195-spmi",
 		.data = &mt8195_pmif_arb,
+	}, {
+		.compatible = "mediatek,mt8196-spmi",
+		.data = &mt8196_pmif_arb,
 	}, {
 		/* sentinel */
 	},
-- 
2.49.0


