Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4288CCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 07:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tLWoBW2pFlmOerPRepxyKMqbCkBEey+ItacdvxIb0w=; b=S4BaEUi7sHDTSvFYWg/8NJSGsn
	+lXAAGuHFUO5SE9ABczhMAAPLj1tAaigO1/mdxolXUb2ro2hSNe5qPMrA1yHYgO3zPPy1u4qcbzuI
	Fwi81yzJ80gGDl1Bhw11suTdmPQSpPDghVdS27VTe+aPJdBSwPxQHyibvkgFKS6UUqbOo39JNANmN
	vlaei3ju5h5HEqcCo+ovbfR3ZKRrL3gizyi75M+v8rNrXg7IySL+YffG7ybRKxXtEDlUx+bvqLBaF
	GKWeHlUCMSn5n+AVxralxChYw7wp+Vg6yQjcYtr8QRwpZopoQsVl4K9SUgKX+AkYkLeE87cjXYYic
	Sup6tNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWU79-00000002x95-026s;
	Mon, 08 Jun 2026 07:09:39 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWU75-00000002x0y-2iY7;
	Mon, 08 Jun 2026 07:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1780902510;
	bh=6tLWoBW2pFlmOerPRepxyKMqbCkBEey+ItacdvxIb0w=;
	h=From:To:Subject:Date:Message-Id;
	b=r7qRluiYS2pzXJH25kGNxUuZX5htgXO/v5lzWYW/d7i9muUUnfYJMpEv+qNvgQEBz
	 GjFv7JbGVfRho3XlggEkfXziCzEgkMV+ZcLp7FN4dCrhmvXxRjKCvSg5HuvjfmbZRj
	 dGwEsXIE7tXG5IHEonbbUJOtHp4MZvK0qyJG1Ryg=
X-QQ-mid: esmtpsz10t1780902508t7749e501
X-QQ-Originating-IP: 0Qz1Oiv8vXDmyy1J7m5t4cou6ezju/IsoBdbZ45NzL0=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Jun 2026 15:08:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5642729304613398450
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 2/5] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Mon,  8 Jun 2026 15:08:02 +0800
Message-Id: <20260608070805.88-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260608070805.88-1-kernel@airkyi.com>
References: <20260608070805.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Nv1Zs1ssfOILRzUKkP2lSR32/Ex3EAH9CzrbsS5uvf62yE6i1Gaj6HaI
	TMKGEI7SIGqlW5cZLATBPniSEiqN10GRku3XByQ/pZfb2NmUbyN4ldmg3jndQOfBIqzqQud
	syFDmwYZU0t+jssqMFJBUsC7Bz0LPVWNE7NRpaSU8s+j4ERSDMecRJIDO+ThcokQaPvuQi4
	Ku9jQkQVBiKXtq+kfW8kacu3pbE7HBJ3dv4qdDDpy4B2jbW+UITZAI2C8k8nekDY9l5VDxS
	9YPF3jbmkEGSWe6EBQEOQS4hkLNnXuX+SS08De2h0FSOB/819wybPFgeZeXNQoh2MLYVqdb
	v/mogitBSzvelx3uNeWMArGLuHQKgngLy1FAKIZ+DIiitLHALZS1aNZ7GWZwldXxsFCvifb
	ILSgpDzs5QYwZVCQF7LqVe4LZWtWQihhlmRiedXZtFGTRm726uFNxBpvLJiqJqKUzWMs9Yi
	UJKL7UFJLazNrluCydRB0iLcD7CfwvRTlvWj7vkjk65nYn0xczxNSwXYxcbwh1Stf4YsxOv
	+hYxzTtRTLYlKB9wUT4pVg02sGvEITkkG99f3tCVl+JIlxTMPczDh7MbAQgOTaJ2AC83bPH
	+lJZbDRFYnkjv9SheKVGg+G+QKxh+jm3XTnaJEUVU7x7rX8Baag4rP2BbqOZvQWSRAC4cU6
	fW9EiIZCpWSFn2INSiWfrDHkwrPdIWmimsY264Kv9hl+fONWADblfpbq7wT/NShWG063tKf
	iAD7iJdX909v7bWOgFRTxEMmQoYGwuxIi3lvuKeAuqqUJNw0aC1NJ497Z1iDXW+oBlHu7xf
	YKFtAOK3yPeHwk6bqMaYyFLpVAXPZBPiJiNgouX10UQirLwZigxxdjBoJSQWEL+Hg/VHl4D
	lSY7gM9WHcreE5fiTyClsagXsm4igDS920oz25wJWzVyNWpV6iBxVF4pxJE5o+AoTTJfnQK
	RCFgHYUWFmCEOB2TgVTyNUzB9jHHbDIfm5ZXpp8rn+G95m2VeXu3DR5nGTUScneFE1SFjA0
	PMRMNBeM3mawCWLkKPSE1bGzDAOSo=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_000936_188483_0DFA3650 
X-CRM114-Status: GOOD (  12.97  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The drm_aux_bridge_register() uses the device->of_node as the
bridge->of_node.

This patch adds drm_aux_bridge_register_from_node() to allow
specifying the of_node corresponding to the bridge.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Changes in v2:
- Fix incorrect function names in the documentation comments.

---
 drivers/gpu/drm/bridge/aux-bridge.c | 26 +++++++++++++++++++++++---
 include/drm/bridge/aux-bridge.h     |  6 ++++++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index 1ed21a8713bf..06a1466f49bd 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -33,8 +33,9 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
 }
 
 /**
- * drm_aux_bridge_register - Create a simple bridge device to link the chain
+ * drm_aux_bridge_register_from_node - Create a simple bridge device to link the chain
  * @parent: device instance providing this bridge
+ * @np: device node pointer corresponding to this bridge instance
  *
  * Creates a simple DRM bridge that doesn't implement any drm_bridge
  * operations. Such bridges merely fill a place in the bridge chain linking
@@ -42,7 +43,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
  *
  * Return: zero on success, negative error code on failure
  */
-int drm_aux_bridge_register(struct device *parent)
+int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
 {
 	struct auxiliary_device *adev;
 	int ret;
@@ -62,7 +63,10 @@ int drm_aux_bridge_register(struct device *parent)
 	adev->dev.parent = parent;
 	adev->dev.release = drm_aux_bridge_release;
 
-	device_set_of_node_from_dev(&adev->dev, parent);
+	if (np)
+		device_set_node(&adev->dev, of_fwnode_handle(np));
+	else
+		device_set_of_node_from_dev(&adev->dev, parent);
 
 	ret = auxiliary_device_init(adev);
 	if (ret) {
@@ -80,6 +84,22 @@ int drm_aux_bridge_register(struct device *parent)
 
 	return devm_add_action_or_reset(parent, drm_aux_bridge_unregister_adev, adev);
 }
+EXPORT_SYMBOL_GPL(drm_aux_bridge_register_from_node);
+
+/**
+ * drm_aux_bridge_register - Create a simple bridge device to link the chain
+ * @parent: device instance providing this bridge
+ *
+ * Creates a simple DRM bridge that doesn't implement any drm_bridge
+ * operations. Such bridges merely fill a place in the bridge chain linking
+ * surrounding DRM bridges.
+ *
+ * Return: zero on success, negative error code on failure
+ */
+int drm_aux_bridge_register(struct device *parent)
+{
+	return drm_aux_bridge_register_from_node(parent, NULL);
+}
 EXPORT_SYMBOL_GPL(drm_aux_bridge_register);
 
 struct drm_aux_bridge_data {
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..7dd1f17a1354 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -13,11 +13,17 @@ struct auxiliary_device;
 
 #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
 int drm_aux_bridge_register(struct device *parent);
+int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np);
 #else
 static inline int drm_aux_bridge_register(struct device *parent)
 {
 	return 0;
 }
+
+static inline int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
+{
+	return 0;
+}
 #endif
 
 #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
-- 
2.54.0


