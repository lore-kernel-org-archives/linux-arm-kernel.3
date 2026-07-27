Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28001C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 06:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RTzPafltaazrRSyLxjVEGPsM2NQMO3dAbcjHX9A5Js=; b=pfHlDdw7TV5lWA6ZTOD1wDSJYu
	Btd/dw+1cl6Mtbker0N/AxjM/Srj5i0VfCEHw4h2j8sTyW/xTCGC+i0IlIMDw2ZK4N2moqb9mRJIW
	EZt9vraSfL9znsTkPZXe2Rm2BjOlD6EZhURDZ715M6RnwC5EMdbY3aUQ2jqdR8/kETm9VDt0Kw31b
	KRoqMg1KFm9v9LdFQSSj5V7XHjyYCsTyxklgMktjuwBue1BeQE87MzqiXbWMkta8FZ7V3OKSw4zeX
	60DEcmNo64mqs/z/v2jwAe5B3g5FGlj4HG0PrbXCxDz6aPiU3cN3q3fSzS0FOBY3Dk4PEIqMtn3Uq
	TqqZ6Cpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woF5a-000000022xq-17h2;
	Mon, 27 Jul 2026 06:45:26 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woF5W-000000022tk-3HNf;
	Mon, 27 Jul 2026 06:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1785134680;
	bh=0RTzPafltaazrRSyLxjVEGPsM2NQMO3dAbcjHX9A5Js=;
	h=From:To:Subject:Date:Message-Id;
	b=r/TktP5Ld+WWTvzDRiuXCPNLWf+JdR6QK0wp/0dnFL9CQrdAdMTd6Kw8BeMozhRwh
	 DSPdNw4FyJ0StM/GmzXUJNYOKksRNa8Kj+aEiAySi8TRQL7Opc6LF+rThj45igCHCC
	 R0IQgQwGclgi8lU4p5ms73quIbtq62Xb1blQHJQA=
X-QQ-mid: esmtpgz10t1785134678t321df366
X-QQ-Originating-IP: FIo2NFa+CPIcguk3dsFKhKkZ+lavMf+1Wwj3ZSwK65s=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Jul 2026 14:44:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8511555732185011648
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 2/5] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Mon, 27 Jul 2026 14:44:05 +0800
Message-Id: <20260727064408.101-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260727064408.101-1-kernel@airkyi.com>
References: <20260727064408.101-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MCk7GSmjSGXyPd3ehGERA9Sl1gZ3M3YUxSO5kjYODANOGAHm1uS4S5FB
	OWE/XcM1LUekLlnY8cnEg8yjQ6/QP/POJDPaCwsM+ABDrhj8jYRcgKSouCdaIXxtY9LdsTq
	fxfZSZV9BzOCLdofCV4nSU6xxGOkiAnJvkIiKh/YhukpdjSGvKDCSZu2xGBnwElby25Y/OC
	lYkhVrsncDNGx5G6K+CNbqN43vzRHd1vvTV7qTlI8rbo4NBFSsmbDw8lfL2PiKzFXFk0On/
	cplEWxADW0n/gAAQDGu95EHaCS4gsoRhL/HkG/6qkqQZsMGowdSgS2HfJCaMT9uZFzflZ3e
	nIDOqazePhi6lO+p4x91oUviuMcyY2ejkLDYgwveKAtozkGCZ7fnr7QXYL6LVbeFqibWCov
	iH6fFDOU2gpxkPPBvwwvgvZqaSpUQLmqpMf3sJ0PhMkKxSuZC3KgbsriIPVEVv5Ik7BdA8i
	RtLhLS8TBLws1ctOft1MkhRKqd1+y+B82cz/x5JzGE/E/Ic3DXyi9m9wUOM6wSTOL2gXmpX
	X7UCdM50A8yUB0N1LC6Tq2G9k53DHAgOHtZ39hLwBM6q6W86eDVhB7ZV9VcB0FhOHcSOAb8
	39YvEx1W0RXmH/7MXPguQHkxqsRRMxkzgJQx8QwL5576rIAMJOJ8cLtG6W9wGPlPYRCjkjE
	CCHFnMrxeRN0UCXsxteQxq2nla+7aoXtyv03bqO/M2V2P3WXjpeV2B2ikXMefbsNO86kJMg
	LwPWTn7UCm8Z6mevCoGv17DfW6ApfEq5/9JT2phvYwNxDpX7YdFNdD9vkup6s4kMcbfJNXx
	8HRPCwr+aS+lQ+kqjN3qphHGQzg0SHeHvPAj7mEPD4qF0kB5dQ2rBxe4WJb7mF13JPu7eJI
	yGsTEAVtefjtzh2AidiWNaxk8wjkKOaUptU7669q5peWolQuL7WYRZYKhitQLZHVuzx1Wvz
	1PtSzvJCn/3xvLzgKBuPll5yW5eYk9YF5JkwIyoYIqbxqY3ktvJwcHONtynbFjCFvNI1wUd
	ExhQ1MsM5pfNb+bwSrA9C2ZtZ+hGIHU55hx48IaSh6vtQ43Pzz
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_234523_303126_DB32BB5D 
X-CRM114-Status: GOOD (  12.62  )
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

(no changes since v3)

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
2.53.0


