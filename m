Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9F0E95A95
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZieGAy9rgr+YccMAUWPYA85IalHwZSSn+OozDu66VM=; b=4knLLfJj5m18KU+RvoGQ8KnXZC
	ZJ0Z74M5TvTTy5H58XTewfeIq2EQvSmNIOp0/0C5GFTHH5pe4IW5vFdO7846cwVaAVJD9QDFx9veQ
	X4GNSeK71IrovQYnsW429WyJACJWvkl7CD3iygnyehARz24l0/iGGJQ+jw2sjZY2HrkEh/MwoghWD
	fWj9/awCl2ks4HSyPqRVUQ2IUAVUsF4XS9fnB9VZR0r21qQmXpWZkVvNtsptKFMKgDJDTwWnj2FoK
	NWqkH6kUwWzK1kUINlV5GRn4EBQTN40dJyIIpiTCY7yFSs3vBX+w8YSZTqkO0pT0BGkbRSIlvH00s
	Q2BUZDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaKH-00000004tfk-2eph;
	Tue, 30 Dec 2025 14:03:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaKE-00000004tcO-3BVW;
	Tue, 30 Dec 2025 14:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767103427;
	bh=niec/Lk0+W0q+vswWH4K+LQLh/B8K5auYvmJIMiA2Qo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=If0SQNrIOjiaD0iHAz0A0Ia9cL3spRbHO4hD6+q9pPMSFzSpjAApqjY2ix1vqqHsD
	 dwR+kxQB+CpdEVdfhFUBtzFvYEj15nF28ZsbO7esU9XBf5GL9tkJnvUvmSI5JsZl+X
	 KtzDQ7JJc1W1k511P/stpKvERME0fuBl1UKzobuQ+ehIZ7NPyZ6PsAEmrCqRT4tpsg
	 +sKcLELdN8B7BWWviW/xglYvrUIxvWueei0XwAKuiQgJHVMhX8Jr/9TyuLThII++cS
	 t5dcaM+8cfYMAmUHn2zabRaxYLxJUhq+qCkbeR1OwjbXXa+In0qDjtDmdba2Dw4Sn1
	 ExXDjftY30wFQ==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:a1ec:e46f:3b67:baf0:3d70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8867F17E0ED3;
	Tue, 30 Dec 2025 15:03:42 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 30 Dec 2025 11:03:03 -0300
Subject: [PATCH RFC 3/6] drm/mediatek: ovl: Fix misaligned layer source
 size on AFBC mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-mtk-afbc-fixes-v1-3-6c0247b66e32@collabora.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Justin Green <greenjustin@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, ariel.dalessandro@collabora.com, 
 daniels@collabora.com, kernel@collabora.com, Nancy.Lin@mediatek.com, 
 Jason-JH.Lin@mediatek.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_060350_987134_6B7063A7 
X-CRM114-Status: GOOD (  18.06  )
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

From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

In AFBC mode, OVL_SRC_SIZE must be block aligned. Due to this limitation
of the AFBC format, OVL_CLIP needs to be used to achieve the desired
output size of the layer while still meeting the alignment constraints.
Failure to do this will result in vblank timeouts and no rendered output
when the AFBC data source isn't aligned to the AFBC block (32x8).

Configure OVL_CLIP so unaligned AFBC layers can be displayed.

The following illustrates how the alignment is achieved through the clip
settings for the horizontal coordinates, the vertical coordinates are
analogous:

/------------------------------------------------\
|                                                |
|            ........................            |
|            ........................            |
|            ........................            |
|            ........................            |
|                                                |
\------------------------------------------------/
     |       |                      |       |
     |       src.x1                 src.x2  |
     |       |                      |       |
     |       |<-------------------->|       |
     |              src_width               |
     |                                      |
     N * AFBC_DATA_BLOCK_WIDTH              M * AFBC_DATA_BLOCK_WIDTH
     |                                      |
     |<----->|                      |<----->|
      clip_left                      clip_right

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Co-developed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 35 ++++++++++++++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_plane.c    | 21 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_plane.h    |  4 ++++
 3 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 8e20b45411fc..c6a00c2256dd 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -39,6 +39,11 @@
 #define OVL_PITCH_MSB_2ND_SUBBUF			BIT(16)
 #define DISP_REG_OVL_PITCH(n)			(0x0044 + 0x20 * (n))
 #define OVL_CONST_BLEND					BIT(28)
+#define DISP_REG_OVL_CLIP(n)			(0x004C + 0x20 * (n))
+#define OVL_CLIP_LEFT					GENMASK(7, 0)
+#define OVL_CLIP_RIGHT					GENMASK(15, 8)
+#define OVL_CLIP_TOP					GENMASK(23, 16)
+#define OVL_CLIP_BOTTOM					GENMASK(31, 24)
 #define DISP_REG_OVL_RDMA_CTRL(n)		(0x00c0 + 0x20 * (n))
 #define DISP_REG_OVL_RDMA_GMC(n)		(0x00c8 + 0x20 * (n))
 #define DISP_REG_OVL_ADDR_MT2701		0x0040
@@ -499,13 +504,14 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	struct mtk_plane_pending_state *pending = &state->pending;
 	unsigned int addr = pending->addr;
 	unsigned int pitch_lsb = pending->pitch & GENMASK(15, 0);
+	unsigned long long modifier = pending->modifier;
 	unsigned int fmt = pending->format;
 	unsigned int rotation = pending->rotation;
 	unsigned int offset = (pending->y << 16) | pending->x;
-	unsigned int src_size = (pending->height << 16) | pending->width;
 	unsigned int blend_mode = state->base.pixel_blend_mode;
 	unsigned int ignore_pixel_alpha = 0;
-	unsigned int con;
+	unsigned int src_size, con, src_width, src_height;
+	unsigned int clip = 0;
 
 	if (!pending->enable) {
 		mtk_ovl_layer_off(dev, idx, cmdq_pkt);
@@ -550,9 +556,26 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		addr += pending->pitch - 1;
 	}
 
-	if (ovl->data->supports_afbc)
-		mtk_ovl_set_afbc(ovl, cmdq_pkt, idx,
-				 pending->modifier != DRM_FORMAT_MOD_LINEAR);
+	if (ovl->data->supports_afbc && (modifier != DRM_FORMAT_MOD_LINEAR)) {
+		/*
+		 * In AFBC mode, OVL_SRC_SIZE must be block aligned. Due to this
+		 * limitation of the AFBC format, OVL_CLIP is used to adjust the
+		 * output size of the layer.
+		 */
+		clip = FIELD_PREP(OVL_CLIP_BOTTOM, pending->clip_bottom) |
+		       FIELD_PREP(OVL_CLIP_TOP, pending->clip_top) |
+		       FIELD_PREP(OVL_CLIP_RIGHT, pending->clip_right) |
+		       FIELD_PREP(OVL_CLIP_LEFT, pending->clip_left);
+		src_height = pending->height + pending->clip_top + pending->clip_bottom;
+		src_width = pending->width + pending->clip_left + pending->clip_right;
+		mtk_ovl_set_afbc(ovl, cmdq_pkt, idx, true);
+	} else {
+		src_height = pending->height;
+		src_width = pending->width;
+		mtk_ovl_set_afbc(ovl, cmdq_pkt, idx, false);
+	}
+
+	src_size = (src_height << 16) | src_width;
 
 	mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_CON(idx));
@@ -560,6 +583,8 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 			      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH(idx));
 	mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_SRC_SIZE(idx));
+	mtk_ddp_write_relaxed(cmdq_pkt, clip, &ovl->cmdq_reg, ovl->regs,
+			      DISP_REG_OVL_CLIP(idx));
 	mtk_ddp_write_relaxed(cmdq_pkt, offset, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_OFFSET(idx));
 	mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 1214f623859e..8fb08768e8ce 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -114,6 +114,7 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 				       struct mtk_plane_state *mtk_plane_state)
 {
 	struct drm_framebuffer *fb = new_state->fb;
+	unsigned int clip_left = 0, clip_top = 0, clip_right = 0, clip_bottom = 0;
 	struct drm_gem_object *gem;
 	struct mtk_gem_obj *mtk_gem;
 	unsigned int pitch, format;
@@ -148,6 +149,22 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 		int x_offset_in_blocks = (new_state->src.x1 >> 16) / AFBC_DATA_BLOCK_WIDTH;
 		int y_offset_in_blocks = (new_state->src.y1 >> 16) / AFBC_DATA_BLOCK_HEIGHT;
 		int hdr_size, hdr_offset;
+		int src_width = drm_rect_width(&new_state->src) >> 16;
+		int src_height = drm_rect_height(&new_state->src) >> 16;
+		unsigned int remainder_right, remainder_bottom;
+
+		/*
+		 * In AFBC mode, the source size configured needs to be a
+		 * multiple of the AFBC data block size. Compute and save the
+		 * necessary clips so the indeded x, y, width and height are
+		 * obtained in the output despite this constraint.
+		 */
+		clip_left = (new_state->src.x1 >> 16) % AFBC_DATA_BLOCK_WIDTH;
+		clip_top = (new_state->src.y1 >> 16) % AFBC_DATA_BLOCK_HEIGHT;
+		remainder_right = (src_width + clip_left) % AFBC_DATA_BLOCK_WIDTH;
+		clip_right = remainder_right ? AFBC_DATA_BLOCK_WIDTH - remainder_right : 0;
+		remainder_bottom = (src_height + clip_top) % AFBC_DATA_BLOCK_HEIGHT;
+		clip_bottom = remainder_bottom ? AFBC_DATA_BLOCK_HEIGHT - remainder_bottom : 0;
 
 		hdr_pitch = width_in_blocks * AFBC_HEADER_BLOCK_SIZE;
 		pitch = width_in_blocks * AFBC_DATA_BLOCK_WIDTH *
@@ -187,6 +204,10 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	mtk_plane_state->pending.y = new_state->dst.y1;
 	mtk_plane_state->pending.width = drm_rect_width(&new_state->dst);
 	mtk_plane_state->pending.height = drm_rect_height(&new_state->dst);
+	mtk_plane_state->pending.clip_left = clip_left;
+	mtk_plane_state->pending.clip_top = clip_top;
+	mtk_plane_state->pending.clip_right = clip_right;
+	mtk_plane_state->pending.clip_bottom = clip_bottom;
 	mtk_plane_state->pending.rotation = new_state->rotation;
 	mtk_plane_state->pending.color_encoding = new_state->color_encoding;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.h b/drivers/gpu/drm/mediatek/mtk_plane.h
index 46be4454bc92..a9cfb2ee5859 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_plane.h
@@ -28,6 +28,10 @@ struct mtk_plane_pending_state {
 	unsigned int			y;
 	unsigned int			width;
 	unsigned int			height;
+	unsigned int			clip_left;
+	unsigned int			clip_top;
+	unsigned int			clip_right;
+	unsigned int			clip_bottom;
 	unsigned int			rotation;
 	bool				dirty;
 	bool				async_dirty;

-- 
2.51.0


