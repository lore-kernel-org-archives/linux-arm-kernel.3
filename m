Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E844CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ia33JKoZuaR8w6UXmFoEC0QlVGG/UpkjEX+mBP4ds/E=; b=ID3slr9M5hwQUjwht6QNb2SZPT
	8z3svXoe1OMYmrT1k8S/Wcf3bSoLmDUc8n/10ULs7s/iepb0PJFgUFYJeYG2EZ2qrAn0OnPFPTBgw
	QPBcJn5Xz7m1uWAM509qzSNjDuf1d8eF4yVoWxsLeDsTqvUlAbsI4kkTVjSCCE1WQ2cu0HHmhNhEm
	nY2L6qn76WfcGoFi6dJxKtUy52U7xznqM8iKWI0oyO8u+Dh5KBxwgfBeBMATsWE2Hx4C3UzHRBXUe
	/MNtVfITslPHGRbPW6CCJEI33exs6sipk7EBjdfh5jMQ9AXa0z6qpRVn+70Mfg+IJyn3MaDgeXYL5
	jXqcNrIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTgv-0000000EFQO-1qyC;
	Mon, 11 May 2026 16:41:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTgs-0000000EFNG-2zDU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:41:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D4882C5E154;
	Mon, 11 May 2026 16:41:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43BFA60646;
	Mon, 11 May 2026 16:41:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D0A4511AF9F70;
	Mon, 11 May 2026 18:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778517667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ia33JKoZuaR8w6UXmFoEC0QlVGG/UpkjEX+mBP4ds/E=;
	b=hSh7W9jC8yTb4iDIsxOpUtuQmcteKrzKEAhE4Z6FSuCiXprak2lDEGkUru+40qrjvLoT9l
	Np3LIEVmSa8HyV5QQVBojpBwxjMhszMgmtcpDv4Ng7FdRo4oXuFYezQo+BOEQVgBYitlOP
	3NqNbKCFDrmTXQP2vbVC2Qgy/h8EyZ/LNdrSSVBM5YWFkHBi+4P7hqbm38KREqiDNqdyGQ
	mK6qpE3TEfSym15fbQZqavHvKy+Ezv8OjfQdHq4Xmi0HN5v2Z8rW4cfUSCUFDwnERXQ+tS
	IjEWJWgersn3nxhDRNn6thcGnvDIsmq4sExWP8jEzeUdSZ0ylXgeB0oCe2KKvQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 11 May 2026 18:40:13 +0200
Subject: [PATCH v6 09/11] drm/bridge: lt8713sx: switch to
 of_drm_get_bridge_by_endpoint()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-9-f61c9e498b3f@bootlin.com>
References: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
In-Reply-To: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
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
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_094110_890129_2E24E042 
X-CRM114-Status: GOOD (  12.44  )
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
2.54.0


