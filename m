Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C4AD46958
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 23:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jB/ScZjmwcv3uIlHezGwmApb/zmaCDUUF2OGJfRkFZY=; b=D98yBFt2hXDuFZEp4ILIGIPSsz
	0aiOWDqz0xRWmtaN5vn7UEAmLOR7/yHt/e1BEe3jhVwBQ2EP+jUte5ikt2g1DUUGxyPXf4KPqUMPC
	t7YBQRnn4AQGdeZdUMN+7CexZtnyO3Pv8lntJyx2xivel6gwlcL1/3T3dZn4zsBYRh/bGznZQXNr9
	dywYW23TgFCN3ytvAC8qRz+BTIItSfpIYWnegtpoRQRoFAVM/pYok+Tz305BpSZIQfmyvfOmg4qZr
	MPZ67+JgrwJrGQAzBcBAfBT9Tm+UQMeMvCntu1rW5j8CcyIRIQsB/coy9z8L3d1JHnoi2pHtREdEA
	JEeWYkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihSw-000000069yi-1ogU;
	Wed, 21 Jan 2026 23:18:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihSd-000000069c7-08Ji;
	Wed, 21 Jan 2026 23:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769037480;
	bh=k+lpKw/GkEE1qZBAsdHOtmmT4OdP3htD+kdTsbNCAeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G474uepkcLEufCY9CSLX4eOL43laBwOix+QhdgAKqSD8ocBWQEbDbkZsGp7F/dRhJ
	 uO7ZQRSKItQdlFDPEGBtNpKYhpJfa6IJ+Bo6h4Ck0W5qUJRsNbtJvrzzx2lOzKJbnq
	 D0qgpealA/utLVFiqyKWv+m1cdKYE2zb7enUe8KQ/6S17oR9efitxFAKYgeSkOMuFk
	 T4/O96ZdEn9KDXUCbF+mI0COI0kpe7sUeX2kGWCubCo0Xn5WIVCoyYImL5RORFssvT
	 EN6bCwq6H0NYrD8OeVuxXPP8321Qn4nmC97e1lZ7l9oebAggifvxr0CazGwaSggfsi
	 ki94oXV8mXgPg==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD83117E13D3;
	Thu, 22 Jan 2026 00:18:00 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 22 Jan 2026 01:17:37 +0200
Subject: [PATCH 4/6] drm/rockchip: dw_dp: Simplify error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-drm-rk-fixes-v1-4-3942f185750e@collabora.com>
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
X-CRM114-CacheID: sfid-20260121_151803_223714_6BC250C2 
X-CRM114-Status: GOOD (  12.29  )
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

Make the code a bit more compact by getting rid of the superfluous
assignments around PTR_ERR().

While at it, also drop dev assignment in dw_dp_probe().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 6d57e1c74627..785f9727b4e1 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -101,20 +101,15 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 	drm_encoder_helper_add(encoder, &dw_dp_encoder_helper_funcs);
 
 	dp->base = dw_dp_bind(dev, encoder, &plat_data);
-	if (IS_ERR(dp->base)) {
-		ret = PTR_ERR(dp->base);
-		return ret;
-	}
+	if (IS_ERR(dp->base))
+		return PTR_ERR(dp->base);
 
 	connector = drm_bridge_connector_init(drm_dev, encoder);
-	if (IS_ERR(connector)) {
-		ret = PTR_ERR(connector);
-		return dev_err_probe(dev, ret, "Failed to init bridge connector");
-	}
+	if (IS_ERR(connector))
+		return dev_err_probe(dev, PTR_ERR(connector),
+				     "Failed to init bridge connector");
 
-	drm_connector_attach_encoder(connector, encoder);
-
-	return 0;
+	return drm_connector_attach_encoder(connector, encoder);
 }
 
 static const struct component_ops dw_dp_rockchip_component_ops = {
@@ -123,9 +118,7 @@ static const struct component_ops dw_dp_rockchip_component_ops = {
 
 static int dw_dp_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
-
-	return component_add(dev, &dw_dp_rockchip_component_ops);
+	return component_add(&pdev->dev, &dw_dp_rockchip_component_ops);
 }
 
 static void dw_dp_remove(struct platform_device *pdev)

-- 
2.52.0


