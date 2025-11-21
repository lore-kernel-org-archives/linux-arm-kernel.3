Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D429CCFA77F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 11:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCsgvyN19sbjUIn5UZpKyaiwePUESWFNhhsOnqCIlpo=; b=IsMdZKVkZC9/GHBIPsWDQ0OVMp
	jmVVlGDaIpybnLuhbDQkgVfeBWnOrawFAEgmt9Esz7pdxGRBPWO2yg5KU1oMI4mB2zuqY6S5Ii5vI
	msxx3SCtsmyuvVSLECy+D+pde9JTQEAp4rGcBRsWNyDIsep7CXXoSsQyPYRpF/FSto08vv1TmjwRO
	7pUaWTrjzhhVwCDUbYDZx3UhkVHr/0jUcyefN/Ld9qgsvT8HwCSyNR1YcYlmFtnNfji8/4z8hPDrz
	yOzoAlhh9/GELt+b1IlciW+xr5Z7bZDqWCwoNmqRGhZsMZbv5OYQJs8t0+NcJYwbOFzbfy04Q/VLZ
	OVo82eoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8m-00000008IB5-1kc6;
	Fri, 21 Nov 2025 11:17:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8d-00000008I0r-03uC;
	Fri, 21 Nov 2025 11:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763723832;
	bh=CwepC8yqeaRnnicwyhA3IjDb1SuVWrSSGjrDhmIJNMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J7WyscAIaAh0iVhvFbZjMLc9LETtu++q9rw/nAamzP5vYsww8W/Y7HRT9NnTX7i1+
	 UjtY6eQGAt1Gzpwtxh4NOAQPjBcRZ5j2m5dfQr6LOjWgK0QQKi5EvoI1CL4XyQYwBx
	 JXiSmdPxlig0GHDUkbi9uxuZ4tnsxAPX2z8E+T+Tz/UFRiaMlzHllXaYucASzr4Rg0
	 rJOO/0aZ5pKmIq44Lb49rxkGjOkXieNIYldyAnlGo5FUKCkCwlDLQetZgsOJB4MDIa
	 71CBZKfbfByu2WTNcOBVIeg/AQwRvL5mo0W/Sj35FCU7vf3f9E/wMomAjZm77DLYJ5
	 rTyzngC3Z2qoA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:c4bf:9969:6e1c:dc69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7CAB417E35CB;
	Fri, 21 Nov 2025 12:17:11 +0100 (CET)
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
Subject: [PATCH v4 7/9] thermal/drivers/mediatek/lvts: Support MSR offset for 16-bit calibration data
Date: Fri, 21 Nov 2025 12:16:40 +0100
Message-Id: <20251121-mt8196-lvts-v4-v4-7-357f955a3176@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
References: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_031715_206627_904ADA6F 
X-CRM114-Status: GOOD (  14.31  )
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

On MT8196/MT6991, per-sensor calibration data read from eFuses is
16-bit. When the LVTS controller operates in 16-bit mode, a fixed offset
must be added to MSR values during post-processing to obtain correct
temperature readings. Introduce a new msr_offset field in lvts_data,
program the respective register and apply the offset to the calibration
data read from eFuses.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index d1bfbcb1a7d0..6558994cbee0 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -44,6 +44,7 @@
 #define LVTS_EDATA01(__base)	(__base + 0x0058)
 #define LVTS_EDATA02(__base)	(__base + 0x005C)
 #define LVTS_EDATA03(__base)	(__base + 0x0060)
+#define LVTS_MSROFT(__base)		(__base + 0x006C)
 #define LVTS_ATP0(__base)		(__base + 0x0070)
 #define LVTS_ATP1(__base)		(__base + 0x0074)
 #define LVTS_ATP2(__base)		(__base + 0x0078)
@@ -150,6 +151,7 @@ struct lvts_data {
 	int temp_offset;
 	int gt_calib_bit_offset;
 	unsigned int def_calibration;
+	u16 msr_offset;
 };
 
 struct lvts_sensor {
@@ -218,6 +220,7 @@ static const struct debugfs_reg32 lvts_regs[] = {
 	LVTS_DEBUG_FS_REGS(LVTS_EDATA01),
 	LVTS_DEBUG_FS_REGS(LVTS_EDATA02),
 	LVTS_DEBUG_FS_REGS(LVTS_EDATA03),
+	LVTS_DEBUG_FS_REGS(LVTS_MSROFT),
 	LVTS_DEBUG_FS_REGS(LVTS_ATP0),
 	LVTS_DEBUG_FS_REGS(LVTS_ATP1),
 	LVTS_DEBUG_FS_REGS(LVTS_ATP2),
@@ -790,6 +793,8 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
 
 		if (gt) {
 			lvts_ctrl->calibration[i] = calib;
+			if (lvts_ctrl->lvts_data->msr_offset)
+				lvts_ctrl->calibration[i] += lvts_ctrl->lvts_data->msr_offset;
 		} else if (lvts_ctrl->lvts_data->def_calibration) {
 			lvts_ctrl->calibration[i] = lvts_ctrl->lvts_data->def_calibration;
 		} else {
@@ -1097,6 +1102,17 @@ static int lvts_ctrl_calibrate(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 	for (i = 0; i < LVTS_SENSOR_MAX; i++)
 		writel(lvts_ctrl->calibration[i], lvts_edata[i]);
 
+	/* LVTS_MSROFT : Constant offset applied to MSR values
+	 * for post-processing
+	 *
+	 * Bits:
+	 *
+	 * 20-0 : Constant data added to MSR values
+	 */
+	if (lvts_ctrl->lvts_data->msr_offset)
+		writel(lvts_ctrl->lvts_data->msr_offset,
+		       LVTS_MSROFT(lvts_ctrl->base));
+
 	return 0;
 }
 

-- 
2.39.5

