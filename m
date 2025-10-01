Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4737CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 13:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fp91bgckX5opTMoXkbnEP1gmriWzlWKg6n7hKz4/hQY=; b=0F4TWu+Hnme8pd1/2vlPWp916P
	IKTDsj4pJnNqjGFw6qs2eFM5NnHeRqYCnln3JINYo5ni6cSJCVdACgtnUzRgG70ON50+3TQ/Y3MRQ
	9P1RyDqM0Kqbji5GOI65ZDX7et+Jedg0iBBuvhq85ZAh7xQYTCTtAh6IyDD6Kav1dAaHMLAIYDFqB
	PjJ/NxKeSZ0S1MjERQ36hziUr5lLwSSfUFMFwfUNruOad7cFTx23qeAJ0xBnOudLNZWwYd1nNBBup
	L0eWw4OFH1U/oWuE3+onG9sHjfiwWitn8XWV02SqahU+bp7EyrJJ50vYdqJu5+EAHw+d/xh5TZxj3
	15LmZ7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wnN-0000000805z-1bmj;
	Wed, 01 Oct 2025 13:23:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wnI-00000007zu9-2jhY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 13:22:58 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 959454C7;
	Wed,  1 Oct 2025 15:21:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759324886;
	bh=L1FSsg0Qh6Izmf4vGGUqKbG48MvEYOAEvR+4KJGxUuI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BbhDktVdmHON1E6NAYBiK0dPvJU1KNiKI9TF5dJRCx71ng9Uh0lE4TxR9Qjbzc+k8
	 IQWTazpubUEAUDOW9vAF5AW9PJPyNjJRTXb6UuH4wRc86scfx1+7LSn7IoyQ2jeh7f
	 3eLzayiDvprb3LX6cSud/oohDJf7XUhusN5jeTN8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Oct 2025 16:22:21 +0300
Subject: [PATCH v6 09/11] drm: xlnx: zynqmp: Add support for Y8 and Y10_P32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-xilinx-formats-v6-9-014b076b542a@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=L1FSsg0Qh6Izmf4vGGUqKbG48MvEYOAEvR+4KJGxUuI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBo3SsjieDuSmOYZfypptmav0LGYhOsi8XuLBO9U
 khfKq1hKa2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaN0rIwAKCRD6PaqMvJYe
 9cVeD/9CzY0gSF8fKQvL23OQQMUYKeTRoA/WEW7EbOR9pZsosDEAKtbjczTL/xtJJp3sKFfj4Pc
 PM5YAMWB+tlMNZoYoLYLpPOZz4NZDr8U17qp0SazKdEIkFOnB7ZeU5mQOZbE2PI/QeqZEmWnAT6
 m3Vhlp6VMtUgncxnllo3farKKcO3fLpzeqVq+lVVjC5ciu9LPPupLHVewaA3mv0ggFP4vlfLKB2
 vVjDX9hOvdaAdhoykYVM2uxVEY6ftfzYqx6tAj6Cs9291PDe/innnFcT03Ly9YTna4M9AOLKDfo
 QZyX/vgxdxMXMxMKny93ayFHB8LXp9FHYg1FE85bNaqI7K3AGwLvuiVlmBwekpCIp6ckE/HGKAl
 icu968VGh4tpsa2eUhwfVoJR0X7rNMbtJ5Om3s5efaCG8N3faIfelJcZJWbO5ALwgxtThxWBbyB
 r+Kg3B5SkWkLa3ZaFOuZ3N1U8a5lR6gFZZ4rMpir4pY1zpSorKwaWPerLtK8IKWE8zH24tljjAk
 FGusiUBviqh/dRhrrZy15JIxTg5BY4c68sdePLZ7jSBk0W9pRejcgbLy8x05FikSCHCXxKpMe/F
 Ez4cWMwzg2NahPxzcnE6pp6oygBLU5J+oVg3ABynPsYx8Eda4/APW2EDmPpMI3/loBlJ9Fsj4li
 gOAAu5T3bqP3uNg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_062256_898504_00C1592B 
X-CRM114-Status: GOOD (  11.73  )
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

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
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


