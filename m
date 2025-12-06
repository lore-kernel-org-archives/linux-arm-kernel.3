Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC1BD3B7E1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 20:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENE3v57EU2IVCcCEZVGBw5ReXzA8phnW9WgvWoxQgCM=; b=s/Y/HeXT+0mhLDEAdXUlmFkJNS
	x0aK6yF8QovSlB6ZecdzXzKvKvNxBzMB6rlYSeRQVOiIlpT2wFi7b5/cGlaUbe8eFNIVMpl3MZa5O
	97u3AW4WxKqO/1bj5q201rXKr6sk2dINl1/3+eLLETuThnGVAg7XvcD19HvsVWEn+SktyikIHDg1v
	19GEzZMOgHoe8Umqo5REzKfn57ynW3TUyOKhuvzjZCh2gPcNDtVPpwVwECnvSPS5RMrW2ieG9/h4x
	d5cyepkFvTWfhvYZw98RY7amdrvWP2aLDPVHiZfzJUW5eTZEVKyQTX9p6nx1wjhxyW5dIhVeAqypG
	fxzPgAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAU-0000000BDHk-00pC;
	Sat, 06 Dec 2025 20:46:14 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAQ-0000000BDD6-26j2;
	Sat, 06 Dec 2025 20:46:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765053960; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k3yrkZtaXRbcXbcZvyexEEorflSIzmNAN081YqA6nGlsBbjKAM4Mdc8bghTDNd1aOia1kD5zS/T3w8xGpWJjTPGCIjCZLq7ilALxY/CJp8fpIu1Xw1ymVB7/9qIQ1kMp0OS8TpQpFxFRPAMV/SfZSCCw2fDRo39RtXAPUJvs5Og=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765053960; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ENE3v57EU2IVCcCEZVGBw5ReXzA8phnW9WgvWoxQgCM=; 
	b=IRJG3gSglEa7Sw4LbMczphsNR+2e5jPIZdKchcrfTLMUa1P0eVwVEYCmTjYy1woWGdbmZ2fpN0PB8m+WYHVzqQe7Zc1/CnfHjTZtsqYMOc2Q7OGI8e2UCk06ciwN7pexRsOZBipzjR+wBaaLvZMkQ2tOiREs89ugzBHl1S/F0+g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765053960;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ENE3v57EU2IVCcCEZVGBw5ReXzA8phnW9WgvWoxQgCM=;
	b=Efv5fWXroodZA3SlIlNSFxJHtu/pz5HSWz6fbzfKfZjdIGI7vDvTVzE4ynmbHRtk
	VZXHBviFAP+QEQ7f8D4ac77vHy6V9DlZGqdZtU3TCv8CHMe2dUF3NgmmFU+fD/Z9sre
	RTRnTJCtfGYgd5iQhe9dk7c8bZM9VIh710opuVwQ=
Received: by mx.zohomail.com with SMTPS id 1765053958679133.395463320163;
	Sat, 6 Dec 2025 12:45:58 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 06 Dec 2025 21:45:16 +0100
Subject: [PATCH v2 6/8] drm/rockchip: vop2: Enforce AFBC transform stride
 align in plane_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-vop2-atomic-fixups-v2-6-7fb45bbfbebd@collabora.com>
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
X-CRM114-CacheID: sfid-20251206_124610_635373_AC9A36CF 
X-CRM114-Status: UNSURE (   9.60  )
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

From: Daniel Stone <daniels@collabora.com>

Make sure we can't break the hardware by requesting an unsupported
configuration.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index e23213337104..2a308cc31632 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1083,6 +1083,15 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if (drm_is_afbc(fb->modifier) &&
+	    pstate->rotation &
+		(DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270) &&
+	    (fb->pitches[0] << 3) / vop2_get_bpp(fb->format) % 64) {
+		drm_dbg_kms(vop2->drm,
+			    "AFBC buffers must be 64-byte aligned for horizontal rotation or mirroring\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -1290,9 +1299,6 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		 * with WIN_VIR_STRIDE.
 		 */
 		stride = (fb->pitches[0] << 3) / bpp;
-		if ((stride & 0x3f) && (xmirror || rotate_90 || rotate_270))
-			drm_dbg_kms(vop2->drm, "vp%d %s stride[%d] not 64 pixel aligned\n",
-				    vp->id, win->data->name, stride);
 
 		 /* It's for head stride, each head size is 16 byte */
 		stride = ALIGN(stride, block_w) / block_w * 16;

-- 
2.52.0


