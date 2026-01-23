Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB7BD74EFB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7xtwCCKQuv4dvKzrXBbhEbFPCQTZV+cAc7+TF45XiE=; b=PcI8nbAAhF+j0QmQreZVahX6P6
	j5Hpg4x3AvFMSpbgW657wrxs2JzFIanm8lZ9LbUk0p2s1QnBpzHFIqZzpp5Vn4FGYugsJyl/o3vlG
	aimPz1Eg78sOxnroh8UR3+gVcJy2hL9WOcoH1TLnpFGgnGveltTW1VRhosdtdFDCMlFvl9n9sp0fG
	ixmfY8qpacsh8RF2zEwlxXjnQtZuJiZfYSkdohvBb0/TjuAOTJemoqu8cyN5n+Oc5iS1LFrlSXTWx
	NBBQZfHI/9TXLtW4Tf+jyoANtTxJ7BsjruaCHDTkFuphN5CqzS+/IfWgMpdWtdsG4hF6XbyJfjmot
	osc2MNWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJmj-000000099q3-2H2b;
	Fri, 23 Jan 2026 16:13:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJmZ-000000099ix-3Kz5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:13:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5BF064E42224;
	Fri, 23 Jan 2026 16:13:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F2196070A;
	Fri, 23 Jan 2026 16:13:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11116119A87A7;
	Fri, 23 Jan 2026 17:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769184788; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p7xtwCCKQuv4dvKzrXBbhEbFPCQTZV+cAc7+TF45XiE=;
	b=1MjqzHja9gM8HLswS4Qlq1QKSqOZ4PEVhE+RZM3+S4J+5hW2uggFYFkkjJ4OObzcxYnZXe
	zdQxlvi9SyNP04uAo0ZpRKlv1Yq5f9vaA0H4rE9p77DN9xE/La+gAnhwvR/ilUv4loOSuc
	dxYPwEofeZclCuhu0oKfL6FKWHE8XdgRgLcmAwbl7K5HDJUj6iIL/eErVA0hqOF19jonrz
	EdhkiRFRDsXQqCpB+Pkvy4wAVEbyuKodlo8G0TXKic7e6kM/Ac4DdT6u9Mwxo4kzflE6/r
	NM1huEwjcZ42ajaIV7IyKN35VxdeRThr4RxOKTiLphaFda9+bD5zmXW/W8wRbQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 23 Jan 2026 17:12:28 +0100
Subject: [PATCH v5 10/25] drm/tilcdc: Remove unused encoder and connector
 tracking arrays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-feature_tilcdc-v5-10-5a44d2aa3f6f@bootlin.com>
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
In-Reply-To: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-47773
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_081311_992783_EEDA798C 
X-CRM114-Status: GOOD (  11.59  )
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

The num_encoders/encoders and num_connectors/connectors arrays in
tilcdc_drm_private are never populated or used by the driver.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 3 +--
 drivers/gpu/drm/tilcdc/tilcdc_drv.h | 6 ------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index fd6764ce80afa..d911d413682ef 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -339,8 +339,7 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	if (ret)
 		goto unregister_cpufreq_notif;
 
-	if (!priv->external_connector &&
-	    ((priv->num_encoders == 0) || (priv->num_connectors == 0))) {
+	if (!priv->external_connector) {
 		dev_err(dev, "no encoders/connectors found\n");
 		ret = -EPROBE_DEFER;
 		goto unregister_cpufreq_notif;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 181b9d7a515b6..717529a331009 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -75,12 +75,6 @@ struct tilcdc_drm_private {
 
 	struct drm_crtc *crtc;
 
-	unsigned int num_encoders;
-	struct drm_encoder *encoders[8];
-
-	unsigned int num_connectors;
-	struct drm_connector *connectors[8];
-
 	struct drm_encoder *external_encoder;
 	struct drm_connector *external_connector;
 

-- 
2.43.0


