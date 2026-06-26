Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23843C43211
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tVbMpaF31S3DabnsUYtFs2ywJWhN5K5Y6MCjmufM64=; b=eG8vhrjgvxJAuFhiMijrRsid2X
	pDibr03poXsplwS0ZMhgEt+beUvEAvlL02dPZyekppDJrG1y0Y5zGbcCkRSCO7uJkz13GRA2vA94w
	UvtlFFAN2Oi99LVS1k373YYQc9RomNXgvDUdoJxl2+o6ZPtpja4GyGzRrf/G5RyMBwr+5QTkjRXJ+
	XSV0QyaZf/vW2ixpbTgTt5RiTAY/MPEQSRKDVVrJuIaOvuZHET1EObgAeZk2GXbr8by8hwUPspzpD
	fhKmkwNIUvhy72vKQvuRqWrxmvDXYBPztRugMAV0Z/1AVgE4OAVjiLJOm74KxagJwgfzFNnHqz3Rr
	24rSY0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDbY-0000000BrYo-1hQz;
	Fri, 26 Jun 2026 20:56:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDa0-0000000BpfN-26BU;
	Fri, 26 Jun 2026 20:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=jzKAce1AMYjxYAxwI1ZD1/YYt1G2BSK4c3WM9C2tTHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EuMsX3rgho3wwdfcAjMVtGMavozp97FNj83OgfLVlccRqjPxsNRzEplPkQiUsCmNu
	 QSuupRkFmm7quHyEMM+YQOSep7la4H6iwruXcUqARnXcOc/2qyh7LuIoidhm6nCEto
	 G0JBR3jKxVNkrzYocCy8c0lAVrTNicZu6SdlLhTn6HcU6axUme9sQvsF+KRGpJ4bGS
	 JxHDM/FhCB3niugzqiJtctUNLkZlceBLql9vPW7WFPHP+GTMsm/iyEVlUCb4mZkOO7
	 Eqxe3mtgZv5yxXB3b6TDng5AydhLGTB6C4sKtnUyH+0HkchUKFpZZDTycYxInHvZLU
	 7YfcSa6LlL0rQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 168F017E1583;
	Fri, 26 Jun 2026 22:55:03 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 24445480061; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:10 +0200
Subject: [PATCH v8 17/29] phy: rockchip: usbdp: Register DP aux bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-17-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
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
 bh=jzKAce1AMYjxYAxwI1ZD1/YYt1G2BSK4c3WM9C2tTHo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yX1wY4u6VrOOvZHzHYUIk+ua5ENR82hb
 pL6Iuaz+Vn43IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qa+lwP/2m6zyHtR/bn93OXjL/3ddC8mbNr0UCTqgoIooofCR8mrh7CWzvSmZKG7nTiXN8wFvt
 wzTN/DLrmVukfa/Rl/OgCfEBCbz47oxLaCo9qM/GKV5Y8BN3r0dAdFZfEJi44QxJ/t69Aw2nsOr
 2C3X4Rs+v6k9btg8bgMVxuzyE3fstIowHfgs4txPjDu+YrZqwo3maXA5yo4pEabxnHd4A/l5n/D
 e52xt4vwUjE8/g8eE8TLJcZJe8ljBRwTdHI2Ca2Rvvx4YZXYPcAKH8qLWLeiZLMxuHAhLg5VF7b
 e04tECaWo3YzQ7ugbfsBMMzFcQmNKHBVZFAjQTXuAjEPopVc1BK6Xk9YSymtxItpjdqTIsxt9go
 rXKg17GHYApN09vCFEfaIqHAe+tGSRu8R2sB0Amlr+Qle06SInGAudf1WKNbDU01ZUZ5G0duEnC
 l/FTjEFeSxrOqstT66/sxio1gcCAZv3xA1UDEtYTUM3+1E3rnKEFTZZBHuaZGv1YdH6MJPDnmna
 kcbncvhdXkSQE0j3OwKOmfqYmqD1XHZh4/jC5ItSShkQ6qznPPpZiLsy0VVohZ4s9ryHf8zzTuQ
 RYh6WXJnRryvwOS5+N7W7wjR06uHn1R2767jPf4M4NhMa+hAYzDAnhoGV4thJtA722n94VB+9L5
 7LdkuoyJuSWHEs2FprD02GA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135516_956116_C79796B2 
X-CRM114-Status: GOOD (  14.70  )
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
index e243d92483e0..a204699619b8 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2024 Collabora Ltd
  */
 
+#include <drm/bridge/aux-bridge.h>
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -1447,6 +1448,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
+	struct fwnode_handle *dp_aux_ep;
 	struct resource *res;
 	struct rk_udphy *udphy;
 	void __iomem *base;
@@ -1505,6 +1507,18 @@ static int rk_udphy_probe(struct platform_device *pdev)
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


