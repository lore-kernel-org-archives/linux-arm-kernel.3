Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6119BCCFA1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 12:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLiD0RUH8avhai/+nOpfX3FHj+VIOyhNPMQSFNVdBCg=; b=KCCUZGoIoE/X8Wk7A3Uf9L1cmR
	IM2xL0F9DmFeJWT+Uee60/aja4b/lYba0N+hu02v7mdfBAm1sS24fl20FwR2WkzF1y0gNfkObEG9L
	7Wencg1nL5vWC8kvCOmRZVBkZPHM746JfFLmAnfwNSQ5Abi/otLWRJ6KFzg0SLr3kAyGg35wG9l49
	1+ItI0UakWLR3U36N3be4bD7Kb6r3BCz/JA85g8xh7gQZO0QRzmzj0sGa6bwRX9k0GPRQ/jU2NbAJ
	Ih2hyG5loqlU0dQ2HUXDxQTCheAAsFB3/kGRlcRPmxDnz4v9YDMyHV5zOyVetAeVbhwkFNG3jV1rm
	QyR2n5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzLO-0000000FTp0-3xOZ;
	Thu, 06 Nov 2025 12:44:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzLB-0000000FTTR-1Sq6;
	Thu, 06 Nov 2025 12:43:53 +0000
X-UUID: 38f99928bb0e11f09f706fa2197c6ceb-20251106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mLiD0RUH8avhai/+nOpfX3FHj+VIOyhNPMQSFNVdBCg=;
	b=OH1qyoRkQLtDh3JEe+QcHOK9Tg+W+X4cVsbWmdLHAT3V9osDtNygjYtj8hQl1hk80MPr6SYT9Scym6RIQsE09mxNmiEFp89D/OIu+o4ZJuuWKMjnxi/AF3vxQt3nrAofyORkwXsUMAwGl/Fah6udbHdJiaX2k8DmLKrMF9UsuA0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:85940377-0478-4696-8e50-ef87210a464d,IP:0,UR
	L:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-50
X-CID-META: VersionHash:a9d874c,CLOUDID:bc351d6b-d4bd-4ab9-8221-0049857cc502,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 38f99928bb0e11f09f706fa2197c6ceb-20251106
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 755057505; Thu, 06 Nov 2025 05:43:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 6 Nov 2025 20:43:38 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 6 Nov 2025 20:43:38 +0800
From: irving.ch.lin <irving-ch.lin@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Richard Cochran <richardcochran@gmail.com>
CC: Qiqi Wang <qiqi.wang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <irving-ch.lin@mediatek.com>
Subject: [PATCH v3 10/21] clk: mediatek: Add MT8189 dbgao clock support
Date: Thu, 6 Nov 2025 20:41:55 +0800
Message-ID: <20251106124330.1145600-11-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
References: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_044349_409517_CD081841 
X-CRM114-Status: GOOD (  19.19  )
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

From: Irving-CH Lin <irving-ch.lin@mediatek.com>

Add support for the MT8189 dbgao clock controller,
which provides clock gate control for debug-system.

Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 drivers/clk/mediatek/Kconfig            |  10 +++
 drivers/clk/mediatek/Makefile           |   1 +
 drivers/clk/mediatek/clk-mt8189-dbgao.c | 115 ++++++++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8189-dbgao.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 82a26d952bff..c707b224dccd 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -850,6 +850,16 @@ config COMMON_CLK_MT8189_CAM
 	  that relies on this SoC and you want to control its clocks, say Y or M
 	  to include this driver in your kernel build.
 
+config COMMON_CLK_MT8189_DBGAO
+	tristate "Clock driver for MediaTek MT8189 debug ao"
+	depends on COMMON_CLK_MT8189
+	default COMMON_CLK_MT8189
+	help
+	  Enable this to support the clock management for the debug function
+	  on MediaTek MT8189 SoCs. This includes enabling and disabling
+	  vcore debug system clocks. If you want to control its clocks, say Y or M
+	  to include this driver in your kernel build.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 95a8f4ae05ee..eabe2cab4b8d 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -127,6 +127,7 @@ obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o
 				   clk-mt8189-vlpckgen.o clk-mt8189-vlpcfg.o
 obj-$(CONFIG_COMMON_CLK_MT8189_BUS) += clk-mt8189-bus.o
 obj-$(CONFIG_COMMON_CLK_MT8189_CAM) += clk-mt8189-cam.o
+obj-$(CONFIG_COMMON_CLK_MT8189_DBGAO) += clk-mt8189-dbgao.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8189-dbgao.c b/drivers/clk/mediatek/clk-mt8189-dbgao.c
new file mode 100644
index 000000000000..d760e2ea801a
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-dbgao.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Qiqi Wang <qiqi.wang@mediatek.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mediatek,mt8189-clk.h>
+
+static const struct mtk_gate_regs dbgao_cg_regs = {
+	.set_ofs = 0x70,
+	.clr_ofs = 0x70,
+	.sta_ofs = 0x70,
+};
+
+#define GATE_DBGAO(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &dbgao_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_no_setclr_inv,	\
+	}
+
+static const struct mtk_gate dbgao_clks[] = {
+	GATE_DBGAO(CLK_DBGAO_ATB_EN, "dbgao_atb_en", "atb_sel", 0),
+};
+
+static const struct mtk_clk_desc dbgao_mcd = {
+	.clks = dbgao_clks,
+	.num_clks = ARRAY_SIZE(dbgao_clks),
+};
+
+static const struct mtk_gate_regs dem0_cg_regs = {
+	.set_ofs = 0x2c,
+	.clr_ofs = 0x2c,
+	.sta_ofs = 0x2c,
+};
+
+static const struct mtk_gate_regs dem1_cg_regs = {
+	.set_ofs = 0x30,
+	.clr_ofs = 0x30,
+	.sta_ofs = 0x30,
+};
+
+static const struct mtk_gate_regs dem2_cg_regs = {
+	.set_ofs = 0x70,
+	.clr_ofs = 0x70,
+	.sta_ofs = 0x70,
+};
+
+#define GATE_DEM0(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &dem0_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_no_setclr_inv,	\
+	}
+
+#define GATE_DEM1(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &dem1_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_no_setclr_inv,	\
+	}
+
+#define GATE_DEM2(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &dem2_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_no_setclr_inv,	\
+	}
+
+static const struct mtk_gate dem_clks[] = {
+	/* DEM0 */
+	GATE_DEM0(CLK_DEM_BUSCLK_EN, "dem_busclk_en", "axi_sel", 0),
+	/* DEM1 */
+	GATE_DEM1(CLK_DEM_SYSCLK_EN, "dem_sysclk_en", "axi_sel", 0),
+	/* DEM2 */
+	GATE_DEM2(CLK_DEM_ATB_EN, "dem_atb_en", "atb_sel", 0),
+};
+
+static const struct mtk_clk_desc dem_mcd = {
+	.clks = dem_clks,
+	.num_clks = ARRAY_SIZE(dem_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8189_dbgao[] = {
+	{ .compatible = "mediatek,mt8189-dbg-ao", .data = &dbgao_mcd },
+	{ .compatible = "mediatek,mt8189-dem", .data = &dem_mcd },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8189_dbgao_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8189-dbgao",
+		.of_match_table = of_match_clk_mt8189_dbgao,
+	},
+};
+
+module_platform_driver(clk_mt8189_dbgao_drv);
+MODULE_LICENSE("GPL");
-- 
2.45.2


