Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90091C0219C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyt92zCCqkFkC7In83mYaBu4PIN5nSKfNfG/5T0DTUw=; b=V4UNTZMfrq7i/PD6P73IxnN/vZ
	r3bRFlKahtmIiEhtM8HQpciorr63CP+/ti2EO0hzbqsIBItCi/q7fhSSOIUNJZxDeuWTV7jnzeNBH
	9oneES+bgcj+LDGQfuJheWtvNtIxL8t3sgS39nL8+DtUaPRvevjv2MB/6X1VRixZH8rdc2wSj4EpO
	epZQY9P0AKQGxADu1GFVPNnCjTmIS8F+WTIvpU7OK1fIZ+LrAONX9iHyrluiyduy7K6HQj2W9558D
	tSHozYsFmvZIOIPe0LaVEu7piMipIaQwap9pfkBsuNyz5jq6E+tbLnfxScSm2EpC+RmueCj0Gnlxc
	YXQAxjYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg77o-00000007I0o-0S9n;
	Thu, 06 Feb 2025 19:01:20 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6Pa-000000078Fg-2Am3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:15:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 648AC44264;
	Thu,  6 Feb 2025 18:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jyt92zCCqkFkC7In83mYaBu4PIN5nSKfNfG/5T0DTUw=;
	b=JznA0qyIaTSfICk4caWACJbFbfNzXB1pg7S6uD3cgTrCOwAGOR2jl4hYbaD6qwNFYLQjN/
	GGCvKL2OKdNYgXo8ypms6t1EC1NNA6QPCklEjsnL19iJYH0AXm0WWTl8xNNiC85x2JJVcp
	1x59+fg5iQbMzBtYLad904nKO9R1wxem87yt4xMpaVM/y8jD8ki2oCT4FzIBeRepdHWSZ2
	+hh+gRudoYHKq0zrujEIp6PXOlNDXDErASHdc8bbvJ47Tvnap9VPBO1UcRfqZj479G8BER
	uXcFAiFImmpFZ3ycDUn47hzc6H5utTKcEUj9jZUBZUnGq7PK/kz0Z9E/71WSHg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:37 +0100
Subject: [PATCH v6 22/26] drm/debugfs: show removed bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-22-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
In-Reply-To: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpedvtdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_101538_716179_0E679ABE 
X-CRM114-Status: GOOD (  14.56  )
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

The usefulness of /sys/kernel/debug/dri/bridges is limited as it only shows
bridges betweeb drm_bridge_add() and drm_bridge_remove(). However
refcounted bridges can stay allocated for way longer, and a memory leak due
to a missing drm_bridge_put() would not be visible in this debugfs file.

Add removed bridges to the /sys/kernel/debug/dri/bridges output.

Now however if a bridge is added and removed multiple times (as in
hot-pluggable hardware) and not freed immediately, there would be multiple
identical entries for the same bridge model/driver. To distinguish between
each instance add the bridge pointer to the output.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 drivers/gpu/drm/drm_debugfs.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 629074247ffec4fa18df7af2d9023255abed501c..b04e1fba8faf7320794277c2017c97216320f017 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -740,12 +740,16 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
 	crtc->debugfs_entry = NULL;
 }
 
-static void bridge_print(struct drm_printer *p, struct drm_bridge *bridge, unsigned int idx)
+static void bridge_print(struct drm_printer *p, struct drm_bridge *bridge, unsigned int idx,
+			 bool removed)
 {
 	drm_printf(p, "bridge[%u]: %ps\n", idx, bridge->funcs);
 
+	drm_printf(p, "\taddr: %p\n", bridge);
+
 	if (drm_bridge_is_refcounted(bridge))
-		drm_printf(p, "\trefcount: %u\n", kref_read(&bridge->refcount));
+		drm_printf(p, "\trefcount: %u%s\n", kref_read(&bridge->refcount),
+			   removed ? " [removed]" : "");
 	else
 		drm_printf(p, "\trefcount: N/A\n");
 
@@ -753,7 +757,8 @@ static void bridge_print(struct drm_printer *p, struct drm_bridge *bridge, unsig
 		   bridge->type,
 		   drm_get_connector_type_name(bridge->type));
 
-	if (bridge->of_node)
+	/* The OF node could be freed after drm_bridge_remove() */
+	if (bridge->of_node && !removed)
 		drm_printf(p, "\tOF: %pOFfc\n", bridge->of_node);
 
 	drm_printf(p, "\tops: [0x%x]", bridge->ops);
@@ -778,7 +783,7 @@ static int bridges_show(struct seq_file *m, void *data)
 	unsigned int idx = 0;
 
 	drm_for_each_bridge_in_chain(encoder, bridge)
-		bridge_print(&p, bridge, idx++);
+		bridge_print(&p, bridge, idx++, false);
 
 	return 0;
 }
@@ -822,7 +827,10 @@ static int allbridges_show(struct seq_file *m, void *data)
 	mutex_lock(&bridge_lock);
 
 	list_for_each_entry(bridge, &bridge_list, list)
-		bridge_print(&p, bridge, idx++);
+		bridge_print(&p, bridge, idx++, false);
+
+	list_for_each_entry(bridge, &bridge_removed_list, list)
+		bridge_print(&p, bridge, idx++, true);
 
 	mutex_unlock(&bridge_lock);
 

-- 
2.34.1


