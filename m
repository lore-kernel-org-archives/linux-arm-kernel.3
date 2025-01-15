Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1F0C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exgdDonrVR2LwCxtcbRJ2e4ffwuwLMZJql3r1ltR1D8=; b=jSkbCmKgNmMJFBFUgOOf/x21p5
	WKw0f3z8jQOaDb4Z5b75zc+YeyNvXWLJzEgR/jf9ltfF78m07HgDoQTefW7zNi9nMIP+z9CTOKwY8
	xKCUNGfxNN2jhXCM/lBkCa7y01T9C6XSiJrmBtJnBK0lAZqmYHIWj1gWuMFT9fA6OYkrc3fJa8PmN
	c25B8CGy3aj/qZ0Pu8sbJjJkqiJSd0/5JRKezffO7r/1I/E0qDQof5LU2WTRYahosw/O7OL3Hp9lr
	KsjdRV70/MIKmYrYmY4MtKNwyPMTl9UlfMRnlxprJ6FOu9MY8sj6dhX0QiBnzUL/DZwZ/nj9EhO/b
	t8ALm5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzUg-0000000BFnT-0QNz;
	Wed, 15 Jan 2025 09:15:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzJk-0000000BDRX-3C8e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 09:04:05 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82C233EEC;
	Wed, 15 Jan 2025 10:03:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736931786;
	bh=vSNfl+dk45d5cm6nnQngiziPUpAD1SE0JXcPFtyqb6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=noYiI5DAFQ6kPyO3/qVdw3HTWXDGdKEyFyz83owDgBSAKxh10Ii+5GZB5Igag/+2v
	 yZp9rmVcyFn/stYtvzUoZtTXvlZwvgC/SdpIHuSF5kX35H0QufQ/N0MppSHDzIY6WP
	 ASSCowLPVcLujeWHrlFqZMGF4+3p3GTNlsf/w9Rk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 15 Jan 2025 11:03:37 +0200
Subject: [PATCH v2 08/10] drm: xlnx: zynqmp: Add support for Y8 and
 Y10_LE32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-xilinx-formats-v2-8-160327ca652a@ideasonboard.com>
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
In-Reply-To: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=vSNfl+dk45d5cm6nnQngiziPUpAD1SE0JXcPFtyqb6E=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnh3n6RKceVGVDHfg+MYO+EE3OqKVDxw4mxlMrB
 yzt/Jj5WiqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4d5+gAKCRD6PaqMvJYe
 9bSHD/4jmLy2w6nPu78ohwU4OdHwdovGAZ8LtpyIrZ9aOLc3qAbLLUCXwwA3hELlGG3jvUj7Mlg
 bvJknJuvbWfu5ekLhGAr/4R5ie/dt0dpKcEoe7ISN0MRxh13SHL/1oE1joCpgaAwdtJlJq8gyoJ
 ybGldR+PNsxvHASpvK4uGSL69+XLJp8/OyEjFN3ccwi417kUVJzushnPkM3pNQPdZSBY0yCYXoR
 v5JosH1dBNOT59MgfDiTWdtE2m42reAxa8Fdnzxba8TZdUO4p4ZyuG3ERUheH7nJZk7HRXSS44E
 PnY7Pe/9VkAg+XqpBVujWF1AnvUPL940E2Un0vs544YFs1cX4eTkxLubCnRc8bu9G55D2T5NX/e
 S/dfQDtSED6OIbf5FBKXVmM9Uz/GXUXXcnnhkwpQuRGu7z7ynPSQimS5SU1kXK+YWnCbqoGH33Z
 L5zzsZFNVfISUttrQKYkRJZ71D+zaDLIqUGv+rK//RJsARNw7zk15jLRyEnHm/fKzTq13iJ4zKr
 ESm4QHaytEGvmTmODaKJg6PM8FksqkQYoEOKIwWLwL/+Kv5TKACFUrql40zPC7CHO96PRoEI2dz
 mWFlK6l7FVYKy+YV1P+uLqSZztvK8OqGdtcwZr/wL/K9Q/5PCjB4CU2BaC0ftrAsIaAsKZcmi6/
 tBkZdZu6xkOFzxw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_010404_940077_55761E0F 
X-CRM114-Status: GOOD (  12.98  )
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

Add support for Y8 and Y10_LE32 formats. We also need to add new csc
matrices for the y-only formats.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 3998754e367e..44cfee6a0e32 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -309,6 +309,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_Y8,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MONO,
+		.swap		= false,
+		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_Y10_LE32,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 
@@ -699,6 +709,16 @@ static const u32 csc_sdtv_to_rgb_offsets[] = {
 	0x0, 0x1800, 0x1800
 };
 
+static const u16 csc_sdtv_to_rgb_yonly_matrix[] = {
+	0x0, 0x0, 0x1000,
+	0x0, 0x0, 0x1000,
+	0x0, 0x0, 0x1000,
+};
+
+static const u32 csc_sdtv_to_rgb_yonly_offsets[] = {
+	0x1800, 0x1800, 0x0
+};
+
 /**
  * zynqmp_disp_blend_set_output_format - Set the output format of the blender
  * @disp: Display controller
@@ -848,7 +868,11 @@ static void zynqmp_disp_blend_layer_enable(struct zynqmp_disp *disp,
 				ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(layer->id),
 				val);
 
-	if (layer->drm_fmt->is_yuv) {
+	if (layer->drm_fmt->format == DRM_FORMAT_Y8 ||
+	    layer->drm_fmt->format == DRM_FORMAT_Y10_LE32) {
+		coeffs = csc_sdtv_to_rgb_yonly_matrix;
+		offsets = csc_sdtv_to_rgb_yonly_offsets;
+	} else if (layer->drm_fmt->is_yuv) {
 		coeffs = csc_sdtv_to_rgb_matrix;
 		offsets = csc_sdtv_to_rgb_offsets;
 	} else {

-- 
2.43.0


