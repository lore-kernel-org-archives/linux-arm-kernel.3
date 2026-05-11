Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE685CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozLkte7ETpH86EHwtLlaK+Q8ddy25XuHUv04YnH5k94=; b=qY5JjwJHxwOHW5SY7qzb+B7bJV
	xhzpxl2GuL1B99jsAN6qLGR+w6jOr0yyDn/X9WaV/RPJ5ZsquOGMgoMDwsMtTfYIuxH6I9PRhxOnY
	tk31nNhHsvWO3Hf2yunJF+2mJV/dqVf6GTNUZVW9q+uPYGWSM/3YVhEvpEZDD9pxnAZNeB0gRYJEn
	t5e34tpb30VIoqZfDv8We4vba5sJX8aJtq6X9SwBcbqOc32bHqHX/Ojf5QPpD8IilbpeEDNZgDapA
	6xezbXFqopyNiRhJnsjfsyrv2GJEPG0Z3x9TQZ45+I5zdgh4xH4yAPcGJN6MZnKawi6yIO54An6SO
	kgc3/Nrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMfx-0000000CrDl-3vqm;
	Mon, 11 May 2026 09:11:45 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMfv-0000000CrC1-2hgG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:11:44 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so360997b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490703; x=1779095503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozLkte7ETpH86EHwtLlaK+Q8ddy25XuHUv04YnH5k94=;
        b=j8Qnipm/jQwXmHWAZ/BW1gfn5nJS1pObp9U/WBeSP/jyTeRoOhuN6YJcY5DTekqf6R
         fL4+Xa/yjyOX71JxndxsWqALRYv3n9katNWHNu7w+qlkVk1tQsVcNfRH0DJH1AosnXFU
         b4jxHQEYQ/9aBsDGWFrT6RBAhF9SX/62aepNiBjoKtGfAuJYr4FDyVepbeFv5t/b1ELL
         ncB3k4Iachgyqvs8XunjOWR8raiJFB72u+hvfozpD+iRbNSOPop1fOOsU+ZbpVmdSqqo
         oC93ThWfws7tq7BxUXN8k/BO2wbTHR+m9ZD3ESiHQlXiXVRSdsE+k9AfDkQ6gHyMpegP
         vgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490703; x=1779095503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ozLkte7ETpH86EHwtLlaK+Q8ddy25XuHUv04YnH5k94=;
        b=pwf7WDNCeQGTGANNXo7eKYclTU25Ta1exw1epYlFRdxEkl/veg+kzzqzY633fmGdU4
         w2SRaUDAFTHbbmjccE/rRpNYoNcK8sBqoPn4+9e5CpUc/29F0AHvpwDfFBctW+8MpVHs
         OJT8ZZW+dlJbgGmynAPj45x0PagTgX8SV4SOlBiLaDpKoRg3lJvhSNcNKBIQEF77HeBu
         zlqqC2XaQcv5P0S/FE+aALc0r2GUG0/39n+5kJ8/Y4D6SpQ6LMt8XUdZFjeFNdtGNpJX
         Yx9PV59Q/2fCRxabikv15Q21jwOueqTBgXEIQK2gzn8mi7J1V4rlPU5zlaxqk1rJkIMz
         r4IQ==
X-Forwarded-Encrypted: i=1; AFNElJ/r+qbVBIzOKUqbF3+6WFxTYceLeQQSUK5e/ZaB7yNAjrJ902YbXpTNA+QH6QcHA9YhWABY5Yv0ovGdW5NvuVnx@lists.infradead.org
X-Gm-Message-State: AOJu0YzMvM8iKjtwZUorhBlYOo/Gko88pD0R86dhD1/YXTrbEUu1yXwC
	F3iM5oIz9IMq3MC7SN+I+YexZvxD48fRVProk9vg5jHyrkEfOFISkK9s
X-Gm-Gg: Acq92OGXtNuwEeAZBWWguQfW+angu5vzllhRzYGpTYQdZxdB7Pex5yEqGNPj7GLdinl
	xvZQXKz0BNaAYwLoBBCmEiNkA+dxyahyQwsksruyAGHkpm88To1bcli7+kejTMUqVWV+CF0k9tk
	1l9LIzfO707RcSGOkNYof5t1vmV0dllrxsCIZ1+7d3yEn6UlQzGBCTmaXm+ogO71FaLLk4R20UQ
	Iwglt8jzuvvcH7Z5FCqKMMFRlH5WGwXK8s4Pek65HmOi3S9O2IR4ECzhjuJXp3Za5R64NuxOV36
	VXpP5q1VLiFaUtfqsKWSLEn8/X3DoNcGEAhPCjB2UwcAA+7J/QK1GVLBoy/PHGP+wjeQ9Vs3hyq
	9r29CB2nE2ABQrHwmvfnR78cNs7r5mItFNvZJV1We+fSBxKOhe8DY8xMAyKlo+Hr7nEakVG7r0N
	pnZZC4rjTcZsPr7fJ3cIG2xqVuf034uMjNiw==
X-Received: by 2002:a05:6a00:914a:b0:83e:b22f:373a with SMTP id d2e1a72fcca58-83eb22f4300mr4998591b3a.11.1778490702569;
        Mon, 11 May 2026 02:11:42 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:42 -0700 (PDT)
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
Subject: [PATCH v3 3/5] media: hi846: fix modes handling for different lane cases
Date: Mon, 11 May 2026 17:09:22 +0800
Message-ID: <20260511090924.269106-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511090924.269106-1-mitltlatltl@gmail.com>
References: <20260511090924.269106-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_021143_696842_E2668313 
X-CRM114-Status: GOOD (  18.43  )
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

When using 4-lane, v4l2_find_nearest_size may return an unsupported
mode, 640x480 mode, and it is set to the default mode.

To fix it, specifying the supported modes for different lane cases,
once the lane count is determined.

Reported-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Closes: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm/
Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index befd54553df2..9decfda74787 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1130,6 +1130,8 @@ static const struct hi846_mode supported_modes[] = {
 		},
 	}
 };
+#define NUM_MODES_2LANE		ARRAY_SIZE(supported_modes)
+#define NUM_MODES_4LANE		(ARRAY_SIZE(supported_modes) - 1)
 
 struct hi846_datafmt {
 	u32 code;
@@ -1162,6 +1164,8 @@ struct hi846 {
 
 	struct mutex mutex; /* protect cur_mode, streaming and chip access */
 	const struct hi846_mode *cur_mode;
+	const struct hi846_mode *supported_modes;
+	int num_modes;
 	bool streaming;
 };
 
@@ -1736,8 +1740,8 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	hi846->fmt = fmt;
 
 	hi846->cur_mode =
-		v4l2_find_nearest_size(supported_modes,
-				       ARRAY_SIZE(supported_modes),
+		v4l2_find_nearest_size(hi846->supported_modes,
+				       hi846->num_modes,
 				       width, height, mf->width, mf->height);
 	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
 		hi846->cur_mode->width, hi846->cur_mode->height);
@@ -1821,8 +1825,11 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct hi846 *hi846 = to_hi846(sd);
+	const struct hi846_mode *supported_modes = hi846->supported_modes;
+
 
-	if (fse->pad || fse->index >= ARRAY_SIZE(supported_modes))
+	if (fse->pad || fse->index >= hi846->num_modes)
 		return -EINVAL;
 
 	if (fse->code != HI846_MEDIA_BUS_FORMAT) {
@@ -1950,12 +1957,12 @@ static int hi846_identify_module(struct hi846 *hi846)
 static s64 hi846_check_link_freqs(struct hi846 *hi846,
 				  struct v4l2_fwnode_endpoint *ep)
 {
-	int freqs_count = ARRAY_SIZE(supported_modes);
+	int freqs_count = hi846->num_modes;
 	u64 link_freq;
 	int i, j;
 
 	for (i = 0; i < freqs_count; i++) {
-		link_freq = hi846_get_link_freq(hi846, &supported_modes[i]);
+		link_freq = hi846_get_link_freq(hi846, &hi846->supported_modes[i]);
 		for (j = 0; j < ep->nr_of_link_frequencies; j++)
 			if (link_freq == ep->link_frequencies[j])
 				break;
@@ -1999,6 +2006,13 @@ static int hi846_parse_dt(struct hi846 *hi846, struct device *dev)
 
 	hi846->nr_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 
+	hi846->supported_modes = supported_modes;
+	hi846->num_modes = NUM_MODES_2LANE;
+	if (hi846->nr_lanes == 4) {
+		hi846->supported_modes = supported_modes + 1;
+		hi846->num_modes = NUM_MODES_4LANE;
+	}
+
 	if (!bus_cfg.nr_of_link_frequencies) {
 		dev_err(dev, "link-frequency property not found in DT\n");
 		ret = -EINVAL;
@@ -2088,7 +2102,7 @@ static int hi846_probe(struct i2c_client *client)
 	if (ret)
 		goto err_power_off;
 
-	hi846->cur_mode = &supported_modes[0];
+	hi846->cur_mode = &hi846->supported_modes[0];
 
 	ret = hi846_init_controls(hi846);
 	if (ret) {
-- 
2.54.0


