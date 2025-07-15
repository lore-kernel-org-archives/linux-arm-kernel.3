Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B9CC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/b/lAhCvsonGE8Z852+2G/07p0p8yhZ5USq40tfyzbw=; b=B/3pS4klNC3F2uXIMCoZUQPjaA
	u7RiXBFR1DxUESJxcyOQfSfabLEm026kPYgZlrgOI0vPT15tjTRhDoWGWiMRYZ84cgum/KoHIqRdJ
	ZxNUuhf+h+9iwAsDQFJGAR1nXhFrNOeatQt0rhj7wSh5Hyk1nkDt1u1l2TapPZDEF3GLroDy1cktY
	/uFkQVOfw3XEQVz4JybS2dQuPBCd4HtK7XSFELjke6jrklmDLH0sOcy+z9sWpUiCpoCpjQqJp2dmu
	b/v6q1cL2b76908P0lM0h8lBxoSK5/CBy6L9j5jj1tY3tPqDDsTXOh+7q8Zye/2vo2LS3GaiDrh4B
	ywD/QZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ube3i-00000004yJr-4636;
	Tue, 15 Jul 2025 11:42:54 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdng-00000004w8V-2yuI;
	Tue, 15 Jul 2025 11:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1752578720;
	bh=/b/lAhCvsonGE8Z852+2G/07p0p8yhZ5USq40tfyzbw=;
	h=From:To:Subject:Date:Message-Id;
	b=FL15sK4k1wtmu4XkiLSYu0oyzgUqZwPWuTiS3BWi4kjdU6Crn/dq2AYEMLsfTBJT5
	 4krZCWwpMDNMEiL+nHsn8adzymzEsNFDQGzvlmZZct4bKzOpRgJLxz04+JJ9B9jHHL
	 Q2zwp290XFRcxMGh2eibQxhqEGRKlzIjCY5X1WdU=
X-QQ-mid: zesmtpsz3t1752578718t9af83c66
X-QQ-Originating-IP: 9mUY+DgpKeGKBIqUqnlFegV3kCI4AR72owXY37bfQwc=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Jul 2025 19:25:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15861609550683848417
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/rockchip: cdn-dp: Add support for Type-C TCPM
Date: Tue, 15 Jul 2025 19:24:55 +0800
Message-Id: <20250715112456.101-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250715112456.101-1-kernel@airkyi.com>
References: <20250715112456.101-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NYz8c2bcbB9MQnNn3zMpWCyy1wOJpwH1FI3r+N0Of+zkM4IeDaarohS6
	2TB+9N1Q5HxUwcddBd1NwAaMW+owNwEHngX+SJM8ipoVSgPy5GLFccR6d65+flcYIrrKXnD
	iekzUip/Phux2bJ5vgX22crFnC5moFuaclTB2sOO1RNGAHUX/nFB0mof2uhl5LYHsbdKg3G
	66o3ehFXcxXLi+xWgEsJH1aiQxvH8JhCDayo8gj+NowF+V3BzLyJd46qoxFxHfgKr4MoL9J
	/R4/LhJcNWO+Nm3TtlZqmtSOzp/EQl8MfsEWVMCrUeSn9iqq3BOmwCiiT6H8EVFszGobsho
	l6WCukfoYv7aLx/egZlBkaZ8gEjLqO4xeTRERq8tc8RSulhbxT9QXnuWa0rhMbgLQH5G3Iu
	7W8ZE6YiMlhy7vQbNfp3u5Jfc9TloFaAR3F1RuTPzc4CyNH0qLRSTVcAR9ksrJBu+FXqvTP
	OBb4IsVwP5jJGPfEpTn3eW71tSByYaMaVJvdUB3zTOSdCIKnIf+Mb8f3qjmNOWAf/l+Enon
	7SCv193aALXdKgPToJWOCle2FLzGQko7BSDUVKLqNZZIYHH+R9gw63KmtcUC7z/Nr3+BBjz
	HW0/xAWVCo3l16Rmwo1PkkLXyWenrLO9jO01pQdC5foHq3y5cwgGIszUE2Bo2cZliGYeoOq
	FDE/ukclS3z5tl9FqvT3aboEVifNc5RkNCYNJ56BUz9EI2TCRBclPqNxQ/1m82e6YH1z7YO
	dV2aYYuGUbLF3Z4SvZdCUQC0UCx7LJLYB/SNjpbOy3Ef60c+jOpD5fM1RhGrr8QUErT0ZWG
	34SpWsU0Cc6l1VaHPaUC4kgmjpRgvrbch/S/D5EiqaJr6sTDKBouNLXPhPCPvnRr+uFDTHG
	GZWoN+6l+6o4nPRiqnTDTcM4lJgsKNt9j9ORUCLfUfIi024p/99WRL1qD5R94GDLDK3xTsL
	OxS7ezP71+E6B96iLeNW/GcBz4SvkasqHG/Q7AQtu/v1yKw==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_042622_904158_A17D7D35 
X-CRM114-Status: GOOD (  17.52  )
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

This patch add support for Type-C Port Manager. If the Type-C
controller is present, the DP hot plug events can be notified with
the help of TCPM and without the need for extcon.

The extcon device should still be supported.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 37 ++++++++++++++++++--------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 24f6b3879f4b..3354d0e4ae4f 100644
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
@@ -821,6 +827,14 @@ static int cdn_dp_audio_mute_stream(struct drm_connector *connector,
 	return ret;
 }
 
+static void cdn_dp_hpd_notify(struct drm_bridge *bridge,
+			   enum drm_connector_status status)
+{
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+
+	schedule_work(&dp->event_work);
+}
+
 static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -831,6 +845,7 @@ static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
 	.atomic_disable = cdn_dp_bridge_atomic_disable,
 	.mode_valid = cdn_dp_bridge_mode_valid,
 	.mode_set = cdn_dp_bridge_mode_set,
+	.hpd_notify = cdn_dp_hpd_notify,
 
 	.dp_audio_prepare = cdn_dp_audio_prepare,
 	.dp_audio_mute_stream = cdn_dp_audio_mute_stream,
@@ -938,9 +953,6 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 
 out:
 	mutex_unlock(&dp->lock);
-	drm_bridge_hpd_notify(&dp->bridge,
-			      dp->connected ? connector_status_connected
-					    : connector_status_disconnected);
 }
 
 static int cdn_dp_pd_event(struct notifier_block *nb,
@@ -1028,6 +1040,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
+		if (!port->extcon)
+			continue;
+
 		port->event_nb.notifier_call = cdn_dp_pd_event;
 		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
 						    EXTCON_DISP_DP,
@@ -1120,14 +1135,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
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



