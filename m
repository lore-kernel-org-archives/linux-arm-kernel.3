Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D0AD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhs/w4n7C6UsKMN7y5LsZwKB+2Ippd8myXz2SXsdfNE=; b=oVEZzFkmptppSToeY/cll3SA2t
	xLqmmEArJmKgCx7rvyGYYUpcrlh7M07CwIyYgRxCgEm1cFRB/lnBg5QIT/imgFW3uKPa6XIgv9a74
	TXEE+ptRZz3Y4lOCdiSoJJO/l72jz53IcJRuuBZpG9NW85FPqT6churKkEsu38lsE5a3tB0jXum8+
	7LG7xRTfIDhPde7ehpjCYn0qRqnbVMQoJ3aK5gg9yL3mc0T5LP9qvjnbOtZJMojbZZZkk1Dhg3rxN
	ss940vzS7v9Af6W5q7R96symmDhUJZ+McDAkLjLi9sLoUwpJhcgqB2m2av1GgPHGdTOEPrleZa6MJ
	j5R6pxLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2sP-00000003X0Z-2Tqy;
	Mon, 01 Dec 2025 12:19:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2sJ-00000003WuY-4BKw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 12:19:30 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B539D1980;
	Mon,  1 Dec 2025 13:17:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764591430;
	bh=HImP//WnYQGaIVnRGV8vnLGfK9wmJZI0DJI76lsYq7k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c8tJGU2yy63x70nzkL5c4gGlfIXFtNDSozR+QiaDzat4YZFXevG6NeNJ87G26ZSE5
	 c7Nb8YlUgGdP4Odz9HJp77zPLpzXkT/6gRM3Ubl5ZsyJriWiJ/lKvopjpw3qlfkAAq
	 aVNgp5P/KO28eNiSlI3zO4FZG+n2Q1YkUM0oBFcI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 01 Dec 2025 14:18:46 +0200
Subject: [PATCH v7 04/11] drm/fourcc: Add DRM_FORMAT_Y10_P32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-xilinx-formats-v7-4-1e1558adfefc@ideasonboard.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1655;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=HImP//WnYQGaIVnRGV8vnLGfK9wmJZI0DJI76lsYq7k=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpLYfD9erbPekQghNS0tqPeCOocJ4YiqmLH+AAj
 MkWhwKVrdWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaS2HwwAKCRD6PaqMvJYe
 9S7dD/91+z84gcDJGvMHs61P9yJygLCzTk1QXj0gcbcc+WH/UhbcJd72A+KhYWLuqHMoZSN5jnz
 8FbAS/S/o2xjp4lLRUtQSnIh8yQO5jJvFFQ1qT+p8gOvhPFSF7jpFKQr+B/rXxtB2Yfc9fi15IR
 oiBphfO5TIrHIMjoPG7vN9aJdnwgBJIh7k5WjSrMAcQr1WqrNuGw3tmiROdwPgTM5TrLzNLnL+i
 K19fr2zTrKq5bmYdCEw6cC+va4drNuddwLS9FVnot6MuNHmePN5vyi0+5nGkHj6gKe4Cb5nPBWw
 xwiVX0LuRu3AD9fJT3LdUpnvv8tbj1hdF4vF2Ad23jdhyc2VAls/RT2lBj7niiF/sEt7zzGqN65
 4WhqeGb4RQzD87y0MHzZj00T2UxnrG705jP/j1kcE/fa5aXnXs8PuDWVLgdA7TTvAjyMmWr6gDk
 tk0ZwyagYzMkf5zRqnXZeJCdwxTsbXT+nuGxFBlDX8j1mcbmHB2lb5ZQlISDT68vxMKTdZxd6TM
 Tjk0TEDt1Gyx5caPtpGjVrsO3S/1EW23YLi26CXf3/11kk3fNNtSlrUs3mstykqy8fWnb/9VgQK
 J1N1mFDZJYAc2FQZsvNOBd6Tw7rtqWmJg/vm+G2IScFhG3qlWicmypv/Kb0zN79xVjh5ElRaIY+
 s6pZpbxikNe3xDQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_041928_176846_36664B3C 
X-CRM114-Status: GOOD (  10.28  )
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

Add Y10_P32, a 10 bit greyscale format, with 3 pixels packed into
32-bit container.

The fourcc for the format is 'YPA4', which comes from Y - Y only, P -
packed, A - 10 (as in 0xA), 4 - 4 bytes.

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 3 +++
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index a39b9d7a5b62..0d222f6c1a30 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -388,6 +388,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
 		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
+		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 5cfc188c4e72..0fd99ae32a06 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -469,6 +469,7 @@ extern "C" {
  */
 
 #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
+#define DRM_FORMAT_Y10_P32	fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
 
 /*
  * Format Modifiers:

-- 
2.43.0


