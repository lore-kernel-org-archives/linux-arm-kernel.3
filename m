Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655E4D43356
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 20:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBSVTApRGFO6ipPPb6rgBGPYE/Z13lbAZXToGPqvWnU=; b=M46eX308u5b2t5AKzi9AmF1hIs
	+886ZqbzbrQUgm4watwPRgCx1DjrSGqy7VTyalsjgB2+ixMNHRKkZliwH9fJgTWXVcPZsU0tAEZhK
	1jiDuNlEIuq34p16Q96G3Ocn63Tna4Rg+tbEmxfaGIaGhr/G6WZJsiFdUAigTLch5X4oNynBZ0EWW
	Af0fk/wzpN9Cg+d9dEc8sJDFwksynqXqIYPdKrR0NsfcUHvAYdTwyQlAi5Z/KFUocF0bHIX2NEtoR
	cjlf83BPbjs5kvLsjayRt4obPDWmec8OTUniJGvk2S1iJQQ4FMxk/UKLoniLPJo3v98a+WvIf4Xyz
	BDZv6Ggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnTZ-0000000HG9z-0EBc;
	Thu, 11 Dec 2025 20:41:25 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnTW-0000000HG6H-1bDX;
	Thu, 11 Dec 2025 20:41:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765485669; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TG4KT9o+yZsoqhwhh3xC/tJN1is0Nehf/vg2/ZxmpprFb/G4wvMBW6UwUdyN6n/g1qaZ6G97r+cOiUmznmvsnin5iCL4wy22zAD2CIQgWLvrWHlZCa45l4EbZnvXPyVI+dJmBHmN0SG3N31YmGAOHFbCNNvbji3vh0CrDfn69oI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765485669; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JBSVTApRGFO6ipPPb6rgBGPYE/Z13lbAZXToGPqvWnU=; 
	b=b4Vgcudi24VqlzB9l2v0xVroPPfJZvBxvows661kpU9HL0b0pJb15v4BI5EfEeF3jA0wWENh9z7R9DuoH8GAlUDswpAPUYreWtql93rSWjQzJoSmolP/NMXNDd8IDf/EV47L0kXcX0DeoeXEyBYJ/ve40iMq4hfFtJJ07uLgRrk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765485669;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=JBSVTApRGFO6ipPPb6rgBGPYE/Z13lbAZXToGPqvWnU=;
	b=OgtUxXUc6c+Uf9NUx1fYnRvelRahKeqSWL707Sd9ip+8hKWlXJi5DIxsW2ckoohU
	N1/TPM4XZAoGH3dNxNk5Ae89DhizZr+tIHh8yS5oleZDxIN/gI8Tli60Ts6yS7coap9
	W5SJDBJaKmTD901NkP4CoC3hpkrzk2T4Ey4TRSss=
Received: by mx.zohomail.com with SMTPS id 1765485667363440.498232990705;
	Thu, 11 Dec 2025 12:41:07 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 11 Dec 2025 21:40:34 +0100
Subject: [PATCH v4 4/8] drm/rockchip: vop2: Enforce scaling workaround in
 plane_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-vop2-atomic-fixups-v4-4-5d50eda26bf8@collabora.com>
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
In-Reply-To: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Stone <daniels@collabora.com>, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_124122_459014_42677F48 
X-CRM114-Status: GOOD (  11.56  )
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
index 9d715d7659af..6d4f22872e67 100644
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
+			    "Esmart windows cannot downscale odd-width source regions\n");
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


