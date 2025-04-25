Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C79C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+Nv/rRfP5/WaLinMBHbFXKsWiRGcLC7CTDd+t4OfI8=; b=OpFIUTTMTM7yzFs67+aLuAGkJt
	a4pxtrtN4MbXH3DBhq5BUP+kPHcaGKgKXA6WT8eVi2rZHMrh8/9Q6vB/lcADx0SZEFvM//OZD3m1J
	GK4NYDkxNdVPyAtLlMNDZLSMoNfJKa1izi3oEvZN9RiJh1hZ602H6NjRFB+cLbUgTzCsarxCgRIjT
	PERcaq8Pwkmn46DnqVZH6WM8IeVb4UGgWOrnHdJoZCd5X0oeXxBYuesouc1XIbr6BWX8Rkcb2bv+W
	xNGWabe3HHZ2ORS6QXBfh6rupyX0oO38ZrIyhtzEvAh4zJwudXCZWS9ECA3rnP0CDdWfSMDIwYcwf
	P2jvNoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IBu-0000000H81F-0olI;
	Fri, 25 Apr 2025 12:30:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Goe-0000000Gr5p-3fLE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:01:58 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88CD3EE4;
	Fri, 25 Apr 2025 13:01:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745578910;
	bh=oWB+k3YdN2oGtIP+eNrRjj58cvMvE9xAoBG8JrtVz78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hu1v1AAFBQMoIzLemdfDc3aRjzIZbO9lK/UIuuflMtpMnhHIUzrqaleFxg3oA0Y8W
	 +3fTzADH5mVjLVsHuTLZW/ZSR8q8esUjt99YCTBiQdSLUXC98qRO65g/8Ao0zmOOXp
	 A874qRwEX47rRlDa+ipm6oIN4sIfvSjYeUysS1LQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:22 +0300
Subject: [PATCH v5 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-2-c74263231630@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2201;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=oWB+k3YdN2oGtIP+eNrRjj58cvMvE9xAoBG8JrtVz78=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2uanCWWVL7wd5T9RWP070XzWhAE4usJENsQW
 yGHlDEqRdqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrmgAKCRD6PaqMvJYe
 9bxhEACeXgFP/xyYSgrm+03Z3utF9MuJsIZkv5seiN0mA7+VeYSDx1Cs+6hFFjnKTYpvr1M4eIA
 LNLCMijWiBsKuN+/KGGcu0Kxt70dSnoqmDEVar+PmkfAOagwfmRMjj/fFbH4Fb/1zhptCFXm0r1
 Bo+HA/adtkJhJmO1KuxZM3WQ3/YYWtHq6rM4V6iHt06O9KfSHG3lyHkgHsAFHUZoTyJiO60UKpF
 9H3ClbNZlEGVQvMvkWzWgZPSHdV+dIPRuJlu++uls2MKUXX7W5KW7tekqrKjL5H49/xaQtnCeYM
 P2zZyeF5iIYr3H2bB4qI5VLdb1JZR0h9cL0vdGDckJlOmiB3AvN8NwJ4YxXFyNtmMWFILmEHI+R
 USMocSWmA7E2zbqIj+JDFkVWmlwu/nFBEvv3djXMdJ9y8dT/WVCrEqXdKSPJdyqLlt6gx9R7/IO
 GIZg4mwKWORW76xi5UNHpShgE1/eIVLrjC5mUWEv4XzQeT6a3tejdmT4ELEHhDFu68rHnhkAIQt
 sO9z5JA20HSLBsjRG6tstSCbFzlGCm3aiaHq9ITpajH2+nPqe3VHcnIEkGvoLvjk6uOrAm4AREp
 kQTkjoc+9LGayDdmpcpnflOQgDWXDIJHKfzqlGUyjpmkQO5OkmGXJIZMwBJLE+cz9JfFd998OLN
 SDm2FMORZnn6tug==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_040157_052329_571F3495 
X-CRM114-Status: UNSURE (   9.12  )
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

Add two new pixel formats:

DRM_FORMAT_XV15 ("XV15")
DRM_FORMAT_XV20 ("XV20")

The formats are 2 plane 10 bit per component YCbCr, with the XV15 2x2
subsampled whereas XV20 is 2x1 subsampled.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 6 ++++++
 include/uapi/drm/drm_fourcc.h | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 2f5781f5dcda..e101d1b99aeb 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -346,6 +346,12 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
 		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 2, .is_yuv = true},
+		{ .format = DRM_FORMAT_XV15,		.depth = 0,  .num_planes = 2,
+		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
+		  .hsub = 2, .vsub = 2, .is_yuv = true },
+		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
+		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
+		  .hsub = 2, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 81202a50dc9e..1247b814bd66 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -304,6 +304,14 @@ extern "C" {
 #define DRM_FORMAT_RGB565_A8	fourcc_code('R', '5', 'A', '8')
 #define DRM_FORMAT_BGR565_A8	fourcc_code('B', '5', 'A', '8')
 
+/*
+ * 2 plane 10 bit per component YCrCb
+ * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
+ * index 1 = Cb:Cr plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 2:10:10:10:2:10:10:10 little endian
+ */
+#define DRM_FORMAT_XV15		fourcc_code('X', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane 2:10:10:10 */
+#define DRM_FORMAT_XV20		fourcc_code('X', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane 2:10:10:10 */
+
 /*
  * 2 plane YCbCr
  * index 0 = Y plane, [7:0] Y

-- 
2.43.0


