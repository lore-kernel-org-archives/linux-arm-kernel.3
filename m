Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A0AC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6fqZjW1oWvLkqh+RlLTrzx123aebdEE6NvTpETPRbs=; b=eVWM+W1BgkfrWd6eYA1DOScTdm
	y2VS0BSW8aMD1vk7RKh1Nzla82zcIythvXKXPjVdP13rMlMDIxlYNlWE89tvmJQ5WK5R+bT8NCivd
	giLqP7L2PkKD9S5h0SgQ4prJ/mgmM9XGTh9H2H/vhdHrsotp48n3N7cYSRccT3dhg0CqRnSigTTy/
	vGoLKq59Jzq/Bjzo7SF441JPvOkSh1DHPToiiBezaure+PA1lk6Xz7pzjnj9AZaSNIeCZRkNT3r84
	pjTr4Gzt9l2WTMpTzFl4c+/zdIuUIXQAP5tjsO0B1EQxn8PCy6KNwp+KnqfuJakl/4IXKuI3FCPF2
	m1EFRryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfn7-0000000GGvs-1DQc;
	Fri, 20 Jun 2025 17:44:41 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfVX-0000000GEN7-3LlL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 17:26:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B19161FD35;
	Fri, 20 Jun 2025 17:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750440390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6fqZjW1oWvLkqh+RlLTrzx123aebdEE6NvTpETPRbs=;
	b=fTagO/T0OTOSnVnshXf2t7eoC1TNsFFRvmJASF050aBRmpJRPng/1jWaqHVE4EV6nLUYkG
	LXT/aLNHx9qBUC9eL/DZhwOtFzoWXAdPj/1N13PgsZKCkO8XNVXR8fyg7QZGx0pMmNt/MI
	QftrSf9TvdyWs4oGgeQI1pk5tg4L8bCUpmf6M3t4saZyqmBzng3op7NRmd+R9eQGviVPOF
	p5uyZgnlMCKkkY5xXbqugJVQ0hrVmVjSU/d0Tuxe1mK1SzPSD1n/F23H2UTsKwDn8sbFyE
	zNdkaNl5I4YVNp2B7IXTm9y4JXGtCF6BlghMtjHoQrxGFZn8+2eNJn5+uvY2Iw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 20 Jun 2025 19:26:16 +0200
Subject: [PATCH v8 4/5] drm/atomic-helper: put the bridge returned by
 drm_bridge_chain_get_first_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-4-0321845fcafb@bootlin.com>
References: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
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
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhin
 hdrtghomhdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhtvghfrghnsegrghhnvghrrdgthhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_102631_985350_EA63F19A 
X-CRM114-Status: GOOD (  10.13  )
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
refcounted. Put it when done.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v8:
- reworked after the changes in pre_enable/post_disable order:
  f6ee26f58870 ("drm/atomic-helper: Refactor crtc & encoder-bridge op loops into separate functions")
  d5bef6430c85 ("drm/atomic-helper: Separate out bridge pre_enable/post_disable from enable/disable")
  c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
- Removed R-by Maxime as the diff is not identical, even though it is in
  principle the same (there are 2 new drm_bridge_chain_get_first_bridge
  calls, thus added the corresponding drm_bridge_put calls)

This patch was added in v7.
---
 drivers/gpu/drm/drm_atomic_helper.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ef56b474acf599bb9cd341674dc83b04ae247eb7..d5ebe6ea0acbc5a08aef7fa41ecb9ed5d8fa8e80 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -456,6 +456,7 @@ mode_fixup(struct drm_atomic_state *state)
 		ret = drm_atomic_bridge_chain_check(bridge,
 						    new_crtc_state,
 						    new_conn_state);
+		drm_bridge_put(bridge);
 		if (ret) {
 			drm_dbg_atomic(encoder->dev, "Bridge atomic check failed\n");
 			return ret;
@@ -527,6 +528,7 @@ static enum drm_mode_status mode_valid_path(struct drm_connector *connector,
 	bridge = drm_bridge_chain_get_first_bridge(encoder);
 	ret = drm_bridge_chain_mode_valid(bridge, &connector->display_info,
 					  mode);
+	drm_bridge_put(bridge);
 	if (ret != MODE_OK) {
 		drm_dbg_atomic(encoder->dev, "[BRIDGE] mode_valid() failed\n");
 		return ret;
@@ -1212,6 +1214,7 @@ encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
 		 */
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
 		drm_atomic_bridge_chain_disable(bridge, state);
+		drm_bridge_put(bridge);
 
 		/* Right function depends upon target state. */
 		if (funcs) {
@@ -1329,6 +1332,7 @@ encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *sta
 		 */
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
 		drm_atomic_bridge_chain_post_disable(bridge, state);
+		drm_bridge_put(bridge);
 	}
 }
 
@@ -1501,6 +1505,7 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
 
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
 		drm_bridge_chain_mode_set(bridge, mode, adjusted_mode);
+		drm_bridge_put(bridge);
 	}
 }
 
@@ -1580,6 +1585,7 @@ encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state
 		 */
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
 		drm_atomic_bridge_chain_pre_enable(bridge, state);
+		drm_bridge_put(bridge);
 	}
 }
 
@@ -1655,6 +1661,7 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
 		}
 
 		drm_atomic_bridge_chain_enable(bridge, state);
+		drm_bridge_put(bridge);
 	}
 }
 

-- 
2.49.0


