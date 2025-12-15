Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042DDD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 03:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfcYv8xCWEnmE7vnK/cJOOYJgfHykVJ5qzdgQm50YP8=; b=YZu47TdUCeTSuvKVmbxn6kmhnL
	xkjSCp5CrjAUV7gTA5KMwpl9h6LIwWbgQ4f9EGn2ntiqIiHoe1i3qCIC218iIC9oCU0zsqQh9uiYp
	gtYyWt2vGh0PzMldsbVQ6XFAU1gHUkCjSimG3Ad3qc2YtbfnEg49s7Fgi7xpOKfjVh8u5cxwJQ+bO
	d4FFXqn++RIqmPea0oCNMvint0wBYy8BTajundHdNjaFnAXjEpCmkmFUiW4KfpmqlraBQzpSelmrJ
	jXTmt/bWzSFdFSpNQUOLMzbFnqIy7Rn9tTU0W9mBDjSc1JY1XWKT+PAQK9TF91RVwLGsV+ilbs97Y
	bTknRD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUzd9-000000030oA-2yvk;
	Mon, 15 Dec 2025 03:52:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUzb3-00000002ziz-32Qp;
	Mon, 15 Dec 2025 03:50:14 +0000
X-UUID: 1e60a286d96911f0a52f393f94899d25-20251214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yfcYv8xCWEnmE7vnK/cJOOYJgfHykVJ5qzdgQm50YP8=;
	b=lKBirLewCbxeujb6B0ipDQMT0EVI/1Vcqtv+kyU6Sood4IAWwYp5ZgiIPq/3wLLVq7YMgvB7JSsEtVNbBMJS7z7KOTqgESFY1jt12gjlpsNeCv9aQ4vkFhcjEhcsiZU9u9Rdl2zk/Di1e6XXcbx2EvDEWMeyNQ+W7S8KXv+B7oo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9332113c-116e-4a30-aec7-f802010dfaf6,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:00f530aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1e60a286d96911f0a52f393f94899d25-20251214
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 565285900; Sun, 14 Dec 2025 20:49:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 11:49:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 11:49:52 +0800
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
Subject: [PATCH v4 08/21] clk: mediatek: Add MT8189 bus clock support
Date: Mon, 15 Dec 2025 11:49:17 +0800
Message-ID: <20251215034944.2973003-9-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251215034944.2973003-1-irving-ch.lin@mediatek.com>
References: <20251215034944.2973003-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_195005_924451_7F7D4976 
X-CRM114-Status: GOOD (  16.02  )
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

Add support for the MT8189 bus clock controller,
which provides clock gate control for infra/peri IPs
(such as spi, uart, msdc, flashif ...).

Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |  11 ++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8189-bus.c | 196 ++++++++++++++++++++++++++
 3 files changed, 208 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8189-bus.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 2c898fd8a34c..0e7fdb5421e6 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -828,6 +828,17 @@ config COMMON_CLK_MT8189
 	  with the MediaTek MT8189 hardware capabilities, providing efficient management of
 	  clock speeds and power consumption.
 
+config COMMON_CLK_MT8189_BUS
+	tristate "Clock driver for MediaTek MT8189 bus"
+	depends on COMMON_CLK_MT8189
+	default COMMON_CLK_MT8189
+	help
+	  Enable this configuration option to support the clock framework for
+	  MediaTek MT8189 SoC bus clocks. It includes the necessary clock
+	  management for bus-related peripherals and interconnects within the
+	  MT8189 chipset, ensuring that all bus-related components receive the
+	  correct clock signals for optimal performance.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index d9279b237b7b..aabfb42cb1b2 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -125,6 +125,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
 obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o \
 				   clk-mt8189-vlpckgen.o clk-mt8189-vlpcfg.o
+obj-$(CONFIG_COMMON_CLK_MT8189_BUS) += clk-mt8189-bus.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8189-bus.c b/drivers/clk/mediatek/clk-mt8189-bus.c
new file mode 100644
index 000000000000..c9b83fa98590
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-bus.c
@@ -0,0 +1,196 @@
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
+static const struct mtk_gate_regs ifrao0_cg_regs = {
+	.set_ofs = 0x80,
+	.clr_ofs = 0x84,
+	.sta_ofs = 0x90,
+};
+
+static const struct mtk_gate_regs ifrao1_cg_regs = {
+	.set_ofs = 0x88,
+	.clr_ofs = 0x8c,
+	.sta_ofs = 0x94,
+};
+
+static const struct mtk_gate_regs ifrao2_cg_regs = {
+	.set_ofs = 0xa4,
+	.clr_ofs = 0xa8,
+	.sta_ofs = 0xac,
+};
+
+#define GATE_IFRAO0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &ifrao0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_IFRAO1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &ifrao1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_IFRAO2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &ifrao2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate ifrao_clks[] = {
+	/* IFRAO0 */
+	GATE_IFRAO0(CLK_IFRAO_CQ_DMA_FPC, "ifrao_dma", "clk26m", 28),
+	/* IFRAO1 */
+	GATE_IFRAO1(CLK_IFRAO_DEBUGSYS, "ifrao_debugsys", "axi_sel", 24),
+	GATE_IFRAO1(CLK_IFRAO_DBG_TRACE, "ifrao_dbg_trace", "axi_sel", 29),
+	/* IFRAO2 */
+	GATE_IFRAO2(CLK_IFRAO_CQ_DMA, "ifrao_cq_dma", "axi_sel", 27),
+};
+
+static const struct mtk_clk_desc ifrao_mcd = {
+	.clks = ifrao_clks,
+	.num_clks = ARRAY_SIZE(ifrao_clks),
+};
+
+static const struct mtk_gate_regs perao0_cg_regs = {
+	.set_ofs = 0x24,
+	.clr_ofs = 0x28,
+	.sta_ofs = 0x10,
+};
+
+static const struct mtk_gate_regs perao1_cg_regs = {
+	.set_ofs = 0x2c,
+	.clr_ofs = 0x30,
+	.sta_ofs = 0x14,
+};
+
+static const struct mtk_gate_regs perao2_cg_regs = {
+	.set_ofs = 0x34,
+	.clr_ofs = 0x38,
+	.sta_ofs = 0x18,
+};
+
+#define GATE_PERAO0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &perao0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_PERAO1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &perao1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_PERAO2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &perao2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate perao_clks[] = {
+	/* PERAO0 */
+	GATE_PERAO0(CLK_PERAO_UART0, "perao_uart0", "uart_sel", 0),
+	GATE_PERAO0(CLK_PERAO_UART1, "perao_uart1", "uart_sel", 1),
+	GATE_PERAO0(CLK_PERAO_UART2, "perao_uart2", "uart_sel", 2),
+	GATE_PERAO0(CLK_PERAO_UART3, "perao_uart3", "uart_sel", 3),
+	GATE_PERAO0(CLK_PERAO_PWM_H, "perao_pwm_h", "axi_peri_sel", 4),
+	GATE_PERAO0(CLK_PERAO_PWM_B, "perao_pwm_b", "pwm_sel", 5),
+	GATE_PERAO0(CLK_PERAO_PWM_FB1, "perao_pwm_fb1", "pwm_sel", 6),
+	GATE_PERAO0(CLK_PERAO_PWM_FB2, "perao_pwm_fb2", "pwm_sel", 7),
+	GATE_PERAO0(CLK_PERAO_PWM_FB3, "perao_pwm_fb3", "pwm_sel", 8),
+	GATE_PERAO0(CLK_PERAO_PWM_FB4, "perao_pwm_fb4", "pwm_sel", 9),
+	GATE_PERAO0(CLK_PERAO_DISP_PWM0, "perao_disp_pwm0", "disp_pwm_sel", 10),
+	GATE_PERAO0(CLK_PERAO_DISP_PWM1, "perao_disp_pwm1", "disp_pwm_sel", 11),
+	GATE_PERAO0(CLK_PERAO_SPI0_B, "perao_spi0_b", "spi0_sel", 12),
+	GATE_PERAO0(CLK_PERAO_SPI1_B, "perao_spi1_b", "spi1_sel", 13),
+	GATE_PERAO0(CLK_PERAO_SPI2_B, "perao_spi2_b", "spi2_sel", 14),
+	GATE_PERAO0(CLK_PERAO_SPI3_B, "perao_spi3_b", "spi3_sel", 15),
+	GATE_PERAO0(CLK_PERAO_SPI4_B, "perao_spi4_b", "spi4_sel", 16),
+	GATE_PERAO0(CLK_PERAO_SPI5_B, "perao_spi5_b", "spi5_sel", 17),
+	GATE_PERAO0(CLK_PERAO_SPI0_H, "perao_spi0_h", "axi_peri_sel", 18),
+	GATE_PERAO0(CLK_PERAO_SPI1_H, "perao_spi1_h", "axi_peri_sel", 19),
+	GATE_PERAO0(CLK_PERAO_SPI2_H, "perao_spi2_h", "axi_peri_sel", 20),
+	GATE_PERAO0(CLK_PERAO_SPI3_H, "perao_spi3_h", "axi_peri_sel", 21),
+	GATE_PERAO0(CLK_PERAO_SPI4_H, "perao_spi4_h", "axi_peri_sel", 22),
+	GATE_PERAO0(CLK_PERAO_SPI5_H, "perao_spi5_h", "axi_peri_sel", 23),
+	GATE_PERAO0(CLK_PERAO_AXI, "perao_axi", "mem_sub_peri_sel", 24),
+	GATE_PERAO0(CLK_PERAO_AHB_APB, "perao_ahb_apb", "axi_peri_sel", 25),
+	GATE_PERAO0(CLK_PERAO_TL, "perao_tl", "pcie_mac_tl_sel", 26),
+	GATE_PERAO0(CLK_PERAO_REF, "perao_ref", "clk26m", 27),
+	GATE_PERAO0(CLK_PERAO_I2C, "perao_i2c", "axi_peri_sel", 28),
+	GATE_PERAO0(CLK_PERAO_DMA_B, "perao_dma_b", "axi_peri_sel", 29),
+	/* PERAO1 */
+	GATE_PERAO1(CLK_PERAO_SSUSB0_REF, "perao_ssusb0_ref", "clk26m", 1),
+	GATE_PERAO1(CLK_PERAO_SSUSB0_FRMCNT, "perao_ssusb0_frmcnt", "univpll_192m_d4", 2),
+	GATE_PERAO1(CLK_PERAO_SSUSB0_SYS, "perao_ssusb0_sys", "usb_p0_sel", 4),
+	GATE_PERAO1(CLK_PERAO_SSUSB0_XHCI, "perao_ssusb0_xhci", "ssusb_xhci_p0_sel", 5),
+	GATE_PERAO1(CLK_PERAO_SSUSB0_F, "perao_ssusb0_f", "axi_peri_sel", 6),
+	GATE_PERAO1(CLK_PERAO_SSUSB0_H, "perao_ssusb0_h", "axi_peri_sel", 7),
+	GATE_PERAO1(CLK_PERAO_SSUSB1_REF, "perao_ssusb1_ref", "clk26m", 8),
+	GATE_PERAO1(CLK_PERAO_SSUSB1_FRMCNT, "perao_ssusb1_frmcnt", "univpll_192m_d4", 9),
+	GATE_PERAO1(CLK_PERAO_SSUSB1_SYS, "perao_ssusb1_sys", "usb_p1_sel", 11),
+	GATE_PERAO1(CLK_PERAO_SSUSB1_XHCI, "perao_ssusb1_xhci", "ssusb_xhci_p1_sel", 12),
+	GATE_PERAO1(CLK_PERAO_SSUSB1_F, "perao_ssusb1_f", "axi_peri_sel", 13),
+	GATE_PERAO1(CLK_PERAO_SSUSB1_H, "perao_ssusb1_h", "axi_peri_sel", 14),
+	GATE_PERAO1(CLK_PERAO_SSUSB2_REF, "perao_ssusb2_ref", "clk26m", 15),
+	GATE_PERAO1(CLK_PERAO_SSUSB2_FRMCNT, "perao_ssusb2_frmcnt", "univpll_192m_d4", 16),
+	GATE_PERAO1(CLK_PERAO_SSUSB2_SYS, "perao_ssusb2_sys", "usb_p2_sel", 18),
+	GATE_PERAO1(CLK_PERAO_SSUSB2_XHCI, "perao_ssusb2_xhci", "ssusb_xhci_p2_sel", 19),
+	GATE_PERAO1(CLK_PERAO_SSUSB2_F, "perao_ssusb2_f", "axi_peri_sel", 20),
+	GATE_PERAO1(CLK_PERAO_SSUSB2_H, "perao_ssusb2_h", "axi_peri_sel", 21),
+	GATE_PERAO1(CLK_PERAO_SSUSB3_REF, "perao_ssusb3_ref", "clk26m", 23),
+	GATE_PERAO1(CLK_PERAO_SSUSB3_FRMCNT, "perao_ssusb3_frmcnt", "univpll_192m_d4", 24),
+	GATE_PERAO1(CLK_PERAO_SSUSB3_SYS, "perao_ssusb3_sys", "usb_p3_sel", 26),
+	GATE_PERAO1(CLK_PERAO_SSUSB3_XHCI, "perao_ssusb3_xhci", "ssusb_xhci_p3_sel", 27),
+	GATE_PERAO1(CLK_PERAO_SSUSB3_F, "perao_ssusb3_f", "axi_peri_sel", 28),
+	GATE_PERAO1(CLK_PERAO_SSUSB3_H, "perao_ssusb3_h", "axi_peri_sel", 29),
+	/* PERAO2 */
+	GATE_PERAO2(CLK_PERAO_SSUSB4_REF, "perao_ssusb4_ref", "clk26m", 0),
+	GATE_PERAO2(CLK_PERAO_SSUSB4_FRMCNT, "perao_ssusb4_frmcnt", "univpll_192m_d4", 1),
+	GATE_PERAO2(CLK_PERAO_SSUSB4_SYS, "perao_ssusb4_sys", "usb_p4_sel", 3),
+	GATE_PERAO2(CLK_PERAO_SSUSB4_XHCI, "perao_ssusb4_xhci", "ssusb_xhci_p4_sel", 4),
+	GATE_PERAO2(CLK_PERAO_SSUSB4_F, "perao_ssusb4_f", "axi_peri_sel", 5),
+	GATE_PERAO2(CLK_PERAO_SSUSB4_H, "perao_ssusb4_h", "axi_peri_sel", 6),
+	GATE_PERAO2(CLK_PERAO_MSDC0, "perao_msdc0", "msdc50_0_sel", 7),
+	GATE_PERAO2(CLK_PERAO_MSDC0_H, "perao_msdc0_h", "msdc5hclk_sel", 8),
+	GATE_PERAO2(CLK_PERAO_MSDC0_FAES, "perao_msdc0_faes", "aes_msdcfde_sel", 9),
+	GATE_PERAO2(CLK_PERAO_MSDC0_MST_F, "perao_msdc0_mst_f", "axi_peri_sel", 10),
+	GATE_PERAO2(CLK_PERAO_MSDC0_SLV_H, "perao_msdc0_slv_h", "axi_peri_sel", 11),
+	GATE_PERAO2(CLK_PERAO_MSDC1, "perao_msdc1", "msdc30_1_sel", 12),
+	GATE_PERAO2(CLK_PERAO_MSDC1_H, "perao_msdc1_h", "msdc30_1_h_sel", 13),
+	GATE_PERAO2(CLK_PERAO_MSDC1_MST_F, "perao_msdc1_mst_f", "axi_peri_sel", 14),
+	GATE_PERAO2(CLK_PERAO_MSDC1_SLV_H, "perao_msdc1_slv_h", "axi_peri_sel", 15),
+	GATE_PERAO2(CLK_PERAO_MSDC2, "perao_msdc2", "msdc30_2_sel", 16),
+	GATE_PERAO2(CLK_PERAO_MSDC2_H, "perao_msdc2_h", "msdc30_2_h_sel", 17),
+	GATE_PERAO2(CLK_PERAO_MSDC2_MST_F, "perao_msdc2_mst_f", "axi_peri_sel", 18),
+	GATE_PERAO2(CLK_PERAO_MSDC2_SLV_H, "perao_msdc2_slv_h", "axi_peri_sel", 19),
+	GATE_PERAO2(CLK_PERAO_SFLASH, "perao_sflash", "sflash_sel", 20),
+	GATE_PERAO2(CLK_PERAO_SFLASH_F, "perao_sflash_f", "axi_peri_sel", 21),
+	GATE_PERAO2(CLK_PERAO_SFLASH_H, "perao_sflash_h", "axi_peri_sel", 22),
+	GATE_PERAO2(CLK_PERAO_SFLASH_P, "perao_sflash_p", "axi_peri_sel", 23),
+	GATE_PERAO2(CLK_PERAO_AUDIO0, "perao_audio0", "axi_peri_sel", 24),
+	GATE_PERAO2(CLK_PERAO_AUDIO1, "perao_audio1", "axi_peri_sel", 25),
+	GATE_PERAO2(CLK_PERAO_AUDIO2, "perao_audio2", "aud_intbus_sel", 26),
+	GATE_PERAO2(CLK_PERAO_AUXADC_26M, "perao_auxadc_26m", "clk26m", 27),
+};
+
+static const struct mtk_clk_desc perao_mcd = {
+	.clks = perao_clks,
+	.num_clks = ARRAY_SIZE(perao_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8189_bus[] = {
+	{ .compatible = "mediatek,mt8189-infra-ao", .data = &ifrao_mcd },
+	{ .compatible = "mediatek,mt8189-peri-ao", .data = &perao_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_bus);
+
+static struct platform_driver clk_mt8189_bus_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8189-bus",
+		.of_match_table = of_match_clk_mt8189_bus,
+	},
+};
+
+module_platform_driver(clk_mt8189_bus_drv);
+MODULE_DESCRIPTION("MediaTek MT8189 bus/peripheral clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


