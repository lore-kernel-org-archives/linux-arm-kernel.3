Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D600C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 23:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XljWSwpXzAF9F4cJ/f7pUZK/55uD8CcPrq63/TkcJhM=; b=z/HAG+X8wazbNkGaPztvsuH/X+
	RC/CcyXqp3JqOJaDo/UzOmk7Tbo0yPOncH5Z/HHpwu26cnFlqAiASFII54VFcZ8Nqdbymy6Ao66uX
	Zd+oz+lcob8QKgyhj6G/iNUJxjcsesrHVGt2mysUJdzESC1fXfMjqj1oOvrvQOZQIdTiWAXtLUtb5
	sA7/it/j3q882HhfSDEv7xVyaL1F0MyJvqoY2RvG48HWrRF+xmhSFlDrf6WDTZWGwRg75jSjfhAYi
	xQ6TsCF9WJqItF38m3HeNu+qq4p80/FU5mNl4/vKWm+dYH2u8GLCIRbnAQ9cvHTkeDLYPuEXEabBv
	xNLDlhhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaHN-00000000ULU-0fWJ;
	Wed, 08 Jul 2026 21:58:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaHD-00000000UAV-37CC;
	Wed, 08 Jul 2026 21:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783547874;
	bh=1lxL6iZj9jod6SaADPf3z3MD+LcfeBUp8hGTnd0MHzk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y7DSDi1fkQNsCADtB3pxe5jxw6CpJNLb0/9SV3vEFJylYMo9JrKXujHmcT2pvfglB
	 ID8gnmqTsn6fj0I5sMEbp6qfibzKyHA/cusY5Z314alYRuWT2YLuDJoMTmO6TA7dQa
	 D+i9MH2zU1aTrrRMOu5zbiaP8Sxruasosn8CYtIEsC4vV9XHv2kqr8sof0wq3S1Hat
	 heYDLuk89AApa66fWHqlu3Vw0/xHqsxPRYfPaI9ujTZomGpA9rnP+uzZObzx3F0x//
	 Zlrf5EF0/17qJhI7XRcRjPF7eQOVK/WzYFDOuXu/1YypAmTtw0KP7m5qUjuLBflte6
	 3VJWCU0M7XtRA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D66BA17E0D33;
	Wed, 08 Jul 2026 23:57:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 09 Jul 2026 00:57:26 +0300
Subject: [PATCH v3 04/14] drm/rockchip: vop2: Send pending event when
 atomic_enable() fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-dw-hdmi-qp-yuv-v3-4-a4a982a9f2e7@collabora.com>
References: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
In-Reply-To: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_145755_934701_1467007C 
X-CRM114-Status: GOOD (  15.44  )
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

vop2_crtc_atomic_flush() stashes the CRTC completion event in vp->event
and relies on the frame start interrupt (VP_INT_FS_FIELD) to deliver it
later via drm_crtc_send_vblank_event().  Since atomic_enable() runs
before atomic_flush(), bailing on an error path makes it skip
drm_crtc_vblank_on() and leave the video port disabled.  atomic_flush()
still traps the event in vp->event, but since the port never scans out,
the frame start interrupt does not fire and the event is not delivered.
Userspace waiting for the flip completion then blocks indefinitely.

Note the event cannot be flushed from atomic_disable(), as userspace
waits for the completion before committing the next state, so the
disable does not arrive and draining it there would deadlock.

Use the newly added vp->enabled flag to detect this in atomic_flush()
and send the event immediately when the port did not come up, rather
than deferring it to an interrupt that will never occur.  This also
avoids the spurious drm_crtc_vblank_get() WARN previously hit on the
failed enable path, where the vblank is not on.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260706194935.AC7601F000E9@smtp.kernel.org/
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 271c3cba6fb4..4bb1985b8726 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2083,8 +2083,19 @@ static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
 	spin_lock_irq(&crtc->dev->event_lock);
 
 	if (crtc->state->event) {
-		WARN_ON(drm_crtc_vblank_get(crtc));
-		vp->event = crtc->state->event;
+		/*
+		 * A failed atomic_enable() leaves the video port disabled with
+		 * no scanout, so the frame start interrupt that normally
+		 * delivers vp->event never fires. Send the event right away in
+		 * that case to avoid stalling the flip completion.
+		 */
+		if (vp->enabled) {
+			WARN_ON(drm_crtc_vblank_get(crtc));
+			vp->event = crtc->state->event;
+		} else {
+			drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		}
+
 		crtc->state->event = NULL;
 	}
 

-- 
2.54.0


