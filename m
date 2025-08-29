Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B028CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 11:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lN0TATAj7/qPCXa4dpOgia5B3u8DwkgmZP3BcuTR2Ks=; b=U8y1BH1zJO2NQ0zxxAq9csYDKY
	CTthCKy6tk4tG/yVOlFIiJ043Lbgd2sAEgIA5prVzgrSMSMxi5YqU9xpm1zgtNH05/6TZ1L6/660P
	t98LaTNXWhXJ6NpqQ1vyaIhOD2wUIic2ag3y6L24YJsiuewi6VBjgpAiGcB0/m8ysobSWpdg9XEGf
	s+VuqsQe4RlhygZbgVbuwi4LL+eKPvlZlMswCavhbB7lAesqzleE6ROmY1PmoYv/I5kwt29SuZ4tZ
	+3mvsBoYg9giG1gexRf3gPbRhjLig4wwHNCgnxkx7LUICtWHIpNPzSzc1ss7ENysL4onogWNqaHqe
	tLd4zNKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwv1-00000005QsT-0Lew;
	Fri, 29 Aug 2025 11:05:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvIF-000000057nD-1paa;
	Fri, 29 Aug 2025 09:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756459270;
	bh=XfOGbimoHhNCpoH9eDt4hTsAQmOGQ6jX3JJP9lJXMlc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EfaWKpPRsGQxdCfwv4EP7QGR1mlvYDLwBel2+vstsr13UCHEqKdlG1wk0wnucv9Wb
	 Uv3pV1/Ssf0sK6cms1xaehRZYYVtZNtp71gZLkj48cdu48q/cR8xZydw4JX8xXwdT3
	 2JBeRVZEvhtmFWaEIYAwC0AuJ3SJi+msZEOQbWWQC9tPzq790BVtP8ueV7ODewOvKK
	 72XxctahxFsWqUQO2g5Nhzgzdd7V1gQGKdqU/GFEKWJ9db60BLlJOIKnDu2Xi8HBok
	 q/JkJ0TWWYr//cBU9npRZW1ChsYuk+rsXFaqs8GTdDAHtjSgyhqFKMAK/XDlFyJ0jp
	 D9MKd5zQlVtkQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:f5b1:db54:a11a:c333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40A2317E12A2;
	Fri, 29 Aug 2025 11:21:09 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v5 13/27] clk: mediatek: Add MT8196 vlpckgen clock support
Date: Fri, 29 Aug 2025 11:18:59 +0200
Message-Id: <20250829091913.131528-14-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829091913.131528-1-laura.nao@collabora.com>
References: <20250829091913.131528-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_022111_782060_E45E5821 
X-CRM114-Status: GOOD (  14.82  )
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

Add support for the MT8196 vlpckgen clock controller, which provides
muxes and dividers for clock selection in other IP blocks.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/Makefile              |   2 +-
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c | 729 +++++++++++++++++++++
 2 files changed, 730 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-vlpckgen.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index c415453e02fd..031e7ac38804 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -151,7 +151,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) += clk-mt8195-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) += clk-mt8195-vpp0.o clk-mt8195-vpp1.o
 obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) += clk-mt8195-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8196) += clk-mt8196-apmixedsys.o clk-mt8196-topckgen.o \
-				   clk-mt8196-topckgen2.o
+				   clk-mt8196-topckgen2.o clk-mt8196-vlpckgen.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
 obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
 obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8196-vlpckgen.c b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
new file mode 100644
index 000000000000..c38d1e80a5ba
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
@@ -0,0 +1,729 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ *                    Guangjie Song <guangjie.song@mediatek.com>
+ * Copyright (c) 2025 Collabora Ltd.
+ *                    Laura Nao <laura.nao@collabora.com>
+ */
+#include <dt-bindings/clock/mediatek,mt8196-clock.h>
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "clk-mtk.h"
+#include "clk-mux.h"
+#include "clk-pll.h"
+
+/* MUX SEL REG */
+#define VLP_CLK_CFG_UPDATE		0x0004
+#define VLP_CLK_CFG_UPDATE1		0x0008
+#define VLP_CLK_CFG_0			0x0010
+#define VLP_CLK_CFG_0_SET		0x0014
+#define VLP_CLK_CFG_0_CLR		0x0018
+#define VLP_CLK_CFG_1			0x0020
+#define VLP_CLK_CFG_1_SET		0x0024
+#define VLP_CLK_CFG_1_CLR		0x0028
+#define VLP_CLK_CFG_2			0x0030
+#define VLP_CLK_CFG_2_SET		0x0034
+#define VLP_CLK_CFG_2_CLR		0x0038
+#define VLP_CLK_CFG_3			0x0040
+#define VLP_CLK_CFG_3_SET		0x0044
+#define VLP_CLK_CFG_3_CLR		0x0048
+#define VLP_CLK_CFG_4			0x0050
+#define VLP_CLK_CFG_4_SET		0x0054
+#define VLP_CLK_CFG_4_CLR		0x0058
+#define VLP_CLK_CFG_5			0x0060
+#define VLP_CLK_CFG_5_SET		0x0064
+#define VLP_CLK_CFG_5_CLR		0x0068
+#define VLP_CLK_CFG_6			0x0070
+#define VLP_CLK_CFG_6_SET		0x0074
+#define VLP_CLK_CFG_6_CLR		0x0078
+#define VLP_CLK_CFG_7			0x0080
+#define VLP_CLK_CFG_7_SET		0x0084
+#define VLP_CLK_CFG_7_CLR		0x0088
+#define VLP_CLK_CFG_8			0x0090
+#define VLP_CLK_CFG_8_SET		0x0094
+#define VLP_CLK_CFG_8_CLR		0x0098
+#define VLP_CLK_CFG_9			0x00a0
+#define VLP_CLK_CFG_9_SET		0x00a4
+#define VLP_CLK_CFG_9_CLR		0x00a8
+#define VLP_CLK_CFG_10			0x00b0
+#define VLP_CLK_CFG_10_SET		0x00b4
+#define VLP_CLK_CFG_10_CLR		0x00b8
+#define VLP_OCIC_FENC_STATUS_MON_0	0x039c
+#define VLP_OCIC_FENC_STATUS_MON_1	0x03a0
+
+/* MUX SHIFT */
+#define TOP_MUX_SCP_SHIFT			0
+#define TOP_MUX_SCP_SPI_SHIFT			1
+#define TOP_MUX_SCP_IIC_SHIFT			2
+#define TOP_MUX_SCP_IIC_HS_SHIFT		3
+#define TOP_MUX_PWRAP_ULPOSC_SHIFT		4
+#define TOP_MUX_SPMI_M_TIA_32K_SHIFT		5
+#define TOP_MUX_APXGPT_26M_B_SHIFT		6
+#define TOP_MUX_DPSW_SHIFT			7
+#define TOP_MUX_DPSW_CENTRAL_SHIFT		8
+#define TOP_MUX_SPMI_M_MST_SHIFT		9
+#define TOP_MUX_DVFSRC_SHIFT			10
+#define TOP_MUX_PWM_VLP_SHIFT			11
+#define TOP_MUX_AXI_VLP_SHIFT			12
+#define TOP_MUX_SYSTIMER_26M_SHIFT		13
+#define TOP_MUX_SSPM_SHIFT			14
+#define TOP_MUX_SRCK_SHIFT			15
+#define TOP_MUX_CAMTG0_SHIFT			16
+#define TOP_MUX_CAMTG1_SHIFT			17
+#define TOP_MUX_CAMTG2_SHIFT			18
+#define TOP_MUX_CAMTG3_SHIFT			19
+#define TOP_MUX_CAMTG4_SHIFT			20
+#define TOP_MUX_CAMTG5_SHIFT			21
+#define TOP_MUX_CAMTG6_SHIFT			22
+#define TOP_MUX_CAMTG7_SHIFT			23
+#define TOP_MUX_SSPM_26M_SHIFT			25
+#define TOP_MUX_ULPOSC_SSPM_SHIFT		26
+#define TOP_MUX_VLP_PBUS_26M_SHIFT		27
+#define TOP_MUX_DEBUG_ERR_FLAG_VLP_26M_SHIFT	28
+#define TOP_MUX_DPMSRDMA_SHIFT			29
+#define TOP_MUX_VLP_PBUS_156M_SHIFT		30
+#define TOP_MUX_SPM_SHIFT			0
+#define TOP_MUX_MMINFRA_VLP_SHIFT		1
+#define TOP_MUX_USB_TOP_SHIFT			2
+#define TOP_MUX_SSUSB_XHCI_SHIFT		3
+#define TOP_MUX_NOC_VLP_SHIFT			4
+#define TOP_MUX_AUDIO_H_SHIFT			5
+#define TOP_MUX_AUD_ENGEN1_SHIFT		6
+#define TOP_MUX_AUD_ENGEN2_SHIFT		7
+#define TOP_MUX_AUD_INTBUS_SHIFT		8
+#define TOP_MUX_SPU_VLP_26M_SHIFT		9
+#define TOP_MUX_SPU0_VLP_SHIFT			10
+#define TOP_MUX_SPU1_VLP_SHIFT			11
+
+/* CKSTA REG */
+#define VLP_CKSTA_REG0			0x0250
+#define VLP_CKSTA_REG1			0x0254
+
+/* HW Voter REG */
+#define HWV_CG_9_SET	0x0048
+#define HWV_CG_9_CLR	0x004c
+#define HWV_CG_9_DONE	0x2c24
+#define HWV_CG_10_SET	0x0050
+#define HWV_CG_10_CLR	0x0054
+#define HWV_CG_10_DONE	0x2c28
+
+/* PLL REG */
+#define VLP_AP_PLL_CON3		0x264
+#define VLP_APLL1_TUNER_CON0	0x2a4
+#define VLP_APLL2_TUNER_CON0	0x2a8
+#define VLP_APLL1_CON0		0x274
+#define VLP_APLL1_CON1		0x278
+#define VLP_APLL1_CON2		0x27c
+#define VLP_APLL1_CON3		0x280
+#define VLP_APLL2_CON0		0x28c
+#define VLP_APLL2_CON1		0x290
+#define VLP_APLL2_CON2		0x294
+#define VLP_APLL2_CON3		0x298
+
+/* vlp apll1 tuner default value*/
+#define VLP_APLL1_TUNER_CON0_VALUE 0x6f28bd4d
+/* vlp apll2 tuner default value + 1*/
+#define VLP_APLL2_TUNER_CON0_VALUE 0x78fd5265
+
+#define VLP_PLLEN_ALL		0x080
+#define VLP_PLLEN_ALL_SET	0x084
+#define VLP_PLLEN_ALL_CLR	0x088
+
+#define MT8196_PLL_FMAX		(3800UL * MHZ)
+#define MT8196_PLL_FMIN		(1500UL * MHZ)
+#define MT8196_INTEGER_BITS	8
+
+#define PLL_FENC(_id, _name, _reg, _fenc_sta_ofs, _fenc_sta_bit,\
+			_flags, _pd_reg, _pd_shift,			\
+			_pcw_reg, _pcw_shift, _pcwbits,		\
+			_pll_en_bit) {					\
+		.id = _id,					\
+		.name = _name,					\
+		.reg = _reg,					\
+		.fenc_sta_ofs = _fenc_sta_ofs,			\
+		.fenc_sta_bit = _fenc_sta_bit,			\
+		.flags = _flags,				\
+		.fmax = MT8196_PLL_FMAX,			\
+		.fmin = MT8196_PLL_FMIN,			\
+		.pd_reg = _pd_reg,				\
+		.pd_shift = _pd_shift,				\
+		.pcw_reg = _pcw_reg,				\
+		.pcw_shift = _pcw_shift,			\
+		.pcwbits = _pcwbits,				\
+		.pcwibits = MT8196_INTEGER_BITS,		\
+		.en_reg = VLP_PLLEN_ALL,			\
+		.en_set_reg = VLP_PLLEN_ALL_SET,		\
+		.en_clr_reg = VLP_PLLEN_ALL_CLR,		\
+		.pll_en_bit = _pll_en_bit,			\
+		.ops = &mtk_pll_fenc_clr_set_ops,		\
+}
+
+static DEFINE_SPINLOCK(mt8196_clk_vlp_lock);
+
+static const struct mtk_fixed_factor vlp_divs[] = {
+	FACTOR(CLK_VLP_CLK26M, "vlp_clk26m", "clk26m", 1, 1),
+	FACTOR(CLK_VLP_APLL1_D4, "apll1_d4", "vlp_apll1", 1, 4),
+	FACTOR(CLK_VLP_APLL1_D8, "apll1_d8", "vlp_apll1", 1, 8),
+	FACTOR(CLK_VLP_APLL2_D4, "apll2_d4", "vlp_apll2", 1, 4),
+	FACTOR(CLK_VLP_APLL2_D8, "apll2_d8", "vlp_apll2", 1, 8),
+};
+
+static const char * const vlp_scp_parents[] = {
+	"clk26m",
+	"osc_d20",
+	"mainpll_d6",
+	"mainpll_d4",
+	"mainpll_d3",
+	"vlp_apll1"
+};
+
+static const char * const vlp_scp_spi_parents[] = {
+	"clk26m",
+	"osc_d20",
+	"mainpll_d7_d2",
+	"mainpll_d5_d2"
+};
+
+static const char * const vlp_scp_iic_parents[] = {
+	"clk26m",
+	"osc_d20",
+	"mainpll_d5_d4",
+	"mainpll_d7_d2"
+};
+
+static const char * const vlp_scp_iic_hs_parents[] = {
+	"clk26m",
+	"osc_d20",
+	"mainpll_d5_d4",
+	"mainpll_d7_d2",
+	"mainpll_d7"
+};
+
+static const char * const vlp_pwrap_ulposc_parents[] = {
+	"clk26m",
+	"osc_d20",
+	"osc_d14",
+	"osc_d10"
+};
+
+static const char * const vlp_spmi_32k_parents[] = {
+	"clk26m",
+	"clk32k",
+	"osc_d20",
+	"osc_d14",
+	"osc_d10"
+};
+
+static const char * const vlp_apxgpt_26m_b_parents[] = {
+	"clk26m",
+	"osc_d20"
+};
+
+static const char * const vlp_dpsw_parents[] = {
+	"clk26m",
+	"osc_d10",
+	"osc_d7",
+	"mainpll_d7_d4"
+};
+
+static const char * const vlp_dpsw_central_parents[] = {
+	"clk26m",
+	"osc_d10",
+	"osc_d7",
+	"mainpll_d7_d4"
+};
+
+static const char * const vlp_spmi_m_parents[] = {
+	"clk26m",
+	"osc_d20",
+	"osc_d14",
+	"osc_d10"
+};
+
+static const char * const vlp_dvfsrc_parents[] = {
+	"clk26m",
+	"osc_d20"
+};
+
+static const char * const vlp_pwm_vlp_parents[] = {
+	"clk26m",
+	"clk32k",
+	"osc_d20",
+	"osc_d8",
+	"mainpll_d4_d8"
+};
+
+static const char * const vlp_axi_vlp_parents[] = {
+	"clk26m",
+	"osc_d20",
+	"mainpll_d7_d4",
+	"osc_d4",
+	"mainpll_d7_d2"
+};
+
+static const char * const vlp_systimer_26m_parents[] = {
+	"clk26m",
+	"osc_d20"
+};
+
+static const char * const vlp_sspm_parents[] = {
+	"clk26m",
+	"osc_d20",
+	"mainpll_d5_d2",
+	"osc_d2",
+	"mainpll_d6"
+};
+
+static const char * const vlp_srck_parents[] = {
+	"clk26m",
+	"osc_d20"
+};
+
+static const char * const vlp_camtg0_1_parents[] = {
+	"clk26m",
+	"univpll_192m_d32",
+	"univpll_192m_d16",
+	"clk13m",
+	"osc_d40",
+	"osc_d32",
+	"univpll_192m_d10",
+	"univpll_192m_d8",
+	"univpll_d6_d16",
+	"ulposc3",
+	"osc_d20",
+	"ck2_tvdpll1_d16",
+	"univpll_d6_d8"
+};
+
+static const char * const vlp_camtg2_7_parents[] = {
+	"clk26m",
+	"univpll_192m_d32",
+	"univpll_192m_d16",
+	"clk13m",
+	"osc_d40",
+	"osc_d32",
+	"univpll_192m_d10",
+	"univpll_192m_d8",
+	"univpll_d6_d16",
+	"osc_d20",
+	"ck2_tvdpll1_d16",
+	"univpll_d6_d8"
+};
+
+static const char * const vlp_sspm_26m_parents[] = {
+	"clk26m",
+	"osc_d20"
+};
+
+static const char * const vlp_ulposc_sspm_parents[] = {
+	"clk26m",
+	"osc_d2",
+	"mainpll_d4_d2"
+};
+
+static const char * const vlp_vlp_pbus_26m_parents[] = {
+	"clk26m",
+	"osc_d20"
+};
+
+static const char * const vlp_debug_err_flag_parents[] = {
+	"clk26m",
+	"osc_d20"
+};
+
+static const char * const vlp_dpmsrdma_parents[] = {
+	"clk26m",
+	"mainpll_d7_d2"
+};
+
+static const char * const vlp_vlp_pbus_156m_parents[] = {
+	"clk26m",
+	"osc_d2",
+	"mainpll_d7_d2",
+	"mainpll_d7"
+};
+
+static const char * const vlp_spm_parents[] = {
+	"clk26m",
+	"mainpll_d7_d4"
+};
+
+static const char * const vlp_mminfra_parents[] = {
+	"clk26m",
+	"osc_d4",
+	"mainpll_d3"
+};
+
+static const char * const vlp_usb_parents[] = {
+	"clk26m",
+	"mainpll_d9"
+};
+
+static const char * const vlp_noc_vlp_parents[] = {
+	"clk26m",
+	"osc_d20",
+	"mainpll_d9"
+};
+
+static const char * const vlp_audio_h_parents[] = {
+	"clk26m",
+	"vlp_clk26m",
+	"vlp_apll1",
+	"vlp_apll2"
+};
+
+static const char * const vlp_aud_engen1_parents[] = {
+	"clk26m",
+	"vlp_clk26m",
+	"apll1_d8",
+	"apll1_d4"
+};
+
+static const char * const vlp_aud_engen2_parents[] = {
+	"clk26m",
+	"vlp_clk26m",
+	"apll2_d8",
+	"apll2_d4"
+};
+
+static const char * const vlp_aud_intbus_parents[] = {
+	"clk26m",
+	"vlp_clk26m",
+	"mainpll_d7_d4",
+	"mainpll_d4_d4"
+};
+
+static const u8 vlp_aud_parent_index[] = { 1, 2, 3 };
+
+static const char * const vlp_spvlp_26m_parents[] = {
+	"clk26m",
+	"osc_d20"
+};
+
+static const char * const vlp_spu0_vlp_parents[] = {
+	"clk26m",
+	"osc_d20",
+	"mainpll_d4_d4",
+	"mainpll_d4_d2",
+	"mainpll_d7",
+	"mainpll_d6",
+	"mainpll_d5"
+};
+
+static const char * const vlp_spu1_vlp_parents[] = {
+	"clk26m",
+	"osc_d20",
+	"mainpll_d4_d4",
+	"mainpll_d4_d2",
+	"mainpll_d7",
+	"mainpll_d6",
+	"mainpll_d5"
+};
+
+static const struct mtk_mux vlp_muxes[] = {
+	/* VLP_CLK_CFG_0 */
+	MUX_GATE_FENC_CLR_SET_UPD(CLK_VLP_SCP, "vlp_scp", vlp_scp_parents,
+		VLP_CLK_CFG_0, VLP_CLK_CFG_0_SET, VLP_CLK_CFG_0_CLR,
+		0, 3, 7, VLP_CLK_CFG_UPDATE, TOP_MUX_SCP_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_0, 31),
+	MUX_CLR_SET_UPD(CLK_VLP_SCP_SPI, "vlp_scp_spi",
+		vlp_scp_spi_parents, VLP_CLK_CFG_0, VLP_CLK_CFG_0_SET,
+		VLP_CLK_CFG_0_CLR, 8, 2,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_SCP_SPI_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_SCP_IIC, "vlp_scp_iic",
+		vlp_scp_iic_parents, VLP_CLK_CFG_0, VLP_CLK_CFG_0_SET,
+		VLP_CLK_CFG_0_CLR, 16, 2,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_SCP_IIC_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_SCP_IIC_HS, "vlp_scp_iic_hs",
+		vlp_scp_iic_hs_parents, VLP_CLK_CFG_0, VLP_CLK_CFG_0_SET,
+		VLP_CLK_CFG_0_CLR, 24, 3,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_SCP_IIC_HS_SHIFT),
+	/* VLP_CLK_CFG_1 */
+	MUX_CLR_SET_UPD(CLK_VLP_PWRAP_ULPOSC, "vlp_pwrap_ulposc",
+		vlp_pwrap_ulposc_parents, VLP_CLK_CFG_1, VLP_CLK_CFG_1_SET,
+		VLP_CLK_CFG_1_CLR, 0, 2,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_PWRAP_ULPOSC_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_SPMI_M_TIA_32K, "vlp_spmi_32k",
+		vlp_spmi_32k_parents, VLP_CLK_CFG_1, VLP_CLK_CFG_1_SET,
+		VLP_CLK_CFG_1_CLR, 8, 3,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_SPMI_M_TIA_32K_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_APXGPT_26M_B, "vlp_apxgpt_26m_b",
+		vlp_apxgpt_26m_b_parents, VLP_CLK_CFG_1, VLP_CLK_CFG_1_SET,
+		VLP_CLK_CFG_1_CLR, 16, 1,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_APXGPT_26M_B_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_DPSW, "vlp_dpsw",
+		vlp_dpsw_parents, VLP_CLK_CFG_1, VLP_CLK_CFG_1_SET,
+		VLP_CLK_CFG_1_CLR, 24, 2,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_DPSW_SHIFT),
+	/* VLP_CLK_CFG_2 */
+	MUX_CLR_SET_UPD(CLK_VLP_DPSW_CENTRAL, "vlp_dpsw_central",
+		vlp_dpsw_central_parents, VLP_CLK_CFG_2, VLP_CLK_CFG_2_SET,
+		VLP_CLK_CFG_2_CLR, 0, 2,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_DPSW_CENTRAL_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_SPMI_M_MST, "vlp_spmi_m",
+		vlp_spmi_m_parents, VLP_CLK_CFG_2, VLP_CLK_CFG_2_SET,
+		VLP_CLK_CFG_2_CLR, 8, 2,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_SPMI_M_MST_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_DVFSRC, "vlp_dvfsrc",
+		vlp_dvfsrc_parents, VLP_CLK_CFG_2, VLP_CLK_CFG_2_SET,
+		VLP_CLK_CFG_2_CLR, 16, 1,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_DVFSRC_SHIFT),
+	MUX_GATE_FENC_CLR_SET_UPD(CLK_VLP_PWM_VLP, "vlp_pwm_vlp", vlp_pwm_vlp_parents,
+		VLP_CLK_CFG_2, VLP_CLK_CFG_2_SET, VLP_CLK_CFG_2_CLR,
+		24, 3, 31, VLP_CLK_CFG_UPDATE, TOP_MUX_PWM_VLP_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_0, 20),
+	/* VLP_CLK_CFG_3 */
+	MUX_CLR_SET_UPD(CLK_VLP_AXI_VLP, "vlp_axi_vlp",
+		vlp_axi_vlp_parents, VLP_CLK_CFG_3, VLP_CLK_CFG_3_SET,
+		VLP_CLK_CFG_3_CLR, 0, 3,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_AXI_VLP_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_SYSTIMER_26M, "vlp_systimer_26m",
+		vlp_systimer_26m_parents, VLP_CLK_CFG_3, VLP_CLK_CFG_3_SET,
+		VLP_CLK_CFG_3_CLR, 8, 1,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_SYSTIMER_26M_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_SSPM, "vlp_sspm",
+		vlp_sspm_parents, VLP_CLK_CFG_3, VLP_CLK_CFG_3_SET,
+		VLP_CLK_CFG_3_CLR, 16, 3,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_SSPM_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_SRCK, "vlp_srck",
+		vlp_srck_parents, VLP_CLK_CFG_3, VLP_CLK_CFG_3_SET,
+		VLP_CLK_CFG_3_CLR, 24, 1,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_SRCK_SHIFT),
+	/* VLP_CLK_CFG_4 */
+	MUX_GATE_HWV_FENC_CLR_SET_UPD(CLK_VLP_CAMTG0, "vlp_camtg0", vlp_camtg0_1_parents,
+		VLP_CLK_CFG_4, VLP_CLK_CFG_4_SET, VLP_CLK_CFG_4_CLR,
+		HWV_CG_9_DONE, HWV_CG_9_SET, HWV_CG_9_CLR,
+		0, 4, 7, VLP_CLK_CFG_UPDATE, TOP_MUX_CAMTG0_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_0, 15),
+	MUX_GATE_HWV_FENC_CLR_SET_UPD(CLK_VLP_CAMTG1, "vlp_camtg1", vlp_camtg0_1_parents,
+		VLP_CLK_CFG_4, VLP_CLK_CFG_4_SET, VLP_CLK_CFG_4_CLR,
+		HWV_CG_9_DONE, HWV_CG_9_SET, HWV_CG_9_CLR,
+		8, 4, 15, VLP_CLK_CFG_UPDATE, TOP_MUX_CAMTG1_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_0, 14),
+	MUX_GATE_HWV_FENC_CLR_SET_UPD(CLK_VLP_CAMTG2, "vlp_camtg2", vlp_camtg2_7_parents,
+		VLP_CLK_CFG_4, VLP_CLK_CFG_4_SET, VLP_CLK_CFG_4_CLR,
+		HWV_CG_9_DONE, HWV_CG_9_SET, HWV_CG_9_CLR,
+		16, 4, 23, VLP_CLK_CFG_UPDATE, TOP_MUX_CAMTG2_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_0, 13),
+	MUX_GATE_HWV_FENC_CLR_SET_UPD(CLK_VLP_CAMTG3, "vlp_camtg3", vlp_camtg2_7_parents,
+		VLP_CLK_CFG_4, VLP_CLK_CFG_4_SET, VLP_CLK_CFG_4_CLR,
+		HWV_CG_9_DONE, HWV_CG_9_SET, HWV_CG_9_CLR,
+		24, 4, 31, VLP_CLK_CFG_UPDATE, TOP_MUX_CAMTG3_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_0, 12),
+	/* VLP_CLK_CFG_5 */
+	MUX_GATE_HWV_FENC_CLR_SET_UPD(CLK_VLP_CAMTG4, "vlp_camtg4", vlp_camtg2_7_parents,
+		VLP_CLK_CFG_5, VLP_CLK_CFG_5_SET, VLP_CLK_CFG_5_CLR,
+		HWV_CG_10_DONE, HWV_CG_10_SET, HWV_CG_10_CLR,
+		0, 4, 7, VLP_CLK_CFG_UPDATE, TOP_MUX_CAMTG4_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_0, 11),
+	MUX_GATE_HWV_FENC_CLR_SET_UPD(CLK_VLP_CAMTG5, "vlp_camtg5", vlp_camtg2_7_parents,
+		VLP_CLK_CFG_5, VLP_CLK_CFG_5_SET, VLP_CLK_CFG_5_CLR,
+		HWV_CG_10_DONE, HWV_CG_10_SET, HWV_CG_10_CLR,
+		8, 4, 15, VLP_CLK_CFG_UPDATE, TOP_MUX_CAMTG5_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_0, 10),
+	MUX_GATE_HWV_FENC_CLR_SET_UPD(CLK_VLP_CAMTG6, "vlp_camtg6", vlp_camtg2_7_parents,
+		VLP_CLK_CFG_5, VLP_CLK_CFG_5_SET, VLP_CLK_CFG_5_CLR,
+		HWV_CG_10_DONE, HWV_CG_10_SET, HWV_CG_10_CLR,
+		16, 4, 23, VLP_CLK_CFG_UPDATE, TOP_MUX_CAMTG6_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_0, 9),
+	MUX_GATE_HWV_FENC_CLR_SET_UPD(CLK_VLP_CAMTG7, "vlp_camtg7", vlp_camtg2_7_parents,
+		VLP_CLK_CFG_5, VLP_CLK_CFG_5_SET, VLP_CLK_CFG_5_CLR,
+		HWV_CG_10_DONE, HWV_CG_10_SET, HWV_CG_10_CLR,
+		24, 4, 31, VLP_CLK_CFG_UPDATE, TOP_MUX_CAMTG7_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_0, 8),
+	/* VLP_CLK_CFG_6 */
+	MUX_CLR_SET_UPD(CLK_VLP_SSPM_26M, "vlp_sspm_26m",
+		vlp_sspm_26m_parents, VLP_CLK_CFG_6, VLP_CLK_CFG_6_SET,
+		VLP_CLK_CFG_6_CLR, 8, 1,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_SSPM_26M_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_ULPOSC_SSPM, "vlp_ulposc_sspm",
+		vlp_ulposc_sspm_parents, VLP_CLK_CFG_6, VLP_CLK_CFG_6_SET,
+		VLP_CLK_CFG_6_CLR, 16, 2,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_ULPOSC_SSPM_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_VLP_PBUS_26M, "vlp_vlp_pbus_26m",
+		vlp_vlp_pbus_26m_parents, VLP_CLK_CFG_6, VLP_CLK_CFG_6_SET,
+		VLP_CLK_CFG_6_CLR, 24, 1,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_VLP_PBUS_26M_SHIFT),
+	/* VLP_CLK_CFG_7 */
+	MUX_CLR_SET_UPD(CLK_VLP_DEBUG_ERR_FLAG, "vlp_debug_err_flag",
+		vlp_debug_err_flag_parents, VLP_CLK_CFG_7, VLP_CLK_CFG_7_SET,
+		VLP_CLK_CFG_7_CLR, 0, 1,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_DEBUG_ERR_FLAG_VLP_26M_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_DPMSRDMA, "vlp_dpmsrdma",
+		vlp_dpmsrdma_parents, VLP_CLK_CFG_7, VLP_CLK_CFG_7_SET,
+		VLP_CLK_CFG_7_CLR, 8, 1,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_DPMSRDMA_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_VLP_PBUS_156M, "vlp_vlp_pbus_156m",
+		vlp_vlp_pbus_156m_parents, VLP_CLK_CFG_7, VLP_CLK_CFG_7_SET,
+		VLP_CLK_CFG_7_CLR, 16, 2,
+		VLP_CLK_CFG_UPDATE, TOP_MUX_VLP_PBUS_156M_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_SPM, "vlp_spm",
+		vlp_spm_parents, VLP_CLK_CFG_7, VLP_CLK_CFG_7_SET,
+		VLP_CLK_CFG_7_CLR, 24, 1,
+		VLP_CLK_CFG_UPDATE1, TOP_MUX_SPM_SHIFT),
+	/* VLP_CLK_CFG_8 */
+	MUX_GATE_FENC_CLR_SET_UPD(CLK_VLP_MMINFRA, "vlp_mminfra", vlp_mminfra_parents,
+		VLP_CLK_CFG_8, VLP_CLK_CFG_8_SET, VLP_CLK_CFG_8_CLR,
+		0, 2, 7, VLP_CLK_CFG_UPDATE1, TOP_MUX_MMINFRA_VLP_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_1, 31),
+	MUX_GATE_FENC_CLR_SET_UPD(CLK_VLP_USB_TOP, "vlp_usb", vlp_usb_parents,
+		VLP_CLK_CFG_8, VLP_CLK_CFG_8_SET, VLP_CLK_CFG_8_CLR,
+		8, 1, 15, VLP_CLK_CFG_UPDATE1, TOP_MUX_USB_TOP_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_1, 30),
+	MUX_GATE_FENC_CLR_SET_UPD(CLK_VLP_USB_XHCI, "vlp_usb_xhci", vlp_usb_parents,
+		VLP_CLK_CFG_8, VLP_CLK_CFG_8_SET, VLP_CLK_CFG_8_CLR,
+		16, 1, 23, VLP_CLK_CFG_UPDATE1, TOP_MUX_SSUSB_XHCI_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_1, 29),
+	MUX_CLR_SET_UPD(CLK_VLP_NOC_VLP, "vlp_noc_vlp",
+		vlp_noc_vlp_parents, VLP_CLK_CFG_8, VLP_CLK_CFG_8_SET,
+		VLP_CLK_CFG_8_CLR, 24, 2,
+		VLP_CLK_CFG_UPDATE1, TOP_MUX_NOC_VLP_SHIFT),
+	/* VLP_CLK_CFG_9 */
+	MUX_GATE_FENC_CLR_SET_UPD_INDEXED(CLK_VLP_AUDIO_H, "vlp_audio_h",
+		vlp_audio_h_parents, vlp_aud_parent_index,
+		VLP_CLK_CFG_9, VLP_CLK_CFG_9_SET, VLP_CLK_CFG_9_CLR,
+		0, 2, 7, VLP_CLK_CFG_UPDATE1, TOP_MUX_AUDIO_H_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_1, 27),
+	MUX_GATE_FENC_CLR_SET_UPD_INDEXED(CLK_VLP_AUD_ENGEN1, "vlp_aud_engen1",
+		vlp_aud_engen1_parents, vlp_aud_parent_index,
+		VLP_CLK_CFG_9, VLP_CLK_CFG_9_SET, VLP_CLK_CFG_9_CLR,
+		8, 2, 15, VLP_CLK_CFG_UPDATE1, TOP_MUX_AUD_ENGEN1_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_1, 26),
+	MUX_GATE_FENC_CLR_SET_UPD_INDEXED(CLK_VLP_AUD_ENGEN2, "vlp_aud_engen2",
+		vlp_aud_engen2_parents, vlp_aud_parent_index,
+		VLP_CLK_CFG_9, VLP_CLK_CFG_9_SET, VLP_CLK_CFG_9_CLR,
+		16, 2, 23, VLP_CLK_CFG_UPDATE1, TOP_MUX_AUD_ENGEN2_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_1, 25),
+	MUX_GATE_FENC_CLR_SET_UPD_INDEXED(CLK_VLP_AUD_INTBUS, "vlp_aud_intbus",
+		vlp_aud_intbus_parents, vlp_aud_parent_index,
+		VLP_CLK_CFG_9, VLP_CLK_CFG_9_SET, VLP_CLK_CFG_9_CLR,
+		24, 2, 31, VLP_CLK_CFG_UPDATE1, TOP_MUX_AUD_INTBUS_SHIFT,
+		VLP_OCIC_FENC_STATUS_MON_1, 24),
+	/* VLP_CLK_CFG_10 */
+	MUX_CLR_SET_UPD(CLK_VLP_SPVLP_26M, "vlp_spvlp_26m",
+		vlp_spvlp_26m_parents, VLP_CLK_CFG_10, VLP_CLK_CFG_10_SET,
+		VLP_CLK_CFG_10_CLR, 0, 1,
+		VLP_CLK_CFG_UPDATE1, TOP_MUX_SPU_VLP_26M_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_SPU0_VLP, "vlp_spu0_vlp",
+		vlp_spu0_vlp_parents, VLP_CLK_CFG_10, VLP_CLK_CFG_10_SET,
+		VLP_CLK_CFG_10_CLR, 8, 3,
+		VLP_CLK_CFG_UPDATE1, TOP_MUX_SPU0_VLP_SHIFT),
+	MUX_CLR_SET_UPD(CLK_VLP_SPU1_VLP, "vlp_spu1_vlp",
+		vlp_spu1_vlp_parents, VLP_CLK_CFG_10, VLP_CLK_CFG_10_SET,
+		VLP_CLK_CFG_10_CLR, 16, 3,
+		VLP_CLK_CFG_UPDATE1, TOP_MUX_SPU1_VLP_SHIFT),
+};
+
+static const struct mtk_pll_data vlp_plls[] = {
+	PLL_FENC(CLK_VLP_APLL1, "vlp_apll1", VLP_APLL1_CON0, 0x0358, 1, 0,
+		 VLP_APLL1_CON1, 24, VLP_APLL1_CON2, 0, 32, 0),
+	PLL_FENC(CLK_VLP_APLL2, "vlp_apll2", VLP_APLL2_CON0, 0x0358, 0, 0,
+		 VLP_APLL2_CON1, 24, VLP_APLL2_CON2, 0, 32, 1),
+};
+
+static const struct regmap_config vlpckgen_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x1000,
+	.fast_io = true,
+};
+
+static int clk_mt8196_vlp_probe(struct platform_device *pdev)
+{
+	static void __iomem *base;
+	struct clk_hw_onecell_data *clk_data;
+	int r;
+	struct device_node *node = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+
+	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(vlp_muxes) +
+				      ARRAY_SIZE(vlp_plls) +
+				      ARRAY_SIZE(vlp_divs));
+	if (!clk_data)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, &vlpckgen_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	r = mtk_clk_register_factors(vlp_divs, ARRAY_SIZE(vlp_divs), clk_data);
+	if (r)
+		goto free_clk_data;
+
+	r = mtk_clk_register_muxes(&pdev->dev, vlp_muxes, ARRAY_SIZE(vlp_muxes),
+				   node, &mt8196_clk_vlp_lock, clk_data);
+	if (r)
+		goto unregister_factors;
+
+	r = mtk_clk_register_plls(node, vlp_plls, ARRAY_SIZE(vlp_plls),
+				  clk_data);
+	if (r)
+		goto unregister_muxes;
+
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (r)
+		goto unregister_plls;
+
+	platform_set_drvdata(pdev, clk_data);
+
+	/* Initialize APLL tuner registers */
+	regmap_write(regmap, VLP_APLL1_TUNER_CON0, VLP_APLL1_TUNER_CON0_VALUE);
+	regmap_write(regmap, VLP_APLL2_TUNER_CON0, VLP_APLL2_TUNER_CON0_VALUE);
+
+	return r;
+
+unregister_plls:
+	mtk_clk_unregister_plls(vlp_plls, ARRAY_SIZE(vlp_plls), clk_data);
+unregister_muxes:
+	mtk_clk_unregister_muxes(vlp_muxes, ARRAY_SIZE(vlp_muxes), clk_data);
+unregister_factors:
+	mtk_clk_unregister_factors(vlp_divs, ARRAY_SIZE(vlp_divs), clk_data);
+free_clk_data:
+	mtk_free_clk_data(clk_data);
+
+	return r;
+}
+
+static void clk_mt8196_vlp_remove(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_plls(vlp_plls, ARRAY_SIZE(vlp_plls), clk_data);
+	mtk_clk_unregister_muxes(vlp_muxes, ARRAY_SIZE(vlp_muxes), clk_data);
+	mtk_clk_unregister_factors(vlp_divs, ARRAY_SIZE(vlp_divs), clk_data);
+	mtk_free_clk_data(clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8196_vlp_ck[] = {
+	{ .compatible = "mediatek,mt8196-vlpckgen" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_vlp_ck);
+
+static struct platform_driver clk_mt8196_vlp_drv = {
+	.probe = clk_mt8196_vlp_probe,
+	.remove = clk_mt8196_vlp_remove,
+	.driver = {
+		.name = "clk-mt8196-vlpck",
+		.of_match_table = of_match_clk_mt8196_vlp_ck,
+	},
+};
+
+MODULE_DESCRIPTION("MediaTek MT8196 VLP clock generator driver");
+module_platform_driver(clk_mt8196_vlp_drv);
+MODULE_LICENSE("GPL");
-- 
2.39.5


