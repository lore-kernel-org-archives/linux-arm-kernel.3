Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063B8C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amLbFrLgaWKdM6iuB7UHZh23ZJ9tGg/UXF/7lGM7lOI=; b=X24tvzKPUmcSftMJiPl3j2Ezvp
	cd4KQRuSUClY5yjBto5P6QTQyh2ynpqWjA1jsdcWU7eO8LShl5Yg3jBlk1XDuW21vUxjkdI8AMUQc
	NJ+KuEwBEGyr0SiQMPWe47q36pz2YggaMqMDsG4b2x1eyX05cErqVEtwyndScgbMqad34S7agyJEa
	uLSPpeYzSFklGVH6gC37U6HTHRAwxrLgmX1z5MH+RyN9lhHPHoJDyomVeHIrWzcr3ksN0LHfRZFRe
	NtsigdR2J/hys25UF31nQ+PEeIw5pxLnQjio8opqRtFVbYdPlpnHGJIyzm04h1HdUn1Fm/zOmVCil
	P0CCQkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9OR-00000001CPa-0Zah;
	Tue, 04 Aug 2026 07:16:55 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9ON-00000001CLN-0XZ9;
	Tue, 04 Aug 2026 07:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1785827279;
	bh=amLbFrLgaWKdM6iuB7UHZh23ZJ9tGg/UXF/7lGM7lOI=;
	h=From:To:Subject:Date:Message-Id;
	b=ajVNQUJsNYtpWpHibBj68O0ZfvEmjTRva5PYVPrtXWMNocWW5etM29Xlj50ZaqJe1
	 aU/dY1xYvSwg1kwfguNlqkdnm4RSwCVQ/BhPY31wEC4dzTC/kUdiCqRhd6HWDXFKqf
	 UIpVsnE4kqwmRVzZHyzggezHo6jWzvdk2HdbS0cI=
X-QQ-mid: esmtpsz19t1785827277tf63c1686
X-QQ-Originating-IP: n7cCnMgNG0f8iJN7ZfLIqZBWbzE4V65U0d+YdsMycP4=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 15:07:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13234408375334642489
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
Subject: [PATCH v6 1/7] drm/bridge: aux-hpd-bridge: Add drm_dev_has_dp_hpd_bridge()
Date: Tue,  4 Aug 2026 15:07:24 +0800
Message-Id: <20260804070730.68-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260804070730.68-1-kernel@airkyi.com>
References: <20260804070730.68-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NG7xP+P+sy64TtYG2Xj/Mfx8Hd53gpXDPG2J2B5YRPydySawGjFE4jmB
	Tvrf/YoXwHMUA1Y1X6Ly+pFjy0VF98FDEFTv7333tZ5d84HPZpOr26hRIWA4xQd+hMsqiKw
	vV1zPFjd9d7385GL/K/9NJQi5sIuS2PvNTNL+neg3JpN2qKqIOvTn4HoL7ORdL2CWCzWPXO
	erDCnOzgKj0J70j+HOjBb+T5PJ53dRCdp4m1g9q7M5H6y/a2qshjl1tby8nyp3f52w5u+5q
	5Lt2yF3KbeZ/noV5ZH8Qw6UEAsqwoRmE2pGM5DcbplkNXsuKzuugQAcL+Rov3kUKjySGpby
	NoZ4x2jLIMK9mAvcgvbG5J3ZEWz11PtPu+60nub7oP5bC73+xyyBWyqA4CX2QqIqzxbuC3h
	Gn4lrL81K3xaPTEL9/ZyG5iWwBXpshhdLZcjDwLmhRvNQcy+2VAomYz0Ocqx4xV/iPosIRj
	IGdErbzhG3Xq3n3BoWyFj+/nPAnx41QulalkbmdcYs4s/pNUAa3hhSPqHA09VFHcaG6ehXj
	vtEAGB6GwdNOAsLv5eCWYFN63lR2bCYjK2x21I4QrF2Vqat6pQIpa4EoYaDLb0QGvHgr0r4
	9TAT+Ue6SlxJ1BNcAijrRtQ4HDPL3FLIeaJz1OLGSH/r+vQYt3aJXWet3xP4qBJjgFIMYqJ
	oZBYT18BG+NrIH0UMVsZnG6sHoGXw/xuGDkWZ63/Qpy/TqY0NfG9qhvgltboSlvUTsWKxc5
	TMMUa3O2GOr+SnbYTLRuJFJBRb5QBWFOVUV/i1OAV7h6R4Z0x/7sovgk9BTKVN5a9Mm32Lv
	4VKmDigisaesStyqdz18dx81NO7HOSj6FMG2fhQzndsd0G9zG4l6Dwlv2nDlYN8rT8G1QV4
	tc7T9u8glaUP2Igw8Tikb5FDh7QduV43SkR+ZJJLcJN3CvmOsM0V77AzysE1gp7yZECG4k9
	UPURDc+h2UZEqXbjpd4j6ttAVvbzr9wiIvWzY9wKWqtfhCSXBOpaB58lsNYp4yaJrQ8yNSF
	FYqjl1uxCprjsO6+F8vMBSURRQoPI=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_001651_654500_201593D4 
X-CRM114-Status: GOOD (  13.65  )
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

Add a new API to check whether a DisplayPort HPD bridge has already
been registered. This helps avoid duplicate registration of the same
HPD bridge, although the current framework allows doing so.

Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 42 ++++++++++++++++++++++++-
 include/drm/bridge/aux-bridge.h         |  6 ++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index f02a38a2638a..a56c88eba005 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -12,6 +12,8 @@
 #include <drm/drm_bridge.h>
 #include <drm/bridge/aux-bridge.h>
 
+#define DRM_AUX_HPD_BRIDGE_NAME	"dp_hpd_bridge"
+
 static DEFINE_IDA(drm_aux_hpd_bridge_ida);
 
 struct drm_aux_hpd_bridge_data {
@@ -36,6 +38,44 @@ static void drm_aux_hpd_bridge_free_adev(void *_adev)
 	auxiliary_device_uninit(_adev);
 }
 
+static int hpd_bridge_match(struct device *dev, const void *data)
+{
+	const struct device_node *np = data;
+	struct auxiliary_device *adev;
+
+	if (!dev_is_auxiliary(dev))
+		return 0;
+
+	adev = to_auxiliary_dev(dev);
+	if (strcmp(adev->name, DRM_AUX_HPD_BRIDGE_NAME))
+		return 0;
+
+	return adev->dev.platform_data == np;
+}
+
+/**
+ * drm_dev_has_dp_hpd_bridge - check whether a HPD DisplayPort bridge is registered
+ * @parent: device instance providing this bridge
+ * @np: device node pointer corresponding to this bridge instance
+ *
+ * Walk the children of @parent and check whether a HPD DisplayPort bridge for
+ * the given @np has already been registered via devm_drm_dp_hpd_bridge_add().
+ *
+ * Return: true if a HPD bridge for @parent / @np already exists, false otherwise
+ */
+bool drm_dev_has_dp_hpd_bridge(struct device *parent, struct device_node *np)
+{
+	struct device *child;
+
+	child = device_find_child(parent, np, hpd_bridge_match);
+	if (child) {
+		put_device(child);
+		return true;
+	}
+	return false;
+}
+EXPORT_SYMBOL_GPL(drm_dev_has_dp_hpd_bridge);
+
 /**
  * devm_drm_dp_hpd_bridge_alloc - allocate a HPD DisplayPort bridge
  * @parent: device instance providing this bridge
@@ -63,7 +103,7 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 	}
 
 	adev->id = ret;
-	adev->name = "dp_hpd_bridge";
+	adev->name = DRM_AUX_HPD_BRIDGE_NAME;
 	adev->dev.parent = parent;
 	adev->dev.release = drm_aux_hpd_bridge_release;
 	adev->dev.platform_data = of_node_get(np);
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..cca07a8e2d45 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,6 +25,7 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
+bool drm_dev_has_dp_hpd_bridge(struct device *parent, struct device_node *np);
 void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
@@ -44,6 +45,11 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
+static inline bool drm_dev_has_dp_hpd_bridge(struct device *parent, struct device_node *np)
+{
+	return false;
+}
+
 static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
 {
 }
-- 
2.53.0


