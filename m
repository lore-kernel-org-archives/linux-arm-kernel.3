Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A0DC44517
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2l8SC5Yz3l3RQ8kfLiWXU6wvt0RqrCjSGXwLiFhpCg=; b=ersbvFaC8TXkBtvN9hO6+B6STL
	qZ0ipX6sKwFhN7vfwvbKfiNLkR1jGU4/GY242Qbr1gh3D4oXgCYO94x7XmYrrcHTP7yTZMWeXxGM/
	HcKvBSwaeYJDW0O91hd+MZlmintkJR7MHbUFQcliVQvKFlmSDYLGqdfucHjHJGtM2+g1anZ0yVda1
	+sVW19yCW12YjnPe+0sMrsoK7ywdeW1VjoHR+bqvG4bwTgdoZDfS8IiUJXA013V5HLEfntK3ELlcw
	npuJ/dT6kowE+CRFiW7STkoh3nShLN2S6wDot3guHct0pgo2VzHv3wQlntFOJNUvJHaXUlVehDEJh
	7OMmOlWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcxz-00000001RC6-1ewF;
	Fri, 17 Jul 2026 07:26:39 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcxw-00000001R7p-1UFv;
	Fri, 17 Jul 2026 07:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1784273027;
	bh=E2l8SC5Yz3l3RQ8kfLiWXU6wvt0RqrCjSGXwLiFhpCg=;
	h=From:To:Subject:Date:Message-Id;
	b=OsCyxxBo8/is5WFmzs280ZyS3PKB1If6TwSQ7fNAd1xFIwm1keiHuZfCsYo0vMvCm
	 z8rvmVRkdKkW/yu09DlTsKU8kMQlkFxqrnf+R+KBOmhSlqb7vLotw8RmIRWqaM2TE9
	 XsMKxo3RfxGgz2nsNF81Xvjfbxr1SGzOh3AuAgHc=
X-QQ-mid: esmtpsz21t1784273025t3c480ea3
X-QQ-Originating-IP: NunsL3AmaX5/YohLrjzcmQgzMxqBfZtsaBbae5D+VuY=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Jul 2026 15:23:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13698718535468355926
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
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3 3/5] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Fri, 17 Jul 2026 15:23:21 +0800
Message-Id: <20260717072323.96-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260717072323.96-1-kernel@airkyi.com>
References: <20260717072323.96-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MB78LT3tbKTe20unaeEpA7bJ2qdDKCKD901Y4i5OgIl90Q8sVdUpGscb
	KTn8rVYIwJTwvYh2zKsPIBpoXTH/PCLNjSpb72jRH7wZ55wr84Ncd3lt+fA4VA1eOo4rdJ/
	IN1zc7Y8XunKsfePJKqlxfu0ApeBH9CCrJ5wR6rcgCHiD3gnoJTHdvF2sz/OwZuT3nC/X+P
	6ZDndd697scH/Cq+U8s05etGYIEvk65p5QgwbeU3TDWB5Zr3l++owD3lQmshWlLoRKJFt08
	oWlIxfEfp3zCe/IUT0lR1EDcG5/Q067q4UMGtgvy4qV3iOlnzRmCXHmrDhYPq6Nt5fs3Aih
	dPAbeNIynNR0elLnvoCj5My5EvfIe9vLu9ZTgSQ7gw146s96s0LZ/sutAoN6rpPo3Nc0aiB
	Py6oLzbtVcTY0wwum5B/zm6mMmO03CZMyrpln5MRHuwjefBzvkkpvUtzPmNV9GgGgE4Cgyu
	LtGMYIz3VLOMdNJ/RfL2TG0xrei2YmIHIqU6bw497niDp5OKMMVYV6y52o/5O8JDbV6by9k
	Fmo278Lpb6JZgm2emEAp5fX59EqwZ14IZ8AqC4x+2BD3hazqeoahsIRALzzBlRVrXByP2tq
	2Xyrb6WHBN5WyUs5m3dpivA3OjfAJBeHw/NH6O31Ldbonkb1Qy2iEKCMDRf3IYEDD3jDLpO
	HGIETrnYO8DgGHCZtVKJGNt3WiA+SyLR4lBxiZnDmEO6+TCIMH8+txIXEgIg0MVyE0MaXUa
	p1xTtCZ57Zsz7CqDCbiZfFCrvPl8wuCyDFndcQ/tFqNOckIxxrwKedmm4kbBh7Af3JvFsLB
	sAZpDKEQWGyXUOI2144y+x7Ci7RgBPgTp3eiyxvGmCwVaL8TebMaVhl7FiAvId2gFKfYWIG
	lfWdzlb/Zj2BUbrLDP7M1AqmwKbjpS75q0ZffZLdvHfTYNDC7ZpYw2H5FVzhLGImEgBDOsi
	QrExCp8HT01K7fsVlUiptYWvaS6tW69HK4MZ0UCT3go6oEMvzOUW+Ahd+WOP8jO2YZKijRG
	TZf4tD1qiMiQohPn0K
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_002636_894385_C9457BAB 
X-CRM114-Status: GOOD (  11.38  )
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

Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
device.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---

(no changes since v1)

---
 drivers/phy/rockchip/Kconfig              |  2 ++
 drivers/phy/rockchip/phy-rockchip-typec.c | 13 +++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index 14698571b607..9173d3b4fef4 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -119,6 +119,8 @@ config PHY_ROCKCHIP_SNPS_PCIE3
 config PHY_ROCKCHIP_TYPEC
 	tristate "Rockchip TYPEC PHY Driver"
 	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
+	depends on DRM || DRM=n
+	select DRM_AUX_BRIDGE if DRM_BRIDGE
 	select EXTCON
 	select GENERIC_PHY
 	select RESET_CONTROLLER
diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
index d9701b6106d5..48070b50416e 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -54,6 +54,7 @@
 
 #include <linux/mfd/syscon.h>
 #include <linux/phy/phy.h>
+#include <drm/bridge/aux-bridge.h>
 
 #define CMN_SSM_BANDGAP			(0x21 << 2)
 #define CMN_SSM_BIAS			(0x22 << 2)
@@ -1162,16 +1163,24 @@ static int rockchip_typec_phy_probe(struct platform_device *pdev)
 
 	for_each_available_child_of_node(np, child_np) {
 		struct phy *phy;
+		ret = 0;
 
-		if (of_node_name_eq(child_np, "dp-port"))
+		if (of_node_name_eq(child_np, "dp-port")) {
 			phy = devm_phy_create(dev, child_np,
 					      &rockchip_dp_phy_ops);
-		else if (of_node_name_eq(child_np, "usb3-port"))
+			ret = drm_aux_bridge_register_from_node(dev, child_np);
+		} else if (of_node_name_eq(child_np, "usb3-port"))
 			phy = devm_phy_create(dev, child_np,
 					      &rockchip_usb3_phy_ops);
 		else
 			continue;
 
+		if (ret) {
+			pm_runtime_disable(dev);
+			of_node_put(child_np);
+			return ret;
+		}
+
 		if (IS_ERR(phy)) {
 			dev_err(dev, "failed to create phy: %pOFn\n",
 				child_np);
-- 
2.53.0


