Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B36CC87FC8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 08:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOUywsoH7DWcBGQ9EFiWvhbgr+AE4sfcDf8CfgVMADU=; b=bBvGUN+eWQe+bGusFIv01RGtBQ
	jctWTi1U5TlLeKZRJ5IX8u02qMRqOISF88k32u7xa0dnh7OnmPIVeWYsP0bYcmczsNNUaEXI/ZpwZ
	keBL3ax5qHc7TX7SWkkGGZrKGhP0Uju5Q0UK8Vh9dmVe1gkXeyfzoxrKTzoQO1zOdQwcDnQMa3uq9
	z69h+oW8Z7yHakPvPT4WHepyS6OFaM3oHY92N6euTumgatInbTI8ceq6p+L0YG3hYc/Niuipzm177
	f8f5UgI2/LBbNNNrxKgJiKFIPiQoqVrVT/pdELOyPmJmZ+pDBm0fMoMb5ORiQmetkFhQHXZ5T7jpy
	CbxX2OGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udloE-0000000GdRW-1GHp;
	Mon, 21 Jul 2025 08:23:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlh5-0000000Gbwv-40Ak;
	Mon, 21 Jul 2025 08:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753085778;
	bh=qb23vtrKeexL/aZTVh7nsCL83yHhYF1AW13B3lfwWuk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dl81BF2X1IvjXuHBFPuIO7k5sLxuZ6kg6EPnkHyHPW1EYMKJ3PzYzOYJJkjiBQUIi
	 VUW3l6J3a8NQRYsM21CYidg8gNnf8ULmIyNe3gNNzbgVZB0zXumvq37zYTxlfa8iAD
	 dYcto7d03pva7y+n7eeQmJgSlJ0UdeArAwwXieBEBtFFilGcBTAGQy7qBzKqIZCrL1
	 S82lxREBkbNmMc72yJ1YHqQ+GGlkxs50av6yH2dnMIaASvrvqs0Fbd0l/zTCHV/Uuf
	 aEosB4ozzLbC8xp6KBgJZJsHV0TsYpz0+mQ75qul/i7fKEUHGKaKWYmrgC6tB7KDsg
	 zgOLyQAVA5EKg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4487:69c6:40a:81be])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 891A217E1541;
	Mon, 21 Jul 2025 10:16:16 +0200 (CEST)
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
Subject: [PATCH 2/9] thermal/drivers/mediatek/lvts: Make number of calibration offsets configurable
Date: Mon, 21 Jul 2025 10:14:52 +0200
Message-Id: <20250721081459.16278-3-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250721081459.16278-1-laura.nao@collabora.com>
References: <20250721081459.16278-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_011620_165997_D0036E63 
X-CRM114-Status: GOOD (  14.73  )
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
 drivers/thermal/mediatek/lvts_thermal.c | 32 +++++++++++++++++--------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 985925147ac0..8d5259b9d03b 100644
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
@@ -125,6 +127,7 @@ struct lvts_ctrl_data {
 
 struct lvts_data {
 	const struct lvts_ctrl_data *lvts_ctrl;
+	int num_cal_offsets;
 	int num_lvts_ctrl;
 	int temp_factor;
 	int temp_offset;
@@ -707,7 +710,7 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
 					u8 *efuse_calibration,
 					size_t calib_len)
 {
-	int i;
+	int i, j;
 	u32 gt;
 
 	/* A zero value for gt means that device has invalid efuse data */
@@ -716,17 +719,18 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
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
@@ -1743,6 +1747,7 @@ static const struct lvts_data mt7988_lvts_ap_data = {
 	.temp_factor	= LVTS_COEFF_A_MT7988,
 	.temp_offset	= LVTS_COEFF_B_MT7988,
 	.gt_calib_bit_offset = 24,
+	.num_cal_offsets = 3,
 };
 
 static const struct lvts_data mt8186_lvts_data = {
@@ -1752,6 +1757,7 @@ static const struct lvts_data mt8186_lvts_data = {
 	.temp_offset	= LVTS_COEFF_B_MT7988,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 19000,
+	.num_cal_offsets = 3,
 };
 
 static const struct lvts_data mt8188_lvts_mcu_data = {
@@ -1761,6 +1767,7 @@ static const struct lvts_data mt8188_lvts_mcu_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 20,
 	.def_calibration = 35000,
+	.num_cal_offsets = 3,
 };
 
 static const struct lvts_data mt8188_lvts_ap_data = {
@@ -1770,6 +1777,7 @@ static const struct lvts_data mt8188_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 20,
 	.def_calibration = 35000,
+	.num_cal_offsets = 3,
 };
 
 static const struct lvts_data mt8192_lvts_mcu_data = {
@@ -1779,6 +1787,7 @@ static const struct lvts_data mt8192_lvts_mcu_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
+	.num_cal_offsets = 3,
 };
 
 static const struct lvts_data mt8192_lvts_ap_data = {
@@ -1788,6 +1797,7 @@ static const struct lvts_data mt8192_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
+	.num_cal_offsets = 3,
 };
 
 static const struct lvts_data mt8195_lvts_mcu_data = {
@@ -1797,6 +1807,7 @@ static const struct lvts_data mt8195_lvts_mcu_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
+	.num_cal_offsets = 3,
 };
 
 static const struct lvts_data mt8195_lvts_ap_data = {
@@ -1806,6 +1817,7 @@ static const struct lvts_data mt8195_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
+	.num_cal_offsets = 3,
 };
 
 static const struct of_device_id lvts_of_match[] = {
-- 
2.39.5


