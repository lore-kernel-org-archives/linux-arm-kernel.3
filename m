Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D27CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/aj48P+SSooNbmdOG0E4Ft1GENdRbDBEk/D6Jb8HXw=; b=TUsmHS32TuNTBsfsOo4hIgXiWc
	o3PsTQ4L/hR6uc/h/3bcMm5oCz6EAPCbZ2U4KDyrwxsfaGJuVwZ7FcQ26VRGbtYDLGEVe16GytUn7
	bSIlZu+Vx1AySXEQfBBGePMjNBzm62knXinBF2Pht3Tg1nxpnstNavh3MtS397q2VKuZ4whogqqri
	4IOiUugQE7XawKMTtdPxVD6EvYBvdBYo3TwlPJdHq9TTOyfWK81SCWvc0PtfgLQBFtBklfQCq0wy0
	1qL16GObsEMTrnbao9WompsanMrQ9LzpX66tDbxQ6VjPNG+IUnYY06junM/8w17Nog27AHQGhxxIY
	VbouJJHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4e2-0000000BEPg-0YLT;
	Fri, 12 Jun 2026 16:22:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dt-0000000BE54-2gZj;
	Fri, 12 Jun 2026 16:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=MVMfIZtkk4nAgZ22KBPvUU3n0MroH7NTfE4TBkpE844=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jT6xJVhJAy/eKWGJessVl79D4cB+aC1bzK0qV9+7VuT0fcPJHl4Bnv77kOkT0WrHk
	 87bZUof+75K+JnfEPzyZoBGXNm/B65NenZm5gxfaiaOnm1xlCc03nMH8KC/xe5s6lm
	 yyVr22KTKnGtyhieBGKRnDzEQIy75Rp2bGFfSGYr00ujEqkzaWEkKMMG1X2g4doVkV
	 SZYhbrLmFFbX/ykSZfs7Qu+OPZsiYpxWAE0xQ1h+TLDk7Ln8lu2S3ujODfo5QCFFEt
	 lVa/K97hXxwgC9NlzDiY4aQjIn9ojf9pJg4zojL7o4m+/4CbcHV1wEmBB3t9KSl3iv
	 iSL3ZicNQK/lg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 95ADF17E1168;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D480C480047; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:49 +0200
Subject: [PATCH v5 11/18] phy: rockchip: usbdp: Register DP aux bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-11-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
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
 bh=MVMfIZtkk4nAgZ22KBPvUU3n0MroH7NTfE4TBkpE844=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiEBh1Hv2z2PV3IUqtx8Z1QVAAEat7Z1N
 22sWyo3+nESvIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qaaeoP/1rpWuqOCJqRpDtJqa7F7B4nvZgWvrdIbFQIkvo0zJUoasW31mtcMZH3vJh/oOb7oqF
 5GnI7yxSPaeOc9xeKLsNi3PLw8zD2Hm9WbGIQe/ymVJLLMhggnEiSo490vOH1DnyRXylp6sjz9M
 HjBbOyzjIYmg/w9wXRD97dIdYUL7G/P465SCK7VIlgJxpcEFEOHTnZPZuq6OdEFc7Ly1LyFUj3y
 h9XiXpKni3rMH6OhGwbhwmRaqS7vLiXVJfmE8NVd4QuE/MIBWTKsR9N6qG1gKRxg1ifxZG4r/7q
 noOnu0bn86C+AAKiuEt9x+4Cn9482ZmS+dfXUV4adoy1ij0nAGvTRpPyRoiQ6ARyO+yJtbxcjaP
 kymue1NctR69n4AHUpeypkIfVJyjb7XbEKkFlyMJtsdNCRtRxhnCFnPgTsb/cLPyR9xH4DSlWBJ
 1Ts+TyvuXwTF9N3Yb1QLp2Dq8s5UWLzOZN+NCaSLWnZSaEcEd5mO6nty+jn0FJxlqgJrO8QNR/A
 7ztvRCfQ0zuzW7jGiNNxFCxGe/oMTl4sAY+x9t9FRvMdD4k7fERUJnVdqTbx/CcDi6jBpzc5PT/
 TWtm/iY1DEFdXJw0o7k3Ela8lGmj7vkKBPsTTwCe9NG8HjP2/e1cb7jVO9I+favrs4SYljzRYCj
 NSb8ZAQsMhQMsrBfTORk2aw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092201_885656_6E7BCA50 
X-CRM114-Status: GOOD (  14.92  )
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
index beab20e4c512..77ad2a89d4f2 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2024 Collabora Ltd
  */
 
+#include <drm/bridge/aux-bridge.h>
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -1434,6 +1435,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
+	struct fwnode_handle *dp_aux_ep;
 	struct resource *res;
 	struct rk_udphy *udphy;
 	void __iomem *base;
@@ -1492,6 +1494,18 @@ static int rk_udphy_probe(struct platform_device *pdev)
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


