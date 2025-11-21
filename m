Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC654CFC264
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 11:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhFGBbz9ywxZCfqwNLdaHLOF7wmYlBjgHok8e+rcTR0=; b=LPLEIxGFrv/aZjOUDv0Wj1Pn7b
	TLDFGNy70mqNE4Ifyh04r2tXJ9UmYuDgkfAKPDRhEyDsM3dDKPw+///YGJkOjm9DYAl9a41a22+uc
	ElJrrwFOPIU2jWTW6exHFuEX/5JxQqlxLV1zLgKIkrE+Xtl+9BVRl8JIjVWZxH6FHfNx3J2rRkm9L
	BTfOcSTNqzdLNZCFWAfypCXFV3q1sH/FOWS7aXa4ryobSKovkx3/dYf6CCxVh39brffnqiw5wcr14
	BB0qlcd3MZOqMmAoWGzk8DRZbg/SzhIFh3m3zHUabzwmmXgRUKPyx+QoymQUMhsOhrZPyPls5oLbw
	k1mTOeeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8j-00000008I5H-16Pq;
	Fri, 21 Nov 2025 11:17:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8X-00000008Hxj-28jM;
	Fri, 21 Nov 2025 11:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763723825;
	bh=wFmJoNcAx7BXY/TLQWuVv0fEAk/CbB1J3o6ZSEIHGAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nX5rqsq/k+TqTHgwPRqjPGpC0OEtxhY6pH9Z7E22FRbmH03eKroRpAq3hyIOw/5Sd
	 DVlftXRSNfmXLYtXi4wa2SU0PJXOSjxmyAJeybrWx4g00PIodR/QLieowpf0bZ/qp0
	 PtsVp1TTUOz4CLySqp+SE2cv1VHFKImYNSgg1A9I61xTr5bq0cUeV6xESAobPxV530
	 D2RV5xSAF6DXa+WBYef33GdDUjhmGxbZR4c4gFigNxv4Jsq0J38Guz6WmDN4xZ5Jf6
	 CziGixOmyQL4rHiCkOmTleG5O/HNivCeXFmZaW8VNy1dtypRZXpsvaPjaBFADMcGPm
	 h55cDe8HVYUMg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:c4bf:9969:6e1c:dc69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 810C017E13C1;
	Fri, 21 Nov 2025 12:17:04 +0100 (CET)
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
	wenst@chromium.org,
	fshao@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v4 2/9] thermal/drivers/mediatek/lvts: Make number of calibration offsets configurable
Date: Fri, 21 Nov 2025 12:16:35 +0100
Message-Id: <20251121-mt8196-lvts-v4-v4-2-357f955a3176@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
References: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_031709_899771_0F862117 
X-CRM114-Status: GOOD (  14.47  )
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

Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index ab55b20cda47..1c54d0b75b1a 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -96,12 +96,14 @@
 
 #define LVTS_MINIMUM_THRESHOLD		20000
 
+#define LVTS_MAX_CAL_OFFSETS		3
+
 static int golden_temp = LVTS_GOLDEN_TEMP_DEFAULT;
 static int golden_temp_offset;
 
 struct lvts_sensor_data {
 	int dt_id;
-	u8 cal_offsets[3];
+	u8 cal_offsets[LVTS_MAX_CAL_OFFSETS];
 };
 
 struct lvts_ctrl_data {
@@ -127,6 +129,7 @@ struct lvts_data {
 	const struct lvts_ctrl_data *lvts_ctrl;
 	const u32 *conn_cmd;
 	const u32 *init_cmd;
+	int num_cal_offsets;
 	int num_lvts_ctrl;
 	int num_conn_cmd;
 	int num_init_cmd;
@@ -711,7 +714,7 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
 					u8 *efuse_calibration,
 					size_t calib_len)
 {
-	int i;
+	int i, j;
 	u32 gt;
 
 	/* A zero value for gt means that device has invalid efuse data */
@@ -720,17 +723,18 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
 	lvts_for_each_valid_sensor(i, lvts_ctrl_data) {
 		const struct lvts_sensor_data *sensor =
 					&lvts_ctrl_data->lvts_sensor[i];
+		u32 calib = 0;
 
-		if (sensor->cal_offsets[0] >= calib_len ||
-		    sensor->cal_offsets[1] >= calib_len ||
-		    sensor->cal_offsets[2] >= calib_len)
-			return -EINVAL;
+		for (j = 0; j < lvts_ctrl->lvts_data->num_cal_offsets; j++) {
+			u8 offset = sensor->cal_offsets[j];
+
+			if (offset >= calib_len)
+				return -EINVAL;
+			calib |= efuse_calibration[offset] << (8 * j);
+		}
 
 		if (gt) {
-			lvts_ctrl->calibration[i] =
-				(efuse_calibration[sensor->cal_offsets[0]] << 0) +
-				(efuse_calibration[sensor->cal_offsets[1]] << 8) +
-				(efuse_calibration[sensor->cal_offsets[2]] << 16);
+			lvts_ctrl->calibration[i] = calib;
 		} else if (lvts_ctrl->lvts_data->def_calibration) {
 			lvts_ctrl->calibration[i] = lvts_ctrl->lvts_data->def_calibration;
 		} else {
@@ -1763,6 +1767,7 @@ static const struct lvts_data mt7988_lvts_ap_data = {
 	.temp_factor	= LVTS_COEFF_A_MT7988,
 	.temp_offset	= LVTS_COEFF_B_MT7988,
 	.gt_calib_bit_offset = 24,
+	.num_cal_offsets = 3,
 };
 
 static const struct lvts_data mt8186_lvts_data = {
@@ -1776,6 +1781,7 @@ static const struct lvts_data mt8186_lvts_data = {
 	.temp_offset	= LVTS_COEFF_B_MT7988,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 19000,
+	.num_cal_offsets = 3,
 };
 
 static const struct lvts_data mt8188_lvts_mcu_data = {
@@ -1789,6 +1795,7 @@ static const struct lvts_data mt8188_lvts_mcu_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 20,
 	.def_calibration = 35000,
+	.num_cal_offsets = 3,
 };
 
 static const struct lvts_data mt8188_lvts_ap_data = {
@@ -1802,6 +1809,7 @@ static const struct lvts_data mt8188_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 20,
 	.def_calibration = 35000,
+	.num_cal_offsets = 3,
 };
 
 static const struct lvts_data mt8192_lvts_mcu_data = {
@@ -1815,6 +1823,7 @@ static const struct lvts_data mt8192_lvts_mcu_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
+	.num_cal_offsets = 3,
 };
 
 static const struct lvts_data mt8192_lvts_ap_data = {
@@ -1828,6 +1837,7 @@ static const struct lvts_data mt8192_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
+	.num_cal_offsets = 3,
 };
 
 static const struct lvts_data mt8195_lvts_mcu_data = {
@@ -1841,6 +1851,7 @@ static const struct lvts_data mt8195_lvts_mcu_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
+	.num_cal_offsets = 3,
 };
 
 static const struct lvts_data mt8195_lvts_ap_data = {
@@ -1854,6 +1865,7 @@ static const struct lvts_data mt8195_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
+	.num_cal_offsets = 3,
 };
 
 static const struct of_device_id lvts_of_match[] = {

-- 
2.39.5

