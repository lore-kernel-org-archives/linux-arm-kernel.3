Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C42D3B7D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 20:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0aqthGYccBDaPtwYeA4PF5vLiTR97ZedQGGVTxxz9Q=; b=KlnBxqHvUShIOOkpzgKTeeJmC3
	u+W2hs5xj3qQC+SV6GgxCt0OCmYmR8/GAwHErBMYqkj2QO2FRTyHTIM3Ik6xT3tI6/2Y8Rzgowosn
	g4JNOAg7J9q91N839eCInzWUDveTx1rfVVEgupxfl/qayAkx6twKiCgpLL32aQFonHYwoIijA3kfR
	s4KXGWPciGYENYNjss7m6ngLXwTAwbaf2cMlQDPnH6GH+Y+K2XYofMfgt3X7kDa3moQCFq4PAgoaI
	GqBfJh6EtNxbkBe+XxwDhJTyoYj/Q4qGjD2zs60u8kqfPsvug49CyBWr2S4VDNj2Je3RM7oPSP+cS
	WUR9/ztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAQ-0000000BDDZ-2aOV;
	Sat, 06 Dec 2025 20:46:10 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAM-0000000BDAj-457e;
	Sat, 06 Dec 2025 20:46:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765053952; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kbaWUB1PCJgkXehwdOxd353El/GAykILQlBOFl+lWSuhXiIwzoXIwPYiS8BT0pAytMXqU012w+NkRKAdG+aMFxEj7C5UKLChZQ6nLIqGztmoJ+UfouGXYBYmqKTy/w61KG12dj/RM/QzV7H1omi1eZ5WpVchtIfCqqv/JlHm78U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765053952; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G0aqthGYccBDaPtwYeA4PF5vLiTR97ZedQGGVTxxz9Q=; 
	b=cSR8ERIVx2tHdMREAFZYtHP6SY3jl/CJ5y2mYqwyLGQtLyCPdKNa75TypoxXOWpJY3hRkjNN7Csbeuj4FFThPGR2uzOHNY7+wAbnOVLc+IxKDMMUYJ8Gr+aT6utNjdz6TA5rDxrxr4sz9ttcyx6EZxrFTc0es+Z+1/iq7XlwEfM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765053952;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=G0aqthGYccBDaPtwYeA4PF5vLiTR97ZedQGGVTxxz9Q=;
	b=aTyfgzyKGnXfRTuJdzCV7aKoniLCMwC/BIinK4PTLHvPG63CSWdKjiEzlqfnsNim
	Pji2aEnq5ozhcw3MWyfIYNsFMhqDx+YcGGLY9u9/dVK3Eo5MELFPjS9GRRrP4DlvoRb
	SOHaI0wS4l0vSgiZr3Fqpok2yCXU7OV6JBOSlxM0=
Received: by mx.zohomail.com with SMTPS id 1765053951890283.3847103890606;
	Sat, 6 Dec 2025 12:45:51 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 06 Dec 2025 21:45:14 +0100
Subject: [PATCH v2 4/8] drm/rockchip: vop2: Enforce scaling workaround in
 plane_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-vop2-atomic-fixups-v2-4-7fb45bbfbebd@collabora.com>
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
In-Reply-To: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_124607_115147_7880B0BF 
X-CRM114-Status: GOOD (  10.81  )
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

From: Daniel Stone <daniels@collabora.com>

It seems only cluster windows are capable of applying downscaling when
the source region has an odd width. Instead of applying a workaround
inside atomic_update, fail the plane check if this is requested.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 9d715d7659af..bc1ed0ffede0 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -998,6 +998,7 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 	struct drm_crtc *crtc = pstate->crtc;
 	struct drm_crtc_state *cstate;
 	struct vop2_video_port *vp;
+	struct vop2_win *win = to_vop2_win(plane);
 	struct vop2 *vop2;
 	const struct vop2_data *vop2_data;
 	struct drm_rect *dest = &pstate->dst;
@@ -1065,6 +1066,16 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	/*
+	 * This is workaround solution for IC design:
+	 * esmart can't support scale down when src_w % 16 == 1.
+	 */
+	if (!vop2_cluster_window(win) && src_w > dest_w && (src_w & 1)) {
+		drm_dbg_kms(vop2->drm,
+			    "eSmart windows cannot downscale odd-width source regions\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -1226,16 +1237,6 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	WARN_ON(src_w < 4);
 	WARN_ON(src_h < 4);
 
-	/*
-	 * This is workaround solution for IC design:
-	 * esmart can't support scale down when src_w % 16 == 1.
-	 */
-	if (!vop2_cluster_window(win) && src_w > dsp_w && (src_w & 1)) {
-		drm_dbg_kms(vop2->drm, "vp%d %s act_w[%d] MODE 16 == 1\n",
-			    vp->id, win->data->name, src_w);
-		src_w -= 1;
-	}
-
 	if (afbc_en && src_w % 4) {
 		drm_dbg_kms(vop2->drm, "vp%d %s src_w[%d] not 4 pixel aligned\n",
 			    vp->id, win->data->name, src_w);

-- 
2.52.0


