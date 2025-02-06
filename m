Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08032C021A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Zj5Q6s/d5EIW0olggTNshWUfmVTZl2kWagfZZCInD8=; b=xQxP3kpo+X7+WDlL9Y6n3ds7OT
	d5ardq5ITzlkQehMArS+6igJFN6bv77IsFEG58M0EsYHIdzuXxkFuhXSr5zXqVsk3uDmkzUbYYvDb
	H3OaLXnmgh6bp2oATTMDp2ax/NARNBktH9h99cg1Mf2lBBxPICV9TX75W8tyhs3RUzyshZ1fHe3qv
	eaY3k3oiZxU9PZW6MUKXiqjRXOuiB04x9uJGqkq5n8RRfEc+nhq67S/4J3/gF/jmn/AgqK3QwNn7Q
	X/F07nPKxvJ/XRct3Zbh6F3GUDhYE3Jh2d6chJ+etyKCFlNG9OByq3G6GeGIbQO1aOivZYXDpk3OK
	MssJpGyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg77j-00000007Hvo-3j6U;
	Thu, 06 Feb 2025 19:01:15 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6PJ-0000000785G-3TWv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:15:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1C3E442BE;
	Thu,  6 Feb 2025 18:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Zj5Q6s/d5EIW0olggTNshWUfmVTZl2kWagfZZCInD8=;
	b=Ci/80IxI6xaxgZEI9U0V+ciUsKC54BM2vX/S4qsWvnckQ4TMQHgkiSjYgp/rLGNy19FQSv
	wXoKmbKfXzoK7M3NR3ijymyhxQfTh/aiCouM9zvmW5Imry/VQsRll6DM/g86V/dSf9eAG7
	6kzZpU78pcQLEcLSU81zYB2/R4vJZU9x4hJ8a5wkbQ84KYWckv/berR7Q+0DWtYHrEGnD+
	h5X9DLbk9xzKZsnooaz2o1JV5Yy/HnPD0rlb75mfRWDlmURJCBX8oJNJYwfV2pi6DQPnDn
	BdYjk5uLv0Jnpr39h0XL12xe6P5ZkVOD79kOGCVwlOOowPupSEzhWEDopmFp8w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:31 +0100
Subject: [PATCH v6 16/26] drm/bridge: increment refcount in
 of_drm_find_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-16-9d6f2c9c3058@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpedufeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_101522_001186_AD4177BB 
X-CRM114-Status: GOOD (  15.00  )
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

of_drm_find_bridge() returns a pointer to a bridge, so it has to get a
reference and the caller will be in charge of putting it.

Callers of of_drm_find_bridge() are:

 1. drm_of_panel_bridge_remove()
 2. of_drm_find_bridge_by_endpoint()
 3. drm_of_find_panel_or_bridge()
 4. various DRM drivers

Add the corresponding drm_bridge_put() call for 1 and propagate
documentation to 2 and 3.

Other callers (4) are to be adapted in following commits.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 drivers/gpu/drm/bridge/panel.c | 3 +++
 drivers/gpu/drm/drm_bridge.c   | 7 +++++++
 include/drm/drm_of.h           | 1 +
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 1230ae50b2020e7a9306cac83009dd600dd61d26..3c0e22e61c1092de1571d800ac440aad7b5c86bc 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -363,6 +363,9 @@ EXPORT_SYMBOL(of_drm_find_panel);
  * return either the associated struct drm_panel or drm_bridge device. Either
  * @panel or @bridge must not be NULL.
  *
+ * If a bridge is returned in @bridge, the bridge refcount is
+ * incremented. Use drm_bridge_put() when done with the bridge.
+ *
  * This function is deprecated and should not be used in new drivers. Use
  * devm_drm_of_get_bridge() instead.
  *
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 497ec06dfcb05ab5dee8ea5e8f1eafb9c2807612..fca860d582f86b35c9172b27be20060de086e38f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1396,6 +1396,9 @@ EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
  *
  * @np: device node
  *
+ * On return the bridge refcount is incremented (if the bridge is
+ * refcounted). Use drm_bridge_put() when done with the bridge.
+ *
  * RETURNS:
  * drm_bridge control struct on success, NULL on failure
  */
@@ -1407,6 +1410,7 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 
 	list_for_each_entry(bridge, &bridge_list, list) {
 		if (bridge->of_node == np) {
+			drm_bridge_get(bridge);
 			mutex_unlock(&bridge_lock);
 			return bridge;
 		}
@@ -1427,6 +1431,9 @@ EXPORT_SYMBOL(of_drm_find_bridge);
  * Given a DT node's port and endpoint number, find the connected node and
  * return the associated struct drm_bridge.
  *
+ * On success the returned @bridge refcount is incremented. Use
+ * drm_bridge_put() when done with the bridge.
+ *
  * Returns zero if successful, or one of the standard error codes if it fails.
  */
 static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 7f0256dae3f13de1d4109e9265d66684ef2a08ee..948672c27d2eb3034b2519e0bba0fcb52d5c697b 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -172,6 +172,7 @@ static inline int drm_of_panel_bridge_remove(const struct device_node *np,
 
 	bridge = of_drm_find_bridge(remote);
 	drm_panel_bridge_remove(bridge);
+	drm_bridge_put(bridge);
 
 	return 0;
 #else

-- 
2.34.1


