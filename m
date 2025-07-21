Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0C5C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HosIlLpdg8z/ykFhOYHRDIerqF3JEGotgEXCjFHSVs=; b=aQ0ET34NaqpNQqhFpfNjMfErHn
	HwPVN1Okwd2WKv6TmziDcuJLo+z1tolzd1whLLF1dwzrcpbL1CeD+2XDajDS8WB+3irhMjlBeNHjo
	xg4zxIRK+ALyh0KugDJlIHub+zIYxQUSCs1OVc1uaLacZTDc7cnyVkF5YKTzCc1dGpmrweu0EJ0u+
	UhTvIRGms+Yux0BPL+OBm5IExrtMD5A7JyMZU6JVznx5ie68+JxBdwD5WslV5DKkKGZr8jApBRxjs
	oponcjWA7IxUCE8GxhjJ+lvb13u7msCj6cKaXnwGu05BAQ2f6pD3yfG1MxJZLKkBE5QGCvzf23OEZ
	nRj7FfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udm2d-0000000GggU-2MG6;
	Mon, 21 Jul 2025 08:38:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlhE-0000000Gc08-3UjQ;
	Mon, 21 Jul 2025 08:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753085787;
	bh=+EODxAVQYv4u5YdFYTSqDaq7RO8ysoa55G/T9aqDhFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o8TkuqtPUIwrbWXAfZvW5VZxahsrZUWxIILNWk+j5QB3Xg9wBj4hwwCxlVV56jMC6
	 8I04+8ZitrI/KSyeH/lPV8Mr4f0VSQRP+Z27QRV6KDmzAkP2eqyqA5kH3Vta8j2kNC
	 DcEnLb12GgSgg7MlsOzk2sXrQBDUGwZfOksXIarlUe73qtvL9M9hleaoGLohhnXxmQ
	 7zaKFGf215dPvrl6juaWK2uhKrL11vXpYVaOcnEFwMXBtsvKfqKmbI1EdJcpilKHXC
	 hkhs9hcDbMAWzuRSSqmbwJv2rA+N18j9oR4Vvyajxdh/ROMn6xNaqVo/fhsOJxF7Kb
	 qxpQ2SkPaqugg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4487:69c6:40a:81be])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2742517E1540;
	Mon, 21 Jul 2025 10:16:26 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: nfraprado@collabora.com,
	arnd@arndb.de,
	colin.i.king@gmail.com,
	u.kleine-koenig@baylibre.com,
	andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com,
	bchihi@baylibre.com,
	frank-w@public-files.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 8/9] thermal/drivers/mediatek/lvts_thermal: Add MT8196 support
Date: Mon, 21 Jul 2025 10:14:58 +0200
Message-Id: <20250721081459.16278-9-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250721081459.16278-1-laura.nao@collabora.com>
References: <20250721081459.16278-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_011629_017615_7A581565 
X-CRM114-Status: GOOD (  11.47  )
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

Add LVTS driver support for MT8196.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 166 ++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 81c8309ff9df..1242d0bf6f8b 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -92,6 +92,10 @@
 #define LVTS_COEFF_B_MT8195			250460
 #define LVTS_COEFF_A_MT7988			-204650
 #define LVTS_COEFF_B_MT7988			204650
+#define LVTS_COEFF_A_MT8196			391460
+#define LVTS_COEFF_B_MT8196			-391460
+
+#define LVTS_MSR_OFFSET_MT8196		-984
 
 #define LVTS_MSR_IMMEDIATE_MODE		0
 #define LVTS_MSR_FILTERED_MODE		1
@@ -755,6 +759,39 @@ static int lvts_sensor_init(struct device *dev, struct lvts_ctrl *lvts_ctrl,
  * <-----ap--tc#3-----> <-----sensor#7-----> <-----sensor#8----->
  *  0x40 | 0x41 | 0x42 | 0x43 | 0x44 | 0x45 | 0x46 | 0x47 | 0x48
  *
+ * MT8196 :
+ * Stream index map for MCU Domain mt8196 :
+ *
+ * <-sensor#1--> <-sensor#0--> <-sensor#3--> <-sensor#2-->
+ *  0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09 | 0x0A | 0x0B
+ *
+ * <-sensor#5--> <-sensor#4--> <-sensor#7--> <-sensor#6-->
+ *  0x0C | 0x0D | 0x0E | 0x0F | 0x10 | 0x11 | 0x12 | 0x13
+ *
+ * <-sensor#9--> <-sensor#8--> <-sensor#11-> <-sensor#10->
+ *  0x14 | 0x15 | 0x16 | 0x17 | 0x18 | 0x19 | 0x1A | 0X1B
+ *
+ * <-sensor#13-> <-sensor#12-> <-sensor#15-> <-sensor#14->
+ *  0x1C | 0x1D | 0x1E | 0x1F | 0x20 | 0x21 | 0x22 | 0x23
+ *
+ * Stream index map for APU Domain mt8196 :
+ *
+ * <-sensor#1--> <-sensor#0--> <-sensor#3--> <-sensor#2-->
+ *  0x24 | 0x25 | 0x26 | 0x27 | 0x28 | 0x29 | 0x2A | 0x2B
+ *
+ * Stream index map for GPU Domain mt8196 :
+ *
+ * <-sensor#1--> <-sensor#0-->
+ *  0x2C | 0x2D | 0x2E | 0x2F
+ *
+ * Stream index map for AP Domain mt8196 :
+ *
+ * <-sensor#1--> <-sensor#0--> <-sensor#3--> <-sensor#2-->
+ *  0x30 | 0x31 | 0x32 | 0x33 | 0x34 | 0x35 | 0x36 | 0x37
+ *
+ * <-sensor#5--> <-sensor#4--> <-sensor#6--> <-sensor#7-->
+ *  0x38 | 0x39 | 0x3A | 0x3B | 0x3C | 0x3D | 0x3E | 0x3F
+ *
  * Note: In some cases, values don't strictly follow a little endian ordering.
  * The data description gives byte offsets constituting each calibration value
  * for each sensor.
@@ -1808,6 +1845,103 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_data_ctrl[] = {
 	}
 };
 
+static const struct lvts_ctrl_data mt8196_lvts_mcu_data_ctrl[] = {
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8196_MCU_MEDIUM_CPU6_0,
+			  .cal_offsets = { 0x06, 0x07 } },
+			{ .dt_id = MT8196_MCU_MEDIUM_CPU6_1,
+			  .cal_offsets = { 0x04, 0x05 } },
+			{ .dt_id = MT8196_MCU_DSU2,
+			  .cal_offsets = { 0x0A, 0x0B } },
+			{ .dt_id = MT8196_MCU_DSU3,
+			  .cal_offsets = { 0x08, 0x09 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset = 0x0,
+		.mode = LVTS_MSR_ATP_MODE,
+	},
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8196_MCU_LITTLE_CPU3,
+			  .cal_offsets = { 0x0E, 0x0F } },
+			{ .dt_id = MT8196_MCU_LITTLE_CPU0,
+			  .cal_offsets = { 0x0C, 0x0D } },
+			{ .dt_id = MT8196_MCU_LITTLE_CPU1,
+			  .cal_offsets = { 0x12, 0x13 } },
+			{ .dt_id = MT8196_MCU_LITTLE_CPU2,
+			  .cal_offsets = { 0x10, 0x11 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset = 0x100,
+		.mode = LVTS_MSR_ATP_MODE,
+	},
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8196_MCU_MEDIUM_CPU4_0,
+			  .cal_offsets = { 0x16, 0x17 } },
+			{ .dt_id = MT8196_MCU_MEDIUM_CPU4_1,
+			  .cal_offsets = { 0x14, 0x15 } },
+			{ .dt_id = MT8196_MCU_MEDIUM_CPU5_0,
+			  .cal_offsets = { 0x1A, 0x1B } },
+			{ .dt_id = MT8196_MCU_MEDIUM_CPU5_1,
+			  .cal_offsets = { 0x18, 0x19 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset = 0x200,
+		.mode = LVTS_MSR_ATP_MODE,
+	},
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8196_MCU_DSU0,
+			  .cal_offsets = { 0x1E, 0x1F } },
+			{ .dt_id = MT8196_MCU_DSU1,
+			  .cal_offsets = { 0x1C, 0x1D } },
+			{ .dt_id = MT8196_MCU_BIG_CPU7_0,
+			  .cal_offsets = { 0x22, 0x23 } },
+			{ .dt_id = MT8196_MCU_BIG_CPU7_1,
+			  .cal_offsets = { 0x20, 0x21 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset = 0x300,
+		.mode = LVTS_MSR_ATP_MODE,
+	}
+};
+
+static const struct lvts_ctrl_data mt8196_lvts_ap_data_ctrl[] = {
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8196_AP_TOP0,
+			  .cal_offsets = { 0x32, 0x33 } },
+			{ .dt_id = MT8196_AP_TOP1,
+			  .cal_offsets = { 0x30, 0x31 } },
+			{ .dt_id = MT8196_AP_TOP2,
+			  .cal_offsets = { 0x36, 0x37 } },
+			{ .dt_id = MT8196_AP_TOP3,
+			  .cal_offsets = { 0x34, 0x35 } }
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset = 0x0,
+		.mode = LVTS_MSR_ATP_MODE,
+	},
+	{
+		.lvts_sensor = {
+			{ .dt_id = MT8196_AP_BOT0,
+			  .cal_offsets = { 0x3A, 0x3B } },
+			{ .dt_id = MT8196_AP_BOT1,
+			  .cal_offsets = { 0x38, 0x39 } },
+			{ .dt_id = MT8196_AP_BOT2,
+			  .cal_offsets = { 0x3E, 0x3F } },
+			{ .dt_id = MT8196_AP_BOT3,
+			  .cal_offsets = { 0x3C, 0x3D } }
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset = 0x100,
+		.mode = LVTS_MSR_ATP_MODE,
+	}
+};
+
+
 static const struct lvts_data mt7988_lvts_ap_data = {
 	.lvts_ctrl	= mt7988_lvts_ap_data_ctrl,
 	.num_lvts_ctrl	= ARRAY_SIZE(mt7988_lvts_ap_data_ctrl),
@@ -1919,6 +2053,36 @@ static const struct lvts_data mt8195_lvts_ap_data = {
 	}
 };
 
+static const struct lvts_data mt8196_lvts_mcu_data = {
+	.lvts_ctrl	= mt8196_lvts_mcu_data_ctrl,
+	.num_lvts_ctrl	= ARRAY_SIZE(mt8196_lvts_mcu_data_ctrl),
+	.temp_factor	= LVTS_COEFF_A_MT8196,
+	.temp_offset	= LVTS_COEFF_B_MT8196,
+	.gt_calib_bit_offset = 0,
+	.def_calibration = 14437,
+	.num_cal_offsets = 2,
+	.msr_offset = LVTS_MSR_OFFSET_MT8196,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw_v2,
+	}
+};
+
+static const struct lvts_data mt8196_lvts_ap_data = {
+	.lvts_ctrl	= mt8196_lvts_ap_data_ctrl,
+	.num_lvts_ctrl	= ARRAY_SIZE(mt8196_lvts_ap_data_ctrl),
+	.temp_factor	= LVTS_COEFF_A_MT8196,
+	.temp_offset	= LVTS_COEFF_B_MT8196,
+	.gt_calib_bit_offset = 0,
+	.def_calibration = 14437,
+	.num_cal_offsets = 2,
+	.msr_offset = LVTS_MSR_OFFSET_MT8196,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw_v2,
+	}
+};
+
 static const struct of_device_id lvts_of_match[] = {
 	{ .compatible = "mediatek,mt7988-lvts-ap", .data = &mt7988_lvts_ap_data },
 	{ .compatible = "mediatek,mt8186-lvts", .data = &mt8186_lvts_data },
@@ -1928,6 +2092,8 @@ static const struct of_device_id lvts_of_match[] = {
 	{ .compatible = "mediatek,mt8192-lvts-ap", .data = &mt8192_lvts_ap_data },
 	{ .compatible = "mediatek,mt8195-lvts-mcu", .data = &mt8195_lvts_mcu_data },
 	{ .compatible = "mediatek,mt8195-lvts-ap", .data = &mt8195_lvts_ap_data },
+	{ .compatible = "mediatek,mt8196-lvts-mcu", .data = &mt8196_lvts_mcu_data },
+	{ .compatible = "mediatek,mt8196-lvts-ap", .data = &mt8196_lvts_ap_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, lvts_of_match);
-- 
2.39.5


