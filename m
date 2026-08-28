Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EE7C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 08:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92lwE17e0FOpQsP6OniGlzehqwbaj82P3AEnE+KFgZY=; b=cVXSjqsdLRixFjpEf0f0rBz6Uy
	3XdivwblIm+xOdN0YiEmjLzJetzRIP0W3O1M1zcFyFXkbeU+FgaFnfOJnSKvw4RSfPlR988k+RHzw
	u69mMSBOP0z5x6hrUDFRNL0k6eIBKchv/7gfS2ndhI73nyJ/CtQmIcXavS6R9mbJEaTijdQ7ejCpS
	mWEsBydV20cAyZOD2A6o+WZZK3DZV3TaORKK+OPLlhZ+zV+HREi4zMMeTcoFkOZZ95THJgTYPxGT6
	aAtOBMTuUmvFdvZiaRB6DYZCSpRcqd8z3Y4G0F0Wcpt+qBZpRKITa7AB5yrEw4mTIRSVk3rWx/zkx
	QX4kVbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsGe-00000005LGS-0Pmh;
	Fri, 28 Aug 2026 08:48:56 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsGb-00000005LCT-0PSY;
	Fri, 28 Aug 2026 08:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1787906873;
	bh=92lwE17e0FOpQsP6OniGlzehqwbaj82P3AEnE+KFgZY=;
	h=From:To:Subject:Date:Message-Id;
	b=nuPu3R6RGBxTvSwneXV+5w/V05jY5QhBFOze733JxyiPmtzDNtW36KwlXFWK5P+W3
	 BNQOnOhOHeMaO9am8XEX+Cp3HpQwFJUFP/lbSDeC3VYjB8ky7hPsylcq99AJsN5Kw5
	 AhVIETookMNWknvsHIN2YpMiIRvL69ygE0EaJoio=
X-QQ-mid: zesmtpgz6t1787906871t6f8f5f8b
X-QQ-Originating-IP: 3JGdevLTu8iXxaqXX2RzHlTwRgpYv/D9UneAY+H2Hqc=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Aug 2026 16:47:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8549069541952634456
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
Subject: [PATCH v7 1/7] drm/bridge: aux-hpd-bridge: Add drm_dev_has_dp_hpd_bridge()
Date: Fri, 28 Aug 2026 16:47:31 +0800
Message-Id: <20260828084737.565-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260828084737.565-1-kernel@airkyi.com>
References: <20260828084737.565-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NZJ7CNmHCWa7RLgstN1K22jaNYiNnIa2echZ8/83Wc8X4yHv1dWzDh8E
	6EYtuITktB7FhOWZL50BPuvgn3Qcz3hE9NEf4ZwTF1Lvs41nBFn+cUwUF1fdykT7ef/vSOc
	2o+Qr2KpQ/hFHE6Yo/1JQf6osfOQW4eVoYXVDx6GjjhjzoAEJL7LDyYp278S/jObZft28r3
	Zdcepqmu+kTlPNnIds5a3Z0sl4JHwzGayL6lQw+0DwsNHY/nj5S+kmlmqJ/OCCS0wtr2eew
	tANlpsOJHEVF9lwikrvG0kyhD/JVc8Nxlz4vWt4zNBTqzMmt19alw0wYLJgIYpQVUZiv908
	C1rjkluMHeH7lljd8q7IQzfJtcZeD6PGoAtpd6igxkyz2qxpzyxYKh3Sqc3ok/TmTHDTbIP
	guRSvVoXxWrGUWNMRLoAU7XS5uVbPAI8Dved5Mt9hviJI8gIyHtI8DMmuGPs1D8ODoGq0iD
	Fo3ftkCkR4MYoUZ3blVJ2Txhv7vCvpXSznB7qRHHDbQbwCxO1skoCw/Lf+gjYvKHVEG80nc
	/l4V3MsNcXQwyRBxO8QpEPGzOljsgySiEb1YSSBu4rR0hRrxoJv6wGjicDEFMkl/0xIT1c7
	XbDuvJ65ubT1rKxRum4+B1Mr5c4ZM40UE/caDoFRd55IscBslcIwBsI5slvYnJ1vn1uEU++
	w4iGzkjMAcSrvzMQ+1Ttxe1algP10sW2Lvqgl8mO3y1M/KKiAO8lnEhLcG44kIrry7rsWV5
	tW3oGXuHz9eezVZJ9Wo0b2nck3OgeudIihX6eB24a//WpHw3eR9xNO4g1tldmuOO4jcbOcK
	dGoN8FtVF0vsf8//ievmGLA5byBSrba3w3Vb1oACyqwFZ4/VEvNRONXglECjY2/rpPeV3Ky
	/xZTYcjzvR+tOG6+usFQzFVqpmVBeW4KOVXFIyTvNDZxByCfGaSzum2317p4CYxCNCL1RZH
	UpkxmF0cynUNct7vlVPIcXXZ6AKE9DJ++pdA1Uq9bAtMLzmvkgdA2DOCskZSxPpNRRb0=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_014853_588368_5DC6A646 
X-CRM114-Status: GOOD (  13.37  )
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
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
(no changes since v7)
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


