Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D867EC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=364dwlo7n3lm96H5WbZ7sg/Dj/Yi+dx86lYDn85W+Lc=; b=nOtVYrikxaobt516pTipkwMVZo
	F1/aQAllcjqoZ/v5Hx59JoGmS5USPqo4z+BKJZ2SrqwpfJXbabi9ZzsYrDFuslsu3TyDn4SpWmdDz
	IqKeNVQPm86zy4D0s/M1nlSJ5AxBFjynTmQBpiak6N7/rsFRNu+/dhpyOAL317eu6eVnJRb0cCwAC
	p7yzRlDEhUKAkMR+dAPU0g9EVGx+fcuXXiE8GIQZDbZymiunwsMUQHr4H5s607/A48OUcsiIPiDvD
	TtMp6QJI9p8T0Bm04CYf0rtAq4wK3oqakP+rsQOrM12JaCs/Ve538E7Yo0IbHZ/VzG2VndDWV0NdP
	JBWG8AyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBFC-00000005ykv-31ln;
	Tue, 08 Jul 2025 16:32:34 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAZ5-00000005s2l-0G8E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 15:49:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96CEF443EB;
	Tue,  8 Jul 2025 15:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751989741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=364dwlo7n3lm96H5WbZ7sg/Dj/Yi+dx86lYDn85W+Lc=;
	b=DYjb2dghuimIhN/xIQjAaIf6rI+oVoAKZ9pm9qLeAdyuSnPWcxmkEC59EW0nD+fyCkXLO5
	4zPoXrQaiOUEz4ud1I88iGULBfHIA1VWgm2klYRciQL39NSTjz7bnyX/zQ2T6d8GgVHHRn
	gch62s0chCTc9YlIdSZGE5qtqo1ktjDo1HYpX+p8ejNTz924lYMLnrzQ7+y0j66uo32uYX
	8U6HOlE8xCC30tVKUUwBtr5jTGnJcihyC5LFITOnasvjaEZ6SWB3MJew0GRg3lmciCjYfv
	6V4WkRzV9HhvIjUdRywDWEDqy/TKHTEf2At1FY9iGaV79QmTUI7CQnFye1QWmQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 08 Jul 2025 17:48:20 +0200
Subject: [PATCH v9 3/5] drm/mxsfb: put the bridge returned by
 drm_bridge_chain_get_first_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v9-3-db1ba3df7f58@bootlin.com>
References: <20250708-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v9-0-db1ba3df7f58@bootlin.com>
In-Reply-To: <20250708-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v9-0-db1ba3df7f58@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefhedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppeekjedruddvtddrvddukedrvddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekjedruddvtddrvddukedrvddtjedphhgvlhhopegludelvddrudeikedruddrudefngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtt
 hhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_084903_248692_BE410CCF 
X-CRM114-Status: GOOD (  12.77  )
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

The bridge returned by drm_bridge_chain_get_first_bridge() is
refcounted. Put it when done. Use a scope-based free action to catch all
the code paths.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v9:
- declare 'bridge' variable on first usage to avoid unnecessary cleanup for
  !connector_state->crtc
- removed Maxime's R-by (diff content changed)

Changes in v8: none

This patch was added in v7.
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index dbd42cc1da87f82ef9cd4ccc70cdecbe56035174..1c3b33be6c40f5e6e25b0104040bf4eb56e06081 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -433,7 +433,6 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_bridge_state *bridge_state;
-	struct drm_bridge *bridge;
 	u32 bus_format, bus_flags;
 	bool format_set = false, flags_set = false;
 	int ret, i;
@@ -453,7 +452,8 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 
 		encoder = connector_state->best_encoder;
 
-		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		struct drm_bridge *bridge __free(drm_bridge_put) =
+			drm_bridge_chain_get_first_bridge(encoder);
 		if (!bridge)
 			continue;
 

-- 
2.50.0


