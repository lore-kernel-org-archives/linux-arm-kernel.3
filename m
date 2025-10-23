Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F51CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 03:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQG0w7dhU7Aew5bKV30plkPn0nBnVdgTnfwSbxYLntU=; b=BZOqes9ah0n3RqgE2wT8cQ1RVI
	H9Eh87UDP5W7vETsFTB6mO8ic3ELAmKY5PyUgW8fz08YUZ4xJVIZlB+HH9psv/B4Nb9lRYcGSfBOo
	mWvA+ZSHmVpRrZua3nJAYV4ZBzDQ6ncG1feqdxhIlH78+8lXvzDEdvAD4aF/K9HFkGUhvpNfZMZc3
	vF+dIXNxjL14yF7cKQOia7nLGGBjA8BfxWwVZwgEyMRPBAnBzmFRdOgGRQO4ylTtAwd8X0vMDjYKY
	7SmZRwo5wB1FMxCLPX3NxHcHfBFVou98aYkqsNp02Wu1SofvL7l0VpJjM3BIzy8wYoNqDxq8ki2CW
	tBro9ALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBm32-00000004wCI-01JE;
	Thu, 23 Oct 2025 03:31:32 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBm2v-00000004vpy-3qZQ;
	Thu, 23 Oct 2025 03:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761190256;
	bh=nQG0w7dhU7Aew5bKV30plkPn0nBnVdgTnfwSbxYLntU=;
	h=From:To:Subject:Date:Message-Id;
	b=Bl6Jik6Jxip/hTqiPay47yYQOKK0urbSQ+11av+8o1jdXKbPTwFeWy2ByYb9MANdS
	 q3IhxOhu5V1re2mD+0huqAId/Z7+805LGqrxh3HRvCvbq/7vy0IiTM24aCmGqyjRRQ
	 oain0HVh0EXyaC9aokU+vXoMQ5D2CV3C4CVOUUJU=
X-QQ-mid: esmtpsz16t1761190254t76ee6809
X-QQ-Originating-IP: ry/u4/8KR4C2zosHm3ALD9iejKzqUxaT+ZTDF/OGwF0=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 11:30:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13604929082984056362
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 6/9] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Thu, 23 Oct 2025 11:30:06 +0800
Message-Id: <20251023033009.90-7-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251023033009.90-1-kernel@airkyi.com>
References: <20251023033009.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N+aOzryTDkdC5TOsXVCC0WKSzV5F98nb9pI8IwZiHMt3xvfr+pGitVZ4
	3l06+XIvSFBbVjWWdoqBF23sQYxAQBo/q8gkxB3OvdRna9WfofjaBfSYJSQa+uNkXT1UAiE
	0tfIhEa9XHDqR2CZRDM8GCVouPV5RNrPTuA1CvhWmA/FDIVOFDB/KfzhVkunwY01Nhz5WKh
	uDArCOSG1pUdR8B5MJijKDyzQ1qrPOMADTpAKAAsG3ocHphE4nDahZELBlfE9CY7oL/ikoS
	rNxSClIqQiKFp3jTEbxOFMhJ5aUeUs5GAsz9jasGqraYRCi1USNYGUCM/d6BHzPLmNaLWKw
	2SuJTq49Rbq/g5o7brJfXMn9wGudqA6jLBk8iwqujqdbXmf4mAFyvwHBC2TR0mvILHw1cGB
	FgvwGbeTE3l1epCVZcjLVby0TDKAVXCIw23RLtvuaoW0DPYreYmW4kGMWOHHPSKTNgSLGzF
	/NVs+B74nde/Jq6l+mA/SzdYJ79MuTauzOqkGxZqd3qzqhSCFqbnAT8A4I5Coc1KUZ2BQEB
	F8I3tKL1HhR+KkZg3I9YaII9WTKpZVsodsXYHhMmWGjWFBfI9jlv9QbdcJZa14XvIWQqAvt
	EObHv+6lGrMo7oPoFDug/K13KtZnYQ01OziWVx769wI8RjqRfiJLC/RUjWe4dxUynfS8Ig5
	8mMCZWopgwK6CpYGHrT+nkKysuJ2IBpJckTl/HHnCQpxpRn7uxHXkUnaUdBLtTbcK+N0jyh
	Va2ZUhxlhF6TH5eA4NG0hLhw+bbwgRag0pXQfzhymvg0EBYwLhXM35SukPIDtzgSCrTISlJ
	iUGptvRAz3Qh/Pr+A0cQ+8Osr1HSlkK9e8bhyKBfku7wKo8nbKq98GSRhAChXiBSirh9lwk
	ngMUlHt+fG0V1ZrjhGc94d7aETWXAf7lL2fMIGi0amDyMGdwHJP6aMmCzQknQ1NRQ9sODUT
	JpbeQIKErwpzCD6n4Yly9f23vN+pGJ7yiKOaekCkW1bkiYWevbe0PEqCdZAY/Mq+VmzCRmH
	jaOTLw/71n6+4XhZahiPb1uMFTWGVyid8AaIroRA==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_203126_769721_0C29C45F 
X-CRM114-Status: GOOD (  16.62  )
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
2.49.0


