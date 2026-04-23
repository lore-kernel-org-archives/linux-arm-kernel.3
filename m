Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E024F589DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 14:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+EfrB+WUDd3Gvd0JBrM0T3AfGhzP0eanTg45SdvNvg=; b=jrqfyHP0TFIgv1HtpTgxWtHZrO
	9oqfNYSCROqMdkky1YYpkXFh/9/YXJ+XzaLC/uKfxdnyzj975X2HgAcCvNY1r9gQEjfmAD6LLNYc7
	Ld+FpOkYlym4N6r+qDRgCl20PnM2baudkrb1I1dlt1A2sCM/xAGMCVaAzzhPydFIn1G4JCbgVXKkf
	KfORKMJ+JDgY/wSscHS9rVadfkDBghm/33xsTPxSijy+wyTvemJioZeukONOGsYtgwy20Z1r0sN1h
	5sVp/nTLxW11xomCFJbWYpQe0fkKbtWvDxtyz3o9mbbPM+ReMxymjpJVAv833o3yrQATqCV92Rv6g
	lAOxIpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuwh-0000000BoUI-2wF7;
	Thu, 23 Apr 2026 14:22:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuwH-0000000BoDR-2Lrj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 14:22:04 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1113219DF;
	Thu, 23 Apr 2026 16:20:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776954012;
	bh=mxfZo+5BBTzaFy49GfUY7dWrcVIr2DZ6vJ03YLmG9Ds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pIkKyjgqXI5pYrp/loIfPLinDXlGeyH4u6OUOqhpWJSkFBtn+Op2jFx80I4pLu1Im
	 6gH0On770+JDNzojauP+zVYOBxy9U8CDvkoxaFQevU9mbtzGWw0jepRg36UkQIUeOn
	 Qz1X/2TPAXP7SRT99GJMz1Do4u2DK0DZnwmAfPsA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 23 Apr 2026 17:21:17 +0300
Subject: [PATCH v10 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-xilinx-formats-v10-6-c690c2b8ea89@ideasonboard.com>
References: <20260423-xilinx-formats-v10-0-c690c2b8ea89@ideasonboard.com>
In-Reply-To: <20260423-xilinx-formats-v10-0-c690c2b8ea89@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=mxfZo+5BBTzaFy49GfUY7dWrcVIr2DZ6vJ03YLmG9Ds=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBp6ir1mdrfl5jvDtVXtPF2+19GOUfwDW+dwKUj5
 EPlAbrIHnKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaeoq9QAKCRD6PaqMvJYe
 9XNMEACAbzjafN1aS069egWawzUcnF7cGpKXNlVGu1kNn9bUKB2LQh67ii4DxU3aNU5zjxbP+As
 1Ffvfk6qtgDduvkYndqYTg4hLkNnPIg9RoGe7bSa6e3P0XkOleQ8tuSJ69eeZD3igpLiMLGGUKv
 ERmsn80x0RYgazSC3H8hAaIL4i5d4jgRSdcb7jJNaYj5ZgWQraPVnvR9LDuSp/Q/CQ1YYp/nInq
 X99Qx1/rxIMkHIPzKO3OlcznHpfnnuGvDs3hwIktBy19QitTo8fX5ePgqX2Hri3H/3psLlUSDhH
 zWrbmVFM8EYm1OIHIH7cD7D/lvmHgwOmxFZXmalv9Q2P5KltfOl98eoPebQnjCLQTgwYqvPFU7t
 WV7HuAHa4y3jzeiL+T/G5IObz0qaZQcLy5StAYH7Qio6vAjJAzPc9y/hZyjeHo0pOD8wMIom28r
 Ab90hCGkZwmpb758JUUIzycXsjSU+R5x31qbtyvmBUJvMyRrpAijkM+0/jKeMWNGopYIdU8Xmjd
 g6rT4TBb7Wy2JdIBJ878k9g5ASMXpOHctnqHnGZEH2KdiXCMTYHrs8FwrVu5ef0oFgusnJgUzDv
 ssNOGz43Dxf9U7DtaZ8V+Oo/ugqsXjLd15mU48K7Dvm8C3FAcRzW77ytrVhLLLMqjXArs9gfJ8L
 o1NF1hExs3+1TWQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_072157_753536_27FB1FB0 
X-CRM114-Status: UNSURE (   7.91  )
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
Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 20b84efc135e..60cd02b7ea64 100644
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
index 07bfbc8a0300..d95638105520 100644
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


