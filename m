Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885B31093168
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTXynabUS46hZfZT/a+oY6SDoieInGHw+2HSO82tENo=; b=1NjKTOU14PSubEs74d/To9uIFQ
	qXFYbuQCmQJSpqkRygEoMJA2cmKgat6J7oK9mOJ/WP8cNqLxK2dkzx8NSDuepva9IK5vLvbhSEE8H
	9a07mTqkEFvNU4Gs0IgFP04NY6DsfNZrdfVBTSdz7nDvJwY7nM9flHMq3v2QzJVnbw9JTrwLc6YlD
	5H/0MoaX4XItGv575kZ43E33bbA7l2dJH86ZH/+r4QHC+tS8biLzIP1aelVDoTp7M0arKnlrqYLGh
	sVzaRR84rEJ8DVa5Amh4pSsJUmVa2+SlCmunoAyNhT5Cfe7rFlfBwVU394LFHqxzfgPDZJgqWRFOY
	XGLnnB4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oo8-00000003W9X-0EVy;
	Wed, 25 Mar 2026 14:02:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oo1-00000003W3N-0lOm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:01:58 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26B4B1ADE;
	Wed, 25 Mar 2026 15:00:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774447237;
	bh=nCrTvG2jfseeZ/eRmUeub8cMM55Js0Xo68tYrLSNyU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lTrq/akrZ/cDvcHxIsphDGr1xlspwy4KQlGhnpeYZjrHA+vqHaMtAZm0UVn47eYlb
	 oA249rla4McqX1KFp23MTowg4cvKYva33wdd547VJZ53zJhzIu1VE+XvLFmZhoLr07
	 YbYaY3nfPo1Zx97u9uO9o53VJpF/mEiU6WgypR0o=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 25 Mar 2026 16:01:26 +0200
Subject: [PATCH v9 03/11] drm/fourcc: Add DRM_FORMAT_Y8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-xilinx-formats-v9-3-d03b7e3752e4@ideasonboard.com>
References: <20260325-xilinx-formats-v9-0-d03b7e3752e4@ideasonboard.com>
In-Reply-To: <20260325-xilinx-formats-v9-0-d03b7e3752e4@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2939;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=nCrTvG2jfseeZ/eRmUeub8cMM55Js0Xo68tYrLSNyU0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpw+rKOZh6y/kojehxYsu1HWilOVqtDOI1zCHIm
 kRARLOgjRmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCacPqygAKCRD6PaqMvJYe
 9QGZEACQYzCy2nGRUT8yKGRzbuIC710UE8KODVctb7tXpLIm9grU6PfgDgIHuWwjs7z4Yo7Hp3B
 W849Je5MugW+xUqymZ6V/E184laVE98/MWU1kd9ZJX14uvVPQB/NavXhSwpt33cWiu2NUub3nKD
 UySvT9jOzNVI3j3CzUnlaTDySz51PrqopzSuaqiRHGGe2KeIggG05yP3zQGfBUcHMBR+eKxQffM
 UTG6D7gyE8QiHfvotyP1mJR4qnCLJcg8+lyMmE5MGYO4qsAbqcLRR/nMShbyK4aIoET91XAcaGk
 Uuey92Im3rx4zd5IIGEhRmRRAGoisaAtk44jBacwOkJL0vMjo4h4lmgZZ0c22pwE1nTRYYsCCEs
 DubTIgqCJZhipcMj2Fnscs2k/Dpg+kJNFJ/VvWeFnPKiQH3o0uWXFAWys5n0ddK5/HRqP4HQXS+
 6FVw2RMfd/TrUMZ1EQJh4uCIyEYLwUTIgPk3cw4F6VqEQAfouUi3feE1ZPIR+Z23EVVmOaq3P4X
 87aYXUfOs5ebjIF7YRXSTiAuecNgNNO7KODYfVF+q+whV6un0v0O0gQIenJ10NARum8WfIVIgzQ
 3+y87oPEreV8BbTzfUwqG9gxpLSe3a5OCuL9M5M2/UCAxntYrIPuRYIkVLfiwEtDhukP+CbBE7+
 A0KExLNkmQthvpA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_070157_365456_C324FD7A 
X-CRM114-Status: GOOD (  11.95  )
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

The 8-bit greyscale format has been discussed before, and the earlier
guidance was to use DRM_FORMAT_R8, as a single-channel 8-bit pixel.

However, adding DRM_FORMAT_Y8 makes sense, we can mark it as 'is_yuv' in
the drm_format_info, and this can help the drivers handle e.g.
full/limited range. This will distinguish two single-channel formats:
R8, which is a RGB format with the same value for all components, and
Y8, which is a Y-only YCbCr format, with Cb and Cr being neutral.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 4fd37226b647..a8ea1f3660cb 100644
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
index 10cc13bdb495..02205ec4a75a 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -458,6 +458,15 @@ extern "C" {
 #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
 #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
 
+/*
+ * Y-only (greyscale) formats
+ *
+ * The Y-only formats are handled similarly to the YCbCr formats in the display
+ * pipeline, with the Cb and Cr implicitly neutral (0.0 in nominal values). This
+ * also means that COLOR_RANGE property applies to the Y-only formats.
+ */
+
+#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
 
 /*
  * Format Modifiers:

-- 
2.43.0


