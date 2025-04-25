Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31913C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUop0QF/iRWJA9Lj00GvVJqB/dIFO/MfgodVz28qKrI=; b=1r29FOXvbi9NkfcEyu4AOaOB/j
	VcUPXhcxCRo0PpdoCUMzeTpTxBmePF9WsLlxeLL8DT8pibOYpfNrxYyIiDrRLlbY+G6R3nLuVUCrw
	JUtx11uXU5IhlistSkKBPsz9/jYpfIDEmMvW3cqsiTvL2Nx1AEBNJLblwLOEOJmRYBpu/YUzvkVnM
	czjMTJEk4tUY9PDM+vhAIBKXJzkPX+cALtMMwXAP5xY8iyej8eCYra/kWrbqZHT8+9SzDMJwyXMOL
	h4/Mb5zKyeeyhV6uGWMnRWpbr8PazVgJUdlCr91e6DttBnDLODWAIsxmbxnmWOuM5Rc8cUeZW73r4
	QmwxvjCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IOj-0000000H9jY-032Y;
	Fri, 25 Apr 2025 12:43:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Goi-0000000Gr8m-1vpe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:02:02 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AA8182E;
	Fri, 25 Apr 2025 13:01:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745578916;
	bh=1CuJY4hGwE84SAOCBlZRb945jT4TJiAFMYrzRssZsd4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MNe55MzAq8wmJCMrnxwaOZ/UJmlq1K8SwgitFJ0MqoDpZ7ABMoJSSzlc1Agtfyrmw
	 PFR9JycTNDEZKeBxS6kkcP/Lvpt6eJvKcpoygMooTCleWEc9uWTjYot3NDn7zSxpn7
	 HVzPuapRnpdZ4W5+dIsAo45cj8CoYDWFPOToIHoo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:29 +0300
Subject: [PATCH v5 09/11] drm: xlnx: zynqmp: Add support for Y8 and Y10_P32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-9-c74263231630@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1957;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=1CuJY4hGwE84SAOCBlZRb945jT4TJiAFMYrzRssZsd4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2ucI9Pj7KChTyK2e0k4imtAkJxhm7GReG99Q
 N3FjcKt6+SJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrnAAKCRD6PaqMvJYe
 9aFpD/9aFvmVQ3r+m0MJuG5X7yhrlhqqSLAAoBhY87qr4uiiEHLm0mVo2bznVeu/lzQcT54wuC6
 cbKenTXdMkNDGNx90a0QdLCW6if4gvirHWKiZi6bSrtFBDjdsu05y59S0NeJlxGihVS5jY0wioA
 2LlOiTWHGSBlL1X4+4NPxqsM5Koemv3HhXjY/I3eeyMq2N0ToR6thqFihOyG814B22ADmqwjvUc
 88KFZp9NPsL4mmNkkKmZTUaH/hK+tuk7NB48Sy4F9OPjPsuBkujnoY5Vg4B4IRk6ZIiVUK3pxOY
 VgIdan10n5LQSmWKcbvHQ9lfvPJvuqC7wIpDw1NphbUaZ+XRxuX5JL4+I4IGIldcLj1aXI7oRBh
 X+iWEG4ol/SyqpRjj0EYv/DmDoWqhTGoSpuoyLQGEX/5bD33Z7vfUhwzzgg6ygcn3ZVg/Tu10kr
 K5LttNkbJ3JBNcPitq6NqDj/lvUXnSTjWsAHP4VG9krFqaazIK18GPL0MoRyNq0JEG2wP4zVWcc
 t/8QbjjfBIUZyfX8dPo6DPOJWXjOR1oSmm7NV0wxxOI6GwIB65G7VYvRRT9GITHuiyKTWnEM9mG
 51QtoHRHTy2ZnTchDf6fZyEywC0oGPlcZBYkSfckXqo9mIFh3zKpoYMVcWY628MflE33sa1flin
 IlyNn6iRej7SaBg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_040200_642513_CB0E0BA6 
X-CRM114-Status: GOOD (  11.59  )
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

Add support for Y8 and Y10_P32 formats. We also need to add new csc
matrices for the y-only formats.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 1dc77f2e4262..fe111fa8cc13 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -307,6 +307,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_Y8,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MONO,
+		.swap		= false,
+		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_Y10_P32,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 
@@ -697,6 +707,16 @@ static const u32 csc_sdtv_to_rgb_offsets[] = {
 	0x0, 0x1800, 0x1800
 };
 
+static const u16 csc_sdtv_to_rgb_yonly_matrix[] = {
+	0x0, 0x0, 0x1000,
+	0x0, 0x0, 0x1000,
+	0x0, 0x0, 0x1000,
+};
+
+static const u32 csc_sdtv_to_rgb_yonly_offsets[] = {
+	0x0, 0x0, 0x0
+};
+
 /**
  * zynqmp_disp_blend_set_output_format - Set the output format of the blender
  * @disp: Display controller
@@ -846,7 +866,11 @@ static void zynqmp_disp_blend_layer_enable(struct zynqmp_disp *disp,
 				ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(layer->id),
 				val);
 
-	if (layer->drm_fmt->is_yuv) {
+	if (layer->drm_fmt->format == DRM_FORMAT_Y8 ||
+	    layer->drm_fmt->format == DRM_FORMAT_Y10_P32) {
+		coeffs = csc_sdtv_to_rgb_yonly_matrix;
+		offsets = csc_sdtv_to_rgb_yonly_offsets;
+	} else if (layer->drm_fmt->is_yuv) {
 		coeffs = csc_sdtv_to_rgb_matrix;
 		offsets = csc_sdtv_to_rgb_offsets;
 	} else {

-- 
2.43.0


