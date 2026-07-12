Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F86C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 11:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhK9bfq2tOdFBvjORvoaYZUgl9YXotqdNA2XfoO3L1s=; b=Vdq3COtHthRTGVnUh7wx6rRXzP
	N/L8Jnxsc43VdTDbOfTGoqGU1H6Q3TFyWKmTIIqrqxrNXXUg/OZl1ntfiNNUa+arJ4FzD7t/aUf00
	oTlOZvie0p6JLrtZfGaSoMzrjoFs6BYLo2oeynHKkwx8ihUOCj+H2GzObntJBWuNFEY2CT5Qo+0wW
	8sHBTzqOu380WViaV/QnDy/ofMeVA7pOvv0Bp9+Mtujk3RCazipCQWMTo/AgcEGsMAvjRzkVDf/+N
	4BQcAiH0mmXM+eUli23pAFXKeLFITs4NM6YdKTebljrX92D4y+7FRUmn4lYrNMFKigx0e0+Srilu6
	NcXo3Z/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wisjG-00000007Q5O-0RmV;
	Sun, 12 Jul 2026 11:52:14 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wisjE-00000007Q4w-1NEn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 11:52:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cac59f8b64so25233525ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 04:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857131; x=1784461931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhK9bfq2tOdFBvjORvoaYZUgl9YXotqdNA2XfoO3L1s=;
        b=oE5+UIy5j2dz5kT+99ei1a0WJ27Un06ebBAgT4OuHNppxq1c8sVz9utbgVZEGSSCpT
         LELQqTNhosvNrTn8SCbAR16gE0DHuAGz3UEBZA7vv7CSVxrkVrI/eKX4NxPoufY/b0Mu
         DrV4A6N2oIZeITFvntYK60lf99BvihpgsOibXdjWjTUjtR1hIDEChMjT3U5sIymkNfD9
         PtCfsU224zFhfHCzGcWpIuSJSB4hw+WuXsXX1RbncWVkn2Zj+TL4IG1NKk4OrN8l1Wyp
         wZPrBEs2zDjqbpKaIlVxuAqmOo5aktSHaY8z7gD5aKsgcwLFlch/90v+MH0M6kEneHnW
         GWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857131; x=1784461931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhK9bfq2tOdFBvjORvoaYZUgl9YXotqdNA2XfoO3L1s=;
        b=peKANyl4NMfvCkpwYgzo25X1/yBH3+4TSGec9gvDkHQVD1sXKRFP9Qm8YBCfC9nE3A
         BN6EOvmNtM2O0amsaPm1z6fLdMYImh/f3tc7KhKuZ2BnpAP4UCq7trOqBluuauKKonH8
         NvgKZiRZvvM5FLw+HBBHm3Ap9Wn3hAUBREWENxZCBr45kZ+m8ngdPE/W3GAaOW9eAFvT
         65R/vXW/wdbq7Nupn96/YImblHDVbf2b0kvMVDO3IP4k/IYlimlPHa/X2oEmACX+EQWF
         Iz/6SkJFR/oj4JmR3q7eGt1C1qBVAQjuAK0WCTl0HsUfy+KK695+GcptF6zRiJ5k2spp
         bX6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrjonbmAnGYh2N2SYZ/fGyq9OYRqFbyFJahWOK9ypAxehwTYtv2xIMFmgqFVZhKAc4i96yZBMtI94jsErYTw810@lists.infradead.org
X-Gm-Message-State: AOJu0YzudlMmznjTpKbu6reonnkGej3FygSdOWgWysQX81S8WNsSbkOW
	bWsHeTdXVW5JS1SkD7vb+EuE4Ytx9ZRQomrE1OF5x4k1pyDOTVaSqSdJ
X-Gm-Gg: AfdE7cmAHm8qM8v7dthMuq77NLVHIYzmtv3CsvKvOWbuPwehNKe2eQim45c9xNqAib6
	4mSjEG8S58ORZZ9bsCz+qMO2CIWFDZ5WpFs4QcqgPPD3K/0OENV44HKWA/NiFtmSYKgbIu7Jf/a
	4vCXq8FnTxqXcgKl2mBHPIUlSwlKJt4kKbbsIm1s2NJWur3fKfcd3es0RptM7FJugCH4BZP4lA3
	5+QTES5KkIvVV5UBIGKbTmJWDzREAdc3ATFoKvG69i1TlQkbkuQDq33HieD22MWla9FrFcVhgVe
	sR0jbdgB1fUXAfCuYkCdkQ3NW0pSfjeQ97TQOnHQlBoUQ66CDAFn6nzLdTJJ7fwwtnVN7lTBvrg
	OJ9sHA1vz+rqK33WTl2nCZFFq9idJOykiB6NlNdh/U913FkNS3hyxCz5ccvGIa7dcdVKEXT0VYd
	Y769TnDvR1qi9HmcDOYxsFEcVOBvNKGckBljKCTaI=
X-Received: by 2002:a17:902:d987:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2ce9e9a7128mr62427285ad.4.1783857131361;
        Sun, 12 Jul 2026 04:52:11 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm84538295ad.31.2026.07.12.04.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:52:11 -0700 (PDT)
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
Subject: [PATCH v5 2/5] media: hi846: Fix link frequency handling
Date: Sun, 12 Jul 2026 19:50:09 +0800
Message-ID: <20260712115012.91600-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712115012.91600-1-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_045212_379485_C75BCAAB 
X-CRM114-Status: GOOD (  23.75  )
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

Link frequency is tied to PLL configuration, lane count, and external
clock rate, so use runtime here instead of hardcoding for specific
configuration. To implement this, we do

1. Drop exposed link_freq as a v4l2_ctrl, it is inconvenient to expose
it as an int_menu when freq_links are varies between mclk rates, this
will not break v4l2_get_link_freq() since it can be calculated back
from pixel rate which is previously from the dynamic link frequency.

2. Attach mipi_clk_div_{2,4}lane to current mode, and use the div with
mclk clock, lane count to calculate link frequency.

3. Drop mclk clock rate check.

Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v5:
- Use separated fields instead of raw register values for PLL cfg (Sakari)
- Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (Sakari)
- Drop line break (Sakari)
---
Hi, Sakari. I did not follow to use v4l2_link_freq_to_bitmap(), which
you mentioned in v4, since we have no fixed int_menu for link_freq.
---
 drivers/media/i2c/hi846.c | 82 ++++++++++++++++++---------------------
 1 file changed, 37 insertions(+), 45 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 7f069aca0fce..6bcd862aee30 100644
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
+	u8 mipi_clk_div_2lane;
+	u8 mipi_clk_div_4lane;
 
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
@@ -1061,7 +1055,13 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 640,
 		.height = 480,
-		.link_freq_index = FREQ_INDEX_640,
+		.mipi_clk_div_2lane = 4,
+		/*
+		 * Dummy but necessary if we set this mode default, otherwise
+		 * hi846_calc_pixel_rate() will be broken in
+		 * hi846_init_controls()
+		 */
+		.mipi_clk_div_4lane = 8,
 		.fps = 120,
 		.frame_len = 631,
 		.llp = HI846_LINE_LENGTH,
@@ -1086,7 +1086,8 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.link_freq_index = FREQ_INDEX_1280,
+		.mipi_clk_div_2lane = 2,
+		.mipi_clk_div_4lane = 4,
 		.fps = 90,
 		.frame_len = 842,
 		.llp = HI846_LINE_LENGTH,
@@ -1112,7 +1113,8 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 1632,
 		.height = 1224,
-		.link_freq_index = FREQ_INDEX_1280,
+		.mipi_clk_div_2lane = 2,
+		.mipi_clk_div_4lane = 4,
 		.fps = 30,
 		.frame_len = 2526,
 		.llp = HI846_LINE_LENGTH,
@@ -1161,7 +1163,6 @@ struct hi846 {
 	struct v4l2_ctrl_handler ctrl_handler;
 	u8 nr_lanes;
 
-	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
@@ -1192,21 +1193,28 @@ static const struct hi846_datafmt *hi846_find_datafmt(u32 code)
 	return NULL;
 }
 
-static inline u8 hi846_get_link_freq_index(struct hi846 *hi846)
+static u64
+hi846_get_link_freq(struct hi846 *hi846, const struct hi846_mode *mode)
 {
-	return hi846->cur_mode->link_freq_index;
-}
+	u64 mclk = clk_get_rate(hi846->clock);
+	u8 mipi_clk_div;
 
-static u64 hi846_get_link_freq(struct hi846 *hi846)
-{
-	u8 index = hi846_get_link_freq_index(hi846);
+	if (hi846->nr_lanes == 2)
+		mipi_clk_div = mode->mipi_clk_div_2lane;
+	else
+		mipi_clk_div = mode->mipi_clk_div_4lane;
 
-	return hi846_link_freqs[index];
+	/*
+	 * HI846_REG_PLL_CFG_MIPI1_H = 0x025a, it is fixed in listed modes
+	 * [11:8]: 0x02 => pre_div = 3
+	 * [7:0]: 0x5a => multiplier = 90
+	 */
+	return mul_u64_u32_div(mclk, 90, 3 * mipi_clk_div);
 }
 
 static u64 hi846_calc_pixel_rate(struct hi846 *hi846)
 {
-	u64 link_freq = hi846_get_link_freq(hi846);
+	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
 	u64 pixel_rate = link_freq * 2 * hi846->nr_lanes;
 
 	do_div(pixel_rate, HI846_RGB_DEPTH);
@@ -1426,14 +1434,6 @@ static int hi846_init_controls(struct hi846 *hi846)
 
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
@@ -1503,10 +1503,9 @@ static int hi846_set_video_mode(struct hi846 *hi846, int fps)
 	u64 frame_length;
 	int ret = 0;
 	int dummy_lines;
-	u64 link_freq = hi846_get_link_freq(hi846);
+	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
 
-	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__,
-		hi846_get_link_freq(hi846));
+	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__, link_freq);
 
 	do_div(link_freq, fps);
 	frame_length = link_freq;
@@ -1749,7 +1748,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	mf->code = HI846_MEDIA_BUS_FORMAT;
 	mf->field = V4L2_FIELD_NONE;
 
-	__v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi846));
 	__v4l2_ctrl_s_ctrl_int64(hi846->pixel_rate,
 				 hi846_calc_pixel_rate(hi846));
 
@@ -1950,16 +1948,17 @@ static int hi846_identify_module(struct hi846 *hi846)
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
@@ -2041,7 +2040,6 @@ static int hi846_probe(struct i2c_client *client)
 	struct hi846 *hi846;
 	int ret;
 	int i;
-	u32 mclk_freq;
 
 	hi846 = devm_kzalloc(&client->dev, sizeof(*hi846), GFP_KERNEL);
 	if (!hi846)
@@ -2060,12 +2058,6 @@ static int hi846_probe(struct i2c_client *client)
 				     "failed to get clock: %pe\n",
 				     hi846->clock);
 
-	mclk_freq = clk_get_rate(hi846->clock);
-	if (mclk_freq != 25000000)
-		dev_warn(&client->dev,
-			 "External clock freq should be 25000000, not %u.\n",
-			 mclk_freq);
-
 	for (i = 0; i < HI846_NUM_SUPPLIES; i++)
 		hi846->supplies[i].supply = hi846_supply_names[i];
 
-- 
2.54.0


