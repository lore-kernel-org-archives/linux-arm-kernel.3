Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B36CF64A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 02:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Rmi+Q4GF/407K6ZniEsrCCllkX24Iw13eXk+RLRPJY=; b=MH5HIOtxMU8+MMa7Ai0cKOYaSe
	cGGmeTcq6XnJVQMXiteTLyp//pPPKn7orDJNYF0EdB4USL4LlrIXskvmfos/xo/RWBN+hgf/pT8At
	T6Uja2NImP03Lc4JrGUMoJuFF3Cs4jJLo2AD/FkFJYoW5F96YTXaclJwUg+7P7r4YmoeUOfS4BCNw
	ufyptRa0BWa6TMqYnJFZu+491/0nOswGWm5+gLkzbFnwxNlklB87xn4AUhHKcBsMheijqtSZJN8rc
	GactL4QwXO5E2G4kODxpb+DIu8uAQn/li/oi2jAmwc1wNyx1qZzA4G37lKLSR38Vlg0UCg9/WqbKt
	WZx4Yw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuMW-00000005yy9-0doj;
	Thu, 20 Nov 2025 02:25:32 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuMI-00000005yPT-0QYC;
	Thu, 20 Nov 2025 02:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605451;
	bh=1Rmi+Q4GF/407K6ZniEsrCCllkX24Iw13eXk+RLRPJY=;
	h=From:To:Subject:Date:Message-Id;
	b=OCMh1Fam7FMPSlW8owe27PCQ47Oqcai70Y99DaW+E7esDkouNEK4qY8+tI7VBRS0y
	 yp1R7K8zrC1c7e/RSXklqiO5RcJDKdryXT7O4KlGpwYl7Me+3P42wybmNyTydlI+kc
	 /UG7yUxtonk1dA5NBA+VQ36qlrGBhb0WBxZkhRO0=
X-QQ-mid: zesmtpsz5t1763605449te09995bd
X-QQ-Originating-IP: SlP6sV3u7ks5xAuCRdbslt/D/tIaAhTCdFu9YZVAHsA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:24:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14872000006937239510
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v10 04/11] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Thu, 20 Nov 2025 10:23:36 +0800
Message-Id: <20251120022343.250-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MLP81OimLGh20QDXaXrfxtGplufxTmC+fQn1pxCV3Q29uRbVdgZ9V7KT
	AFdVvCDBF8jIugj+SxnqUx5EYsRxJ7uNi9Xz2Z2wWF+QVBMfJGwWI+D2LV5y9ReCluxKO6D
	nV5VEddGiKA7CbU1yLW8dMbUf5JgnD/XPSATpo7ieCeciesO7rKeGOpNea7iTqqPMXaBHqi
	jqzi6cpJ5sR9jujoen6jo3fdfqMC5FtJB21Mgu340eK6XM0w2XPS2/T5qiG19LD8rW8+bjX
	jiZ+LzeMJpyIfTX/Y1Syw6c6Zg8hoDXkdnKIlHapvmo8nrEs1DGZuyZhkC4eCEXPwo8P16Z
	XCkpVs68IAj6P180sK/b+8cvUFbSdNWpEEFH0BxoCfSFpL6lwHJTXi7RDXAC0/J2tAc6uh1
	x+nH2L5fwC4veWl/XappmWcbOr+LnNjDYJgHkuYXKy0SMe0UoHhE2R+XEPZ3+u42Zb4lPnM
	kuNhwti6shAOJZwKGT44MBz78YcwXj1ccD5fQEkUPo7tZ64PvhaFyX/Y/a06j6w58H5cqhv
	dc/boz2VhxMCbaSYXb1edMcwic3leAxqKeEjW7YlvTUt8tg1er1ppKvoUy0ntUwyv36EjOH
	h3rIpAUGXIdvbHhknpzQG5PfzmX8bcoH0g+vC8njkLKYPFRLJ9XyDgW7BbrtEnSWtHwDHc2
	8Paq4QV6cgN1k+fa2DO5TMeyouYf1ltvX2IucTf4kA24LzvCJ7D5BfRSnZZOHAmPX1ugiRx
	QDSiACa+9FEcE+uGoqu4VuuFi1fmNsgPge7CUHyXGZPTknOlxqgUjdqhJPOW2i6xtPLEy58
	qcAIPiNBSzMbrl7FURJYPsTfyiZeGT5tn065kFSKrFYrMBwHXluQXrqczHK8nUxrf6Meiyh
	AIVyYu6Zmm39dXnd6aflsuOD+naH1DBdgw3yg0hiA2tdN7tLTwGToieDJEwZGCE0VPKXVwz
	vPLM51hpmrm2aZ5UYrOI/KeWXZtZqn/iiv2GkSuDvhKxlNDTzCRN953e06Ys6OvM1yRGD5Z
	dvzaJQemyLbjseulxG
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_182518_809260_DF08DD93 
X-CRM114-Status: GOOD (  14.05  )
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
---
 drivers/gpu/drm/bridge/aux-bridge.c | 24 ++++++++++++++++++++++--
 include/drm/bridge/aux-bridge.h     |  6 ++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index b3e4cdff61d6..52dff4601c2d 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -35,6 +35,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
 /**
  * drm_aux_bridge_register - Create a simple bridge device to link the chain
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
2.51.1


