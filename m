Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9944D3F083
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFvR7nUxs5e/qXSwPVySD6LuENrl0L11OHSChHK2PG8=; b=zCsWhsojWsYfdmDrsiVQWYyIRQ
	hyv5RTQn8A2EnR9yfuDlp6bEV25VtKpv5y3tH8jJkovhlD26BIsVKKc3/qjCJ6tQ7liDnUO+C1Ory
	5QdX5cjtXfWvwNISrbkyYrDhPxv52sYB1A+hZrNgwupTjWyzuUgURTMqDF7WS364vRuuFcaRUSDZn
	YdSw/5N5f4qD6xhAKroyPgd37l80lGZ6N0y5wVCN/LSh6N8um0z09v2we7e+E2Km+GEcpIl2XIWFV
	F03+vMemAP2AuG3pHYazrZ2F3lXvgbAtZU95aS/qxMW8FP/So5apvmRNPhUmTdWFFgWMow5OZ8NC8
	6br71hIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Iy-0000000GTLb-3zaO;
	Wed, 28 Jan 2026 17:26:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Ip-0000000GTFf-3hXo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:26:07 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D9AB1F37;
	Wed, 28 Jan 2026 18:25:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769621125;
	bh=zo3E+kZdWqIorpMyEBd9Er+LXVGU2QxSaPw3bUA8z9g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BbozAYvaDCYltBtMTqJkOQ5d88nFHAuDH0wbASfPtawlQjjk4AWBc5xMzl215pk41
	 C/Ww6oNju4kE1u3VxoMLa1/lCCs9umAvCjiPPA7LbqsKw/TPLBCVA4cMeUDdrt7UCu
	 C3Xteq+61djcLTGR+dqxNA9XVIgUfxj/PkIb8kJg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 28 Jan 2026 19:25:27 +0200
Subject: [PATCH v8 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-xilinx-formats-v8-2-9ea8adb70269@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
In-Reply-To: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2318;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=zo3E+kZdWqIorpMyEBd9Er+LXVGU2QxSaPw3bUA8z9g=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekajx8Vv7DIfy5TM8alkWA1fG2Rtp5f13EG0w
 63Cp72K3ROJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGowAKCRD6PaqMvJYe
 9ZzWD/9/cmtvts0zs40zA8R1KXnDT9IU61ZO+T2iZn9fDjKPRjGlBsmUZndVgK3FyzeYePPcorH
 Q8NzUohiS4LiddqRTNTZD8Jf04T4WRSB6xZ5S4SMWt88Y19BNJ7dhwfFGaB4vXeQqgGe0d93XtX
 5sUM9LXBp8wvWewzxIluyKgHIKLAM0rDp5srO7zjnRPOzZk5PDbh+S7bt+JJObjsADf7hxeMeDl
 6DDvjiFnhbnsMyLpPefM8eTZVbdq9FcqsDhJrGpv172o1UUGD8iDYRhf7ldWcTUiZdjmNMmikwn
 L2ncVG36MfJGzf3y2UA5UljT9RQA9aYaTmwZudWxqPMRs/F6Lq8wPIA3zFbRDhBlyyc5+FP9Ge8
 V2GHYSplVB6WwK/OJqHmKVpm4fVaDDEYBgLqdtfEaDsHnLfDXwQ2Ts++lhyh+KFNoIVwnihncNS
 45ZaD9BFK1lPRQMnmOkxcgRHFc/Fa1HqTxzTNsl4e1RIgqX2wQKROP29p+zEU5o1lZw0CFQg4bq
 Q0uu8YSGRV6gwNiyM+v20yEAGQPVMLJVA2I3yGt6brhrwqI9VqdPJA+Hf7ezk9wbq41z/0Zv1uM
 uQ9Eavja1ByVKhh9fBjZ3SYX/LbIT5Xhx75Z3UpuizOjIXnTNxFy0T8TuoFcGlF3CHrwb80rtTj
 xlSf/zNMNxrRm1A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092604_063401_CFF6DE04 
X-CRM114-Status: GOOD (  10.84  )
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
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 6 ++++++
 include/uapi/drm/drm_fourcc.h | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index e662aea9d105..b22ef86428a1 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -381,6 +381,12 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_S416,            .depth = 0,  .num_planes = 3,
 		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
 		  .hsub = 1, .vsub = 1, .is_yuv = true},
+		{ .format = DRM_FORMAT_XV15,		.depth = 0,  .num_planes = 2,
+		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
+		  .hsub = 2, .vsub = 2, .is_yuv = true },
+		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
+		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
+		  .hsub = 2, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e527b24bd824..6c786701238e 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -322,6 +322,14 @@ extern "C" {
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


