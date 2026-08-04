Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF8CC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GuR0aZbsHKQkwSeMUqSwIZq3i5kXGEPG6xmtyWBKbM=; b=ygQnGB17jNhI6rbGED88zLInYC
	253dJhkJRfxpH8AzLu+mII+rlXBl0kQ+hvLrmjEeNCSGOjCrLKntKlvo36iFS/ul3gjfvsClvt7aP
	FqRTci+65NT0Mc02JIExq35m4aCXXQyOAyNFgGqawJk/z1Q5n2EKXN9ZXvCwnKeGJ+kS6VQdNPpXf
	63GUQaZacw5Xy/Atpu4ZamaNXuGbo1OLxotoHFomFcjHiyoErGjARMhJ1VBXxwx2lXhR2zXtttma/
	19M+F34kqqPTKlfK60jVxR4NZ5zSVdurMeE5K3p0DM3aMycZEdOOmOXAy/R7zlb7x96p8+yGH7u3G
	xJlb+nWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrALH-00000001J98-34Ze;
	Tue, 04 Aug 2026 08:17:43 +0000
Received: from mail-m8156.xmail.ntesmail.com ([156.224.81.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrALC-00000001IvG-3Njv;
	Tue, 04 Aug 2026 08:17:41 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48b4fff14;
	Tue, 4 Aug 2026 16:17:33 +0800 (GMT+08:00)
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
Subject: [PATCH v2 08/10] drm/bridge: analogix_dp: Skip native HPD interrupt ops for GPIO HPD
Date: Tue,  4 Aug 2026 16:17:15 +0800
Message-Id: <20260804081717.741404-9-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804081717.741404-1-damon.ding@rock-chips.com>
References: <20260804081717.741404-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fcbd972f403a8kunma7b8cbe762b0da
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQx5LVkhMH0MaS0xLHRlJT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZdcsLqXpStn6Iw0ho7KZ95d2hq3I5UifDk+gNcAsmurzm5b2bxwqxIYwhNljq3Ml8e1SRPLlVL11I93xofyjGx371ZtR8ci5B5GeN0rtMHld493l83PNtYwufIc/zB3a+YZO4j28tsJFQRKmS3JNr/plBMxo6ZscHDLNj5+PEQo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=/GuR0aZbsHKQkwSeMUqSwIZq3i5kXGEPG6xmtyWBKbM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_011740_151024_D6AE7E54 
X-CRM114-Status: GOOD (  14.09  )
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

GPIO HPD does not rely on DP controller internal native HPD interrupts.
Skip native HPD register manipulations to avoid irrelevant operations.

In analogix_dp_config_interrupt(), mute all native HPD interrupts when
dp->hpd_gpiod is set. Move the dp->hpd_gpiod guard from inside
analogix_dp_clear_hotplug_interrupts() to its caller in the threaded
IRQ handler, so that the function operates purely on the given irq_type
bitmask without implicit mode-dependent behavior. This makes it
reusable for future callers that may need to clear specific interrupt
status bits regardless of the HPD detection mode.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Adapt to the newly added IRQF_ONESHOT related commit and expand the
  commit msg.
---
 .../drm/bridge/analogix/analogix_dp_core.c    |  2 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 30 +++++++++++--------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index d207cc864bdc..f05db455b430 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -720,7 +720,7 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 	bool hpd_detected;
 
 	irq_type = analogix_dp_get_irq_type(dp);
-	if (irq_type)
+	if (!dp->hpd_gpiod && irq_type)
 		analogix_dp_clear_hotplug_interrupts(dp, irq_type);
 
 	if (!dp->hpd_gpiod && analogix_dp_is_rockchip(dp->plat_data->dev_type))
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index fa8e2f104d6c..4b210e685747 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -182,18 +182,22 @@ void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
 
-	/*
-	 * Either HOTPLUG_CHG interrupt or PLUG + HPD_LOST interrupt
-	 * pair can be used to implement hotplug detection.
-	 *
-	 * On Rockchip platforms, configuring HPD deglitch to 2ms and
-	 * using HOTPLUG_CHG interrupt for hotplug detection is proven
-	 * as a better solution via engineering verification.
-	 */
-	if (analogix_dp_is_rockchip(dp->plat_data->dev_type))
-		analogix_dp_unmute_hpd_interrupt(dp, DP_IRQ_TYPE_HP_CHANGE);
-	else
-		analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ);
+	if (dp->hpd_gpiod) {
+		analogix_dp_mute_hpd_interrupt(dp, HPD_IRQ);
+	} else {
+		/*
+		 * Either HOTPLUG_CHG interrupt or PLUG + HPD_LOST interrupt
+		 * pair can be used to implement hotplug detection.
+		 *
+		 * On Rockchip platforms, configuring HPD deglitch to 2ms and
+		 * using HOTPLUG_CHG interrupt for hotplug detection is proven
+		 * as a better solution via engineering verification.
+		 */
+		if (analogix_dp_is_rockchip(dp->plat_data->dev_type))
+			analogix_dp_unmute_hpd_interrupt(dp, DP_IRQ_TYPE_HP_CHANGE);
+		else
+			analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ);
+	}
 }
 
 void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp, u32 irq_type)
@@ -413,7 +417,7 @@ void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp, u32 irq
 {
 	u32 reg = 0;
 
-	if (dp->hpd_gpiod || !irq_type)
+	if (!irq_type)
 		return;
 
 	if (irq_type & COMMON_INT_4_HPD_IRQ) {
-- 
2.34.1


