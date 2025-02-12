Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350EAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWPpcR8TUpDiu+KTAvrnI3TSFJ+HTo68xa1GEFYcNhs=; b=Zs0r448CXxGinxOKLIF+G22lSb
	vkp0FiolCHJgIBSysU4eQyeNsvO47ikd+YSmgNCI0ukCNYCl9MjUmso+HIvu27O/MRFzOQWdvdcOl
	yLcATmUhLIE54vkzkCIbvSozXnn1DEAbw2z3bm0zoNQit42OtDSIQDtm2Z4on9hhbfYIf+PwMFPKh
	9FOlt8ffm4ZRZhaa1xT7ZiutAmUjZFsWwuf8oKxQN1xSeuJKyJSvYsYM7KW309IGWrIbVCE1v5JGa
	PGH6/hB2zMQKhNgt98NJ35qgGNtZGUqmggmOeYEaTTd9IacYIu48g+JDvyfqXR3P6ZF8Z4VkcL0nj
	OXIM2yXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEEj-00000007mlT-3eGL;
	Wed, 12 Feb 2025 15:01:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEAX-00000007lcN-1yoW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 14:56:54 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1083189B;
	Wed, 12 Feb 2025 15:55:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739372130;
	bh=g4sDY099yYwC2vYw8J7DR8aRN/YzbUWG4i/WZTnG8NU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d4NVGWRFLbSTrfGsr/MsK8+qqD9swm9BetnicRcWEM01Dldo2xBu/YTUI+GGTDl/y
	 UaCXf8ZCRiu5z9P+IrLl+zaqzWPzdGCXtv+tCeCRepl14hcCR2wFlYbET7++frXRX3
	 WT36evzFDaS244N9aPefVGPj2d1+8P2IJjeX1rEM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:07 +0200
Subject: [PATCH v3 03/11] drm/fourcc: Add DRM_FORMAT_Y8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-3-90d0fe106995@ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
In-Reply-To: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=g4sDY099yYwC2vYw8J7DR8aRN/YzbUWG4i/WZTnG8NU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnrLapqklb9snATVqBJ6qxuu9OvjBvyo/6dic/V
 kFyILyCmXeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ6y2qQAKCRD6PaqMvJYe
 9fnGD/9CXn9zwgk5uhHviktspJwIP7dZQh5Dm/E3/FaswYeY+aGqRsUEQESARI6kDz10CYSm7nk
 R9BNyzcYDIlwa1SGI+M7g8iHbhW6pZz3lhj8aw43W5mYjlb/XyyGdbfrzja8LmKRbCkr81QrFDs
 zSDAckWYfkmi0J1cDyXY1eoNRBKL7g/G+t1rBrJk91tC0md/i8UnTdi8Gd89G4KKn9vm6zslaHW
 xiWVusBhxaY97du7nuLpPQzAEONrQLvHWI6sXTdlGPvMbMaMYeqB1Dflts0I7PWucNS48Te+cue
 N8WxRaRXwG9neEFVy4MXPlW+VCqFY60DNmY1Mk+yVZXBDWG7sT7hDwkUheic1sbCekiwtFlwL9U
 bnRnDmIj6Kf9Y9BlfNSb8m6mDetPgnjWAYlN50wZaFbBE/zrZo8gpv55n2IBcgYwR4yxMM6aZpf
 0jGpCcoNzVRKVEPI7qLRfXfPFYp57iSo8kOrLnBa9ywAdxzPXEKNMaCnebpnEIhZpINtO+g8fT6
 FnPqG4BplxmKWzWZ/fbGU4xVwZI05VHRP7y+HSykXZwIQ7rYYQuiPSHQSjkHYpV8DKupRv0s9BR
 yH4X6n45JT1/vfUobRlNJIGkQDDqUY4wkApKVP3aCXciyyHJdDrZcf0ljz79jMaqcwdrzCPxjtE
 UxkHjO9Wjba4LNQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_065653_653364_DAA6C0CB 
X-CRM114-Status: GOOD (  10.61  )
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

Add greyscale Y8 format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index bb0a2294573b..c8c6dd8a8d4a 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -267,6 +267,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_YVU422,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_YUV444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_YVU444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV12,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV21,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV16,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index ead756a71825..2778cea9c861 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -405,6 +405,9 @@ extern "C" {
 #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
 #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
 
+/* Greyscale formats */
+
+#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
 
 /*
  * Format Modifiers:

-- 
2.43.0


