Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E20C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 01:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2l8SC5Yz3l3RQ8kfLiWXU6wvt0RqrCjSGXwLiFhpCg=; b=Ho1o0MIzZYuGH+SN2KdgNuV3kD
	whNnWJ1bAFna4CuGjpknfeGhyvigTbvL6msmAFgnuF/egzgQ31aLutBN1vvhEJ5bukLH1J+qmuPdJ
	DTd1rskqzD8NqlHScXzVpHoLEsAsx8Ny+JkRHwq91GqjgKUqVoacs+jzk3Ib0ixpDG4DFtCxdYXvW
	KQplLpsmk/cLKwYyWJJbS4fLw+eCRtxu/YLFINCicwWPNnsv9ZuoVu4oTKNLSmb371MfjY/KtbJrg
	tkwOGRfSms7qMWlfesb2Nh+hI6KyvObW5vUlqZQ6rVQzs9vKD+fDePx1JzwuAEQX0yCylFLNVjPrH
	z0XtQcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFgT-00000009Gor-0Q57;
	Thu, 30 Jul 2026 01:35:41 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFg6-00000009GPB-1WRq;
	Thu, 30 Jul 2026 01:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1785375270;
	bh=E2l8SC5Yz3l3RQ8kfLiWXU6wvt0RqrCjSGXwLiFhpCg=;
	h=From:To:Subject:Date:Message-Id;
	b=U+nYfHngtuly1xKv/+UYrF1a+L81c/axlLdhQF/A/1aa/FaQzjvisFxT7TtEJWnNF
	 9gaEUqU516JNCa0BLwIhNgWOe59T9ey6bmU+Oo/GlTSBBu6gF6Z+JI7cZcdpeg1IKH
	 /m74nBRU5qhuNYIVYNgaevUQ8RgJiLCOvyMvBmTA=
X-QQ-mid: esmtpgz16t1785375268t1c85f4a3
X-QQ-Originating-IP: t1XRpZ4o6lcGRI9OOOHX/bGgPbfkBZgvrZTBJR/xDQ0=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Jul 2026 09:34:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4657412088987091504
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
Subject: [PATCH v5 4/6] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Thu, 30 Jul 2026 09:33:47 +0800
Message-Id: <20260730013349.51-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260730013349.51-1-kernel@airkyi.com>
References: <20260730013349.51-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OKKHiI6c9SH3Q++opc3vzNEYMj/bRFf2b0nejRpXtPqE/Zo+AUgXmumL
	mQkntatbqOVbMYga6jdH6jwlyVT2qxYqToiQm32TPP5Kw5TIri/ugSyT5Edcn4GSdM5aE2v
	iq0UZ16BCPHk1lMu5tH3IFK/mTRTIqNStXm9Z5QbC1DsEBIHI3IoGHc4+HtnRqrDT20SgQq
	k1rCRdN76acftx1ogWDMQ8GHOZdVHtXLJp7A0dqWiikoIKPrghXtfYoKHRhanxiBsE17OqX
	BjrHLGTn2lAPLQiiXUGSGzDbjxQWglmlZ5Evl/D44Xz6BfXToJDLnBTw4plR+MUn2chn0+4
	zlOygEbBs8QvQNzk7Ji1xj6e6M/9RRyOUfj8U9hZ/haM/5XA6Y7f4eTmzD6HB6OG+7EvVPN
	CWPHFCjBzHUl/gpkPyhGRrnSYGCSF4gkUOFB9PJgD/MGouGohtM8f5H3gdUfvpbueaf6+5b
	r23tayUjeRII5FtfIZ5pcHI5kwp4SH5ML6+Gsr7g7rLIRO9H4+gGrn2PmVGw64oa7aYkBVR
	w6957v3XCj9ka6mxp98K+t6ssoeaD4U1Flkg4GNjAuphVIbmrSBT+IBiaeehxU+13lxXIoN
	F/COoSj9mrgSFOyWOga65XA3mSkWPu1cPA8GYCnDBieAgYupXTeVav/QEBtsEXtZl7xNK5f
	JR+UTOnmiUZLKRMARmJFd5v4HLNcXyz1OkVKqIwRx3N1vipOnBa3lduc/CBRJeihaKgFjDm
	lovvbrNkduM5i0EMNp+QrkZ9KTyVz1UUDpt15GNEInb6/uIve6jbsv5VyTRI8A9VRpdXZip
	adnmxtYKcb7SwqHnjfjR90eaVsnakbz5wQ8kD5WwPghpE4ZCOkLSPTqZTvizOh1l9Rc59X8
	UUnKdR9nwucqFhR6E4RMdGHGjIyvOKj5HzeFFRd0YDpmf9NtEflUTGR3ZtzDBEp125iSLY5
	4oFYHTnajZDNDKjZ48H5oc9ka+k16T0FTQnqwQBow/PAwjeIPq6oiot+D8npRtFBxybIiyG
	Kn6Do42jbS3jzRbZuykHbnHtfhHls=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_183518_900561_F6972F5D 
X-CRM114-Status: GOOD (  11.50  )
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


