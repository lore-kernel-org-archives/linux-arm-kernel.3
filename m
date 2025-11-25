Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE1ED0E6F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLga2UfrFkT3fnQmeC3t+Q2nIAdLv2jKhQ/alJMbHM0=; b=XCKtaYnqhY2SzOodguO3SkFOmQ
	ZxYfceWCRSjQDzufUYBh71lWrfJhUMm3JPepHRpC1Am2B9hx7yncUsW3cyXlDf+IaMtIj/Mt6Vbn9
	flmV5mmfGVtUgIJ55XFYveXxxUjG/OAuivaRKpQTUkwSZc6lIz57Ag3ay9ZJa1kyBA290B01tSEzh
	R9VALF58WUVFTfHluaR2Nv83R03WT39u4M/lO8uDhJJbLmfl3K6FNgZKihsX8KDQ0NqsltdlLDuWs
	jCGCQflmFj1O+9K6yE7XkxBfcMrzk6wgoo1v2yAy6W+3AJqkXDDCID307FvPpbSfvxg9UMT9sTboH
	FNc7DHww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvjg-0000000DZKV-3WQ4;
	Tue, 25 Nov 2025 16:17:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvja-0000000DZFn-42QZ;
	Tue, 25 Nov 2025 16:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764087460;
	bh=QvdZw2B8XbxQS//hiFICE90RRNKTXPSR/l/8lFZlen4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VooVnKivDx7LlbvJNPQGq4eQyQWJjD6Qx9XqqEesJVlwZccJMcr01/4JiqNwA04uc
	 z1fc1ljLNk4P19On9JoVwKLN20Jpa/wftfAlwjkkIaRNqaMNO4y3zHdH9d1k3y0TbI
	 +HK9gAr2D4pM5EN+xJhP6DK4Ndl0dElZTm+aX2srKxRYm9U5U6kZ7qh1xT3bWN4fde
	 LGVWAhXuFMuzU5jVkJeqQz7S0El11tqgebK84EvzqR7+o5JB5/kXfh1aYgosvSnVvB
	 qbRqb8kwa/JH9UaQQ5qtlPW5IlxKE3Lqnm/7vAFrRnPBfhKV4ssdwSjwvt3+Zi7YW0
	 24dn7qTnEyg8A==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:feae:4183:be92:e051])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E0C0B17E13CD;
	Tue, 25 Nov 2025 17:17:38 +0100 (CET)
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
	wenst@chromium.org,
	fshao@chromium.org,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v5 2/8] thermal/drivers/mediatek/lvts: Make number of calibration offsets configurable
Date: Tue, 25 Nov 2025 17:16:52 +0100
Message-Id: <20251125-mt8196-lvts-v4-v5-2-6db7eb903fb7@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251125-mt8196-lvts-v4-v5-0-6db7eb903fb7@collabora.com>
References: <20251125-mt8196-lvts-v4-v5-0-6db7eb903fb7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_081743_306628_E60EE92C 
X-CRM114-Status: GOOD (  18.01  )
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

MT8196/MT6991 use 2-byte eFuse calibration data, whereas other SoCs
supported by the driver rely on 3 bytes. Make the number of calibration
bytes per sensor configurable, enabling support for SoCs with varying
calibration formats.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 55 ++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 11 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index ab55b20cda47..babffdea9a4d 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -96,12 +96,15 @@
 
 #define LVTS_MINIMUM_THRESHOLD		20000
 
+#define LVTS_MAX_CAL_OFFSETS		3
+#define LVTS_NUM_CAL_OFFSETS_MT7988	3
+
 static int golden_temp = LVTS_GOLDEN_TEMP_DEFAULT;
 static int golden_temp_offset;
 
 struct lvts_sensor_data {
 	int dt_id;
-	u8 cal_offsets[3];
+	u8 cal_offsets[LVTS_MAX_CAL_OFFSETS];
 };
 
 struct lvts_ctrl_data {
@@ -127,6 +130,7 @@ struct lvts_data {
 	const struct lvts_ctrl_data *lvts_ctrl;
 	const u32 *conn_cmd;
 	const u32 *init_cmd;
+	int num_cal_offsets;
 	int num_lvts_ctrl;
 	int num_conn_cmd;
 	int num_init_cmd;
@@ -646,6 +650,26 @@ static int lvts_sensor_init(struct device *dev, struct lvts_ctrl *lvts_ctrl,
 	return 0;
 }
 
+static int lvts_decode_sensor_calibration(const struct lvts_sensor_data *sensor,
+					const u8 *efuse_calibration, u32 calib_len,
+					u8 num_offsets, u32 *calib)
+{
+	int i;
+	u32 calib_val = 0;
+
+	for (i = 0; i < num_offsets; i++) {
+		u8 offset = sensor->cal_offsets[i];
+
+		if (offset >= calib_len)
+			return -EINVAL;
+		// Pack each calibration byte into the correct position
+		calib_val |= efuse_calibration[offset] << (8 * i);
+	}
+
+	*calib = calib_val;
+	return 0;
+}
+
 /*
  * The efuse blob values follows the sensor enumeration per thermal
  * controller. The decoding of the stream is as follow:
@@ -711,26 +735,27 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
 					u8 *efuse_calibration,
 					size_t calib_len)
 {
-	int i;
+	const struct lvts_data *lvts_data = lvts_ctrl->lvts_data;
+	int i, ret;
 	u32 gt;
 
 	/* A zero value for gt means that device has invalid efuse data */
-	gt = (((u32 *)efuse_calibration)[0] >> lvts_ctrl->lvts_data->gt_calib_bit_offset) & 0xff;
+	gt = (((u32 *)efuse_calibration)[0] >> lvts_data->gt_calib_bit_offset) & 0xff;
 
 	lvts_for_each_valid_sensor(i, lvts_ctrl_data) {
 		const struct lvts_sensor_data *sensor =
 					&lvts_ctrl_data->lvts_sensor[i];
+		u32 calib = 0;
 
-		if (sensor->cal_offsets[0] >= calib_len ||
-		    sensor->cal_offsets[1] >= calib_len ||
-		    sensor->cal_offsets[2] >= calib_len)
-			return -EINVAL;
+		ret = lvts_decode_sensor_calibration(sensor, efuse_calibration,
+						     calib_len,
+						     lvts_data->num_cal_offsets,
+						     &calib);
+		if (ret)
+			return ret;
 
 		if (gt) {
-			lvts_ctrl->calibration[i] =
-				(efuse_calibration[sensor->cal_offsets[0]] << 0) +
-				(efuse_calibration[sensor->cal_offsets[1]] << 8) +
-				(efuse_calibration[sensor->cal_offsets[2]] << 16);
+			lvts_ctrl->calibration[i] = calib;
 		} else if (lvts_ctrl->lvts_data->def_calibration) {
 			lvts_ctrl->calibration[i] = lvts_ctrl->lvts_data->def_calibration;
 		} else {
@@ -1763,6 +1788,7 @@ static const struct lvts_data mt7988_lvts_ap_data = {
 	.temp_factor	= LVTS_COEFF_A_MT7988,
 	.temp_offset	= LVTS_COEFF_B_MT7988,
 	.gt_calib_bit_offset = 24,
+	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
 };
 
 static const struct lvts_data mt8186_lvts_data = {
@@ -1776,6 +1802,7 @@ static const struct lvts_data mt8186_lvts_data = {
 	.temp_offset	= LVTS_COEFF_B_MT7988,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 19000,
+	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
 };
 
 static const struct lvts_data mt8188_lvts_mcu_data = {
@@ -1789,6 +1816,7 @@ static const struct lvts_data mt8188_lvts_mcu_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 20,
 	.def_calibration = 35000,
+	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
 };
 
 static const struct lvts_data mt8188_lvts_ap_data = {
@@ -1802,6 +1830,7 @@ static const struct lvts_data mt8188_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 20,
 	.def_calibration = 35000,
+	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
 };
 
 static const struct lvts_data mt8192_lvts_mcu_data = {
@@ -1815,6 +1844,7 @@ static const struct lvts_data mt8192_lvts_mcu_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
+	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
 };
 
 static const struct lvts_data mt8192_lvts_ap_data = {
@@ -1828,6 +1858,7 @@ static const struct lvts_data mt8192_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
+	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
 };
 
 static const struct lvts_data mt8195_lvts_mcu_data = {
@@ -1841,6 +1872,7 @@ static const struct lvts_data mt8195_lvts_mcu_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
+	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
 };
 
 static const struct lvts_data mt8195_lvts_ap_data = {
@@ -1854,6 +1886,7 @@ static const struct lvts_data mt8195_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
+	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
 };
 
 static const struct of_device_id lvts_of_match[] = {

-- 
2.39.5

