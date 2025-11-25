Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD32AD0EE0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7cPqx+IbMrFmHEVALATY8a8/rzZs6lucEZxDbVAfJw=; b=3kFXTFv8DpKVJjxy8j1xtbUUMF
	xJdczbwB2TFnHBXmazCRCHrJokaos54PENz/7NRYuHkglOzA++zkYxqkB7zAGALxUOjUd8vwzL+oS
	YjJdFee6g8/RYMBoF2BO6ffjog2Qu/fOt3++YqF6bQUL2bceWoQ1/aeeRegOsE1YvYqUEn+zBgfTm
	cMqcL3+7tobXYUBAZsAcLNRzDLK97XPP3u4IhjAkFtTRTBs+JznesFUhV1TojWWzF9cG69JWeOAPE
	LPIbwZomOw1XWx7PP51nlnJZIX6VnAm/bPnwS4zTtqoz/L7ZftsN0g4Gr6rGpP3LcSw87GEN4rLGW
	i7IdZ5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvjh-0000000DZLM-1lqZ;
	Tue, 25 Nov 2025 16:17:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvjb-0000000DZFw-31jX;
	Tue, 25 Nov 2025 16:17:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764087461;
	bh=IvZa7zhRWNpwBoPxllf4o/k5Yv6j1xQOIvfGVEJKZ38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YOFoYx/Mctk2VU5VWUBaO8NIU59pep4RCmUa0IYnAgTaHlkMtibDLH0GLoHg7ss2g
	 yIfIVAYt2Im72RSYMn+YkApHYTvs8s+Jp71zgHhWNhiyp8cPCaiIwY7WVSfPsvIO1N
	 +OWJQar7ymo6ZbEpku7+ntiEBOcgkj7vPYR26rL4WmYtA0PRaGrB0NML4y7ySPW0sx
	 KlPza7/UdgOfn1j0AiS29JBzeSLadb3dQNaSNzia6GCf6sYIs0lsC4PBkDqVzUSEFL
	 NER7H3I/si6Dnk1zWw4QJZWjrsPmi/TdoMlNur7HME9etZb7cM4JXGUUZ0PiF2wgp+
	 50OCyqTnVEOFg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:feae:4183:be92:e051])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5CEEB17E13E0;
	Tue, 25 Nov 2025 17:17:40 +0100 (CET)
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
Subject: [PATCH v5 3/8] thermal/drivers/mediatek/lvts: Add platform ops to support alternative conversion logic
Date: Tue, 25 Nov 2025 17:16:53 +0100
Message-Id: <20251125-mt8196-lvts-v4-v5-3-6db7eb903fb7@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251125-mt8196-lvts-v4-v5-0-6db7eb903fb7@collabora.com>
References: <20251125-mt8196-lvts-v4-v5-0-6db7eb903fb7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_081743_917774_C19C6F3B 
X-CRM114-Status: GOOD (  13.58  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 39 ++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index babffdea9a4d..a684f73d3698 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -126,8 +126,14 @@ struct lvts_ctrl_data {
 			continue; \
 		else
 
+struct lvts_platform_ops {
+	int (*lvts_raw_to_temp)(u32 raw_temp, int temp_factor);
+	u32 (*lvts_temp_to_raw)(int temperature, int temp_factor);
+};
+
 struct lvts_data {
 	const struct lvts_ctrl_data *lvts_ctrl;
+	const struct lvts_platform_ops *ops;
 	const u32 *conn_cmd;
 	const u32 *init_cmd;
 	int num_cal_offsets;
@@ -273,7 +279,17 @@ static inline int lvts_debugfs_init(struct device *dev,
 
 #endif
 
-static int lvts_raw_to_temp(u32 raw_temp, int temp_factor)
+static int lvts_raw_to_temp(u32 raw_temp, const struct lvts_data *lvts_data)
+{
+	return lvts_data->ops->lvts_raw_to_temp(raw_temp & 0xFFFF, lvts_data->temp_factor);
+}
+
+static u32 lvts_temp_to_raw(int temperature, const struct lvts_data *lvts_data)
+{
+	return lvts_data->ops->lvts_temp_to_raw(temperature, lvts_data->temp_factor);
+}
+
+static int lvts_raw_to_temp_mt7988(u32 raw_temp, int temp_factor)
 {
 	int temperature;
 
@@ -283,7 +299,7 @@ static int lvts_raw_to_temp(u32 raw_temp, int temp_factor)
 	return temperature;
 }
 
-static u32 lvts_temp_to_raw(int temperature, int temp_factor)
+static u32 lvts_temp_to_raw_mt7988(int temperature, int temp_factor)
 {
 	u32 raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
 
@@ -330,7 +346,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 	if (rc)
 		return -EAGAIN;
 
-	*temp = lvts_raw_to_temp(value & 0xFFFF, lvts_data->temp_factor);
+	*temp = lvts_raw_to_temp(value, lvts_data);
 
 	return 0;
 }
@@ -400,8 +416,8 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	const struct lvts_data *lvts_data = lvts_ctrl->lvts_data;
 	void __iomem *base = lvts_sensor->base;
 	u32 raw_low = lvts_temp_to_raw(low != -INT_MAX ? low : LVTS_MINIMUM_THRESHOLD,
-				       lvts_data->temp_factor);
-	u32 raw_high = lvts_temp_to_raw(high, lvts_data->temp_factor);
+				       lvts_data);
+	u32 raw_high = lvts_temp_to_raw(high, lvts_data);
 	bool should_update_thresh;
 
 	lvts_sensor->low_thresh = low;
@@ -1778,6 +1794,11 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_data_ctrl[] = {
 	}
 };
 
+static const struct lvts_platform_ops lvts_platform_ops_mt7988 = {
+	.lvts_raw_to_temp = lvts_raw_to_temp_mt7988,
+	.lvts_temp_to_raw = lvts_temp_to_raw_mt7988,
+};
+
 static const struct lvts_data mt7988_lvts_ap_data = {
 	.lvts_ctrl	= mt7988_lvts_ap_data_ctrl,
 	.conn_cmd	= mt7988_conn_cmds,
@@ -1789,6 +1810,7 @@ static const struct lvts_data mt7988_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT7988,
 	.gt_calib_bit_offset = 24,
 	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
+	.ops = &lvts_platform_ops_mt7988,
 };
 
 static const struct lvts_data mt8186_lvts_data = {
@@ -1803,6 +1825,7 @@ static const struct lvts_data mt8186_lvts_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 19000,
 	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
+	.ops = &lvts_platform_ops_mt7988,
 };
 
 static const struct lvts_data mt8188_lvts_mcu_data = {
@@ -1817,6 +1840,7 @@ static const struct lvts_data mt8188_lvts_mcu_data = {
 	.gt_calib_bit_offset = 20,
 	.def_calibration = 35000,
 	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
+	.ops = &lvts_platform_ops_mt7988,
 };
 
 static const struct lvts_data mt8188_lvts_ap_data = {
@@ -1831,6 +1855,7 @@ static const struct lvts_data mt8188_lvts_ap_data = {
 	.gt_calib_bit_offset = 20,
 	.def_calibration = 35000,
 	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
+	.ops = &lvts_platform_ops_mt7988,
 };
 
 static const struct lvts_data mt8192_lvts_mcu_data = {
@@ -1845,6 +1870,7 @@ static const struct lvts_data mt8192_lvts_mcu_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
+	.ops = &lvts_platform_ops_mt7988,
 };
 
 static const struct lvts_data mt8192_lvts_ap_data = {
@@ -1859,6 +1885,7 @@ static const struct lvts_data mt8192_lvts_ap_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
+	.ops = &lvts_platform_ops_mt7988,
 };
 
 static const struct lvts_data mt8195_lvts_mcu_data = {
@@ -1873,6 +1900,7 @@ static const struct lvts_data mt8195_lvts_mcu_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
+	.ops = &lvts_platform_ops_mt7988,
 };
 
 static const struct lvts_data mt8195_lvts_ap_data = {
@@ -1887,6 +1915,7 @@ static const struct lvts_data mt8195_lvts_ap_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
+	.ops = &lvts_platform_ops_mt7988,
 };
 
 static const struct of_device_id lvts_of_match[] = {

-- 
2.39.5

