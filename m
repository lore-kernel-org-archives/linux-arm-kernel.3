Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D35EB7EAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZqODQ5igOoBvPuYVh0rP+EhPppD6n2yhjb+6z4KnfU=; b=D8brN2b8by/wbW4pc4T0zBa9xc
	5ljkjwc5qfdtvzyMjhAMR3RwETT7I4Pu5EXM/VKYQdRVMstIg4+hH92WQ2njlVUKYfUDQP7iIAWQU
	ktMLmoOgJVfH9yN9YineWrKZuMof0SiMlUVAetSZ9fl+rVLRGBBvHpkPTnhvXNQzTIT8QhzuBApyJ
	ikT6EiVoNyE9M1huOB00t6QA7cIPyjFGQTO29PtFtDxQR1En/OIZyetvqG4vwFMPC2Cswf8EB8uck
	Pk5yyb0hqsXpL2aqnJ85K6Qh5nYUbGuNNvRR/YmJuAQ2BWT2tDEF3RdsBLCCEJ4h2o10dRlHaDr3F
	4WyQKK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxilR-0000000GuJP-0eaa;
	Wed, 04 Mar 2026 09:43:33 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxilM-0000000Gu60-0tPx;
	Wed, 04 Mar 2026 09:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1772617347;
	bh=5ZqODQ5igOoBvPuYVh0rP+EhPppD6n2yhjb+6z4KnfU=;
	h=From:To:Subject:Date:Message-Id;
	b=Vzsxq4KuXUbXSAnhobw/2VOpLWRuzM98tumz0p9X4+waz8DahHPJRan3/4vqsWe72
	 ZrKOwxqcqX++fVjVNeR0xKRQsae+ZJ0a9aQA8HGRCDaUmzqKlwiSoJE0goJD5r2IQU
	 wsgInzr9wfYXKD1PviR7HRWwlBpMklrSy2U9PM3M=
X-QQ-mid: esmtpsz11t1772617338t1377ad40
X-QQ-Originating-IP: TVSsyvFPJR3CK9AhnwxsVI5EXsHFH6ieIOaCvs3ObxQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 17:42:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 414767912473398163
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
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Hugh Cole-Baker <sigmaris@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v15 2/9] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Wed,  4 Mar 2026 17:41:45 +0800
Message-Id: <20260304094152.92-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260304094152.92-1-kernel@airkyi.com>
References: <20260304094152.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OfLSn26BfcxeYacFTe4jBqXt6m4gTgGBfIg51iJ+ovRztGVNbIHq01FC
	PdJPF/Wr/o21vCkgRLwNH4rWZy2dT7Mbl29GZTYKIb4DxJvx/FgymM/adofSC3qDBoym/t5
	Srpv4wsVOSc1JC6dmrYwtdbiEXQMlZtF0lTMmXlHnGxG9daEnNCnwzqKJ4oHC9g5aEBpVxx
	PAiWgEFzfaN0+lwC6HF9cE+zyVAbaSA3HPW2rwMUc77W1Fgfb/ahh4erDaCYJVGCkPc5xKg
	cwkniU761t00k49RuG7kwsBZOV5QcsKuB/LhdoWUI0eosyBPtPuneBWo621N5d67E2sbAGt
	BgvD2/M5SPwlMTIc0+6+23MYQj6rdO8Z0otXl/BE4QDPQHoDogowimVJgreERObCevMD8jq
	ifLMFGuL+4Bia/gunv+1MsGoVX+o4yoYtUg5ekpoNm/IthRo81hEzz1qXX0MzGDupu8z5fN
	pGEM9mmPWPvVOk93wjDqDyST7yNCI/6rcFR9JbopYA+x/kPhzPj6xcB8bv41a12bln4pk2r
	70/2WN+oXB6CMn8DCk/z+WKWw4gWfkAcO+0bVOJvKzL3qM91mV9bC+qynWQHfRb85Um/r6/
	3jf/NE3QlOQfCUrwOWmactMIz7UHKLBh07pBkSBtNLccGkqkhYPUypWmaNP9hgduSR8WnWU
	nXni8Kbb9lEFBGYi75uJBhrU6bIkssuwh5c0NOXMqIycB3GJ9GOqZ6P6QqllNnIdLFppak4
	cGRU/+VOSb0oYR8aOll3nRQlPyp/E0KTUVmm4tSA0wWIdSK3BvRr6H/uqysp4QNvN4BzI1J
	drfkbQdBqWbbhh3yN2FXFBu0JCfu8FEjdGjPv3UgoQYk41AS0PGszJds2ZpPyGZfkDpRJBe
	wI4Z9OpfLajZaK5f1aN8JLes5DHJrJZHPJF6NAmhYmTkYfXYMCxoU88KyAafj2nJ7luNJmF
	p4zWhwkCgT9KAfVsvtHeLmEJrG+uSruu0D+J7WHVJfzWE0kuyYKUVe/9iL/K1qQThBuPija
	snb8Jo7r3MxoMl5yIhKd5YHcXvZOkFxHJ1Mmd0ew==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_014328_540845_3317C91B 
X-CRM114-Status: GOOD (  14.56  )
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


