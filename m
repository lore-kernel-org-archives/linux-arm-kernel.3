Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9165FFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 15:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUEV9MYSt3pHOUbVC0XEstJh+n5Nd9x9JzYSEpAeTFA=; b=G6C2MndidNXYKzQV7Dj10iMm7A
	GNNu3eZgk6F19Hv+JPuZ3F4iIbhmpmSK0LWO09+Sewb5+2NOue5cDjqZa8bM1S11akFkhRwC24K7O
	ss7z8IXQX7pNRwY4clJbXbvd8K7aHPH5MNsGhFj7vN5jkA6PCGalqRHBawY846ep4EowL2El41/ra
	S1U1hn+4ZT4sRnwdcjTfCBg9IXpV44X2ARCwdhAb1JhSKcB2cMBwgm43mq+YsNoQKBB22KBtJMoEP
	L+iAddTjZY0CxrPeYcpwJ0McMncoFFgTSJryRmTClhDZzVmCbjAJTkirlsPqEHw0V2NnQCOkLd5bb
	bAB4UPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkQ0-00000001kMP-1zmn;
	Tue, 28 Apr 2026 15:32:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkPr-00000001kEc-48oV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 15:32:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 828371A3471;
	Tue, 28 Apr 2026 15:32:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 55473601D0;
	Tue, 28 Apr 2026 15:32:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1AA210728E18;
	Tue, 28 Apr 2026 17:31:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777390320; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yUEV9MYSt3pHOUbVC0XEstJh+n5Nd9x9JzYSEpAeTFA=;
	b=fePiIdJSEIYXaxtBJpSc6+bYGjNJSoZUCoxa+WE7erM4o3wtCXzN6Xoi0BZhagzWXDjut6
	WklTsK7h1pWgAUyC1ON8fVb/S04tLb7jRcAFz5U9IK8nx/80HlernHWWBwUUvn89wdpPiR
	2ocNhQF19Opo+3JNCVxJbXSW+nwLwEn9hpn1UFATBlF1Xw6Ws+1icEtoKEkChN08QlXTwX
	8ZMXoziP53qsdjlFLpFYHbSm76avbDJ3Mj7X+Exot9MPfd+1K0ZfNNlGnl0XLHA6Vy4p7P
	AOdrsLgGqM5hHcgJIxSoKv6E0VYlB+PrGQ89Uf0irZ2yY9PiwV0NKfDFyfwVcw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 28 Apr 2026 17:30:58 +0200
Subject: [PATCH v3 09/11] drm/bridge: lt8713sx: switch to
 of_drm_get_bridge_by_endpoint()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-9-a537b5567add@bootlin.com>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-0-a537b5567add@bootlin.com>
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-0-a537b5567add@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_083204_167604_AEFF40B5 
X-CRM114-Status: GOOD (  13.02  )
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

This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
@panel parameter, thus using a reduced feature set of that function.
Replace this call with the simpler of_drm_get_bridge_by_endpoint().

Since of_drm_get_bridge_by_endpoint() increases the refcount of the
returned bridge, ensure it is put on removal. To achieve this, instead of
adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
pointer which is automatically put when the bridge is eventually freed.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/lontium-lt8713sx.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8713sx.c b/drivers/gpu/drm/bridge/lontium-lt8713sx.c
index 18fac6a46db4..cee485adf5e5 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8713sx.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8713sx.c
@@ -32,7 +32,6 @@ DECLARE_CRC8_TABLE(lt8713sx_crc_table);
 struct lt8713sx {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 
 	struct regmap *regmap;
 	/* Protects all accesses to registers by stopping the on-chip MCU */
@@ -458,7 +457,7 @@ static int lt8713sx_bridge_attach(struct drm_bridge *bridge,
 	struct lt8713sx *lt8713sx = container_of(bridge, struct lt8713sx, bridge);
 
 	return drm_bridge_attach(encoder,
-				lt8713sx->next_bridge,
+				lt8713sx->bridge.next_bridge,
 				bridge, flags);
 }
 
@@ -537,10 +536,9 @@ static int lt8713sx_probe(struct i2c_client *client)
 	if (IS_ERR(lt8713sx->regmap))
 		return dev_err_probe(dev, PTR_ERR(lt8713sx->regmap), "regmap i2c init failed\n");
 
-	ret = drm_of_find_panel_or_bridge(lt8713sx->dev->of_node, 1, -1, NULL,
-					  &lt8713sx->next_bridge);
-	if (ret < 0)
-		return ret;
+	lt8713sx->bridge.next_bridge = of_drm_get_bridge_by_endpoint(lt8713sx->dev->of_node, 1, -1);
+	if (IS_ERR(lt8713sx->bridge.next_bridge))
+		return PTR_ERR(lt8713sx->bridge.next_bridge);
 
 	ret = lt8713sx_gpio_init(lt8713sx);
 	if (ret < 0)

-- 
2.53.0


