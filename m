Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BDC1093176
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXV7U56joV0zGZ4GuoLeT4/hGzkUaDK8xurcpiEAjaM=; b=I8AeB6sSMJ/Ktc5pH+b8/f6Z/v
	mGQ/Jyg0+LIjFGcBb//3YZx/t9+PG88cXfRkFTVdZ+JHs1l1q7KJVdqgqBqPyJI5oEtKmRiVvb3Pw
	bLvwTjDf0DXeJP9Lmkv1/kdD+5cKwqsrI7VU/lEmSf1r0gn/cBkpEHrQmU2rEjlUakD+YOXNh2gh8
	M986SncW3wqFk31S+VGbb99bJmkG5ywlKfZClNP15JGcQbkc/eOTxHPqj5P9ICpOMrCiP4roL4rL3
	5A2/gGHxUFRpaICLuGGaXP+1IspEvsnLOsb8IKqwMc2xpbo39AV0l/fpHf/79cDYjFUcJqJxnCOyf
	wWQ0aXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oo9-00000003WAt-03sD;
	Wed, 25 Mar 2026 14:02:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oo2-00000003W4P-3cIG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:02:00 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BE081B98;
	Wed, 25 Mar 2026 15:00:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774447239;
	bh=XTxjhStge5b34jQfjrGGMsMID3TFrZgT3RgEqY8UjG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YMD8X8jns4uDHLzwHFu9Bm1RYZeCsAwsqIK9Fr1SSKV+yivPbXD+t/92rvRoDtJXf
	 euoUBR5Xm3Tw9zZEarpnWhhBw8wgvZHz+jfZHAnLUACysbup4uIm/jOtfn5jWtJ9MB
	 ky788Mzfvl0Dh4y2Gs3CB4N9bRKos0ytKC2LsKIY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 25 Mar 2026 16:01:28 +0200
Subject: [PATCH v9 05/11] drm/fourcc: Add DRM_FORMAT_X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-xilinx-formats-v9-5-d03b7e3752e4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1968;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=XTxjhStge5b34jQfjrGGMsMID3TFrZgT3RgEqY8UjG0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpw+rLkvL4i5CCE4QvT4u7VPQXxuNh1PtPDLv/S
 sEsSS9DIR6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCacPqywAKCRD6PaqMvJYe
 9Z0ID/sEG941XOzF9xdZxkXjDwBfDlwvu0TxDdNSQgwzslLQ1EpZMRta0nHIKwAMJemG6oEWgN5
 vN8jaizVeVcCOyTQ3guSaIX9aewDyr0AWTY+Pqp1UxC0j/GoizlGT5TsB/tH3D/R2WAu5m2ONDi
 gXwqxdkSwohEF8jf8ttrm4XnQ1EtRlAcP0cOjD14GlQjMDGdQ5ur4FlDfZHUSocuQv7Q2IYrS6H
 se+0hJGQOHNGE90cN3zD2DWfM6I7hlHBglP7Ycq/6iwUtfd36KWFoBVKgYtT7hb98R+aSIVHGTu
 /cMejTWLA57pVhsPHGlDo1qMus5T2XiKdC/5wIrFbXOGaY08XOBt7LPouof1RXXzX+HQB5wRY6V
 /HjSAWFzjwVKoYYWmHWDvywzFyqr4hir4Bzz9kODuSpyTttEmp3wU1EQyRA/xRExGgAfFRs+xTI
 4zoSISR/jN0O7IojZzRcNxPazBrJ1OS2xNp+g/IXtIxYPzlr6y3NweykIOH/Dj6LZ6c1tVw3cwX
 P2q8v9Ch117gC64E3t8BYYNyMO5qsbivJHQgrPtYuda+ZmJY3k4S1P0SwQ2haJhH1RzdjzTmIy6
 ZGbMadswitLTG82blnVsbBksRnJgr15+PaoBj5giUlYjWLvQ3eSDJkl4PaLPM6GHraRPIiDDXzV
 n5yHwO+M0gaZzEg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_070159_049594_CDC50290 
X-CRM114-Status: GOOD (  10.47  )
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
index 4fc1880603bc..de8c98b166f1 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -388,6 +388,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_XYYY2101010,	.depth = 0,  .num_planes = 1,
 		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
 		  .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_X403,		.depth = 0,  .num_planes = 3,
+		  .char_per_block = { 4, 4, 4 }, .block_w = { 3, 3, 3 }, .block_h = { 1, 1, 1 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index c6d4754ec202..385da5942716 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -402,6 +402,15 @@ extern "C" {
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


