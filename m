Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9590C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2Eg1HPmWF8yLZCo7xKQl7OMEsEPg2JZeg/p1G727nw=; b=UwLwy1N8cwesUVfx6luXVPG+sw
	RY/DI6DI3IgxptdNcOjnLQY9/oRSm5jXAkDp6ZNd/35h5yXEi9LzgCE279rhnb6afhz/p6JqHZbEO
	xzmbJj6W1J1/Ab8++zL3gMOJnoLzItBKNaNTVj0u8gtBcYA3x6Ac09UcaAAaqal5Z30ztWfUDLcHc
	7aawqg2RZLHvrI7UcVFTB4QnD7XyPQ9OURaD4p/GP80Dt0fu4WbqYYLJE6tifTRXcr4IeuBCMnbMB
	swlW6E8oE4AnCa3XASvi6SHCUwBuVDuWMhXHaFzYN8+/dlibV+Sor4mWOk/3FVL+YPkVx27Dw2Bew
	Tnk+WH0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oNJ-0000000BvmO-35Dj;
	Thu, 24 Sep 2026 18:40:53 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oNC-0000000BvgT-2Jhy;
	Thu, 24 Sep 2026 18:40:48 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1x9oN6-000000007Jy-3Agj;
	Thu, 24 Sep 2026 18:40:40 +0000
Date: Thu, 24 Sep 2026 19:40:37 +0100
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
Subject: [PATCH v7 05/14] drm/bridge: it6505: complete poweroff even if
 disabling regulators fails
Message-ID: <b6053ef6184ce92d4285a91f6b40795b89eefb2b.1790275151.git.daniel@makrotopia.org>
References: <cover.1790275151.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1790275151.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_114046_597523_6C0A8A2E 
X-CRM114-Status: GOOD (  12.18  )
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

it6505_poweroff() returns early when regulator_disable() fails,
leaving it6505->powered set with the IRQ already disabled. The next
it6505_poweron() then takes its early return and never re-enables the
IRQ, leaving the bridge deaf to hotplug and link training interrupts.
The regulator core keeps the consumer's enable count on a failed
disable either way, so bailing out only adds a wedged bridge on top of
the leaked reference. Log the error and complete the power-off state
transition instead.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v7: no changes

v6: note that the regulator reference is leaked either way

v5: new patch
---
 drivers/gpu/drm/bridge/ite-it6505.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 19bab8d65e22..b9e5ce36f556 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2814,13 +2814,15 @@ static int it6505_poweroff(struct it6505 *it6505)
 	if (pdata->pwr18) {
 		err = regulator_disable(pdata->pwr18);
 		if (err)
-			return err;
+			dev_err(dev, "cannot disable pwr18 regulator: %d",
+				err);
 	}
 
 	if (pdata->ovdd) {
 		err = regulator_disable(pdata->ovdd);
 		if (err)
-			return err;
+			dev_err(dev, "cannot disable ovdd regulator: %d",
+				err);
 	}
 
 	it6505->powered = false;
-- 
2.55.0

