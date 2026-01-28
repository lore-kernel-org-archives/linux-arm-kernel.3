Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECE0D3F09F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7qhB2NbNwuvARO/LETazjSpISjk3VVtcKAoCnxIo2Q=; b=2LnFsMa83KvgtAiG10GtiLT/s5
	ZzdATbB51B75HAcNOMOmsvLqoQWTyWJmQkMAwFWKEzobZOV0ihGy5qPlx+84dDXIukWQ0wUFUu48m
	hGbh/GrCYbCKrA0VXenJLMPj6shXHOugptm2DdJ/nDUWSXVL1bgvdO53mvWycMjsyvZTP0Ue2oQEO
	7qP51Jttg8mvNPcJ/DgtAK5xg12pshPkKZhfBGhHTP1LD0V6kPxJh4fSksxW7ns7WGi5wh9hRR/OK
	oDRC4A6de/clrTzj0c1t6IS3kSl/dUYy3gfVWMU3AyoX7cEv3qiGIsaKhA7sYMpnGNAEr8dDdiUgh
	mV3iFjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Iz-0000000GTMb-2azO;
	Wed, 28 Jan 2026 17:26:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Iq-0000000GTGF-42If
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:26:08 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 575491FBC;
	Wed, 28 Jan 2026 18:25:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769621126;
	bh=CPBrLo43D5oobjFdNES++lKWPeHTSF5yifInInVgzyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hv1xNPW1XVuyxGkJfo90BLs032W3Ee/Ph8VReBl+kSYmiXa6mtlxrpVIyjAfCPvie
	 2y3WmQ1SDXx0zQ4ZUO+yN14mHg9BZRmnyT3DA8Vw9X27DeCLkptvq+yNNp04Do81Xp
	 ptr9Tgg8G7EYNTuPIOHs19WaWjcA56PfRmdtO5wk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 28 Jan 2026 19:25:28 +0200
Subject: [PATCH v8 03/11] drm/fourcc: Add DRM_FORMAT_Y8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-xilinx-formats-v8-3-9ea8adb70269@ideasonboard.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2872;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=CPBrLo43D5oobjFdNES++lKWPeHTSF5yifInInVgzyQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekajBaskN7062G6E2JXiphLfHUZn7dO6S7sMc
 Y589AvzpleJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGowAKCRD6PaqMvJYe
 9bm9EACORx8IhavHIWLnb1Rbxrtzv2sUen9MWfXUbKtxhzIUJVZ8oz77bhKf7Dp1GFYqee7QNjR
 SDT21ZNKE9wBD4jMAZjhtbyj8/q7fxq9hbu8Vat40SL0cjpgGGQ1BtCSZvDB5K6ICwe+2mv/rGr
 M5hlKXO1Z5pKJGVwWSZJI4ZL4vLFdG9qLBUVzus/GXYeacObYrKY0Gtrvn5RdN8ywOa29Nw+YPl
 h0MBNiBKRbqvYjWTvVHWqD4FwJKp3vgwdP59lgywGlX8zkKTIIagidYmO1TIfLyNRjR/EyQm3dJ
 zZ0f1SaKCwF5BOwcni+KmR74lYe04H75/OsN8Wz8O/JxgXD6V+qYV2rrSpNg7IEs8WNn4ARKj86
 oYkbaXcVsGKogeW9LbGLzZ7nPnWGHwRL9Z0WpvR88m8JIbPCyZXMz+clebAdyB9nNVBU3x2Bks3
 bAISvnwxR0nyA01KT3SdryfdRkxJIdsR5lOv5nfEPZ2V2ib5AIYbzh1DZBcKzXGAjIYLllooV04
 xMLPxVeS9945/W/N3PSBRqoCxuP0YGzTKsyajT+qZGe7DWAH+bbqdazsY0Nr4czmUxyYO5ermcw
 pW31seZkLPvNOWaynMbTCBLrDLlRECsFD1b8XLr9YeTw9SKgXDdPdPifp0xvwLLGGtJiFcziz96
 T9aqVAQ2NRW1jqw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092607_202151_ED28D5B2 
X-CRM114-Status: GOOD (  11.64  )
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

Add greyscale Y8 format.

The 8-bit greyscale format has been discussed before, and the earlier
guidance was to use DRM_FORMAT_R8, as a single-channel 8-bit pixel.

However, adding DRM_FORMAT_Y8 makes sense, we can mark it as 'is_yuv' in
the drm_format_info, and this can help the drivers handle e.g.
full/limited range. This will distinguish two single-channel formats:
R8, which is a RGB format with the same value for all components, and
Y8, which is a Y-only YCbCr format, with Cb and Cr being neutral.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index b22ef86428a1..a39b9d7a5b62 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -275,6 +275,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_YVU422,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_YUV444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_YVU444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV12,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV21,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_NV16,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 6c786701238e..e4451668499a 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -459,6 +459,15 @@ extern "C" {
 #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
 #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
 
+/*
+ * Y-only (greyscale) formats
+ *
+ * The Y-only formats are handled similarly to the YCbCr formats in the display
+ * pipeline, with the Cb and Cr implicitly neutral (0.0 in nominal values). This
+ * also means that COLOR_RANGE property applies to the Y-only formats.
+ */
+
+#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
 
 /*
  * Format Modifiers:

-- 
2.43.0


