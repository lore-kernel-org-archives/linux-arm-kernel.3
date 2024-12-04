Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA838E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exgdDonrVR2LwCxtcbRJ2e4ffwuwLMZJql3r1ltR1D8=; b=R8jFBOXfxF9qzP7G5Zm7aEXHc0
	tZ1luGuVzmEdDQRx7m1SQFzf6NmpOrMKa/5Yhf6PDNGHYba1mcTfaAu++sMu2BTxd76o+U9VRBuv/
	4R9WaoCSOoekYLjoPEt9M1hRyhbfgFBolxabQl3baIWn+Q21YISBYFvvqiQPzfAeU0ADivMNhWr1a
	v4UDaVOkEr5xzLKhuto8BeKHaORVL0tdQdlczMePYoJFgOwjAuXFe5xPjC2dC0s6+O6gBwhTsdgnL
	T9zoFKVmEbtuPr7MOA5Dqvtq67hMuNKS46oHRbYxmF/T3W2Hh6Il+s1xUCP2BREU20wTZ2UyADSRY
	eQ0eFvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIltb-0000000C5PR-2zml;
	Wed, 04 Dec 2024 09:42:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIljS-0000000C3DN-04uU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:31:44 +0000
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D15961BAE;
	Wed,  4 Dec 2024 10:31:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733304672;
	bh=vSNfl+dk45d5cm6nnQngiziPUpAD1SE0JXcPFtyqb6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hTxi8s/9pGX0RXDCw/5wUmsbDZLdcqEyGbq2h2eXYvHIuwhXnetvc+UDTJlMbLi9z
	 kvO0/Sx6VpkBORWhthm/DS9KznquwO3G4hmnZ8Mp/Hk1z2OCVfS9nyKgn5J02fXpwm
	 3BwBSoRP6Q0gStzLTzQWtKtnjS9+GM8xel3UbEGw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:08 +0200
Subject: [PATCH 08/10] drm: xlnx: zynqmp: Add support for Y8 and Y10_LE32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-8-0bf2c5147db1@ideasonboard.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
In-Reply-To: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=vSNfl+dk45d5cm6nnQngiziPUpAD1SE0JXcPFtyqb6E=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCFz7vKwL/JknjDOTrW3yKdDoVLc847EBOBYe
 fqlqXtBeuKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhcwAKCRD6PaqMvJYe
 9VFqEACObI98inSgLPDGEREQkqyBJlHdMI9Vu8S1Oj9irzsyK1xj6RQKZc6BzdeH8EnxxAMjQWn
 hn5ydfZYeY36La7UAH/xFjB+vQCgD/Y8aHXotS5BEFD7Rimhu3936ldJ+OH0rsIHNM+QS2FZj4n
 GnJMwRRiXqUfoVE4fS/XwCriSG5RtVUO/aQLUJtOrT1p3dM4Jh3MpHjFRV+EJrt9TjT+i2km55i
 il0V9bRmQUmTD+20wN4BcDb4aBGJF4vxPam5sGCcTwwdImsXMdtkXDw9xlbOJKoDsM7FMTnXg6T
 yZakjwN4i5ePrHhZU43VlL67jpIqvMCQsFk4o0tnAeigZ9I83LeIcxYRp6jbPjSmG++jT3wt+C0
 ktCspNfd325GPImrY0vhYvxLfkBzOSg5mC53H15zEEHmQ0KJJnxPx9FkZFsAPmOL1+JQGCjXczD
 m0vco/6XsEQcuV9yjbRIkbUZ+z24zBTsTZfzP8UQk6LAHAn493Q4tgK7hEg3MngzF2oNPyq2tc5
 5yyj9jk6V9w57i3OyhqbuvruA8X+YTVR8Z834itz0bZYOMa0hSknuGC8hvRCEdly/eK/Id19vb7
 fH9lPEHJV8NKBHcfzNPVtQ3BR3w13UUk4eKWi6THPQc1+eR1H9N6lkwAn1jUgiVGBxlG5CniiIC
 VZevhcWbSVN7OZw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_013142_218764_09576140 
X-CRM114-Status: GOOD (  12.69  )
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

Add support for Y8 and Y10_LE32 formats. We also need to add new csc
matrices for the y-only formats.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 3998754e367e..44cfee6a0e32 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -309,6 +309,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_Y8,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MONO,
+		.swap		= false,
+		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_Y10_LE32,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 
@@ -699,6 +709,16 @@ static const u32 csc_sdtv_to_rgb_offsets[] = {
 	0x0, 0x1800, 0x1800
 };
 
+static const u16 csc_sdtv_to_rgb_yonly_matrix[] = {
+	0x0, 0x0, 0x1000,
+	0x0, 0x0, 0x1000,
+	0x0, 0x0, 0x1000,
+};
+
+static const u32 csc_sdtv_to_rgb_yonly_offsets[] = {
+	0x1800, 0x1800, 0x0
+};
+
 /**
  * zynqmp_disp_blend_set_output_format - Set the output format of the blender
  * @disp: Display controller
@@ -848,7 +868,11 @@ static void zynqmp_disp_blend_layer_enable(struct zynqmp_disp *disp,
 				ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(layer->id),
 				val);
 
-	if (layer->drm_fmt->is_yuv) {
+	if (layer->drm_fmt->format == DRM_FORMAT_Y8 ||
+	    layer->drm_fmt->format == DRM_FORMAT_Y10_LE32) {
+		coeffs = csc_sdtv_to_rgb_yonly_matrix;
+		offsets = csc_sdtv_to_rgb_yonly_offsets;
+	} else if (layer->drm_fmt->is_yuv) {
 		coeffs = csc_sdtv_to_rgb_matrix;
 		offsets = csc_sdtv_to_rgb_offsets;
 	} else {

-- 
2.43.0


