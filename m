Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A909C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 17:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVNkowULM39sQD4iRepTtrOJX4rosnaiKw0o5ScIYJs=; b=4bbFtYoH0nfOnQy8NoZDc1y1UT
	rtpvGWMX5Buld8EbyCseU2Le7zD8PLBnmJRL0n18WHZS1nH4d9Zih4hG0+esWDBC1wv1njkoSijps
	4MDeeVXXP2OwpieuXTXt9FCeOZY69heZylqVYHwHUj9YbBXh7WN1KWi1y4xLlgNkC1ak2Lu3d+OHq
	Dwt92C39ZegSuk26/tWDG/58ByyKZA/8cb5XF+gqSfUXSWfXlJzlK2LMroEyUOQsZ1P3vFw8wbJSA
	2U5QU5Uwp5tfiQbsxzhULOqBYjIj12Am/oqr+DqFtPSxRYeoFdGaOKaBj+Bpev5r+7zNhZ/W/99sA
	1a32iz5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqF81-0000000Bi2I-2HPZ;
	Thu, 06 Mar 2025 17:35:25 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqF1g-0000000Bgot-01px
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 17:28:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3354441C8;
	Thu,  6 Mar 2025 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741282130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CVNkowULM39sQD4iRepTtrOJX4rosnaiKw0o5ScIYJs=;
	b=R6oGqZEaXrsGs4X8sof/7YPNpgtIh/xjgsE0XvAmr5kUYc3u8sdhxTscfvpkqkqph5q90v
	QpADyZ8vzVedw2fmfV6pkwgjuGtOs+Xq4o0kQeWJx3IvBDeAG4km9CNgcUCPlVjLVSgxTl
	cZwI92sAKlWItgN5iv3W73jL6olmHnbULaee5otrafeGrEf7F0X6ZBMT/Us6TXV4f8d3K2
	RkiBh7eT7tOeEk/jFk6pNvsJysO/leFxYv4BdrCbaDzoeaDuKnqjd9cZO1+GNOS3EwEXfN
	GHumXhfB1+V5gDsKYH32NRsTInTtoO2Kp7rVp9sbRt4s91hIx4cohTG/p6osDw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Mar 2025 18:28:41 +0100
Subject: [PATCH 2/2] drm/bridge: fsl-ldb: make warning message more
 informative
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-drm-two-ldb-improvements-v1-2-f139d768b92c@bootlin.com>
References: <20250306-drm-two-ldb-improvements-v1-0-f139d768b92c@bootlin.com>
In-Reply-To: <20250306-drm-two-ldb-improvements-v1-0-f139d768b92c@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdekfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvr
 hhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_092852_538336_C8CA1599 
X-CRM114-Status: GOOD (  10.03  )
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

This warning notifies a clock was set to an inaccurate value. Modify the
string to also show the clock name.

While doing that also rewrap the entire function call.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0fc8a14fd80062248a43b8b93272101a7ca6158a..c7c899a9644bb827845fb3fe96a9695d79a91474 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -181,9 +181,9 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 
 	configured_link_freq = clk_get_rate(fsl_ldb->clk);
 	if (configured_link_freq != requested_link_freq)
-		dev_warn(fsl_ldb->dev, "Configured LDB clock (%lu Hz) does not match requested LVDS clock: %lu Hz\n",
-			 configured_link_freq,
-			 requested_link_freq);
+		dev_warn(fsl_ldb->dev,
+			 "Configured %pC clock (%lu Hz) does not match requested LVDS clock: %lu Hz\n",
+			 fsl_ldb->clk, configured_link_freq, requested_link_freq);
 
 	clk_prepare_enable(fsl_ldb->clk);
 

-- 
2.48.1


