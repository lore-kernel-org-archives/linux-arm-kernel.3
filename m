Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0DFC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjJo3Fj4Y3M7P7UUf2J8RDjcdklOkU4JBfrPJgHwwLc=; b=Fg8LKab+k9QXJllSjmTEc8T74V
	83fuuUijzfuqHb8AQlvcGEbBkiWdg5tAmPu4vZnDG3ZNpqiv96VCPLy3lmzzM3ozqOtD8tDgh1yN3
	sLJzo5gjkK7XmqAjMQLZaklF1lKmUg8xKPKSCc7wqwRKJhvNwDP4VTrSrKWimC4T1AFKGNLYRQT9G
	oZpXuvd9PPAlE3MiA1+LtwviCs+03Cs9nG6TFoCbKlM78z+ss/jnXePucY6b8wOP5yyqIIK/gJ8pM
	lJacgKvuot5HXjRYv+su+JadduK5Xm6RCawC755YlWNboSMrZPASuiuzYZsAZAK9gSx1MMzvuaFGk
	+S1Dn5zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7TT-0000000FFxd-0e43;
	Tue, 07 Jul 2026 15:12:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7TS-0000000FFx8-0bRt;
	Tue, 07 Jul 2026 15:12:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 68BFF6187C;
	Tue,  7 Jul 2026 15:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC1C1F00A3A;
	Tue,  7 Jul 2026 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783437157;
	bh=RjJo3Fj4Y3M7P7UUf2J8RDjcdklOkU4JBfrPJgHwwLc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oNrE6GLHfhtGtv/ZYgV4pjobiyQ6dd9YmJn6lQ3RbhmHw2lwFIsvE16xGK9fDQGgY
	 Nm35ldQswJ6l6Ls6GYfEcBwE1NXRpev0XPn6sEWk325kD4HkUMBYC4gcPT+tHh4Ivf
	 Hr/RF6/no7dtTJVfKVU9JTQxoegV/Larnrsi3hNaou6N/fVbI4Uu7OnXaLDUhpfDkL
	 uzkc5UHPAomj7PWjiS+0kKMkftaSx0SIvasOJT3RF3sVoPYvrvYDIMmIAWu9hIhic8
	 cL8b+69YHk2V2RLsrlyIVd3HCC1BioAVOuPkfmhGmZ1xp/BfoR2WceRlbmKaB8aPSg
	 f3Oqy/dtFQ5IA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 07 Jul 2026 17:11:35 +0200
Subject: [PATCH v2 28/37] drm/mediatek: dpi: Switch to atomic bridge
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-drm-all-atomic-bridges-v2-28-21d03cbca446@kernel.org>
References: <20260707-drm-all-atomic-bridges-v2-0-21d03cbca446@kernel.org>
In-Reply-To: <20260707-drm-all-atomic-bridges-v2-0-21d03cbca446@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4993; i=mripard@kernel.org;
 h=from:subject:message-id; bh=nXbzB00QYc3JnjKw7I84CN7MUu3KVoNBVXjt0wzqJ64=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm+4jJRgtkrGbrYgwXTZaZ/b7tkK/7F7wjT7mNXSz7n1
 aTL/OHtmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABNROMTY0HxUcuqNjlzX5ssf
 rlakB5nJhpzZt3vyZImfUmbf9bUU7OX8c5ZZCnlZsolzqWrX6mgy1ml8nrnaq7Hovlxd9M9kqd/
 fJ5rfjZPrP7/450EbqYZV/1X+W3O4eXeJ1wTFy9ibNcjpAwA=
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

The dpi bridge uses the legacy non-atomic enable and disable bridge
callbacks.

In order to remove the legacy bridge callback support from the DRM
bridge core, switch to their atomic counterparts and add the bridge
atomic state handlers.

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


