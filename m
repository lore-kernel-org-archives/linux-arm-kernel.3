Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6525A106B53F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1gKqjIESKb07eYjSrEDEsQ8+sJxY3SQvCfx5bQPqjI=; b=EV76Y2dcNi+DUTd82RBIl3rtIn
	fKl6UfRXsW12AUWABpf2ewN6ZEimnY4pWy1qxCfDjlwtNNAUpOsmSfzWOOJkUqJ+8wLaeyTcOyZCh
	AP9MTkC7wllfs2Ics0KOq1la9K1J8hcSkCVxy/CxZ9BC8gU9xI4Ajd2vweGCW7rn97NKeWwIh7v7V
	YBRNuCyO5AgrMNO+eFxJ4p3m3r/6VBUKVmN3o2hhPUQGooh4w4QDALeb/TSzYoIWWouWn6yndQiw4
	/bJP6Istru8iLhIMdKuFfAknRhesjE8iusuHUn6sl51Sn2UbTa04Xkki2cKpLxlT/bJXA40O5WKk8
	YXeBGm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oom-00000003Wh3-09G7;
	Wed, 25 Mar 2026 14:02:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oo6-00000003W7D-3PyK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:02:04 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C61701E7A;
	Wed, 25 Mar 2026 15:00:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774447243;
	bh=JS1u+tUvofCvVSFd4SoansSSnQ5kaOnrcifXFx5nnmE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L56yRSK5LSAW72x7ziwsJlq8V3bxUl+Q9EliERJLXX8C4VaBVnOwMMUIZLNNXm9LF
	 iGpMUEYAaIgGh8mtlk9Onjsx134ShIaOY7htF72pZ/b8TTovmjPy0Zt3GZPdHRf/x0
	 wtel72Amst5+f1AJXYMwwFSzToWyZ3z8WybIZhjk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 25 Mar 2026 16:01:32 +0200
Subject: [PATCH v9 09/11] drm: xlnx: zynqmp: Add support for Y8 and
 XYYY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-xilinx-formats-v9-9-d03b7e3752e4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2157;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=JS1u+tUvofCvVSFd4SoansSSnQ5kaOnrcifXFx5nnmE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpw+rNHh2hc2H4ErbtLvFQWv0j3SL4Hapl9SQ5K
 DqfYMbQ68KJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCacPqzQAKCRD6PaqMvJYe
 9eaKD/wIu50aUSGtxqrodliSnBZosxTRfcNTCDHkaNUgWesS19AFIEfhyQRPtbPpKC7m4lkLphi
 us74wLHIHyhBae5SklY4vx20QAIiFhxwsEsC2EGZos0xRzlGkgEodgrT2KPOfYSJS3SqMvn6IJK
 HJtphlQKrc3OFRtZfCa3QJ2lly7dLCnjd21zAjkMB0dI9uK60KdtldlUk6ifZ+JeS/Lra98Wr1f
 5bMG0Kw37GNOWhNX5XUkNaexkthOfl+qCLdCiCuToe3aOpNXQ0nX33B6KkF4mUH6yd16HxNMywt
 HAdIVC6Mq+ANm5RtW3hyKnRUvyQMZZqe+shBmAVOB/58b5yKZ84AumsrnBmLuGuLI7jS7OYxOxy
 wQSg5TC3aVzmA7sLKuo0z+fh6/yNWFg8/TgrGXOY78A75nmZgH5Ajedil63b75oGHalzUWkRzb7
 Ghbtnoc3fS5kOd8DZhg0QzSjOY7e0+1Jf7TXD76QgFuDDUnbm5aL8+oRQ5i3NEWzGIuiYGQX565
 KgqkHo4Bvbo1bKb8JyK3IP5ZbcPpf/y03s22KNm9g41r3nZzLfX5b3GRWDH2IxMVWvotkwV1GCc
 HGqApk3L8AI2vhxVTjfW2eT11RGfgAnS9DNUw/7EOAqMjFSkWRxGIRCYQpcRloH7A+KTCBYkkBE
 qjLZjrkicr9kqUA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_070203_008836_A2C561E4 
X-CRM114-Status: GOOD (  13.65  )
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

Add support for Y8 and XYYY2101010 formats. We also need to add new csc
matrices for these y-only formats.

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 40deca67b83b..99bc68481020 100644
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
+		.drm_fmt	= DRM_FORMAT_XYYY2101010,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 
@@ -697,6 +707,17 @@ static const u32 csc_sdtv_to_rgb_offsets[] = {
 	0x0, 0x1800, 0x1800
 };
 
+/* In Y-only mode the single Y channel is on the third column  */
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
@@ -846,7 +867,11 @@ static void zynqmp_disp_blend_layer_enable(struct zynqmp_disp *disp,
 				ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(layer->id),
 				val);
 
-	if (layer->drm_fmt->is_yuv) {
+	if (layer->drm_fmt->format == DRM_FORMAT_Y8 ||
+	    layer->drm_fmt->format == DRM_FORMAT_XYYY2101010) {
+		coeffs = csc_sdtv_to_rgb_yonly_matrix;
+		offsets = csc_sdtv_to_rgb_yonly_offsets;
+	} else if (layer->drm_fmt->is_yuv) {
 		coeffs = csc_sdtv_to_rgb_matrix;
 		offsets = csc_sdtv_to_rgb_offsets;
 	} else {

-- 
2.43.0


