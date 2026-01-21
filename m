Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D449C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 23:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXVkcIfsMp+kmzfZku8NI6lrLB6y0sK8VlOqL90VqcQ=; b=krNRow8kq7+EFFTwN6kVyPZLxp
	KkdHISEXd3AV+GqHm3Qbz3KIEB5Sg6+Ncw4OX2g6/s7D2Qt7e+hc6MlXBBwptAytuCwtykTg17Z07
	engMLYgh3g/MS1TfCtZbIdMR1fqT9lbFC471yi8MlzwmBlZgs5cxrV1l7g16+Vfru9RBTZnhLy4sP
	7RXaBuGt03YfXi4FipHVuEfBsggH6KSGSsWiZzCoBY8RZZ5S9iwr5RJI6D+4Zq/Prk1RXpxWse3Ro
	3GfUMNrvYpaHeT4p/ft4qlR+fZMWDSJLtiJxadOsbjCl4uv8iLI5kp7vBNdob9LEs+wbfs74Fq0vN
	Z7qoK7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihSx-00000006A05-1FeX;
	Wed, 21 Jan 2026 23:18:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihSe-000000069cq-1hOf;
	Wed, 21 Jan 2026 23:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769037482;
	bh=R+xJHiWmqddfOaWnYrv4TmuM68RjSsTBkMbRVA8KSLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HbFMzAd/cFrR6jx5Sj2PSFh+P7Oj3kZvYhuXk5n9FbaSh+f7crp1+8Agn3amlJJZp
	 Opu0NnH5ON0FaMDee1h/n+o6lZJgMz6lCQnblGtMFcZzFbLITvknRmHstnS6yzhQTO
	 cqT9kBRYKLU6gwl1/45+WOcwLXRurbEuluTy9Gk8QMBGqHlM3isMNIRRqqKTCS/Myy
	 l4Qir70CMU33fNR0GV9dWRvsD8ofRXct1ZN9mo1wSrKvoHDodIXGab3XfO/MxTpnYX
	 rbNoPG/Pa7j8acKnlOBOBXlFoILA6DjjpYXkXXrMVSqO7+V5hXHYLrwrbqrcCf0cAH
	 ZvkU9kVHIyzCA==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F92217E1513;
	Thu, 22 Jan 2026 00:18:02 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 22 Jan 2026 01:17:39 +0200
Subject: [PATCH 6/6] drm/rockchip: dw_hdmi_qp: Switch to
 drmm_encoder_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-drm-rk-fixes-v1-6-3942f185750e@collabora.com>
References: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
In-Reply-To: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_151804_626861_7FB89E6B 
X-CRM114-Status: GOOD (  11.18  )
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

Simplify encoder initialization and cleanup by making use of
drmm_encoder_init(), which takes care of registering
drm_encoder_cleanup() with drmm_add_action().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index a8190a6e8978..94136d7fb1c3 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -21,6 +21,7 @@
 #include <drm/bridge/dw_hdmi_qp.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -477,7 +478,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
+	hdmi = drmm_kzalloc(drm, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
 		return -ENOMEM;
 
@@ -586,16 +587,16 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return ret;
 
 	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drmm_encoder_init(drm, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder");
 
 	platform_set_drvdata(pdev, hdmi);
 
 	hdmi->hdmi = dw_hdmi_qp_bind(pdev, encoder, &plat_data);
-	if (IS_ERR(hdmi->hdmi)) {
-		drm_encoder_cleanup(encoder);
+	if (IS_ERR(hdmi->hdmi))
 		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->hdmi),
 				     "Failed to bind dw-hdmi-qp");
-	}
 
 	connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(connector))
@@ -612,8 +613,6 @@ static void dw_hdmi_qp_rockchip_unbind(struct device *dev,
 	struct rockchip_hdmi_qp *hdmi = dev_get_drvdata(dev);
 
 	cancel_delayed_work_sync(&hdmi->hpd_work);
-
-	drm_encoder_cleanup(&hdmi->encoder.encoder);
 }
 
 static const struct component_ops dw_hdmi_qp_rockchip_ops = {

-- 
2.52.0


