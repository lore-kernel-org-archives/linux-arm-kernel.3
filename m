Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308ADCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDZ0Xsn5ReAcvNmgdg+uxXW4D8RKTVhWje6qWx4Iwys=; b=lzNFmvGan2VMqErSn2pudOvNKw
	3RD4+TGqavarTFl9+5FfCBnUcneO5RUBRvvnRPc5olJqS8nLKpaFzH5ZXyAwxJaRoVu6iG3pyBQww
	6OWAnybpdwlIj2aPj5acUTyo/oFGgiSqjZgQA4pSmaUsuUt/Jg8sv2S9tPk1nnl9KBr7eFiQunJeL
	8A7RhpEQYijxGXi64a2TZjXiOogB5vcvRfRUJgEBTqa4ZEqLkkmKzqmO19xzNVOYaSYZ76tSVAtrX
	GzSwFxl5JHFYeMPRBu0eK4R/s80CvmgpWQkTUFG0pC3D8FpzdHuRFQc/nnqhcv3r21Qqyh8nKrILJ
	eB4kC8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLAu-0000000DjxB-115u;
	Mon, 27 Oct 2025 11:14:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLAf-0000000Djm7-2iio;
	Mon, 27 Oct 2025 11:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761563631;
	bh=r0mhGlPr+9zzYVG1jnK8tXKevnB7GtErZuWoP0D+6Gc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aAzEvc6tZjRkDBEyI2vr2gGSF3Do5eUqzrNc16W3TlMSSGasklbBW0rpNV0or6YJV
	 cU/s0dpbqdQWfyFU2JYFZ1TZ7Ad7oHLZlihbv/I4ZmqTvkFF/eSCKRb6wi8CTCcuIg
	 wY6jaJArnV984zl1mR3C22LP+I+AevfxxiH0j6wSXCnzPuWZm+DEbcBY7qDzMh46J5
	 xfXojfULO5iZmct/wC83a49jVnXikz5M2c7WEEFiGriwFqxOwV7s6pOiR/xV1+Vy1S
	 B3dtSbQMLKICGvboZrWrOkJ4XX+/B1Brn3CJNhhR3VJx2AbWk+eIrz9Ct6Z4neWZEo
	 ewhHXChfQC5fg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F78D17E1423;
	Mon, 27 Oct 2025 12:13:51 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	laura.nao@collabora.com,
	nfraprado@collabora.com,
	wenst@chromium.org,
	y.oudjana@protonmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 7/7] clk: mediatek: Add support for MT6685 PM/Clock IC Clock Controller
Date: Mon, 27 Oct 2025 12:13:43 +0100
Message-ID: <20251027111343.21723-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027111343.21723-1-angelogioacchino.delregno@collabora.com>
References: <20251027111343.21723-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_041353_855244_F54542B7 
X-CRM114-Status: GOOD (  15.52  )
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

Add support for the SCK_TOP Clock Controller IP found in the
MediaTek MT6685 PM/Clock IC as a SPMI Sub-Device.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig      |  7 ++++
 drivers/clk/mediatek/Makefile     |  2 +
 drivers/clk/mediatek/clk-mt6685.c | 70 +++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt6685.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 0e41990d271f..4a67b58c3e55 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -132,6 +132,13 @@ config COMMON_CLK_MT2712_VENCSYS
 	help
 	  This driver supports MediaTek MT2712 vencsys clocks.
 
+config COMMON_CLK_MT6685
+	tristate "Clock driver for MediaTek MT6685 Clock IC"
+	depends on ARCH_MEDIATEK
+	select COMMON_CLK_MEDIATEK_SPMI
+	help
+	  This driver supports clocks provided by the MT6685 Clock IC.
+
 config COMMON_CLK_MT6735
 	tristate "Main clock drivers for MediaTek MT6735"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index d2b51e88e51e..b47527002b02 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -5,6 +5,8 @@ obj-$(CONFIG_COMMON_CLK_MEDIATEK) += clk-mediatek.o
 
 obj-$(CONFIG_COMMON_CLK_MEDIATEK_FHCTL) += clk-fhctl.o clk-pllfh.o
 
+obj-$(CONFIG_COMMON_CLK_MT6685) += clk-mt6685.o
+
 obj-$(CONFIG_COMMON_CLK_MT6735) += clk-mt6735-apmixedsys.o clk-mt6735-infracfg.o clk-mt6735-pericfg.o clk-mt6735-topckgen.o
 obj-$(CONFIG_COMMON_CLK_MT6735_IMGSYS) += clk-mt6735-imgsys.o
 obj-$(CONFIG_COMMON_CLK_MT6735_MFGCFG) += clk-mt6735-mfgcfg.o
diff --git a/drivers/clk/mediatek/clk-mt6685.c b/drivers/clk/mediatek/clk-mt6685.c
new file mode 100644
index 000000000000..1d524aef61a5
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6685.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+#include <dt-bindings/clock/mediatek,mt6685-clock.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+#include "clk-mtk-spmi.h"
+#include "reset.h"
+
+static const struct mtk_gate_regs spmi_mt6685_sck_top_cg_regs = {
+	.set_ofs = 0x1,
+	.clr_ofs = 0x2,
+	.sta_ofs = 0x0
+};
+
+#define GATE_SCKTOP(_id, _name, _parent, _shift)	\
+{							\
+	.id = _id,					\
+	.name = _name,					\
+	.parent_name = _parent,				\
+	.regs = &spmi_mt6685_sck_top_cg_regs,		\
+	.shift = _shift,				\
+	.flags = CLK_IGNORE_UNUSED,			\
+	.ops = &mtk_clk_gate_ops_setclr,		\
+}
+
+static const struct mtk_gate sck_top_clks[] = {
+	GATE_SCKTOP(CLK_RTC_SEC_MCLK, "rtc_sec_mclk", "rtc_sec_32k", 0),
+	GATE_SCKTOP(CLK_RTC_EOSC32, "rtc_eosc32", "clk26m", 2),
+	GATE_SCKTOP(CLK_RTC_SEC_32K, "rtc_sec_32k", "clk26m", 3),
+	GATE_SCKTOP(CLK_RTC_MCLK, "rtc_mclk", "rtc_32k", 4),
+	GATE_SCKTOP(CLK_RTC_32K, "rtc_32k", "clk26m", 5),
+};
+
+static const struct mtk_clk_desc mt6685_sck_top_mcd = {
+	.clks = sck_top_clks,
+	.num_clks = ARRAY_SIZE(sck_top_clks),
+};
+
+static const struct mtk_spmi_clk_desc mt6685_sck_top_mscd = {
+	.desc = &mt6685_sck_top_mcd,
+	.max_register = 0x10,
+};
+
+static const struct of_device_id of_match_clk_mt6685[] = {
+	{ .compatible = "mediatek,mt6685-sck-top", .data = &mt6685_sck_top_mscd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6685);
+
+static struct platform_driver clk_mt6685_spmi_drv = {
+	.probe = mtk_spmi_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-spmi-mt6685",
+		.of_match_table = of_match_clk_mt6685,
+	},
+};
+module_platform_driver(clk_mt6685_spmi_drv);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MT6685 SPMI Clock IC clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.51.1


