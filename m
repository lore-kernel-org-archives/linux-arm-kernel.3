Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EE9C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 13:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWsor/C79vX2lqfqhT/7CwfzK8jhXxwsWKHr1+2cLa4=; b=ei+e3IG6P3vt4qiSHTFHXSlEos
	nIbNimow3BgZaF8YPmwIUCLA3PhoRzF+Knifc2ZaorGzfHPKHCGh8iiiIy/jS3V9nXp5xxvkUCLhT
	7YY6gNqxC8w41K3B63gbsN0ed8k7hsb5nw42alM1ER1QLJ/b6FUdx82xOithl1WQYBrGjP+3REhqw
	ZaXp2BbjRW8GiQSX9wO6V+7bwTK7PlA46ZqwZoN+5HgDAu0DXvpdi12q7lna0hWxAuj2sw5yyuykL
	36Jm8AtZAuh6+e/PXWUPDVwVke5FAjmeOpLBk+86KGPRsNzXRvnUjALelCdgdkrDAM80VoPLTBj+8
	jFWRBxrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQv3-00000008a4u-3aZ6;
	Wed, 26 Mar 2025 13:35:45 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQj5-00000008YAX-2fZy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:23:24 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2ECE5158E;
	Wed, 26 Mar 2025 14:21:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742995294;
	bh=Kkv02RY+uC5gb+rCcgZRwQbhycaoT1IOEEkr4c7TgU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=em2HhJ7ltiD1qLoqWj9D5WtFFqePhk6rRJQT5azLSNCZUzUwEQeBPT5FW/LARMgU/
	 5gU0iokovLMP/mgyZeJaowtsM9LiST9PqenQRL/TntThF0DoxzFcWVOoMN8WHjEBoJ
	 BWFCKrxJBIG6kh/59BiYu/cnIWaPKkmWqBQYijc4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:49 +0200
Subject: [PATCH v4 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-6-322a300c6d72@ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
In-Reply-To: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Kkv02RY+uC5gb+rCcgZRwQbhycaoT1IOEEkr4c7TgU4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//BRA0rDWg+mBiQlFGJMSf3f0iKYQpy73R0b
 011V8VioymJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wQAKCRD6PaqMvJYe
 9a+LEACTMt3XvBoeLh1U4Q8dJ7iBX65ow8WQRKqilosaZqurameqS7r0OsbHuPi3HGgr3P4Tx3S
 3ZSYmCPR7mVBKqo5/FBceIr5vQGclra7GN1zftesjn1aaPmCgUR5FUIkEIHBmYEUKZi1kXcQCSx
 4Zjrs+P6Tjy3g/R9mevMKj3UGYbKIMLS5nd0A5YHRLf+76elOs0biNxzIm5bYwxbMNU9N+yZrUP
 2GonK49jekaJvLg3Gy9DCDplwwh3wYV1kcAbHOQT8Y6wCEsn7euY9ztBbg5OvElV5Jjnz7JtNVI
 oULlIqEYR/v3fsrtm5wKeCnwvUnzdjSNyFhK3dtK7Cn9Zv+SRrs55P5ldwOSi2L+yLnokCLbINT
 uVJPs9yuMmJme1OyqGiCYGUuSqTqrLBPlftyMNJTdUIiXLehKbn+/KDhFMAQy7LitC/FwLTsNez
 uqPdD5KEvQB0ZUgqdQleOoqEdDru5S/OfXvckU0baqd/4Oq4Iau3wqV/CXKHXA7jlcqT9wPOXJI
 D7yZsnXLZcf5oLkP/Jc2abzOataZUqt0h1mlJ7qCAhDkzl8Msac7S7z+VuelOGlnAlGG4FDVVEc
 5HFh8dIHQo+qAyKYyuWUCzy4h+EFlnj9xyYaHlPvxuvJp0KJaCb0E3ey9CDUreSMdvQGuw+D8p3
 G2HYNCiBGC0+Ckg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_062323_822301_3AEC8E1C 
X-CRM114-Status: UNSURE (   9.90  )
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

Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
container.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 60684f99f4a7..81e5fcdcc234 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -280,6 +280,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_VYUY,		.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_XYUV8888,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_VUY888,          .depth = 0,  .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_XVUY2101010,     .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_AYUV,		.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true, .is_yuv = true },
 		{ .format = DRM_FORMAT_Y210,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_Y212,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 10d77f6f6e95..552438128f51 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -246,6 +246,7 @@ extern "C" {
 #define DRM_FORMAT_XVUY8888	fourcc_code('X', 'V', 'U', 'Y') /* [31:0] X:Cr:Cb:Y 8:8:8:8 little endian */
 #define DRM_FORMAT_VUY888	fourcc_code('V', 'U', '2', '4') /* [23:0] Cr:Cb:Y 8:8:8 little endian */
 #define DRM_FORMAT_VUY101010	fourcc_code('V', 'U', '3', '0') /* Y followed by U then V, 10:10:10. Non-linear modifier only */
+#define DRM_FORMAT_XVUY2101010	fourcc_code('X', 'Y', '3', '0') /* [31:0] x:Cr:Cb:Y 2:10:10:10 little endian */
 
 /*
  * packed Y2xx indicate for each component, xx valid data occupy msb

-- 
2.43.0


