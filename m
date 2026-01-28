Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8016FD3F09D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZbLNfHIZ29CMiiF5Knwp+rQzPvGl9fYN8jxX1s/MFE=; b=jYpiyywqtbxtXdC30z1lY/t0aV
	gm7/gupIOCKWsqTaElJ5GictIKWxcouWMZneR3CK3oCHo88Tj6Mr1fX9hxtW59Wys9RZIV/qBQipq
	X5AB6JztgfRzs0eQAMv4accIqnwVNl1xRGjbJGfx4xWYMi5e+73cBxOjmufuY3QiA63g1qIxWmPcG
	JunM9GfHRciyIuV7oKr6tvZGAPCQbV8aa71hMAh+NVNHn3Vz94WraGv08hbipWu+Yk8HT+N0FJHMs
	mwU8YfUJ9ttf4GjKaGkk+YO9qM0m8Y9PZHlE3bqhQfHGzXmn93lYDN++aVpcwJ0SsBzKtqjmdbol6
	/iIMtQWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9J3-0000000GTPg-0lIk;
	Wed, 28 Jan 2026 17:26:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Iu-0000000GTGz-1XEh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:26:09 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 404E318CB;
	Wed, 28 Jan 2026 18:25:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769621130;
	bh=jcF9TO4w0dmiNuHteMC+0VDVhFz7gX4DbHPqYH+9J6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DCeGf1+o/+Ec9AGeT2y+nBi1gIT208diP52zP1XnMFW12nezKt2YrOY+zSZabcwLv
	 Y+06V9VlJiTHmDNkjyUwMoLa0TKx2fJfTwG0muw2rSGVFUTqGT6hQQn0haCDFkoXUT
	 GBompbbnh23iTtbp7zizgklGGwxsyQVvO/n6b1Lw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 28 Jan 2026 19:25:32 +0200
Subject: [PATCH v8 07/11] drm: xlnx: zynqmp: Use drm helpers when
 calculating buffer sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-xilinx-formats-v8-7-9ea8adb70269@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
In-Reply-To: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=jcF9TO4w0dmiNuHteMC+0VDVhFz7gX4DbHPqYH+9J6g=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekalpg7ivp+318X6JUkMLTqmDtKosSJMC1QcY
 ee7K7x8YMeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGpQAKCRD6PaqMvJYe
 9dvWEACUmFHTNJ5Y+Q2Kw/P5DSmLj0mJhqwhCfBFOecBY2yl2DjOf6AMD/ggJgVmVPkw2jNdjEv
 LoaW71jK2y04REDsAtUgrqshxXod2IPM+E51zx5N9tO0gkKteqYs2ZFcRDY3a2fGJGtbibIkYFd
 jStXxCeqY6WQexvpU8LRZNsmvzmr6coTAFwnzKnuPTRz1mfN5tYpdn1pAzsOmsffMgzQUxUg2SU
 y608voUI42tNtalbQYxZhxgzAkCiLCItBfjISlqrOcK+Z5H5dR2nV7rH9D9ocgCtQlmq/Xi1g1K
 J3DlBrhqWBI0HTQPLPx0U7TgRZZH27cPgtNB5sAfywOSHM1dPfhqY+G1keXR7kgi58n+abUdO1o
 sr1EJs5SwV0jfOl6Fkzh2tsMr5FLQX6+C2haG4RySykuOqIsjLgS3cMAUHUAzuGDo94NBlkIxOy
 0I655wN4A/5bkAr8hUlbU8r5jggR4iOptPWk5gl/gNmlI7ulZ5vurDh9GU8mlW6uGsIU5Bgl+U1
 Bi+z+aQcGxqiv1NSkkp/2Xo7o5H3atxL3VcG6fVDlD71b+QcJh+EFKrxr7mINvpCaG/QKYanFHL
 rrvxm2G+IWuLx00cSUGkq07GWkq+o8VOhhJoWh3FxElRsFP9zLBZ6x2IZQG7AivJxKPPJwZn+ij
 UR1BC4BnVcGqvtA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092608_596960_11CA9375 
X-CRM114-Status: GOOD (  11.00  )
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

Use drm helpers, drm_format_info_plane_width(),
drm_format_info_plane_height() and drm_format_info_min_pitch() to
calculate sizes for the DMA.

This cleans up the code, but also makes it possible to support more
complex formats (like XV15, XV20).

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 80d1e499a18d..b9883ea2d03e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1116,16 +1116,19 @@ int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 		return 0;
 
 	for (i = 0; i < info->num_planes; i++) {
-		unsigned int width = state->crtc_w / (i ? info->hsub : 1);
-		unsigned int height = state->crtc_h / (i ? info->vsub : 1);
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
 		struct dma_async_tx_descriptor *desc;
 		dma_addr_t dma_addr;
+		unsigned int width;
+		unsigned int height;
+
+		width = drm_format_info_plane_width(info, state->crtc_w, i);
+		height = drm_format_info_plane_height(info, state->crtc_h, i);
 
 		dma_addr = drm_fb_dma_get_gem_addr(state->fb, state, i);
 
 		dma->xt.numf = height;
-		dma->sgl.size = width * info->cpp[i];
+		dma->sgl.size = drm_format_info_min_pitch(info, i, width);
 		dma->sgl.icg = state->fb->pitches[i] - dma->sgl.size;
 		dma->xt.src_start = dma_addr;
 		dma->xt.frame_size = 1;

-- 
2.43.0


