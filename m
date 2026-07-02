Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B92FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5x5fcrhEs0YuNzwkCDOfW4zPzxMbMspXY6zqvEqiuvE=; b=zSVsdBJPtr/G0LeRcUxg+pJ+s+
	zY5o59km1YDO9Adig8cTpcn9FRjUX2kXuD1FrNJNDwUd4dJyVIAOUbiMfNLC4VvlKfu//uYnuSWKN
	JMheORNJMpxjpDrsDvzViBNVDCeUcLrwzTmH+HKoYt0rK1jBaAzBP02XkjP9XHhAEwKmVUBYC/Dpq
	BTX802l9aiZBhkg2baQSiiJOw8BiPLiGHVsYUt7lccOXgh3bkj/jSUWunEMzsR6vr59GvtfQc82G7
	Ze6zcccP8AwjYvuf6NHjKH3VeW27KuHrngxxuVNW4+XMhUBF4K26uhlhLXHTEIK6mA6Z8rYQ4n83m
	xE3MxO7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIgj-00000004eqq-2pPI;
	Thu, 02 Jul 2026 14:46:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIgb-00000004eZA-4Arj;
	Thu, 02 Jul 2026 14:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783003595;
	bh=rKaRa186NjdIogfP8Rz5vSnZI+RuidT9dvuv+K9tbqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jjBg0paU09j4BNcmQSQt/QgGzNiBhGTXjUCf7BKSZfkF72jgLkHTzpWCGyJgMb1Jl
	 FTrpbPtav+/I66gfJ1slBWQFIMqS6fslvODY8ZbaZ+xXDRzftRGxUObqG6bojaFyby
	 yOktPJUCwZSxuiNPUswfnJZ+n9t2xH4iNdb6sp8JdmmN3Lh5b/azzRVnfZ2SzhLQOC
	 AI/cxUb/7qkaK7rJ1RDXVezUdo7u3flB1fy0ebtFMpKRrSzECd07kDk/OQsjvbjc9/
	 X4Kt/ogOKry8yGmMJKNKP1fGoTdEQGnR2AKlMTmOzUQ4mZZmpGlORAcZHU0LbPCEw4
	 SFGK8yMLxocQA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C9B817E116D;
	Thu,  2 Jul 2026 16:46:35 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 02 Jul 2026 17:46:18 +0300
Subject: [PATCH v8 05/39] drm/display: scdc-helper: Add macro for
 connector-prefixed debug messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dw-hdmi-qp-scramb-v8-5-d79890d00b6a@collabora.com>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
In-Reply-To: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_074642_241249_DD272FA5 
X-CRM114-Status: UNSURE (   9.08  )
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

Introduce the drm_scdc_dbg() wrapper over drm_dbg_kms() to help getting
rid of the boilerplate around prefixing the debug messages with the
connector information.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_scdc_helper.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
index df878aad4a36..cb6632346aad 100644
--- a/drivers/gpu/drm/display/drm_scdc_helper.c
+++ b/drivers/gpu/drm/display/drm_scdc_helper.c
@@ -55,6 +55,10 @@
 
 #define SCDC_I2C_SLAVE_ADDRESS 0x54
 
+#define drm_scdc_dbg(connector, fmt, ...)					\
+	drm_dbg_kms((connector)->dev, "[CONNECTOR:%d:%s] " fmt,			\
+		    (connector)->base.id, (connector)->name, ##__VA_ARGS__)
+
 /**
  * drm_scdc_read - read a block of data from SCDC
  * @adapter: I2C controller
@@ -158,9 +162,7 @@ bool drm_scdc_get_scrambling_status(struct drm_connector *connector)
 
 	ret = drm_scdc_readb(connector->ddc, SCDC_SCRAMBLER_STATUS, &status);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
-			    "[CONNECTOR:%d:%s] Failed to read scrambling status: %d\n",
-			    connector->base.id, connector->name, ret);
+		drm_scdc_dbg(connector, "Failed to read scrambling status: %d\n", ret);
 		return false;
 	}
 
@@ -188,9 +190,7 @@ bool drm_scdc_set_scrambling(struct drm_connector *connector,
 
 	ret = drm_scdc_readb(connector->ddc, SCDC_TMDS_CONFIG, &config);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
-			    "[CONNECTOR:%d:%s] Failed to read TMDS config: %d\n",
-			    connector->base.id, connector->name, ret);
+		drm_scdc_dbg(connector, "Failed to read TMDS config: %d\n", ret);
 		return false;
 	}
 
@@ -201,9 +201,7 @@ bool drm_scdc_set_scrambling(struct drm_connector *connector,
 
 	ret = drm_scdc_writeb(connector->ddc, SCDC_TMDS_CONFIG, config);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
-			    "[CONNECTOR:%d:%s] Failed to enable scrambling: %d\n",
-			    connector->base.id, connector->name, ret);
+		drm_scdc_dbg(connector, "Failed to enable scrambling: %d\n", ret);
 		return false;
 	}
 
@@ -248,9 +246,7 @@ bool drm_scdc_set_high_tmds_clock_ratio(struct drm_connector *connector,
 
 	ret = drm_scdc_readb(connector->ddc, SCDC_TMDS_CONFIG, &config);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
-			    "[CONNECTOR:%d:%s] Failed to read TMDS config: %d\n",
-			    connector->base.id, connector->name, ret);
+		drm_scdc_dbg(connector, "Failed to read TMDS config: %d\n", ret);
 		return false;
 	}
 
@@ -261,9 +257,7 @@ bool drm_scdc_set_high_tmds_clock_ratio(struct drm_connector *connector,
 
 	ret = drm_scdc_writeb(connector->ddc, SCDC_TMDS_CONFIG, config);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
-			    "[CONNECTOR:%d:%s] Failed to set TMDS clock ratio: %d\n",
-			    connector->base.id, connector->name, ret);
+		drm_scdc_dbg(connector, "Failed to set TMDS clock ratio: %d\n", ret);
 		return false;
 	}
 

-- 
2.54.0


