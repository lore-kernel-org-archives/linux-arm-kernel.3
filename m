Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE98C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th+517ZC0V4fbqH9CgBsf81RO0nRc/LViRgQwQPk9dM=; b=sBiYE9w5qoKH94Om4iMa0TrvKh
	1qcvS59UuRCEU9RUaiAImSjPMouentttaaVj5bqHFYUV4llei5ImEzWZSR70chakRGKG+tVyn4erU
	lz1LLPxSjSK76fzyJ149oOFZor7B4lD0uBscAkCoTOUL107qS6I32VmNJqmV4HfGTE6BOqxskZanI
	pCoyHQBIMkkSwfCRMmvzf9zKyTy70bCiWm2gH7kZSR6k+JEAc3wFHCIfhDmhrN8KqCP8LUDK2sfn0
	fkGHFrYEbTFy21zgw+HD/ISb76pkoIkyktl4vSq1R3q06LNBasThJg4ZglFkRbkhHIunCoYkZGtyH
	6pQ09Rgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFnR-00000003HE9-1NkB;
	Thu, 20 Feb 2025 23:17:33 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFf3-00000003FLq-2u3x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 23:08:54 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ab7430e27b2so262089166b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 15:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092932; x=1740697732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th+517ZC0V4fbqH9CgBsf81RO0nRc/LViRgQwQPk9dM=;
        b=UOojrSzgWddoHkNK9IWtevCaZEU0rMCqyg/v1jInuosAf7J5/Pt/xDNH2bOq4fpj1d
         yKlMoThpG9zbFQhUB036KfCXzDgbxV+jejGkm+3GYXMiKFJpXQxpSiriKvVCLUqEm2f1
         AfH23tdF5UZvgeGkjkk4+p+rguUS6OkSwMYTGKTnAzK0Muu5yVzK5h/Es8KtP3rc3HzO
         0iuhNE06WB/JlhXaCHE3V3cVaAfopALZ5qKpLYuKthpNExHU1Hw0kyTJ8D9QiYHY89ZZ
         qhfDTkrKOKXoO/KyRY8MhsRC51mIm1N9gTm3eu9U8G8BXq2ujWNvXgRXCYiWfliLu1de
         7p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092932; x=1740697732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=th+517ZC0V4fbqH9CgBsf81RO0nRc/LViRgQwQPk9dM=;
        b=fBvgzjYf3vlII+hpO3fevidvk4j8gY/rfCz40a/5vkyQQVoe1FmWPJC8+JsfLLmiM+
         tyW4PFi6BXz98loK6f0HWMhju6ca4TWD0mZW9jN0+LWuf9xR5rw0o8rALrZvShfPtL9l
         svfabn+DUjksBlIgRy8AtC4wSX5IJYw57jvVKAg1mx2MdTI1uOsW9ijZLycpL633jBnE
         /IUKTW7rrnp2IcbdfxuPltf323eEGngSALMfir36fV/H6kg5DW5opEwtkHpfri8/BzoE
         pMT82F+qMVOYbkEBc21G4E7YWgcDSfJAMIoJpVUAKsDcvy7XZ76jFazGYRgU7n1kgK4S
         yIUw==
X-Forwarded-Encrypted: i=1; AJvYcCU1IEsw0Pefamq1IGq7+uCc99fwBY+OHJldaej+ypgWTONyJsX168sz94II8GQpiBDDoYAX1svV0qSNpPZ8/Spj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzawjn3cAC6UfCCgXqUT8J9WkSTwz0/l0jNdHZvg/HqY2kHvwLI
	BPmyPLPiTpNXXIQjDi62ayrSn0XGEXUbhxiA1TTGQ4DwHS4yC6k4
X-Gm-Gg: ASbGnctVgwhu/dE51J1FWvW33lzfkHDlDv4UgzFX0OXohrgEluveaHwpzc7YHzKBc8R
	kRosQJwagajrj6XfKVwYdlsNN4lRR7U3U6RY8FXsIMjsGoJuldwK+toLJzBXOQvbzV83B+opclU
	tInAQ7pblwCBXEssb7WwBrZU7pTnom1xpthGWFyhTsF46Y90pHs9CrTGQRm8n5+5gFceLXUdLKZ
	ISWZobD6BcKZ+mw5KIf1SVK332bUow2GXIj61B0QhwuWpNT0XaZ+6kb3jlcmx9HJumbEdrSKeMn
	IVt5KM2+qGnAacOqfkZzVEWbRIiD
X-Google-Smtp-Source: AGHT+IFfE/1JdGnfUcNxpjJHL3/DYWaNKaOhzV3vJxEUOthUy2riBK/uCS6Yxc/sSSL3TdBg0rq7Nw==
X-Received: by 2002:a17:906:308e:b0:ab6:511d:8908 with SMTP id a640c23a62f3a-abc0de19516mr43067066b.40.1740092932201;
        Thu, 20 Feb 2025 15:08:52 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:51 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] media: i2c: imx219: Report streams using frame descriptors
Date: Fri, 21 Feb 2025 01:08:13 +0200
Message-ID: <20250220230818.275262-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_150853_725629_4075CE63 
X-CRM114-Status: GOOD (  13.62  )
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Implement the .get_frame_desc() subdev operation to report information
about streams to the connected CSI-2 receiver. This is required to let
the CSI-2 receiver driver know about virtual channels and data types for
each stream.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index ad1965a91ae3c..4c4ebe54f191b 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -23,6 +23,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -990,6 +991,28 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_state *state;
+	u32 code;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	code = v4l2_subdev_state_get_format(state, 0)->code;
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	fd->entry[0].pixelcode = code;
+	fd->entry[0].stream = 0;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = imx219_get_format_bpp(code) == 8
+				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
 	.s_stream = imx219_set_stream,
 };
@@ -1000,6 +1023,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
 	.enum_frame_size = imx219_enum_frame_size,
+	.get_frame_desc = imx219_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops imx219_subdev_ops = {
-- 
2.48.1


