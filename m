Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ABBECD9B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 01:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihep3YWtnZq0iNOxVl6wg5/61ITTjNTIu5bF6P4+mMI=; b=DKBd+1UYv7xDoJLf9lakdjbiaQ
	vSAN3x32JJMKvPhtr/c1/vvsAVYAnpZV3k5EACn5SgN8a+mvz4RMfxHWT84IxcSzaqpDCOuuo5SV0
	caEmVlk2LATJQie5POUbjEHW+Lea0v8iNeS8QD+Icqof9s6ixAU+d2XWJn2SiYuM1K1jZg6lI5oo/
	p+K2fglR7mcY2zSxgRJDDJrrwrRXkVnfHi+B7t90ZLSj0+TyLli3OuEqir5lS1cD80ArJPFh5sIRQ
	FztNvjJjJezelsQExEl1QcngsAHbhN4pKSQJhk9c/v7/iFFS4iqrS1mUHHUlER60NXWhlpagYQAZ3
	YOY/b80Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voAHy-0000000AgrO-2Tre;
	Fri, 06 Feb 2026 01:05:38 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voAHr-0000000Agn1-1PBl;
	Fri, 06 Feb 2026 01:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ih
	ep3YWtnZq0iNOxVl6wg5/61ITTjNTIu5bF6P4+mMI=; b=jk1hgtu6MovS27oist
	6nJBq5oGtTjwbJu+XN/JleJ2CT55TIaqlMyRVHcxXcPklO+cGTjAXeDT1tTV0Gb1
	jcSCa5AsSv9rFx7vPV56VBMUWqOCJysdDO3leLTCRAJIQlJJ7rhocZ5ssrUvWXRx
	AzVLZzlIuZ0t4hufGJJakgPD4=
Received: from ProDesk-480.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3_+0XPoVpQ5VfQQ--.20291S4;
	Fri, 06 Feb 2026 09:04:30 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: alchark@gmail.com,
	andrzej.hajda@intel.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	airlied@gmail.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	nicolas.frattaroli@collabora.com,
	robh@kernel.org,
	rfoss@kernel.org,
	hjc@rock-chips.com,
	sebastian.reichel@collabora.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 2/5] drm/bridge: synopsys: dw-dp: Set pixel mode by platform data
Date: Fri,  6 Feb 2026 09:04:12 +0800
Message-ID: <20260206010421.443605-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206010421.443605-1-andyshrk@163.com>
References: <20260206010421.443605-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgD3_+0XPoVpQ5VfQQ--.20291S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF4UXFyDtF15CF4fZw1rXrb_yoWrCr48pF
	WxJFW5KrWkKF4Y9a48ArWkCFn0yw1q9ayxJa1xGw4Ik34fKF95Xr9Ivr15Wrn7XF9xur13
	CrsrJrW8ZF1jkrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jvUDXUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7R5SsGmFPh5tegAA3K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_170531_791836_2D0D841C 
X-CRM114-Status: GOOD (  15.36  )
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

From: Andy Yan <andy.yan@rock-chips.com>

In the implementation and integration of the SoC, the DW DisplayPort
hardware block can be configured to work in single, dual, quad pixel
mode on differnt platforms, so make the pixel mode set by plat_data
to support the upcoming rk3576 variant.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>

---

(no changes since v2)

Changes in v2:
- Commit message improve: The pixel mode is determined during the IC
  integration stage

 drivers/gpu/drm/bridge/synopsys/dw-dp.c   |  8 +-------
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 19 +++++++++++++++----
 include/drm/bridge/dw_dp.h                |  7 +++++++
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 82aaf74e1bc0..eccf6299bdb7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -352,12 +352,6 @@ enum {
 	DW_DP_YCBCR420_16BIT,
 };
 
-enum {
-	DW_DP_MP_SINGLE_PIXEL,
-	DW_DP_MP_DUAL_PIXEL,
-	DW_DP_MP_QUAD_PIXEL,
-};
-
 enum {
 	DW_DP_SDP_VERTICAL_INTERVAL = BIT(0),
 	DW_DP_SDP_HORIZONTAL_INTERVAL = BIT(1),
@@ -1984,7 +1978,7 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 		return ERR_CAST(dp);
 
 	dp->dev = dev;
-	dp->pixel_mode = DW_DP_MP_QUAD_PIXEL;
+	dp->pixel_mode = plat_data->pixel_mode;
 
 	dp->plat_data.max_link_rate = plat_data->max_link_rate;
 	bridge = &dp->bridge;
diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 25ab4e46301e..89d614d53596 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -75,7 +75,7 @@ static const struct drm_encoder_helper_funcs dw_dp_encoder_helper_funcs = {
 static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct dw_dp_plat_data plat_data;
+	const struct dw_dp_plat_data *plat_data;
 	struct drm_device *drm_dev = data;
 	struct rockchip_dw_dp *dp;
 	struct drm_encoder *encoder;
@@ -89,7 +89,10 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 	dp->dev = dev;
 	platform_set_drvdata(pdev, dp);
 
-	plat_data.max_link_rate = 810000;
+	plat_data = of_device_get_match_data(dev);
+	if (!plat_data)
+		return -ENODEV;
+
 	encoder = &dp->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev, dev->of_node);
 	rockchip_drm_encoder_set_crtc_endpoint_id(&dp->encoder, dev->of_node, 0, 0);
@@ -99,7 +102,7 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 		return ret;
 	drm_encoder_helper_add(encoder, &dw_dp_encoder_helper_funcs);
 
-	dp->base = dw_dp_bind(dev, encoder, &plat_data);
+	dp->base = dw_dp_bind(dev, encoder, plat_data);
 	if (IS_ERR(dp->base)) {
 		ret = PTR_ERR(dp->base);
 		return ret;
@@ -134,8 +137,16 @@ static void dw_dp_remove(struct platform_device *pdev)
 	component_del(dp->dev, &dw_dp_rockchip_component_ops);
 }
 
+static const struct dw_dp_plat_data rk3588_dp_plat_data = {
+	.max_link_rate = 810000,
+	.pixel_mode = DW_DP_MP_QUAD_PIXEL,
+};
+
 static const struct of_device_id dw_dp_of_match[] = {
-	{ .compatible = "rockchip,rk3588-dp", },
+	{
+		.compatible = "rockchip,rk3588-dp",
+		.data = &rk3588_dp_plat_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, dw_dp_of_match);
diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
index d05df49fd884..25363541e69d 100644
--- a/include/drm/bridge/dw_dp.h
+++ b/include/drm/bridge/dw_dp.h
@@ -11,8 +11,15 @@
 struct drm_encoder;
 struct dw_dp;
 
+enum {
+	DW_DP_MP_SINGLE_PIXEL,
+	DW_DP_MP_DUAL_PIXEL,
+	DW_DP_MP_QUAD_PIXEL,
+};
+
 struct dw_dp_plat_data {
 	u32 max_link_rate;
+	u8 pixel_mode;
 };
 
 struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
-- 
2.43.0


