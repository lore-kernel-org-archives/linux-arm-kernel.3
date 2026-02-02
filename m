Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CCAD172CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 06:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPmJIgflUmPXUpdmay8UGs2RCZJ1tT3vU6hkRkm1Tqk=; b=sVprugG8Mgnjvi8eiOUYzGPePv
	MfbpVQXkWvLGj6oaxl3IqFiZE0wLC0C+3hRlIHcnXvaWEQXx5R7T95/6VpEo1cq3/Rp+A49gNAiv3
	DllRw6bWh1q2fVIj8PuDSZOp33b7W0JNUKz8BnlKiCvyqTWxdZTDLlj8eDBP1ksbae5lelOnWpGMs
	Fq7lMgZq8kOzz/Aorjy/vXaz4y8beks/pgarLJ7sTVfUXDC/iJnmVKd1odf3X/Yvzh63pr80OlMtm
	W4D6a4SwDIpCPu3lLkuhoZIXhITZQ5o6Q9Ba1tu+V4MwIH5mKkCDZn3vjZSsoLzSJWLPttQU8qIwO
	MZAjH2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnRM-00000004WZ6-1R5M;
	Mon, 02 Feb 2026 06:29:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnQf-00000004Vii-1vVd;
	Mon, 02 Feb 2026 06:29:03 +0000
X-UUID: 6e652a64000011f1ad39f32c34db0b1c-20260201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mPmJIgflUmPXUpdmay8UGs2RCZJ1tT3vU6hkRkm1Tqk=;
	b=sMH8uwCvEgGZeTgFQ3tdH9d8Bi4U3Jy/CgSpdfJO69z4oIRPUYjWd1PHY1djyQs57V89HXx8YlZhqhEQhk91F6K93rLup5BX6feTpRa+3oBlWm0f/N5oFLUbrr1QHpghLvKJYByyFuMXoLk78trTAZwPM9D0OpC1qJFV3c8Z94U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:6e870a5c-7a11-4cb3-bcbc-186025eca514,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:62c838f0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6e652a64000011f1ad39f32c34db0b1c-20260201
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 745545307; Sun, 01 Feb 2026 23:28:47 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
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
	<richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Qiqi Wang
	<qiqi.wang@mediatek.com>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>,
	<irving-ch.lin@mediatek.com>
Subject: [PATCH v5 12/18] clk: mediatek: Add MT8189 img clock support
Date: Mon, 2 Feb 2026 14:28:19 +0800
Message-ID: <20260202062840.342707-13-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_222857_559772_2CF26BB7 
X-CRM114-Status: GOOD (  19.20  )
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

Add support for the MT8189 img clock controller,
which provides clock gate control for image processing module.

Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |  11 +++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8189-img.c | 107 ++++++++++++++++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8189-img.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 89e85c70d3e6..e6c5d8a69607 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -883,6 +883,17 @@ config COMMON_CLK_MT8189_IIC
 	  the MT8189 chipset, improving the overall performance and power
 	  efficiency of the device.
 
+config COMMON_CLK_MT8189_IMG
+	tristate "Clock driver for MediaTek MT8189 img"
+	depends on COMMON_CLK_MT8189
+	default COMMON_CLK_MT8189
+	help
+	  Enable this to support the clock framework for MediaTek MT8189 SoC's
+	  image processing units. This includes clocks necessary for the operation
+	  of image-related hardware blocks such as ISP, VENC, and VDEC. If you
+	  are building a kernel for a device that uses the MT8189 SoC and requires
+	  image processing capabilities, say Y or M to include this driver.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 0eed1edf7c63..a1eaf123f2f0 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -130,6 +130,7 @@ obj-$(CONFIG_COMMON_CLK_MT8189_CAM) += clk-mt8189-cam.o
 obj-$(CONFIG_COMMON_CLK_MT8189_DBGAO) += clk-mt8189-dbgao.o
 obj-$(CONFIG_COMMON_CLK_MT8189_DVFSRC) += clk-mt8189-dvfsrc.o
 obj-$(CONFIG_COMMON_CLK_MT8189_IIC) += clk-mt8189-iic.o
+obj-$(CONFIG_COMMON_CLK_MT8189_IMG) += clk-mt8189-img.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8189-img.c b/drivers/clk/mediatek/clk-mt8189-img.c
new file mode 100644
index 000000000000..d79f48dbe3e1
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-img.c
@@ -0,0 +1,107 @@
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
+static const struct mtk_gate_regs imgsys1_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMGSYS1(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &imgsys1_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, CLK_IGNORE_UNUSED)
+
+static const struct mtk_gate imgsys1_clks[] = {
+	GATE_IMGSYS1(CLK_IMGSYS1_LARB9, "imgsys1_larb9", "img1_sel", 0),
+	GATE_IMGSYS1(CLK_IMGSYS1_LARB11, "imgsys1_larb11", "img1_sel", 1),
+	GATE_IMGSYS1(CLK_IMGSYS1_DIP, "imgsys1_dip", "img1_sel", 2),
+	GATE_IMGSYS1(CLK_IMGSYS1_GALS, "imgsys1_gals", "img1_sel", 12),
+};
+
+static const struct mtk_clk_desc imgsys1_mcd = {
+	.clks = imgsys1_clks,
+	.num_clks = ARRAY_SIZE(imgsys1_clks),
+};
+
+static const struct mtk_gate_regs imgsys2_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMGSYS2(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &imgsys2_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, CLK_IGNORE_UNUSED)
+
+static const struct mtk_gate imgsys2_clks[] = {
+	GATE_IMGSYS2(CLK_IMGSYS2_LARB9, "imgsys2_larb9", "img1_sel", 0),
+	GATE_IMGSYS2(CLK_IMGSYS2_LARB11, "imgsys2_larb11", "img1_sel", 1),
+	GATE_IMGSYS2(CLK_IMGSYS2_MFB, "imgsys2_mfb", "img1_sel", 6),
+	GATE_IMGSYS2(CLK_IMGSYS2_WPE, "imgsys2_wpe", "img1_sel", 7),
+	GATE_IMGSYS2(CLK_IMGSYS2_MSS, "imgsys2_mss", "img1_sel", 8),
+	GATE_IMGSYS2(CLK_IMGSYS2_GALS, "imgsys2_gals", "img1_sel", 12),
+};
+
+static const struct mtk_clk_desc imgsys2_mcd = {
+	.clks = imgsys2_clks,
+	.num_clks = ARRAY_SIZE(imgsys2_clks),
+};
+
+static const struct mtk_gate_regs ipe_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IPE(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &ipe_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, CLK_IGNORE_UNUSED)
+
+static const struct mtk_gate ipe_clks[] = {
+	GATE_IPE(CLK_IPE_LARB19, "ipe_larb19", "ipe_sel", 0),
+	GATE_IPE(CLK_IPE_LARB20, "ipe_larb20", "ipe_sel", 1),
+	GATE_IPE(CLK_IPE_SMI_SUBCOM, "ipe_smi_subcom", "ipe_sel", 2),
+	GATE_IPE(CLK_IPE_FD, "ipe_fd", "ipe_sel", 3),
+	GATE_IPE(CLK_IPE_FE, "ipe_fe", "ipe_sel", 4),
+	GATE_IPE(CLK_IPE_RSC, "ipe_rsc", "ipe_sel", 5),
+	GATE_IPE(CLK_IPESYS_GALS, "ipesys_gals", "ipe_sel", 8),
+};
+
+static const struct mtk_clk_desc ipe_mcd = {
+	.clks = ipe_clks,
+	.num_clks = ARRAY_SIZE(ipe_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8189_img[] = {
+	{ .compatible = "mediatek,mt8189-imgsys1", .data = &imgsys1_mcd },
+	{ .compatible = "mediatek,mt8189-imgsys2", .data = &imgsys2_mcd },
+	{ .compatible = "mediatek,mt8189-ipesys", .data = &ipe_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_img);
+
+static struct platform_driver clk_mt8189_img_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8189-img",
+		.of_match_table = of_match_clk_mt8189_img,
+	},
+};
+
+module_platform_driver(clk_mt8189_img_drv);
+MODULE_DESCRIPTION("MediaTek MT8189 img clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


