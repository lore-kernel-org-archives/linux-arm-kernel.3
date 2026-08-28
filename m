Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73B3C61DD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 08:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyMGZMKc5y1SgmgDY/tsuzKbkVlmYjdT8Q636L6W9/0=; b=SZ2Nif+eCXWbKq2jCaIcR2Wdf7
	LI7UUpgtXq9ZcPQ3ckfz3HEL15gXfYCVlbB+cgX6xADvTAKSdfomN2c4fNf/TkYywcpzNqwXNTR7U
	nwbN3SvEWp6eiL0RyB+FB19ZAODiQQqAklIujhoNA9kiaOgC/9EUne1x+Fs1NfLhn/+aMxlVYoh+J
	LaYikVBErr1Zf1GX89ck4XJoPB7xI3zG1KMrG2tcaif6Q1aqBZq2IdfGntnMxw8iqaOSpymxvQ9/8
	Ne54jB8DxoqtHJLtsgLKiYdbLTcatAIZOjkXqjdyH6frrhSddvYTlBJOC/zu7uuaYHIyodP3AXq2f
	v8HT/8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsH4-00000005LXz-1m27;
	Fri, 28 Aug 2026 08:49:23 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsH0-00000005LJ5-1VPa;
	Fri, 28 Aug 2026 08:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1787906892;
	bh=uyMGZMKc5y1SgmgDY/tsuzKbkVlmYjdT8Q636L6W9/0=;
	h=From:To:Subject:Date:Message-Id;
	b=b8ePwLWcWOI+xkIw62G815/sIHuDwlzG+vJi5gr+zMYBTdgS7p1q+N6ebgu8dBQYl
	 m3ZF0Cx/kFC3PoNRVWupDibx1mkbEe5bnmTlwfEisqgUeIcSV8MNFh5JQip+cGZFu7
	 vA+JPQyxfO6bMh19id16ZkYHl1c3kKUWcu6uHMuU=
X-QQ-mid: zesmtpgz6t1787906891t1bc82087
X-QQ-Originating-IP: OxvB8j0RZYuReQ0OYIUUtJayIysb859IsfVqPvUZV9Q=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Aug 2026 16:48:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7758792601423077606
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
Subject: [PATCH v7 4/7] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Fri, 28 Aug 2026 16:47:34 +0800
Message-Id: <20260828084737.565-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260828084737.565-1-kernel@airkyi.com>
References: <20260828084737.565-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MmpliBmRb3iCtRt0VXlV8wcWI2CMwokakifYw3R+ZOuAacwlJ5sp6eJO
	sxtYZu/0Ve+vJOsU1YRlwIfSQEp18Thb/WaemH1ITxkAOIVF0CDOmFQoU9V0OaC3CbkHx5R
	WUjN0RyeFNaGMhVCrxQ7R7SaFchrJZGt5MIUNXV8eSd+hH4DOCQvNXdFgxfEoV0LWVuNejI
	2UjhGXzPtT0ptL3zJOxtWtZBZ2ZWbUmhqVrhBDwdFzaJslSXff3huDhcPMf4W1QpXO498Tb
	njDI4rvDAr/U9XRoCKWr/uLZ+vCQB42L//AStKcIS14x58ONvxFwmpHB427AWVNqePuf4iF
	Fw5vtHfKNONN68fQp2DmX/9qCXv6dBDJNjCDPBRWszyy23gGBzHah0YVHAoGscRyz1aaSou
	TfTZ6IHF0hq4ZaerOSfVuqFjpCeQ26xu9u5GbAVYndSU92q/kW1/qnbMiWVSUeBJWsJvp+A
	cL/a7rN6y8brW65jLP04ST65QE5XpkejlkRyyo+Nylm9sM2ZxWvMMqVf2a32s9FvMkNqldp
	WSJpZcrIA6YNaw4hd+NyNmcOYjM4hcG2hH5SyHehJsXltklX7cenuMMpsJdsT9/eKcC9VhW
	+P3HzvEzRCrmDuoU3FaBqXn1uAOIf0jjzk/y8YilfZxZS8RmRoLn/GPvBS/d52SUy2jFesN
	ZkR+a/hl0NIJJT/MoIqQkor3MwgYYQokSUgBCmJlkUlCMQASZjYXi7nUTEDg44AIAYUgAti
	o1p2Kxno9rRtotrpr4XJVJetEco47Hw3DojTrrVyeuX1U2NgnBUelUWSweOGwK6LffxK3Er
	T3QCm385kdd7LWGRFmCpkweDv2JeYnUlOGySZ5SKYlX/GLdu7jtl8bQPRn24X8Payl30ymr
	qmQgT68ywW0N7T0WoLnA45UXQW8GysSbJSnlyrLt7K18rTPJ9XZVEA9XBJFkeL51RCYDQIH
	mPl16le263xuRdjDqfLip2BggZKjvJkAvl2uoMB0xLn/FSwJxBvwj3Zim4Idgg2pMn9acmQ
	Zfxmipfg==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_014919_192532_EC4A3114 
X-CRM114-Status: GOOD (  12.89  )
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


