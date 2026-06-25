Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E099CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Al07yoitM1czQ77WXIgmLgC75K5WmkbFbzBoMBRHFsk=; b=WfPvPHLfLKWyK7YkNhaVocE6H+
	RhDI0Md0UjGV1t8mE7wym0IzcvqsQTen4Cg3HmlBIpe/6do0Oug7CGVcoSuCP+feFjg11lrA76k9b
	qOOxUwycxcHoknv4gzDBDvbeOz3wyGe4DCCM4YViwTpC1p/y8tTCkfzKTJQi2L/Jv0m5HE4HH3rUH
	WMPHLHPyjHpKwnGR+a35ThFpIDFUTgl/EVAEzAyLVvXKX43ucZ+tmt4Cx2idi8vIpFIGjVWwCIWci
	xFdWjxluqOckni/6eYlN/VdmILIh9VXY6gtwpb6qaHqIEX18LoPMA5gD8dJanTZ3kwCSnvGrPHQCu
	TUN60o+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco9w-00000009d3k-0QGs;
	Thu, 25 Jun 2026 17:46:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco9d-00000009cof-38rY;
	Thu, 25 Jun 2026 17:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409579;
	bh=YDvY+Nl5/pF6jRh38k0JbRoEF9N2BNxEyp4LNfkseKI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VHSPWxShCzt5SrNCvEQjhWuQrwD4WU4WhKaB7uLO7zYNfaSfPwm5nEgQTg2Do57Bx
	 Z8rIt86s167XjCpxjPJk0xvWa2tVUEWCS9fD0IHXX4iQpsz61pu+Uah7PfRedJCJs1
	 0KWSyxpLjm5Eo/23c5rQNA4OnZhbwRDUwgRdzgXtiDJcc9IL2+wXN8FIPIfhLbIl9J
	 YtVSvA8uDOQcqRXEhtQyAd0/eNe/1S/NlPj2gjh5uDrCJRr4TRRVN3Zohd1W4SXlBr
	 Ovzit3+nqQUSwubNHvcCkmkEdHo2Ftt4ykZPuEmrT1umDyPXxqdXW0Qx0DDWNWzDOS
	 7p1myAe1JICGg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 17E0D17E10FC;
	Thu, 25 Jun 2026 19:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 123C0480061; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:44 +0200
Subject: [PATCH v7 17/27] phy: rockchip: usbdp: Register DP aux bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-17-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
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
 bh=YDvY+Nl5/pF6jRh38k0JbRoEF9N2BNxEyp4LNfkseKI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9ucxh/sweQtc19yusDaWffG5o1eCAAza
 +umMbti98ZNdYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaBjMP/3xRaImmwWOvM2SpP3DBa+SvZYZaWCQaK+hr39sC1gRiQEdOpSaUnn98Nl7911aLbcn
 NzxMA8VW4PhOOthY30egfhlTTlkj4pT4KHY80FD7QBq3/pn+O6sHglb60TTMva2JiiXviwJPHQm
 sOYhICH8+RAT+X1E8BdoOkIKLb50Oag7x+xVa/Fv5STVJl1uhOjWAew2wYN7sdyY1i5m6X26eRv
 bBTLQJM0YJbhh8HtIEg+8cTTewriS5hLBgMpRnjlIHWlQBqQM6eiI6JSs4uf8FEV7vOqOW+KHKy
 8RPPm+/G1jVgQAAb6vudQRO7iIUmR6rnMvbeU9mUAILbSbWu8FswI9dFc3PCzRRBMf9n/8y1Dr1
 ZxlkLzlFSBC+D3SWUl5l8Dl289Oe829J2K89PcYSeWqMqKlp6956pCuvU0zMVuCGpAeN8SqWcRK
 JeB9FAWv3VN8bE/r28gJ9qUB6YDWcB1mrYlkB3n32RsMKPrVLeCOoUZTA7ZX2fGn7pTkEFBolXM
 VOxx2IfV7gacbqdHw/hg1lafKpEndYt/YA9X6nRmExfdTgOQC4ZJW6UVrlX4PV3k0x3nmpxrj6y
 J5VHB2pPemx5Ubqv613f8FUadWoA5x+wgsx3YOMmFHsljZMlx2qPWnCnCxGGUQGrONK5K9CQ1GE
 BPszC1/B8cwOxf0w7OPInaA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_104622_094637_D0B59D4E 
X-CRM114-Status: GOOD (  15.09  )
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
index 71ee2f4faf0b..7bac3f14d750 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2024 Collabora Ltd
  */
 
+#include <drm/bridge/aux-bridge.h>
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -1444,6 +1445,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
+	struct fwnode_handle *dp_aux_ep;
 	struct resource *res;
 	struct rk_udphy *udphy;
 	void __iomem *base;
@@ -1502,6 +1504,18 @@ static int rk_udphy_probe(struct platform_device *pdev)
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


