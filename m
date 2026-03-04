Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CA2EB7EB5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2+PAKy3j90tO2/aruykNQqG1CqbsF2c64m7OhVP2Wo=; b=KEFz2TtI5M1GuAI4v3I6q8VRqu
	493hgMg1ZRib8lzVLIgeG/zb+AbOPn2mi4o4HNzOJpsyWnJDyg8tErhol78/9Ex+fyzdlceKxU3nE
	NPKAWqt1Gu5vmoCJGw8cInOhoXVV99T90quQ4L4cknqn+e/2+Go8a3PE7EqlSBTAaStAz5kpqUa1e
	K0Ma/e8jyLUGFXFX60cWeqlfCh9b/5RxHYEIp6qMoHk6LaeRcX75/JXQc8msf2MEJWoxnc7G3NChY
	smDZL9Qy78pmNoj//2j66P2zD+kvJxG9EkGKIZZQGLI8DLDKgYJGvrBKasylQB0gO3TF+7ROVtNQD
	1O/o/l1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxilw-0000000Guo3-1KuZ;
	Wed, 04 Mar 2026 09:44:04 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxils-0000000GuLU-03LO;
	Wed, 04 Mar 2026 09:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1772617382;
	bh=R2+PAKy3j90tO2/aruykNQqG1CqbsF2c64m7OhVP2Wo=;
	h=From:To:Subject:Date:Message-Id;
	b=Y+i/irw39SRthCYi17vIiFz3X5GoHTDAXGt6w0v7uFHL6+cISxYruQ0KI/lfDkGsq
	 9JuJ+IKA6k+wLW4b9cD8C3NC4ycrZ9vj4CYbuzMDWtngMhlw/wOqECMarKoEVwx1LK
	 AGTXhsXth87cF9+xermIAJ47x2+2bhuhVW1q0St8=
X-QQ-mid: esmtpsz11t1772617373t9823613c
X-QQ-Originating-IP: pF7zHsE/j7q7xL3YC+SAOsJn9ScNFV1FqEKBp2TMTwg=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 17:42:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9974403260867921105
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Hugh Cole-Baker <sigmaris@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v15 6/9] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Wed,  4 Mar 2026 17:41:49 +0800
Message-Id: <20260304094152.92-7-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260304094152.92-1-kernel@airkyi.com>
References: <20260304094152.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Ncpnai4dwVTH8H+DRUsvt671Nh3G9ct0psi2CvHWwdpWAJQwWX2LKl52
	IiHcPaGoly36mK0ZrSxyBsrPzkQYE1Ws2cF9K8GM5uGtpsF2BN1boUiyCKfC2Bru9FiIUAj
	8cogOUS2i+Q749SwFKZsfaYA1EmO7Da5YX+W8id190PMpMfQexubT8WG69oY1LaEEUZeMui
	9VhhcC8hXGWLFuiYN+3LBdeztj7Gf0MtegsiSoN3mzrjj7R9HkOTRF3OOs66xHbGc/oi0g6
	mkJmFwej+Vsw7WgRgB5vaBXfQLD61/JjyyPPGdSeoOo/Q6fq/lOuZ3qZXRh7I6DCegbTnVr
	BxH67Scq85/VaspSfrugFnOX2UZVJ3K7TmsmAKeLYncVEEum9XO1ZNzKuzq3ChVAFGCqygO
	/goUT4l74jJCWiGVnuwW8q2oozQc+jNbCo/3BDxX7x6DaP6JfQveqzUvSCxyyH7+ezgdghb
	pDayapGy/if0D+opQvoimVrf3JJONyRnu0r5XI5iDDcpejLeKBaYR7KR1PYsOLuQzONHewz
	LBi9JKtA7YS5qhhFp0zn36lcuIPYOQsgQw7bk7ee+gwFBl8VUZ1Se6xSSfiEfVjKLSH+SZm
	9qdhr09FHa2AaYYDxsr4HD65vZd12+kP5J01r7DW1g1np/EsXrrYtvNVI7q9I0K2fHozidF
	uUpl1veCQGgrbX1tjAp4WXGEMqxfuh0m/BJ96JojhZMjtteea5LiYO0PNdl+WBjqYLoNpyr
	7TxyHYmLq+b2t/azMdtfxTeU5YUXiEGTBmxsnYymQHS+ADsDKpaHHQnIF0XqJNxLkpwH1nn
	oDTKKUGW5GSEpLjDkrjUZ5LYker0N22FH6c/x1zWmaEvd2BcgKFzrvEfpY6I/vZLlXdUIIz
	D+e7y21oTPDFLDXk4SzJH5CGWJS0o/YaS3mUEWZZKCTgPUKODnDHbQe1c3ZuZABTb2zzOfv
	eJCdUQMybgKC3eiWYcNob88+dNr7DDxhpFWg0l0En76/UzhLzNhMVUju7uTTdKALghsPgA4
	g1sKpVY61qO7FsduXhiRChJmokLzB00mxl8VlUQw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_014400_943973_BA43046D 
X-CRM114-Status: GOOD (  17.01  )
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

This patch add support for get PHY lane info without help of extcon.

There is no extcon needed if the Type-C controller is present. In this
case, the lane info can be get from PHY instead of extcon.

The extcon device should still be supported if Type-C controller is
not present.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v5)

Changes in v4:
- Remove cdn_dp_hpd_notify().

(no changes since v3)

Changes in v2:
- Ignore duplicate HPD events.
---

 drivers/gpu/drm/rockchip/cdn-dp-core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index b7e3f5dcf8d5..1e27301584a4 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -156,6 +156,9 @@ static int cdn_dp_get_port_lanes(struct cdn_dp_port *port)
 	int dptx;
 	u8 lanes;
 
+	if (!edev)
+		return phy_get_bus_width(port->phy);
+
 	dptx = extcon_get_state(edev, EXTCON_DISP_DP);
 	if (dptx > 0) {
 		extcon_get_property(edev, EXTCON_DISP_DP,
@@ -219,7 +222,7 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
 	 * some docks need more time to power up.
 	 */
 	while (time_before(jiffies, timeout)) {
-		if (!extcon_get_state(port->extcon, EXTCON_DISP_DP))
+		if (port->extcon && !extcon_get_state(port->extcon, EXTCON_DISP_DP))
 			return false;
 
 		if (!cdn_dp_get_sink_count(dp, &sink_count))
@@ -385,11 +388,14 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
 		goto err_power_on;
 	}
 
-	ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
-				  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
-	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "get property failed\n");
-		goto err_power_on;
+	property.intval = 0;
+	if (port->extcon) {
+		ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
+					  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
+		if (ret) {
+			DRM_DEV_ERROR(dp->dev, "get property failed\n");
+			goto err_power_on;
+		}
 	}
 
 	port->lanes = cdn_dp_get_port_lanes(port);
@@ -1028,6 +1034,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
+		if (!port->extcon)
+			continue;
+
 		port->event_nb.notifier_call = cdn_dp_pd_event;
 		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
 						    EXTCON_DISP_DP,
@@ -1120,14 +1129,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
 		    PTR_ERR(phy) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
 
-		if (IS_ERR(extcon) || IS_ERR(phy))
+		if (IS_ERR(phy) || PTR_ERR(extcon) != -ENODEV)
 			continue;
 
 		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 		if (!port)
 			return -ENOMEM;
 
-		port->extcon = extcon;
+		port->extcon = IS_ERR(extcon) ? NULL : extcon;
 		port->phy = phy;
 		port->dp = dp;
 		port->id = i;
-- 
2.51.1


