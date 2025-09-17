Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F4ECAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsuFDYB7OcZKpux0SCm4tdgj+Ww6KEv/lmMbhgNKgzs=; b=JibKoJjgbSzAOGgnM8X7Sbmyv9
	TALD6kYyu1ESM/WQNO/K6OmfTame/CWnTFI33KGJs1z/IqUN24kB26pwo4Y04PNdE7pQp71MNitTW
	XPSfkwIrpKrxHNogHLWY8nZX9h5DZechBMgfz3sKxb2307pUUA1vLeMqwhFhWBINIsEsCW6Wjmrl2
	2drNGWyvHxOJY6+do7s8R3eddfZTbOaQA5VpuTqGs8uIImllRUfWrQ2ny4co+etDbA9PIMAKHvtwu
	0Sac6aZdIpFgZHkG2sEDoLyt3PjQrpsSHflrM0VUi+sZ/UvBtW0bcl4W7nN5jmKrEqgZw08VUbtFh
	kpSF5KHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytQy-0000000CMpO-072R;
	Wed, 17 Sep 2025 14:47:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytQs-0000000CMkT-0Umv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:46:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7932460245;
	Wed, 17 Sep 2025 14:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD46AC4CEF0;
	Wed, 17 Sep 2025 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758120413;
	bh=x1PXvkVncP6CkPAjMKvz0gQHZ4weI+N7N3y1J70b5IM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kZqbQbVl4Cg+tb++MFkYuNAj4tNHxtHn5YEwgdIWIni1hzCy62iSEgh1KI7JCHpVE
	 65AYPUZ6V01+mPoNSwUMRLG/PmdqGXCUwu7LU4OR/uHSYo/y2e2Q4R1+Z0lRxKsiZg
	 5wsxUqPSqD0O/e/kC2oFV4euVSXg5yyjZpNWNhUi2U62EbYB6nPMv1kRVz5y6dP4rH
	 aqJfJsRELEuUW1IgC9wEHuDRnCJrODMVu46pluQVDRb4NQVtTeatuGv44wo/AX+fOg
	 DJiDtbe91YkG1gpQhvybALDOENrCZx7NCxoGzrWBIbzOv6dg1DgmQQuM5rirQfpHvO
	 y3GoMalKlAjjQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:56 +0200
Subject: [PATCH v4 15/39] drm/atmel-hlcdc: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-15-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1737; i=mripard@kernel.org;
 h=from:subject:message-id; bh=x1PXvkVncP6CkPAjMKvz0gQHZ4weI+N7N3y1J70b5IM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi7dc7z9pryva9uGha7Zppd1n4jolAh8v67hZxV9K
 kboxD61jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjAR1ymMDZfmXczne7swuI9r
 TX9VcpTlmjczw/f1u04T9sh5ENZUc/KWa8Ob0ASxyR79cxdMWWAjy1hfoHfkzOekzTIS9pn14lk
 uZuv+i5V07bg757CrKbfG5h9CwkkGd+yMLzw7KiT9N2p6VRMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The atmel-hlcdc atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Manikandan Muralidharan <manikandan.m@microchip.com>
To: Dharma Balasubiramani <dharma.b@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 4a7ba0918eca19eca3fd8febd1db1b2d3a8a6e14..59be5f64c058e2be398f207ad436f922135a5ad0 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -712,11 +712,11 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
 	int i;
 
 	if (!hstate->base.crtc || WARN_ON(!fb))
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, s->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, s->crtc);
 	mode = &crtc_state->adjusted_mode;
 
 	ret = drm_atomic_helper_check_plane_state(s, crtc_state,
 						  (1 << 16) / 2048,
 						  INT_MAX, true, true);

-- 
2.50.1


