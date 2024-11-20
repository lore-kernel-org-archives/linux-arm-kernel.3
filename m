Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115C6D743C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 19:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgfFBue2AkaNv5wDd17S+yzXIWjDIT3WyGaTAc0rklw=; b=vtZChRfSItZS+cEm2W3BE7TjJR
	kO6IS1aDq/wNb5w+ZpM79ucZDN5wRyp9591hGprtip8UgvbpGY2KVNQMoEfeC3iSytQHTPuy78pS7
	IFK9aMbUUEZJTht8Rd1ZvAWyXek+seTYVeCnIEReOMyAtAtSjkkbp7eEo51IAISzNq4soTT3Bt7j3
	OUzcIvFI/ykkG9JImC803GN58DHYZ7LcEJqxdnJT35Ed50p/TbGc+8rCsDxP2/3FqdoN4RNyZgPhy
	XQnI/M1TT4u8kxcNkfxs1vzrJyxW+rRzdremNTIVGzGLFKPrx8U+ocJmPiD/V/fcWpSqebYDbo+L2
	H1/Y7C0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDqEc-0000000G6Pd-0YyH;
	Wed, 20 Nov 2024 19:19:30 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDqCi-0000000G60t-2GOk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 19:17:33 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3823eaad37aso816703f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 11:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732130250; x=1732735050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgfFBue2AkaNv5wDd17S+yzXIWjDIT3WyGaTAc0rklw=;
        b=b/eJ5vY3vLCSu2ZTbGAWZRPc+6cMlHsnQ9oy9hJWZdmMq2hACj01a5Dv9LCsxoRJAv
         u3eDyisd4ZewkKaPi0ZqG5SEy86bT+PiizEHg1H3NT3xDucTtXDKIgjH+gWbR5geroIG
         4bE5xoeVzF5CDNlV2BZ0RbXe0qLqPFuUtCOyBJFrm+rnD5Lyq/70Y/TU1JDpcwY1pSdI
         x1LyCt5hg3vVuGOT4JYn79lXHVOSK0IBlPXpKfel/mYNHEuflmMnuOoFzAd8BPT+Gp6E
         tayS+AQS+zQ6VCQimqcev+dvuu3hKDZw7pVRC2MwJT34qrR+HW+/43b9OoW6Tx1ZVugV
         c4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732130250; x=1732735050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgfFBue2AkaNv5wDd17S+yzXIWjDIT3WyGaTAc0rklw=;
        b=lRDeavaF13JVfwhKGHb6DezgPIvlIOR6dH3pY+BjclgBGWYSGxaGRctoS29p2lMIkc
         mzUfOa7F0L/skJKKtJHDiLNm6HQZuH3cPVwMmUsw4b5EMH6DE0j72okGtAnppz0ADwUq
         k6TENFX6nFnRErRtbu8PDT84iu7SuqlauTMTkF9wM4lw/pVbRGw5ZzNdqJTWFnMRuDfU
         7Ev4EUPPRrp3UFdbQ0gF6J+kFJY7l2l+JgtEOzwrElgJMzmMevzeoIGOnf19YposCNVX
         /PCKdY9XuwQTmZs3HNi7lwSyTG6YttbyYDsCEGPBaXS56avkM/t3YsYMSJPXxLR0ado6
         4nKw==
X-Forwarded-Encrypted: i=1; AJvYcCWRpp/dQQtHR7B9b4CiCbo358M92W9xFvHyAj2PeIqO+d74QubwlziCXtIsTM0wkHlzfTxJ+xUsjomLJ/IbT+mA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8OnZVZxlxmbtMZL3Kvvh6fN4qQWhAbzxpvVBscCb+WQYaHc6B
	bzAffWq9TNaTOs4AhuxWp5LKf8qOT+OwopqLOmjphv5m3Rpbk0g4MVDzy1Kj5pQ=
X-Google-Smtp-Source: AGHT+IGRjU3aR6hDFtQjH3HQ8wJcv1fdKmnNHnvgyBmRdYlp1FR7+auWuZyFrR8i92B4uErsUqc05A==
X-Received: by 2002:a5d:584f:0:b0:381:ed32:d604 with SMTP id ffacd0b85a97d-38259ccea2fmr432108f8f.10.1732130249896;
        Wed, 20 Nov 2024 11:17:29 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3825a2c5ef2sm172457f8f.53.2024.11.20.11.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 11:17:29 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 20 Nov 2024 19:17:03 +0000
Subject: [PATCH v2 1/4] media: i2c: imx290: Limit analogue gain according
 to module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-media-imx290-imx462-v2-1-7e562cf191d8@raspberrypi.com>
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
In-Reply-To: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_111732_581097_4103605E 
X-CRM114-Status: GOOD (  14.96  )
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

The imx327 only supports up to 29.4dB of analogue gain, vs
the imx290 going up to 30dB. Both are in 0.3dB steps.

As we now have model specific config, fix this mismatch,
and delete the comment referencing it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index ee698c99001d..da654deb444a 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -176,6 +176,7 @@ struct imx290_model_info {
 	enum imx290_colour_variant colour_variant;
 	const struct cci_reg_sequence *init_regs;
 	size_t init_regs_num;
+	unsigned int max_analog_gain;
 	const char *name;
 };
 
@@ -876,14 +877,10 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	 * up to 72.0dB (240) add further digital gain. Limit the range to
 	 * analog gain only, support for digital gain can be added separately
 	 * if needed.
-	 *
-	 * The IMX327 and IMX462 are largely compatible with the IMX290, but
-	 * have an analog gain range of 0.0dB to 29.4dB and 42dB of digital
-	 * gain. When support for those sensors gets added to the driver, the
-	 * gain control should be adjusted accordingly.
 	 */
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-			  V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
+			  V4L2_CID_ANALOGUE_GAIN, 0,
+			  imx290->model->max_analog_gain, 1, 0);
 
 	/*
 	 * Correct range will be determined through imx290_ctrl_update setting
@@ -1441,18 +1438,21 @@ static const struct imx290_model_info imx290_models[] = {
 		.colour_variant = IMX290_VARIANT_COLOUR,
 		.init_regs = imx290_global_init_settings_290,
 		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_290),
+		.max_analog_gain = 100,
 		.name = "imx290",
 	},
 	[IMX290_MODEL_IMX290LLR] = {
 		.colour_variant = IMX290_VARIANT_MONO,
 		.init_regs = imx290_global_init_settings_290,
 		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_290),
+		.max_analog_gain = 100,
 		.name = "imx290",
 	},
 	[IMX290_MODEL_IMX327LQR] = {
 		.colour_variant = IMX290_VARIANT_COLOUR,
 		.init_regs = imx290_global_init_settings_327,
 		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_327),
+		.max_analog_gain = 98,
 		.name = "imx327",
 	},
 };

-- 
2.34.1


