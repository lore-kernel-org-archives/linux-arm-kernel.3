Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6FAD73E86
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 06:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npF3A6I6yVkETktSnA7uYlBadbl2s13ILNBTMPJ7Pns=; b=mNhQxlRbD0SoY8ZKBRcC8sT02l
	m/9EY7zK9BMTFwa0S4qGEMv35drjIxKZcVMNmEH12eOPuwpWTll5SUVx13m9gfxHIDkfS9xfbBMcv
	FPpmIH0PXlakTttvcMGsbelhkPAU4z7mYdDEm3K/ZheoxFzZOP8IbIEryCvl94T/3RRkzwVBapqRZ
	YINKuv02CrtxnhHlzzi9St4HhUSPsPvRdZOM30IoINsGYPtZM7GOJJMrsTlWPj3eTCZQVFHDP6Qoe
	LLxZNtZhIaljRPprbdxKFREQuwsucYUxEEZFQIuduNUq8HAi/Xizk8rENc5hCIqmgUGJ42kaBGkdP
	hPlRTvVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnR6-00000004WF2-3wac;
	Mon, 02 Feb 2026 06:29:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnQd-00000004Vjb-05np;
	Mon, 02 Feb 2026 06:28:59 +0000
X-UUID: 6db37ce2000011f1ad39f32c34db0b1c-20260201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=npF3A6I6yVkETktSnA7uYlBadbl2s13ILNBTMPJ7Pns=;
	b=os+2ZJmXI4ub67yJcqRZWBAgnPQo+bR6HxtZacDoAJOJAsw/s/6gvknXsB7Bx7CG9MQTtBdyTghAXJuXtSSq+Arc3KnV5CNcgsyr6V7NItihnCg4tJ6L7ReTOnGneMof4CoG/rqR1d1SSiwKdl/f9C5LBEOmzIdHFnBdrHnz/E8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:5571075f-b25b-4e09-a6a1-2305b36a918e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:f56734e9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6db37ce2000011f1ad39f32c34db0b1c-20260201
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1980658752; Sun, 01 Feb 2026 23:28:46 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 14:28:44 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Feb 2026 14:28:44 +0800
From: irving.ch.lin <irving-ch.lin@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Richard Cochran
	<richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Qiqi Wang
	<qiqi.wang@mediatek.com>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>,
	<irving-ch.lin@mediatek.com>
Subject: [PATCH v5 10/18] clk: mediatek: Add MT8189 dvfsrc clock support
Date: Mon, 2 Feb 2026 14:28:17 +0800
Message-ID: <20260202062840.342707-11-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_222855_076380_FFB15746 
X-CRM114-Status: GOOD (  18.83  )
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

Add support for the MT8189 dvfsrc clock controller,
which provides clock gate control for dram dvfs.

Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 drivers/clk/mediatek/Kconfig             | 10 +++++
 drivers/clk/mediatek/Makefile            |  1 +
 drivers/clk/mediatek/clk-mt8189-dvfsrc.c | 54 ++++++++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8189-dvfsrc.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 89f68cb56bb3..5def42855b62 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -860,6 +860,16 @@ config COMMON_CLK_MT8189_DBGAO
 	  vcore debug system clocks. If you want to control its clocks, say Y or M
 	  to include this driver in your kernel build.
 
+config COMMON_CLK_MT8189_DVFSRC
+	tristate "Clock driver for MediaTek MT8189 dvfsrc"
+	depends on COMMON_CLK_MT8189
+	default COMMON_CLK_MT8189
+	help
+	  Enable this to support the clock management for the dvfsrc
+	  on MediaTek MT8189 SoCs. This includes enabling and disabling
+	  vcore dvfs clocks. If you want to control its clocks, say Y or M
+	  to include this driver in your kernel build.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index eabe2cab4b8d..3a8dad865c97 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -128,6 +128,7 @@ obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o
 obj-$(CONFIG_COMMON_CLK_MT8189_BUS) += clk-mt8189-bus.o
 obj-$(CONFIG_COMMON_CLK_MT8189_CAM) += clk-mt8189-cam.o
 obj-$(CONFIG_COMMON_CLK_MT8189_DBGAO) += clk-mt8189-dbgao.o
+obj-$(CONFIG_COMMON_CLK_MT8189_DVFSRC) += clk-mt8189-dvfsrc.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8189-dvfsrc.c b/drivers/clk/mediatek/clk-mt8189-dvfsrc.c
new file mode 100644
index 000000000000..f8ab656af6e6
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-dvfsrc.c
@@ -0,0 +1,54 @@
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
+static const struct mtk_gate_regs dvfsrc_top_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x0,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_DVFSRC_TOP_FLAGS(_id, _name, _parent, _shift, _flags)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &dvfsrc_top_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_no_setclr_inv, _flags)
+
+static const struct mtk_gate dvfsrc_top_clks[] = {
+	GATE_DVFSRC_TOP_FLAGS(CLK_DVFSRC_TOP_DVFSRC_EN, "dvfsrc_dvfsrc_en",
+			      "clk26m", 0, CLK_IS_CRITICAL),
+};
+
+static const struct mtk_clk_desc dvfsrc_top_mcd = {
+	.clks = dvfsrc_top_clks,
+	.num_clks = ARRAY_SIZE(dvfsrc_top_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8189_dvfsrc[] = {
+	{ .compatible = "mediatek,mt8189-dvfsrc-top", .data = &dvfsrc_top_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_dvfsrc);
+
+static struct platform_driver clk_mt8189_dvfsrc_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8189-dvfsrc",
+		.of_match_table = of_match_clk_mt8189_dvfsrc,
+	},
+};
+
+module_platform_driver(clk_mt8189_dvfsrc_drv);
+MODULE_DESCRIPTION("MediaTek MT8189 dvfsrc clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


