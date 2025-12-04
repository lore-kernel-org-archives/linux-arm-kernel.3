Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2E9D1D86A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 06:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEWMlrnina66f1mkg7MgIF551DMwzRk8lseSsYVXv/E=; b=mqejF1WT7yOInFgHmObol7/P3H
	g0t/fO3GJDFLYuNXuHsaolxvyhsc6KnCoiCNjw1t5dOvWDPFtwapAlcBcxajeG9KW4x4Oq16yWyUs
	Auv6/iE25bqkjTkhC2nP8dbdE+TrDtgOOENGMa9ljPlURcsh23eQ0A+Mrw0Yz9jJq0FU5kfBynUH2
	R2b4RhFA7DYADSnYF1kjDHytcfrJVZy4dQZlbMYhVWkuc3gBN0QEgBYQw/45OeifiPqd4LK/isnjW
	TdnvGqKbf5GiIVgsRmYdxZShVUGwa6Fn6vWf4kw6Fs/9PI5aWOFud380cXOj73xX0T+b33/2yIPA1
	t3rlp7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR2tU-00000007Yew-3WlV;
	Thu, 04 Dec 2025 06:32:48 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR2tM-00000007Y4l-2JFd;
	Thu, 04 Dec 2025 06:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764829916;
	bh=sEWMlrnina66f1mkg7MgIF551DMwzRk8lseSsYVXv/E=;
	h=From:To:Subject:Date:Message-Id;
	b=vvP/kPesXA+7oHk/b3ZYPbHTOhJK625t3zAuQFR9PGinBsSIfpW2UEzNbv1jwT16J
	 rwzjI2bdtIBtj76/uC9OVO4+LGGz54af+8SYitr6gO0WcpynaRQGd4q53UweLJ6By7
	 KTFjXg/6N3C3Npv0+9S9CCUoMZm96T2IbN1BnMBY=
X-QQ-mid: esmtpsz21t1764829914t2fd6b4c4
X-QQ-Originating-IP: hZcaALHRrEsVfm0KjmfXoYxrbuS+HXMQE8GZuYKKMRs=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Dec 2025 14:31:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15523287474002060111
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
Subject: [RESEND PATCH v11 08/11] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Thu,  4 Dec 2025 14:31:06 +0800
Message-Id: <20251204063109.104-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NYz8c2bcbB9MQnNn3zMpWCw84OuTnnaBtR3IOF77C7I9xS/PAALwSJ2H
	0sL6L8qVFgwchZt+l6eR8k+fogUmYShJ9l/KScDn67FYQsR3lOLVjARu4arUMycW2xdd0bs
	LrqirVpHnLXmivtsZ0M0gV+YOl1/UUm7PAhwElTKIilhOlNrBS6YKSQHqJl+N2RWWZVD/0W
	1Gp8vS0YzOXD9VA5CUSr5hm9j/ZAtpx0YfOqC+mhT/ygnzgzdzrjyI9nEMx4YskoCMcM6pU
	k6Bm+3LnsKiw8LeIQW1JHUxftNDjYnbSml2HKqwPDXal+9Nam5QLpNJOzF7AxE8mtcFaJKF
	j+kw51Luw2/lnsLOtALM19NPaVtw1RPMC4DiqcMfE5A0iCUwzWinwpSO1QJ6C+xH/k/ZlDr
	5TcZMmEoqnrFLKSFV6HEWCRG3mUC1rCC4mtPWO0HCFAHoR6WCgRIae9rrgadxU7BXiLYZYN
	kZlN9J1pPyJb/BgHhyBPNg1nSBqVr6POvXj0A/fDg7GIX1rnPZ4aeRSxcnInxd0kQ99cYGI
	FHxyIQbsydqYZtsxqRCcEiDt18qNi1SpdM6qFoQyGq0jz4i2nzzMzto67L3jwOowWxXdhV6
	mI7+ZyerZ3B4dHlVvIvjPIKeaxziFTv9ZHBa9x4mn04YeL8SRjWsXyVycgd/Mys6tKUgtrt
	9wPZNXEl2na3JBViG0/ene0HUdzGpDsOhuT4QI1GPgkiRLEK9S+X3kj4UxislBVJRDvNS9e
	JAS/NmxYsX58WIBfpTy/IeTE9kiS+gCSVWT0zkk53d/O6vLHf9wWuuzi+DoHPxlI+D7r2Dl
	2Mc8H30G3WFy+riHawgmTyyW+kBtAa1JmG7dWu8mgc+XxmKW8qnybPU4HAFM7LLfIFtJ0RF
	rz8E/aQ7o1F7gcdbGz//iLHWfrbuSPtnHMyh+gVPprFZRBc8b+YJQOMnUWRrNWg9S7yJXP/
	SlTTEZAKk835sagmMqxBjsTqEpziBZx4moMEh+b8Y/hkECWhpgXApDE+SqyPc/6EFS468vY
	SEk1viSwTtoQWb1g+ObxtpPs5xfWD4WkIC9mpphw==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_223241_435237_5860B31D 
X-CRM114-Status: GOOD (  16.73  )
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
2.51.1


