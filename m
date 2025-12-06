Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC18D3B7DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 20:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WG+GHNTWtRkRqPw9OJ3qyQ3Y1/EgQPS3VRAq88dpP+c=; b=WKszxqHvdSz12R7HrAv9I4Obf6
	4jr0LJDWfDaRdc3hahA/0nJSC/lnywt1BFP8QSRn5/Kf6Ja0ieea0QXS6mDtBGIR4nU7154c367rI
	hzxA+Ecp6w5JCsejTmAY+HJg0sbWcvhXbrex9G8ADeAbQFqH44OnkhpoDaXI2LEJS8V0z+4AK3uYi
	+dvVX6eUfKeOp4y2Qf0BVPv4ugxeLrSUNaNUdzHS8VW6JTOy1V4Ffyzz9lzrr/lqag02xh0mSzQz9
	pYgb57XVEo9cxO4q8UcD0W3Etc4OvNkbwGWNUMDmOqYY3830oMVq9qa1N4BaaVM5dUppsNJfKt0dD
	kz6EIxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAm-0000000BDd6-3Zxy;
	Sat, 06 Dec 2025 20:46:32 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAg-0000000BDWG-2z9y;
	Sat, 06 Dec 2025 20:46:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765053966; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SCXAXr/cKQbkSyJnnQXhGEPv/m23oTHp8CWgP1tF44rfkuHDgXOsyrZVwO+eKblk/1Afxs8YnNq9w8uZQMg2pnlyC6eUljkAfEL/ONqk4MG7E/rVjnK9YKwIlECx5RV7SIqoWEn8VXfZTAOSEcjMBPinpv0awvMxj3EYPPyVcqs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765053966; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WG+GHNTWtRkRqPw9OJ3qyQ3Y1/EgQPS3VRAq88dpP+c=; 
	b=LWMtKmu+64R4kU5hzDnePL+jdUksC2xkmjRvRI+IUIkeySsWZuqJPBsUcPQ5P1BChUquw9Z6CpjaSk1LD57OSbNwmpJKCiXIsNl5QuqGXS/XfieyQLTHgN7xNKCUOfx75VOwPCySTi3HtyKpknraHhcpGFF/YwdDQzjnzWNi8cE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765053966;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=WG+GHNTWtRkRqPw9OJ3qyQ3Y1/EgQPS3VRAq88dpP+c=;
	b=EArln9hX6OPnWX+9bZ/pxKal2jooKwQSEvgJUjkh+X2VI0XWBFqxQxwiIjvBft5O
	gymMK3i3uiclaljpoFqlp3xh1FdnbTHEDY6HZW1nCU3+cJHwIpqx2ZRvIkqQ9DjSAO5
	EkiG5T0JG59wk0aEWAulgvM5acWIfQ3nG6/ZeQhg=
Received: by mx.zohomail.com with SMTPS id 1765053965442536.5205499796182;
	Sat, 6 Dec 2025 12:46:05 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 06 Dec 2025 21:45:18 +0100
Subject: [PATCH v2 8/8] drm/rockchip: vop2: Simplify format_mod_supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-vop2-atomic-fixups-v2-8-7fb45bbfbebd@collabora.com>
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
X-CRM114-CacheID: sfid-20251206_124628_142308_D253DF28 
X-CRM114-Status: GOOD (  14.34  )
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
index 8e0727c3523f..10b59487019c 100644
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


