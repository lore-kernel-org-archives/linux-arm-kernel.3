Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1032606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qi+Pl9e4;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=puC9kj1L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=q1uPJJujBlQwMDVIEbVRHxhSYFea8SfgoWYItKkXDG8=; b=Qi+Pl9e4FcPl2n7cXqDy44VggU
	ooQFqeKy86y2NwmR05BPmv4L7YnzcvqF+H2i13wBRnTZR5bUkjhCLuUvmr+OA03QRiek+KUZUwWQQ
	iqoATfnYzK2nYNw30OBEzvuBksJo8cN8nwafHEaVXbLML7HeO4shnQS6MIxhxRu0g+jpLBqoW+Jpw
	0164W9Jqob2TRJ/22BiRiuL9SQu4CaIIyCl8ZdlOH6wZxqNXo8NlZ5I+bXkcZ9KSMfs3WM/dj2a/N
	XqVsZA4GeOdLCTlB2XTR0WS/9Yx5ryu1w8tulrPNAIwd1B1ctzCNMv038sR3FjtAZy65IKTIa456H
	wiT1B1Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM0E-00000002hQb-2PUu;
	Mon, 26 Oct 2026 14:48:46 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM09-00000002hOj-2U5s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=q1
	uPJJujBlQwMDVIEbVRHxhSYFea8SfgoWYItKkXDG8=; b=puC9kj1LBRzDwPO2+K
	KrVZv1iCMDAqvE7ItxjUiJXBIF7cnYD65P+vsusW8BIMHBtEbA2BVf1grt2L1l1f
	ZpxEsWX//eaFZpJWWyOL0GrftKs3CmpBVhg03As4ltAYTr2kdEJVBnTKRJJpmizX
	BpSmCLfnE8092eznbbnCZwSQg=
Received: from SYPC (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3P6kmaN9qcCfOCw--.2131S2;
	Mon, 26 Oct 2026 22:48:07 +0800 (CST)
From: hsyysy@163.com
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Siyuan <hsyysy@163.com>
Subject: [PATCH] drm/sun4i: report coverage pixel blending for alpha-capable planes
Date: Mon, 26 Oct 2026 22:47:42 +0800
Message-ID: <20261026144742.1392695-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3P6kmaN9qcCfOCw--.2131S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryktrWkCFy8CrWxtr4rGrg_yoW5Cw4rpF
	WrGFW5C34UCr4ava43ArW8ZF43Wa1FgFWFgry7J3s3Xr1qqF9ak3s8Caya9ryUArs7Ar42
	gw15WFsF9F4DCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEpVbDUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7ge16WrfaCcAFgAA3Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_074841_991529_A1F7D492 
X-CRM114-Status: GOOD (  11.76  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Yang Siyuan <hsyysy@163.com>

Linux 7.3 added validate_blend_mode_for_alpha_formats(), which warns once
per plane that exposes a pixel format with an alpha channel but has no
blend mode property:

  sun4i-drm display-engine: [drm] [PLANE:35:plane-0] pixel format with
  alpha exposed but blend mode not setup. Please fix.

The mixer blends a layer using its own alpha channel: ALPHA_MODE is set
to PIXEL when plane alpha is opaque and to COMBINED otherwise, while
BLEND_PREMULTIPLY keeps its reset value. That is straight alpha, i.e. the
DRM "coverage" blending equation.

Advertise exactly DRM_MODE_BLEND_COVERAGE on every layer that can expose
an alpha format (UI always, VI on DE3 and later). This matches the
existing register programming, keeps userspace behaviour unchanged and
satisfies the new validation. Premultiplied blending would require
driving BLEND_PREMULTIPLY and is left as a follow-up.

Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")
Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 13 +++++++++++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 14 ++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7d894e1eb..ef059ac47 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -283,6 +283,19 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
+	/*
+	 * The mixer blends the layer using its own alpha channel with the
+	 * pixels not premultiplied (BLEND_PREMULTIPLY keeps its reset value),
+	 * which is the DRM "coverage" equation. Report it so that the blend
+	 * mode validation in drm_mode_config_validate() is satisfied.
+	 */
+	ret = drm_plane_create_blend_mode_property(&layer->plane,
+						   BIT(DRM_MODE_BLEND_COVERAGE));
+	if (ret) {
+		dev_err(drm->dev, "Couldn't add blend mode property\n");
+		return ERR_PTR(ret);
+	}
+
 	ret = drm_plane_create_zpos_property(&layer->plane, index,
 					     0, plane_cnt - 1);
 	if (ret) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 92dd5a97f..b6771576b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -470,6 +470,20 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		}
 	}
 
+	/*
+	 * Only DE3 and later expose pixel formats with an alpha channel, and
+	 * the mixer blends them with straight alpha (coverage), same as the UI
+	 * layer.
+	 */
+	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
+		ret = drm_plane_create_blend_mode_property(&layer->plane,
+							   BIT(DRM_MODE_BLEND_COVERAGE));
+		if (ret) {
+			dev_err(drm->dev, "Couldn't add blend mode property\n");
+			return ERR_PTR(ret);
+		}
+	}
+
 	ret = drm_plane_create_zpos_property(&layer->plane, index,
 					     0, plane_cnt - 1);
 	if (ret) {
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.0


