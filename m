Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19226C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 21:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WPvKcEDX6gnCm2ST1FdaIZ8G768BH/wHFWRkdo2jksY=; b=MG/JOp1gvop4f0YumIp88oMeFo
	TLgXIXEICj2YnaNsT7Ni0NcbqUM/K7IF2UbaovrKOMn5rgHjJZCiCUZg82nCMQ/pBttK5bitbFMQG
	DaQgwRyvSmZPEeOr8RC4DWWJWiwqp9Z7r20B8pL06URykKWX6qqIYJzY+9B+8NoZS/78iuXwu/kRS
	t0HDaYz5AiKHHuPzHN1RVwPizodJUP5k77RJsguwbCrJ8nZOw1eHzTT6SbIL5Fm8Q12XQQzQV/ewM
	95XykWjewYJkvVvpbrMKF7aJf9poxGpJq0lxTlL6uTtyutcnpzZ3WkGLOb78v2TRwm2QxXAgTX9vu
	S53W4utw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4PjD-0000000CsDt-04og;
	Wed, 09 Sep 2026 21:21:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4PjB-0000000CsDk-2FyX;
	Wed, 09 Sep 2026 21:21:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA13C600D4;
	Wed,  9 Sep 2026 21:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65267C2BCF4;
	Wed,  9 Sep 2026 21:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788988868;
	bh=LPHP2ud1c3YW5aWPJeus/gJIDU9RP1d3zaNoCvKdyaA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ebumszhtFwh5OBFp8+i7VvVOC2IonvQkurLEcJPnlH7KO4aQNw2Qt2tPZPt3kNJ9w
	 FgLJ3ng02ClqaWEEk11ih7463lPbsIXzmR6Ti+wNp4kE5cirR64zfl2k1mEh/ex0KN
	 rex7V8Ss1KjyZgJ2XWjRrKwAYowCjKhwATaj8Bgn6YYJ2MuxRBzuhQ41X8SqZjm3Vk
	 KUyR186EvqDY+Rf6lEV1wVH5ewUaWCx+zUB0rRKUujS8MtRAjc5aP3m7cSYAsDfKyO
	 cZ0Le/qGRj3o9XYpy3NP6r/R8ObCNagFvz2upZsmhXnXPmJQea0M5K3sVfNIfC+E4L
	 1hhEM2Wv1KlUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E104C79FBB;
	Wed,  9 Sep 2026 21:21:08 +0000 (UTC)
From: Johan Jonker via B4 Relay <devnull+jbx6244.gmail.com@kernel.org>
Date: Wed, 09 Sep 2026 23:20:54 +0200
Subject: [PATCH v2] drm: rockchip: add drm_plane_create_blend_mode_property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-blend-v2-1-37e27af4faee@gmail.com>
X-B4-Tracking: v=1; b=H4sIALXNoWoC/x2NywqEMAwAf0Vy3kIpixh/RTz0ETWgVZJlEYr/b
 vU4zMAUUBImhb4pIPRn5T1XcJ8G4uLzTIZTZXDWtRYtmrBSTiZ2mFzEqcXuC7UNXskE8TkuT71
 5/ZE84hCa+HwHw3hdNwJAikJwAAAA
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Johan Jonker <jbx6244@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788988866; l=1304;
 i=jbx6244@gmail.com; s=20260824; h=from:subject:message-id;
 bh=Vv2dAdwZrZngpYkZZtAtqUthy17ncXSrnl8lfyqCNow=;
 b=7Y4+ehZW3Pl8LcRBNO/umDaR4t+TQniFaUIL8IMw+k7AXa7gOy7ImS/oeZzJ6Q0zkM5k63iLE
 CSUZaUjRPkDC43hP0rkLVd0w6yVkois1LwGyvp87PxSPBGhVEUwn16D
X-Developer-Key: i=jbx6244@gmail.com; a=ed25519;
 pk=MK5Flx1ndjAF0uwXdNm8VvvoghD4KWCNd2hQE8QGyl0=
X-Endpoint-Received: by B4 Relay for jbx6244@gmail.com/20260824 with
 auth_id=971
X-Original-From: Johan Jonker <jbx6244@gmail.com>
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
Reply-To: jbx6244@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Johan Jonker <jbx6244@gmail.com>

A validate_blend_mode_for_alpha_formats() function was added that
fills the kernel log with warnings for Rockchip VOP version 1 SoCs.
Add a drm_plane_create_blend_mode_property() function as fix.
VOP version 1 doesn't support blending with a pixel alpha background
layer, only with a constant alpha. Advertise blending capability with
DRM_MODE_BLEND_PIXEL_NONE.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V2:
Add comment line
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 0090d8ff0c79..0bc5b606f021 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1850,6 +1850,8 @@ static void vop_plane_add_properties(struct drm_plane *plane,
 	if (flags)
 		drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
 						   DRM_MODE_ROTATE_0 | flags);
+	drm_plane_create_blend_mode_property(plane,
+					     BIT(DRM_MODE_BLEND_PIXEL_NONE));
 }
 
 static int vop_create_crtc(struct vop *vop)

---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260909-blend-c89d2c9f6984

Best regards,
-- 
Johan Jonker <jbx6244@gmail.com>



