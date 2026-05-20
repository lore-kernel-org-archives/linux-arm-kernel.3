Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D359CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqTlhXv3Rk0G+8PRQQA+bSXnWx8UzTnr8tYqxjD6LFA=; b=yMqJITdh1JeII0WIIJXTzUYbtT
	SLAkjSNQHVdb/H+ssmMG7z+r/SaKCcsmevUZO3f4j1cYtgyPpUgxWIOsZy9qMN66WfhNB46Yo6b1o
	MjL/FIwkzWE9yyyZcr/m8tj2hMQBzxH2WffiYU+WRoD0IOE/j6KbZRElxsvaLviX9h9ecgLHyoK4D
	rVWAmKxhWJrWjLU81pT1QKr+45JBFBjtk+nawcZw7s5YdekbxcwvWvCb30eBEuRAvI25Kad3YfZQT
	lg39OTfcrjIT0MDIRmmejfGeG9bvSr8Hv1d+/MxdXpawFPV7/uRphe+3xwuX99ypzJMO+yDX9Xu5v
	/VLLJpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlp5-00000005TuD-47QW;
	Wed, 20 May 2026 18:39:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPloe-00000005SvS-3FFU;
	Wed, 20 May 2026 18:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779302327;
	bh=9Dzv5QZZTewYw4HMaE8rAMe+B3WVA6il2PiXX6JKcOw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A9hUC+Zr0sqfbI+9NFOr0ezHn2236wtA5Cx/3XzRvY0ds2JOT3Xqm19Zr/n9e4Kzx
	 n31hcjz6m1vMRwAYp6AhSJ3R+ZoJabPFxv2XA+2VBCncXtWmUqXHoXxYZx1j4dG3JE
	 0nFWyZQa5blCyWUccug8Y5k1dq0CGtrB7XFXOvzksDNFaH1fNK8w+qrBAt9jTtvKGR
	 l8UqCg7q2or9idP8qSFrgXZAKHiwmU7ONoRPBaVjzVtWJIPBMlxHTbgRngC6DhV8ry
	 lizrbYEXbQnm5F+GrfikYKTLeZOIPCNH4qnZDlboAaKcyWUdFvLudZ152C39tfDmBn
	 ndptsREh8x4cA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECFD617E1584;
	Wed, 20 May 2026 20:38:46 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 20 May 2026 21:38:32 +0300
Subject: [PATCH v6 21/22] drm/rockchip: dw_hdmi_qp: Switch to
 dw_hdmi_qp_hpd_notify()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-dw-hdmi-qp-scramb-v6-21-24b74603b782@collabora.com>
References: <20260520-dw-hdmi-qp-scramb-v6-0-24b74603b782@collabora.com>
In-Reply-To: <20260520-dw-hdmi-qp-scramb-v6-0-24b74603b782@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_113848_978292_2533429E 
X-CRM114-Status: GOOD (  12.09  )
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

Switch from drm_helper_hpd_irq_event(), which polls all connectors, to
the recently introduced dw_hdmi_qp_hpd_notify() helper, which runs the
detect cycle only on the affected connector.

This avoids unnecessary work and redundant detect calls on unrelated
connectors.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index b9e0ea56efd8..666631fc9162 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -23,7 +23,6 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
-#include <drm/drm_probe_helper.h>
 
 #include "rockchip_drm_drv.h"
 
@@ -273,14 +272,8 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
 	struct rockchip_hdmi_qp *hdmi = container_of(work,
 						     struct rockchip_hdmi_qp,
 						     hpd_work.work);
-	struct drm_device *drm = hdmi->encoder.encoder.dev;
-	bool changed;
 
-	if (drm) {
-		changed = drm_helper_hpd_irq_event(drm);
-		if (changed)
-			dev_dbg(hdmi->dev, "connector status changed\n");
-	}
+	dw_hdmi_qp_hpd_notify(hdmi->hdmi);
 }
 
 static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int irq, void *dev_id)
@@ -645,8 +638,7 @@ static int __maybe_unused dw_hdmi_qp_rockchip_resume(struct device *dev)
 
 	dw_hdmi_qp_resume(dev, hdmi->hdmi);
 
-	if (hdmi->encoder.encoder.dev)
-		drm_helper_hpd_irq_event(hdmi->encoder.encoder.dev);
+	dw_hdmi_qp_hpd_notify(hdmi->hdmi);
 
 	return 0;
 }

-- 
2.53.0


