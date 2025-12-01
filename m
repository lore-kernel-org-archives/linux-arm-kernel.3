Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165D6D11701
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWizV9wcL/gVbyb+DfOL5wQKrDA+HHwt6Awyn1Mg29Q=; b=u3eItRbC1h8qAWJBlAL2Fg4rJI
	QpST297AjxXfYeHJeGbjxfr6zsqFLrXDLzY31bti9NXHuX8sCKD+IqIcKz95y0NORE7lXouVlRvFd
	rm93Qq5s0JuLVmrProVhtKRquGX2xuPKMjGnPl9jX9daS/oAD5R58xxy/OL6A1hMgrku1acVxaylD
	EF2Os/HtOZ72yG5H3hEceob3mwUR9YP86xWDMu4IsSlwEmROOI1vB5cTQx1GINiWp0kSxcysxEpV6
	a6UmSpQ+nBmKYWsrj6ep5q0gJDwC6HkLtSFE/1jiwxsdSsCaGlewih4YWIO/jYPKPjEZDR4/OROna
	LpiY7INQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2sO-00000003Wzv-3gt0;
	Mon, 01 Dec 2025 12:19:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2sJ-00000003WuV-0gwR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 12:19:29 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B091E18B1;
	Mon,  1 Dec 2025 13:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764591429;
	bh=2J3UNCS2/jDSpZlnMD/4+dbyyEtbbjNOHSmRZ5pdy68=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=keQbG9AK0UHuUoZFm+gQpGRjeudLTp2HCq/rrBuyT+4ELBpIbR+dTWTscdDZ7SDky
	 8g1QTy1arQDBY9CWgKmvnoIPcLoiUnvBjZfIimJOg1nNrlWH4putSo048pD3Tpccnp
	 aGT8raZvvK1aW/s+BWBjFTCnsZL5YIvSEB0kpKfU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 01 Dec 2025 14:18:45 +0200
Subject: [PATCH v7 03/11] drm/fourcc: Add DRM_FORMAT_Y8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-xilinx-formats-v7-3-1e1558adfefc@ideasonboard.com>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
In-Reply-To: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2389;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=2J3UNCS2/jDSpZlnMD/4+dbyyEtbbjNOHSmRZ5pdy68=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpLYfDOYy/pm5VblG+On3RIiXQzGnX8zp4MhsQY
 yO67eBKoU6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaS2HwwAKCRD6PaqMvJYe
 9WsaEACfeQgvfQlKgOyDXZyokV8wxUHkLOAXZgrDLj3vVdlvjdVas4WLjh50qufgTnOxq7UORiR
 +mgDYLiL36ydpg0cJ6mZtdo8AwDDALcTCBCxRsuIFrIfxYZ/QvNb1I0tW7XnhbtJ/Sg9mACICfv
 z7nlog/LI810wjEYeevdJbvWFHjiMW7rx6VJEh4VQVOhPKxKSIYUZ0yl0EviOeheN4NVT10I2qx
 oe4d/xL7aZ3Fgo+Gkzuv42H/y/RHgBWLPHKDkHebQ0oOexqZyM4qI9yDXLOFIhUrH7jSSB0frMF
 BaRlq1YIoQ6kIg81yuc+r9k79vL5xFBg8aYhlwGTdKE/BvevfmjWQFqlAxzKRgWHKPixX8NWbPh
 qDdqVKcPwtBx+6AdGmjB5A2f0gKJRvAs8ecaW/5CuyBw3HCYYZ0UFXsev8wOTl67jBuulXx2jRV
 3qp762Nw+j7EnyGftPlAA3AaJ6TSZUwxmBDH9kECBnybwng+vk1P69Jc6Opzer4loujpYHxgfPo
 ahWb15Y8PnXm712aq3UacaHfjXkxH5WsKGFMUE94WMM0f3qaXPQKwe//HYoadkryAt/7OPmU3mg
 Bvj2UQ5mq3TsjuLSo1guGw3dVD6SWDHC4fMjSmDDq37v7JUZecik/IawvV1Mqt6XEWdZGDQD+8G
 Kzv0vbDjgQA4ElA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_041927_369692_1691F57F 
X-CRM114-Status: GOOD (  10.75  )
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
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  |  1 +
 include/uapi/drm/drm_fourcc.h | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index b22ef86428a1..a39b9d7a5b62 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -275,6 +275,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_YVU422,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_YUV444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_YVU444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV12,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV21,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV16,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 6c786701238e..5cfc188c4e72 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -459,6 +459,16 @@ extern "C" {
 #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
 #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
 
+/*
+ * Y-only (greyscale) formats
+ *
+ * The Y-only formats are handled similarly to the YCbCr formats in the display
+ * pipeline, with the Cb and Cr implicitly neutral (0.0 in nominal values). This
+ * also means that COLOR_RANGE property applies to the Y-only formats.
+ *
+ */
+
+#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
 
 /*
  * Format Modifiers:

-- 
2.43.0


