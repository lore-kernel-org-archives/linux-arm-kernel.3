Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83BCD3B7E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 01:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCoApW58uwU2PDY/YzjUBVlUXFHY8idxqTE/wHC6S8g=; b=QjkrOH6v6uIlUPoTvXzxpkJMp+
	bLu8mikRzO7u0a5Qh7ryQ1/MFDsZWPk9mZxLHSflGNHtbkVZWXe5xUjoibMxERGHEmYmGPESJdMu5
	1j45ERevCbBXf/gccfe2GncBYpqH41SkuiF0Lxtg8dNfG0DCjC9nusa3AAgWjwjkarAJBScCy15hH
	Ix1yHoCbXR7/RJF0OTFuiUxtkfNpsIVYf3TQEcvNGpdVfmKlm81JgVdQHirAVzFUmZEOd9+4biLbd
	CKuLNa3elmrJjuN/m1rfdDTe5sXl+VCm+wtBrdtvAtX6nv83RZf2oDKdAFZfaMPRsqzRWCHuaaLaP
	K1/afiMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQUD-0000000CQ2A-3QRa;
	Mon, 08 Dec 2025 01:56:25 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQU4-0000000CPmD-2O0e;
	Mon, 08 Dec 2025 01:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1765158930;
	bh=RCoApW58uwU2PDY/YzjUBVlUXFHY8idxqTE/wHC6S8g=;
	h=From:To:Subject:Date:Message-Id;
	b=lyRPzx08NxIJiY9L6U9EipOSloT79349AJAORhsq9lppMlqtzGAlwRvEnJh0+h6bY
	 Zf9yQQrFybvkSQ2+uC0ko1yF/l1DoTcABWqFPjWWgstcds052UNrsrQp+wlSTAuYOp
	 ZlTC3YtAu9CV2BUfk5azFNOfZI/Nblq3WXmoESy4=
X-QQ-mid: esmtpsz19t1765158928te5f51995
X-QQ-Originating-IP: kcxCGZPPcU96TfidxkPp4h6SAeMB0/ABmBp+GsBCCJo=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Dec 2025 09:55:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12888051069085088122
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
Subject: [PATCH v13 04/11] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Mon,  8 Dec 2025 09:54:53 +0800
Message-Id: <20251208015500.94-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MSDmV4hBxmsCMpUywsvd98UaZ1bNa4t2SGWzvSler2Pq4GG3N9QLrSRb
	ZidqbH3qpUclqdVmjtmfnnYdmSDZXoImK9UDP1WEifLW1AgWmmi9jvj7TnmZIFoHK9aMIdb
	FcQqOiqJJpI15xlvZhn6m8wCzcslIGbZlv3j/7/EGHS6ku+oPhKLsase0QzJwbyp3fX2yTz
	MHGBnMbxf6wWAGhZgfXmtQ/7WeHRybWMEZUjb9PGJ0d5p5aIK8YYcA1UZQC6zd7gSQQ5ijB
	1cqVSY7/bz+n+W4MGXcd/6KBw4wLBPqWAJknw5BKwifOuBLv51YeSyozv+8Nk+TfwP5I+ot
	IH8kbmyqo5tfYv780YksB6eVaYW2rtSju0VmsZKHmBQX/BEziOsQztxtgYokAnExG2Uqal+
	RsyfSsyIWI+UNTk5jZ3XN6YDrZYMgp/cWasLqsrdhn/j5mAsMgd5MApNXyx1v5lyqBe6CuA
	GT9Y51IsPdT0rJKpJle4iuwyUbH3Aio+Rw8E7yMzrYtz8gp6we8WLllAHKqUUTom28sBiY3
	JymjAb8P8ROjyOG5DdwUzBA1YgtepnXXsWI6f7rzFSuM9iRBoCnbccykboDzD6QUAlRYgUm
	0XlMdTTodEXhaUUn60fqgI2Q2GRljkSXQYX6Pf4pj/rPID3wz5aB7q+3fQl3rYoiKIBOcrg
	pi3kfT96Jm+v/LsloeJfHXLQ1241S3L3WHf6s+X6VEEZW2cWqcg27OFNRP+UDNdHR/CaOGE
	HXptvYj/eChqxyZO7VrEHCjouKiG6iE5eAxyRGir4MkgxFsuy+Vb+MZT4mw93ahmowK5y4M
	9MpAvIa3cmzx2VS4f7csEk1AmS973UAjaD5GAetiPbVtxoz5n7E5b2MiANHinv9DhQNjA97
	DGZiJJVKFUQbGBm6XU986Ff0YFJ7QuperqW0sI/XxHZ2oyfWeit/2fwuzG67J57HRJf9neV
	Dt9GJYxcYt1Jeqeyq5qzUT84PkarkpcEN4wmOt/7EwlJ7KwZo+eTxQA+V6Kw0KG49P3WePI
	AIglmM4Btmeiwg8u7V02Ygii928bk=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_175617_122704_D109FEAB 
X-CRM114-Status: GOOD (  13.95  )
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


