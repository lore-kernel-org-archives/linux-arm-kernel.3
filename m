Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95074D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 07:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ReNNa/bjIUuQfNRlBiXhYY/+3u8nvvMSOrGOZBdjHB0=; b=vA3LQSMcH1xNKbbmU7DEN2pG3u
	Drhvja2CUDkUHY0LOIlzXE5+v3RVAgr4quRB8k+wFyEsqd3XvJjpHG2KNKJQRe/B1DGVQDl74TGqA
	PzBeo0Xm+Gm75WZGjLYCgsfb/r5/bxkOWC17WvSxnpWu2hOlKwWXB9a3V+m1/iBZv+dWyTA63p9bA
	fySpQW8Ea8PSfA4oQyZpPBC/HiEVk9MJDsB/zFE9Fd4cLMcNaFv8SzA6ir9+Ym9FQ0547z/lDa93n
	ESjmUkDXLYKMmnQ9dTQ/9X+agDbRUjAcPCeauWHIcCXmhtst4i/ZpGq0Ym2Djj0QicCzspltyNCVA
	VZNV0uOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KPV-00000009vjO-0A4K;
	Mon, 28 Oct 2024 07:43:33 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KNt-00000009vMU-1Tqs;
	Mon, 28 Oct 2024 07:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=ReNNa
	/bjIUuQfNRlBiXhYY/+3u8nvvMSOrGOZBdjHB0=; b=O3ZDwoOajOf3TPWHJlXlb
	DnNxqlYO2fv0gRHOTg8W7dd/MUwDJwX1SFnWeH23dqRvT4GFRdXh3VWdWKT9UcgB
	99EIr0BQe71NtFKty3glh2L9IFl5Pbo2YJxok4mrk0+ne3vmNOI9I799m1h3T0nC
	jaaC+8sE4A5ZcXYto9eRP0=
Received: from ProDesk.. (unknown [58.22.7.114])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnr6c1QB9nigGjDg--.909S2;
	Mon, 28 Oct 2024 15:41:44 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: vop2: Don't spam logs in atomic update
Date: Mon, 28 Oct 2024 15:41:34 +0800
Message-ID: <20241028074140.382199-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnr6c1QB9nigGjDg--.909S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw13Gr1xCw4kAr4rZFyUGFg_yoW5WFW8pF
	y7CF909r4Utr4qga47JrZxZr43K392ka4xtF4xW3W7K343trn7JrsxGF4xJrWYvF48u34U
	AFn8J34Y9a4xZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-SdgUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gyGXmcfN0LRQQAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_004153_718157_82C5A30C 
X-CRM114-Status: UNSURE (   9.28  )
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

From: Andy Yan <andy.yan@rock-chips.com>

Demote the error message to drm_dbg_kms to only print the message
if the respective debug messages are enabled.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 5c5459ee03076..e75b027674869 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1373,8 +1373,9 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	dsp_w = drm_rect_width(dest);
 
 	if (dest->x1 + dsp_w > adjusted_mode->hdisplay) {
-		drm_err(vop2->drm, "vp%d %s dest->x1[%d] + dsp_w[%d] exceed mode hdisplay[%d]\n",
-			vp->id, win->data->name, dest->x1, dsp_w, adjusted_mode->hdisplay);
+		drm_dbg_kms(vop2->drm,
+			    "vp%d %s dest->x1[%d] + dsp_w[%d] exceed mode hdisplay[%d]\n",
+			    vp->id, win->data->name, dest->x1, dsp_w, adjusted_mode->hdisplay);
 		dsp_w = adjusted_mode->hdisplay - dest->x1;
 		if (dsp_w < 4)
 			dsp_w = 4;
@@ -1384,8 +1385,9 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	dsp_h = drm_rect_height(dest);
 
 	if (dest->y1 + dsp_h > adjusted_mode->vdisplay) {
-		drm_err(vop2->drm, "vp%d %s dest->y1[%d] + dsp_h[%d] exceed mode vdisplay[%d]\n",
-			vp->id, win->data->name, dest->y1, dsp_h, adjusted_mode->vdisplay);
+		drm_dbg_kms(vop2->drm,
+			    "vp%d %s dest->y1[%d] + dsp_h[%d] exceed mode vdisplay[%d]\n",
+			    vp->id, win->data->name, dest->y1, dsp_h, adjusted_mode->vdisplay);
 		dsp_h = adjusted_mode->vdisplay - dest->y1;
 		if (dsp_h < 4)
 			dsp_h = 4;
@@ -1398,14 +1400,14 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	 */
 	if (!(win->data->feature & WIN_FEATURE_AFBDC)) {
 		if (actual_w > dsp_w && (actual_w & 0xf) == 1) {
-			drm_err(vop2->drm, "vp%d %s act_w[%d] MODE 16 == 1\n",
+			drm_dbg_kms(vop2->drm, "vp%d %s act_w[%d] MODE 16 == 1\n",
 				vp->id, win->data->name, actual_w);
 			actual_w -= 1;
 		}
 	}
 
 	if (afbc_en && actual_w % 4) {
-		drm_err(vop2->drm, "vp%d %s actual_w[%d] not 4 pixel aligned\n",
+		drm_dbg_kms(vop2->drm, "vp%d %s actual_w[%d] not 4 pixel aligned\n",
 			vp->id, win->data->name, actual_w);
 		actual_w = ALIGN_DOWN(actual_w, 4);
 	}
@@ -1443,7 +1445,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		 */
 		stride = (fb->pitches[0] << 3) / bpp;
 		if ((stride & 0x3f) && (xmirror || rotate_90 || rotate_270))
-			drm_err(vop2->drm, "vp%d %s stride[%d] not 64 pixel aligned\n",
+			drm_dbg_kms(vop2->drm, "vp%d %s stride[%d] not 64 pixel aligned\n",
 				vp->id, win->data->name, stride);
 
 		uv_swap = vop2_afbc_uv_swap(fb->format->format);
-- 
2.34.1


