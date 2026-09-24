Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262F3C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2h/imfS/zagdmJzXYdBf2We/llILCPxQpIcvQ2JdIQc=; b=2/rnmi7LyIz8+zZIfuyr5hmIZS
	anLhNfqAX077ztHBl6/4QA40jUzyxy2k9GqjTzafuAfS95G+lsgQYO+2QQBaUTs8mKLt6cSLkFlKW
	VS3lHGgbVOg/ANMkCpa5EsGTrFpxPEBtMAQq5KeNDprMp6zFp5z1oYJylnzC0jS5mR5gNB6uEOFjW
	OwE2JLFYjPwRq1OrBP5Q6Uq5rkQ3/uxN16Za/Bfqu5JZVzebeoVcI9hAYkhNT4OS6p/uPn25m2cKc
	k+ajtort0BscgjKqyHMZJMdyyIf/xp3TvmhGWOcrQ5Zew1nEXMI6ghs38ow4olHbadaVVWYiTC5OL
	W0TRP3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oOE-0000000BwSy-2rWx;
	Thu, 24 Sep 2026 18:41:50 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oO8-0000000BwN3-1ncr;
	Thu, 24 Sep 2026 18:41:46 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1x9oO3-000000007Op-22NP;
	Thu, 24 Sep 2026 18:41:39 +0000
Date: Thu, 24 Sep 2026 19:41:36 +0100
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
	Allen Chen <allen.chen@ite.com.tw>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v7 10/14] drm/bridge: it6505: hold endpoint OF node reference
 while parsing it
Message-ID: <c4138a323c5b3c44cc12cb1c096bdeabc35eed1f.1790275151.git.daniel@makrotopia.org>
References: <cover.1790275151.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1790275151.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_114144_493796_E0F5452F 
X-CRM114-Status: GOOD (  11.64  )
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
v7: no changes

v6: no changes

v5: new patch
---
 drivers/gpu/drm/bridge/ite-it6505.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index dd57422492c2..dbef1a1bc5e3 100644
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

