Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A6BC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 06:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2l8SC5Yz3l3RQ8kfLiWXU6wvt0RqrCjSGXwLiFhpCg=; b=mO0tQuQUexALYwS4D2ptD8rA1M
	Bpz3eq5/7dMM4LuCOGmsGECB8lOA4HBc+FugaQ/RrvpajpZgXA7kcKCwpPqEr6gPyUENSVE8YNJlo
	R2OhENUazU4Bdsb239cUPkpaGeFsQPE1du+EzNM8ULD2/9FfH4EaRtiLFyMGb2ZWGRbAbQj7YaNlW
	SN0A3X+8d1nnSxKsH9isuKqu3l9tkju+AJw9d0nA13iGLmyhwmqy7LqMuVX6UvgyJkO0CE91Sn8zT
	XPABBN2aEZkslIKwE9kpKHA9a1n0BXBB7IXW9Jw0y9zHXccPwcXGmsbQhoQi7AQqO/uVz+gyJm8Z9
	fjCtfKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woF5s-000000023BS-3gY4;
	Mon, 27 Jul 2026 06:45:44 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woF5l-000000022vS-3WU2;
	Mon, 27 Jul 2026 06:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1785134685;
	bh=E2l8SC5Yz3l3RQ8kfLiWXU6wvt0RqrCjSGXwLiFhpCg=;
	h=From:To:Subject:Date:Message-Id;
	b=bfn45AwFYDYMT42Az0pi/m8TOVyi3LglHpITqBGxHlq9xM8gcfAzaGBCy1AR9Pkwt
	 uT7R32BJZAlAmV4dkHpw4XMiH3ES1C/klQRMC+XCPqmo1QTUj26G55YxijqTj0hosc
	 ycHybtjWaMxCWytOVCQmqRYtIdqI78jDODcEtIYw=
X-QQ-mid: esmtpgz10t1785134683tc0454426
X-QQ-Originating-IP: pQEL2N01moMdqYr1UvRTvhnanKOZgyrIWstsR4XVpqY=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Jul 2026 14:44:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4043570049976961110
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
Subject: [PATCH v4 3/5] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Mon, 27 Jul 2026 14:44:06 +0800
Message-Id: <20260727064408.101-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260727064408.101-1-kernel@airkyi.com>
References: <20260727064408.101-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NWth7vBa++GdHC2nK3zxtUS4nLInD/EKSCVTnStBg0o0l6m140G4sCfi
	a9AeSEin4zppnFW9k462HZHGxBRw8SAc7XAYsi8dWr01bXF7ZgpKc4PuokX2GyxcVQ0VFhD
	oC+ATMmM079fgahFqkdRLpe7tyZK8/K56G+IOMdFdD0Ex4KuuG8STR6vUgWNM/+IsvKH4jO
	se1F/+l9UNLk+8m0ghiOpCMqwHx3LhZtZQhxZ24AWxBT4jZqIWqUq+KRjSDAsal2P20HfKF
	Efc7orxFOQWkNcBluPgvkTCPatlSYseTwwtTfgVVTJzZqnWI3FVKtIgrR+I8rsBpZ9urZ8T
	V5AVgufhbKFi34sMvIxDD3doWZm9ygD/2loay87kSpceIhclsilBbFUhcEfIBPoorHm/OKZ
	u2Caj7PmDGk4B94ofuZYQY0Yoo4qfg3B8WYrpn9kK3TLVebMtHIny0yEubhynVEpdQ5ozzC
	HZR24wiASKnE2DwaUJvQneuKhkDXi5u4UWpuu7C1PFu5Mj182Olo/0uwfBBjxx7s+KQTgiO
	IjX37kvGsqd3Ke+/ax2BrsimaToZjld5kS5q+Jfd3/ID4YxoIExT88ztKK3POfGAmfNxJ1o
	uQiJDd3vKVJlO+TBeYz2nQB+bIdR7Eo/+hXbmb9mBS+GCqq8a7+UELhX8pzEW44DeEIFClB
	qPPQTbnHW5mSghbN4ZHQAHIARNq1VdSe5MFsGgtIHihyCLIeRO5TwiIz0vYt9mWaxGCcQ4N
	CYFq1qfMno+DUPnDDYOFcfy+PIZ4n+OXZi/zL/qx7reLi2VYv0ianMcy5VFUSHYofDr8+SZ
	6/gkxHsq/FEhOEajpYtI6pagbLxG34TlpCkj1xraxztvd01EQdWj0bZRmuE9Zk0R+oNEd8K
	oS1yyuueMgHAuvejCqaj8I2bt1HGMVgS4P3GX0VJupNaiyrBf+xp3dZmNOtJVpM01ZmEB8e
	0dRRXIb2M96eTEN/scGoTqIxZOBSGuviq0RMRHQEz+pVIjm7hwC/GCsUyl5Yc6fH5gXoCik
	GPLLTiLeBVYFf9v+bHST61kla1HGw=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_234538_439711_37E2DABC 
X-CRM114-Status: GOOD (  11.56  )
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


