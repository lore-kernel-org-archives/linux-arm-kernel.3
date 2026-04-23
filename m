Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B9BF589DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 14:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNyAefoTSUoApaDZ6nA6oDzV/WSD33AfPf5BQZbC7fg=; b=qwTxNFhcY4PKqIj2/5gfnwqzRm
	5xPCkAiHAdEvpHyC7qwkOaT90o0JJ4kvgfVneiH7YMxIqL2frMxPQhmApvP0LCcBURGmf3GfBjp0l
	y5FWMWDFJUeQF0Z/5+0atc/udMpyGcweYX2FGUQuacAq5y1C8vxuXS8GgX7m7qy/NnM+DHKlomasQ
	Iwn+5dZqhNUW4awhhq6v1BKzwndJRSxjifIWnWdGJ2/tVPusM+ZzQP92Kzv/5rHD3oeq2WdSt6s0E
	v7pob46uj4gKMlOE0zXWEniek/WwQzzHhAn/5zITbIVoPwsoyL68uRjPg6GJRwt6TY/gv+y7bG2pe
	SjkTVM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuwH-0000000BoDc-2iLd;
	Thu, 23 Apr 2026 14:21:57 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuwB-0000000BoC0-26AD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 14:21:56 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 977AC9A4;
	Thu, 23 Apr 2026 16:20:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776954007;
	bh=qsLARDIVnkaD/ICi7soozFniWWJmCvAqHDdDTOWdWNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SH8WWtfxYgJIOmCBHZeDq6CKA0QNMeHsHVHtaHNioucGtgF0nYR5PPIpyu8C5Cq7n
	 g1YlCQdjAVEQE938F8lzysjjjDpyTnswPOu5CLw9utjvBC1HIBevkCJ8Dax0JWRI/2
	 fdjio/tr30Th1oB3e6tVLpFU1IYC6+MR1v0HkHto=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 23 Apr 2026 17:21:12 +0300
Subject: [PATCH v10 01/11] drm/fourcc: Add warning for bad bpp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-xilinx-formats-v10-1-c690c2b8ea89@ideasonboard.com>
References: <20260423-xilinx-formats-v10-0-c690c2b8ea89@ideasonboard.com>
In-Reply-To: <20260423-xilinx-formats-v10-0-c690c2b8ea89@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=qsLARDIVnkaD/ICi7soozFniWWJmCvAqHDdDTOWdWNc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBp6ir02WndvzaoJu9fVHl03maWhZDEGbC6j3mLR
 QkhABJgBzeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaeoq9AAKCRD6PaqMvJYe
 9SIgD/9Pd6FQKFMsX4tEdU/iPPznMxPeNc3lJQSCoeDlE2x6iS5F4CbFvjewkCTmfG2ncFxMOld
 K5GGNDl9aJOEGsHZ+n1jroBIFV/l7DBcQ+aPlmIrn1AfPRH85DpwH3v0iurNIexBocnCG2/J/yp
 sq1TPgoBZDY6BbzO5fSMhLtw7eJyqXnjHVCb2BB5xz4QgYCiWenJn8JTMl2ST2/CsLTRoBQfIBY
 hE4c7V9wUYeZP9lppLqk3Bb94RpBrZDQsXtPjA3WAbEmG/Ed0G/iMa4acEWK5BG0kMbqLjogp2i
 OQ4M8Y9w96PHcLN9cepSOJZCvk6AaCRYvcWCKInKUST0c+nSn6YhqAXMJXJtCwkC/tjWBRhXbkn
 DcKuCWvVxl1W6KAB+VMoyi6FZEfoCLFHxqpWSNvMcePmLovecJi7/Tpe3G5cnymiMyCJRCpvN5x
 0BMI/1avkmPRYnFgXk3J6VA0fH7LHqHY/psSEGdAFR6btXL0cA41dxHEHUyD51VZTHhXE4UUISu
 PcHofQTqI2AyGpwANXqORqUD/6Uc0z2+wCXmNfNGk2iYZhuOZmOqJmMiOeczg0asJk0rfSzzyyh
 1jaK633LPo4DWfu6UYKrPyWevm539oH81rcoUZHE35Yp91Ml6ODzvZeBoUUCF/ISrAMZzNRBtwc
 Ka50JNd1GuzanLg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_072151_688999_D36063D1 
X-CRM114-Status: GOOD (  10.29  )
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

drm_format_info_bpp() cannot be used for formats which do not have an
integer bits-per-pixel in a pixel block.

E.g. DRM_FORMAT_P030's plane 0 has three 10-bit pixels (Y components),
and two padding bits, in a 4 byte block. That is 10.666... bits per
pixel when considering the whole 4 byte block, which is what
drm_format_info_bpp() does. Thus a driver that supports such formats
cannot use drm_format_info_bpp(),

It is a driver bug if this happens, but so handle wrong calls by
printing a warning and returning 0.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index e0d533611040..e662aea9d105 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -491,12 +491,20 @@ EXPORT_SYMBOL(drm_format_info_block_height);
  */
 unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
 {
+	unsigned int block_size;
+
 	if (!info || plane < 0 || plane >= info->num_planes)
 		return 0;
 
-	return info->char_per_block[plane] * 8 /
-	       (drm_format_info_block_width(info, plane) *
-		drm_format_info_block_height(info, plane));
+	block_size = drm_format_info_block_width(info, plane) *
+		     drm_format_info_block_height(info, plane);
+
+	if (info->char_per_block[plane] * 8 % block_size) {
+		pr_warn("unable to return an integer bpp\n");
+		return 0;
+	}
+
+	return info->char_per_block[plane] * 8 / block_size;
 }
 EXPORT_SYMBOL(drm_format_info_bpp);
 

-- 
2.43.0


