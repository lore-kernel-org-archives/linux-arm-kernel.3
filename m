Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD56CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 11:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhwyfrIJk0LjfvzKXx2oGh9eZXmgpjXx2C9jAt2cBNM=; b=RcMuWvW9k7M3Z1MbQ4i/GyAzTJ
	y9Bhsv/s3WlSKEjJWQAv8X09mLDRB0gBr4xkp1MmCZiM5wb99zcjAjqIzvkHiQl7/fKkYqGN3XVaH
	JsKU5bRKjN6JIbCkS3QQtDyFfvUDO6ZyihU+pgpZBbrlhqfg7dQmGu9q8EuGkjiCBfbU3I0L+3Lsc
	9z9szTGHDhWNdGpm5HpqwXcjC33zSolfbytV4Hzu1t9IO412cSDSDOBSDluYysdamd49X+2MEi0eZ
	4A3rsbI38owQiMP9bW+xUjUQqh+z0GY8F/56TLng0yN195/T8scyge9IVjs15bTiZVsy0hq5JKqwX
	NU+jxUoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Y6E-000000054s9-3piL;
	Tue, 30 Sep 2025 11:00:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Y6C-000000054rU-2UAJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 11:00:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D38842B8A;
	Tue, 30 Sep 2025 11:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FE3C4CEF0;
	Tue, 30 Sep 2025 11:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759230048;
	bh=cfKBWk9jw0KIr9p0JluSWxg7pYNXEHA3aZKpd5ss0Gs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b9dIVixmEmWisjTdcLSDNndzhGg6k4wt2aLVyBoLtXlkDlA47azjirKBM4xr6jzc1
	 IS6bwoenliiZBgDTdwfTGvRHTJOCNs1iyrTgpgHcltS5dc58sk3bSx21awe/cu75KR
	 9bcUXILpIfaO5yScspjbP2PAIlC5QzRqbWnCfI0Ui3EBLBJN+b1qogJBap8Bbo7AOr
	 FnCU2RpMdVegRparRq5ui1fUpS+oXU6lEnzKzstPtGNblgZZbulL55MwO+G+28idyD
	 qOMPvKfK9sJcfhJWdzBVCjW0z5KEcWxmhhECC9PVvWtD/N1miKbXu+s0uZ8iShgG73
	 gfr0U3mPJK0kA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:30 +0200
Subject: [PATCH v5 15/39] drm/atmel-hlcdc: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-15-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
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
 h=from:subject:message-id; bh=cfKBWk9jw0KIr9p0JluSWxg7pYNXEHA3aZKpd5ss0Gs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d6h9OSNv3+0oa/MsyDa2QIvhf8cNu51Nb3i6HmZz9
 fZVOj3smMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABO5u4yxPtuWw+fOhEfRd5iP
 722u+vIkJ37ar32ndi1mYAg12MUt998wMvM8c6/Z3p+L7d8u4DD7z9jwZMqM2Quv+SvvybDS4eV
 YGz6Z7YyvxIHdzLM5ZpiIhpqrJ7EHvSpIy47aeY/j4OII0TwA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_040048_688520_899CC8E6 
X-CRM114-Status: GOOD (  12.20  )
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
2.51.0


