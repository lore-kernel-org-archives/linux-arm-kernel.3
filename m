Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8BDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 06:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Os1l8vXNpaWFvpC0USZiZpP04fKmY9GbZF77YM2zyNE=; b=UidYOmjbB2rtegkjfz5Utbu/dD
	Bcrhsr5/0y7R0lywBEitzRHoDoUqnP7wFAxdhb/SWWTdeALGqK+AMPnhyn8F6elxUgXnpoNh53Jc8
	MMupclqu5VK9ALv7dKfqCRROIJUeoswSZ7Dmz0+YKJ2rbKaY/e8d55cDp4xW1BQbjylf0ZG4d5U/m
	/R+t7Z5z5qsSJOIoe5rZT6RjXq0vX61MgzrCylrCz5M4AeoyGNaHR2NAKVa5yF++uuDW3Qn3+kO+x
	+UUj/SQdkhhLcqElMh+8ijorNTOuw3hFEAf4fpqrKn/XFdQ8iKgTtj74JsbgKtbOXz7uSyifoWVgp
	NdRkjP9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQhgK-0000000FLGU-0ctz;
	Thu, 26 Dec 2024 06:49:16 +0000
Received: from mail-m118217.qiye.163.com ([115.236.118.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQhRS-0000000FIiq-2LRS;
	Thu, 26 Dec 2024 06:33:56 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6dc5118e;
	Thu, 26 Dec 2024 14:33:49 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rfoss@kernel.org,
	vkoul@kernel.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	l.stach@pengutronix.de,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	algea.cao@rock-chips.com,
	kever.yang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 12/17] drm/rockchip: analogix_dp: Add support to get panel from the DP AUX bus
Date: Thu, 26 Dec 2024 14:33:08 +0800
Message-Id: <20241226063313.3267515-13-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226063313.3267515-1-damon.ding@rock-chips.com>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5CH1ZDHh9DQx8fHkkeSk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9401abe3b803a3kunm6dc5118e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mhw6EQw5HTIRDExJGTlPKjMw
	GDYaCz9VSlVKTEhOSkJPQ0hKTUlPVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFIQ0lJNwY+
DKIM-Signature: a=rsa-sha256;
	b=Im+/rkMwRqQik7N1xnDlc4CKYx78M8oNhVh2V/CQE7F4tuib4NbnVTWykp6Rp2XhkI15Wx1QW+XyowRmwZbO5lyc4Z5EtZn5LCjtn8D4g/zNgDay7irHNAjAf6AfdLkd3rmkRzpvqEFc02hqERg9YnD+Gn41KerB+m9FdNtyHMw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Os1l8vXNpaWFvpC0USZiZpP04fKmY9GbZF77YM2zyNE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_223354_859314_926FA185 
X-CRM114-Status: GOOD (  17.17  )
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

Move drm_of_find_panel_or_bridge() a little later and combine it with
component_add() into a new function rockchip_dp_link_panel(). The function
will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
aiding to support for obtaining the eDP panel via the DP AUX bus.

If failed to get the panel from the DP AUX bus, it will then try the other
way to get panel information through the platform bus.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Use done_probing() to call drm_of_find_panel_or_bridge() and
  component_add() when getting panel from the DP AUX bus
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 48 +++++++++++++++----
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 256a0fd715e9..5381fb19e763 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -21,6 +21,7 @@
 #include <video/of_videomode.h>
 #include <video/videomode.h>
 
+#include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -91,6 +92,11 @@ static struct rockchip_dp_device *pdata_encoder_to_dp(struct analogix_dp_plat_da
 	return container_of(plat_data, struct rockchip_dp_device, plat_data);
 }
 
+static struct analogix_dp_plat_data *aux_to_pdata(struct drm_dp_aux *aux)
+{
+	return container_of(aux, struct analogix_dp_plat_data, aux);
+}
+
 static int rockchip_grf_write(struct regmap *grf, u32 reg, u32 mask, u32 val)
 {
 	return regmap_write(grf, reg, (mask << 16) | (val & mask));
@@ -431,11 +437,28 @@ static const struct component_ops rockchip_dp_component_ops = {
 	.unbind = rockchip_dp_unbind,
 };
 
+static int rockchip_dp_link_panel(struct drm_dp_aux *aux)
+{
+	struct analogix_dp_plat_data *plat_data = aux_to_pdata(aux);
+	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
+	int ret;
+
+	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0, &plat_data->panel, NULL);
+	if (ret)
+		return ret;
+
+	ret = component_add(dp->dev, &rockchip_dp_component_ops);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
 static int rockchip_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct drm_dp_aux *aux;
 	const struct rockchip_dp_chip_data *dp_data;
-	struct drm_panel *panel = NULL;
 	struct rockchip_dp_device *dp;
 	struct resource *res;
 	int i;
@@ -445,10 +468,6 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	if (!dp_data)
 		return -ENODEV;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (ret < 0)
-		return ret;
-
 	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp)
 		return -ENOMEM;
@@ -472,7 +491,6 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 
 	dp->dev = dev;
 	dp->adp = ERR_PTR(-ENODEV);
-	dp->plat_data.panel = panel;
 	dp->plat_data.dev_type = dp->data->chip_type;
 	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
@@ -488,9 +506,21 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	if (IS_ERR(dp->adp))
 		return PTR_ERR(dp->adp);
 
-	ret = component_add(dev, &rockchip_dp_component_ops);
-	if (ret)
-		return ret;
+	aux = &dp->plat_data.aux;
+	aux->dev = dp->dev;
+	drm_dp_aux_init(aux);
+
+	ret = devm_of_dp_aux_populate_bus(aux, rockchip_dp_link_panel);
+	if (ret) {
+		if (ret != -ENODEV) {
+			DRM_DEV_ERROR(dev, "failed to populate aux bus : %d\n", ret);
+			return ret;
+		}
+
+		ret = rockchip_dp_link_panel(aux);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1


