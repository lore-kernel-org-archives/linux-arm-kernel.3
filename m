Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A06DC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8WyS9dFuyNXdRrYofLISBI2/TefT+6RTQB6m+MXc+k=; b=rvDfUzIkQmhvs7gh+kSkVBL49T
	ms400f8v6Y3gxLeOAzv+1jdiSllzY5w0jGWPuZuHa9AnfJBWFhoCE9IO9nt5/Y2Xrsi3uJgiK20YI
	MmYybC7ZPUKoNGRNtubPeo2/lxXHxEK+5aPZXG0IFUfg8fyNLs3NCUxiSgoJpmAEyclPIg3NmN1l5
	t8PEOLYIBtgztKxt0+3zTJH/auSlL0HphJDWNnTU6PcOZBJlWYnVV1V6b9ZFiLp9Pdv24dOpcQWla
	RqbcgyapA63SrzW2Ti8s1B2SXU7urPn9w6cZUQ6OGoMeztb84xjiURFz61t46EpLWLYFtlYzYbCK1
	uBxX0ofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZW-0000000D0w5-37QC;
	Tue, 01 Sep 2026 18:51:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZM-0000000D0eU-0b2W;
	Tue, 01 Sep 2026 18:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288650;
	bh=FBzckI23H5DYUC2fgN1hQr/tvawmRAaCLybpPifECK0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eyvBQ9535XiqSaP4elS2GOEHVT/+FqLzgiskBu5/HBmeAUIMgOv7E+9Bby5tkaTyD
	 Q7rszzADi6sIb9zgk6zZ+qEWROy8HGNSeA9Pv59D8AR6PlFnU0OJz/sNeQvr+eWseP
	 IJWFcfvBtMbEYta4hXAdRkTfFNLeQT4o/6lBN8e4rEUPwC97Q87+vrXVlBqFaqTIS6
	 ndHWnz8C5RdC9ZmJIZ7UCejiycN/dt+gMa4GD/BeuMzQ0UvkGTj5rrao7fIT9pCIW8
	 t0zqw1uXbnzMUQ6Q+doegX5ROwh37bdK2+lsLQwSMUsdBfX9KwFRgHlalOv04V0HFT
	 gazA6jd2ofOGQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE58317E3606;
	Tue, 01 Sep 2026 20:50:49 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:50:36 +0300
Subject: [PATCH v11 12/74] drm/bridge: Fix unlocked list_del in
 drm_bridge_add()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-12-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_115053_481893_D7D529CD 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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
 drivers/gpu/drm/drm_bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index afaae272347c..2c457ad74f3b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -454,8 +454,10 @@ void drm_bridge_add(struct drm_bridge *bridge)
 	 * in bridge_lingering_list. Remove it or bridge_lingering_list will be
 	 * corrupted when adding this bridge to bridge_list below.
 	 */
+	mutex_lock(&bridge_lock);
 	if (!list_empty(&bridge->list))
 		list_del_init(&bridge->list);
+	mutex_unlock(&bridge_lock);
 
 	mutex_init(&bridge->hpd_state_mutex);
 	mutex_init(&bridge->hpd_mutex);

-- 
2.55.0


