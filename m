Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C8ACFD65A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkiR0P62QEUb1PCOEii1nVoSK2mCmCTz+ERz0qbz4sk=; b=owMpBzjShbnvN1TnLaP/tB4QAZ
	7EQrwDHac8F+xHk/fdchCdrfQc5zVMn9xYszaA4B+5dF6WN/XnZTlQ/nfGWCi+l4lBdzCsHSqXdZM
	grJ6yk/XdLy5/NN6kfNRFttbavhf2lRJRiHvAGGTIGJfzYGFMPKy0eQZJrFe2cegowJMzm6dG+QZj
	NtywKa40CA8Oy8otGBAk1hUmtiNl23YpkyQvWfzprs9pBk0wbORp+w+7VE1DJVe00n4E8vt1kDcHt
	VixyvJf4y09SRwQMCMBwki6ka0wNdQeIOumna/AvTeATuGm0poRzydfbBlHMDBPK35+vFRY/QEDwZ
	Hcd59CIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWIv-0000000FGBp-03TO;
	Wed, 07 Jan 2026 16:22:42 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWIp-0000000FG7C-3NeK;
	Wed, 07 Jan 2026 16:22:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 083211A26E6;
	Wed,  7 Jan 2026 16:22:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDBE56072B;
	Wed,  7 Jan 2026 16:22:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DAA0103C87C7;
	Wed,  7 Jan 2026 17:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767802948; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qkiR0P62QEUb1PCOEii1nVoSK2mCmCTz+ERz0qbz4sk=;
	b=bzDLu4hog3Yzapu+FCJaa75iEPEgDSakBa2bewsdNrO75fp1ds4LOGxHwDe7EK4GeGSQhJ
	l9ijvmCRCnj+9qfTD2679M1ipP3NBnXdgBMYGAud8sUuPBztTSS+Cs1CzC/w1APFIhguw8
	V2WVK0uZU8nZ2/mgFTNxxwsnxzVPsYW7MrWu7TF42BAOtRrvqPMjwj8VDRGYA9H6hzDBMd
	ORN05jWhnTBgKBmXhTqTHtMlUCsTzAKGn9EN/JdOOHv1Bcpu4h8PJJzxGuJOmMyswQZtLO
	X3PdwDEEQe+ZgynJ6865m0cZAIlwFoPQYmii3B/XEmsWX+WIc301Hkj56NUGNg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 17:22:00 +0100
Subject: [PATCH 2/6] drm/meson/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-2-ef48a517828e@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082231_977560_BC0C305A 
X-CRM114-Status: GOOD (  13.10  )
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done.

dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
avoid potential use-after-free ensure the irq is freed before putting the
dw_hdmi->bridge reference.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 0d7c68b29dff..fef1702acb14 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -778,7 +778,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	if (IS_ERR(meson_dw_hdmi->hdmi))
 		return PTR_ERR(meson_dw_hdmi->hdmi);
 
-	meson_dw_hdmi->bridge = of_drm_find_bridge(pdev->dev.of_node);
+	meson_dw_hdmi->bridge = of_drm_find_and_get_bridge(pdev->dev.of_node);
 
 	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
 
@@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *dev, struct device *master,
 				   void *data)
 {
 	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
+	struct platform_device *pdev = to_platform_device(dev);
+	int irq = platform_get_irq(pdev, 0);
 
+	devm_free_irq(dev, irq, meson_dw_hdmi);
 	dw_hdmi_unbind(meson_dw_hdmi->hdmi);
+	drm_bridge_put(meson_dw_hdmi->bridge);
 }
 
 static const struct component_ops meson_dw_hdmi_ops = {

-- 
2.52.0


