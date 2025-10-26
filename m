Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FECCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 12:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xhSctYjH9Rr38j6lYic7dZqTUlNx7v9z2EjOasSd8c=; b=lTKEhs2AfDiZIWdl3ioOsjmrJS
	f47L6zlXyjo0DBvJImTWVZ1Qg7yfTcx2qrR9qoQQ1aFO9CF4tr7ugHcL9QuoH7F/Dgkou2AKMHeDZ
	UOkiNmgUjo+ZMgwpMrSahNJp1/3jXg81SBl76Da1ip8wZRSG8CbisZx+1tFrDKpHe4p8OTRZ9q1O+
	JzorE1ylszo3ge86vuv4uPPNkggWh8B/82vqvcPucW4cuONYnH1f0h9j2E19ZS4DVXbTbW5LJi5GS
	El2rZu05OzeI5ikUu2pcGnVK+ySgnObIddRrQV9phMd4gs4Drbdi+UbKcYIgByavdQEnI9iVzWdyB
	TL2v9uJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCzlE-0000000CJAP-1aAC;
	Sun, 26 Oct 2025 12:22:12 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCzlC-0000000CJ8B-1A00;
	Sun, 26 Oct 2025 12:22:11 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id AE13F40027;
	Sun, 26 Oct 2025 12:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1761481325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2xhSctYjH9Rr38j6lYic7dZqTUlNx7v9z2EjOasSd8c=;
	b=slZAivgUGmXS6MXAwMunhdNmLh1re0Cepb/YihkUrtunpWcf2mfGvV+82+C2zd+Ww2gCTB
	IPe+N1tyT8sEskbkt4ADY/8PktYZNDOPKJe/XmNOUkHMyY9Eda9b0tFDME457o084HlT8C
	YVMNgfrcE3XNgvR2sgyWCG9qhGuOfbc=
Received: from frank-u24.. (fttx-pool-217.61.154.70.bambit.de [217.61.154.70])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 70EA71226F7;
	Sun, 26 Oct 2025 12:22:05 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Mason Chang <mason-cw.chang@mediatek.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 4/5] thermal/drivers/mediatek/lvts_thermal: Add SoC based golden Temp
Date: Sun, 26 Oct 2025 13:21:33 +0100
Message-ID: <20251026122143.71100-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251026122143.71100-1-linux@fw-web.de>
References: <20251026122143.71100-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_052210_487796_0CBA15E5 
X-CRM114-Status: GOOD (  12.86  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add SoC based golden temp for invalid efuse data.

This is a preliminary patch for mt7987 support where goldentemp is
slightly higher than other SOCs.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/thermal/mediatek/lvts_thermal.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 9413b30f7b69..544941e8219a 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -134,6 +134,7 @@ struct lvts_data {
 	int num_init_cmd;
 	int temp_factor;
 	int temp_offset;
+	int golden_temp;
 	int gt_calib_bit_offset;
 	unsigned int def_calibration;
 	bool irq_enable;
@@ -811,8 +812,10 @@ static int lvts_golden_temp_init(struct device *dev, u8 *calib,
 	gt = (((u32 *)calib)[0] >> lvts_data->gt_calib_bit_offset) & 0xff;
 
 	/* A zero value for gt means that device has invalid efuse data */
-	if (gt && gt < LVTS_GOLDEN_TEMP_MAX)
+	if (gt && gt <= LVTS_GOLDEN_TEMP_MAX)
 		golden_temp = gt;
+	else
+		golden_temp = lvts_data->golden_temp;
 
 	golden_temp_offset = golden_temp * 500 + lvts_data->temp_offset;
 
@@ -1786,6 +1789,7 @@ static const struct lvts_data mt7988_lvts_ap_data = {
 	.num_init_cmd	= ARRAY_SIZE(mt7988_init_cmds),
 	.temp_factor	= LVTS_COEFF_A_MT7988,
 	.temp_offset	= LVTS_COEFF_B_MT7988,
+	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
 	.gt_calib_bit_offset = 24,
 	.irq_enable = true, //SDK false
 };
@@ -1799,6 +1803,7 @@ static const struct lvts_data mt8186_lvts_data = {
 	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
 	.temp_factor	= LVTS_COEFF_A_MT7988,
 	.temp_offset	= LVTS_COEFF_B_MT7988,
+	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 19000,
 	.irq_enable = true,
@@ -1813,6 +1818,7 @@ static const struct lvts_data mt8188_lvts_mcu_data = {
 	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
 	.temp_factor	= LVTS_COEFF_A_MT8195,
 	.temp_offset	= LVTS_COEFF_B_MT8195,
+	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
 	.gt_calib_bit_offset = 20,
 	.def_calibration = 35000,
 	.irq_enable = true,
@@ -1827,6 +1833,7 @@ static const struct lvts_data mt8188_lvts_ap_data = {
 	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
 	.temp_factor	= LVTS_COEFF_A_MT8195,
 	.temp_offset	= LVTS_COEFF_B_MT8195,
+	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
 	.gt_calib_bit_offset = 20,
 	.def_calibration = 35000,
 	.irq_enable = true,
@@ -1841,6 +1848,7 @@ static const struct lvts_data mt8192_lvts_mcu_data = {
 	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
 	.temp_factor	= LVTS_COEFF_A_MT8195,
 	.temp_offset	= LVTS_COEFF_B_MT8195,
+	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.irq_enable = true,
@@ -1855,6 +1863,7 @@ static const struct lvts_data mt8192_lvts_ap_data = {
 	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
 	.temp_factor	= LVTS_COEFF_A_MT8195,
 	.temp_offset	= LVTS_COEFF_B_MT8195,
+	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.irq_enable = true,
@@ -1869,6 +1878,7 @@ static const struct lvts_data mt8195_lvts_mcu_data = {
 	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
 	.temp_factor	= LVTS_COEFF_A_MT8195,
 	.temp_offset	= LVTS_COEFF_B_MT8195,
+	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.irq_enable = true,
@@ -1883,6 +1893,7 @@ static const struct lvts_data mt8195_lvts_ap_data = {
 	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
 	.temp_factor	= LVTS_COEFF_A_MT8195,
 	.temp_offset	= LVTS_COEFF_B_MT8195,
+	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 };
-- 
2.43.0


