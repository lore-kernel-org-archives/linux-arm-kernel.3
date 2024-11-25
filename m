Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD79D59D71
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 21:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnPvCksldGT51KQmgfYqFKH1hdbHAc5stkbk28rR8i0=; b=fIdHp+QJBeI2F5zf4VpoqcwoDD
	BMJimO0N3kro1GnOVhQ8ykEuvaU85yXi5xpKJmWV0vg2usVdFT8Z8YYsNINbYRvzn239yKYb3XPDx
	WsRXcPLMP2QgAnevJAOeQV4Lv9XeRN2mtMyfMDh2eiGq/CyCiXaI+rLwrWIfDZ8nBm/lMcQneudTg
	MkaRXemp0sZgF2Iv9IfMs6UVIBlmlloTj6zedNJN1MM4i4s3WCN3fFPOBqtATfuANlfJbVGrPQoGd
	l4qmLfqA3qibgsQLy86AY9qhc6JiWGsYd7YZ1bmVcsFzz6LjYnmZnAoLJjUMOQWO34uI8PLW7Wmm/
	qZuhPr4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFgZn-000000097vf-2tz6;
	Mon, 25 Nov 2024 21:24:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFgW1-000000097I8-3W1O;
	Mon, 25 Nov 2024 21:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732569664;
	bh=EbU1FkO6EYijb343nJFoDhZqvEu0zf0KCIAbfgn42Xw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cYSZKifUQQN5mrNK0fzJFFSEj8eJI9g73B6yRi8Si6HZNxMeDsXOiJfaBTv6FUtt2
	 nEc5BtB9M8ME9OKync3MIhlpW6m/lyJ54JR9E8IwDfgIrhSEXdY8kQ1MhaAc8mLOmK
	 nqXG4qPefmtjLdhj16jcWfsZnjInlHRwbGbbX3Q4DA3lFLIPo/k8WtmFXdNLGXhafi
	 2ae8c6IV4D9e5UavYpnDpPRJfNRgAhOuqIfcZTWY9XYFVuObVVVKXKZGoSvO/K9P9a
	 k9ohPU7wCPuOA5KB3AimtoBCgAW6FRH1E+chQ6G+gpWjZzyIgk+6l1YcFo88YrDwJp
	 Lx4bLaRtZ5oKw==
Received: from [192.168.1.63] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C1A517E37D0;
	Mon, 25 Nov 2024 22:21:02 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 25 Nov 2024 16:20:30 -0500
Subject: [PATCH 3/5] thermal/drivers/mediatek/lvts: Disable low offset IRQ
 for minimum threshold
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241125-mt8192-lvts-filtered-suspend-fix-v1-3-42e3c0528c6c@collabora.com>
References: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
In-Reply-To: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_132106_048097_F1ABF97B 
X-CRM114-Status: GOOD (  15.66  )
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

In order to get working interrupts, a low offset value needs to be
configured. The minimum value for it is 20 Celsius, which is what is
configured when there's no lower thermal trip (ie the thermal core
passes -INT_MAX as low trip temperature). However, when the temperature
gets that low and fluctuates around that value it causes an interrupt
storm.

Prevent that interrupt storm by not enabling the low offset interrupt if
the low threshold is the minimum one.

Cc: stable@vger.kernel.org
Fixes: 77354eaef821 ("thermal/drivers/mediatek/lvts_thermal: Don't leave threshold zeroed")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 48 ++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 6ac33030f015c7239e36d81018d1a6893cb69ef8..2271023f090df82fbdd0b5755bb34879e58b0533 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -67,10 +67,14 @@
 #define LVTS_CALSCALE_CONF			0x300
 #define LVTS_MONINT_CONF			0x0300318C
 
-#define LVTS_MONINT_OFFSET_SENSOR0		0xC
-#define LVTS_MONINT_OFFSET_SENSOR1		0x180
-#define LVTS_MONINT_OFFSET_SENSOR2		0x3000
-#define LVTS_MONINT_OFFSET_SENSOR3		0x3000000
+#define LVTS_MONINT_OFFSET_HIGH_SENSOR0		BIT(3)
+#define LVTS_MONINT_OFFSET_HIGH_SENSOR1		BIT(8)
+#define LVTS_MONINT_OFFSET_HIGH_SENSOR2		BIT(13)
+#define LVTS_MONINT_OFFSET_HIGH_SENSOR3		BIT(25)
+#define LVTS_MONINT_OFFSET_LOW_SENSOR0		BIT(2)
+#define LVTS_MONINT_OFFSET_LOW_SENSOR1		BIT(7)
+#define LVTS_MONINT_OFFSET_LOW_SENSOR2		BIT(12)
+#define LVTS_MONINT_OFFSET_LOW_SENSOR3		BIT(24)
 
 #define LVTS_INT_SENSOR0			0x0009001F
 #define LVTS_INT_SENSOR1			0x001203E0
@@ -326,11 +330,17 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 
 static void lvts_update_irq_mask(struct lvts_ctrl *lvts_ctrl)
 {
-	u32 masks[] = {
-		LVTS_MONINT_OFFSET_SENSOR0,
-		LVTS_MONINT_OFFSET_SENSOR1,
-		LVTS_MONINT_OFFSET_SENSOR2,
-		LVTS_MONINT_OFFSET_SENSOR3,
+	u32 high_offset_masks[] = {
+		LVTS_MONINT_OFFSET_HIGH_SENSOR0,
+		LVTS_MONINT_OFFSET_HIGH_SENSOR1,
+		LVTS_MONINT_OFFSET_HIGH_SENSOR2,
+		LVTS_MONINT_OFFSET_HIGH_SENSOR3,
+	};
+	u32 low_offset_masks[] = {
+		LVTS_MONINT_OFFSET_LOW_SENSOR0,
+		LVTS_MONINT_OFFSET_LOW_SENSOR1,
+		LVTS_MONINT_OFFSET_LOW_SENSOR2,
+		LVTS_MONINT_OFFSET_LOW_SENSOR3,
 	};
 	u32 value = 0;
 	int i;
@@ -339,10 +349,22 @@ static void lvts_update_irq_mask(struct lvts_ctrl *lvts_ctrl)
 
 	for (i = 0; i < ARRAY_SIZE(masks); i++) {
 		if (lvts_ctrl->sensors[i].high_thresh == lvts_ctrl->high_thresh
-		    && lvts_ctrl->sensors[i].low_thresh == lvts_ctrl->low_thresh)
-			value |= masks[i];
-		else
-			value &= ~masks[i];
+		    && lvts_ctrl->sensors[i].low_thresh == lvts_ctrl->low_thresh) {
+			/*
+			 * The minimum threshold needs to be configured in the
+			 * OFFSETL register to get working interrupts, but we
+			 * don't actually want to generate interrupts when
+			 * crossing it.
+			 */
+			if (lvts_ctrl->low_thresh == -INT_MAX) {
+				value &= ~low_offset_masks[i];
+				value |= high_offset_masks[i];
+			} else {
+				value |= low_offset_masks[i] | high_offset_masks[i];
+			}
+		} else {
+			value &= ~(low_offset_masks[i] | high_offset_masks[i]);
+		}
 	}
 
 	writel(value, LVTS_MONINT(lvts_ctrl->base));

-- 
2.47.0


