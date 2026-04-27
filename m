Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6714FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjpJj08jMuWBZWMLQbQU+XI60OvXFq5qGjiOCEkBGns=; b=1FOvgadSYWcHKewgUonZVo8yw/
	9JaIY3Id7jugPr5ImdxJYh3dfWewdacZXYfrC0oNntpRWBRhvP87dhU1+qOpmZG9vKzt0nc0y/ZoR
	K8R+kfqb2P+fxAqUO36UrY6Q7S4exJrmj6cCP17E/SNqSGhmUQ68VAPZFNTCeL8RSPiI6TuVbjQrF
	9ut86lErCcAPRy8pkMCZJXsJSDrxOPIKHB5Un9j+uN3VFgBnwpO2KWxvkiE55Uj0oGHRG99I/kYs1
	YtKALOtd4Zr49mZZpO98o9gnqZSpTOdT5Y3J3ZcKbmM8Iag5FeWgUCWyPK3E6koCRtZ15SAkonWQJ
	yFCZGO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFqc-0000000GJPw-1L82;
	Mon, 27 Apr 2026 06:53:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFqT-0000000GJIm-2uER;
	Mon, 27 Apr 2026 06:53:36 +0000
X-UUID: c7e2f908420511f19e7563141e833ce8-20260426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PjpJj08jMuWBZWMLQbQU+XI60OvXFq5qGjiOCEkBGns=;
	b=rMBR8OWoP6cHJ/MUgRe9aG/PPAF+gKzb8VUbRLZuwG09TiN4tXf28/1ssJler4SVESg2eJc5zofm+ibw1KPjJZh3TO2eJhRTDXMDXC5Z/GQeqt4G7H89y9pElHtg/VIbnW520jUDGE9/jwW3QNSdiv58r3WM1IbbBVKW2MEF61I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:112d9953-f880-49d7-bb0a-a528b0e46756,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:e7bac3a,CLOUDID:11e67ebe-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c7e2f908420511f19e7563141e833ce8-20260426
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kuanfu.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1754067792; Sun, 26 Apr 2026 23:53:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 14:53:19 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 14:53:19 +0800
From: mtk36707 <kuanfu.lu@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Balsam
 CHIHI <bchihi@baylibre.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <jarried.lin@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <justin.yeh@mediatek.com>, Kuanfu Lu
	<kuanfu.lu@mediatek.com>
Subject: [PATCH 2/2] thermal: mediatek: lvts: Add MT8189 support
Date: Mon, 27 Apr 2026 14:48:30 +0800
Message-ID: <20260427065236.1685057-2-kuanfu.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260427065236.1685057-1-kuanfu.lu@mediatek.com>
References: <20260427065236.1685057-1-kuanfu.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_235329_788448_D3DC0205 
X-CRM114-Status: GOOD (  20.53  )
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

From: Kuanfu Lu <kuanfu.lu@mediatek.com>

Add LVTS thermal support for MediaTek MT8189 by adding MT8189-specific
controller/sensor topology and platform data for the MCU and AP domains.

MT8189 differs from previous SoCs in a few aspects, so extend the driver
to handle these variations:
- Program the hardware thermal shutdown threshold (tshut) using raw units.
- Add per-SoC feature flags to skip clock gating and reset control when
  they are not required, and to enable Stage-3 monitor interrupt setup.
- Pass SoC data into lvts_irq_init() and lvts_ctrl_configure() so the
  initialization can be configured per platform.

This enables monitoring of MT8189 CPU clusters and AP domain sensors
(SOC/APU/GPU) with the existing LVTS driver.

Signed-off-by: Kuanfu Lu <kuanfu.lu@mediatek.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 142 +++++++++++++++++++++---
 1 file changed, 129 insertions(+), 13 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index a9617d5e0077..9dbd9191e3ba 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -70,6 +70,7 @@
 #define LVTS_HW_FILTER				0x0
 #define LVTS_TSSEL_CONF				0x13121110
 #define LVTS_CALSCALE_CONF			0x300
+#define LVTS_MONINT_CONF_STAGE3			BIT(31)
 
 #define LVTS_MONINT_OFFSET_HIGH_INTEN_SENSOR0		BIT(3)
 #define LVTS_MONINT_OFFSET_HIGH_INTEN_SENSOR1		BIT(8)
@@ -159,6 +160,9 @@ struct lvts_data {
 	int temp_offset;
 	int gt_calib_bit_offset;
 	unsigned int def_calibration;
+	bool clock_gate_no_need;
+	bool reset_no_need;
+	bool conf_stage3_need;
 	u16 msr_offset;
 };
 
@@ -1044,7 +1048,7 @@ static void lvts_write_config(struct lvts_ctrl *lvts_ctrl, const u32 *cmds, int
 	}
 }
 
-static int lvts_irq_init(struct lvts_ctrl *lvts_ctrl)
+static int lvts_irq_init(struct lvts_ctrl *lvts_ctrl, const struct lvts_data *lvts_data)
 {
 	/*
 	 * LVTS_PROTCTL : Thermal Protection Sensor Selection
@@ -1079,7 +1083,11 @@ static int lvts_irq_init(struct lvts_ctrl *lvts_ctrl)
 	 * The LVTS_MONINT register layout is the same as the LVTS_MONINTSTS
 	 * register, except we set the bits to enable the interrupt.
 	 */
-	writel(0, LVTS_MONINT(lvts_ctrl->base));
+
+	if (lvts_data->conf_stage3_need)
+		writel(LVTS_MONINT_CONF_STAGE3, LVTS_MONINT(lvts_ctrl->base));
+	else
+		writel(0, LVTS_MONINT(lvts_ctrl->base));
 
 	return 0;
 }
@@ -1177,7 +1185,8 @@ static int lvts_ctrl_calibrate(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 	return 0;
 }
 
-static int lvts_ctrl_configure(struct device *dev, struct lvts_ctrl *lvts_ctrl)
+static int lvts_ctrl_configure(struct device *dev, struct lvts_ctrl *lvts_ctrl,
+			       const struct lvts_data *lvts_data)
 {
 	u32 value;
 
@@ -1279,7 +1288,7 @@ static int lvts_ctrl_configure(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 	value = LVTS_FILTER_INTERVAL << 16 | LVTS_SENSOR_INTERVAL;
 	writel(value, LVTS_MONCTL2(lvts_ctrl->base));
 
-	return lvts_irq_init(lvts_ctrl);
+	return lvts_irq_init(lvts_ctrl, lvts_data);
 }
 
 static int lvts_ctrl_start(struct device *dev, struct lvts_ctrl *lvts_ctrl)
@@ -1420,13 +1429,13 @@ static int lvts_domain_init(struct device *dev, struct lvts_domain *lvts_td,
 			return ret;
 		}
 
-		ret = lvts_ctrl_calibrate(dev, lvts_ctrl);
+		ret = lvts_ctrl_calibrate(dev, lvts_ctrl, lvts_data);
 		if (ret) {
 			dev_dbg(dev, "Failed to calibrate controller");
 			return ret;
 		}
 
-		ret = lvts_ctrl_configure(dev, lvts_ctrl);
+		ret = lvts_ctrl_configure(dev, lvts_ctrl, lvts_data);
 		if (ret) {
 			dev_dbg(dev, "Failed to configure controller");
 			return ret;
@@ -1458,9 +1467,12 @@ static int lvts_probe(struct platform_device *pdev)
 	if (!lvts_data)
 		return -ENODEV;
 
-	lvts_td->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(lvts_td->clk))
-		return dev_err_probe(dev, PTR_ERR(lvts_td->clk), "Failed to retrieve clock\n");
+	if (!lvts_data->clock_gate_no_need) {
+		lvts_td->clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(lvts_td->clk))
+			return dev_err_probe(dev, PTR_ERR(lvts_td->clk),
+					    "Failed to retrieve clock\n");
+	}
 
 	res = platform_get_mem_or_io(pdev, 0);
 	if (!res)
@@ -1470,10 +1482,12 @@ static int lvts_probe(struct platform_device *pdev)
 	if (IS_ERR(lvts_td->base))
 		return dev_err_probe(dev, PTR_ERR(lvts_td->base), "Failed to map io resource\n");
 
-	lvts_td->reset = devm_reset_control_get_by_index(dev, 0);
-	if (IS_ERR(lvts_td->reset))
-		return dev_err_probe(dev, PTR_ERR(lvts_td->reset), "Failed to get reset control\n");
-
+	if (!lvts_data->reset_no_need) {
+		lvts_td->reset = devm_reset_control_get_by_index(dev, 0);
+		if (IS_ERR(lvts_td->reset))
+			return dev_err_probe(dev, PTR_ERR(lvts_td->reset),
+					     "Failed to get reset control\n");
+	}
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -1742,6 +1756,78 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
 	}
 };
 
+static const struct lvts_ctrl_data mt8189_lvts_mcu_data_ctrl[] = {
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8189_MCU_LITTLE_CPU1,
+			  .cal_offsets = { 4, 5, 6 } },
+			{ .dt_id = MT8189_MCU_LITTLE_CPU2,
+			  .cal_offsets = { 8, 9, 10 } },
+			{ .dt_id = MT8189_MCU_LITTLE_CPU3,
+			  .cal_offsets = { 12, 13, 14 } },
+			{ .dt_id = MT8189_MCU_LITTLE_CPU4,
+			  .cal_offsets = { 16, 17, 18 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset = 0x0,
+	},
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8189_MCU_LITTLE_CPU5,
+			  .cal_offsets = { 24, 25, 26 } },
+			{ .dt_id = MT8189_MCU_LITTLE_CPU6,
+			  .cal_offsets = { 28, 29, 30 } },
+			{ .dt_id = MT8189_MCU_LITTLE_CPU7,
+			  .cal_offsets = { 32, 33, 34 } },
+			{ .dt_id = MT8189_MCU_LITTLE_CPU8,
+			  .cal_offsets = { 36, 37, 38 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset = 0x100,
+	},
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8189_MCU_BIG_CPU1,
+			  .cal_offsets = { 44, 45, 46 } },
+			{ .dt_id = MT8189_MCU_BIG_CPU2,
+			  .cal_offsets = { 48, 49, 50 } },
+			{ .dt_id = MT8189_MCU_BIG_CPU3,
+			  .cal_offsets = { 52, 53, 54 } },
+			{ .dt_id = MT8189_MCU_BIG_CPU4,
+			  .cal_offsets = { 56, 57, 58 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset = 0x200,
+	}
+};
+
+static const struct lvts_ctrl_data mt8189_lvts_ap_data_ctrl[] = {
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8189_AP_SOC1,
+			  .cal_offsets = { 64, 65, 66 } },
+			{ .dt_id = MT8189_AP_SOC2,
+			  .cal_offsets = { 68, 69, 70 } },
+			{ .dt_id = MT8189_AP_SOC3,
+			  .cal_offsets = { 72, 73, 74 } },
+			{ .dt_id = MT8189_AP_APU,
+			  .cal_offsets = { 76, 77, 78 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset = 0x0,
+	},
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8189_AP_GPU1,
+			  .cal_offsets = { 84, 85, 86 } },
+			{ .dt_id = MT8189_AP_GPU2,
+			  .cal_offsets = { 88, 89, 90 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 0, 0),
+		.offset = 0x100,
+	}
+};
+
 static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] = {
 	{
 		.lvts_sensor = {
@@ -2087,6 +2173,34 @@ static const struct lvts_data mt8188_lvts_ap_data = {
 	.ops = &lvts_platform_ops_mt7988,
 };
 
+static const struct lvts_data mt8189_lvts_ap_data = {
+	.lvts_ctrl		= mt8189_lvts_ap_data_ctrl,
+	.conn_cmd		= default_conn_cmds,
+	.init_cmd		= default_init_cmds,
+	.num_lvts_ctrl		= ARRAY_SIZE(mt8189_lvts_ap_data_ctrl),
+	.num_conn_cmd		= ARRAY_SIZE(default_conn_cmds),
+	.num_init_cmd		= ARRAY_SIZE(default_init_cmds),
+	.temp_factor		= LVTS_COEFF_A_MT8195,
+	.temp_offset		= LVTS_COEFF_B_MT8195,
+	.gt_calib_bit_offset	= 0,
+	.def_calibration	= 35000,
+	.clock_gate_no_need	= true,
+	.reset_no_need		= true,
+	.conf_stage3_need	= true,
+};
+
+static const struct lvts_data mt8189_lvts_mcu_data = {
+	.lvts_ctrl		= mt8189_lvts_mcu_data_ctrl,
+	.num_lvts_ctrl		= ARRAY_SIZE(mt8189_lvts_mcu_data_ctrl),
+	.temp_factor		= LVTS_COEFF_A_MT8195,
+	.temp_offset		= LVTS_COEFF_B_MT8195,
+	.gt_calib_bit_offset	= 0,
+	.def_calibration	= 35000,
+	.clock_gate_no_need	= true,
+	.reset_no_need		= true,
+	.conf_stage3_need	= true,
+};
+
 static const struct lvts_data mt8192_lvts_mcu_data = {
 	.lvts_ctrl	= mt8192_lvts_mcu_data_ctrl,
 	.conn_cmd	= default_conn_cmds,
@@ -2177,6 +2291,8 @@ static const struct of_device_id lvts_of_match[] = {
 	{ .compatible = "mediatek,mt8186-lvts", .data = &mt8186_lvts_data },
 	{ .compatible = "mediatek,mt8188-lvts-mcu", .data = &mt8188_lvts_mcu_data },
 	{ .compatible = "mediatek,mt8188-lvts-ap", .data = &mt8188_lvts_ap_data },
+	{ .compatible = "mediatek,mt8189-lvts-mcu", .data = &mt8189_lvts_mcu_data },
+	{ .compatible = "mediatek,mt8189-lvts-ap", .data = &mt8189_lvts_ap_data },
 	{ .compatible = "mediatek,mt8192-lvts-mcu", .data = &mt8192_lvts_mcu_data },
 	{ .compatible = "mediatek,mt8192-lvts-ap", .data = &mt8192_lvts_ap_data },
 	{ .compatible = "mediatek,mt8195-lvts-mcu", .data = &mt8195_lvts_mcu_data },
-- 
2.45.2


