Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1ADC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfSDcA/VFf5O36XZ1jIbDeiIvlPOe5N0iYnQa5D5SVg=; b=jFogPKTrSSCIAO9p9uPwgkX0Dk
	na7Rna+qO5OAFJbpKRCpjuUPHTo7+TdoM7oaruvYTtnUBPKNfYISw28DPj2Xx8wY+nu3GrwVAw3IP
	rJWpDxzeckbeAk67xjMqEHOn5fOk6/aVIyAiw+Yq4fTiGXhdhb8I6FOLJtANAEn+UqK0x7j2g6w+P
	/4HTBfm7+R8AZfUhTdY2G6t4SfzATsF6cgEMlM9u9mCXlx1Mp23knhJouQZncyWqiQQh6l5dtd+EF
	8D1xf9UhlDhJQx+2IxRYVfchUWdBZjugaQVyHHLIVliMKwJYLIVrep9mwEedD8VGWqX56U7SZN5+v
	EuqnXMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcyN-00000001RRa-1uS5;
	Fri, 17 Jul 2026 07:27:03 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcyE-00000001RE3-1CYu;
	Fri, 17 Jul 2026 07:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1784273038;
	bh=hfSDcA/VFf5O36XZ1jIbDeiIvlPOe5N0iYnQa5D5SVg=;
	h=From:To:Subject:Date:Message-Id;
	b=fYXEyAssbfHboxP5QdcQ6RM2gOmJnmbbZPGsTBD8SPtT5gd9wFAY0UGeMT42MDXjg
	 ukdaXkyvlWNUDsUmO5b1iLRbYYMRG/QeFAQFz4251JelGmBGAojVXu38G0dj288PxV
	 s4kIBlvRsQ0tUQ6lT1r3APLRPP5/q4mEgB0ZxaLk=
X-QQ-mid: esmtpsz21t1784273037t8aa6d3dc
X-QQ-Originating-IP: 0D5wUK+GE2YIGxT4HuuhDJ2D57emU1+Gs34WtC5gClQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Jul 2026 15:23:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8582860570799389207
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
Subject: [PATCH v3 4/5] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Fri, 17 Jul 2026 15:23:22 +0800
Message-Id: <20260717072323.96-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260717072323.96-1-kernel@airkyi.com>
References: <20260717072323.96-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MyirvGjpKb1j4ajW/h+h1TDId9lYcfgTEOsAICrRq9y1W44g/WIDA6L6
	1JWZ0h4PwjzvF7e4k3ixjIK9UwIEJwaET8qNWs2PnJI8hQfasLNmNRXrpQycPjW3rv5xQ79
	wt+8gbNqvaD6mdJptCUnIq2OEXaePOyrkb/k0b7Phsw6d70ijk7lbBUKfFGqgBDjF32iV4b
	qyra8iqbYK7X8LxqFE0M19xYfhHKFTMCwGYJX8AVXtXOy0dwuVVPPBbHz9KdW/p0zc5HXRl
	jZKIseDiWv27v26B+yZB6NrF8uteC1iepCxC0cIfh+w9fYUDpH8WmU1ZTpG/SNgvL6YKj/i
	cWL9wInqWxMyqzznX/JMEgTW/RiD2tM0wgjL6i8LELLmGx+U43kMxyOuUUsDo84boQ61ujz
	q1Zy5MLXCjSS3nzziQCUl12imVu3EKoXIxxb5wPPAHOQAReGMHuxha2poazmNdbtpIV2PPp
	slyEdY9y8rw2SfehD0I2dYShbGaPT2k6T03HmT7r+S+gRvFO99QWLbeoopn7mRoWg6GCrlx
	dBa4LXfe/fGZsMi8uJRfYgNk2RY28/6eONbtPt/ufC57K8pny3zG3hL+bheoIUl1gmRNCaw
	CWQI1rNn8SXHwbn/+F7wESzmxW//eu7Tx6drkXJDkdrqAoGFdXe6wbACNf7B5h7JuL2jJjt
	qZrXRQ6JiTUHIKytR55lC/ZstWZ1oKaGjoiBMNE+5sdEDW+taX9xVgzDUC3dQYcXK8Hiv5o
	/OSRMq6bu7gRQnBNvpNBVjJFRYnM3GrvidG8FdyUS4wdFl5UMHra7FpUauzPEL0cWu3YNBB
	ZywkpWayYDk+kW0RdDCHHGqfq2VJnyQiZK+l7/XaX0Nc71bUU7qwyVFPILMsaguABMZwoCf
	8iOlMTqbi9wnOCpR3IHqv1sXLq0jsJfEbdi1Cb0/6dn5iCvqPVgY8ALM4U5DzDuM38uj4X5
	98JR4Cjm19tvDfzNsdjFnu1VatTol4AB3LXhBGoZzxTJBCw5sSgekfvAnQASVeyips07zXK
	ZkbmqqoDefXCroucMWu4TUw+a3LU9WeESH9O8nNg==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_002654_823602_4B8AD0FE 
X-CRM114-Status: GOOD (  14.96  )
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
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

(no changes since v1)

---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 190cce9530c8..74e1f5422a6e 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -157,6 +157,9 @@ static int cdn_dp_get_port_lanes(struct cdn_dp_port *port)
 	int dptx;
 	u8 lanes;
 
+	if (!edev)
+		return phy_get_bus_width(port->phy);
+
 	dptx = extcon_get_state(edev, EXTCON_DISP_DP);
 	if (dptx > 0) {
 		extcon_get_property(edev, EXTCON_DISP_DP,
@@ -220,7 +223,7 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
 	 * some docks need more time to power up.
 	 */
 	while (time_before(jiffies, timeout)) {
-		if (!extcon_get_state(port->extcon, EXTCON_DISP_DP))
+		if (port->extcon && !extcon_get_state(port->extcon, EXTCON_DISP_DP))
 			return false;
 
 		if (!cdn_dp_get_sink_count(dp, &sink_count))
@@ -386,11 +389,14 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
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
@@ -1027,6 +1033,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
+		if (!port->extcon)
+			continue;
+
 		port->event_nb.notifier_call = cdn_dp_pd_event;
 		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
 						    EXTCON_DISP_DP,
@@ -1119,14 +1128,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
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
2.53.0


