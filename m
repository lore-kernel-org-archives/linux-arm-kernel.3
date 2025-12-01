Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AD2D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5tiusaovgOh42WQxyxO5AVwt+kC7aucycTDUbxnK/k=; b=2kAroExweJPdFCdRl4D5wDesxN
	ZuiBlIcPJ7L1a70PgDJYf2Sf904VFk2749R0uF//OLps//nGia6DLb5xkTuNt8tUhDIky44veTK7w
	ddbKOSiETI2qEyS6Y+L+X2Ovjkbb8UVSShYvjNfnXOAgE36QBK2syHuIIVnsPwr7G4jIxXWO94D+w
	OF8ziGIKyUS8lDT55MXDwFmQXZxKydAauoZKGGbCuC7TWHLA3/zzDIpPRfg+vzmlXyFA1sd6zejam
	k+OjdR5mFuNC0Ppy6HaKIqAvNZvBwDk7omAMO67NelNxZZhhwplzX2J0nWFOOn0pjE3tL6pvK82f1
	2gShsjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2sP-00000003X0M-1EH7;
	Mon, 01 Dec 2025 12:19:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2sJ-00000003WuI-0iFU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 12:19:29 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE53F1857;
	Mon,  1 Dec 2025 13:17:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764591428;
	bh=ByjBVUei+ODI9OwRRSMJhh8nY+tr2DfcyXbhauCknhU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I27oFRn44TnEFbYgDXPEJcV0rvPvks6KvMMsDk5sa0cwbn8LYbL5nN8Gd1t+0GgC8
	 THaA+UQWR6KJqBL9vZ+pDkW6GWhI53AeK2TINd5NXJsQ3vMVrZHPaNRdx2C9cgBQ12
	 0errFXmV6DXEHQR2rt1X6beb0JB/J978KM/Idbzc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 01 Dec 2025 14:18:44 +0200
Subject: [PATCH v7 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-xilinx-formats-v7-2-1e1558adfefc@ideasonboard.com>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
In-Reply-To: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2251;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ByjBVUei+ODI9OwRRSMJhh8nY+tr2DfcyXbhauCknhU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpLYfCKMP7YbbSN1PJCnhkAr7BsGY6TGUJqNhPe
 x2UvyE1c4GJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaS2HwgAKCRD6PaqMvJYe
 9QsgD/9PlUHZV4eNlUJEU4INjX/3QZq+p3FzEj9nnX5emxr0Z4U8erT3/9ZIwALzl/92Kn/K7QO
 x7QTNdDUteu1MoW6JKuQ3TBYvwzMO9vfHgKPwQi5Zq8QM/0sSUR/7f7RqnSwyGXLmS415aGa0gX
 sgKL/qiotPq4nKiedHk0wQL8kdqMX62hTzeveS+VZ/dcIEtDBrLAEgbKuArR93uygJ3Gp2k6MIN
 bp+g3AvBMXJ1fytHSWlDaXdBxIkSHwRmCkfkyA94QCXcyb6uDIEWAsu9HhDlB1dqmg7sYxVqrRR
 DqxSvEPSqbqiPVu7eqaQ74PnzR/rFPrSRU73R0Gz6sbjmsYQUQydqwhENvmcbWM0VLt6PfEZxtE
 TPBEMFMd9mRcnVKZu2BCq8WfRcXsJrdyVesVn40e9sAeadkFi3IughO17f0K7K/ww+8KIhaPX+Q
 CLrsSwproLz41rfXGLPrwavdchqWRs6gC3kiHuFYGRjpsM3U0yoQTuVPfN5WweSDUbaZKygoGnq
 4owx+0l0ivVU8/rBkEf/OnvEY5Qn3O21lJuDKQp5Z9DxFmEaShGfK4DSJFtikbTSWsrYhOsCvbU
 FnGUpIg0yJLszWs+68tUBF05AQhYTYhpC2xNneSPMQzOUA37HsISg18jtrhhpr9Uja8oL0KVoMi
 Tzq4hzhP7Ls+0dw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_041927_369682_B478A5AF 
X-CRM114-Status: GOOD (  10.32  )
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


