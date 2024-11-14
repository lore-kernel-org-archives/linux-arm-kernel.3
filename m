Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A64D68B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 16:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7c9J9xmOBZy0E+gA1j8HfGDniMhcLFy7E+lLxJu1Tw=; b=35eFTUwvR2P7Y6ySvLlnd7+cVB
	49J45ERLcvTECUjrKCN0qp1hSm9IqqsSd6CAeGOx4zqEG7iko0HSfWh+tdJWnrdclsFfdOqSg9uzc
	BgQMSz07xAm8XPPw9B9TrYp/nDg7S+TGbV830K27OySkcGDpCXEBZPgKFtkCTPRd8g9qkj8B7m8BV
	pUZFpCUybR7rePAWCVw4QUDoEPnVkvO1pvY/A4rFwZdf5WLZVR5NeNS2ewezd+bi0kepAC0LO+Ns6
	y2vNwlpT0Tw41xARcLe3kXzXOUVPtPB89xudK/ws5mL5CRMATAlWi386qPOivFteKodB2tDUMhnP1
	ugrsnVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcJs-000000001Jw-2mbh;
	Thu, 14 Nov 2024 16:03:44 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcHy-000000000h1-0PgI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 16:01:47 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53c779ef19cso911120e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 08:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1731600104; x=1732204904; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7c9J9xmOBZy0E+gA1j8HfGDniMhcLFy7E+lLxJu1Tw=;
        b=VT5n2XyXXVbKnccn5vOtQ5aoRVd/oeMgQ+yBRb4XDaLjmIeZ9bLUl31egSs4aK+HMT
         CJXjz3J9PmNa1Ains11phEPfpl8CFZA2K5QKRfWrCKyZlihtVPH6czF0ojKWSwrMicH+
         efqI0pfZU7G3XOmxNOlNN8M/PQr2AIdZKSSIMU5CcqSmBbQi7rR7eJkqj9AoHMJ9BHqd
         Ae+ibdNvNo6ldJ+diGJoZuoCVzccfZth+lnPYpZnDAvAH8SrScr430wfKOu3hlY83Bnp
         BOabetxMk0iIrLHbrKO2Bgmrcbr4CX55+hx0hhvqRkPod4isCYAXw0j4iWKVIFUz38vL
         ZkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731600104; x=1732204904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7c9J9xmOBZy0E+gA1j8HfGDniMhcLFy7E+lLxJu1Tw=;
        b=Pqi2Lwev4SCecijrC2sefyTidqcfij4BOlop/2Yo8sDCJorJTkUkdw8MPMmqivW25d
         J/IhLseAFQ4IVLp3ysfFOwx9WtCXi71tRuTUwdYL1r1pCSQLPgj93bthQ+ww4/XTCrpk
         n+NauLWscLWJSim+ha8BU9faihHJMm11bMemxF75fkDCURJts/9H2yYESo98YZnuVOYa
         nKJIuVHve+jR7nZNSAU98s6o23NWJ//zM01/ySvsq69x49kGLSP1MWc9YVS1BZjKWaJb
         DiEE/6e5iFSIGQkwVFgo438NfAn2rPyzerDsGE4yyOEFLphc5cCDhZzSYx1PYIOLlMsG
         WUkw==
X-Forwarded-Encrypted: i=1; AJvYcCUR6JgI67AjyJKY0v9etZm+fIDQ1Dsa1vro57efc69XGXY5XNQoDxFDFIA1dXRXOyF5D+PcZ3S+04w9NBKYYtai@lists.infradead.org
X-Gm-Message-State: AOJu0YyI221vwd/Z8j09tKSxd11clhRMtER80/s9ymTBXhOjKbJRBn/3
	ZzkqnVD/RxEWZUUO0qPSnLECfIn0vjmsBFOVv9S+ulwG61ihov3EdNH2ALN6fBgB8WIQxdYcJhk
	e
X-Google-Smtp-Source: AGHT+IH2B2O4sDgX4PQFuQz83D5q69hXTp9OqNeMo5HRiiv9F39wpipZ5EJMNQCetw5Zzb0qXWSGxQ==
X-Received: by 2002:a05:6512:3b1f:b0:539:f807:ad93 with SMTP id 2adb3069b0e04-53d9feddd90mr4485395e87.38.1731600103640;
        Thu, 14 Nov 2024 08:01:43 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-382200fe00esm1139024f8f.42.2024.11.14.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:01:43 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Nov 2024 16:01:13 +0000
Subject: [PATCH 1/3] media: i2c: imx290: Limit analogue gain according to
 module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-media-imx290-imx462-v1-1-c538a2e24786@raspberrypi.com>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
In-Reply-To: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_080146_204718_495E4170 
X-CRM114-Status: GOOD (  14.74  )
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


