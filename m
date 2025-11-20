Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F424CF857F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 10:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G2B1oMH6XMC8F/TLMH3iJY9plQqwnEoLATaxUay7SA8=; b=HyT6aRs7vzkHBzXyqaAzhqSWkR
	InOrZRvt2SwC2W1jGNBf8rGJteVjMwS/v3ka8wvwS89IJvCsM9eLlIEpE0WR+H3+segTcGdQMqEWh
	LOBpaNKM3uPNGhyR8BV7KP0Eoyi2bTCHuvHcJPmBFZc2pb+yuTxGsPyFt3NOsfWWsMrA3hkMv6V+4
	SSrZhNLRQ+3kosAuP9wcjvplIRhaTTh1bPgpgxlwuJXkJ7TSIRnvP2gJMogjcYDzZYJj+K45P3j8T
	5gPXMhLuDtBD0g8LoHQLAqJrIafNBfVQ1ANYdKZ8bzKO3LpcosSt9TkLuDqXJO+WKdWsZ4PuXEMVe
	KQu9cm0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM24f-00000006WQj-42Ir;
	Thu, 20 Nov 2025 10:39:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM24c-00000006WPA-3W23
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 10:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763635174; x=1795171174;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=J8677a+liVG90mEXv9sUxatagrhtLr9kVbgkaIMED9k=;
  b=ce1Ut9VsNy+LPvEfh2uGjF8ctTVtZIKyb+H4jSIZHjJBdZ7ZJ5jaOJO8
   w8ZnO4fruAqDa8dBrNgQlvrswdpgc1ZfQLPS7KQdH2YFVxuHMVHYV7SN5
   liA+U1TuUUIlh9ySEbIxVjGjSlqoGcSlYzaEhiUQ5YqYNdURHlHHO6dPS
   fFlKw21wOqv8olQlMBEJGXGZ4/Af5Ezh+OV+WHW37nTf241zDY07lP6U6
   P4djFcobxLG1TNJvrSrJfid+ze+Azkv7025nxkzAxIdk7gvLVpAmJnCge
   vk1USFQZouQImQAtflNQBuLG/vAWnr+3ODodGo6mlKBi5G8YV4XbgPjwV
   A==;
X-CSE-ConnectionGUID: CRxBPCVgQ9SsmEJbGIfOAw==
X-CSE-MsgGUID: QCtY8nKtR9OFt9OeKqLWkA==
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="280805056"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Nov 2025 03:39:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 20 Nov 2025 03:38:55 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 20 Nov 2025 03:38:51 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Thu, 20 Nov 2025 11:38:25 +0100
Subject: [PATCH] drm/atmel-hlcdc: don't reject the commit if the src rect
 has fractional parts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20251120-lcd_scaling_fix-v1-1-5ffc98557923@microchip.com>
X-B4-Tracking: v=1; b=H4sIAKDvHmkC/x2MWwqAIBAArxL7nZBmz6tEiOhWC2HhQgTi3ZM+Z
 2AmAWMkZJirBBEfYrpCAVlX4A4bdhTkC4NqVCelnMTpvGFnTwq72egVVo9a+bFvm8FBqe6IRf/
 HZc35Ax/cGzZhAAAA
X-Change-ID: 20251119-lcd_scaling_fix-a4842d86307c
To: Manikandan Muralidharan <manikandan.m@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=J8677a+liVG90mEXv9sUxatagrhtLr9kVbgkaIMED9k=;
 b=kA0DAAoBPjnmE/d7ZC0ByyZiAGke77ujhG0mz7EN48i1rGCi4D8K2xJSiOvxcRnnxhoCbQtaw
 YkCMwQAAQoAHRYhBAAwS8mJaaxbjW01TT455hP3e2QtBQJpHu+7AAoJED455hP3e2QtrH0QAM4W
 lw39V1i5i43IF2lUfGx/fxjDop/Icuar7mjQHPxvS4JNNCCA26vKkZHIIACvZWr2BHy/O9N2H5n
 ETDdVR0FGab9W3R7gZhPfJ9cqbDKFRBYt36ooF2CZCwNf1HpFuqDyfpMgw/S1V1htgKZha7Fwhn
 p5rRbvzACyTfCbbC6rQ/ET60yqwt36/Iu4mua4b0lcd4eLRp12I2Gg/fcm8ki0UomfsAD0isYr8
 zH9q1l9fm9gUHSwE2bkTEGnEmbW+9WQQuZKvAOl4tSyA2Zs99WMdqtvMi2R1qMpCil/mZ7ciVUo
 PoJ2vGZ5MGtqox/yemhbgoL4g2JbltsECiuYzV0sj8io9wfeonfbt8+50/fi6TjXiw06x3vau+R
 H+X4ZODyrGPmqE+Pqv8rOrpIDlDEp0nCsjLEkLRMaa936FaMF9w2/+oPAgQeSddbxyjPEj3utpk
 3LWRqKhldh/3nJXSKt07UsRRY32TiAUBS4+W3Yvelsj82FVWKvs3VZPrQVJwuYGb9o9plh4iUUf
 MAh+bJQ++mU50rN+9J+TYW1KrxM3gNl9FfVXEsF88xEIqX95rK/4p9oU/TXI/Ri5ZaIRVHdp2tC
 J89blAAxoQZsz6r1zWNpCtW/l5asYSCHA8Af2h+oqfzGjUbWndRCPEY0U2aIsEU6FzgVwPPJhlm
 yaIEa
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_023935_091838_159AF66A 
X-CRM114-Status: GOOD (  11.15  )
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

Don’t reject the commit when the source rectangle has fractional parts.
This can occur due to scaling: drm_atomic_helper_check_plane_state() calls
drm_rect_clip_scaled(), which may introduce fractional parts while
computing the clipped source rectangle. This does not imply the commit is
invalid, so we should accept it instead of discarding it.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 92132be9823f1e705d266f9547702ea9530bd043..bccfe055c087e5632d60503e8e4bcb3d9e18ce50 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -79,8 +79,6 @@ drm_plane_state_to_atmel_hlcdc_plane_state(struct drm_plane_state *s)
 	return container_of(s, struct atmel_hlcdc_plane_state, base);
 }
 
-#define SUBPIXEL_MASK			0xffff
-
 static uint32_t rgb_formats[] = {
 	DRM_FORMAT_C8,
 	DRM_FORMAT_XRGB4444,
@@ -745,24 +743,15 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
 	if (ret || !s->visible)
 		return ret;
 
-	hstate->src_x = s->src.x1;
-	hstate->src_y = s->src.y1;
-	hstate->src_w = drm_rect_width(&s->src);
-	hstate->src_h = drm_rect_height(&s->src);
+	hstate->src_x = s->src.x1 >> 16;
+	hstate->src_y = s->src.y1 >> 16;
+	hstate->src_w = drm_rect_width(&s->src) >> 16;
+	hstate->src_h = drm_rect_height(&s->src) >> 16;
 	hstate->crtc_x = s->dst.x1;
 	hstate->crtc_y = s->dst.y1;
 	hstate->crtc_w = drm_rect_width(&s->dst);
 	hstate->crtc_h = drm_rect_height(&s->dst);
 
-	if ((hstate->src_x | hstate->src_y | hstate->src_w | hstate->src_h) &
-	    SUBPIXEL_MASK)
-		return -EINVAL;
-
-	hstate->src_x >>= 16;
-	hstate->src_y >>= 16;
-	hstate->src_w >>= 16;
-	hstate->src_h >>= 16;
-
 	hstate->nplanes = fb->format->num_planes;
 	if (hstate->nplanes > ATMEL_HLCDC_LAYER_MAX_PLANES)
 		return -EINVAL;

---
base-commit: fe4d0dea039f2befb93f27569593ec209843b0f5
change-id: 20251119-lcd_scaling_fix-a4842d86307c

Best regards,
-- 
Ludovic Desroches <ludovic.desroches@microchip.com>


