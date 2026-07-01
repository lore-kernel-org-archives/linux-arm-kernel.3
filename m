Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE27C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Fm/cu3W6//KUono7nCkxYLd2ce5d7Kf+AmgT6xx+vY=; b=MHq3ajTTkF7WH6kHfXQD7RpU4b
	PwwkavyAugzWrHVAyj5iisXNpFTpfYoJJbDZ8H/wPxTa0oXQcmsAy1Zy9/dWp9H4z6TaPk1pX1b9I
	ZcSOIEo0+6yEgq5V5YZ0tzgi/2BhJWqqUpt026PSxQGSo1sNyMXvGtnazzd0ZLoM478kAuTgVyGTr
	i2eRMsIuBiF4Vd6V176hU1r/nDWqWNY7OoCGtUnYnV4REyvK3ZLzXUUK3kMSLdzSEs9eBjtrEOmg1
	APDwbE5VvkeNbCbw8MpQ558Ix8ZyHC5NllMiqAqOGfgdKJ4RZtMmgyvV01WTO2pndMkoGZoyMYRIZ
	jPQPpekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4bw-00000003E5L-13y0;
	Wed, 01 Jul 2026 23:44:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4br-00000003DuH-0WfO;
	Wed, 01 Jul 2026 23:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782949486;
	bh=waXlmTvbPOG5/ezXaAtha40DVEtrFzT/vfQbjQQH34g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EUm2SQW9IMwHFb7OQHh1ih19R4xbGjIQoIy0Cyl+MSKhQIU9D7lOHRvIfSL57j/Pl
	 O2ewpAjF4yYCxcJpoKF26kvEBGX4leb67lgtUYfIhRpsKbbQpKXdFKzztNA0VDX3uM
	 et3JVtWen8iOTTjGzXLhmapUNdkiRmrTo/nLXKtyTH0KRVNBFjmConDZa0cjhsU6az
	 Fwks4MlihSAvcNkibj7jmcTrhTF7o8m4SJy7qqjkN9MBp4HfkTR4aAf45kLjUsljW0
	 e5Mk33tV8RT1ZsvTN/fb/D0g++f3PEcXbRlrK5SmUnbzvd0i3mm9NWrvokRv/eh84o
	 6Vjv1efcW2iqg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 186CC17E0FDF;
	Thu,  2 Jul 2026 01:44:46 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C5E69480062; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:55 +0200
Subject: [PATCH v9 17/38] phy: rockchip: usbdp: Register DP aux bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-17-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=waXlmTvbPOG5/ezXaAtha40DVEtrFzT/vfQbjQQH34g=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFNJJu0ImWjE1ZJlvsT7/dQeefNitxLjK
 C3bCXcOUhdQ14kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qa8KoP/R70neAO1D0zwdWvLn3B9wArH1/ZxDrPFsUlW1q+XVDmbCPQpJUk9NT/iED4zogCzp/
 Ve6qhsD6HsnaNIqW3H+BvcjDBsy0jzq//ielQaKGKXFOazEvF3f1hxiPn3LDTXYh/+pkvtI2A9a
 bFPsVcjPeBCSfZovV3CxiZ1YT7FjebJLR6H1vjYpbvASOoPnYqDE1blidAoHWRZDdfVbUFJ/ZXU
 J5xEg4RZpM+tnu1z0AWU/8BEO5N+DuJHormBVgHEVLJ5N8a8GwqMsVOuDR8CctAQAj4D/QCpYJ+
 b2kmt9IwmdEK/MNIa8dIXmQ5gqE3/738N5F7HVxx92zWcIFWkn6eI9K2fKEymCSWbNnCqCdntID
 kzV5WaAAXrRT6CEpS6Cco4ub6hSR7kfiT9JNB1d2qfKOIy238NKMmKsSVbS2Exri6MEZyORAwgJ
 Fvnsm+xlR9mYZsbpq2c5No+KZ4f2fJs1Wjz7+s0JLMzT000h4EqIV0KuMrRDqJQPlOsSzBfcujm
 IN9RnmsQJibTOlTc9OW+UBvOcZhVURXpp/XwHPYMOR/l9WZmy7oZOSbf9Ps4ZzpT9IRz2Y6XLMT
 0yCnU7mTIZqXlXESiZLE0Tb/FJpKQg4EzUUqmQkojsyiT+KbQAv+hZvIFa7CZfamJlK19HpyjIe
 K0BKUMwvEnrVzn3I1j2U0KA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_164451_352396_51D1FE16 
X-CRM114-Status: GOOD (  16.79  )
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
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

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
index 5d3db696d51f..b3de16557c32 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2024 Collabora Ltd
  */
 
+#include <drm/bridge/aux-bridge.h>
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -1449,6 +1450,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
+	struct fwnode_handle *dp_aux_ep;
 	struct resource *res;
 	struct rk_udphy *udphy;
 	void __iomem *base;
@@ -1507,6 +1509,21 @@ static int rk_udphy_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	/*
+	 * Only register the DRM bridge, if the DP aux channel is connected.
+	 * Some boards use the USBDP PHY only for its USB3 capabilities. The
+	 * aux bridge itself will be registered using port 0, endpoint 0, which
+	 * is fine as that is the actual superspeed data connection shared by
+	 * USB3 and DP based on the mux config.
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


