Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32ABD3B7E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 20:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yix2VtVAthNOkhvZWCl2bJyUJbLX6oYb/22YOA7QIzE=; b=0czwfgPV/SkUrRkV97IC3bE0/3
	35l788ktYYYBF4fU9OHdnQN+gL3gB+RQboDShJsduz1LE9H1Hpk4YOoiKSsoXJ1rUynn+iEHxGb2u
	yETjLQBDbpobmfwrJP9hMFfuj/77Seoe3Z1L/6goiBG/JwDYC23YuqYKIFwuoRaSJk7tcdbstJy/W
	bZIAon6Kwxb+ueKR8kqwp8SqpBl/uy/de/R49CQg2RrE4HBTubsM6+Zy/zUcN5Az3L2R5yQG3UQe9
	3KRYiV6juGj/EmZgeeaJRHq7UMHoxp5+I8RdvQTwPcH+3J6H6FtkmJJWLT91oTQvxQHMoBrMg/Fm5
	iNyLlj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAT-0000000BDGd-1hB3;
	Sat, 06 Dec 2025 20:46:13 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAP-0000000BDCO-2HnX;
	Sat, 06 Dec 2025 20:46:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765053950; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SkL4KxKm+YI7wvX3aiDPUHWHM+8knSDvWuRjCA8UTMK9wvJSjSHGui5g9qZ2V+371rO7j8rbmQyYzttTiDpZUg9zAycSFj1LQ9LZTvPVOaY+rWeLeZ4L9Rlu4qcevVf4V9fggtXlpiE7rKac11N1svGTzn+4NoJQ05FhDos/EnU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765053950; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Yix2VtVAthNOkhvZWCl2bJyUJbLX6oYb/22YOA7QIzE=; 
	b=fp60g4Urhrql8vq7ZX7p726eIv57UCX11/qkm0O2cRfFrnFWVCn8/YilWgtVj1SJWD2jZCl+H3qokhGtwFzKGoodafxSDzfFjZFpHOkadOy8xzSmXEL2Db/YU82vCoWxy1ZE4P973IvKTN38WabAyONrhm8HegnEUZQjlINdwg8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765053950;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Yix2VtVAthNOkhvZWCl2bJyUJbLX6oYb/22YOA7QIzE=;
	b=Bp916Y2LODD2d1wnzNSKfaRFVyuzMTdNir66+wSirTi3v+1Pe+AUFfTp1juo6xkG
	Ij/7TKr0HR2xx6VIqrZlPx/Wpr79Q5Pw4SlFhs1BG8WQC8/kzgZqsr8IldWbtWk9FW8
	8QFYkwh/Zwu30hzf2fFi9tUtD8JExifYo/9BvJko=
Received: by mx.zohomail.com with SMTPS id 1765053948520766.6119631195057;
	Sat, 6 Dec 2025 12:45:48 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 06 Dec 2025 21:45:13 +0100
Subject: [PATCH v2 3/8] drm/rockchip: vop2: Fix Esmart test condition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-vop2-atomic-fixups-v2-3-7fb45bbfbebd@collabora.com>
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
X-CRM114-CacheID: sfid-20251206_124609_671917_9571B7FE 
X-CRM114-Status: UNSURE (   9.97  )
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

If we want to find out if a window is Esmart or not, test for not being
a cluster window, rather than AFBDC presence.

No functional effect as only cluster windows support AFBC decode.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 81b3eba07095..9d715d7659af 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1230,12 +1230,10 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	 * This is workaround solution for IC design:
 	 * esmart can't support scale down when src_w % 16 == 1.
 	 */
-	if (!(win->data->feature & WIN_FEATURE_AFBDC)) {
-		if (src_w > dsp_w && (src_w & 0xf) == 1) {
-			drm_dbg_kms(vop2->drm, "vp%d %s act_w[%d] MODE 16 == 1\n",
-				    vp->id, win->data->name, src_w);
-			src_w -= 1;
-		}
+	if (!vop2_cluster_window(win) && src_w > dsp_w && (src_w & 1)) {
+		drm_dbg_kms(vop2->drm, "vp%d %s act_w[%d] MODE 16 == 1\n",
+			    vp->id, win->data->name, src_w);
+		src_w -= 1;
 	}
 
 	if (afbc_en && src_w % 4) {

-- 
2.52.0


