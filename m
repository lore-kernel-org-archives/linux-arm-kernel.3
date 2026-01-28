Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB61D3F09E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CuDGZHK5CtOScFypiBWg/wi7VNebeFYxNQMtPRK8l7A=; b=PJwtyYRWkDHqv6ociiTL4bKuJp
	s9cwuoLDkm4/rm9rASMLcFcm41Y4R4FSNCoF55cY9bGTW/U0fyCiu0hGIAyYoosDmnT9RpcU3eoWX
	JBtpUl9ia3esMDH7m6l+Cb20L9t5UDwSCe9dXm4Br82qLQBBaWSrD5Z0DXtZFXWqhhSq+3pDd3o2m
	6U7bXI2oIXLfCqH+p0xLMxuO3zfhIiWBsCvIMtwtEkZOKXcHYAkTpaeyGHEfYtmOHKE8ys1OdN/QJ
	wK4CM5tjpaLqpUPLml6gG5S5G9V8PIKi9IMEVPZu6PPH5ciCrkM19zr1YAhoe6p97DYotlrTDTxpR
	d6jD3/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Iz-0000000GTN8-44cV;
	Wed, 28 Jan 2026 17:26:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Is-0000000GTGn-1lHF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:26:09 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 602B427F9;
	Wed, 28 Jan 2026 18:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769621128;
	bh=4yQvF7uGMOBAlizxTtjnxyb7djV1HGOZ3S+Pd6CULxY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ddY3mdJNw4pP5lYM7SeehpGLwPYy3mclypui8UGy4RyGkrWgZC21ptYpk2NkRAqXP
	 WWvo2kkDViXrBMMnNTWpwNodziszLVMjvUX0DdtQSvV2Wt21/qys2/qS/S+N/N84tA
	 vBBNwF5KFxpfsu2XEtyTPmDYdv8avE4gSzzew/yo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 28 Jan 2026 19:25:30 +0200
Subject: [PATCH v8 05/11] drm/fourcc: Add DRM_FORMAT_X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-xilinx-formats-v8-5-9ea8adb70269@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1965;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=4yQvF7uGMOBAlizxTtjnxyb7djV1HGOZ3S+Pd6CULxY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekakVNnWz8BZNnetpQ0zxeE17pBoi5m2o8q/p
 aBsmfEthgOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGpAAKCRD6PaqMvJYe
 9Z33D/4+aI2aB6PBj+zdrJX4wrm2xfiC8XRUnsb/Or+AGJH7LvDXHrTwqn92QGdjFlbuDqcE0Fh
 kf3nyASI/z+9jD5AV3kEY0dsOyXK9V1zVpJfLDLayfYXOozXyoCGvkauADPkuyUr4WyrkpO9FRz
 pHjTnf91ZlOgpNAThr6gUMI9iri/3/3J+QICyWFi2eULHi16wq86AcLoqcCCgidf1W3HXGW0FQl
 j28f2t7WgEYmxaqgRZHdAREE8L6BYMF85TEHSj9iZior3yQqE1jyJ1/5Mlmc1kMrhw5Uxq8Tf8V
 lVr2TrLxjf0cD+F038I8zCOxRgCr9V3kRPkf0zs7bHGsNg+19OIMvPeKt0Sy4UN1mMqndwc4t39
 09W7MB57eVnSifn3oHC//+r09vMQEsI5gqP984tbwlz5C+EMGyTduTtarK4j+64N4laTxOXxu36
 U64ON0r0QigLB/ZmpEg7XsAMRdoODkeP2meA46olxHnlGw5iv1oLD7e/xJQgcd4D4ChYc2PhqqY
 mX+ObewVEsia0mtkLBdOAbwx3Sb6BJwxYFaJFmwtPTIb9RRI6WDrA6aju1olEgdMWtuZZBOIljF
 2PYSiLkx20TzhfRLs2dgXozXImH269/7pL+lDV7Q36XVORhDTUPBoKCvGH5oEAb5Wi01w8hJFvE
 bn1uo8eDVdr2CdA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092607_132745_5F161748 
X-CRM114-Status: GOOD (  10.16  )
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

Add X403, a 3 plane 10 bits per component non-subsampled YCbCr format.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 3 +++
 include/uapi/drm/drm_fourcc.h | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 0d222f6c1a30..ab643dedd6d4 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -391,6 +391,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
 		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
 		  .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_X403,		.depth = 0,  .num_planes = 3,
+		  .char_per_block = { 4, 4, 4 }, .block_w = { 3, 3, 3 }, .block_h = { 1, 1, 1 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index bf6a41462af5..0128398b7936 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -403,6 +403,15 @@ extern "C" {
  */
 #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
 
+/*
+ * 3 plane non-subsampled (444) YCbCr
+ * 10 bpc, 30 bits per sample image data in a single contiguous buffer.
+ * index 0: Y plane,  [31:0] x:Y2:Y1:Y0    [2:10:10:10] little endian
+ * index 1: Cb plane, [31:0] x:Cb2:Cb1:Cb0 [2:10:10:10] little endian
+ * index 2: Cr plane, [31:0] x:Cr2:Cr1:Cr0 [2:10:10:10] little endian
+ */
+#define DRM_FORMAT_X403		fourcc_code('X', '4', '0', '3')
+
 /*
  * 3 plane YCbCr LSB aligned
  * In order to use these formats in a similar fashion to MSB aligned ones

-- 
2.43.0


