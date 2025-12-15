Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B0BD5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrCltiwnJeJBxnCzg3Wzx1kxB2QTTch2UaqTtqQ6q/I=; b=Kl9Ef9rUmXJXxiv895aUiQkpgz
	6/lJi6UacwiI1kGe97ygeFMT4cBrQTZLppsbOZavTXWhlEPAhMgeKYV19iYLJhKogPWuiQsgBlvLU
	40T2R/vzMc7GfgaPcqDeqewpjw5JDhJX9HIMmp4qRNL1kQkdxgCHQjmSdkMNF/qku04n52dDbRyUb
	noEMHSnbmlecenv/R02mb0X5JqjIvS3Fx5ugqiduWflUyV3YFg9TEezdwtZfO0+FDKi0qqecaqEhI
	Ulp1xmpowMtvEGIQyrGcBgpqLvlCjw/UjRcfGw981GDp9SsRSPdhJQ59ilLuWhw9UGIPotqep3Zjx
	doiln3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9Jg-00000003lX5-2yEn;
	Mon, 15 Dec 2025 14:12:48 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9Je-00000003lVj-2UCi;
	Mon, 15 Dec 2025 14:12:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765807930; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lZ8rFTdi8PmRu+tQO4v+O0xTqoaSQ5nX2ukgNBUgnpyhoezI3uS+dsp8CoozRDgHdDDaUGcRdDeA91/OrPXL8+XRVRdwcvO6eVJVUDuTuIaVR0XU9XVGgAk+yYtcKU+sEig7SF66so6asE08Cd4oNWkGh9kHXHW5o9Q8UOzZx8s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765807930; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BrCltiwnJeJBxnCzg3Wzx1kxB2QTTch2UaqTtqQ6q/I=; 
	b=heM+3J9JMnuPyDuF1y/G3JzsOcw6MZBRIVfPFAB5/gjJg4mCugQGvOLxgz/xbKUFgHNVYkWbtndeHjZbf/6Mu3esIJqwwn2zgAXt3a2vt3zZB1W5CjZXEJNY2a3Q+FKNmdjD29c782wZLCjHNqrqZPIKqlMhaoE3VJ++WEgj1e4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765807930;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=BrCltiwnJeJBxnCzg3Wzx1kxB2QTTch2UaqTtqQ6q/I=;
	b=jOIq6HiDjqQ5IHAZXt/4jCuh0XQxPka8HHLJ5oGn3m0UZZTVstqXXEBPkI3EDQnq
	mMz8IasfLT+h7wjJwuquHYF9TACbep3QXiZJSEFSGdCEAZRQV7bGo1IK7K9RI883KK4
	iCc1CAVs0b2B7HtEI2HcZ8nxQfFz8M28s7F46ygg=
Received: by mx.zohomail.com with SMTPS id 1765807924696668.2202797637121;
	Mon, 15 Dec 2025 06:12:04 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 15 Dec 2025 15:09:24 +0100
Subject: [PATCH v5 8/8] drm/rockchip: vop2: Simplify format_mod_supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-vop2-atomic-fixups-v5-8-83463c075a8d@collabora.com>
References: <20251215-vop2-atomic-fixups-v5-0-83463c075a8d@collabora.com>
In-Reply-To: <20251215-vop2-atomic-fixups-v5-0-83463c075a8d@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: David Laight <david.laight.linux@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Stone <daniels@collabora.com>, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_061246_664205_47CEDDE4 
X-CRM114-Status: GOOD (  15.00  )
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
index 707b48c7e9d8..a0099e4dd4ea 100644
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


