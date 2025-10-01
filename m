Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F2ACCA476
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ad48S9H4lO2/wExsylDJTwnnRJAf0G74T3Y/5zNYEas=; b=gQJJ+OWFnUxsIF3OYBQUOGeHFj
	RHdnI78WgihUOXYJSklIUeEUrPSff9QRT3DGtzTZ7CoDpsXbwi16YJCijAJArTaX1+Lv0xogtmcAg
	9LGMCXnPLzm6TgyyFrWOpEQRynAez1k+5q9Dsg86N1HsTvYhB0f3SKTYC5XI9hGa3kQK1xOYfXdSR
	KRtwH2NpXoQgZvP06MrKTzrKy9S1xkF30o7ZcivRnYHzW2EywsRO3zhsjn8Ov8RV4G/MFzcCh3tpC
	tcJJO7snmBnDEICNQyzY+PlN1LhCFjrGQjy9ZDRHowbkz4X2dQPkSNlDGZkC8lo5ZGf0uKmvpymQw
	Tf+tae6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wnF-00000007zrl-4B25;
	Wed, 01 Oct 2025 13:22:53 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wnD-00000007zp7-055N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 13:22:52 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89B3ABCA;
	Wed,  1 Oct 2025 15:21:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759324880;
	bh=uIGQvyZwk+SENa1rKilXdvCrak68avgX0mLHz7Whqjs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xyl9dMFeNqNijshnI628IsAxhBWEN/8NKEQj9jx/4fB+AFeZOLJUDRT0A4BB002/x
	 Ufob8gkD4xxlLRu3STmKEi3USvbPCjzHLmMbYwLxtKRNrISFMXhsPBwA2sbsB7oVEc
	 T9ifdLgZ+rJ60t6l8UPxk4xpsenplEJI+fP/Qqhs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Oct 2025 16:22:15 +0300
Subject: [PATCH v6 03/11] drm/fourcc: Add DRM_FORMAT_Y8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-xilinx-formats-v6-3-014b076b542a@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2389;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=uIGQvyZwk+SENa1rKilXdvCrak68avgX0mLHz7Whqjs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBo3SshYRcGKlRly9F/Rzom0aKceYfC2slnUQzmf
 wS7VEDVX1aJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaN0rIQAKCRD6PaqMvJYe
 9YiZD/94m6ljg9nQKaW0OHIfxd74e1ULPRxy8WK8G6PxotcOC4qSKXGTPDN/BhgPYzWg0Wc9Agq
 tB9/4XkpqC15eIVmKYacZDBaxl1CIJN0QoY2JdSF2SCjMH3csY0ccP71K8ZEUIzFdsUoybk7s/E
 Q6NQ54uGtGPryrux2RulX8D4FKggEFmL0PFrSbKKcgV3UJF+B31h5IVzzWSLnZjdZC8jzOwA0r9
 OvBMuTd035L7UL31Mv3HTMj//t0Q74y5zfunuxHAwKUAvZYH2xg2bt1KGMpu206X4l+KFCAM4fd
 rctl46xYbr+RLp/EreK9pRegln2L3PsEbaSyZT7XMyE8zPheI/JN1Ds+PzjGDMwqYZJmBvlXu5w
 7ed7iXZB7NmGA2nmnWvKlDGq2BNlZtjHL8ui6cY8yLbJGpir69ofa3RCjq7koQlKJSoIAsp1HmT
 TXHzI74d7UPU250mI/Qju6dZic9mTb1WM4nb33CKWLkx8p1DEJ0Dr8l2H7GOw37LEnxTEtNRUew
 xyAvMP4d9VxWCkISVu/K6I2527Cp1h8ZTK1/6tOc4s61KRTOU9x4/ovd2BlLhznnd/Ehrs+FnRz
 RkRo1wtR94quhzyHVQ9ZvU0SGQJquaFs7LBq8cqfoRLv640H+zIop+fSLcPwBrj79miZvnE25Nt
 Nj1wDwpRYNxMiHg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_062251_198571_65025D75 
X-CRM114-Status: GOOD (  10.30  )
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
index 2ba8808fe0d2..a08f900ea2c3 100644
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


