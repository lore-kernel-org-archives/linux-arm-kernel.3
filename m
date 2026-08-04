Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C516C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCH7wGS/DSGdpdibtHkqUSVfV1DZbBvdNwFnheuEGLk=; b=NEdz+EbpLd72Y5M1Po/y25q5tH
	wnuZKEq7+Jg66+PbJ+xhVDwE5sLcJhtlZmLPRPYz9/wd2J2fSsCx4JODDp+LRNvXpQperNy424BJG
	pfvwpLPG+IToyeEWkEQiJB8JSBUoGDGT/qXi9i5ZO8lFLvt2F2FhPUg31Eiar6VlAVoF6buAvvgda
	nVB9Kl73qo2HpD1ycANy53LMBmR5uSW83u4hJsJ31uy5Hc5rYgRilFo1tboEQm4r5fyCFhVJlh5UL
	iKFqZLERZ93zkyHSaeG6PyPRnp5IGAcXQpt3Nqk4xcBKAVWv76B10hH3PAZQ5ZmHEGhEdMgMDhJO6
	4tzGhoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Oq-00000001CtD-2EVU;
	Tue, 04 Aug 2026 07:17:20 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Om-00000001CY5-06lv;
	Tue, 04 Aug 2026 07:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1785827293;
	bh=cCH7wGS/DSGdpdibtHkqUSVfV1DZbBvdNwFnheuEGLk=;
	h=From:To:Subject:Date:Message-Id;
	b=KQZJ5Pmh0eSxyCjA9X/csEPDsMMPZTn6tr8++cHIbUj4gXUS7IkKSdN5dx3rEkChU
	 XRUWUmUtlaMk7QIXJ3xlz30xuU3sadWdIDIWTY/rueNYJ6+Kn92oq13++TL1k0bGWR
	 p2hTn0XdqrqzNV7MUEnivgokqIIYAzwJDXm5czDk=
X-QQ-mid: esmtpsz19t1785827291t2f650366
X-QQ-Originating-IP: lD7WTbZHcHLknq1JRmfmpGolqvDJokYAqkLsmcwlCn0=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 15:08:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11542142582255875228
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
Subject: [PATCH v6 4/7] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Tue,  4 Aug 2026 15:07:27 +0800
Message-Id: <20260804070730.68-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260804070730.68-1-kernel@airkyi.com>
References: <20260804070730.68-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MLQK/Qc97rZToCLy7YyvU2GUPmDEesZtlthLO/0cYoLEHiCsKmdvMzBu
	0EA2UYDpA2NPezIk/rE2VEn5x/XkG6RoVMcS+CgHMDo/0zP9zFFQqojUGOMM0CXQVW6Kr/4
	yQxr9N+ce86ldtQz15fz/awxwOrvcS+1gSmm6dgIrn3w/dozVvLMz9uWIdWY5SWsxxJzXE9
	J0mR6jSyMiL1/5vaMDgJ+0JycrZFm5QWCPWwXv+0X+wi/E/MvOrGfNHNnb42OxSSjnVrID6
	6l995JDGhUdZzdBnOYMrJ9HqKuPCPc8M3pkX82wT+2AZkpawj4y4zXYvWNFttTe9DIsJ/oo
	SShN+lRTagwWV4HmGtOXRjHdtXgiMhgll00T4hQokZbqr5CH2xuq+0mcu8D6YgD8ugnPWV0
	991415vR1SEF+aASP744gXaX2oI1i0r2CBkgEGUBETn3RQSkyhMiVqvwsmP9Qcv5iADo4sh
	NCt3vl4BUogQfmoI7ESIZTyg1HE3gwUOGRqGVWEEMZPt301aubj4woRNbLHcLRDu3LzXYPq
	/a1GDzU5i4iZK5nV+iJXvEidcXspbRX3FYSFO6u9KgxFV9mmG3hTuHwyExiXbtln3rEo+Wm
	a4Cd88FCjI4gu3IgvRnDYwHTBe5JqHxkMZvQ2Xeib4F1xCPuGWJZw/vhAU+t4NlvEoduON0
	xXqN/zZanbeKMB4Fzopn+g3Y7AUpcK1KqID9O3XI5j0IgTIMk7GIhb/yLXhXqUAA6bBaAzZ
	rHmehOlvvxXHuIpvFw42sunSpiK5XyhtZJMe3Iyj/5Cxdt/1yLZcPy8eNfB5eBt9S8rmUyC
	o4lbJOM5fA/Io25wbtaMm/MvPqXS49ACDYrGQsWWlTYGFjf1R5WKSllBN2PTXLGlf97udi0
	2lqhUQWtnFyAkQuUjpEDqIW975jXJ63ifXro4YeyYldyQgha1Wpnu1LdjAlojTSi8EU8fNI
	OmmbK2qYDh5+Pcacwjt0c56BibyZBwBKTvBn4Bf7D+IoQFkmucupgjzot0v97dDlF6SZdJ4
	fvTFtf6Y8UCghLSsRn
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_001717_338615_A267F435 
X-CRM114-Status: GOOD (  13.09  )
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
index cca07a8e2d45..67f74ed287d9 100644
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


