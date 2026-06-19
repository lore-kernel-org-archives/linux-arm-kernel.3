Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F663CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+t6t9GV3XLbshIxqCQCxa/naPEa5kl5TLbZq97cjwU=; b=vP2pkpx2C93r1OPIpPZ1D5tdIG
	Kc/WN+K/40ayZdxTF+B07W0N+IwGuKQVaHCqbrbXSfiy8aq+Hq6/juwtHaFcaBYObgui8xQldXNsz
	s3yENakNnksHn5SZZqan/rUkTu4vR6E0uCxMbtsSG3NlZH4nh8sAplbaDpnsFuszEo40UMI9+gTZX
	Gf+H0whGNtlAX+KTol8aSTaUnfwos0JiPPVAxqVckVZ3ZZfNZIDIQBVuPySBjYVNWI+Fz/aJo7JbX
	L7Sn0P4EkpAKiDbio8QQ4bJ3swwrrWvKK8ztgJCxP2MIk2cHMEXBtiOp5kSKe6DiXvcgSokoIVkBT
	b9paqrWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYHm-00000002NvE-2Fn7;
	Fri, 19 Jun 2026 12:25:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYHl-00000002Nuu-1QHB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 12:25:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B4AB4424E;
	Fri, 19 Jun 2026 12:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830ED1F000E9;
	Fri, 19 Jun 2026 12:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781871925;
	bh=y+t6t9GV3XLbshIxqCQCxa/naPEa5kl5TLbZq97cjwU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H9JAcNxW3da8Pp1RwPRetGWyCeLhFrt86QpUI2GZV1IW4/pUQ7HKTzdiR0ihjVbwo
	 0QZg384tXwAkx2Tm1Te4K1pXGzw2D19c2xzqI3kFlGxZixBROTIHkfqMSoZtpzU9KI
	 LLTaFAxTiM1o7kxp9C4d3kEUbPQE33imBkThRDaOGA+xB4Az1okwhIPjFrjRdg+D+e
	 fSaniR+LSSw0QZc0aFxcA1G+qKEj6KNY431saxo++B5vizxkDN1Vb1qbYKxr3P5O/B
	 FH3ZbtW93WAz1FxqGpl0g/laCAf7K66neDJ3tuBO1DX22sA2c/h7dh6xHLd/9pPt6Q
	 KhinA797t8IHA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:24:19 +0200
Subject: [PATCH v3 14/78] drm/bridge: imx8mp-hdmi-pvi: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-14-ff399263111b@kernel.org>
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743; i=mripard@kernel.org;
 h=from:subject:message-id; bh=KuFeLlizsRvtSY3JcOJkNEE7zKArWS4qTTvUTXf2P+4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmJh+25szcWymwIN8hcGK3dgj7g4+nTh8RCq85JNpzk
 f/vb4nnHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAipfmMDR/+XTlWrhCQPDn5
 R8PqVvHAXUliITpcl5ntF0RqL/t/4fqK74yzX76yEXmzIJ37Z3ZKAWPDr7yHByIbD/Xcr6zs0Y5
 0uPdmvl97xblNMlu/e7m9+lL9c/kDb/Og14nXNcuWtcm/slIEAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Liu Ying <victor.liu@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 7d5fda7173e5..a31d4fc76f35 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -129,11 +129,11 @@ static const struct drm_bridge_funcs imx_hdmi_pvi_bridge_funcs = {
 	.atomic_enable	= imx8mp_hdmi_pvi_bridge_enable,
 	.atomic_disable	= imx8mp_hdmi_pvi_bridge_disable,
 	.atomic_get_input_bus_fmts = imx8mp_hdmi_pvi_bridge_get_input_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
 static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 {
 	struct device_node *remote;

-- 
2.54.0


