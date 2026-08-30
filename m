Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1D9C61DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pG5hjYJsgEQzoTLm/xPUh1x5QPpaw7ZAGE9j4vcwlU8=; b=Hiis+t+xuh4KWAhht+IVPaA1/z
	Vsxq2QdYl0pS67V6MDa9gwJuoKFY5kKTjwI8+ACPzkX3bZswZz5e37iLVN+OXTx5PFtegoEEsmajT
	mMDpk1xHOdwChIqa1WuX0HivV6UxMbxMPJzyDYUc0etyVzPoLlg728BGeT3rJn3CyIvlL4rhL5/yu
	/e4bcMB2qzYgn61vhQiNvoa4P8vj7XU2BFWLI1etBvY/1DLI/8ULT+5cerZwh5FxsorEVC8s3iBst
	ixqn16jK+87QtAc0zdMQkgvJPbluol2IyVp/BwOMOHta2Gf9G0pMrsWycxY0KDrQcNa1sY6OPQcZx
	bylXactg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0hzu-00000007tG0-46qY;
	Sun, 30 Aug 2026 16:03:06 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0hzt-00000007tEc-0PCP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 16:03:06 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso2349584b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105784; x=1788710584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pG5hjYJsgEQzoTLm/xPUh1x5QPpaw7ZAGE9j4vcwlU8=;
        b=j6h2/Cmfe/kJ930gtX5rD8qG1He6Z9kff/1vBDW5V4sK5uBtFTkEsUUS1/M7WozCXY
         G3rfLwS/F4jyCF02qQHgCYwJgVAsd90QJxsnrcrr1P83ct3aFpn7Cp5e90q28XYRDNlH
         5+LPv8iL2mC3QBy4zH4x959Kebzjg7VwJN9m8NJEoCySM+/r2YOD9XUTLZX448qaOCgQ
         0guLnC8V8jRwSjzdSVgWNmreWoL0A52Emx54MaDExNx1OOLQkHLMoXDBBZvDxZ8Nmzcr
         ioSI48yNinzIPS2Oc+X/9lRaLWPoxSONlOVAlPfpmDBjvzD+GLMNeilKwujXbQhfAqQU
         jPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105784; x=1788710584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pG5hjYJsgEQzoTLm/xPUh1x5QPpaw7ZAGE9j4vcwlU8=;
        b=o2Qg+90TULgpzmtCAiuZkILxkXBO783J96Cv/n364T305CTxdTjrquD3o7c1rvox+o
         TXq4Kh0DPpUcPnhq1RUy0SMgYh4XJZYrwWMCS0/E4D7gcJWYUDmgkLVldRsK8EFeD6dh
         OUTM955WGfqGJs4eHm5GthkLlJugLoAnjaBRJYymD6UADmdi+FaZYzvpX8UuP+GCGobX
         CtVtrOpAt5zCPaGa6tckVDWc5WiHjxS2RBYwtwExpIbgaZtkOcVJ7AR2Z1WdCbTZt2ca
         /r9vE1mDJXDTpdWXei9oT6qYZ13ZmzuCY9X0h79d85clin4AZAq+HUcuIcTpJccgvoJV
         764A==
X-Forwarded-Encrypted: i=1; AHgh+RoIZ0UGiui9tQix6aHF/i/8zyDwuwB/iHbhYAfeiXia1kYk/M9z4Ak9TLgPGA/UOVXeqQIkGJM1HxZYniQGAiu6@lists.infradead.org
X-Gm-Message-State: AFuF++m1Bl43Di9mUOXB8xOZeY52oYtIeC73eOWEbpfcTzvbzkA/dcmt
	pr2GnLE4luOl3obYCgNUcHxQTxhRZAVlN4HsEt2fPrkQkNdW2lznzcLz
X-Gm-Gg: AR+sD11e8hxPCWqT24xEBiGQ582q576BNMsB9uwocMnR03V7J0RgaYt2TmJPcFu4nEj
	Vrdo8NhzBKIV1G2yTwOQNmEEwWu6w4f6OYlcpEJ8qwSKDt/6QJbDX1MOtsl13CXwbfzwbQAsY8r
	m6T2MGo774bclBqWQRu0C6cSvYMpPZLzr3+38qaTGEG3VDFCrPA2bImVLeg0wPFokKjpLX394bF
	50ZrvA2jLaNfAUA4a5aZZh9MFFrj125Q1FD2uP28RpnBfcGqYZzBa7H3jiD/UeM+FjZW/3KcPfF
	8+dwppTr2P7gxwVIFDWXcyQc+PDwHN2DVjpmI9tN2M8VD45Vuj1eLbBQwP071Vs4U/vRhtgDZU/
	ThflQYmrDwfygeO0qk/1/Y4VzxsO+MlU6+htbbKyK9BZaqGct8aHggiiKY1DNu0RhdZrQ7arLdc
	1qU4pyJziJG775NRpR2V30leVmH8Nk0C6u/4PkhQ7WqMESVDAAVQLWe5A+A0OV+2SpQCHQ5L9/y
	lgahLk+rtGXqd0eIen0/dvLZMyAGmI+ABCalBOJbD/Yo40W6gp6
X-Received: by 2002:a05:6a00:464e:b0:84a:2b96:5986 with SMTP id d2e1a72fcca58-85994f5cfb6mr2189880b3a.8.1788105784320;
        Sun, 30 Aug 2026 09:03:04 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:03:04 -0700 (PDT)
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
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 3/5] media: hi846: Fix modes handling for different lane cases
Date: Mon, 31 Aug 2026 00:00:23 +0800
Message-ID: <20260830160025.211384-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830160025.211384-1-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_090305_148704_A8906BBD 
X-CRM114-Status: GOOD (  16.34  )
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
mode, 640x480 mode, use v4l2_find_nearest_size_conditional() to filter
out it.

Reported-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Closes: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm
Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Link: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v6:
- Add link freq check in filter.
v5:
- Use v4l2_find_nearest_size_conditional() to filter for different lane cases. (Sakari)
---
 drivers/media/i2c/hi846.c | 63 ++++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 2f8624f9bdf3..648192521344 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1713,6 +1713,21 @@ static int __maybe_unused hi846_resume(struct device *dev)
 	return hi846_power_on(hi846);
 }
 
+static bool filter_modes(const void *array, size_t index, const void *context)
+{
+	const struct hi846_mode *mode = array;
+	const struct hi846 *hi846 = context;
+	bool valid_link_freq;
+	int freq_idx;
+
+	freq_idx = hi846_get_link_freq_index(hi846, mode);
+	valid_link_freq = freq_idx < 0 ? false : true;
+
+	return ((hi846->nr_lanes == 2 && mode->reg_list_2lane.num_of_regs) ||
+		(hi846->nr_lanes == 4 && mode->reg_list_4lane.num_of_regs)) &&
+	       valid_link_freq;
+}
+
 static int hi846_set_format(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
@@ -1736,20 +1751,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
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
@@ -1760,9 +1761,12 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	hi846->fmt = fmt;
 
 	hi846->cur_mode =
-		v4l2_find_nearest_size(supported_modes,
-				       ARRAY_SIZE(supported_modes),
-				       width, height, mf->width, mf->height);
+		v4l2_find_nearest_size_conditional(supported_modes,
+						   ARRAY_SIZE(supported_modes),
+						   width, height,
+						   mf->width, mf->height,
+						   filter_modes, hi846);
+
 	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
 		hi846->cur_mode->width, hi846->cur_mode->height);
 
@@ -1853,6 +1857,8 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct hi846 *hi846 = to_hi846(sd);
+	int i, count;
 
 	if (fse->pad || fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
@@ -1862,15 +1868,24 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 	}
 
-	fse->min_width = supported_modes[fse->index].width;
-	fse->max_width = supported_modes[fse->index].width;
-	fse->min_height = supported_modes[fse->index].height;
-	fse->max_height = supported_modes[fse->index].height;
+	for (count = i = 0; i < ARRAY_SIZE(supported_modes); i++) {
+		if (!filter_modes(&supported_modes[i], i, hi846))
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
2.55.0


