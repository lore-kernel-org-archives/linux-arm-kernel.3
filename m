Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56BEE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 19:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X8JUvZDF8pZ0yrFE3tmHbXwwXfZImzkkNaXc3mj/tqA=; b=rzL9IjZvkuaH2UJ7SihMV43MWG
	l17h4FT4E30WV+i+hzmk6pWM/svzirkV1y3jR5UyKHIwnaauDP8N06Is6SLlVYTDS3J3aYGh9nFGw
	QuROTjSCkN+0MocGWEt/Jj2s9YQZabDV1mE9jdOUR/BgxUKfBbibj8JtENeKeYW8VpYQc2QZ+TUhQ
	a40ZGTJFOMLaFB/Gy8AJMTvRUzY7yHnbk/qGq0cCFnA6YJI7ubphOqEZ+eByQf/hSqn/Vd2qwuMMt
	eulsYBAgzn94b3WvVXZDLWCp+bJSdpWRyNXvkVrjUyqXqcQeUeL6GhzRLZhjogaZoxFdfYKYlepJr
	YPCt9nKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdz4-00000002Y74-3vVP;
	Fri, 06 Dec 2024 19:27:26 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdy1-00000002XwQ-28pD;
	Fri, 06 Dec 2024 19:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1733513176; x=1733772376;
	bh=X8JUvZDF8pZ0yrFE3tmHbXwwXfZImzkkNaXc3mj/tqA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=TgMB9PJiYp1AurePQcKDKKRhb5iu7GXqi7HXbRGra+wqFlXoUGGHvGPUG4I8EzHCf
	 38EZb0oX8K8OOhPCN4JxOEvRaHBabV/nh+bAmgtOaYnwjW7K5p1scQueIbixupVC5H
	 VUlhfcSyz/U8Kty3kKByJkbOUWkTGYIrcO1H3QI0FbuRidUd3yr6+ItKsqlPqydlTQ
	 nLok/LZDKd4/3MCaC9ICWJt5kavTRXGtjt0Sh1r6Ksb87k2amfohwKGNr6ZtsfQcEe
	 pfCYLGTLQlQAT0yQlrqSLzC5CBhMKMmJtWcJrEVNr5tCtfrDgsbBgmzhfDJ08byBhh
	 pbK1JdFAXvUmQ==
Date: Fri, 06 Dec 2024 19:26:10 +0000
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: Piotr Zalewski <pZ010001011111@proton.me>
Subject: [PATCH drm-misc-next] rockchip/drm: vop2: don't check color_mgmt_changed in atomic_enable
Message-ID: <20241206192013.342692-3-pZ010001011111@proton.me>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: eb3005eed4d313c0c579f9dbf9bb42fd9ad30527
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_112622_280737_663D52C8 
X-CRM114-Status: UNSURE (   8.17  )
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

Remove color_mgmt_changed check from vop2_crtc_atomic_try_set_gamma to
allow gamma LUT rewrite during modeset when coming out of suspend. Add
a check for color_mgmt_changed directly in vop2_crtc_atomic_flush.

This patch fixes the patch adding gamma LUT support for vop2 [1].

[1] https://lore.kernel.org/linux-rockchip/20241101185545.559090-3-pZ010001=
011111@proton.me/

Suggested-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Piotr Zalewski <pZ010001011111@proton.me>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_vop2.c
index 0c8ec7220fbe..d259f1c6571d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1601,7 +1601,7 @@ static void vop2_crtc_atomic_try_set_gamma(struct vop=
2 *vop2,
 =09=09=09=09=09   struct drm_crtc *crtc,
 =09=09=09=09=09   struct drm_crtc_state *crtc_state)
 {
-=09if (!vop2->lut_regs || !crtc_state->color_mgmt_changed)
+=09if (!vop2->lut_regs)
 =09=09return;
=20
 =09if (!crtc_state->gamma_lut) {
@@ -2669,7 +2669,7 @@ static void vop2_crtc_atomic_flush(struct drm_crtc *c=
rtc,
 =09struct vop2 *vop2 =3D vp->vop2;
=20
 =09/* In case of modeset, gamma lut update already happened in atomic enab=
le */
-=09if (!drm_atomic_crtc_needs_modeset(crtc_state))
+=09if (!drm_atomic_crtc_needs_modeset(crtc_state) && crtc_state->color_mgm=
t_changed)
 =09=09vop2_crtc_atomic_try_set_gamma_locked(vop2, vp, crtc, crtc_state);
=20
 =09vop2_post_config(crtc);
--=20
2.47.1



