Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8B9CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUWzeTlhp2CU5KEvkS4D0u4FPJCTowD3dhS+chglbQQ=; b=DzhilyezuR0YK/ZGjVQdsZRH8l
	z4HFoHm2xdblRFuiIGQrT6FfHFvFZc6IJc8R/QTj1WPS61guzIeoOpcrmHYY1BdQ9f+W6PfAQL/ir
	rXfiMqB5X3Y+W7HjhRsn6gCrloi0xlkTHQcPSHpfR0xIVmjoph334jbSiZio5aCYi4RNo/FLpm0JS
	Y24OyVmwxcecXEbXzqKiw/JpXP8SAcdZte/rcrUO0mxPGJGN3D5P7LHsIdtt4nQO8aYhoeLye39tX
	IT3v86S1U0u8yYWTvSTwhqfUpOIBSRF7I/2UGvgmdy7UoI23Bv28GRX3/yIgrpaVJJrDgf/sUG1JP
	qAMTCFsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3x0-0000000Gldr-3c95;
	Mon, 18 May 2026 19:48:30 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3wx-0000000GlYH-3voY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779133707; bh=rUWzeTlhp2CU5KEvkS4D0u4FPJCTowD3dhS+chglbQQ=;
 b=XaXmi+a45YSHCzX7XzZ0GzPOyjJw2EOVFYFHmKiUiOVva0jjHfCOGBbd8z4pw/PzVxbD0gvD/
 4hu57Awm4zbmhebHXYpZ1Swxn6SIYVFjz3wmdc6Nhviz1/72Bh8q5FiUVsPT+kowQpwhxrXRlmU
 pdS2ddsFIwpWy6ULg21PoUJsjab8ikI6DbzfMNvzmVSa/khywG7PGX4IRfE0r/k7CO3BqPaP4h9
 Fnc+trI7yh1MW1Z6++Hj7t++pSmsAliPC23ytGIkj7Fgz4loAwd+JDW79AKMyC3NYDsg1rJ9Xqf
 faVMVcyfWjB9dtyE7d/jIiLwtLIJ/nK3L9sRMQQ69PkA==
X-Forward-Email-ID: 6a0b6d06b74b0ebd362eeee1
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 07/13] drm/meson: encoder_hdmi: Report ycbcr_420_allowed from encoder
Date: Mon, 18 May 2026 19:47:35 +0000
Message-ID: <20260518194744.2483580-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518194744.2483580-1-jonas@kwiboo.se>
References: <20260518194744.2483580-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_124828_060935_AF73B474 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

The bridge connector report ycbcr_420_allowed support when all bridges
in the chain support ycbcr_420_allowed.

Report ycbcr_420_allowed on the encoder bridge so that the bridge
connector automatically can report correct ycbcr_420_allowed support.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 45104ef35344..484675cb8284 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -354,6 +354,7 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	meson_encoder_hdmi->bridge.of_node = priv->dev->of_node;
 	meson_encoder_hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	meson_encoder_hdmi->bridge.interlace_allowed = true;
+	meson_encoder_hdmi->bridge.ycbcr_420_allowed = true;
 
 	pdev = of_find_device_by_node(remote);
 	of_node_put(remote);
@@ -406,9 +407,6 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 
 	drm_connector_attach_max_bpc_property(meson_encoder_hdmi->connector, 8, 8);
 
-	/* Handle this here until handled by drm_bridge_connector_init() */
-	meson_encoder_hdmi->connector->ycbcr_420_allowed = true;
-
 	priv->encoders[MESON_ENC_HDMI] = meson_encoder_hdmi;
 
 	dev_dbg(priv->dev, "HDMI encoder initialized\n");
-- 
2.54.0


