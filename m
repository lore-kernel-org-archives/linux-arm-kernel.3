Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FBDCDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwQ9YoQkKaLdgk/Me+rgRaZ7WwhglJWjv2iuNVUuBU0=; b=oVeyH7y4l8SrxznpYxVXHPdI2P
	70b7tFetTHaIHrx6VdH2ZYucFP1WpiEvPHCVZlEncju6YikfZpTEoC96oijGYKHm8LX3BelAQX5ru
	G4s1JvuqSL32t8o0lQPF1vNwaLAkbdVrUqOS3p/NqoF2KvBYfOztEqERJAyo62bdUjbNZrS65BiI4
	AAmfcnacHSw+tonspzcV2kh7EHoOgSx8Jok0J/Nec3CKdXgQXO4CvRPmyU9QSdu7y30KxgsL1cv+q
	FLgl2q6yDqq82hPFmvKhrSu+ehz469PnX4Lxg1l4fAPQhg914E0p5RNUuKfwFqD7ePecyp4BCJmbD
	43O3iiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabAN-00000002euY-2wk8;
	Fri, 19 Jun 2026 15:29:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9Z-00000002dbV-0f9k;
	Fri, 19 Jun 2026 15:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=d+JJe+XQ+Y3L2NVQWkVOmIYISNROo337V2shDm9B67g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hUUy191ykC4E87fh1byZOrSAgsLanBuxT2eXi8JauZdVga7o/5Nv8WAz3OA693MgB
	 0KTRl5Gm8wN2l7inHVbY0zStkyqJX9opV4vkazHeBXhSPwH7WlxtshEeNgzx0JMGN0
	 htfOTe+qUr2wCGax4OphGUFIZ/uvL/YSgAcRlVG15ccltLv9MrJCQ2/w4+l7BwJYps
	 u6mYY63Q6FMNvGMcJE0T0mNDSj7o6hwf3xrIw/xFtnge6ASgIqfeHHrKd+FwcvV96r
	 47vI00OReERLfJQnpzMvoAlZc4j3U/HAiJxs852aG3hu1t9krJxxGt7p+kGdSzvlcE
	 SNqFp/WC/VjiQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A39D17E15A5;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9EC18480052; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:06 +0200
Subject: [PATCH v6 15/23] phy: rockchip: usbdp: Register DP aux bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-15-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=d+JJe+XQ+Y3L2NVQWkVOmIYISNROo337V2shDm9B67g=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDml4tyOwH6M+iXyJiGYehqX8Wzq9zP6q
 D99hehp4ECMCIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA5AAoJENju1/PI
 O/qaWSIP/iDG6UrI9cLiquOeu9VOTGEU26dA59Fe00f/Y9loI9Ow3a04dMpNX8UmDhaiHcegYs7
 XAsxV7UZxBi6cmBREM3zPtRVZJmpACIoW0j3NmgWVRH/9sdTV28zR0m7oJwyHPwWImu2+9RvuM3
 yuXALcZe2dt6hUty6nxOmzc932JmN7cSmhqD9vK13P9mDVcAXI1JeP150RmEh031j0tNGGFrB+6
 filXt7lvKAh/YlXHIHqM2P+fSDZtnqA2zj7gRseawYQTI2u7rTtGn1d+Rd3F/tKX5htzyWEuC5w
 dAmQd1pztpsr+R7BMjtJmccebgrU5+bBfySNRcukO1WSBsqpgbwucsWx/3zg/+lnAYat/PHzXjt
 h4I5E8z6QwaMxLUV0JX3E5YlLHoo80G8Vx4oD+6vGFIR4tPKD5R4wpTWPuG+CqEUqYtPmAIuO/s
 73oosoyg4ztPlum+Wclb/j8nqrfNWusicyKdlQ3zMaymrgSVkhwdRemyUEox8rPeHbJ+RV3rHgu
 ygXtFwSBQFyoVj3Kr1ZoopN+lsyoM73Xvhcw+RnnEfjFvQyeQod8v2U+MXgOBLrRv8hmI1XNYGw
 N9/JbfciCgwVUv0fT0PlISRNdEvMf1JajV4QcdqHMFKuHNpecdjOdvp6kGAeFVkXYRmlVKB7244
 /fXBH0em3oGKz9YeJlkY5XA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_082909_394833_6F9530CF 
X-CRM114-Status: GOOD (  15.15  )
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

Add support to use USB-C connectors with the DP altmode helper code on
devicetree based platforms. To get this working there must be a DRM
bridge chain from the DisplayPort controller to the USB-C connector.
E.g. on Rockchip RK3576:

root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
bridge[0]: dw_dp_bridge_funcs
        refcount: 7
        type: [10] DP
        OF: /soc/dp@27e40000:rockchip,rk3576-dp
        ops: [0x47] detect edid hpd
bridge[1]: drm_aux_bridge_funcs
        refcount: 4
        type: [0] Unknown
        OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
        ops: [0x0]
bridge[2]: drm_aux_hpd_bridge_funcs
        refcount: 5
        type: [10] DP
        OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
        ops: [0x4] hpd

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/Kconfig              |  2 ++
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index 14698571b607..39759bb2fa1d 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -136,8 +136,10 @@ config PHY_ROCKCHIP_USBDP
 	tristate "Rockchip USBDP COMBO PHY Driver"
 	depends on ARCH_ROCKCHIP && OF
 	depends on TYPEC
+	depends on DRM || DRM=n
 	select GENERIC_PHY
 	select USB_COMMON
+	select DRM_AUX_BRIDGE if DRM_BRIDGE
 	help
 	  Enable this to support the Rockchip USB3.0/DP combo PHY with
 	  Samsung IP block. This is required for USB3 support on RK3588.
diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index da769790df98..b75c190a4311 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2024 Collabora Ltd
  */
 
+#include <drm/bridge/aux-bridge.h>
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -1438,6 +1439,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
+	struct fwnode_handle *dp_aux_ep;
 	struct resource *res;
 	struct rk_udphy *udphy;
 	void __iomem *base;
@@ -1496,6 +1498,18 @@ static int rk_udphy_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	/*
+	 * Only register the DRM bridge, if the DP aux channel is connected.
+	 * Some boards use the USBDP PHY only for its USB3 capabilities.
+	 */
+	dp_aux_ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 3, 0, 0);
+	if (dp_aux_ep) {
+		ret = drm_aux_bridge_register(dev);
+		fwnode_handle_put(dp_aux_ep);
+		if (ret)
+			return ret;
+	}
+
 	udphy->phy_u3 = devm_phy_create(dev, dev->of_node, &rk_udphy_usb3_phy_ops);
 	if (IS_ERR(udphy->phy_u3)) {
 		ret = PTR_ERR(udphy->phy_u3);

-- 
2.53.0


