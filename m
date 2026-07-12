Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F1FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 11:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1McK7dycxu+dxlJjQrMq0eguudKjuI/eVOvUi+pvIE=; b=r3//CRjeB1FJSiw5sCxaMdJFw1
	G+dh4y+aIqXtRE2u4t50zY1BNgpGfllop3ghMalFvHBFQMnzsCG+yI5e6ZLAw4FHZzIwIjuUvBcI6
	+Qr/vZvW74Us3ZW33iQG5ENKiozMOPKMdIVDzwNXRTds6mUoxU3RAFKHlxU9iVUBvr0UW3nH+5qYH
	TJPOk/dJinDJy6gk1HhDJS9s6hPZB2TxYIVvFmyCedkRs27i4vyrxmqOwB08TiWSCevj88MCfI/ZA
	SA37JfsD6RsKBkQLHXUXVDCD5x/90bl7XNCfrhTyUkoIyfhYC7g6xcFyHg71JeNhTW7B5p4jPxBCf
	JJf+FM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wisjO-00000007Q7i-19rv;
	Sun, 12 Jul 2026 11:52:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wisjL-00000007Q6u-2d1u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 11:52:20 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ce7d2adef4so30415995ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 04:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857139; x=1784461939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1McK7dycxu+dxlJjQrMq0eguudKjuI/eVOvUi+pvIE=;
        b=ghda7DmCck1CHBhqMZU7zNh2BruW9auSEc710/FA78BXXQWjxHHA+FKtuq0EGfg77v
         WBkx8vKuQGrbrUhhwVK56oBPNxa2H4CU2/ib0U0AANbPttGzBn0+GI+UCIQOWQ9Mguwu
         ZKjqZEpuCsaQ3mRe2rJqbigLNeBTuNll+K4QkLR5ZJ5HYYo+ZXOJ8BxcYc7RyMlDWRwi
         YsyifFbTuYsTHv6Dy63yGfzSHV06M7F0PJV0QoXwpkRy6SP9lCcuFyUv1Rr2/pL0cXST
         rde9IKQSrivIS0G7iEQwdAa+G/TVoHZqIOu+/uZgzpUHBpME5yEVGSaAAgYxhfZuZ79m
         mzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857139; x=1784461939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1McK7dycxu+dxlJjQrMq0eguudKjuI/eVOvUi+pvIE=;
        b=UWFY3XSymz/fu8DHgqLM+LWf12iIDrBf1DUeDHcgz/HU9jZ5QhsBtlFzK7n3YxuEtb
         PbGVwzqkthd7ig7m3czi5cUVGnnubCDFEvw+Qkv34C/Dv9w8KbfIlfHyonziFbpfF0Eg
         t+u+jdF+xRnCoelmzkwn8LvVY128sLIyeRNyLJZlXy+lRrZmRT13swi3PLZXjSbxTxQV
         KtH2/B9IH+6lx8PNutf4zVRJZ6xWnRZDZYpII4DjkFtwa2OYbGeOtnEt8KgMFDHjt2hO
         57N0EodZvsp2yB1EWdi7QBFw4cUWWNEZJD8vm/MCjPAdwsO6jzbxBH41R1C8RGQx7C0s
         RVtg==
X-Forwarded-Encrypted: i=1; AHgh+RpdK6wdKK7jcZ+lz7PpTVpEpxF5w4bUAmmdOChPTFL5SP/ElyKecLN1z9B7QpW3TWEI8gIHe+ErvaZS/EuagF3X@lists.infradead.org
X-Gm-Message-State: AOJu0YwWovSmxwEn4IEHb9MKH0Xs85NNLJmNVEJ1iZdw5OqVcIsR4djQ
	osJajyzPXSSTc+iRS+yE+nU7SS40eoxIUcBXKkFhdMIfSCrjI1oqgL+y
X-Gm-Gg: AfdE7cl5JSXzVk+XMCtf8Z5LVrgkRurm/3aFo6/vKMZRANOtqIvl2pKdqWI8EE1cUth
	8xWMaO0M6cN1LWl5ZrkcAHixmyCV707NeXO9N0Jk9Bf5CgxVtXow+XJg8Z44pCNQOAEPHZ2kpL/
	fSKWAoKyj7Kn0KJRFSFUDuI2ecAKgWpSnWqjezX/dQOusg5Y9E/veh2w04i/uXH9LBcN6ivVJLQ
	EG8/Qq0vBVPyQkOJBDatRNjRxCgqC2xzbdUpmt6NhqdsGdAaU7q+cYo7yHE4Ikf/XDvk4nWQUeg
	hvuPLMvB48BLyWYfyc+g7EXu55V/MW2Kma1wzXZgTjxusGY6dM7qXwigk+tgHzvG2pyt39YOEHk
	qQFHVcAw5o32ud9EswvRA4a9PdDTR7xxiPcETYkVntiEHWapr6Ogh7b7vazbiKSIFFpAM/hUoXp
	p7Jiprj+garJJdBGEcnfLEk7PRXS1e6GQcyC3/9yg=
X-Received: by 2002:a17:902:ef0a:b0:2ca:9ab:e725 with SMTP id d9443c01a7336-2ce9e59d62cmr57706585ad.1.1783857138522;
        Sun, 12 Jul 2026 04:52:18 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm84538295ad.31.2026.07.12.04.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:52:18 -0700 (PDT)
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
Subject: [PATCH v5 3/5] media: hi846: Fix modes handling for different lane cases
Date: Sun, 12 Jul 2026 19:50:10 +0800
Message-ID: <20260712115012.91600-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712115012.91600-1-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_045219_670430_46A008A3 
X-CRM114-Status: GOOD (  15.92  )
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
mode, 640x480 mode, use v4l2_find_nearest_size_conditional() to fix
it.

Reported-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Closes: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm
Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v5:
- Use v4l2_find_nearest_size_conditional() to filter for different lane cases. (Sakari)
---
 drivers/media/i2c/hi846.c | 58 +++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 6bcd862aee30..1223567641c4 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1688,6 +1688,16 @@ static int __maybe_unused hi846_resume(struct device *dev)
 	return hi846_power_on(hi846);
 }
 
+static bool filter_by_mipi_lanes(const void *array, size_t index,
+				 const void *context)
+{
+	const struct hi846_mode *mode = array;
+	const struct hi846 *hi846 = context;
+
+	return (hi846->nr_lanes == 2 && mode->reg_list_2lane.num_of_regs) ||
+	       (hi846->nr_lanes == 4 && mode->reg_list_4lane.num_of_regs);
+}
+
 static int hi846_set_format(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
@@ -1710,20 +1720,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 		return 0;
 	}
 
-	if (hi846->nr_lanes == 2) {
-		if (!hi846->cur_mode->reg_list_2lane.num_of_regs) {
-			dev_err(&client->dev,
-				"this mode is not supported for 2 lanes\n");
-			return -EINVAL;
-		}
-	} else {
-		if (!hi846->cur_mode->reg_list_4lane.num_of_regs) {
-			dev_err(&client->dev,
-				"this mode is not supported for 4 lanes\n");
-			return -EINVAL;
-		}
-	}
-
 	mutex_lock(&hi846->mutex);
 
 	if (hi846->streaming) {
@@ -1734,9 +1730,12 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	hi846->fmt = fmt;
 
 	hi846->cur_mode =
-		v4l2_find_nearest_size(supported_modes,
-				       ARRAY_SIZE(supported_modes),
-				       width, height, mf->width, mf->height);
+		v4l2_find_nearest_size_conditional(supported_modes,
+						   ARRAY_SIZE(supported_modes),
+						   width, height,
+						   mf->width, mf->height,
+						   filter_by_mipi_lanes, hi846);
+
 	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
 		hi846->cur_mode->width, hi846->cur_mode->height);
 
@@ -1819,6 +1818,8 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct hi846 *hi846 = to_hi846(sd);
+	int i, count;
 
 	if (fse->pad || fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
@@ -1828,15 +1829,24 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 	}
 
-	fse->min_width = supported_modes[fse->index].width;
-	fse->max_width = supported_modes[fse->index].width;
-	fse->min_height = supported_modes[fse->index].height;
-	fse->max_height = supported_modes[fse->index].height;
+	for (count = i = 0; i < ARRAY_SIZE(supported_modes); i++) {
+		if (!filter_by_mipi_lanes(&supported_modes[i], i, hi846))
+			continue;
+
+		if (count == fse->index) {
+			fse->min_width = supported_modes[i].width;
+			fse->max_width = fse->min_width;
+			fse->min_height = supported_modes[i].height;
+			fse->max_height = fse->min_height;
+			dev_dbg(&client->dev, "%s: max width: %d max height: %d\n", __func__,
+				fse->max_width, fse->max_height);
+			return 0;
+		}
 
-	dev_dbg(&client->dev, "%s: max width: %d max height: %d\n", __func__,
-		fse->max_width, fse->max_height);
+		count++;
+	}
 
-	return 0;
+	return -EINVAL;
 }
 
 static int hi846_get_selection(struct v4l2_subdev *sd,
-- 
2.54.0


