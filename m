Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E58CCF2E8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIQIJbyD3LB7TMeMid3TmrAlJVhYDZLTlh+xfGdP3D0=; b=bTtunaoUoPUEz+4DeLrdz7vaXX
	v+fG5pwhlz3P3ufN0bXd2nOuOlZ3+Nw1q4l1jTACrR6Hhd8LPxSnSX6IliJaCSt2utwfoMHpSyM3w
	MsFnbisDiEVqg3WyPzwcOZCAgn3TMclg1Q6Tft39cGPzXeZ0teOFQSzb6cm+OU4EA+bXrid3L4pWs
	GcBcHeyG+5vZ85LAMootagfH5719uGVb7krOvbk0QFMJOYyXeThkODbZa/PXCgNZdiXkrIlezmrbh
	5IuTKiI61oMeLhD5WLzN9P72uL8H61ljxF6jt2MaTkM9qpfrADAVTJ8xwokaDDSHYGEZ4e52bd4+9
	kNJ6P+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjDP-00000006vYa-1P9h;
	Mon, 19 Oct 2026 08:59:31 +0000
Received: from mail-m12758.qiye.163.com ([115.236.127.58])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjD9-00000006vEw-3A70;
	Mon, 19 Oct 2026 08:59:17 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51899c492;
	Mon, 19 Oct 2026 16:59:01 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 01/14] drm/bridge: analogix_dp: Return bitmask from analogix_dp_get_irq_type()
Date: Mon, 19 Oct 2026 16:58:23 +0800
Message-Id: <20261019085836.3065008-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019085836.3065008-1-damon.ding@rock-chips.com>
References: <20261019085836.3065008-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa15362b96303a8kunm6ee755052eabec
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTh4eVkpPSx9MHR9MQhhLSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQ0xVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=GpMHOhov746TekopaD0otJ4U5x3caBWAlLyZWJRbofI5/KmIXf4PEkijDXKLFbgsGv6uXkul9rSGZyHmhGHpMWHYOZUnKTF+D8mN0ykoJB999Af8T+s81ExOoXG5S5s8t5wt/pnV126mKUHHHNKTPTNSkoZxMzGD6MnlCdJy1FM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=bIQIJbyD3LB7TMeMid3TmrAlJVhYDZLTlh+xfGdP3D0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_015916_064189_3B8915B3 
X-CRM114-Status: GOOD (  14.03  )
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

Analogix DP controllers support two sets of interrupts for hotplug
detection: HOTPLUG_CHG, and the pair PLUG / HPD_LOST. The current
driver logic relies on PLUG/HPD_LOST and does not consume HOTPLUG_CHG,
nor does it check for INT_HPD for IRQ_HPD events.

The existing analogix_dp_get_irq_type() returns on the first matched
interrupt flag. This causes the hardirq handler to unconditionally mute
all HPD interrupts, including HOTPLUG_CHG and INT_HPD, creating a
limitation for future extensions.

To prepare fine-grained interrupt handling, convert the return type
from enum dp_irq_type to a u32 bitmask. Accumulate all pending
interrupt flags instead of returning early, and add detection for
DP_IRQ_TYPE_IRQ_HPD. Remove DP_IRQ_TYPE_UNKNOWN sentinel; use zero
to indicate no pending interrupts, which simplifies code and
facilitates future extension for additional interrupt types.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Add Tested-by tag.
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c |  8 ++++----
 .../gpu/drm/bridge/analogix/analogix_dp_core.h |  4 ++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c  | 18 ++++++++++--------
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6df6963740d2..079f2f01f33b 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -701,10 +701,10 @@ static irqreturn_t analogix_dp_hardirq(int irq, void *arg)
 {
 	struct analogix_dp_device *dp = arg;
 	irqreturn_t ret = IRQ_NONE;
-	enum dp_irq_type irq_type;
+	u32 irq_type;
 
 	irq_type = analogix_dp_get_irq_type(dp);
-	if (irq_type != DP_IRQ_TYPE_UNKNOWN) {
+	if (irq_type) {
 		analogix_dp_mute_hpd_interrupt(dp);
 		ret = IRQ_WAKE_THREAD;
 	}
@@ -715,7 +715,7 @@ static irqreturn_t analogix_dp_hardirq(int irq, void *arg)
 static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 {
 	struct analogix_dp_device *dp = arg;
-	enum dp_irq_type irq_type;
+	u32 irq_type;
 
 	irq_type = analogix_dp_get_irq_type(dp);
 	if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN ||
@@ -725,7 +725,7 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 			drm_helper_hpd_irq_event(dp->drm_dev);
 	}
 
-	if (irq_type != DP_IRQ_TYPE_UNKNOWN) {
+	if (irq_type) {
 		analogix_dp_clear_hotplug_interrupts(dp);
 		analogix_dp_unmute_hpd_interrupt(dp);
 	}
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 4560597604ad..3f40d95757c5 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -120,7 +120,7 @@ enum dp_irq_type {
 	DP_IRQ_TYPE_HP_CABLE_IN  = BIT(0),
 	DP_IRQ_TYPE_HP_CABLE_OUT = BIT(1),
 	DP_IRQ_TYPE_HP_CHANGE    = BIT(2),
-	DP_IRQ_TYPE_UNKNOWN      = BIT(3),
+	DP_IRQ_TYPE_IRQ_HPD      = BIT(3),
 };
 
 struct video_info {
@@ -195,7 +195,7 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 int analogix_dp_init_analog_func(struct analogix_dp_device *dp);
 void analogix_dp_init_hpd(struct analogix_dp_device *dp);
 void analogix_dp_force_hpd(struct analogix_dp_device *dp);
-enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp);
+u32 analogix_dp_get_irq_type(struct analogix_dp_device *dp);
 void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp);
 void analogix_dp_reset_aux(struct analogix_dp_device *dp);
 void analogix_dp_init_aux(struct analogix_dp_device *dp);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index c1344a3f013a..49c1961e4326 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -412,8 +412,9 @@ void analogix_dp_force_hpd(struct analogix_dp_device *dp)
 	writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
 }
 
-enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp)
+u32 analogix_dp_get_irq_type(struct analogix_dp_device *dp)
 {
+	u32 irq_type = 0;
 	u32 reg;
 
 	if (dp->hpd_gpiod) {
@@ -425,17 +426,18 @@ enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp)
 	} else {
 		/* Parse hotplug interrupt status register */
 		reg = readl(dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_4);
-
 		if (reg & PLUG)
-			return DP_IRQ_TYPE_HP_CABLE_IN;
-
+			irq_type |= DP_IRQ_TYPE_HP_CABLE_IN;
 		if (reg & HPD_LOST)
-			return DP_IRQ_TYPE_HP_CABLE_OUT;
-
+			irq_type |= DP_IRQ_TYPE_HP_CABLE_OUT;
 		if (reg & HOTPLUG_CHG)
-			return DP_IRQ_TYPE_HP_CHANGE;
+			irq_type |= DP_IRQ_TYPE_HP_CHANGE;
+
+		reg = readl(dp->reg_base + ANALOGIX_DP_INT_STA);
+		if (reg & INT_HPD)
+			irq_type |= DP_IRQ_TYPE_IRQ_HPD;
 
-		return DP_IRQ_TYPE_UNKNOWN;
+		return irq_type;
 	}
 }
 
-- 
2.34.1


