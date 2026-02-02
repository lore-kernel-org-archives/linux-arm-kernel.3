Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5C2D73E86
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 06:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tPokiXZlW+HYG1DX+dbiowxBxLPUafss9siq+Yk1l4=; b=LjhVo8AmRvClEeTy55DP1tZ8eK
	MvKMzITG1smAzqqdfVT+5AST5StsTe77hk9USwRTZ2p7FfVx/Nsz2swe4MuHfNo5EFVMYAIOS0ul3
	Q/HNeRvDmHuT5deE2CmWM28Kz3k/FcJ15BZSTLu5Jwvzu0g1cMzTkoVOOLZiW954+TOWUpCbH8yf9
	p9h60Onhyy+e8le8qzl08b2CQE9cQgrJ3INSRKE0u5kNVvNTKblX0KmKQ+p2dFH678UNC9GqzyDhA
	p3hPxDgyanHQ38rOAwnxJ/M0qaVwsSn5heElwpbATfiyLbwcpUBodHKcL/66vAAcnKuyY5l8uZTtq
	uJQ7S2lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnR7-00000004WGB-2BNA;
	Mon, 02 Feb 2026 06:29:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnQe-00000004Vgy-0Q1p;
	Mon, 02 Feb 2026 06:28:59 +0000
X-UUID: 6ef111fa000011f1ad39f32c34db0b1c-20260201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0tPokiXZlW+HYG1DX+dbiowxBxLPUafss9siq+Yk1l4=;
	b=MJyoj4nAF3jR2tQimqXzZ1vmDisz0oXY6psAcYk5ogJVsir92km2S37Uv32OdHfwNkB511ktFyF3rQaV7gEapVqWx98x+HeTR/TJg2v1s+eOg9lh22pT5v4vwaE3tAkrw1XdtlvcVSd20DaN+F6hAo8aUB+txYguEfzKc3EbqHo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:622a7d3a-864b-4b62-a971-8e8f4e26c02a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:63c838f0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6ef111fa000011f1ad39f32c34db0b1c-20260201
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1773554317; Sun, 01 Feb 2026 23:28:48 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 14:28:45 +0800
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
Subject: [PATCH v5 13/18] clk: mediatek: Add MT8189 mdp clock support
Date: Mon, 2 Feb 2026 14:28:20 +0800
Message-ID: <20260202062840.342707-14-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_222856_184007_AEFBBB7D 
X-CRM114-Status: GOOD (  20.11  )
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

Add support for the MT8189 mdp clock controller,
which provides clock gate control for display system.

Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 drivers/clk/mediatek/Kconfig             | 12 ++++
 drivers/clk/mediatek/Makefile            |  1 +
 drivers/clk/mediatek/clk-mt8189-mdpsys.c | 91 ++++++++++++++++++++++++
 3 files changed, 104 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8189-mdpsys.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index e6c5d8a69607..bd50e18e48f4 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -894,6 +894,18 @@ config COMMON_CLK_MT8189_IMG
 	  are building a kernel for a device that uses the MT8189 SoC and requires
 	  image processing capabilities, say Y or M to include this driver.
 
+config COMMON_CLK_MT8189_MDPSYS
+	tristate "Clock driver for MediaTek MT8189 mdpsys"
+	depends on COMMON_CLK_MT8189
+	default COMMON_CLK_MT8189
+	help
+	  This driver supports the display system clocks on the MediaTek MT8189
+	  SoC. By enabling this option, it allows for the control of the clocks
+	  related to the display subsystem. This is crucial for the proper
+	  functionality of the display features on devices powered by the MT8189
+	  chipset, ensuring that the display system operates efficiently and
+	  effectively.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index a1eaf123f2f0..9b23e4c5e019 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -131,6 +131,7 @@ obj-$(CONFIG_COMMON_CLK_MT8189_DBGAO) += clk-mt8189-dbgao.o
 obj-$(CONFIG_COMMON_CLK_MT8189_DVFSRC) += clk-mt8189-dvfsrc.o
 obj-$(CONFIG_COMMON_CLK_MT8189_IIC) += clk-mt8189-iic.o
 obj-$(CONFIG_COMMON_CLK_MT8189_IMG) += clk-mt8189-img.o
+obj-$(CONFIG_COMMON_CLK_MT8189_MDPSYS) += clk-mt8189-mdpsys.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8189-mdpsys.c b/drivers/clk/mediatek/clk-mt8189-mdpsys.c
new file mode 100644
index 000000000000..282bfb77b47d
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-mdpsys.c
@@ -0,0 +1,91 @@
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
+static const struct mtk_gate_regs mdp0_cg_regs = {
+	.set_ofs = 0x04,
+	.clr_ofs = 0x08,
+	.sta_ofs = 0x00,
+};
+
+static const struct mtk_gate_regs mdp1_cg_regs = {
+	.set_ofs = 0x14,
+	.clr_ofs = 0x18,
+	.sta_ofs = 0x10,
+};
+
+#define GATE_MDP0(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &mdp0_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, CLK_IGNORE_UNUSED)
+
+#define GATE_MDP1(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &mdp1_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, CLK_IGNORE_UNUSED)
+
+static const struct mtk_gate mdp_clks[] = {
+	/* MDP0 */
+	GATE_MDP0(CLK_MDP_MUTEX0, "mdp_mutex0", "mdp0_sel", 0),
+	GATE_MDP0(CLK_MDP_APB_BUS, "mdp_apb_bus", "mdp0_sel", 1),
+	GATE_MDP0(CLK_MDP_SMI0, "mdp_smi0", "mdp0_sel", 2),
+	GATE_MDP0(CLK_MDP_RDMA0, "mdp_rdma0", "mdp0_sel", 3),
+	GATE_MDP0(CLK_MDP_RDMA2, "mdp_rdma2", "mdp0_sel", 4),
+	GATE_MDP0(CLK_MDP_HDR0, "mdp_hdr0", "mdp0_sel", 5),
+	GATE_MDP0(CLK_MDP_AAL0, "mdp_aal0", "mdp0_sel", 6),
+	GATE_MDP0(CLK_MDP_RSZ0, "mdp_rsz0", "mdp0_sel", 7),
+	GATE_MDP0(CLK_MDP_TDSHP0, "mdp_tdshp0", "mdp0_sel", 8),
+	GATE_MDP0(CLK_MDP_COLOR0, "mdp_color0", "mdp0_sel", 9),
+	GATE_MDP0(CLK_MDP_WROT0, "mdp_wrot0", "mdp0_sel", 10),
+	GATE_MDP0(CLK_MDP_FAKE_ENG0, "mdp_fake_eng0", "mdp0_sel", 11),
+	GATE_MDP0(CLK_MDPSYS_CONFIG, "mdpsys_config", "mdp0_sel", 14),
+	GATE_MDP0(CLK_MDP_RDMA1, "mdp_rdma1", "mdp0_sel", 15),
+	GATE_MDP0(CLK_MDP_RDMA3, "mdp_rdma3", "mdp0_sel", 16),
+	GATE_MDP0(CLK_MDP_HDR1, "mdp_hdr1", "mdp0_sel", 17),
+	GATE_MDP0(CLK_MDP_AAL1, "mdp_aal1", "mdp0_sel", 18),
+	GATE_MDP0(CLK_MDP_RSZ1, "mdp_rsz1", "mdp0_sel", 19),
+	GATE_MDP0(CLK_MDP_TDSHP1, "mdp_tdshp1", "mdp0_sel", 20),
+	GATE_MDP0(CLK_MDP_COLOR1, "mdp_color1", "mdp0_sel", 21),
+	GATE_MDP0(CLK_MDP_WROT1, "mdp_wrot1", "mdp0_sel", 22),
+	GATE_MDP0(CLK_MDP_RSZ2, "mdp_rsz2", "mdp0_sel", 24),
+	GATE_MDP0(CLK_MDP_WROT2, "mdp_wrot2", "mdp0_sel", 25),
+	GATE_MDP0(CLK_MDP_RSZ3, "mdp_rsz3", "mdp0_sel", 28),
+	GATE_MDP0(CLK_MDP_WROT3, "mdp_wrot3", "mdp0_sel", 29),
+	/* MDP1 */
+	GATE_MDP1(CLK_MDP_BIRSZ0, "mdp_birsz0", "mdp0_sel", 3),
+	GATE_MDP1(CLK_MDP_BIRSZ1, "mdp_birsz1", "mdp0_sel", 4),
+};
+
+static const struct mtk_clk_desc mdp_mcd = {
+	.clks = mdp_clks,
+	.num_clks = ARRAY_SIZE(mdp_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8189_mdpsys[] = {
+	{ .compatible = "mediatek,mt8189-mdpsys", .data = &mdp_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_mdpsys);
+
+static struct platform_driver clk_mt8189_mdpsys_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8189-mdpsys",
+		.of_match_table = of_match_clk_mt8189_mdpsys,
+	},
+};
+
+module_platform_driver(clk_mt8189_mdpsys_drv);
+MODULE_DESCRIPTION("MediaTek MT8189 mdpsys clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


