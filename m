Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE86C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 13:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZbLNfHIZ29CMiiF5Knwp+rQzPvGl9fYN8jxX1s/MFE=; b=DPNMrd3eRJ4zm94Hh11CzV3WJp
	YyIxJl0rrR82kEy7FgMXaAibXc+yrn9xGFl/Q0xioDxkLELF2/6tMHRJE2ytfaVSrrwSybUlVC0EP
	Ag/ls9SQEx8/FSFlcpoxxvMqVeKelFvOBhONqPUbHrzB+jtHyW6/b2eWfbJ/F42U4Ox8D0Lk5hipE
	RQfY0pQMKZf3RMhwEpzQ8SxKFBrQjaFbR0ge6cZkVtarl+m2dcu7nlcKONNLOc4bsVxiOzZcAaiCW
	4cRORXcxnKQcbXJ9EBaCBieW+x2fm+c+2m8iSoH21IifvoQQBTfVW2JxWKz+NXXdvuglr9yG8fLNy
	gRHehPWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQwm-00000008aIg-2500;
	Wed, 26 Mar 2025 13:37:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQj6-00000008YAw-2Fus
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:23:25 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14C4D3A4;
	Wed, 26 Mar 2025 14:21:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742995295;
	bh=jcF9TO4w0dmiNuHteMC+0VDVhFz7gX4DbHPqYH+9J6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WLTTIzNAdhu7DvJDB50Hue+//7gx//fikESz3rs93klbq4pgA7qcVUhpTkdHIH6IY
	 gZE3ExDVChGdN1Bb6apRqxnD/8vo22uqnH6Sx3TPgzaqeTbXqoCBgDVzJPmM5WmLBj
	 LMpwMZ8GeVFKOQY4txrrnJiV+ucB2sQ4qwfOwmC4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:50 +0200
Subject: [PATCH v4 07/11] drm: xlnx: zynqmp: Use drm helpers when
 calculating buffer sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-7-322a300c6d72@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=jcF9TO4w0dmiNuHteMC+0VDVhFz7gX4DbHPqYH+9J6g=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//CxwjQCxfCSYBd/57M8nhf1B6TSoA1vIgAw
 KG3PG88lXqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wgAKCRD6PaqMvJYe
 9cVeD/0d/pGBJTsHz/I3Ndq6vUJ4NHw057fP6nYmZPy1bX2FjRSjMzjBlUmqNcyQV1GkzfDm26L
 QI+HUNM/djIm7TQ2lgKi64TEw78vTLXCM6FKAWy0o4LBdgiJHoQlrb5MvzAnkCKaYhwiLBBTnMJ
 wk5ZtduxQ8JHWs0boUb9aZGKgtbW6UH9g0dxpU2SloU4uDHEwGiMlkHlDJuzQcs1uJse2NJWhFU
 ia+iJ2ogOhVL8h5tvdMa0aT3EQ1FBUtY8rU1KqvtwZgl9fuJQWGc2Un17+Wc4VUlkuqEY/v1HCi
 EI6Si+Th/pZ3uouFOL6MwIM5CBiacAghwqU//hjugrZ0Dj47p1zsgPfiAWADTdJAwpXZiKf6H/E
 LHKtBXXSvGFwVOFTkfscjaoUyI2fimViuxy9NmPE2LYjHfhiIwybxu8EG1NDGe5H4fkCTMhlyi+
 Zwwe8oNcizdS2bKZnLtXRbasyYnd37ew+Ey/jVndJbHwK+gR91LqYWrYJp6aPFW9hX85APL5lCk
 6z1e7aud/ISe1VXpSP/c5Cg6hcRnHtgyXAEp+qRqKhx5dEU/MOnLyukq8rVdueEnaPN326g4d6o
 2xLw9/8iXg/ciW7VAMVEVK9/uA8KX5CXTO6c7zYKgwTr9y3k/HHbC+n8kZ+F2CHBGf2znq+lF1D
 bhTfL90pN0YOiIQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_062324_718981_3C98F69F 
X-CRM114-Status: GOOD (  10.77  )
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


