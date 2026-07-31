Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEF5C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fm9cleto2U59tZvo1Dsh8SE6RQrrFnDIwt5UJyCH0I0=; b=xSmJ9+VlL3lNjCpsyeQZLRXMBD
	QmRgNqg8hywIUx6UleVlKdJF1OVFMZ4cSF7uS6Bx/LlujP8HStyF5dIhFasbPOCP3e54+mSZjV1MH
	EJYzPqvRMv8jc7a3CnHt+bGwdYVe+r0XUHgUZ94nGPIv4MTRzHQbPLPONOnFKpstmIwtB48gSa09H
	i3T8UyH7NbWRLtk/wAFg4RfujPtp9TjP75yYGl8ikB9DtSicrtC8glNhlBSCaxAQLC4PoII2szQL+
	8OMhnOfn40Lw0RcOxp80h2cq7lsSePf9k2CUuKRDKW5t5Hfw8UUpSzVkvcIesu5HfkYN7qK0SwnH4
	/bcc98/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppxr-0000000CzuE-2KhI;
	Fri, 31 Jul 2026 16:20:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppxF-0000000CypW-2bET;
	Fri, 31 Jul 2026 16:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514763;
	bh=CUcoRbmERGYIeO3Z961lPfNQR8EGzDg1msKbqGRYj2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IPvyMHq2SUa2dC6Oc6b/P3NBBztmzXSQ/OxKtkYdzszJfrag3HPOu8EVb6tjH0vOB
	 3+mrjfxjtxuBjKPFxwnHfsc6W3AJAlesJWrRlgDj7vyU+d+hGKmQBBEq9IUoBRRzIB
	 lq5QJtf0jlyChJHs9J+G9dGHyva8/clwp7iRc7lGCXCBFxozyLGtJ9y97jnrxt7jVX
	 a+I1GzGSTeraQm7E1YbznmlMPIU+DKbop/0EvHj+xu+yTs7ZNGq6vt1DHK1qgni31Y
	 SdqA4+FxVAjVSs1aIqLgKkrUyqkMlHKUuQdLm3gZGp/xbloeFQg+kjiySmMF8PRKp9
	 1uLCTDJ7wAWRg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6322517E092C;
	Fri, 31 Jul 2026 18:19:23 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:19 +0300
Subject: [PATCH v10 12/69] drm/bridge: Fix unlocked list_del in
 drm_bridge_add()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-12-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_091925_814013_26D61C07 
X-CRM114-Status: GOOD (  10.87  )
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

When re-adding a bridge that was previously removed, drm_bridge_add()
drops it from bridge_lingering_list without holding bridge_lock.

Both bridge_list and bridge_lingering_list are protected by bridge_lock,
as they are concurrently modified by drm_bridge_remove() and
__drm_bridge_free(), and walked by the debugfs 'bridges' file.  Running
the list_empty() test and the list_del_init() outside of the lock may
therefore corrupt either list.

Perform both under bridge_lock.

Fixes: 17805a15d175 ("drm/bridge: add list of removed refcounted bridges")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260723015004.1F5711F000E9@smtp.kernel.org/
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_bridge.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index afaae272347c..8b8f71c3ccff 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -21,6 +21,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/export.h>
@@ -454,8 +455,10 @@ void drm_bridge_add(struct drm_bridge *bridge)
 	 * in bridge_lingering_list. Remove it or bridge_lingering_list will be
 	 * corrupted when adding this bridge to bridge_list below.
 	 */
-	if (!list_empty(&bridge->list))
-		list_del_init(&bridge->list);
+	scoped_guard(mutex, &bridge_lock) {
+		if (!list_empty(&bridge->list))
+			list_del_init(&bridge->list);
+	}
 
 	mutex_init(&bridge->hpd_state_mutex);
 	mutex_init(&bridge->hpd_mutex);

-- 
2.55.0


