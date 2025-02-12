Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B7CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3PTd6/+dwuwHYTX2ahl261kzuhLxHI1m+Rk5N1Fcq4=; b=14b2oyc4WWtVuR95LaI0rI/hzC
	EUsfU1ONJlCedy7QavfCE4+Ps1VPJI4ZgX+Q4lDEjzffef46mtWJgezYfK90bb+ADaiRC1C1oGXkw
	Wq1h7d61QISAqhljS2rOXEoVYbh3hx4zLHKC/nlEbgiJF4ln4FTPIf0c89u8EoG0yTW2L9SB91l2R
	wFWrdeDsJCK0SZbxtijCYFEWX806S2/QajdENWwvYMqFnmEo8j+576dziSfQfXDXYWNjRyaamj7Xp
	1YEXcRfTA/Zuzb/hutCme9OccRg46THAstIlnIEyo4AC2z3ybF2eMnZRFfmOv7SP0dYEDBWcHa5wk
	MaO/lMxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEKI-00000007ncU-25aM;
	Wed, 12 Feb 2025 15:06:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEAa-00000007leZ-0Ztj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 14:56:57 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A661A198B;
	Wed, 12 Feb 2025 15:55:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739372134;
	bh=CRfYdoayFbIp4SyGxcS3wIpdPP0eZRvOi5wwLjCOvoY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qwXrG7uiJBZxam5s89XlqQmlnbU8NQUxHri5R+3c9ofN5nBOYD2PzwV03xO/7w8tA
	 8PsRXxOggaRi2cTOFTK7c6auQjSahUpZC+sXzMnz6LAv0jTZxPFFPd0cfwmZXOG9H9
	 18caTxfuz2/gWyh901DTkP4tXJuKdF1aJP4mprJA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:11 +0200
Subject: [PATCH v3 07/11] drm: xlnx: zynqmp: Use drm helpers when
 calculating buffer sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-7-90d0fe106995@ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
In-Reply-To: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=CRfYdoayFbIp4SyGxcS3wIpdPP0eZRvOi5wwLjCOvoY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnrLaq+b90zO1HRXn8B2y8d733NS7mUJvL0COyx
 U1Uf6sENn+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ6y2qgAKCRD6PaqMvJYe
 9S1WD/93TM2J0i0Ao4HnmOCzbUagRtCb3RKRhvZ5DYtZ4oIj5ma0tSlqNNHQYaodWj8P24l8hCm
 cyvalkwyBpBm6xiIkBoN7mg2bCg8pL5R2og+JjiAzyABJ9HqiU3xbEFg6lP3lrXUxjg/FMmMElR
 Mw3f2MHGEaMNyLdrn6UnRgmpjLcBqeboXhi7rUP+NW4y/6FrhFfulGCkBqUi5m4I35FJWrz4C+E
 AzybIypjcyNOz9UDK3nmF3VIDK2JGxZkMWiMbaBebcUiRL7/GKSPI1fsAz93/x3djpOLxXkEVBB
 y0TbBjkVB6ZebvKqZMiSkTcu3E2HjwvOamg7g8BSWNVSXo0P2mITZReckmYWbEIQP8M51ytaXAC
 eALAAueYbYcED/5M/6Hz7DTvPbH0HO3q190dviTtrrE0gEvZusFVzIwlwZc0HtDmah9QmOxPdfS
 qULWIE7FiMK8eA9C3fUyA9GW4QaDqN2pmA8nm4bmg/591x0mSB0N3WRNOqJ/DbDL9bQZQMe1GOR
 OA6GeWSU+QHxg3KoljtdpyAaNYUxJKifNCIvHKaE86wke6xwIinzjyXM/pl2vOay8F9BnZD+Wx1
 MYCEHgz08G2sOGrNBOCwQTSOqgEbUEgYLZcYhYTGH3rREK/bZTq9/o7Upp1usfSxqa0U2M+1Ts7
 5eqtc+9e3RLmtxw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_065656_332386_3DC9BE11 
X-CRM114-Status: GOOD (  10.67  )
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
index 80d1e499a18d..3d4ade571f0f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1116,16 +1116,18 @@ int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
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


