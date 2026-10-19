Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4336FCCF2E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83I3DhMAQxj1+DdbooL/jQB//h01wJE8bOZJJ0agq3I=; b=5FOA0hMse2zrFTy/9W6e19g0sv
	mORBaXoVODU54Aqj7eYkPldl/CJIw6yE/L7Y0NDXp38PK/UVX++2LMUfTA4ausIYylUXxliEqc0XJ
	bd6Dv8W0mmbbs/8oAcdxEIU6WEimdk1Ch1I21bMZErHdnG3vJmouQwGSgclKFxL/zFyQnhpd/eiFt
	CNFMj/dAUCedtK7r2qDAfRLpPcwD+29RNqcJL24zLITdx+QALf/tnpjMWvpos0nDy1as7/ixxkwe9
	Rt5pdL0xO7LpLDjejc7/E0iu/dfPHse/lFmwXo9/e2Rc2Cu+7TBAfiwzIzFuNCDExLOzdAZ5mmp2a
	i1osafTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjDL-00000006vTq-1YRL;
	Mon, 19 Oct 2026 08:59:27 +0000
Received: from mail-m1973199.qiye.163.com ([220.197.31.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjD6-00000006vFU-2XVZ;
	Mon, 19 Oct 2026 08:59:14 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5189b8603;
	Mon, 19 Oct 2026 16:59:09 +0800 (GMT+08:00)
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
Subject: [PATCH v4 07/14] drm/bridge: analogix_dp: Use platform-specific HPD detection scheme
Date: Mon, 19 Oct 2026 16:58:29 +0800
Message-Id: <20261019085836.3065008-8-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019085836.3065008-1-damon.ding@rock-chips.com>
References: <20261019085836.3065008-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa15362d74d03a8kunm6ee755052eac3b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTRgZVk4aSx5OGElCQk5NS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQ0xVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=MVOWTD9Yk9s6GZvSHDvzeweA5ltpKa0fIw91W9MbRT8u60Bv0yQNlAvWumWTm9lvGYX4OTwUM/zhkSFgdtnTYmTEZe/RuaJ00HPJELbeFzWGfhKC6eJKDAap12KVO3PzdIF5iC1bpS6WIlrWUukv0n5w7ZUczmbEsAgRJMuKKKs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=83I3DhMAQxj1+DdbooL/jQB//h01wJE8bOZJJ0agq3I=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_015912_813537_9D0031FA 
X-CRM114-Status: GOOD (  14.77  )
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

The Analogix DP controller provides two sets of interrupt sources for
hotplug detection: HOTPLUG_CHG for any HPD level change, and the
PLUG/HPD_LOST pair for connect/disconnect transitions respectively.

On Rockchip platforms, configure the HPD deglitch filter and use
HOTPLUG_CHG interrupt for hotplug detection. Other platforms retain the
original PLUG + HPD_LOST scheme with unchanged deglitch values.

Move the HPD deglitch configuration into analogix_dp_reset() so that
platform-specific values are set alongside the existing register
defaults in a single location. Update the threaded IRQ handler to check
the corresponding interrupt flag based on platform type.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Move ANALOGIX_DP_HPD_DEGLITCH_L/ANALOGIX_DP_HPD_DEGLITCH_H configs to
  analogix_dp_reset().

Changes in v3:
- Modify the commit msg.
- Replace macro HPD_IRQ with HPD_IRQ_ALL.

Changes in v4:
- Add Tested-by tag.
---
 .../drm/bridge/analogix/analogix_dp_core.c    |  9 ++++++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 22 ++++++++++++++++---
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index f88e3263ba0e..287fc16125ef 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -714,13 +714,18 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 {
 	struct analogix_dp_device *dp = arg;
 	u32 irq_type;
+	bool hpd_detected;
 
 	irq_type = analogix_dp_get_irq_type(dp);
 	if (irq_type)
 		analogix_dp_clear_hotplug_interrupts(dp, irq_type);
 
-	if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN ||
-	    irq_type & DP_IRQ_TYPE_HP_CABLE_OUT) {
+	if (!dp->hpd_gpiod && analogix_dp_is_rockchip(dp->plat_data->dev_type))
+		hpd_detected = irq_type & DP_IRQ_TYPE_HP_CHANGE;
+	else
+		hpd_detected = (irq_type & DP_IRQ_TYPE_HP_CABLE_IN) ||
+			       (irq_type & DP_IRQ_TYPE_HP_CABLE_OUT);
+	if (hpd_detected) {
 		dev_dbg(dp->dev, "Detected cable status changed!\n");
 		if (dp->drm_dev)
 			drm_helper_hpd_irq_event(dp->drm_dev);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 0f1406e4a5d3..025da25463a8 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -160,8 +160,13 @@ void analogix_dp_reset(struct analogix_dp_device *dp)
 	writel(0x0, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
 	writel(0x0, dp->reg_base + ANALOGIX_DP_HDCP_CTL);
 
-	writel(0x5e, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
-	writel(0x1a, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
+	if (analogix_dp_is_rockchip(dp->plat_data->dev_type)) {
+		writel(0x80, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
+		writel(0xbb, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
+	} else {
+		writel(0x5e, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
+		writel(0x1a, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
+	}
 
 	writel(0x10, dp->reg_base + ANALOGIX_DP_LINK_DEBUG_CTL);
 
@@ -188,7 +193,18 @@ void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
 
-	analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ_ALL);
+	/*
+	 * Either HOTPLUG_CHG interrupt or PLUG + HPD_LOST interrupt
+	 * pair can be used to implement hotplug detection.
+	 *
+	 * On Rockchip platforms, configuring HPD deglitch to 2ms and
+	 * using HOTPLUG_CHG interrupt for hotplug detection is proven
+	 * as a better solution via engineering verification.
+	 */
+	if (analogix_dp_is_rockchip(dp->plat_data->dev_type))
+		analogix_dp_unmute_hpd_interrupt(dp, DP_IRQ_TYPE_HP_CHANGE);
+	else
+		analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ_ALL);
 }
 
 /*
-- 
2.34.1


