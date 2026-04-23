Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B85F589DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pr8GmP0GjhjkKVt0aTRW6DoLJW/JlieUUOAcmpgINiw=; b=mCGu9vVhctnRoIgSgffudqqXtt
	zPWhmBdALIGyk6V5MXEkt7/Gm/p6l1WvYombyub0Bmak0sdCHMJd2be5xiv25pwK0N2TR46l1Q5/h
	9gy5q4eYjAwF+ryoQbIxOtSiTixDOmv5eQlUZQSrZnVikLSBo5l0e8Dfu40Nzqqi4SUTuRtt7es4r
	XZXWKpgxGvUWJ891QKlBYtryvwFqv6zHoH4YhTBI4dJC82qIAowhuE7Cc8QkDLfrcCzC93E+ezwP8
	cWTN7V1Tc4Xe3TG8LP4gbRQQcXX6YCG3DBkbyniQfLc30P2mD7dzKdtm/nkT4wa9EaN3Z+OdCJlds
	tvjT5/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuwl-0000000BoW4-2bOW;
	Thu, 23 Apr 2026 14:22:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuwH-0000000BoDY-3plH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 14:22:04 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A0541A6F;
	Thu, 23 Apr 2026 16:20:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776954013;
	bh=NA2QDN5jXl9bgNq49LlPIxLS7U2YaS5SkWzlnqoNa9Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PIjNMMNRTOozk3d/U0gLAyGnlMKF0NwdXSWfvYi6uefn5lBQD0GxB/SKIsI71QsHX
	 8+uJli8C7efQ8o9VTa18kKgFEIGyiJorXDiMQLqFP9reHMb6UpHJJ94ph+6m3R9LXh
	 EXkNWIR9UPtDAGrWn5NjOhyrEy8ZiMkRfyNOctvk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 23 Apr 2026 17:21:18 +0300
Subject: [PATCH v10 07/11] drm: xlnx: zynqmp: Use drm helpers when
 calculating buffer sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-xilinx-formats-v10-7-c690c2b8ea89@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=NA2QDN5jXl9bgNq49LlPIxLS7U2YaS5SkWzlnqoNa9Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBp6ir2Bj4g+ZrNt+tR1DhVZEp8C86S4jspsDJ77
 mZJ9XIjkHuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaeoq9gAKCRD6PaqMvJYe
 9eJtD/9BrYhqLbquyN32D+rl7G20Xi9EQM7/tEfxj5txC0geZEbtIalNEttMYZmfSBM2H4FDQfo
 MqmsE4kU7lTuYACISvmBflo+X6BlF7ooO5KFE2/OAJbS+5qyJPuD0deFk7aZcKCgb7PNPHRCTlZ
 fIsrt4huhy4e/JTO4z3rClxb2DTZ5ogrggVyPGjOhl6LO80GPiNegLtlHmyBg31nAXsJW1KQDUK
 iLUmcBp/un6jzR21+l+h9tEdi85RkpU/vGpvpqzhQwQxadpxrhGK9H5RP0lBX79kd84bqFC9b2j
 KtgtUwgsoQwc2qD2oQMjvg5f7fAfz++1oY23tty/9MerqQ1RJ3OX0wZJiSDfvhQXd6Wkuu8i9rt
 /VvjT7Ll3KE6v+T9mhN7fUSdmllB0U7VNQLDrw/V5IFbREo1NxsEISwAimqLtKulxStWvyuTUSV
 o1bQCFSlso1DybscdinGVX3hKHnLttnqntydxokVg8BtKi1zllhN82wyIHTBqSf7rLqT8HMNmey
 UMVobKoHnoGQcdyjIIFZdJdVqvIuxh0yNaYZUa2TtM3ocdWh94cbSAwe9epYIkroAQdkhB/9jo/
 /8m7I5+j6D3kbqq5zmB+/dXZJLY8bGJQuOsg9yt02hHbwzK1mNEq0utIliOrxXkqkd2odE0iyGW
 MfiuFVHykXjV7Tw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_072158_210581_9AB2DFD6 
X-CRM114-Status: UNSURE (   8.99  )
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

Use drm helpers, drm_format_info_plane_width(),
drm_format_info_plane_height() and drm_format_info_min_pitch() to
calculate sizes for the DMA.

This cleans up the code, but also makes it possible to support more
complex formats (like P030, P230).

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 9a8f38230cb4..12a8d643915f 100644
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


