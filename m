Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5027CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2z4VxKDs/PdZygrKT0+7hbj3H+IMEjk3pxkj8X3h2NE=; b=HZTKbNzoQT5hvw3IScr2HxRxAE
	Wd+zn9Idt5Csh4+4ESurA1451sJ6y+em0yKjfwvzW7yDrTBZybLTeUX6NfpBe2JXQKUy5MZl+ZaIu
	Z/FmMQiVPYNZbMZP++eh6sZ3MTil/laexIp6HvNVCKnRr6yllWmRSIeCnuIviW9NVvKruyqu7VRQt
	65SQlyD/znpdPkng2yTwCwXtnqWQNdij5jh3f/gGXsjAo9fOlORmXdvG+yiss41yw0uRAiHtEx9Dz
	d75YzOyC28qodHIh61vRMdGEoBiCwnVFvk+6R40gfinwlzS1ZkGKB9LXZXtkoaKY90XMdEluNLs6Z
	FLja/8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3n2-0000000Ghpr-0sFd;
	Mon, 18 May 2026 19:38:12 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3mw-0000000Ghmb-3XMj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779133086; bh=2z4VxKDs/PdZygrKT0+7hbj3H+IMEjk3pxkj8X3h2NE=;
 b=ad8XU+PE+3MVu2S5bEr0pzGFwEfRTBZfILY4sp6nRD8Dw4QC66rMVYmqlJhGLs5jItuJvaOI1
 tMqgRaYvtVeE084JAphWQX4TBYJ6fOc4UPSSWQhSX/YeYU8jGsqlT3F/JqoS/JvTOzA0FDIz2Xp
 Kc2AvfRDjYpI/lJeAOzSd/8/yUqFXdC7g7PvDmOW4wBN2iJs3SuZmO2LnOCYYD/53sgYjS4DHEm
 teWO053jxd8AonHf8FPcB8nVYhjwOSdxZ6Xz15dACZwnS0P6m86hfZEIxzH8dkhr16qYm2Dc2mw
 XcfqTPOYZnrz4zcSwA0Ytr96ULskU2cN82fFUznblYcQ==
X-Forward-Email-ID: 6a0b6a96486b4b38b826f9ba
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 01/11] drm/rockchip: dw_hdmi: Use of_device_get_match_data() to get match data
Date: Mon, 18 May 2026 19:37:35 +0000
Message-ID: <20260518193748.2482823-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518193748.2482823-1-jonas@kwiboo.se>
References: <20260518193748.2482823-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_123806_878528_E41FB230 
X-CRM114-Status: GOOD (  11.34  )
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

Change to use of_device_get_match_data() to get match data prior to
allocating private data. All current entries in the of_device_id match
table provide match data, so no functional change is intended.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: No change
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 40df6d1be2bf..fd7cc1572a40 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -536,8 +536,8 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *np = dev_of_node(dev);
+	const struct dw_hdmi_plat_data *drv_data;
 	struct dw_hdmi_plat_data *plat_data;
-	const struct of_device_id *match;
 	struct drm_device *drm = data;
 	struct drm_encoder *encoder;
 	struct rockchip_hdmi *hdmi;
@@ -546,13 +546,16 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	if (!np)
 		return -ENODEV;
 
+	drv_data = of_device_get_match_data(dev);
+	if (!drv_data)
+		return -ENODEV;
+
 	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
 		return -ENOMEM;
 
-	match = of_match_node(dw_hdmi_rockchip_dt_ids, np);
-	plat_data = devm_kmemdup(&pdev->dev, match->data,
-					     sizeof(*plat_data), GFP_KERNEL);
+	plat_data = devm_kmemdup(&pdev->dev, drv_data,
+				 sizeof(*drv_data), GFP_KERNEL);
 	if (!plat_data)
 		return -ENOMEM;
 
-- 
2.54.0


