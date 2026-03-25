Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C113106B53F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6EfbF46x7FRK8KyeP3/fNmqBfcgWGSTFVYtHOnQwjQ=; b=gSibwLFJpTXsj6hxOCPoRWcf8v
	Y7sXGDbYGvDxh7sqrRXqExhhU0Y9UVVUwerR4azYgIWvwUAyDX1Y4i3B/RaKEAOyT7eYko2HRh7dk
	YUm9ANwP7m/IG0ZMPhRMddnoxkYGieq9pxWrLnXcO//LLQdBRsM3Yx9EEKGOD2BlpMEbu00biLO/n
	aABF8jt43kTtyWoSP+pDjeAewxJ1uoQc8jtGVTQIC08reVVKIHSeOStYE4zimxgyVV3x+NzcG0zNv
	2YpcoFWK7sNDh8jNRuLByrIqTlgqgvYOD+Uc6Pu1yjUj+OzxRsKfC9oO416GzZfdpiE4iZouxjWP7
	dOHZSqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OoA-00000003WCj-01yV;
	Wed, 25 Mar 2026 14:02:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oo4-00000003W5o-2haR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:02:01 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98FB91BCF;
	Wed, 25 Mar 2026 15:00:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774447241;
	bh=z0ohKrl3nNbmQTLz1wlnzqyZg5t58xltjjEsw+ctQ5I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QF0d4g8Kh3BPE6L2eXkONe+b8r2Rte/T6Dszu5QsrAqshNc+P4ne0FbAdQivpQTXg
	 pVGC9dKYZ9Sf49m+yUyZW2qTp3RHKT4EbAO87sQfLX6Jh/qiwNBgH94Em2xgfBEGAt
	 m7IVyUk1SnG93ZkxBBlVD3KLS5BmTH0d/Z/q5Hu4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 25 Mar 2026 16:01:30 +0200
Subject: [PATCH v9 07/11] drm: xlnx: zynqmp: Use drm helpers when
 calculating buffer sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-xilinx-formats-v9-7-d03b7e3752e4@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=z0ohKrl3nNbmQTLz1wlnzqyZg5t58xltjjEsw+ctQ5I=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpw+rM1t8SmQCwqK8q+2874g4y6W+UFEHPA5hLY
 P1NTp9GrruJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCacPqzAAKCRD6PaqMvJYe
 9eeDEACjFTftnIo4/vHE+Zbd/vinVkVUNXpCS2jTkFIphNpxKMEFHsw7tW07kBC3+PW1UIz513A
 HLXt3o2mABa2ycziWgJfIsVDzbO2nKSPakHWbExsms2XRQ567n4dZQC3y92nRX0pcI3U+GQsPbC
 I/KGUItD4iqGJcAuZUaA3Cn7GtbM2Ln+XeGFpdpdqNq3TlFa9ZX7dfcaL1JV43ZBiKlOzGfwR4k
 SVLndy8Jg/nAuIPwI95nQQufCjTvgsyqOzLZuofGU93kloYDGSDX4E3U25yKRbM2pRbccNxj+/R
 RSI9rvkcNLX0OLT+WSYTfePHO3TUXNziuxVd3EOgGcQc5Zbkn5hXar1FGDRpW2u/4rynhKe7rhn
 6/7ie2yQZoRICLxCQYYbA2ayWBjGOuTehWshn7VfhHvviCY2vh6Iej+t9h79wi8OhHocxnnymk3
 tUVh3QW2WWTOYspyZaGkjpfjhIWEGpBr5QAZa5b2WwlzDmVhlxHVbg66k3mE4fq24kCEcm/Y8gv
 yA9Efs8Fj7DluezJKBic7LrzOkmFvJUOEh17JRc7JwRnrNPJcZ98Hj94t0dp+p9NUCyVJi8Ss29
 sYi3nvJzSpxERRAYpKzzlsIePpGy1x/3rfFnkJEL6q3nu63/y3m0TaeNcBgEVEIWwbnqueDWAYo
 a6+4lwMinVAQ2wA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_070200_841727_4063BB0A 
X-CRM114-Status: GOOD (  11.31  )
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
complex formats (like P030, XV20).

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


