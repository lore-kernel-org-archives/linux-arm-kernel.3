Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7071C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 15:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQdSZSk3m0O4cTMV4lNcCK2COPLEWf3gst2uJWrUFPM=; b=A/gpluseiFqq8L/m/fbnkjrtmW
	u5AbYkFY0F50FWaRO5pqXyl784YkXj4T1EqgDgqJVjWxYBnRnx1Brg9foeCLN1FOSrwq1aGij8z2l
	wCFKXleU6EJVjsroTg/L5KmJ4zpTOoFsJxG44bNyIQwPK6cUW4GQTpgZuO4k5zCp5oFsg+FLw2AVg
	I2XjbUE0iZsAHIm7po5RvU06KA2Mil8Y5IddZwa4LOK4YMUxW+WqGaATWZUJcoo55VwifmWCqt4jH
	q2fSMy63Koul/QoBdyDGCObw7CLssweJvQTeUs0POZ0nbuCHcwSmQLPscwjcMPsIxpASVHdS+P128
	OgtJoHWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8pk-00000001rLE-0nPn;
	Wed, 30 Jul 2025 15:35:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8dW-00000001q2H-0O9y;
	Wed, 30 Jul 2025 15:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753888952;
	bh=Q3cA3pX+1WE7CaAypi/uX/17iUDzaFYwPBaN7mhKPzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BFGf2TEkexEMHZ3if4oUDW+fgJ1ItuvC85Rc/VRT+UoW1JcVJCnuJwjdEyiXbb84P
	 bU8MT7aD0YGOrFRSPzb2uG7/n/D8zF1sYjHAvOmwoSAXjWVwRU9Ms3DMhlQmhO1mhP
	 +wp1VGJMXUTqgzdbRQDFIj3I6VfsG9UTl0ZpblAqF0ik3dz8xS/lZjAlw2pkCqg8Nt
	 l0Ki+aeCs1yc03ChHh91RyGjOB5ebXxeV5XV7BO/luVON3H9Nrf/6SXUQm0UxXGC7E
	 Q3x460J3IydAJYT9nNUld6YW15y1/7vAiR0agLKzF+fqvIpoo7bKjfaKHpvmEzd4RS
	 K9GZNXAn3U8Lw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:41d5:bfd6:7c6f:85ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C38817E15A8;
	Wed, 30 Jul 2025 17:22:31 +0200 (CEST)
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
Cc: wenst@chromium.org,
	nfraprado@collabora.com,
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
Subject: [PATCH v2 4/9] thermal: mediatek: lvts: Add platform ops to support alternative conversion logic
Date: Wed, 30 Jul 2025 17:21:23 +0200
Message-Id: <20250730152128.311109-5-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730152128.311109-1-laura.nao@collabora.com>
References: <20250730152128.311109-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_082234_273570_D7475A9C 
X-CRM114-Status: GOOD (  12.65  )
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

Introduce lvts_platform_ops struct to support SoC-specific versions of
lvts_raw_to_temp() and lvts_temp_to_raw() conversion functions.

This is in preparation for supporting SoCs like MT8196/MT6991, which
require a different lvts_temp_to_raw() implementation.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 46 +++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 8398af657ba2..6e4a35ecaf34 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -125,8 +125,14 @@ struct lvts_ctrl_data {
 			continue; \
 		else
 
+struct lvts_platform_ops {
+	int (*lvts_raw_to_temp)(u32 raw_temp, int temp_factor);
+	u32 (*lvts_temp_to_raw)(int temperature, int temp_factor);
+};
+
 struct lvts_data {
 	const struct lvts_ctrl_data *lvts_ctrl;
+	struct lvts_platform_ops ops;
 	const u32 *conn_cmd;
 	const u32 *init_cmd;
 	int num_cal_offsets;
@@ -300,6 +306,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 	struct lvts_ctrl *lvts_ctrl = container_of(lvts_sensor, struct lvts_ctrl,
 						   sensors[lvts_sensor->id]);
 	const struct lvts_data *lvts_data = lvts_ctrl->lvts_data;
+	const struct lvts_platform_ops *ops = &lvts_data->ops;
 	void __iomem *msr = lvts_sensor->msr;
 	u32 value;
 	int rc;
@@ -332,7 +339,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 	if (rc)
 		return -EAGAIN;
 
-	*temp = lvts_raw_to_temp(value & 0xFFFF, lvts_data->temp_factor);
+	*temp = ops->lvts_raw_to_temp(value & 0xFFFF, lvts_data->temp_factor);
 
 	return 0;
 }
@@ -400,10 +407,11 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	struct lvts_ctrl *lvts_ctrl = container_of(lvts_sensor, struct lvts_ctrl,
 						   sensors[lvts_sensor->id]);
 	const struct lvts_data *lvts_data = lvts_ctrl->lvts_data;
+	const struct lvts_platform_ops *ops = &lvts_data->ops;
 	void __iomem *base = lvts_sensor->base;
-	u32 raw_low = lvts_temp_to_raw(low != -INT_MAX ? low : LVTS_MINIMUM_THRESHOLD,
+	u32 raw_low = ops->lvts_temp_to_raw(low != -INT_MAX ? low : LVTS_MINIMUM_THRESHOLD,
 				       lvts_data->temp_factor);
-	u32 raw_high = lvts_temp_to_raw(high, lvts_data->temp_factor);
+	u32 raw_high = ops->lvts_temp_to_raw(high, lvts_data->temp_factor);
 	bool should_update_thresh;
 
 	lvts_sensor->low_thresh = low;
@@ -1774,6 +1782,10 @@ static const struct lvts_data mt7988_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT7988,
 	.gt_calib_bit_offset = 24,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct lvts_data mt8186_lvts_data = {
@@ -1788,6 +1800,10 @@ static const struct lvts_data mt8186_lvts_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 19000,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct lvts_data mt8188_lvts_mcu_data = {
@@ -1802,6 +1818,10 @@ static const struct lvts_data mt8188_lvts_mcu_data = {
 	.gt_calib_bit_offset = 20,
 	.def_calibration = 35000,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct lvts_data mt8188_lvts_ap_data = {
@@ -1816,6 +1836,10 @@ static const struct lvts_data mt8188_lvts_ap_data = {
 	.gt_calib_bit_offset = 20,
 	.def_calibration = 35000,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct lvts_data mt8192_lvts_mcu_data = {
@@ -1830,6 +1854,10 @@ static const struct lvts_data mt8192_lvts_mcu_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct lvts_data mt8192_lvts_ap_data = {
@@ -1844,6 +1872,10 @@ static const struct lvts_data mt8192_lvts_ap_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct lvts_data mt8195_lvts_mcu_data = {
@@ -1858,6 +1890,10 @@ static const struct lvts_data mt8195_lvts_mcu_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct lvts_data mt8195_lvts_ap_data = {
@@ -1872,6 +1908,10 @@ static const struct lvts_data mt8195_lvts_ap_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct of_device_id lvts_of_match[] = {
-- 
2.39.5


