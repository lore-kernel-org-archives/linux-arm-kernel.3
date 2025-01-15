Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEA1C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ekvc+8cenCQ1dET9iIyU3+lCvf2vHaYLTQpU/JOCA8k=; b=FQgGqItDLFEomlni7PaCozkn+8
	xXmrmOwWGtcPx88cupiI7BsnvBQdNn63u7vbkFZdS5dddcytC56b/oydbzyWlgOxClNkaYSo9YmWv
	vnz8qGc2QcmJ8V/OgxyjNbIHPQJR63mmAr+IJeZMiR0B/vt5Dn/acaZZ+wHddaWzGUFmU/0fsfwU9
	2xSls6WMh2yQtrm15UMUhbTFl+jzKQTGbnwJy5ZwuEdEiBMSlEVShwnXfPyQipDB+cGjmj6Yl9xiz
	VeIeATPNE926orzxnDaICnUhrgRo3FyYd/6r8EnKxkINhIRs3A5H3YGKJ4aI6CvlOW754ogPUijX8
	Q0g/NMcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzSE-0000000BFTm-3WCO;
	Wed, 15 Jan 2025 09:12:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzJj-0000000BDQ6-0V2E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 09:04:04 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D75193AE0;
	Wed, 15 Jan 2025 10:03:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736931784;
	bh=U6QTUkIufzSv6Der1HCIiREWkOAz1oZ9ohmvRY4oz/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qbWIXVxqfI0rSpLfg9LhT8n2wol33AGBrBsRxYM4+ALBmQgVNyxjMaAf580Ndg8dp
	 Oko2E380nMyDNLAlquADJNZehoDCGzjzNDxs+ohVfVdKL0k+5sZWfBFxEFReVumauS
	 vU0sQeTkb+FngsSxYmc0/K6+2nL2CmqRsya22jdY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 15 Jan 2025 11:03:35 +0200
Subject: [PATCH v2 06/10] drm: xlnx: zynqmp: Use drm helpers when
 calculating buffer sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-xilinx-formats-v2-6-160327ca652a@ideasonboard.com>
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
In-Reply-To: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=U6QTUkIufzSv6Der1HCIiREWkOAz1oZ9ohmvRY4oz/M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnh3n61oQAc0u1Ou7DXiuRvHRa07pTwm8/OOF+5
 ybQ1ACqjZuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4d5+gAKCRD6PaqMvJYe
 9fMND/9xLlGCe1UCk64c66UReZZHQ1XVpQKfwWM0n7zWqRfUyo5j/LjlwihD2hvvVU+rlrAQhh0
 M8LjxtXq/yrqj0mTPJEdIhW5LZkUns0q/KH3GNIlMM7FqB4pVoYP/d5vZ5VNyIA/8dgUUpHikbk
 YIYkBNCbhrH+5+Tr0au0qVe7qIeenLV3EvV4Zu8U+RtfdRF0IoNJ1U8INRVOgK2EHxCMknGW38r
 rSzqzPLwQhpfWkq46PuZpBg/4fR3RQ75P8W6KoicmbF9JViF++QFtEmCJzUuM8Wm56jGw6rKhK5
 NrCehVppd0+2Um7qQeDs2HDIpd/iOP8HvWXqH94LJEF2RsOEg94FV0vFPdHge8igbNUkmACDZhl
 HPo301jB0S/K/Erpep5jUi8RlfFEN1eiyTm7N/CXDU2XBc3v5d26/V3h2c8RU7uSN9VSo9YWJio
 gzVRWf4VQwj+FUdMEf6Fgr+wFy2tkE2Jig/R1GmrMfexS56Of6BGcNvmufP3qrfS4GS/7gakbma
 wO2C8m5zL/zZYJ5ZGco4Gcwd522nVT55NKrVzrWvlt7dZ2zhHq2kH9xjy6OEavBUi21iCg11Pl+
 LHjJ1y12orpkUWJtw41xa1Ozi/JG4gcYifRrP8Nz9+YXSA+1ZbismkBxDhsS36hDInxMlJaSHR7
 e+hS2PX152nftAg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_010403_306834_9796AAA5 
X-CRM114-Status: GOOD (  11.37  )
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

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 9368acf56eaf..57221575cbd6 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1154,16 +1154,18 @@ int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 		return 0;
 
 	for (i = 0; i < info->num_planes; i++) {
-		unsigned int width = state->crtc_w / (i ? info->hsub : 1);
-		unsigned int height = state->crtc_h / (i ? info->vsub : 1);
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
 		struct dma_async_tx_descriptor *desc;
+		unsigned int width, height;
 		dma_addr_t dma_addr;
 
+		width = drm_format_info_plane_width(info, state->crtc_w, i);
+		height = drm_format_info_plane_height(info, state->crtc_h, i);
+
 		dma_addr = drm_fb_dma_get_gem_addr(state->fb, state, i);
 
 		dma->xt.numf = height;
-		dma->sgl.size = width * info->cpp[i];
+		dma->sgl.size = drm_format_info_min_pitch(info, i, width);
 		dma->sgl.icg = state->fb->pitches[i] - dma->sgl.size;
 		dma->xt.src_start = dma_addr;
 		dma->xt.frame_size = 1;

-- 
2.43.0


