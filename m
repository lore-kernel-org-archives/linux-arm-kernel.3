Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6216ACCD186
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 13:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9e5rEgOs7UEBdHsv4VfIfsQLlirNAX7TzjMxWQmpX4=; b=z99wIUv8I9v0EjEuMj0BEyd4tR
	EbSB/ITvtmvTjbsmwXvU++0Ht6+VJYvG2e+E7Bh2o1tkCSiVzHa6HutCtFc0LeJtPPpCqXGB7vUC5
	mpvTDfDaUk50ku8p8sawbsiL11wjIKcE19bc2e1ZONHkgRVEpQI1ZBcNKcclAfyMg/ycysN0c4nKt
	2m49JqL13dGnuLdjgTVqPYPjFcMIOQIqp4FQWE0KgvfZATayYEfnbWSLNcyqTvV26MyiFViOTNa+/
	Z/HP9vuwfFMnHXzwrE8rW21OG2IFa0Gxe8w9qyUz2EdlQCJ8NOZuo2rb9XHWqfJSGOPyC3TbzIzIu
	fPiSP6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wnI-00000007zwy-3QWJ;
	Wed, 01 Oct 2025 13:22:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wnF-00000007zr0-47mQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 13:22:55 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98403F04;
	Wed,  1 Oct 2025 15:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759324883;
	bh=Znweb1HJoGGEwx8AA6UGeSIlc4xbcTQrPSmXMO4sVVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fr3pPx7n00TKc+v1Gzf+o/FmtEXps8XasGTuIqsPR37i5sm7EDwGEPSzLA26SnUmA
	 O/1DRez+Lito4Ykyfjj3vrVH31S8I+sXS8HCilhK3f81iR25dxLitynBfr5/gLtOJi
	 oxwoQnIM69juGFEar2uAA4kD9wsyB8x1uxUZUmbM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Oct 2025 16:22:18 +0300
Subject: [PATCH v6 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-xilinx-formats-v6-6-014b076b542a@ideasonboard.com>
References: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
In-Reply-To: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2347;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Znweb1HJoGGEwx8AA6UGeSIlc4xbcTQrPSmXMO4sVVA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBo3SsiyYdd6sliaoQLMFuUTsahr168oIvlm+MsD
 LL759QMIaWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaN0rIgAKCRD6PaqMvJYe
 9aH1D/sF2x/sxjXDnp8utLup5dIWse86fJWEBBy0cqzAc5azp9ajD7BMC0KetWFtzMv4Akjoqid
 fUUhqp2IoVhN9TMnijW/dXyYBxJveE5fL16LJN3gijbhtN7vFx67386o76VpPZROuCS1dQNoOvC
 cDJxVEZD84A2vZXB7JskDRX8CXZw5nsHQ/is5JzU22xyngaKTYgojHb2nOn4SDUbgG3kT7NKVwC
 mWo1J8pux1nRoybgBpJ2Q5RUqY+68plFLqfbF/4bn6ZMwwAE+BFpul/tEh0aw1EGizRQUhetjIX
 M1QWoZu+1msUAPN1a3TKsBFO3uOVxTkMzYdFeVgTunLqtiouNyHD93ytzwxbf/YSkyATbc1uaY5
 p+GbHJ0q0LV+ob8GpeG18bphCvB5Swut9PUPfnVVJhugoYLkL9/eusk6gnyBUnc8XPXTXHx0w+a
 9X+iMp7H0Ww9LeAGf9PWyqGsUwqHr09fLa7zQzWAGLv+hJ5hrLPz7KlBjRGOuDXhsdz1QtxpRHb
 Uwc0z8AYEgILl5Cql0/o2kvmvaz93swcZBs/pSauZLkP1CxnJ3i+nLRy9bLCEJsMOoaAkNfkGXD
 kcLDOa6MmNOPGcSga1i7ft+cvjeZE/iNpQH8N0lj1MXAqq2sK3KVJMvjoRVXtHfSyHqjL1WxUbc
 GdrUIAyp7+dvKkA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_062254_174669_BF71DAB7 
X-CRM114-Status: UNSURE (   8.95  )
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

Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
container.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index ab643dedd6d4..a736df2de3fc 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -288,6 +288,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_VYUY,		.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_XYUV8888,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_VUY888,          .depth = 0,  .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_XVUY2101010,     .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_AYUV,		.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true, .is_yuv = true },
 		{ .format = DRM_FORMAT_Y210,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_Y212,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8ac36a74ceb1..24386bee34e2 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -264,6 +264,7 @@ extern "C" {
 #define DRM_FORMAT_XVUY8888	fourcc_code('X', 'V', 'U', 'Y') /* [31:0] X:Cr:Cb:Y 8:8:8:8 little endian */
 #define DRM_FORMAT_VUY888	fourcc_code('V', 'U', '2', '4') /* [23:0] Cr:Cb:Y 8:8:8 little endian */
 #define DRM_FORMAT_VUY101010	fourcc_code('V', 'U', '3', '0') /* Y followed by U then V, 10:10:10. Non-linear modifier only */
+#define DRM_FORMAT_XVUY2101010	fourcc_code('X', 'Y', '3', '0') /* [31:0] x:Cr:Cb:Y 2:10:10:10 little endian */
 
 /*
  * packed Y2xx indicate for each component, xx valid data occupy msb

-- 
2.43.0


