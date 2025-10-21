Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0FACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSdyP75s+qH19CU7JiwgBpzb/FMw0dtgnSzqlfpGTLk=; b=GlZuTSoNT2ekjrir7Jbwo+lmhD
	r6vClxLDVw+voE23RoGAnHKCNzCC1LdIqVi1mYN4jMHXT0hB8vfulcxZ7RM4MTqHLZKamzvdR0eXS
	ivp+M1MS1jaj+nu8WL4YyiJUS337OpfMROOMxo3ox5fTcD9v6jFz7I/LIPKg+b4uUvY5igGJSo8Y1
	RHmGr8i+px4zpkF+aUqFUsQvc2Wikk/lyAHZBOYFpWh8lKEgurFt6o6IwvMngqdSvnZhEbE+t0jXy
	9+CW4lalMnHLnHUU+1qY5TUjokmrb14vgRRnJXb05Xcfiad6L62qkjgPydRdr+iLE/0lfc4jrrT2A
	Rj8g5kXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9Sy-0000000Gb7M-3zFW;
	Tue, 21 Oct 2025 10:19:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9Sq-0000000Gaxz-3buw;
	Tue, 21 Oct 2025 10:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761041972;
	bh=Oq23yGZ/GtFdV1bxn1QAep1nMXJorSEThDKlDL/e8Ec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kIGkpJlAeylMJRXzfCmSUMtS0keJbPqm8Z9JcspzOjrzHj46Er9JoxjYPE1fVI9q7
	 H1XO4dqZDTAQwwOa5Vf8v6YziT5LVO05qpUi6IPaXJXKAmoPYpNO+X5kjgrxt/U249
	 QEe11QEAQz8RpY/FDBm/m18V0bxJEN1miKxToZ935lhji3LE/PsxCgOSoQXkSE1drh
	 0/ZNacYRTkyOe8lBz0bMJFh82bPxalZ3IkzR5G4oKpjGzFh6yQJoNHhXItyJ9fV0Y8
	 dZhxEthXWlFqmjYFRoqMTD35idig58BL8W8sWVYAnAe+h1Y8aY+NWWOu79K3gLDL3w
	 GuRwu8p2jwQbg==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 2F35217E1414;
	Tue, 21 Oct 2025 12:19:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 21 Oct 2025 13:19:18 +0300
Subject: [PATCH v3 5/5] drm/rockchip: dw_hdmi_qp: Add high color depth
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-rk3588-10bpc-v3-5-3d3eed00a6db@collabora.com>
References: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
In-Reply-To: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_031937_069555_4E6F3613 
X-CRM114-Status: GOOD (  16.17  )
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

Since both RK3576 and RK3588 SoCs are capable of handling 10 bpc color
depth, introduce a pair of new helpers to program the necessary
registers, as well as passing bpc at PHY configuration level.

Note max_bpc is unconditionally set to 10 before initializing the QP
bridge library, as there is no need to adjust it dynamically, i.e. per
SoC variant, for now.

While setting up .enc_init() callbacks of rockchip_hdmi_qp_ctrl_ops,
also replace the unnecessary whitespace chars before .irq_callback()
assignments.

Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 54 ++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index ac5ec697b9a2..ca3fa3965302 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -70,6 +70,12 @@
 #define RK3588_HDMI1_LEVEL_INT		BIT(24)
 #define RK3588_GRF_VO1_CON3		0x000c
 #define RK3588_GRF_VO1_CON6		0x0018
+#define RK3588_COLOR_DEPTH_MASK		GENMASK(7, 4)
+#define RK3588_8BPC			0x0
+#define RK3588_10BPC			0x6
+#define RK3588_COLOR_FORMAT_MASK	GENMASK(3, 0)
+#define RK3588_RGB			0x0
+#define RK3588_YUV420			0x3
 #define RK3588_SCLIN_MASK		BIT(9)
 #define RK3588_SDAIN_MASK		BIT(10)
 #define RK3588_MODE_MASK		BIT(11)
@@ -97,6 +103,7 @@ struct rockchip_hdmi_qp {
 
 struct rockchip_hdmi_qp_ctrl_ops {
 	void (*io_init)(struct rockchip_hdmi_qp *hdmi);
+	void (*enc_init)(struct rockchip_hdmi_qp *hdmi, struct rockchip_crtc_state *state);
 	irqreturn_t (*irq_callback)(int irq, void *dev_id);
 	irqreturn_t (*hardirq_callback)(int irq, void *dev_id);
 };
@@ -111,9 +118,16 @@ static struct rockchip_hdmi_qp *to_rockchip_hdmi_qp(struct drm_encoder *encoder)
 static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
 {
 	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
+	struct drm_crtc *crtc = encoder->crtc;
 
 	/* Unconditionally switch to TMDS as FRL is not yet supported */
 	gpiod_set_value(hdmi->enable_gpio, 1);
+
+	if (!crtc || !crtc->state)
+		return;
+
+	if (hdmi->ctrl_ops->enc_init)
+		hdmi->ctrl_ops->enc_init(hdmi, to_rockchip_crtc_state(crtc->state));
 }
 
 static int
@@ -126,16 +140,19 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 	union phy_configure_opts phy_cfg = {};
 	int ret;
 
-	if (hdmi->tmds_char_rate == conn_state->hdmi.tmds_char_rate)
+	if (hdmi->tmds_char_rate == conn_state->hdmi.tmds_char_rate &&
+	    s->output_bpc == conn_state->hdmi.output_bpc)
 		return 0;
 
 	phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
+	phy_cfg.hdmi.bpc = conn_state->hdmi.output_bpc;
 
 	ret = phy_configure(hdmi->phy, &phy_cfg);
 	if (!ret) {
 		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
 		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
 		s->output_type = DRM_MODE_CONNECTOR_HDMIA;
+		s->output_bpc = conn_state->hdmi.output_bpc;
 	} else {
 		dev_err(hdmi->dev, "Failed to configure phy: %d\n", ret);
 	}
@@ -371,15 +388,45 @@ static void dw_hdmi_qp_rk3588_io_init(struct rockchip_hdmi_qp *hdmi)
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 }
 
+static void dw_hdmi_qp_rk3576_enc_init(struct rockchip_hdmi_qp *hdmi,
+				       struct rockchip_crtc_state *state)
+{
+	u32 val;
+
+	if (state->output_bpc == 10)
+		val = FIELD_PREP_WM16(RK3576_COLOR_DEPTH_MASK, RK3576_10BPC);
+	else
+		val = FIELD_PREP_WM16(RK3576_COLOR_DEPTH_MASK, RK3576_8BPC);
+
+	regmap_write(hdmi->vo_regmap, RK3576_VO0_GRF_SOC_CON8, val);
+}
+
+static void dw_hdmi_qp_rk3588_enc_init(struct rockchip_hdmi_qp *hdmi,
+				       struct rockchip_crtc_state *state)
+{
+	u32 val;
+
+	if (state->output_bpc == 10)
+		val = FIELD_PREP_WM16(RK3588_COLOR_DEPTH_MASK, RK3588_10BPC);
+	else
+		val = FIELD_PREP_WM16(RK3588_COLOR_DEPTH_MASK, RK3588_8BPC);
+
+	regmap_write(hdmi->vo_regmap,
+		     hdmi->port_id ? RK3588_GRF_VO1_CON6 : RK3588_GRF_VO1_CON3,
+		     val);
+}
+
 static const struct rockchip_hdmi_qp_ctrl_ops rk3576_hdmi_ctrl_ops = {
 	.io_init		= dw_hdmi_qp_rk3576_io_init,
-	.irq_callback	        = dw_hdmi_qp_rk3576_irq,
+	.enc_init		= dw_hdmi_qp_rk3576_enc_init,
+	.irq_callback		= dw_hdmi_qp_rk3576_irq,
 	.hardirq_callback	= dw_hdmi_qp_rk3576_hardirq,
 };
 
 static const struct rockchip_hdmi_qp_ctrl_ops rk3588_hdmi_ctrl_ops = {
 	.io_init		= dw_hdmi_qp_rk3588_io_init,
-	.irq_callback	        = dw_hdmi_qp_rk3588_irq,
+	.enc_init		= dw_hdmi_qp_rk3588_enc_init,
+	.irq_callback		= dw_hdmi_qp_rk3588_irq,
 	.hardirq_callback	= dw_hdmi_qp_rk3588_hardirq,
 };
 
@@ -472,6 +519,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 
 	plat_data.phy_ops = cfg->phy_ops;
 	plat_data.phy_data = hdmi;
+	plat_data.max_bpc = 10;
 
 	encoder = &hdmi->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);

-- 
2.51.0


