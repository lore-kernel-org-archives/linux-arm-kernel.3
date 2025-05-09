Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7383EC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLDy713DSCSiEtaJQVHhalrNIkPHI1Ti+irjYvcfZ5Q=; b=A4pW+irfdHqG2avTwQp0LEjAt7
	OaPVw4EfptbsgRY4v7oLu81RB0dfFxEg8y6+RqM+Gpq475SDNmCnk/W2AARWIxZC3jkxoYeriqpvN
	5jtawJ2fCOKsms3R38FG3gH4wSIYp8oGDvFaXrY/GLK78A8WXHuNYxVls+HHcdFB3+RubVp6ybP/2
	EYuzP1Y6+SZZtAcx26GrJ7V247l8xjXen5nlmS4dtVqXXqQcEfHjpq6y4Yc80vSSfIAzca8Fjaz3g
	4D2PLz5gYM49LgAgBVn69CAczovaplOquHateLQGi+nOVvS9HhKHVmSOYyAWLQb3b2DTz/iocbIN1
	kfOFUliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU7y-00000004jJi-2f0D;
	Fri, 09 May 2025 20:15:26 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDODQ-00000003rIe-3QEx;
	Fri, 09 May 2025 13:56:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A71F743B63;
	Fri,  9 May 2025 13:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746798999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bLDy713DSCSiEtaJQVHhalrNIkPHI1Ti+irjYvcfZ5Q=;
	b=Lh2dGQnnuluIVJ6PlcWvQA3QctegLT+C0NDl6ccWdvh9/qtIe5na44FSHZtuBGJTwFzava
	MbEWlWWzxJfEO7pLClvb6vWZASggdNwf8wTiHjHyDV/nBkdhgP/1+jlw15VDk6KKgpJ6Eq
	hLHl7UTpWr5s7a/LwlwHHKpwGDTcftSdzCTfwjNG/eoWpqo3nW7Rb7kMLOCLSkDt09ydH0
	WxSrWcbdr53fzjwEBF+3iTJode4NoYDyWUeYEUWxJfs2DT1+xPeyEyI5mIFbnxtjlorqsw
	/parutG7vXxoQBG3dA18UtdK5WDpvjP+ImsUP4FTdSmvB+BtaNXN5GFxpOGwrQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 May 2025 15:53:34 +0200
Subject: [PATCH v3 08/22] drm/omap: dss: dpi: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-drm-bridge-convert-to-alloc-api-v3-8-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>, Helge Deller <deller@gmx.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegfedprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepihhmgieslhhishhts
 hdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_065641_010542_9AA2DD2A 
X-CRM114-Status: GOOD (  10.92  )
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

This is the new API for allocating DRM bridges.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 6eff97a091602f6d137095b3b7bf54fce17e8d3e..9f86db774c395db7e3396cbf2694748fc23c309d 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -562,7 +562,6 @@ static const struct drm_bridge_funcs dpi_bridge_funcs = {
 
 static void dpi_bridge_init(struct dpi_data *dpi)
 {
-	dpi->bridge.funcs = &dpi_bridge_funcs;
 	dpi->bridge.of_node = dpi->pdev->dev.of_node;
 	dpi->bridge.type = DRM_MODE_CONNECTOR_DPI;
 
@@ -707,9 +706,9 @@ int dpi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	u32 datalines;
 	int r;
 
-	dpi = devm_kzalloc(&pdev->dev, sizeof(*dpi), GFP_KERNEL);
-	if (!dpi)
-		return -ENOMEM;
+	dpi = devm_drm_bridge_alloc(&pdev->dev, struct dpi_data, bridge, &dpi_bridge_funcs);
+	if (IS_ERR(dpi))
+		return PTR_ERR(dpi);
 
 	ep = of_graph_get_next_port_endpoint(port, NULL);
 	if (!ep)

-- 
2.49.0


