Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FE9C531D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvl3lul6lS2dVKlMleOGMTYaeptAc7MWBvFtyJ2mfwc=; b=MIGnJtjw6aMt9TQET6GxDU7+5G
	dCsLW+BpTDKEMh8VxGPH4bToX/vgMkq1hDmejZst0owk3qNxLgARsdfrPyvm6X3BjLFO8Kf0rE+TH
	FDF1a+hyNedQgY+ROo/66c40bDjKlVda1yHaR5YiTp4aVze4a+FasEs+pvmixw0dEDi84SSWczYzP
	toX+M3cfUr/S5B+VuwOvjr//YG0sh0Ry4E6Oox36adLkrwSbFDu3KKenr9F5nP3GVFqxzY3m7eJY9
	ZYTlUSJE4HgM2u3ehCqBsiCn/5AJfgBXqDG3Ygw4ch/o756PFmRaEf6MQgXDbPgxEDkET3tw0T+mK
	DOA3eLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLq-0000000D45i-3kzo;
	Thu, 23 Jul 2026 01:35:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLF-0000000D2ye-3wBP;
	Thu, 23 Jul 2026 01:35:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770516;
	bh=2geCQNKhnwPXaJ/bHUlwxRKPeZYSVig3y46QWPBRk50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BZytFqV/0RBDH2izdzsIUK80Bjmokva2f8oiB8+Xpgs4+K/DcHTIcW6oXzxXc5J6b
	 9hwzK7zt4mNcjPHSUy0gvb2f5/7MnekUmTqtAstA21oEun8FheRn78dAc6WiRCbZIu
	 DqlXrygikif7kpMtm4uSUS2E9e66F/zLkypNth79eVGys+1ylnovXbkOoOBte3gpXl
	 uF3K39Tg3szNuLeeAmx7Hp620ptljfv5go4jVt+uSxRH5EjO+yWxlbXwl8K9RBt9u5
	 Hp/l9rznXkvGzTBlOOR5diS0m5GiRMu6bPdC3WzYe5PEBm12WbhmYX/3a2BBdy7K7i
	 AHPHqkQNUkCiQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0913117E124A;
	Thu, 23 Jul 2026 03:35:16 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:09 +0300
Subject: [PATCH v9 20/61] drm/bridge: dw-hdmi-qp: Provide
 .{enable,disable}_hpd() PHY ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-20-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183518_139038_1516E0F2 
X-CRM114-Status: GOOD (  10.37  )
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

Implement the .hpd_enable() and .hpd_disable() bridge callbacks and
extend dw_hdmi_qp_phy_ops with corresponding hooks.

This enables the DRM core to control when HPD interrupts are armed,
which is needed to prevent premature interrupt delivery before the
connector is fully initialized, and to properly quiesce HPD during
suspend.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 18 ++++++++++++++++++
 include/drm/bridge/dw_hdmi_qp.h              |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 7475b6b71836..a0613f0d2ebc 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1189,6 +1189,22 @@ static int dw_hdmi_qp_cec_transmit(struct drm_bridge *bridge, u8 attempts,
 #define dw_hdmi_qp_cec_transmit NULL
 #endif /* CONFIG_DRM_DW_HDMI_QP_CEC */
 
+static void dw_hdmi_qp_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	if (hdmi->phy.ops->enable_hpd)
+		hdmi->phy.ops->enable_hpd(hdmi, hdmi->phy.data);
+}
+
+static void dw_hdmi_qp_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	if (hdmi->phy.ops->disable_hpd)
+		hdmi->phy.ops->disable_hpd(hdmi, hdmi->phy.data);
+}
+
 static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_get_output_bus_fmts = drm_atomic_helper_bridge_get_hdmi_output_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
@@ -1197,6 +1213,8 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_enable = dw_hdmi_qp_bridge_atomic_enable,
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
 	.detect = dw_hdmi_qp_bridge_detect,
+	.hpd_enable = dw_hdmi_qp_bridge_hpd_enable,
+	.hpd_disable = dw_hdmi_qp_bridge_hpd_disable,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
 	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
 	.hdmi_clear_avi_infoframe = dw_hdmi_qp_bridge_clear_avi_infoframe,
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index 6ea9c561cfef..b80fceffc315 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -17,6 +17,8 @@ struct dw_hdmi_qp_phy_ops {
 	void (*disable)(struct dw_hdmi_qp *hdmi, void *data);
 	enum drm_connector_status (*read_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 	void (*setup_hpd)(struct dw_hdmi_qp *hdmi, void *data);
+	void (*enable_hpd)(struct dw_hdmi_qp *hdmi, void *data);
+	void (*disable_hpd)(struct dw_hdmi_qp *hdmi, void *data);
 };
 
 struct dw_hdmi_qp_plat_data {

-- 
2.55.0


