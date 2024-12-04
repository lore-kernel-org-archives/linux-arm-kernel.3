Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57C1E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOOyGUbDzicb1G/j9ogjHVcDlERLbZ/tgzdiqB6jZvg=; b=UNGNFcxumnTDR2t5l7Qf8vZG4H
	UeaHfXIEDRIp2CHQuF0Y8zRZuYVyVBs376oWwqgMjyG8q/df6FKxWa8wmBrEM6PGLMvoQa8dU/Te3
	0tAunnm9poFubTHqgqKQohQvEncdwETyq02N7pOf7ajzU53nKIPTw3YF8IjRXzYLV4BHZqObUbpsA
	A7VkRMw9j22Z43HneIcK/4dsObC85Iai447YqsS1sU43alJR++j9XOLN+K+Lf5hvN0io+Hpf3EqIa
	ghRxhoi9evSaKJ1MxMJCsv09xzFXLfgl6qO0yppOkx8rAOU6nFBaJmIhLvQZUULEbEUh7lhbN9ewn
	Scp2ey5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIloi-0000000C4Nu-2g1s;
	Wed, 04 Dec 2024 09:37:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIljP-0000000C3A4-3sZy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:31:41 +0000
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0FA9D04;
	Wed,  4 Dec 2024 10:31:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733304667;
	bh=peMIGVKca9OHRX4eHaZ33k92czm9ZLEx61OIc/CzyAk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sgkh/hbo+1oQIdM7sK+v4w9DWkMvUlJOm5YfM2/JhuozEP90D+c9zQzVHpWvwGnkG
	 wT73i/ojeSG7lJCVyMezvwOG5t0/K63AfKUpq05bjBV7BD7rEHAiIM+0170uLblAN4
	 vDEPmRVrUxAxjLVu4eE3xXa9e7YTtWPv8Qv4GI30=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:02 +0200
Subject: [PATCH 02/10] drm/fourcc: Add DRM_FORMAT_XV15/XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-2-0bf2c5147db1@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2152;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=peMIGVKca9OHRX4eHaZ33k92czm9ZLEx61OIc/CzyAk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCFxDMJy/fau9ZhZE6C1fmlBiltK0edBoJ3UU
 mM5THZMKxSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhcQAKCRD6PaqMvJYe
 9eqsD/9nwEgBVcelDlJSTUQjZ+yFPXnwbDTC1zSiPTYqJSH6NMwyISuymVOOHH9ulimx5u5ITQ9
 6PtkqsFdw29eI84O5okM/Aq/I7Rwa8m05UAbInBIUANVMojgImxJH77ylHRft/F+X9X6+CWPd1i
 m+2Cf5ZCygODIC+5G/E+0ZZ6xKRy4do6+ikLcHYSL4OHWtNiJOsaCgWZn5/D2SpA6eKQvNbIIMp
 sv4eSg5Jgrwzu0814tEVy2sDIry675eTsQTWayxhvO/z2i8QQakZPmnrbO771avLCru0rEOi+ir
 VU9gh7ualCSu0yktTJwqBpVwqKbmCaaOzNHjQC+kQoPgkcnYBiK/3S3jOZAjE6Um4viGLpgMgYl
 nhWMA7N0ozdbpTjciO0Q8+52U5KG2sGc+GFgIu0klYkcYtVl1VFeA0GvfeWNv1jsQWcNp2DpGDN
 9T+JrV2s9Ba5Jc/BDuyudSvJp3nKgavTEm3bdKlI4XX1xvBBjmAL2Be9xLyYSuYwBjLjdn8vtT7
 43e4Tf4eCEn+vfSZwbUMYFT/Y0eCsem42NkeI2OV8GExervcGbwA5T/rX946ol8SD+Zt8r9ID48
 J1XwD9DexvMzQZypdjLwDsICiWbcQSmt8au/PRoC1bCg4Ci1foMRBgU0HYsXOiAXYmWuxERPzkr
 f0ORg1uKcan3L0A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_013140_094596_0BA0505A 
X-CRM114-Status: GOOD (  10.69  )
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

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 8 ++++++++
 include/uapi/drm/drm_fourcc.h | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index e84c4ed6928c..adb2d44630ee 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -318,6 +318,14 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
 		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 2, .is_yuv = true},
+		{ .format = DRM_FORMAT_XV15,		.depth = 0,
+		  .num_planes = 2, .char_per_block = { 4, 8, 0 },
+		  .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
+		  .vsub = 2, .is_yuv = true },
+		{ .format = DRM_FORMAT_XV20,		.depth = 0,
+		  .num_planes = 2, .char_per_block = { 4, 8, 0 },
+		  .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
+		  .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 78abd819fd62..2a00adcfb1ff 100644
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


