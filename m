Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAB3C87FC8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jn9pUIcj80LVXintMV1Zszoxtn6TXshdAJHatYFCB4s=; b=b5i0ZuflM1yGLaBAkxh3ymv9HC
	JgKd7Z2if6oQxqar7ADA7sxF/d/DA+J/u0CCN33LbivgUg9T4LRoWErg7r/+l8BRJ9p7LOPBIz+0z
	632cyV7uLnOV1lFC12Wy6kz+f779NR22oB7XxP3/bPmEL8RMzRSOW8b3cH5yePscj7RR+Efc9bU81
	0zCsTWQBSo3Sg47EKIgWOgR7tSun/RIKHxlpArGiVsLE4nQ9SmD8kM3be1TBkijGItAg+YU42o+DC
	7+FNmnGgyucFCmC6XMgNlcBSdiszYc6wgNDqAi+8a5CuZCyQKJcabHhPpGm/A+1EJqSdAUGvl7loh
	Rc3W6MYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udm0E-0000000Gg5B-21cA;
	Mon, 21 Jul 2025 08:36:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlhD-0000000Gbzk-12Th;
	Mon, 21 Jul 2025 08:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753085785;
	bh=yeL7Qs9geqC8gCqdN9A4Y2ulSlVIdk/rrZad9e/fGZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bN4B95KqC2CPPWDuf5MBrZ1fLMAVgpV/e1zCBK7CK4iBD0dSD1ZyedwlttGGaPy0f
	 Kh+G9gRPMJW/ePOBFFJe+71zpuSrkWoyi2x7Uje9nq/0lPvTMYI/hx/2hm9VieQiqa
	 MZyzuYv3h8JeVrI6wkHrosZIGkVzt4LSMq/vu2Y36B1bn5uN5JbEByfM9BI4Vz1PSJ
	 6urM4VOi1CPRy/PXQn1WE2KoGWuwQ1ujbUQ9AkWQ0XF5pfNN8RCmz6CWazO+CCyWaE
	 oW6EsQGU+12NwUTHcC2MqwUD/eHMptK3zWLUUV6pycXkEi0mpDO8P38X46OqFB8o4N
	 NUmmnWRl29L3w==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4487:69c6:40a:81be])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9648817E154C;
	Mon, 21 Jul 2025 10:16:24 +0200 (CEST)
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
Subject: [PATCH 7/9] thermal/drivers/mediatek/lvts: Support MSR offset for 16-bit calibration data
Date: Mon, 21 Jul 2025 10:14:57 +0200
Message-Id: <20250721081459.16278-8-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250721081459.16278-1-laura.nao@collabora.com>
References: <20250721081459.16278-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_011627_431897_153F443A 
X-CRM114-Status: GOOD (  14.36  )
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

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 8f9da0d5b886..81c8309ff9df 100644
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
@@ -144,6 +145,7 @@ struct lvts_data {
 	int temp_offset;
 	int gt_calib_bit_offset;
 	unsigned int def_calibration;
+	u16 msr_offset;
 };
 
 struct lvts_sensor {
@@ -212,6 +214,7 @@ static const struct debugfs_reg32 lvts_regs[] = {
 	LVTS_DEBUG_FS_REGS(LVTS_EDATA01),
 	LVTS_DEBUG_FS_REGS(LVTS_EDATA02),
 	LVTS_DEBUG_FS_REGS(LVTS_EDATA03),
+	LVTS_DEBUG_FS_REGS(LVTS_MSROFT),
 	LVTS_DEBUG_FS_REGS(LVTS_ATP0),
 	LVTS_DEBUG_FS_REGS(LVTS_ATP1),
 	LVTS_DEBUG_FS_REGS(LVTS_ATP2),
@@ -782,6 +785,8 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
 
 		if (gt) {
 			lvts_ctrl->calibration[i] = calib;
+			if (lvts_ctrl->lvts_data->msr_offset)
+				lvts_ctrl->calibration[i] += lvts_ctrl->lvts_data->msr_offset;
 		} else if (lvts_ctrl->lvts_data->def_calibration) {
 			lvts_ctrl->calibration[i] = lvts_ctrl->lvts_data->def_calibration;
 		} else {
@@ -1096,6 +1101,17 @@ static int lvts_ctrl_calibrate(struct device *dev, struct lvts_ctrl *lvts_ctrl)
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


