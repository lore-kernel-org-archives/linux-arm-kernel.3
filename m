Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0A8C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLzkxeakjSh54tUqTZOT4TJ34W2N82hCyBquIMOGQ6g=; b=EmHhAwdRzGKY4yLdWVCbHED6Hf
	LufzBuBgLYV8CEP65UlDSE0EWDiLFPWUH+kpGb1J36kWrpXvxQ2rhzmkPwat/oCbv/fpOP3KpmlA5
	uXya5P6DkNRgFeOUeRSDN3ESj6CzCvIKgaVnwQ3L6GEoltJYw/FtiuODfa3QJzPFR2I7Y3kYUX6sI
	V0t94qeNwBRIR7hOvqTpYp4dFRTPeOgcQfL0B9546nZQvKxMDmkCNOT9FTULJyVFrq14JhH75Hhc2
	sqv7W8+NbDNHbnUmfqma+Q8WJVS9+MjWOHuSzIysE7bpoWx94bkDxScVaRYyZ7MqQyGDgH+rQ6zlY
	qK2llabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6bC-0000000044f-0luS;
	Mon, 28 Sep 2026 08:20:34 +0000
Received: from mail-m49203.qiye.163.com ([45.254.49.203])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6av-000000003p2-3tcM;
	Mon, 28 Sep 2026 08:20:19 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f5398ea3;
	Mon, 28 Sep 2026 16:15:14 +0800 (GMT+08:00)
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
Subject: [PATCH v3 10/14] drm/bridge: analogix_dp: Manage pm runtime and IRQ for native HPD pin detection
Date: Mon, 28 Sep 2026 16:14:14 +0800
Message-Id: <20260928081418.3605775-11-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928081418.3605775-1-damon.ding@rock-chips.com>
References: <20260928081418.3605775-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e715167803a8kunm323e2b5437cf71
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSEoeVk5DS09JGRlIGB1MH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FHR468bOgqbhhO89sW6plrUIBNGprK8yYsnbhwl/HwN66rnW4hGl8VtzxBx68WybFuSZzy8j3qDfROdZCxkvRQ6vAzV8f/oAq+aB4t0IwrwwrfY+6QjEQaNJ508ExGLqC6LpAn4qYVRjMuO/H56CpbpVCrtGHnvHBXYvQ1Gt82w=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=QLzkxeakjSh54tUqTZOT4TJ34W2N82hCyBquIMOGQ6g=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_012018_160122_C6F32916 
X-CRM114-Status: GOOD (  11.02  )
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

On Rockchip platforms, the Analogix DP native HPD pin IRQ requires the
DP controller to remain powered and clocked to generate plug/unplug
interrupts. Without a runtime PM reference, the controller suspends
when the display pipeline is inactive, disabling HPD detection.

Acquire a runtime PM reference in analogix_dp_bind() and release it in
analogix_dp_unbind() for native HPD pin mode. This keeps the controller
alive throughout the device lifecycle for continuous hotplug detection.

Persistent power is only necessary for native HPD pin mode. It is not
required for force-HPD or GPIO HPD modes, where hotplug detection does
not depend on the DP controller's internal interrupt logic. Add helper
analogix_dp_require_pm_for_hpd_irq() to identify Rockchip native HPD
pin configurations (non-GPIO, non-force-HPD).

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Split IRQ enable/disable logic, handle native HPD pin and
  GPIO/force-HPD modes separately to avoid unbalanced enable_irq()
  calls.(Sashiko)

Changes in v3:
- Modify the commit msg according to the previous commit for moving IRQ
  enabling/disabling.
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index addd319719de..38857508d939 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -39,6 +39,12 @@
 
 static const bool verify_fast_training;
 
+static bool analogix_dp_require_pm_for_hpd_irq(struct analogix_dp_device *dp)
+{
+	return analogix_dp_is_rockchip(dp->plat_data->dev_type) && !dp->hpd_gpiod &&
+	       !dp->force_hpd;
+}
+
 static void analogix_dp_init_dp(struct analogix_dp_device *dp)
 {
 	analogix_dp_reset(dp);
@@ -1571,6 +1577,12 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 		goto err_unregister_aux;
 	}
 
+	if (analogix_dp_require_pm_for_hpd_irq(dp)) {
+		ret = pm_runtime_resume_and_get(dp->dev);
+		if (ret)
+			goto err_unregister_aux;
+	}
+
 	enable_irq(dp->irq);
 
 	return 0;
@@ -1585,6 +1597,10 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
 void analogix_dp_unbind(struct analogix_dp_device *dp)
 {
 	disable_irq(dp->irq);
+
+	if (analogix_dp_require_pm_for_hpd_irq(dp))
+		pm_runtime_put_sync(dp->dev);
+
 	drm_dp_aux_unregister(&dp->aux);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
-- 
2.34.1


