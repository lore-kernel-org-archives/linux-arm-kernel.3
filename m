Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AB0C982D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 17:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7CbSYfY/ZhKXtpXnVfoMY3VsPQNb7ntqABDIkpQLRY=; b=Zwmg/i5PIKh5S1dflj5xwKOwIt
	Mao16fWlXHRrh8UePngjMgDDHGbsluzdOdFKpDJfG0dF5ctrygArjClyig5yVUAIcUsT6etTCoeJ1
	a399o8Sb39Plg69yK06LhgBfxijweNpsWFA9gc7zP9HFp5S4RLjjhi7pGimjygxg/UOs/s9lSHYlr
	od55ECOxreE+UILnzlw81c3sX8drMLDKv5F0TcN8DeVWuu/Yfri28Bs3eGr+5vZNSYNidAQZWVzlL
	StgjQd+UKF2UoKlMnActXTRj/vJ9EEcIAvKhQFmvYAbPMQscZE5IdL92Nz2fR2ouaPrAXzks9tpX1
	D5RuL7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnF1-0000000EX8B-1uJ4;
	Fri, 16 Jan 2026 17:04:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnEw-0000000EX1p-3L3J
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Jan 2026 17:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Q7CbSYfY/ZhKXtpXnVfoMY3VsPQNb7ntqABDIkpQLRY=; b=kmYWlqRS4rrCCv63g2fdQaEX47
	TbBcMaUjHpMFKgLkAarj3HGeagg6bVH8ToNkRmdl4Aq3/a02rNthGOtaZ/z1o980VyLNHb+yjnLwY
	me0zeWJKwJZYKGhl7XizLONya2TwscXL9pq8l16P6z1Kp0Un/lA7CQTf8Z0hlk5KlN4FMaghPpiLM
	8tQmV3p6aoFq6rhGR8H/GgiJNeuS4aGvsNBy8XaaDXQ/e1gj1555QimTzFL0vTFEP8/gDa6MWBIW/
	CJL8yFh2tH9VRKMBVMXDDtId6rYtlOxV25FBGOzYaIC/cpe6Sabymun9PfloUvuCXP1vmr/Gt+jnx
	2ADE1MNQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnEr-00000009CzB-3Ykj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 17:04:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8A61E4E42112;
	Fri, 16 Jan 2026 17:03:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5EF5A606F9;
	Fri, 16 Jan 2026 17:03:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F6E610B68CAE;
	Fri, 16 Jan 2026 18:03:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768583034; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q7CbSYfY/ZhKXtpXnVfoMY3VsPQNb7ntqABDIkpQLRY=;
	b=goYzI4aBMUc9FSeMc+JjGErUy6Xdkx7csFK0nhQwn4nxstAAu/xi8iBzozoGAtmvPdeNdV
	hshdAfyPcCQEy+NwwxA/4Tjc2jLRwyaQyR2BC2iBOrOmRpxvcDXoFUhSv0udCcZkx/Ijtr
	6j9J9TCM40srLJkulIKySuZCwdAFHTQPuYdJLFbt640BterLOIMxsdlxvWeRh/nsCLJfgO
	qK429ULVL3hpPGCOK6q3ltbN70NA0CmiKzWfc1tNU0RgnyaB9B20tQyUo0uJLopC51ooB4
	c+TOdmNcPQ7XH+68uCBVwVac5mJFEqKClNjPqT5KK/s4XOekwHrrJsG5QtvJvQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 16 Jan 2026 18:02:23 +0100
Subject: [PATCH v4 23/25] drm/bridge: tda998x: Remove useless
 tda998x_connector_destroy wrapper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-feature_tilcdc-v4-23-2c1c22143087@bootlin.com>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
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
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_170358_013513_3F571891 
X-CRM114-Status: UNSURE (   9.78  )
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

Use directly drm_connector_cleanup in the destroy ops instead of having
a custom function that does nothing more.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/bridge/tda998x_drv.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
index e06d8d4c4b875..fad3c9bfda383 100644
--- a/drivers/gpu/drm/bridge/tda998x_drv.c
+++ b/drivers/gpu/drm/bridge/tda998x_drv.c
@@ -1203,16 +1203,11 @@ tda998x_connector_detect(struct drm_connector *connector, bool force)
 			connector_status_disconnected;
 }
 
-static void tda998x_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
-
 static const struct drm_connector_funcs tda998x_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = tda998x_connector_detect,
-	.destroy = tda998x_connector_destroy,
+	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };

-- 
2.43.0


