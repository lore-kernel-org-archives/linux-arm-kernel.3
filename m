Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E51C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0KUgrZrwNsznMUGnZBbqU+2N7o3A/Kb+YL9jJ1QWWo=; b=X8PJI5Y7AMlpumiL5Sk7p2T1PY
	tUnQNxdsDjBgIhYy6QLzSci6aWROqjORm1VciZl0HhbGKMWtIpbwnGmC8vGFwkBHtqClfPCu0tKgt
	P4wELuxDiIimCQoHCSZMckHZUkvshwwX2tDyZrRMImWL/KxbMo6I/M9YWjCGRb5rnG9X3G2rc4Hyp
	8p0E7x/ozJsBpGvlMMxT8lhHMoPbDTfDLBRWIomPZV3mTi15R+EH8fOPWBRcKdi0NEdP/wQBcgZ3G
	ICwXq80AYPLOjxg92VC1aphA7NXTrCTyJBHF4aZ5thlFHGnaks6YmfuHni/v7t5Y8qunDaRpokKJQ
	5x/eDd8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm5x-00000001y0B-0Mjp;
	Thu, 09 Jul 2026 10:35:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm5j-00000001xcm-0Ach;
	Thu, 09 Jul 2026 10:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783593288;
	bh=vIeXSGmYnuqXbWuVwNEh8u50bCXMZ/MRUIXV/uBPzrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mkDqeFKnl8UPm7GoZibunaQIGBBH8LniswwaihdQbKR5qR/PRnB6l3C6Qzqmz5dZI
	 84YZgpyk9OPWJT/dqIDITyH1xzfivFt8Svouo6eJ5iqLBQxfVUSJ1XOV0mjK724Ncr
	 k1CsDTGL1/S8O+A2d+IvzqOj/Scc3Gws3IsKbegKgw3xWDdM0ZHWHV4x/0+HqNnW2j
	 JnmQJPIbh5XgN65R8C/GGJHyN2xGD4DqB9KXiTk2ugfeWwx3P+qdJnu1LrFE7sEhWH
	 7R79OwBUlrOYe2+eOhtUun6pPfx9fShUwITnHopF1HQGJcyQNIIBCJzAWuajflBlgo
	 MjbBeYvEkr9nQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 74B4317E0EE1;
	Thu, 09 Jul 2026 12:34:47 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v3 11/11] drm/mediatek: mtk_dp: Clarify XTAL freq and Debounce registers
Date: Thu,  9 Jul 2026 12:34:31 +0200
Message-ID: <20260709103431.46616-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
References: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_033451_326010_37349EC6 
X-CRM114-Status: GOOD (  10.38  )
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

Clarify the meaning of the sub-fields in the crystal frequency and
transmitter interrupt debounce registers, with the only purpose of
increasing human readability.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 35 ++++++++++++++++-----------
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  6 +++--
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 7151421984ca..3790675d9dc4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1216,9 +1216,15 @@ static void mtk_dp_initialize_settings_v2p1(struct mtk_dp *mtk_dp)
 
 static void mtk_dp_initialize_settings(struct mtk_dp *mtk_dp)
 {
+	/*
+	 * Set DP XTAL freq to 26MHz and accumulator to 1.
+	 * Valid values for XTAL freq are 12 and 26.
+	 */
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_342C,
-			   XTAL_FREQ_DP_TRANS_P0_DEFAULT,
-			   XTAL_FREQ_DP_TRANS_P0_MASK);
+			   FIELD_PREP_CONST(XTAL_FREQ_DP_ACCUM_NUM_MASK, 1) |
+			   FIELD_PREP_CONST(XTAL_FREQ_DP_CLOCK_MHZ_MASK, 26),
+			   XTAL_FREQ_DP_ACCUM_NUM_MASK | XTAL_FREQ_DP_CLOCK_MHZ_MASK);
+
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3540,
 			   FEC_CLOCK_EN_MODE_DP_TRANS_P0,
 			   FEC_CLOCK_EN_MODE_DP_TRANS_P0);
@@ -1260,28 +1266,29 @@ static void mtk_dp_initialize_aux_hpd_detect_settings(struct mtk_dp *mtk_dp)
 
 static void mtk_dp_initialize_hpd_detect_settings(struct mtk_dp *mtk_dp)
 {
-	u32 val;
-
 	/* Mask AUX TOP interrupt, as this uses transmitter for HPD */
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_IRQ_MASK,
 			   AUX_TOP_IRQ_MSK, AUX_TOP_IRQ_MSK);
 
-	/* Debounce threshold */
+	/* Set Hotplug debounce threshold time: xtal_period * deb_thd */
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
 			   8, HPD_DEB_THD_DP_TRANS_P0_MASK);
 
-	val = (HPD_INT_THD_DP_TRANS_P0_LOWER_500US |
-	       HPD_INT_THD_DP_TRANS_P0_UPPER_1100US) << 4;
-	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
-			   val, HPD_INT_THD_DP_TRANS_P0_MASK);
-
 	/*
-	 * Connect threshold 1.5ms + 5 x 0.1ms = 2ms
-	 * Disconnect threshold 1.5ms + 5 x 0.1ms = 2ms
+	 * Set interrupt debounce threshold time
+	 * VAL  |  0     1     2     3  INT_THD
+	 * Low  | 100   300   500   700 uS
+	 * High | 700   900  1100  1300 uS
 	 */
-	val = (5 << 8) | (5 << 12);
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
-			   val,
+			   FIELD_PREP_CONST(HPD_INT_LOW_THD_DP_TRANS_P0_MASK, 2) |
+			   FIELD_PREP_CONST(HPD_INT_HIGH_THD_DP_TRANS_P0_MASK, 2),
+			   HPD_INT_THD_DP_TRANS_P0_MASK);
+
+	/* Connection and Disconnection thresholds: 1.5ms + (5 x 0.1) ms = 2ms */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
+			   FIELD_PREP_CONST(HPD_DISC_THD_DP_TRANS_P0_MASK, 5) |
+			   FIELD_PREP_CONST(HPD_CONN_THD_DP_TRANS_P0_MASK, 5),
 			   HPD_DISC_THD_DP_TRANS_P0_MASK |
 			   HPD_CONN_THD_DP_TRANS_P0_MASK);
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3430,
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 9caf743f4fe6..ce47b99dddc4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -253,6 +253,8 @@
 #define MTK_DP_TRANS_P0_3410				0x1410
 #define HPD_DEB_THD_DP_TRANS_P0_MASK				GENMASK(3, 0)
 #define HPD_INT_THD_DP_TRANS_P0_MASK				GENMASK(7, 4)
+#define HPD_INT_HIGH_THD_DP_TRANS_P0_MASK			GENMASK(7, 6)
+#define HPD_INT_LOW_THD_DP_TRANS_P0_MASK			GENMASK(5, 4)
 #define HPD_INT_THD_DP_TRANS_P0_LOWER_500US			(2 << 4)
 #define HPD_INT_THD_DP_TRANS_P0_UPPER_1100US			(2 << 6)
 #define HPD_DISC_THD_DP_TRANS_P0_MASK				GENMASK(11, 8)
@@ -267,8 +269,8 @@
 #define IRQ_MASK_DP_TRANS_P0_INT_IRQ				(BIT(3) << 4)
 #define IRQ_STATUS_DP_TRANS_P0_MASK				GENMASK(15, 12)
 #define MTK_DP_TRANS_P0_342C				0x142c
-#define XTAL_FREQ_DP_TRANS_P0_DEFAULT				(BIT(0) | BIT(3) | BIT(5) | BIT(6))
-#define XTAL_FREQ_DP_TRANS_P0_MASK				GENMASK(7, 0)
+#define XTAL_FREQ_DP_ACCUM_NUM_MASK				GENMASK(1, 0)
+#define XTAL_FREQ_DP_CLOCK_MHZ_MASK				GENMASK(7, 2)
 #define MTK_DP_TRANS_P0_3430				0x1430
 #define HPD_INT_THD_ECO_DP_TRANS_P0_MASK			GENMASK(1, 0)
 #define HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT		BIT(1)
-- 
2.54.0


