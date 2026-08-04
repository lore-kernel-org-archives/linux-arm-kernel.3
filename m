Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3758C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCxGMX+jTS1vNiY9tKHG6shVsMrbE7xWUPx/wK0vypY=; b=QEyhnUgM5qyHj6rbH2XHc9D+88
	Ox25LqzAm0+8KsaUYMIBlB3rjcLGFXp1BDGCqLQNPlaRelLUO1x4IwZrKM5m+PMIUU4rUpboYwqII
	jRPmfzJrrHdrettn079atDZq9koEQRseVr1csTO0v2YhEPP4Hb6XomEN+5vVvzq7Q68VjUuMIbPR7
	vySzlbzcgNkO9Zvj5gTG6n8owwFR+JAqANOOgeFNwLOOMeoVgHcz8Hv3ROrAehVFw9QXbGDX/xKhB
	LZ0ewrHk9I0BTiNINsEv6W8FzQR4cVt5VOHcAylY5DfExWh1MYUK60lboZMVtKjeU0REswG/NSGNR
	A9xUUr8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrALF-00000001J2Y-1XjX;
	Tue, 04 Aug 2026 08:17:41 +0000
Received: from mail-m83184.xmail.ntesmail.com ([156.224.83.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAL8-00000001IsZ-21jo;
	Tue, 04 Aug 2026 08:17:36 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48b4ffeed;
	Tue, 4 Aug 2026 16:17:29 +0800 (GMT+08:00)
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
Subject: [PATCH v2 05/10] drm/bridge: analogix_dp: Extend mute/unmute HPD interrupts to accept irq bitmask
Date: Tue,  4 Aug 2026 16:17:12 +0800
Message-Id: <20260804081717.741404-6-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804081717.741404-1-damon.ding@rock-chips.com>
References: <20260804081717.741404-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fcbd9651703a8kunma7b8cbe762b0a5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQxlKVktCH0MdTRgYGBoaGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=MUekaK+18EXfj0gEqQzJILeHV9JnC1vyY21k7DDS/ahSwctVmuZbMIiEV5sdNqXQiHKJppjWKTey6WTNWN54lC/2mCgmps+pov1DeCwzuDMEwNq4jnkD6WNsSeCq61sfngTnaq53GfTJLg4Kz1MtZfmFg4ZlbwKgV2g3X5r/YVk=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=dCxGMX+jTS1vNiY9tKHG6shVsMrbE7xWUPx/wK0vypY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_011734_823800_FAB9AA93 
X-CRM114-Status: GOOD (  10.82  )
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

Update the HPD interrupt mute/unmute routines to accept an irq_type
bitmask parameter, allowing selective per-bit mask control instead of
operating on all HPD interrupt bits unconditionally.

With IRQF_ONESHOT handling IRQ line masking during threaded handler
execution, these helpers are no longer needed in the runtime IRQ path.
They are retained for init-time use by analogix_dp_config_interrupt()
to configure platform-specific HPD interrupt masks.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Update commit messages to align with newly added IRQF_ONESHOT related
  commit.
---
 .../drm/bridge/analogix/analogix_dp_core.h    |  4 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 59 ++++++++++++++-----
 2 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index ecb86a6c1fc3..2066e575ce10 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -183,8 +183,8 @@ void analogix_dp_init_interrupt(struct analogix_dp_device *dp);
 void analogix_dp_reset(struct analogix_dp_device *dp);
 void analogix_dp_swreset(struct analogix_dp_device *dp);
 void analogix_dp_config_interrupt(struct analogix_dp_device *dp);
-void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp);
-void analogix_dp_unmute_hpd_interrupt(struct analogix_dp_device *dp);
+void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp, u32 irq_type);
+void analogix_dp_unmute_hpd_interrupt(struct analogix_dp_device *dp, u32 irq_type);
 int analogix_dp_wait_pll_locked(struct analogix_dp_device *dp);
 void analogix_dp_set_pll_power_down(struct analogix_dp_device *dp, bool enable);
 void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 024f342da461..816be79a8da6 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -197,30 +197,59 @@ void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
 }
 
-void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp)
+void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp, u32 irq_type)
 {
-	u32 reg;
+	u32 reg, mask = 0;
 
-	/* 0: mask, 1: unmask */
-	reg = readl(dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
-	reg &= ~COMMON_INT_MASK_4;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+	if (!irq_type)
+		return;
 
-	reg = readl(dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
-	reg &= ~INT_STA_MASK;
-	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+	if (irq_type & COMMON_INT_4_HPD_IRQ) {
+		/* 0: mask, 1: unmask */
+		reg = readl(dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+		if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN)
+			mask |= PLUG;
+		if (irq_type & DP_IRQ_TYPE_HP_CABLE_OUT)
+			mask |= HPD_LOST;
+		if (irq_type & DP_IRQ_TYPE_HP_CHANGE)
+			mask |= HOTPLUG_CHG;
+		reg &= ~mask;
+		writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+	}
+
+	if (irq_type & DP_IRQ_TYPE_IRQ_HPD) {
+		/* 0: mask, 1: unmask */
+		reg = readl(dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+		reg &= ~INT_HPD;
+		writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+	}
 }
 
-void analogix_dp_unmute_hpd_interrupt(struct analogix_dp_device *dp)
+void analogix_dp_unmute_hpd_interrupt(struct analogix_dp_device *dp, u32 irq_type)
 {
 	u32 reg;
 
-	/* 0: mask, 1: unmask */
-	reg = COMMON_INT_MASK_4;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+	if (!irq_type)
+		return;
 
-	reg = INT_STA_MASK;
-	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+	if (irq_type & COMMON_INT_4_HPD_IRQ) {
+		/* 0: mask, 1: unmask */
+		reg = readl(dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+		if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN)
+			reg |= PLUG;
+		if (irq_type & DP_IRQ_TYPE_HP_CABLE_OUT)
+			reg |= HPD_LOST;
+		if (irq_type & DP_IRQ_TYPE_HP_CHANGE)
+			reg |= HOTPLUG_CHG;
+		writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+	}
+
+	if (irq_type & DP_IRQ_TYPE_IRQ_HPD) {
+		/* 0: mask, 1: unmask */
+		reg = readl(dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+		reg |= INT_HPD;
+		writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+	}
 }
 
 int analogix_dp_wait_pll_locked(struct analogix_dp_device *dp)
-- 
2.34.1


