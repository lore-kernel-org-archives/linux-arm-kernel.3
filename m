Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5213DCD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvfPrv6bBoCwpgk/d8yLJl6+NN2EUVD+9grDz7Fp0E0=; b=pPgqSCG2mQGmQSdcvA+Q+i6S+y
	KYB5zTpQTwvGfz5EQPlTLw+CFj8HwUl7YZmLdgdf8iiPsPg0qpHs4f9SFBQKd+9JOWQa5paNwp3X2
	5LPFD3NL4olfEMSXzbtTV2cEO/2Aue/pNtaCl8G+tajyq621EnIsn1lkc2DLIrlrxy1mWPvwabaMa
	3Ap38zt64hdGJ5WrmihOAy/cX293WoKC36r302TJ7S2eJwz321zWZHscdZG+0PhBOQ4z5c5ccjwmt
	lsUGp5030KvTvPFDdXFa3/U+uyukfnz8QyVVkUkUB7UT56A8+lQBi7KFHfUN1SIkHxWXN9IiO0q6d
	B7a3l+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO6T-0000000D8eP-0532;
	Mon, 11 May 2026 10:43:13 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO6P-0000000D8d9-2nCJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 10:43:12 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-366be8040a9so1133998a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 03:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496189; x=1779100989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvfPrv6bBoCwpgk/d8yLJl6+NN2EUVD+9grDz7Fp0E0=;
        b=NztFRObfsNw8RHXPao2ZdTOkfvKCpbEr7k8Rwbqp9UopihkMCiK6QMZ+JEF07QDF55
         fanZd2+lirkjy1qzYDbgsqRssqw45/lSNzV2EaPmEqWKIISe4bx02dxognLGzRyrt2QK
         NmdaRtO5xgvWuJAw2ZrBJHQVAf3KPSdd3wa0Pu+rxFiUbneKXwKC4R+9q0SEpxleVS3G
         g+WbYcHV9qYRS5WUPuCShiXc555zrrdSlmKB6zSuYceeME15QWh+5v9m8WhIDeCzeWHg
         F94KQmO3tlxTeXQyYOnMhZ9lczjC5hu7wOyuq+Y+CyGH69lleGrRRl8iMImZd8CxWzZQ
         uuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496189; x=1779100989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pvfPrv6bBoCwpgk/d8yLJl6+NN2EUVD+9grDz7Fp0E0=;
        b=N2jrxTotwl8ZFIuJ4NPmsYVDBxP6HMX4VKN/7RgPPQzvfnY3kqxbDI+O7cCm0KfEpW
         WAZQQnjMRhy+1it2X1twAim5yf7L6WrXYukSYolMzwif2yZcVjK7mgWx3mDXF7w5nm97
         eIv0RRfZdglMQx8/WnFE7/+aibuTYq1bs/xAuuR3o0pLbuEX8uZCi6SjNH3D3aXC+IQ+
         Ima+IpJDkWQ9/9E7+Szf84kxrj95zej2IQ2DmXj8zvOVG+klT8C8VirtiBua7K4Ya+/M
         ORWtdGd8UJdIXDxtgJOLqnGWiIeLCK8AUTzl/kbGuC2BKb8wsj6x5VxnswQNoJiIdMiM
         uIrA==
X-Forwarded-Encrypted: i=1; AFNElJ8NKjLM/XGBoO9M5KEaBYcoFUfYO684v3JRwyoVDpPDc8L9f+J3QrJ0q41xa2ovRIKzMUu2BgN9iKn1VEeGtCrL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2tG2OeLobIHWD1jiAnwnk5/HIasTlvwspZxH8j3KUDyH776v/
	bly8tNaPRY6ZYqjaXcdBon/8XEY6WBnCOaiw5CnxdOvJRi1GvNw61ZSL
X-Gm-Gg: Acq92OG75l4QWZncf/UR6bsoWFWFF5TtHB64bRygk4lmiLVnhWrFN+PReb61LLYIGiK
	lI5Oj0LuQzq9eDt5SpRrlnaGyl69OUwiS8kk5hq45/2oKbDG6YnrkneekjF8iUXGIgG/jOtl0V+
	Npj19VXQd3+UEqAqqyAMUtmmJklY+vRc+/kAnXJjD+y0vxcTmVx0C9a5g0lpDrplG4CmiLIoK+Q
	PHeWKA+IT4p6ztn5Otfi+Kbez5YqhIbh5rtHMmJizR2BVcFHwx1lAuzRlW3vD27gm9L3+i/aAxF
	ySbVd5cH5aeDXtCMDBa7PVt0+hg6b4op7gIF9e/Ttsx+lXpw2UAFdzgvvmu5EFZuqWO4POAKMbQ
	0MPK6n5FGyKxhBeNm2mDXULvi7pytDTHC4+LOhuxdwI5ZgH2UdexCQWw49rAPC3aL4OxbAo1g+F
	fghVIWRrYGICWSxufl7w==
X-Received: by 2002:a17:90a:4ca7:b0:367:c367:7e19 with SMTP id 98e67ed59e1d1-367c3678e61mr7498225a91.21.1778496188786;
        Mon, 11 May 2026 03:43:08 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:43:08 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 2/5] media: hi846: fix link frequency handling
Date: Mon, 11 May 2026 18:39:24 +0800
Message-ID: <20260511103927.279550-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103927.279550-1-mitltlatltl@gmail.com>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_034311_093745_21417B7A 
X-CRM114-Status: GOOD (  23.52  )
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

link frequency is tied to PLL configuration, lane count, and external
clock rate, so use runtime here instead of hardcoding for specific
configuration. To implement this, this commit did

1. dropped exposed link freqs as a v4l2_ctrl, since we are runtime
now, it is inconvenient and unnecessary to expose it, and
hi846_set_ctrl has nothing to do with it.

2. attached pll_cfg_4lane to current mode, and use it with clock, lane
count to calculate link frequency, we use 4-lane config as default,
but we can double it easily for 2-lane case.

3. dropped mclk clock rate check.

Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 75 ++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 7f069aca0fce..61297ef66a0e 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2021 Purism SPC
 
-#include <linux/unaligned.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -11,6 +11,7 @@
 #include <linux/pm.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -219,8 +220,8 @@ struct hi846_mode {
 	/* Horizontal timing size */
 	u32 llp;
 
-	/* Link frequency needed for this resolution */
-	u8 link_freq_index;
+	/* PLL configuration for 4-lane link at this resolution */
+	u16 pll_cfg_4lane;
 
 	u16 fps;
 
@@ -1040,13 +1041,6 @@ static const char * const hi846_test_pattern_menu[] = {
 	"Resolution Pattern",
 };
 
-#define FREQ_INDEX_640	0
-#define FREQ_INDEX_1280	1
-static const s64 hi846_link_freqs[] = {
-	[FREQ_INDEX_640] = 80000000,
-	[FREQ_INDEX_1280] = 200000000,
-};
-
 static const struct hi846_reg_list hi846_init_regs_list_2lane = {
 	.num_of_regs = ARRAY_SIZE(hi846_init_2lane),
 	.regs = hi846_init_2lane,
@@ -1061,7 +1055,7 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 640,
 		.height = 480,
-		.link_freq_index = FREQ_INDEX_640,
+		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
 		.fps = 120,
 		.frame_len = 631,
 		.llp = HI846_LINE_LENGTH,
@@ -1086,7 +1080,7 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.link_freq_index = FREQ_INDEX_1280,
+		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
 		.fps = 90,
 		.frame_len = 842,
 		.llp = HI846_LINE_LENGTH,
@@ -1112,7 +1106,7 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 1632,
 		.height = 1224,
-		.link_freq_index = FREQ_INDEX_1280,
+		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
 		.fps = 30,
 		.frame_len = 2526,
 		.llp = HI846_LINE_LENGTH,
@@ -1161,7 +1155,6 @@ struct hi846 {
 	struct v4l2_ctrl_handler ctrl_handler;
 	u8 nr_lanes;
 
-	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
@@ -1192,21 +1185,37 @@ static const struct hi846_datafmt *hi846_find_datafmt(u32 code)
 	return NULL;
 }
 
-static inline u8 hi846_get_link_freq_index(struct hi846 *hi846)
+static u64
+hi846_get_link_freq(struct hi846 *hi846, const struct hi846_mode *cur_mode)
 {
-	return hi846->cur_mode->link_freq_index;
-}
+	u16 cfg = cur_mode->pll_cfg_4lane;
+	u64 mclk = clk_get_rate(hi846->clock);
 
-static u64 hi846_get_link_freq(struct hi846 *hi846)
-{
-	u8 index = hi846_get_link_freq_index(hi846);
+	/* NOTE: 6, 7 actually map to 8, 10, but this won't be that big */
+	u8 post_div1 = 1 + FIELD_GET(GENMASK(10, 8), cfg);
+	u8 post_div2 = 1 << FIELD_GET(GENMASK(12, 11), cfg);
 
-	return hi846_link_freqs[index];
+	/*
+	 * HI846_REG_PLL_CFG_MIPI1_H = 0x025a, it is fixed in listed modes
+	 * [11:8]: 0x02 => pre_div = 3
+	 * [7:0]: 0x5a => multiplier = 90
+	 */
+	u64 link_freq = mclk / 3 * 90 / post_div1 / post_div2;
+	/*
+	 * for shared modes, since lane count is halved for 2-lane, then getting
+	 * link_freq doubled to match the same data rate. Since 720x480 is
+	 * 2-lane only(reg_list_4lane.num_of_regs == 0), no pll cfg for 4-lane,
+	 * the pll cfg is for 2-lane, so use the cfg as is.
+	 */
+	if (hi846->nr_lanes == 2 && cur_mode->reg_list_4lane.num_of_regs)
+		link_freq *= 2;
+
+	return link_freq;
 }
 
 static u64 hi846_calc_pixel_rate(struct hi846 *hi846)
 {
-	u64 link_freq = hi846_get_link_freq(hi846);
+	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
 	u64 pixel_rate = link_freq * 2 * hi846->nr_lanes;
 
 	do_div(pixel_rate, HI846_RGB_DEPTH);
@@ -1426,14 +1435,6 @@ static int hi846_init_controls(struct hi846 *hi846)
 
 	ctrl_hdlr->lock = &hi846->mutex;
 
-	hi846->link_freq =
-		v4l2_ctrl_new_int_menu(ctrl_hdlr, &hi846_ctrl_ops,
-				       V4L2_CID_LINK_FREQ,
-				       ARRAY_SIZE(hi846_link_freqs) - 1,
-				       0, hi846_link_freqs);
-	if (hi846->link_freq)
-		hi846->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-
 	hi846->pixel_rate =
 		v4l2_ctrl_new_std(ctrl_hdlr, &hi846_ctrl_ops,
 				  V4L2_CID_PIXEL_RATE, 0,
@@ -1503,10 +1504,10 @@ static int hi846_set_video_mode(struct hi846 *hi846, int fps)
 	u64 frame_length;
 	int ret = 0;
 	int dummy_lines;
-	u64 link_freq = hi846_get_link_freq(hi846);
+	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
 
 	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__,
-		hi846_get_link_freq(hi846));
+		link_freq);
 
 	do_div(link_freq, fps);
 	frame_length = link_freq;
@@ -1749,7 +1750,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	mf->code = HI846_MEDIA_BUS_FORMAT;
 	mf->field = V4L2_FIELD_NONE;
 
-	__v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi846));
 	__v4l2_ctrl_s_ctrl_int64(hi846->pixel_rate,
 				 hi846_calc_pixel_rate(hi846));
 
@@ -1950,16 +1950,17 @@ static int hi846_identify_module(struct hi846 *hi846)
 static s64 hi846_check_link_freqs(struct hi846 *hi846,
 				  struct v4l2_fwnode_endpoint *ep)
 {
-	const s64 *freqs = hi846_link_freqs;
-	int freqs_count = ARRAY_SIZE(hi846_link_freqs);
+	int freqs_count = ARRAY_SIZE(supported_modes);
+	u64 link_freq;
 	int i, j;
 
 	for (i = 0; i < freqs_count; i++) {
+		link_freq = hi846_get_link_freq(hi846, &supported_modes[i]);
 		for (j = 0; j < ep->nr_of_link_frequencies; j++)
-			if (freqs[i] == ep->link_frequencies[j])
+			if (link_freq == ep->link_frequencies[j])
 				break;
 		if (j == ep->nr_of_link_frequencies)
-			return freqs[i];
+			return link_freq;
 	}
 
 	return 0;
-- 
2.54.0


