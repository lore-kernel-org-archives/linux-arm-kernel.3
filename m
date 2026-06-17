Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70446CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OePkATTgFfdiavKlzrrIFI0972DzwQxlO0AHh6bZkDk=; b=4uT/eTvaD406F3jc/xAdxWsSSj
	NnjI0fgKYzh/MWlenlu4KfMi/Pgme5BX+5S04tFbtXiKgUNWYf5EJV3DYT64n+f+vC8BRmSiElNFa
	X09VnF7RtiGISjTFPSGZQZYygwpGCuCKIXHpneES1sOal9CirfuxqBWbMd93uXLyvOQqdWf5lXzea
	YwE8CGSs4sQr1Yr+Yjvnb+pdNAzAp6g1ahlLzRNtRAYljs3StwFkL6Uau4av8cY1eti9BVdZEZwDT
	jLhuuKmfRO6ryK5hUmNot1zni5r3cepSqlfKThpKLXNrALPxfWqyXEaUZ5/OsqUOcXY3SSd2Umk96
	nGZ5ZzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnJW-0000000H2Dy-3GzC;
	Wed, 17 Jun 2026 10:16:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnJV-0000000H2Dj-2FnO;
	Wed, 17 Jun 2026 10:16:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 028EF60128;
	Wed, 17 Jun 2026 10:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCD01F00A3A;
	Wed, 17 Jun 2026 10:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781691364;
	bh=OePkATTgFfdiavKlzrrIFI0972DzwQxlO0AHh6bZkDk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nujJAwAEG47Wa7/1vWZKhyqKhP+wKE6wRovSL6crs2RpfRKXwzpUjjPXWXypCKZC2
	 CLb8ELRmBuiA/h8WUvbNeTnJZ6MsN36KaHpQ4aa8CYkWhxTBb2mCnkKEz/IEsVMDd0
	 /x5ZC9SiCtFqy8kWoCr1c+97DIuNeAP/8RBccOLyzaaHjoOdN3VJKvvjQ7nbOIdOfw
	 t2vDFsrXQ5skleoa+ttEg8ONzqpO0nk4O5YFdTIciUaqkP4d4FN5eVXQ8Y+SYPUan3
	 D0v6UYTZkwe67CULgi04h3KrTCXxsq4gT7NNkrMORPx13HdNkoBBY+W4Vcd7C4nyQx
	 1bvNAyCAlgUlA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Jun 2026 12:14:53 +0200
Subject: [PATCH 28/37] drm/mediatek: dpi: Switch to atomic bridge callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-drm-all-atomic-bridges-v1-28-b63e6316166b@kernel.org>
References: <20260617-drm-all-atomic-bridges-v1-0-b63e6316166b@kernel.org>
In-Reply-To: <20260617-drm-all-atomic-bridges-v1-0-b63e6316166b@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4874; i=mripard@kernel.org;
 h=from:subject:message-id; bh=50nNV2gOk3Dn5TP3UVQWya6pySg8qWx6qlSUclanS5Y=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlGxZM+cOlytdS2nGy/HGOSKXmnru5q68HLly5c/Mv+s
 U/c0mZtx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIdD3G+qDlByuiJFZ3r/Nb
 r+h6sDzlP2ev74JN//fca1iaeVbL5nmey49pJ9ZczT2Zyfds8vWqp4wN8w9ObLrVN/3wTKXaFDY
 /bcnYZ4/zK05cq1sY37/uNtf6gma3nk3N8g5Su/pOlPk2R18DAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The mediatek mtk_dpi bridge still uses the deprecated non-atomic bridge
callbacks.

Switch to their atomic counterparts.

Generated by the following Coccinelle script:

@ is_bridge @
identifier funcs;
@@

 struct drm_bridge_funcs funcs = {
	...,
 };

@ has_create_state depends on is_bridge @
identifier funcs, f;
@@

struct drm_bridge_funcs funcs = {
  ...,
  .atomic_create_state = f,
  ...,
};

@ update_struct depends on (is_bridge && !has_create_state) @
identifier is_bridge.funcs;
identifier f;
@@

 struct drm_bridge_funcs funcs = {
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	...,
 };

@ update_pre_enable_struct depends on is_bridge @
identifier is_bridge.funcs;
identifier f;
@@

 struct drm_bridge_funcs funcs = {
 	...,
-	.pre_enable = f,
+	.atomic_pre_enable = f,
 	...,
 };

@ update_pre_enable_impl depends on update_pre_enable_struct @
identifier update_pre_enable_struct.f;
identifier b;
@@

-void f(struct drm_bridge *b)
+void f(struct drm_bridge *b, struct drm_atomic_commit *commit)
 {
	...
 }

@ update_enable_struct depends on is_bridge @
identifier is_bridge.funcs;
identifier f;
@@

 struct drm_bridge_funcs funcs = {
 	...,
-	.enable = f,
+	.atomic_enable = f,
 	...,
 };

@ update_enable_impl depends on update_enable_struct @
identifier update_enable_struct.f;
identifier b;
@@

-void f(struct drm_bridge *b)
+void f(struct drm_bridge *b, struct drm_atomic_commit *commit)
 {
	...
 }

@ update_disable_struct depends on is_bridge @
identifier is_bridge.funcs;
identifier f;
@@

 struct drm_bridge_funcs funcs = {
 	...,
-	.disable = f,
+	.atomic_disable = f,
 	...,
 };

@ update_disable_impl depends on update_disable_struct @
identifier update_disable_struct.f;
identifier b;
@@

-void f(struct drm_bridge *b)
+void f(struct drm_bridge *b, struct drm_atomic_commit *commit)
 {
	...
 }

@ update_post_disable_struct depends on is_bridge @
identifier is_bridge.funcs;
identifier f;
@@

 struct drm_bridge_funcs funcs = {
 	...,
-	.post_disable = f,
+	.atomic_post_disable = f,
 	...,
 };

@ update_post_disable_impl depends on update_post_disable_struct @
identifier update_post_disable_struct.f;
identifier b;
@@

-void f(struct drm_bridge *b)
+void f(struct drm_bridge *b, struct drm_atomic_commit *commit)
 {
	...
 }

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 959c994eef24..0e4f430de983 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -848,21 +848,23 @@ static void mtk_dpi_bridge_mode_set(struct drm_bridge *bridge,
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
 	drm_mode_copy(&dpi->mode, adjusted_mode);
 }
 
-static void mtk_dpi_bridge_disable(struct drm_bridge *bridge)
+static void mtk_dpi_bridge_disable(struct drm_bridge *bridge,
+				   struct drm_atomic_commit *commit)
 {
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
 	mtk_dpi_power_off(dpi);
 
 	if (dpi->pinctrl && dpi->pins_gpio)
 		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
 }
 
-static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
+static void mtk_dpi_bridge_enable(struct drm_bridge *bridge,
+				  struct drm_atomic_commit *commit)
 {
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
 	if (dpi->pinctrl && dpi->pins_dpi)
 		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
@@ -980,12 +982,12 @@ static void mtk_dpi_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
 
 static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
 	.attach = mtk_dpi_bridge_attach,
 	.mode_set = mtk_dpi_bridge_mode_set,
 	.mode_valid = mtk_dpi_bridge_mode_valid,
-	.disable = mtk_dpi_bridge_disable,
-	.enable = mtk_dpi_bridge_enable,
+	.atomic_disable = mtk_dpi_bridge_disable,
+	.atomic_enable = mtk_dpi_bridge_enable,
 	.atomic_check = mtk_dpi_bridge_atomic_check,
 	.atomic_get_output_bus_fmts = mtk_dpi_bridge_atomic_get_output_bus_fmts,
 	.atomic_get_input_bus_fmts = mtk_dpi_bridge_atomic_get_input_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,

-- 
2.54.0


