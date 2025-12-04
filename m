Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E23D1D862
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 06:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCoApW58uwU2PDY/YzjUBVlUXFHY8idxqTE/wHC6S8g=; b=XmG75vWO2ATd6Oe1S6PqtcfQw9
	VhwuZOKvoKh9Rscsjca+9u1kgngz3FdqNj4BxHKFakl5IL6gaULrGAZF0MQBbjeSbW+JDoMKef8B9
	HzZPsAaLjibrtOHCX/U4n9QeOlDYpwd/i89QXyXpWgFYO/TFaKrGpmSNvArRkUmEN0jXcXgECmRpU
	JxFLMYHsnhd+Exrbv3P4ghSVcv5INA52uoTGZGpCr1TbFu+rqX/fLXEf517Vj8991ZXt5mASwYIDw
	fKGs3R96cAXoFPrInkbX+HiL7WUaQnbKw6foeOR8tmcN55+TAXJgnxE5HpQv9+//tNA3D3Wxz6G8Q
	7cUH/r6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR2tG-00000007YMi-2fek;
	Thu, 04 Dec 2025 06:32:34 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR2t9-00000007Y3i-3ani;
	Thu, 04 Dec 2025 06:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764829899;
	bh=RCoApW58uwU2PDY/YzjUBVlUXFHY8idxqTE/wHC6S8g=;
	h=From:To:Subject:Date:Message-Id;
	b=qNccVOBWQol9V0edeDUVs3mW4awCJD66okSBs7bqqfk5ToVoDZJ+iUwmmQIfTbG6v
	 y6qVynSsDhTkJI3wwvvtDVm7BE0Ufvxt9da+PEO6s2jNqhvZZH6ZgSjAtoq/f0C+cy
	 4xMDE2sovdIN5fvcIHnNeOg1YzXT9lNfpTB1Lq7E=
X-QQ-mid: esmtpsz21t1764829897t315fc6bd
X-QQ-Originating-IP: 8xj2EBC2OrSdr2vMc6zndzxvKdFt5qIneZrq+PewvGw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Dec 2025 14:31:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17481815092374181840
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
Subject: [RESEND PATCH v11 04/11] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Thu,  4 Dec 2025 14:31:02 +0800
Message-Id: <20251204063109.104-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NEaes6yu2o+mFnx7+1TQr1UIMOVJYmUAEUlrMPCY5/Zbw/99H7lxyqYu
	Xce7TznBk0lRFxNGP0ux3N0T1T/2pdorqz38OXY2cCSE57Q8ch+LwAXDVFDBl+nka4fF0o2
	xGBmFAspAqIGd+D6hAtd9H+KHBBCWxvdKlR8WuZSN/hn3Hu6C9YHV4iFToanKBtVaWPlCQP
	43WCjBlzIRIO2bJeHn6RMRXvxIdwISJRNOa/VVZWj+1JRr4RJIn/j+YWG5LXCTpyo7Mozo1
	3pJ1TZFx+ugPFitRGIzJr4scX8UOCNTd+f8LNK8BXt2n2bACqHCVMQ+UcManZ8bz0sgocmK
	yz+m45jrnUgzOW/HpCwtOb1toIsWVAIbThuL5Fbp80k+xzEseZKgUlM3fb5KcCLqLR+OUBT
	dfjRnbMwPK9LcKi41kzacuomV4nDgFR+HNwwIFezBgJIhMkmxslVMFwONsourpIGPjM2LEG
	MhpK8OQqxQIoU+D9HuJjpnpcqhiAP91xSiQZT2UrXn9wWqlzyoiV546fWeQW3eBYv6EY2ag
	gNae2800g7RPgcPD63rYFmK91zYj2fvQR/LmF+jXPal/lAQSftYYKRY4FQfJMwSKUzzTALN
	N4+jnFlUC8THnsAG9pJ2I+8AffwWbb62PcGNqCeEgVx36v+Cq8HsdlcwCzY5Rw4Jw48a4HT
	EVDUfx99QVkphKsuIxs+Sj3rSmVXpDCAQZLJ1Nfyw1PD+FGIWhWM6XZ+CzHifnC/jCjXO9S
	j/QhC7ivdH45pvPBu//Rl09gfI04Wyd8V83NRTiNW8x+uh+qlgHEXnwT6+jIAuKRKPYnYUQ
	51ZdUPRKSjVgEB4lTQOq6o1Dfw+KBGbAljoT47zAXXvSnHczyYVTM7Sdu/fqZer6Fo7sm/I
	0uIaaHbMFzhXmxdBkLVquWipPDV4yZH7+/z9qEAN0uwUEAB7Lmkfx0XdNZwHqNP4Q0kPyB1
	i3s3MdETs7VaPVr3dAaQMx1y99EdDiajA+0RwIYxlWEcWmhxEgi4J+uL7GmL/s/1yBr1yTX
	OdN02r0g==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_223228_414495_B67BEBFB 
X-CRM114-Status: GOOD (  14.17  )
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


