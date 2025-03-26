Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE17C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 13:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+Nv/rRfP5/WaLinMBHbFXKsWiRGcLC7CTDd+t4OfI8=; b=JjW90weCVMqkx+Hmfjv5rm6HnY
	Bp+g/N9tnhXnXcbeHX/5vj/77PFT8uh5rUNtTgLoQ+zJi3K/E2e2uGgmLOVbVlVe+4WzdNE8SVDQG
	vuTL++vfE+VfAW0oNWjgzkv2gZ/1GHPiAOrFEdGQQg1AUarnlAbFvSaXkAfTHEzQHrkdilMsLqWSa
	AdDw+8jUwlaEhrj+QODfAzYomOnMEVr1gJoYrA0gTe82NbrTZIHjE+CavDOAqvJ8PpKuMOaU4oPhq
	TFNI+Kh1wDfOvGm9Ejn4kvHLJQT0oGCjw2VJSSoFATSkj0blDH33x+kub3eY7/0/Wnxz6xMxsYkku
	ozB8LkPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQoC-00000008ZKB-47EH;
	Wed, 26 Mar 2025 13:28:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQj2-00000008Y8o-1G3S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:23:21 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91BFDA57;
	Wed, 26 Mar 2025 14:21:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742995291;
	bh=oWB+k3YdN2oGtIP+eNrRjj58cvMvE9xAoBG8JrtVz78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D05IgC1PdTFdjB76pkEjwQ3NwfPlmAkgEiK+28UtYpaxYpRzVynuhwwy4Y86FiB4O
	 0wRnMrfH/3bwK27vFuCuCAgeB9nJkeYPcVSx2nWaWaTOVFeUa0+XnwpCEx9gdgO3BP
	 12UYTF5QWEKR23V3K34JRZNGS1QluMQ9iFcU2OlY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:45 +0200
Subject: [PATCH v4 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-2-322a300c6d72@ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
In-Reply-To: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2201;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=oWB+k3YdN2oGtIP+eNrRjj58cvMvE9xAoBG8JrtVz78=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//AX3Zl9l8xzWQKZ3xu/dKaKYrp+y7JRJWXU
 xgpWeE7f26JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wAAKCRD6PaqMvJYe
 9SWgD/9TkRG3IR+l7+t3B0na903vCmOmvRPtBv0gg/gn25Nle2kOd7ZYVzl5FsW2aX6SDlBhomM
 KWvzVgYKGIYKMkAFxW74n2vO13Glb1K0+fSQBm3xePyVW1ujjj+FZ8DdC+HspxN1aOQmvcYbrfe
 yW0KGxgMfyxau1+Mgr5ELYKrAojTBa5LYskbU+oNFyqAT7x79OWoyP0Y+32skYwkNjTEZ3GTu2i
 hA1Dyu7mlu9JikTAB+rTlEzq5/kec7TEe6CjOXnKA1IIY8tg15qrAsvSh1zz6J+V5oQqVQj4ill
 MI4dZgtblvgHfsArniOp5EdKaDvAUdN8brmfmtTHrCh9GDvD9Gmgjq+T1NZcfH0BhI5D1cG9ZTu
 RvXFiUHkJrvqmj7dUzbglgvly/Uu1xyrOTT04qYd/7szyy2D1ml1DPEajD5B3nRsmCErAiTJZG8
 x5F0geziGneKnvvGd3lEiIKSqMbqhEKEkNBZPVIY2vINw1ljxXhFelQveCUv72BkKf9CFPOEhmA
 zKv7rCXX3BHakgMNqZrYVcZtP6yXcGYfPaftJcw0HRoBe81Qtv4/Py/iikyKOSqTMCYF3ki7oGi
 bINA5GWw8EGekVrooWbxBt78yVQ2QQNkSS3tfarUiMmDqF43Rcvfgf1Bt/tdWS7Xo8ppJW9LwHW
 PMEdlVdScMxppPg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_062320_490694_78C4BDDA 
X-CRM114-Status: GOOD (  10.28  )
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

Add two new pixel formats:

DRM_FORMAT_XV15 ("XV15")
DRM_FORMAT_XV20 ("XV20")

The formats are 2 plane 10 bit per component YCbCr, with the XV15 2x2
subsampled whereas XV20 is 2x1 subsampled.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 6 ++++++
 include/uapi/drm/drm_fourcc.h | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 2f5781f5dcda..e101d1b99aeb 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -346,6 +346,12 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
 		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 2, .is_yuv = true},
+		{ .format = DRM_FORMAT_XV15,		.depth = 0,  .num_planes = 2,
+		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
+		  .hsub = 2, .vsub = 2, .is_yuv = true },
+		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
+		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
+		  .hsub = 2, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 81202a50dc9e..1247b814bd66 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -304,6 +304,14 @@ extern "C" {
 #define DRM_FORMAT_RGB565_A8	fourcc_code('R', '5', 'A', '8')
 #define DRM_FORMAT_BGR565_A8	fourcc_code('B', '5', 'A', '8')
 
+/*
+ * 2 plane 10 bit per component YCrCb
+ * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
+ * index 1 = Cb:Cr plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 2:10:10:10:2:10:10:10 little endian
+ */
+#define DRM_FORMAT_XV15		fourcc_code('X', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane 2:10:10:10 */
+#define DRM_FORMAT_XV20		fourcc_code('X', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane 2:10:10:10 */
+
 /*
  * 2 plane YCbCr
  * index 0 = Y plane, [7:0] Y

-- 
2.43.0


