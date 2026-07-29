Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CAFC54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 23:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gOPSkr2wlloefEPrua6lklGG7M4k2QPcT5/yGwy/0lw=; b=l7bdY9kWlVHxhr4JSkiE1to/pI
	iR2F1LRw0+5vShpph3xioYX8ObtB8vqMSATsY9K3REMu0gTlYpCPoz2thcX6xqs4G9Liv9QIZjIMc
	NIeM0F0A3m1uM5r8cpmwfzXcgzYXzKKpvGNCyC1YCnKBVJQ9N55kKiGXGNlY7+4u2857O9RVdIUVz
	T2BB+tvYWqRQrZB77fQKkedXlsl9wKkQJT6Hz5waSnp884HCKZeMR1Wd+1f/O11Vv6TuBRQU4VDAw
	56Uw5e/jmz5Vc+7zDJarR46dxVMb9CKt3PYVWKMe6/rZqnzYePXbpp3uibRcW3EK0X9hcpvwdKu0A
	8uMqiF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDeF-000000096qH-29xz;
	Wed, 29 Jul 2026 23:25:15 +0000
Received: from mail-gw-fk003.vdone.jp ([160.251.152.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDeD-000000096p6-1Jb5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 23:25:14 +0000
Received: from mail-gw-fk003.vdone.jp (localhost.localdomain [127.0.0.1])
	by mail-gw-fk003.vdone.jp (Proxmox) with ESMTP id 5E055401827D4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:24:55 +0900 (JST)
Received: from e3.valueserver.jp (e3.valueserver.jp [157.7.184.13])
	by mail-gw-fk003.vdone.jp (Proxmox) with ESMTPS id 7F7EE4015A643
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:24:54 +0900 (JST)
Received: (qmail 287325 invoked by uid 89); 30 Jul 2026 08:24:54 +0900
Received: from p1706034-ipxg06601niigatani.niigata.ocn.ne.jp (HELO localhost.localdomain) (jack@supremeoverlordjabs.co)
  by e3.valueserver.jp with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jul 2026 08:24:54 +0900
From: Tomonori Nakagawa <jack@supremeoverlordjabs.co>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tomonori Nakagawa <jack@supremeoverlordjabs.co>
Subject: [PATCH] drm/rockchip: vop2: give rk3576 VP2 a primary plane
Date: Thu, 30 Jul 2026 08:24:50 +0900
Message-ID: <20260729232450.13797-1-jack@supremeoverlordjabs.co>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_162513_491576_67A23D7E 
X-CRM114-Status: GOOD (  11.92  )
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

The rk3576 VOP2 has three video ports. VP0 and VP1 each have a Cluster
window that acts as their primary plane, but VP2 - the port wired to the
DesignWare DP controller - only has Esmart windows, all typed
DRM_PLANE_TYPE_OVERLAY.

The driver requires every active video port to own a
DRM_PLANE_TYPE_PRIMARY plane. When VP2 is driven (a board that uses the
DP output) it finds none, CRTC creation returns -ENOENT, and the whole
VOP2 bind fails, taking down the entire display subsystem.

Promote Esmart0 to DRM_PLANE_TYPE_PRIMARY so VP2 has a primary plane.
Esmart0's possible_vp_mask already includes VP2 (BIT(2)) and its
layer_sel_id[2] = 0 is a valid VP2 layer slot, while VP0 keeps Cluster0
as its primary, so the existing VP0/VP1 assignments are unchanged:

  VP0: primary=Cluster0, overlay=Esmart2
  VP1: primary=Cluster1, overlays=Esmart1, Esmart3
  VP2: primary=Esmart0,  overlays=Esmart1, Esmart2, Esmart3

Tested on Anbernic RG Vita Pro (rk3576) with the DP alt-mode output.

Signed-off-by: Tomonori Nakagawa <jack@supremeoverlordjabs.co>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 17eda592b..e7d013dc3 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -894,7 +894,7 @@ static const struct vop2_win_data rk3576_vop_win_data[] = {
 		.format_modifiers = format_modifiers,
 		.layer_sel_id = { 2, 0xf, 0, 0xf },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
-		.type = DRM_PLANE_TYPE_OVERLAY,
+		.type = DRM_PLANE_TYPE_PRIMARY,
 		.axi_bus_id = 0,
 		.axi_yrgb_r_id = 0x10,
 		.axi_uv_r_id = 0x11,
-- 
2.54.0



