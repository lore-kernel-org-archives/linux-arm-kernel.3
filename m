Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F398C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBIBilYDxeWRgNlHC/vhx3XpCGxCxrSjnVrypHsJqyM=; b=Q52PRVa4qUc2AhMEwJGBdPWPfx
	N4Ux18/CQDCUWDEFjZlVfXyEnpRXPq68DApYtQjyekoPYNxlz6+d4GkVx+NYIsa5AZLu9zE7Px5aP
	DsKqJWEYBd1rynv0r4MEtCYSZf9V0pWly/MuAWDJfLwwwmfnrz/ymcDyMqaSK6Wx6ySfxM35gEAI2
	s5IxdzirBPCCE+2NqF+EKs/+dU5i0mDtFvB4wNS2KugzUSN1Tz09ZBHJdOSz/cGSwvxn9PfCbBqQB
	ZZFvF59uwsuEkACadSqBnlmaKH9R8WoftbxSAeHK5oOSU51SsR9mx8ga0OlEEUbgEEP18efzNfFgL
	Prz1o/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBlS-00000007dd4-3rec;
	Tue, 21 Jan 2025 10:45:46 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBZl-00000007b58-1ufy;
	Tue, 21 Jan 2025 10:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=RBIBi
	lYDxeWRgNlHC/vhx3XpCGxCxrSjnVrypHsJqyM=; b=efqvMAW3hrLx52xnU+2OE
	6CTxz8yo5r7MS/mahEdUYi3ZEPsLOoHA9YKNgeqKIvgiC1UUjOj1uOLMO1rh66g4
	3bKQia1HJkdJ41ui4P8ykrU3w7CPUfffDNLtuMpj0wVVKXSY9SGxkx1MwOmoo+Y4
	S193gQq9By0F9RuO13oVEM=
Received: from ProDesk.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDHkqjYd49nreMjBg--.21590S7;
	Tue, 21 Jan 2025 18:33:04 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	daniel@fooishbar.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>,
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v12 05/13] drm/rockchip: vop2: Support for different layer select configuration between VPs
Date: Tue, 21 Jan 2025 18:32:42 +0800
Message-ID: <20250121103254.2528004-6-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121103254.2528004-1-andyshrk@163.com>
References: <20250121103254.2528004-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgDHkqjYd49nreMjBg--.21590S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxtrW8JF4UZF47CF4UWFy8Zrb_yoWfJw4Upa
	yUursIg3W5Cr45tryUJayrZr4rGwn8tay3uan3Kw1xGFn5KrWDJF4ktF95A3Z8KF93ZryU
	Xw1YgryDZrW7tFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jsOzsUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h-bXmePdPc5TgACsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_023341_907191_E87349A8 
X-CRM114-Status: GOOD (  14.93  )
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

In the upcoming VOP for rk3576, every VP has it's own LAYER_SEL
register, and the configuration value of each VP for the same
window maybe different, so extend the layer_sel_id to array,
let it can descption the layer select configuration value for
different VP.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>

---

(no changes since v4)

Changes in v4:
- Typo fix: selet->select

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 +--
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 38 ++++++++++----------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 7cdef4c98bf6..37cdf0ed9455 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -166,9 +166,9 @@ struct vop2_win_data {
 	const unsigned int supported_rotations;
 
 	/**
-	 * @layer_sel_id: defined by register OVERLAY_LAYER_SEL of VOP2
+	 * @layer_sel_id: defined by register OVERLAY_LAYER_SEL or PORTn_LAYER_SEL
 	 */
-	unsigned int layer_sel_id;
+	unsigned int layer_sel_id[ROCKCHIP_MAX_CRTC];
 	uint64_t feature;
 
 	uint8_t axi_bus_id;
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 9e42251ee796..8160f76de995 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -350,7 +350,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.formats = formats_smart,
 		.nformats = ARRAY_SIZE(formats_smart),
 		.format_modifiers = format_modifiers,
-		.layer_sel_id = 3,
+		/* 0xf means this layer can't attached to this VP */
+		.layer_sel_id = { 3, 3, 3, 0xf },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
 		.max_upscale_factor = 8,
@@ -363,7 +364,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.nformats = ARRAY_SIZE(formats_smart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1e00,
-		.layer_sel_id = 7,
+		.layer_sel_id = { 7, 7, 7, 0xf },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
 		.max_upscale_factor = 8,
@@ -376,7 +377,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.nformats = ARRAY_SIZE(formats_rk356x_esmart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1a00,
-		.layer_sel_id = 6,
+		.layer_sel_id = { 6, 6, 6, 0xf },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
 		.max_upscale_factor = 8,
@@ -389,7 +390,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.nformats = ARRAY_SIZE(formats_rk356x_esmart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1800,
-		.layer_sel_id = 2,
+		.layer_sel_id = { 2, 2, 2, 0xf },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
 		.max_upscale_factor = 8,
@@ -402,7 +403,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
-		.layer_sel_id = 0,
+		.layer_sel_id = { 0, 0, 0, 0xf },
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 					DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.max_upscale_factor = 4,
@@ -417,7 +418,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
-		.layer_sel_id = 1,
+		.layer_sel_id = { 1, 1, 1, 0xf },
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 					DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
@@ -582,7 +583,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
-		.layer_sel_id = 0,
+		.layer_sel_id = { 0, 0, 0, 0 },
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.axi_bus_id = 0,
@@ -600,7 +601,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
-		.layer_sel_id = 1,
+		.layer_sel_id = { 1, 1, 1, 1 },
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
@@ -618,7 +619,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
-		.layer_sel_id = 4,
+		.layer_sel_id = { 4, 4, 4, 4 },
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
@@ -636,7 +637,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
-		.layer_sel_id = 5,
+		.layer_sel_id =  { 5, 5, 5, 5 },
 		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
 				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_PRIMARY,
@@ -654,7 +655,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.nformats = ARRAY_SIZE(formats_esmart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1800,
-		.layer_sel_id = 2,
+		.layer_sel_id = { 2, 2, 2, 2 },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
 		.axi_bus_id = 0,
@@ -670,7 +671,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.nformats = ARRAY_SIZE(formats_esmart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1a00,
-		.layer_sel_id = 3,
+		.layer_sel_id = { 3, 3, 3, 3 },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
 		.axi_bus_id = 0,
@@ -686,7 +687,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.formats = formats_esmart,
 		.nformats = ARRAY_SIZE(formats_esmart),
 		.format_modifiers = format_modifiers,
-		.layer_sel_id = 6,
+		.layer_sel_id =  { 6, 6, 6, 6 },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
 		.axi_bus_id = 1,
@@ -702,7 +703,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.nformats = ARRAY_SIZE(formats_esmart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1e00,
-		.layer_sel_id = 7,
+		.layer_sel_id =  { 7, 7, 7, 7 },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
 		.axi_bus_id = 1,
@@ -1454,7 +1455,7 @@ static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
 		 */
 		for (old_layer_id = 0; old_layer_id < vop2->data->win_size; old_layer_id++) {
 			layer_sel_id = (layer_sel >> (4 * old_layer_id)) & 0xf;
-			if (layer_sel_id == win->data->layer_sel_id)
+			if (layer_sel_id == win->data->layer_sel_id[vp->id])
 				break;
 		}
 
@@ -1464,7 +1465,7 @@ static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
 		for (i = 0; i < vop2->data->win_size; i++) {
 			old_win = &vop2->win[i];
 			layer_sel_id = (layer_sel >> (4 * layer_id)) & 0xf;
-			if (layer_sel_id == old_win->data->layer_sel_id)
+			if (layer_sel_id == old_win->data->layer_sel_id[vp->id])
 				break;
 		}
 
@@ -1512,13 +1513,14 @@ static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
 		}
 
 		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(layer_id, 0x7);
-		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(layer_id, win->data->layer_sel_id);
+		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(layer_id, win->data->layer_sel_id[vp->id]);
 		/*
 		 * When we bind a window from layerM to layerN, we also need to move the old
 		 * window on layerN to layerM to avoid one window selected by two or more layers.
 		 */
 		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(old_layer_id, 0x7);
-		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(old_layer_id, old_win->data->layer_sel_id);
+		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(old_layer_id,
+			     old_win->data->layer_sel_id[vp->id]);
 	}
 
 	vop2_writel(vop2, RK3568_OVL_LAYER_SEL, layer_sel);
-- 
2.34.1


