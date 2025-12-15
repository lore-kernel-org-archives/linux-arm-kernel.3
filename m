Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32836D5B16C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgEZADjjBlqDB4JCYXAp+UjxRKt+xRWWF/jQ8tJdXSw=; b=TKp6Wf4E/qo1xTeN+gUTfMmapj
	f9KkuMDMH7oPMjJCPbIjfVdQnHzuetRm8jVYvM7W7w7ZXToSk8LsWGO7FXbuGVMY198/YRHaJ6OlI
	TxQsbf5VaUnX7coPZ1INleRmdj1Y8fEKbyhb6D3dETLTC9qIxrt90QZn1SQNysJUmMA4ldtuIN0Gd
	JtDNwcgrRjeoO5SP9qF6UfUpj1H6hp2IbYGfnEzZ33IW++QAR4vMoOmye4oue/IBoDrx+cE17c6R/
	IdMb0PXewdkLex4aMoIs2t56E6mPkMDPnlyQ1igvjSfdus+ApuCp+uoohK3lW3BOneHzBfht4x3sp
	U7k7HduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9I4-00000003kbu-0JUW;
	Mon, 15 Dec 2025 14:11:08 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9Hy-00000003kaM-2b6c;
	Mon, 15 Dec 2025 14:11:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765807831; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EWBb5+vZkQvT57mH3YfWYiIYc0rRIT1RBdfiCHFkWJQjnl3HPFO/2N64vZPSEIsu+D6zkyMr2277UFGTftRJmmYwHaBWatJX7ZuM1y9RSQjLazKhL48YEwsAvpKobOUkAMLT1pB6GXEW/oPxN0LucUBCYYp3F+SAwYQsVxqZPwo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765807831; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BgEZADjjBlqDB4JCYXAp+UjxRKt+xRWWF/jQ8tJdXSw=; 
	b=gQqNt6Hl6M5Pzkl6m4sGbf/4IxO90If0joXiFqp5CqALYASXQ0HVZuXLhgCXWUzQsP0pItp4eP6ncG1HDCmxdrGrTtkmvOPXqg5YauAXOgdtxUgt7LKFOCK+S0okOj/ERG8mceXdLiHkH1qTxw++8+mtvwBUzQ42+3fb1JMafOg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765807831;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=BgEZADjjBlqDB4JCYXAp+UjxRKt+xRWWF/jQ8tJdXSw=;
	b=eze5GKjG7Xq+CEXazt6Ix5KgfSonShjggk/CsqSmwEyJc96RF/2waCo3gHmA6Xez
	xWTKoch42cThvCBv8+BJZo1nfA8uTfm6gJud+VwXL553LX3ZvjzecrFd6YnCZxMrpUx
	mAxNVSiR05rlFv9cd1dK4HmanGNdgo4wW5I1XDdw=
Received: by mx.zohomail.com with SMTPS id 176580782694767.8370869926157;
	Mon, 15 Dec 2025 06:10:26 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 15 Dec 2025 15:09:18 +0100
Subject: [PATCH v5 2/8] drm/rockchip: vop2: Switch impossible pos
 conditional to WARN_ON
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-vop2-atomic-fixups-v5-2-83463c075a8d@collabora.com>
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
X-CRM114-CacheID: sfid-20251215_061102_871939_592A410E 
X-CRM114-Status: GOOD (  11.22  )
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

We already clip the plane to the display bounds in atomic_check, and
ensure that it is sufficiently sized. Instead of trying to catch this
and adjust for it in atomic_update, just assert that atomic_check has
done its job.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 20b49209ddcd..1cad5a8ece61 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1214,28 +1214,16 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	src_w = drm_rect_width(src) >> 16;
 	src_h = drm_rect_height(src) >> 16;
 	dsp_w = drm_rect_width(dest);
-
-	if (dest->x1 + dsp_w > adjusted_mode->hdisplay) {
-		drm_dbg_kms(vop2->drm,
-			    "vp%d %s dest->x1[%d] + dsp_w[%d] exceed mode hdisplay[%d]\n",
-			    vp->id, win->data->name, dest->x1, dsp_w, adjusted_mode->hdisplay);
-		dsp_w = adjusted_mode->hdisplay - dest->x1;
-		if (dsp_w < 4)
-			dsp_w = 4;
-		src_w = dsp_w * src_w / drm_rect_width(dest);
-	}
-
 	dsp_h = drm_rect_height(dest);
 
-	if (dest->y1 + dsp_h > adjusted_mode->vdisplay) {
-		drm_dbg_kms(vop2->drm,
-			    "vp%d %s dest->y1[%d] + dsp_h[%d] exceed mode vdisplay[%d]\n",
-			    vp->id, win->data->name, dest->y1, dsp_h, adjusted_mode->vdisplay);
-		dsp_h = adjusted_mode->vdisplay - dest->y1;
-		if (dsp_h < 4)
-			dsp_h = 4;
-		src_h = dsp_h * src_h / drm_rect_height(dest);
-	}
+	/* drm_atomic_helper_check_plane_state calls drm_rect_clip_scaled for
+	 * us, which keeps our planes bounded within the CRTC active area
+	 */
+	if (WARN_ON(dest->x1 + dsp_w > adjusted_mode->hdisplay) ||
+	    WARN_ON(dest->y1 + dsp_h > adjusted_mode->vdisplay) ||
+	    WARN_ON(dsp_w < 4) || WARN_ON(dsp_h < 4) ||
+	    WARN_ON(src_w < 4) || WARN_ON(src_h < 4))
+		return;
 
 	/*
 	 * This is workaround solution for IC design:

-- 
2.52.0


