Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0C0CFA77A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 11:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ie0xPqL7iQh5HGoOfa2dIKNRjFWCNQOKiobF364Wc0=; b=ioN0+EmssKFmtKMBN/tFhRIb57
	CJXFsoxwJ0RgbPK9QGliigSBkaXdId6Nw1ShIGAcOJl3xHce2ANbYNmJffkkh3e2ZDiSUT4d6QI0T
	oUTeIjI7CzV7GJWmYCWmdwDApnW6Nn6rMmtkOrsavwOI3Aj+qtCsTEOGTLriW/28KYUjER0exL9sa
	XTwkXGDlBoLqR6EATVLmV5Ggyrhu6g/BAccuzbRYhY/VM266yzb7Ai28UPIoGPWNZULxftPV4WsBA
	6EfufvqNhGgbA6gwdqY3jv4bCPKBaXMxjcdwmHYUICuiwZshAtRhW18kcJjlb7ZExqEdfdMwH5RQz
	nfUs9lCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8l-00000008I9b-2iwV;
	Fri, 21 Nov 2025 11:17:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8b-00000008Hzc-1gk8;
	Fri, 21 Nov 2025 11:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763723831;
	bh=6gnRYR1BR+zY+l/p2hSGd49HW7k2oOy5hd7RDm+yfqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zqu9vj6dMS699L5pN5z/VXwDMoHqH5havIrYTIwHNca6qv/oqQzNgQMzFkwHMd3BP
	 ZGTTm0O45cRCg4jxKIa+goadfEomqI7C+T0jsONCaNkg3QWsTbFavIzPoKAYZIKgzd
	 U+W8Y/0ekKrtIN753QZOfSdaiqlw1hUCjV22w+phtKePsSY3n94yg1v2C94aTogS75
	 edf99+6nyVRZnFf80UgNfaNE6HxS4Ill6l3t5C1FH05u3HnYJUfARwBdhXDxGjpAwz
	 bNCi43MiKwkrSOJxQpMdF7UCQUbHerCWB0a05EgjfNkTWVVTBokTpixmaJDKAQA6P+
	 /nZCI58/wbv6Q==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:c4bf:9969:6e1c:dc69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1EA9E17E15C9;
	Fri, 21 Nov 2025 12:17:10 +0100 (CET)
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
Subject: [PATCH v4 6/9] thermal/drivers/mediatek/lvts: Add support for ATP mode
Date: Fri, 21 Nov 2025 12:16:39 +0100
Message-Id: <20251121-mt8196-lvts-v4-v4-6-357f955a3176@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
References: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_031713_617781_5DCC761D 
X-CRM114-Status: GOOD (  14.13  )
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

MT8196/MT6991 uses ATP (Abnormal Temperature Prevention) mode to detect
abnormal temperature conditions, which involves reading temperature data
from a dedicated set of registers separate from the ones used for
immediate and filtered modes.

Add support for ATP mode and its relative registers to ensure accurate
temperature readings and proper thermal management on MT8196/MT6991
devices.

While at it, convert mode defines to enum.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 44 +++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 3e05b29f7b05..d1bfbcb1a7d0 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -44,6 +44,10 @@
 #define LVTS_EDATA01(__base)	(__base + 0x0058)
 #define LVTS_EDATA02(__base)	(__base + 0x005C)
 #define LVTS_EDATA03(__base)	(__base + 0x0060)
+#define LVTS_ATP0(__base)		(__base + 0x0070)
+#define LVTS_ATP1(__base)		(__base + 0x0074)
+#define LVTS_ATP2(__base)		(__base + 0x0078)
+#define LVTS_ATP3(__base)		(__base + 0x007C)
 #define LVTS_MSR0(__base)		(__base + 0x0090)
 #define LVTS_MSR1(__base)		(__base + 0x0094)
 #define LVTS_MSR2(__base)		(__base + 0x0098)
@@ -88,9 +92,6 @@
 #define LVTS_COEFF_A_MT7988			-204650
 #define LVTS_COEFF_B_MT7988			204650
 
-#define LVTS_MSR_IMMEDIATE_MODE		0
-#define LVTS_MSR_FILTERED_MODE		1
-
 #define LVTS_MSR_READ_TIMEOUT_US	400
 #define LVTS_MSR_READ_WAIT_US		(LVTS_MSR_READ_TIMEOUT_US / 2)
 
@@ -101,6 +102,12 @@
 static int golden_temp = LVTS_GOLDEN_TEMP_DEFAULT;
 static int golden_temp_offset;
 
+enum lvts_msr_mode {
+	LVTS_MSR_IMMEDIATE_MODE,
+	LVTS_MSR_FILTERED_MODE,
+	LVTS_MSR_ATP_MODE,
+};
+
 struct lvts_sensor_data {
 	int dt_id;
 	u8 cal_offsets[LVTS_MAX_CAL_OFFSETS];
@@ -110,7 +117,7 @@ struct lvts_ctrl_data {
 	struct lvts_sensor_data lvts_sensor[LVTS_SENSOR_MAX];
 	u8 valid_sensor_mask;
 	int offset;
-	int mode;
+	enum lvts_msr_mode mode;
 };
 
 #define VALID_SENSOR_MAP(s0, s1, s2, s3) \
@@ -211,6 +218,10 @@ static const struct debugfs_reg32 lvts_regs[] = {
 	LVTS_DEBUG_FS_REGS(LVTS_EDATA01),
 	LVTS_DEBUG_FS_REGS(LVTS_EDATA02),
 	LVTS_DEBUG_FS_REGS(LVTS_EDATA03),
+	LVTS_DEBUG_FS_REGS(LVTS_ATP0),
+	LVTS_DEBUG_FS_REGS(LVTS_ATP1),
+	LVTS_DEBUG_FS_REGS(LVTS_ATP2),
+	LVTS_DEBUG_FS_REGS(LVTS_ATP3),
 	LVTS_DEBUG_FS_REGS(LVTS_MSR0),
 	LVTS_DEBUG_FS_REGS(LVTS_MSR1),
 	LVTS_DEBUG_FS_REGS(LVTS_MSR2),
@@ -627,6 +638,13 @@ static int lvts_sensor_init(struct device *dev, struct lvts_ctrl *lvts_ctrl,
 		LVTS_IMMD3(lvts_ctrl->base)
 	};
 
+	void __iomem *atp_regs[] = {
+		LVTS_ATP0(lvts_ctrl->base),
+		LVTS_ATP1(lvts_ctrl->base),
+		LVTS_ATP2(lvts_ctrl->base),
+		LVTS_ATP3(lvts_ctrl->base)
+	};
+
 	int i;
 
 	lvts_for_each_valid_sensor(i, lvts_ctrl_data) {
@@ -662,8 +680,20 @@ static int lvts_sensor_init(struct device *dev, struct lvts_ctrl *lvts_ctrl,
 		/*
 		 * Each sensor has its own register address to read from.
 		 */
-		lvts_sensor[i].msr = lvts_ctrl_data->mode == LVTS_MSR_IMMEDIATE_MODE ?
-			imm_regs[i] : msr_regs[i];
+		switch (lvts_ctrl_data->mode) {
+		case LVTS_MSR_IMMEDIATE_MODE:
+			lvts_sensor[i].msr = imm_regs[i];
+			break;
+		case LVTS_MSR_FILTERED_MODE:
+			lvts_sensor[i].msr = msr_regs[i];
+			break;
+		case LVTS_MSR_ATP_MODE:
+			lvts_sensor[i].msr = atp_regs[i];
+			break;
+		default:
+			lvts_sensor[i].msr = imm_regs[i];
+			break;
+		}
 
 		lvts_sensor[i].low_thresh = INT_MIN;
 		lvts_sensor[i].high_thresh = INT_MIN;
@@ -913,7 +943,7 @@ static void lvts_ctrl_monitor_enable(struct device *dev, struct lvts_ctrl *lvts_
 	u32 sensor_map = 0;
 	int i;
 
-	if (lvts_ctrl->mode != LVTS_MSR_FILTERED_MODE)
+	if (lvts_ctrl->mode == LVTS_MSR_IMMEDIATE_MODE)
 		return;
 
 	if (enable) {

-- 
2.39.5

