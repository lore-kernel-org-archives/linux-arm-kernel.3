Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D921AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZbLNfHIZ29CMiiF5Knwp+rQzPvGl9fYN8jxX1s/MFE=; b=KrvcABzKyEag6amXv8IJBKVwNE
	O1L86v5aEgYxsvKqqySxVmhKzpGi6KnLB/Spl+B9Lc9Xqbc554XcVOCrbDY92n4s4IeRrks28baR8
	/dJjYz6TxOEvksicMaIKXjj1Mx3Wr3M5r1K6J46+V44a8n7S/AFNUsZJH6HypxyiQhBB8VgcwXHjN
	62cSdjFnH8oEFNB2sAgPmy2Dbq3xwBmIpTn+GOWejIlaamtyFUHuEEKym87EwTKP4uWsX689C0MRs
	D5iHsiwn4YJUZtQmCAy3X6qpkFVxjKvgXdDXlkyds9N5rl2Iq48UhkzLc2hWGAE1WT9ijcado5aq1
	SlWM7JGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IL3-0000000H9E5-2YoN;
	Fri, 25 Apr 2025 12:39:29 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Goh-0000000Gr7r-04kb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:02:00 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D5A91A5F;
	Fri, 25 Apr 2025 13:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745578915;
	bh=jcF9TO4w0dmiNuHteMC+0VDVhFz7gX4DbHPqYH+9J6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NWTZpEzMlnkVxZl3LoP70m8wzem/r8JdXxqrOxaWZEttVQH16XEAVM0/nJV/K4n6y
	 Ea6KOYP0PUZ/FoSQ+2ybwCS23W/sOSjuA9rXyRntjZVWjri3zcGHZpkoMz2RTsXun2
	 7aKMLSYVQqgVV8JPE9gVe2WaCKSCxBAAHXiJIKSI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:27 +0300
Subject: [PATCH v5 07/11] drm: xlnx: zynqmp: Use drm helpers when
 calculating buffer sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-7-c74263231630@ideasonboard.com>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
In-Reply-To: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2ucBKCGRXs3IItYKinZokjiHSFI1MqifZhIn
 FhfiDEumzmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrnAAKCRD6PaqMvJYe
 9cOOD/9yMvecnMzRXcID+kHiup5caDsmRyy+fl2n6/LS4dgSAfbmOPSdMEN2d7N7Zgspx7OKHZj
 fILokdq/5oDdtu9IYjGQDMEa2mYExbdZ6Xpov44hrDSLWn5UY/MzalP8tcd81JmSkvD91yvznvv
 ZusKjW58zHc8EdOgxsWNdgq8CUplloG+n5WFbV5EasHCmUvTfrnCI2Jmejre42sChVGp6TVO2q4
 ioKlivNj2hgYI1Zjljpr2uioCOCZOIKTybXFitFmf2bFRbT+3/2czVrDK0Z0N1IrD087nVGmcSM
 JmgClZDV5K9IWgFq5gil0pwog0lequ2aZBxzlCTAY8b5Zw9A4+ZgCeOXnJTXZbhYE9Ia+jFlCUL
 +YIZwlwIMD4S5pm8IjI13SDO73bVx5Y8Q9FR5k7ZXLOHHYDPCVABuF2/+1YMDjFZ+6PDK0/+bNm
 +dJjyaWxHLJffB5i9LTcewkLkuczrd3j26gEOPzHWf3Q2tXsRb5UZ0buSOU7aRAK57kHEGBJqSZ
 antKptt4HH6o78gtnO8hxRdIamYZpLKcXR+YgzjIC+HVGz9JNimQXKWR8MyRzXOCcEMOkoMkIFF
 lDcMy1bTiBTHtRM1Yw78wmSv132S/wpo9UXo/EFPRuRuxrgU9TRbzcntwHiD1TeQd+FeiGpk6KI
 fN9EORfMnfzgmgQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_040159_201229_358E1F6A 
X-CRM114-Status: UNSURE (   9.61  )
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


