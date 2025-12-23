Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDC4E6FE29
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLCUVaiigN4dmDSWkzzrQ//yMzazdSpPJcK1PhGqzXE=; b=rgEH7vAdnHp2dYg6m5NkmMGj4I
	t1AqPdGQoH+K06pmppm1GsjN+d62/0c/gbCq0zy1R7h7hQoFni411ZSILSlr1ICwlNzg6Zsm4pcEb
	hI7jFmFTBpn+iMPweBrXtWt30OBNLxA7d6NXVMlqRFa3FPxGWphHjXG4h7lJWF/g5RvQVHx0mX+KX
	OVlUvb9Cj6o9Bb3RPl2CTTzRKDX7G0L4NS6XiZUsaaLLzaq55NAZGm8TdTJtRNYKe20ufBCjmfqsQ
	ljDK1YYVNj5xjTzNMa5rx3t36wpPv//6uhMYEabilm0wwoLDocoYd9TipIoD2nVoZJ/U3M4F6Enov
	QlxZeHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8Lt-0000000G0em-3qMM;
	Tue, 23 Dec 2025 19:47:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8Lo-0000000G0Yh-118U;
	Tue, 23 Dec 2025 19:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766519238;
	bh=/kVX1RzrNSBnY/fW9DC+dhDXp57nFB3/xBBZ3YN1SoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hZL1AEFAah6+ljKcvDJCeFh6Jqx+dd01xHR7RoD5zML9EavRnSkaajKPjvMKFhz2a
	 oGUQKszlxMtf4DSju5zGunkf4AybW3OYNM/i6zi/N4/wLktg3vZ2fpbzOwOW/GbxFH
	 BNzFygGfhPtIEpUKQgR4hN6wziSe5gyBUHsOJT2dhKnI6E2l2PmblnSHIoZgQycsg4
	 zaFwIjmkUDeyI+gdOzD7ilLGPkgXkKRIhhkZwjTB1lZg58sS4SNEcLXJOUQzPGlZxl
	 rUEV+t4+qSIQKmHvrzRXwoGY5x5v5hquV7eqdX66TkDjjMaJnQkG3d5gTAC50EYOCb
	 AFZPGXefmUj8Q==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF2F117E1580;
	Tue, 23 Dec 2025 20:47:12 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 23 Dec 2025 16:44:50 -0300
Subject: [PATCH 09/11] drm/colorop: Introduce 3x3 Matrix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-9-0cb99bd0ab33@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 daniels@collabora.com, ariel.dalessandro@collabora.com, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_114720_461526_FE73A066 
X-CRM114-Status: GOOD (  13.52  )
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

Introduce a 3x3 Matrix colorop analogous to the 3x4 Matrix colorop, with
the difference of not supporting offset coefficients.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/drm_atomic.c      |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
 drivers/gpu/drm/drm_colorop.c     | 21 +++++++++++++++++++++
 include/drm/drm_colorop.h         |  3 +++
 include/uapi/drm/drm_mode.h       | 16 ++++++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 6d3ea8056b60..bf4a31c02b70 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -802,6 +802,7 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
 	case DRM_COLOROP_CTM_3X4:
+	case DRM_COLOROP_CTM_3X3:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
 	case DRM_COLOROP_MULTIPLIER:
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7320db4b8489..7a70e894a2ef 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -709,6 +709,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 		size = colorop->size * colorop->size * colorop->size *
 		       sizeof(struct drm_color_lut32);
 		break;
+	case DRM_COLOROP_CTM_3X3:
+		size = sizeof(struct drm_color_ctm);
+		break;
 	default:
 		/* should never get here */
 		return -EINVAL;
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index a19e03fb9c7c..51c1a0726dfa 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -68,6 +68,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
 	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
 	{ DRM_COLOROP_3D_LUT, "3D LUT"},
+	{ DRM_COLOROP_CTM_3X3, "3x3 Matrix"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -377,6 +378,26 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
 }
 EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
 
+int drm_plane_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
+				   uint32_t flags)
+{
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, funcs, DRM_COLOROP_CTM_3X3, flags);
+	if (ret)
+		return ret;
+
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_ctm_3x3_init);
+
 /**
  * drm_plane_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
  *
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 8ec98521607d..ee7fa0eb5dbf 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -426,6 +426,9 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
 				   uint32_t flags);
+int drm_plane_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
+				   uint32_t flags);
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
 				struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
 				uint32_t flags);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index cbbbfc1dfe2b..b894b19eb9f8 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -964,6 +964,22 @@ enum drm_colorop_type {
 	 *         color = lut3d[index]
 	 */
 	DRM_COLOROP_3D_LUT,
+
+	/**
+	 * @DRM_COLOROP_CTM_3X3:
+	 *
+	 * enum string "3x3 Matrix"
+	 *
+	 * A 3x3 matrix. Its values are specified via the
+	 * &drm_color_ctm struct provided via the DATA property.
+	 *
+	 * The DATA blob is a float[9]:
+	 * out   matrix          in
+	 * | R |   | 0  1  2 |   | R |
+	 * | G | = | 3  4  5 | x | G |
+	 * | B |   | 6  7  8 |   | B |
+	 */
+	DRM_COLOROP_CTM_3X3,
 };
 
 /**

-- 
2.51.0


