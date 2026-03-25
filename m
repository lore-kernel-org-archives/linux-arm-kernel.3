Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA40106B53F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQWNY1Roa9VV0GmFP55IK/tRrEifXG9SR4xIv8lWxUw=; b=bT0NXDy5PV6G79GA2waXYatF4h
	HFTv27u9elI/gHpNOnXGUxVDMuAh4MKDhn6rqTd0GRf8o/fiEzrEPg2EbE/U38VW3Di0LjQAy2VM4
	4NSPUJ0HmktdfMPxC3q2ilAqdfGgdlVW8Gm0nWkCOCxGBDwEiLQYqO9J+8WsQBZDpiHScRQHzgWj3
	mqf4DP1kGDhT0Uo/JH1kqa+HU8IRG9OMVSzZO7RfBUhAy0RMN+OkAW58fUORaWHUzpJ5ahMENBpWP
	qrMyJUCr8qytXMo0J0m4yrFj3HeXW12M7HR1w6gAxY4pFUYjE+zc6C/4yKAR0P0omFCt57iqFTQ0H
	d3sTfvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oo8-00000003WAB-22rk;
	Wed, 25 Mar 2026 14:02:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oo1-00000003W3X-3CXY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:01:58 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53EE41AFB;
	Wed, 25 Mar 2026 15:00:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774447238;
	bh=F4e5S91ocplixZoNAfDJXTT7U1gjwaHFm05RbfJejIE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E92HjjHh3EYtSMNe456TRY2NPo5IM8Xr+AfVvyBd7sM8lrZCottJsK5voEI9F1CP5
	 Tq8fS/taoIkWT70obqGgyMrDvOVDDpiXZiW5EUDdjjgq7Bd+KN84UoWu/FiWlceJDZ
	 JAkKOmuo6sWcMx0XVZhDAIAaTwsl/3y4nYyXrvLA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 25 Mar 2026 16:01:27 +0200
Subject: [PATCH v9 04/11] drm/fourcc: Add DRM_FORMAT_XYYY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-xilinx-formats-v9-4-d03b7e3752e4@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=F4e5S91ocplixZoNAfDJXTT7U1gjwaHFm05RbfJejIE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpw+rLDkK4GZv6qdVUILSoy7ef23eEcmpIv0CA4
 zcJ7V9YktuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCacPqywAKCRD6PaqMvJYe
 9UmdEACiNuok0wQ2tlTKJc4utD7jV/38FPETi8aCvTTfmGH+Rf/RSQuzNVC+aWBQN12MjEyAKUi
 FQOc1kMBmqrPVKskH85VoZXhjko6wruPBk2IEQ0FV7AOC66ikumjDyYopQQ+M9uYSyPgZDV41ar
 +RSqewILN89Gl5bdRHJ2MEBOA64UcCrU13aT1wdy9D2jkKIZEYykt+RSO9qvZuVHy+jy/9Sikr2
 vewahpVguwP6AaYNTwbomxRNnz/pJUIO8HvAR2fcYYEn+k61Lt/Hr5TC1euh0JfOv7hTryZZE1j
 7EHXvVNMbP38dojzxMJ20Feemmhfru9iyI/4htvmWDvHYeroNnYdX4asg6NmTTFJEUvTOsIfskn
 qUIPwehvcMLvFxvzpsaeg4JCyOlyD3vhaNGT4bs09OS9fX+Q2qSKdr3dpbMAxT6tWsDnH5zkmuB
 +xJP2VJSpPVeaZHQ3IU2z4w/q8+wKQ5mlIj8BBDBDcgvMSkRFNN4YmGwFpbMA52Nv9SYZ/sT7LQ
 rlrlfOTumXZ4AsFz8QMS9+wQMlAjTTLUmAUkewiLzzhLNY4BYjVOC2m96m2UpW6WAUxqE/NtLVa
 dma4dXv4eWyxHCkqrnMXvPs12S6kfBlKwhaL3zPsn2Jqc6hKGeC49FzXSnvqvpagZARBZR4WNOM
 NQ0qW97hRndCnQw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_070157_946278_AFE0ED98 
X-CRM114-Status: GOOD (  11.36  )
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

Add XYYY2101010 ("YPA4"), a 10 bit greyscale format, with 3 pixels
packed into 32-bit container, and two bits of padding.

The fourcc for the format is 'YPA4', which comes from Y - Y only, P -
packed, A - 10 (as in 0xA), 4 - 4 bytes.

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 3 +++
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index a8ea1f3660cb..4fc1880603bc 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -385,6 +385,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
 		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_XYYY2101010,	.depth = 0,  .num_planes = 1,
+		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 02205ec4a75a..c6d4754ec202 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -467,6 +467,7 @@ extern "C" {
  */
 
 #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
+#define DRM_FORMAT_XYYY2101010	fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
 
 /*
  * Format Modifiers:

-- 
2.43.0


