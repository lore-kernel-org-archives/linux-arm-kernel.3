Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0BCD43354
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 20:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLt345x+m80QdbohyKM4Hq5RZfs7ADEKLCvNEvG5VIo=; b=NS+fnVRquIwxXduigXOMvV1v2J
	mHc3Ev4HDuaR8ROd+426m0kIu5HXtPKlL67p6KonCnEknXcz5dQ/95W3pp7g7QDoxWaDcOlGGAhFI
	dboN8PwLJTIvvnJEt3mut9S9y/9yuXGN2bgstoFY+JNFOfYU4xg20zoVk08A+ya9ddq690rz0Yqkt
	HpS77qjnt40w9frfP+0mrMUUCBa4+cErRFE3yAx1qBlqz1P98WX0EGOf0tbaAam3vsVi5zN1egJHt
	tJ2eRR1RMljtNI60A09Eq1LHkS9e3EbaA3tp3Wal2K24BSqFEaAxIBq1u/qK+ifoELD8qpTf7H7G7
	e2yxjZNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnTd-0000000HGEa-0x7b;
	Thu, 11 Dec 2025 20:41:29 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnTa-0000000HGAj-0Slm;
	Thu, 11 Dec 2025 20:41:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765485673; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O1GN1e9Bf9z+bXDx3Tqp6IvzzxxjUK1bhGrYrNDsf05IYWg8NHAakZ7e4sJ3Pka7D3B5Jqq/GSoOvzw1ycxMqvVcZP+Anv4oGt+Y6wGgeqofsyiK3+R2/tm+Nd3sZHa6SPXbsmcRBhdTfr65YWJa8qUprg84mvF/h4NoAYHhPnc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765485673; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZLt345x+m80QdbohyKM4Hq5RZfs7ADEKLCvNEvG5VIo=; 
	b=Nyr3l7bnOu1q7Gp71+q8X24J4SIx6VTKMAU0SBZa8TVRXo3myoGFIeGrSwI58SMIvugNZ036HtC9VWs5YjTwwRrhAITwUHcvuKS3pO+V90B5NM35UbxsBI2yoC0Jeos8hD6AVbek/CfSJffJUBlYpJU3sXIfugXPLzzHFJdUX7o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765485673;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ZLt345x+m80QdbohyKM4Hq5RZfs7ADEKLCvNEvG5VIo=;
	b=kRHovfU/F3xMmSLOcPlLccLih3qJyPkzlXEpA3n8DsVnOnKu8IKpeHFMhu6++MtV
	X7k9HOLlTNqPi/Rb/MVdw2FmWP+hWeB2B7gMleOjy9XPv95oz9qqzezIbokzZ/38kI9
	3KTgXzvyblSrbCskjdm7GQDsXDNN1VN+zJYcdAtQ=
Received: by mx.zohomail.com with SMTPS id 1765485671283253.77550384595816;
	Thu, 11 Dec 2025 12:41:11 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 11 Dec 2025 21:40:35 +0100
Subject: [PATCH v4 5/8] drm/rockchip: vop2: Enforce AFBC source alignment
 in plane_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-vop2-atomic-fixups-v4-5-5d50eda26bf8@collabora.com>
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
X-CRM114-CacheID: sfid-20251211_124126_935673_971A49A1 
X-CRM114-Status: GOOD (  11.23  )
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

Planes can only source AFBC framebuffers at multiples of 4px wide on
RK3566/RK3568. Instead of clipping on all SoCs when the user asks for an
unaligned source rectangle, reject the configuration in the plane's
atomic check on RK3566/RK3568 only.

Signed-off-by: Daniel Stone <daniels@collabora.com>
[Make RK3566/RK3568 specific, reword message, s/byte/pixel/]
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 6d4f22872e67..a029ed73dda7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1076,6 +1076,13 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier) && src_w % 4) {
+		drm_dbg_kms(vop2->drm,
+			    "AFBC source rectangles must be 4-pixel aligned; is %d\n",
+			    src_w);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -1237,11 +1244,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	WARN_ON(src_w < 4);
 	WARN_ON(src_h < 4);
 
-	if (afbc_en && src_w % 4) {
-		drm_dbg_kms(vop2->drm, "vp%d %s src_w[%d] not 4 pixel aligned\n",
-			    vp->id, win->data->name, src_w);
-		src_w = ALIGN_DOWN(src_w, 4);
-	}
+	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier))
+		WARN_ON(src_w % 4);
 
 	act_info = (src_h - 1) << 16 | ((src_w - 1) & 0xffff);
 	dsp_info = (dsp_h - 1) << 16 | ((dsp_w - 1) & 0xffff);

-- 
2.52.0


