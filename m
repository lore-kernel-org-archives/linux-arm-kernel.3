Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAE4C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 03:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLYMustPoXkMtRAN3kGJyKv3pEdMrefd8L2c/gGFsQ8=; b=Kd23025bjsL8FKrXk91KEXcbom
	j4kZ8Cqf1LRVVugcvK1TWdq0gbcez2BTAVm7M2VU90Y01IObNLe2wfx/RaRjFWjWcUehp1mK0LFAQ
	AozRPxN8tvsLVHfyiKirBeiIhQkXbTZ4FZ4OYZ/3l64Y3CSQunIQQHrbIsN6z6AhDMF1pePszD0dY
	g1hzGM1attZuqwxN76OLZgztdKtetrttYpqtBH3NOe/AjG+uigCO6W0Lu3iNJfMoeOk3k9sDWVpR/
	Wmed6gAMxAMq7UqcnmvxlAt+xBx7Mske+VULb5DiGHICpZQK4hIpon8TF5CapanoSPUURiqGyqv8a
	QtVnqeGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHRU-00000009QFk-29t0;
	Thu, 30 Jul 2026 03:28:20 +0000
Received: from mail-m103131191110.xmail.ntesmail.com ([103.131.191.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHRF-00000009Q9S-2zTd;
	Thu, 30 Jul 2026 03:28:11 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 481c5dbd2;
	Thu, 30 Jul 2026 11:28:00 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 4/7] drm/bridge: analogix_dp: Extend clear_hotplug_interrupts to accept IRQ bitmask
Date: Thu, 30 Jul 2026 11:27:41 +0800
Message-Id: <20260730032744.381566-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730032744.381566-1-damon.ding@rock-chips.com>
References: <20260730032744.381566-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fb11090b603a8kunm040f79123746e6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTx4dVkMdHUpJSh5OTExLTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=jB6P56QTBwB3M2Fe2A7+m3cYOdzAyyO+/ALWzKSzFef9lePJElGn439UWo0KxdA3Y1Fi6ypW12Ffkpj/XlWOxkpT7GapCK3GX9YrwJXG4ALjPigMK/FNr1hnuoKH1Cle6Z7Me9suJiyYIekyee5wik7BhxW/0CeJpHMqXqGizq4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=aLYMustPoXkMtRAN3kGJyKv3pEdMrefd8L2c/gGFsQ8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_202806_333025_BED73DE1 
X-CRM114-Status: GOOD (  11.93  )
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

Update analogix_dp_clear_hotplug_interrupts() to take an irq_type
bitmask argument. Instead of clearing all hotplug interrupt bits
unconditionally, only clear the interrupt flags corresponding to the
triggered events.

Pass the detected IRQ bitmask from the irq thread handler, and use the
full HPD_IRQ mask during HPD initialization.

This implements fine-grained pending interrupt clearing logic and
removes limitations brought by unconditional register writes,
supporting improved accuracy for HPD event handling.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    |  2 +-
 .../drm/bridge/analogix/analogix_dp_core.h    |  2 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 25 +++++++++++++------
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 1671f388ef30..5af4150f0e7e 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -729,7 +729,7 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 	}
 
 	if (irq_type) {
-		analogix_dp_clear_hotplug_interrupts(dp);
+		analogix_dp_clear_hotplug_interrupts(dp, irq_type);
 		analogix_dp_unmute_hpd_interrupt(dp, irq_type);
 	}
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index bc13ae45be69..2066e575ce10 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -194,7 +194,7 @@ int analogix_dp_init_analog_func(struct analogix_dp_device *dp);
 void analogix_dp_init_hpd(struct analogix_dp_device *dp);
 void analogix_dp_force_hpd(struct analogix_dp_device *dp);
 u32 analogix_dp_get_irq_type(struct analogix_dp_device *dp);
-void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp);
+void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp, u32 irq_type);
 void analogix_dp_reset_aux(struct analogix_dp_device *dp);
 void analogix_dp_init_aux(struct analogix_dp_device *dp);
 int analogix_dp_get_plug_in_status(struct analogix_dp_device *dp);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 42c1da160ad0..816be79a8da6 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -24,6 +24,8 @@
 #define COMMON_INT_MASK_4	(HOTPLUG_CHG | HPD_LOST | PLUG)
 #define INT_STA_MASK		INT_HPD
 
+#define HPD_IRQ			(DP_IRQ_TYPE_HP_CABLE_IN | DP_IRQ_TYPE_HP_CABLE_OUT | \
+				 DP_IRQ_TYPE_HP_CHANGE | DP_IRQ_TYPE_IRQ_HPD)
 #define COMMON_INT_4_HPD_IRQ	(DP_IRQ_TYPE_HP_CABLE_IN | DP_IRQ_TYPE_HP_CABLE_OUT | \
 				 DP_IRQ_TYPE_HP_CHANGE)
 
@@ -408,18 +410,25 @@ int analogix_dp_init_analog_func(struct analogix_dp_device *dp)
 	return 0;
 }
 
-void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp)
+void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp, u32 irq_type)
 {
-	u32 reg;
+	u32 reg = 0;
 
-	if (dp->hpd_gpiod)
+	if (dp->hpd_gpiod || !irq_type)
 		return;
 
-	reg = HOTPLUG_CHG | HPD_LOST | PLUG;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_4);
+	if (irq_type & COMMON_INT_4_HPD_IRQ) {
+		if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN)
+			reg |= PLUG;
+		if (irq_type & DP_IRQ_TYPE_HP_CABLE_OUT)
+			reg |= HPD_LOST;
+		if (irq_type & DP_IRQ_TYPE_HP_CHANGE)
+			reg |= HOTPLUG_CHG;
+		writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_4);
+	}
 
-	reg = INT_HPD;
-	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA);
+	if (irq_type & DP_IRQ_TYPE_IRQ_HPD)
+		writel(INT_HPD, dp->reg_base + ANALOGIX_DP_INT_STA);
 }
 
 void analogix_dp_init_hpd(struct analogix_dp_device *dp)
@@ -429,7 +438,7 @@ void analogix_dp_init_hpd(struct analogix_dp_device *dp)
 	if (dp->hpd_gpiod)
 		return;
 
-	analogix_dp_clear_hotplug_interrupts(dp);
+	analogix_dp_clear_hotplug_interrupts(dp, HPD_IRQ);
 
 	reg = readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
 	reg &= ~(F_HPD | HPD_CTRL);
-- 
2.34.1


