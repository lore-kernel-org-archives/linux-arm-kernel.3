Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A0BC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 23:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avqBsikZCf+7b5iEUfOAbHsGtezMWtniMqtW2atMLDo=; b=FBi/ZBz/K0JNtboDQffjXAeIbU
	JmIZid4jx0SUXjeXGHaDcEiTykGRhAzA7rmPcsO3rNW86AZAdWErkPO/UTUan0E9OavgRJ1ywLCYb
	2U3QhQKfIGjKCPsnMcSl2kllYb6D1pMnG59OtuZdUR4W8OS/f1TdHVx/HfTUeBiCuFA62KLpzApmz
	bFrXFXJ2fb2D1SXm9mEgZwaHzh1CctLz/6RHZH45AkO4+qzo0+T6AMgkLvgNP1RnGDgvAu/bczHG0
	VjWaI8oNOnrSYZzOKqW6bYO0mPUlt+UonR2mF/cEYSJ8lYg+QSc+dWCmQ0o+VelQRqa4G0/GoIxvB
	1MAfF9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAyeB-0000000H1fq-1HQb;
	Sun, 27 Sep 2026 23:51:07 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAye2-0000000H1Wg-1tGR;
	Sun, 27 Sep 2026 23:51:00 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1xAydx-000000000rp-2YuH;
	Sun, 27 Sep 2026 23:50:53 +0000
Date: Mon, 28 Sep 2026 00:50:50 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Allen Chen <allen.chen@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v8 10/14] drm/bridge: it6505: hold endpoint OF node reference
 while parsing it
Message-ID: <97c7e1c392178d0d386bcdb70813a0cd162fbefe.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1790552614.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_165058_503227_88A38FFD 
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

it6505_parse_dt() drops the reference to each endpoint node right
after looking it up and then keeps reading its properties, racing
with the node being freed under CONFIG_OF_DYNAMIC. Put the node only
once parsing is done.

Fixes: 380d920b582d ("drm/bridge: add it6505 driver to read data-lanes and link-frequencies from dt")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v8: no changes

v7: no changes

v6: no changes

v5: new patch
---
 drivers/gpu/drm/bridge/ite-it6505.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 3f17024116e14..848e9a650b9ff 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3369,7 +3369,6 @@ static void it6505_parse_dt(struct it6505 *it6505)
 	}
 
 	ep = of_graph_get_endpoint_by_regs(np, 1, 0);
-	of_node_put(ep);
 
 	if (ep) {
 		len = it6505_get_data_lanes_count(ep, 1, 4);
@@ -3382,13 +3381,13 @@ static void it6505_parse_dt(struct it6505 *it6505)
 			*max_lane_count = MAX_LANE_COUNT;
 			dev_err(dev, "error data-lanes, use default");
 		}
+		of_node_put(ep);
 	} else {
 		*max_lane_count = MAX_LANE_COUNT;
 		dev_err(dev, "error endpoint, use default");
 	}
 
 	ep = of_graph_get_endpoint_by_regs(np, 0, 0);
-	of_node_put(ep);
 
 	if (ep) {
 		len = of_property_read_variable_u64_array(ep,
@@ -3408,6 +3407,7 @@ static void it6505_parse_dt(struct it6505 *it6505)
 			dev_err(dev, "error link frequencies, use default");
 			*max_dpi_pixel_clock = DPI_PIXEL_CLK_MAX;
 		}
+		of_node_put(ep);
 	} else {
 		dev_err(dev, "error endpoint, use default");
 		*max_dpi_pixel_clock = DPI_PIXEL_CLK_MAX;
-- 
2.55.0

