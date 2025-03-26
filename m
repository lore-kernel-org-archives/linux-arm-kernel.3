Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95D3C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbsil+s1j8FDFhjjTz+TR982ymbWwejhMcorPAjnwu4=; b=N+fOofM4P+E7mc8BZY2BddppeW
	n5tXEuQpeTzW4Jd/vDZb3qWrcNgIW/EKKxq5msSHpqAO5N2nSuVJwF7rKJ0r4bpBiHgAJjYW1XPdh
	oeiZObN9IhAj0logZkPEz8AY8/9Nn2fkl4BkmRGpEi6120a0aCsg1h38zPErwMS9JcRHQJNISMD15
	5ahgPHGwIFpO9h39qrUJi5FZzH8FiG2xKKUk5x5KIsMY/98iEjk27om/gTn/XuRtOZD2zaWsys9lS
	3RocMb3BhvmhIGT+m8lLQM/iP3yJbb6E+7BTYLZFnxFAIGfwhKzc5Le0Dju/pykFMwn0P+KiNBqPe
	YrC9gTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQpv-00000008ZXe-3AJs;
	Wed, 26 Mar 2025 13:30:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQj3-00000008Y98-1JoM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:23:22 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FEB01054;
	Wed, 26 Mar 2025 14:21:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742995292;
	bh=PtShATPcCu0HjOE3jQ5aeC8LyNewsgbKYVLFevEUXT0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bzAAnpmFwKzwlIOcrh3kmM7/GpyTMV9Lkwh9nwMk6sQx98fkSku4khyowhPRiwWZG
	 MurfrHtB+XOlj+QBE7axKtWe+uVOJdxxYzEmHLH9y3IbFk6RcBZd06h3k3FaqhsA9Q
	 7GOZFTnLzkcjz8GR2SmkGtzm9g25Ctt9JjlxQwFw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:46 +0200
Subject: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=PtShATPcCu0HjOE3jQ5aeC8LyNewsgbKYVLFevEUXT0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//Ava8OwHFVld64m7jx6U9gxzgqkK/V5FaDT
 BR7EqsDsnyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wAAKCRD6PaqMvJYe
 9cr0EACMRJguvN6Fjc6Syac+iVs6MM73egJDFs1wdRMGX8RoKhaIe5dwVQKRdo1SOwHDowRRH2y
 tkkLZxYyF1NNrjton8vBFC3UV+fwYYa7ZvvCdxNjpXeAFD+qwWuw1BJILscXpe9mfIWCLMbUV19
 gH2WnUlRV1nUzTc9TZWchKBnT9hVDfg8VgGj4VZ+Oj1/tt57jfw3Zud+CaAv+IsYICLoP0jeKF2
 zzaalq1eEUG5/awR7nW0hrdyJ1buR0XHHePbamPuRH9mIvLYXXJh3jCjIYlZ90AfOlpw5AmgCZe
 FZkdHpH3RFWOxH4fXErJdOwHkiFP9Sio641Mzuv1Y+Nygs9gcoUPLPZTUL3rOnlO/okatLK8AkR
 Pp/jKKhw0gbncvZlWZpGdhRgORUgGl91sdSdsxvdSUqL1lKtF1zpHIklBLG4jPK4bY2B/5YQLAZ
 U3RQfRugZPXRoKaYPK6o2pbhr7Z9GrlikxRBIzTK+aq3sglhNz4I6TCeewxvzd1sQt5uWL+VWTs
 4R9lke+eORcGYvF1TsQqtQl7TZ9srUPEJLw3rsYsAV59j5Tp6W1zi4X+v9xbo36kAm8iACvcMnJ
 sbo4ExwaZC3ZQykcA9hNlnI97MRzMo+nv0d/ttWng+jWSVUgZYZS5nwKDFwzXYdSHEJl8UP+q1z
 0ve2qpgngqqZfHw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_062321_497252_BF92E43B 
X-CRM114-Status: GOOD (  10.51  )
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

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index e101d1b99aeb..355aaf7b5e9e 100644
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
index 1247b814bd66..751b8087b35f 100644
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


