Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE1BD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 02:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCoApW58uwU2PDY/YzjUBVlUXFHY8idxqTE/wHC6S8g=; b=RBK4zkJ+AjkeYzNsr264pIcWYZ
	HgMEu9eCrT1AALJgXUGbSEglx1j1Zohads7BRnvYViUVOkUC71uERxnvWOnEnhEZIjAn/zOXkXz19
	5JByC4P+r28SxxNuFxX0kEzioN7SsRUHSCGzzJmGSPPYteAh+kTC0V83WQC/OASAG7gXBhGqgwLM7
	A+g3ENIaoXJU54BKg+Gryb25tXgP3EldFut0wDxbQAnqtktik5m0PcuaaP3rSX0c6o4VMNaU3PmrG
	nVyJQShU0NwnyzRVUBdl78LERPTyxqub4LLK7FzsD0/XBnD9LlkqvSOGWry4FJ046puR2gqFpEXk/
	8L9qMsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOnrO-0000000HQNF-2zch;
	Fri, 28 Nov 2025 02:05:22 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOnrH-0000000HQHD-0v1y;
	Fri, 28 Nov 2025 02:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764295476;
	bh=RCoApW58uwU2PDY/YzjUBVlUXFHY8idxqTE/wHC6S8g=;
	h=From:To:Subject:Date:Message-Id;
	b=IiAcSoL+ECKV6G43frznHLzzPn75lrL5f+CSmPRun6ruQ5bbeCy36dgfqWJGJWS9J
	 RL2Fr/MnGpuSYTct7pYh+OvvI2r5pALq2ptcbA7TtS411KFC++ZoaH6m5Qad8OFfuI
	 a6Py5Fcxw0SMMx8/oJ+38ehiw7spKcuASEYacfCw=
X-QQ-mid: esmtpsz21t1764295474t610ed2eb
X-QQ-Originating-IP: a0Nr6+ZqhJCmPQSe6ZFRf7bn96AF2PAOgvJ0/UNngjg=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 10:04:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13829267849716627158
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
Subject: [PATCH v11 04/11] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Fri, 28 Nov 2025 10:03:58 +0800
Message-Id: <20251128020405.90-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NwIPvWX4YDag8UycWFq5uLgZI1HbV0W9xLqdzXsji7a3ZxzgSAhH8Ixs
	WWs21PRvymZscoq9r7uznVbaj0J+lz5oPr1dDm8PWm09jftsTYNMfq51xeeHUrJlmMaLP4o
	ViHpeb6qHCwjBGs0CHdUjGAX7XJmOnc27pNWms0Wu//D9UJBaDDMQaUltLFO2GDmxTkez3s
	hX0tN72kSpgnhuiIKUBUertv7z+uSTUbjyF7/tJtfoP9zfldlVi9wxZVwxn3EXxrbAWiKi4
	ZwemUjpVRadNni4b8nlnwcqrfSlvv3olOmhBx56C6twgV+MXQZ52DXDREInuAD4KYpkOOVn
	Fz35NC8demhD07PQh9IJkphxnpwxTmH48VkPNWnyfg8RJG927CnMrU7m5/OpXxPQqqFts1x
	gLR96B7lYDzGawbd8VdQEZdkCVODdKS9twpFc77qHZm077KM0IysqBsxKkYpGXAJW87Np31
	+J3DtvYHD5AMeJnYnLx8zbBY6KzbbcgabKxJCkywfqPi1VLo88jgKfABjp0RCgHfDVh4sQ5
	3dtW17OGeKoY3NAQMZhnI6RLR7z2ya48Bx8O+dviEGp67H7DttFSnT3q3FCwCpXs4kALQjc
	wbra8ZK3MUZCTtaiYvn2AjU9PFEzSS22J5L6OkS7tUZitRX81xJljZo5GWGeDwMGUr7x7zu
	1FfDD5LUCFD3vZS1vA8d4mrKSNf7OC77Kr+M1tVsPvW6UDi8LPycOGnIXJvpJ7fC9LjMf+T
	D5eX5F6sjSSfnwuje/4EAQoZGhiQ/vqK88KXiIgSF2eD2pvKHTG0pwtdStzWYp+Yoiz7riK
	a0CjZc+Z3gSaUQFy9aOoV1sYN2oXAe9tlTSJkjc7mL2k2LlpQ9TWXhoHyOBwcHoFd2VALsm
	klLq4yTSnm+f5DRJTblAVsd1d1eNT1jeAOv/+TpFL9JM8GVFLHxDGJanKMQX+es0w1+prCc
	4NyiUQNnJn8rcBdHwZKwW8dWJIdR7krRTvpQImOhCM0SD+U4uyZH/+/PuGWlzVKd1Wdgr7B
	yW8G70sg==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_180515_644075_607D38C1 
X-CRM114-Status: GOOD (  13.75  )
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
---

(no changes since v11)

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


