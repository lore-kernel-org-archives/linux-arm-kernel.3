Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9616D43356
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 20:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyimSXgzghEkD7AK9n4RAXt1HxLuNqEsyDrb+we5XHA=; b=TMJnaSQ5gnvUVq8cA6NGmUML3x
	JXZ1Tb5zC0LfUGp20NxEFIRaj4qSFoIEpBFv4Xc8d01TksIfSezh4f4/F7q4tgHtHDtOOgDdZn3I1
	o0LAqwDa27Ly1lEefGGJxBHz9p5b5E//50zOwrboNC+RXSmbDvTiBt8tBl0wSWSekfKIkoYqKFWo/
	mdcAK0xoeNMx6y5mldLaja3UtPzMzIL5U3pUQtyKLcNBTI+MIrbWt5cK6+em1AmOMaZe1MKn/ry2b
	OZe0xpflTQeT1suxN+eAcshoVXVk2qLuU2neU+YIt0kRuWnqMpewvnm1JM/kfi3+lryiHGl4dsqL0
	yHRr4MuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnTm-0000000HGRX-49yi;
	Thu, 11 Dec 2025 20:41:39 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnTk-0000000HGNt-42UD;
	Thu, 11 Dec 2025 20:41:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765485683; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nTuUEHfElXWe7b51kcRNMXT70DSsCsLlGHBw26ZyyyvsR1ObeACCtE5SzRvOO8UwIygLEyByVUATVMuXAe8yAec8nK9PSCyFkp+bKOzwaZ6biuMy80KK0mWrDJJLM5BqXDBxWDSaFCK2ArsdYHHLbsZiZTQ/MMSvoFHYADcgIRw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765485683; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cyimSXgzghEkD7AK9n4RAXt1HxLuNqEsyDrb+we5XHA=; 
	b=AALCR3RnwD1vyuFrbw0d5H+hG5taj7OBnYOwwoS9aqPM/kuRtOTXCa+YBiw1qWCC6QoACgk0qaoG/dssVedX5Z8f56/Dy2+J6rfXFIrLibkkazX4BfOZjwyx3bUbwrNAroQU6XjaIzP4NKX9muh21htWytynt3reZ9GwQGEzY3E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765485683;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=cyimSXgzghEkD7AK9n4RAXt1HxLuNqEsyDrb+we5XHA=;
	b=NrZSNBB6NCcgPT6BrU3ZzXgjY/Ri+qQBEJsj8P/whLHxAxGw9aRQEzkKrcTszOy8
	/zoHlYjhXNxURqTtfHxsHVqWnoW9RB8NyQlrwkQ4aGGN8UkhUsqS2K5xAxidBXTmq1b
	Fxtps/LQiW0RxAzV/TqJcr9TYuIff4XEP+qBzt2w=
Received: by mx.zohomail.com with SMTPS id 1765485682758910.2079946657038;
	Thu, 11 Dec 2025 12:41:22 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 11 Dec 2025 21:40:38 +0100
Subject: [PATCH v4 8/8] drm/rockchip: vop2: Simplify format_mod_supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-vop2-atomic-fixups-v4-8-5d50eda26bf8@collabora.com>
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
X-CRM114-CacheID: sfid-20251211_124137_099668_77B30D7C 
X-CRM114-Status: GOOD (  15.18  )
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

Make it a little less convoluted, and just directly check if the
combination of plane + format + modifier is supported.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 56 +++++++++++-----------------
 1 file changed, 22 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 494f4d48f9fe..4659c55d0da4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -367,59 +367,47 @@ static bool is_yuv_output(u32 bus_format)
 	}
 }
 
-static bool rockchip_afbc(struct drm_plane *plane, u64 modifier)
-{
-	int i;
-
-	if (modifier == DRM_FORMAT_MOD_LINEAR)
-		return false;
-
-	for (i = 0 ; i < plane->modifier_count; i++)
-		if (plane->modifiers[i] == modifier)
-			return true;
-
-	return false;
-}
-
 static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
 					u64 modifier)
 {
 	struct vop2_win *win = to_vop2_win(plane);
 	struct vop2 *vop2 = win->vop2;
+	int i;
 
+	/* No support for implicit modifiers */
 	if (modifier == DRM_FORMAT_MOD_INVALID)
 		return false;
 
-	if (vop2->version == VOP_VERSION_RK3568) {
-		if (vop2_cluster_window(win)) {
-			if (modifier == DRM_FORMAT_MOD_LINEAR) {
-				drm_dbg_kms(vop2->drm,
-					    "Cluster window only supports format with afbc\n");
-				return false;
-			}
-		}
+	/* The cluster window on 3568 is AFBC-only */
+	if (vop2->version == VOP_VERSION_RK3568 && vop2_cluster_window(win) &&
+	    !drm_is_afbc(modifier)) {
+		drm_dbg_kms(vop2->drm,
+			    "Cluster window only supports format with afbc\n");
+		return false;
 	}
 
-	if (format == DRM_FORMAT_XRGB2101010 || format == DRM_FORMAT_XBGR2101010) {
-		if (vop2->version == VOP_VERSION_RK3588) {
-			if (!rockchip_afbc(plane, modifier)) {
-				drm_dbg_kms(vop2->drm, "Only support 32 bpp format with afbc\n");
-				return false;
-			}
-		}
+	/* 10bpc formats on 3588 are AFBC-only */
+	if (vop2->version == VOP_VERSION_RK3588 && !drm_is_afbc(modifier) &&
+	    (format == DRM_FORMAT_XRGB2101010 || format == DRM_FORMAT_XBGR2101010)) {
+		drm_dbg_kms(vop2->drm, "Only support 10bpc format with afbc\n");
+		return false;
 	}
 
+	/* Linear is otherwise supported everywhere */
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;
 
-	if (!rockchip_afbc(plane, modifier)) {
-		drm_dbg_kms(vop2->drm, "Unsupported format modifier 0x%llx\n",
-			    modifier);
-
+	/* Not all format+modifier combinations are allowable */
+	if (vop2_convert_afbc_format(format) == VOP2_AFBC_FMT_INVALID)
 		return false;
+
+	/* Different windows have different format/modifier support */
+	for (i = 0; i < plane->modifier_count; i++) {
+		if (plane->modifiers[i] == modifier)
+			return true;
 	}
 
-	return vop2_convert_afbc_format(format) >= 0;
+	return false;
 }
 
 /*

-- 
2.52.0


