Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE02C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhX43RkJeHOzyL9QEiVx31rF6Y6JmPRuPUbmR6ly4C4=; b=yCUFnYLWudqHucoI1Zc6c2fNOu
	CBnS8R9xFVMb2KFl+rvTZtT9y0D2WTtIuGwBTxWyqFsRwtOFikE9bej3Iq5SAvYxXhKDHVAJHnaG/
	jR/EZjUN5wDUzKg+j4S7Q7PvavwaJbGbu2BU+8aoC7BmFueE4rxCje1UGPnjqKID2o5qaAFgiqCmw
	UY3xhFShE4/pSUFnjNO42TIcQchmIPvZHzmZFSNptWGBW77xuKoTruxHHvQVU+wXKmSz7wCFaHs+m
	BPkAmpEXlZ+fMkvYkNz5OriX60K5MFV6gilyYknGnAcB/zCv4TcagZNkl7BTWeMNmC6Z/0Ntd6L7T
	hCfNfEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFot-00000003HbC-48f4;
	Thu, 20 Feb 2025 23:19:03 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFf6-00000003FMP-0QMr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 23:08:57 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaec111762bso342568966b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 15:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092934; x=1740697734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhX43RkJeHOzyL9QEiVx31rF6Y6JmPRuPUbmR6ly4C4=;
        b=FlatxObk6gGKdZ2uanXGiRZFNjvQ5ZTQVWSRed3Y5kZQC7JzGUj9X2SVpdgYINpyQ7
         bT5iDLkFBfmRYFqUq/zg8xPneLYkZfQML6jpinYC2jg2urRCTAsgFAEgBxHwFNkxPEeM
         2QeEibpaSfxC4FSKPIP8vvTFGsWJzNVgjrrqbssFpo8hYyrFcZ5+O+w8PW/GjSZdfoQ7
         0juCxbTst9BucgGg0SS4P5smZce4E/TJR2S56EcqcMwTEmaYp5sIfYLgzS33L6fscvN1
         927jvz0vMUprHvxAWWUocW9E8vbwCoGW9DcnXS/CWqVxVN0nkO1dcfbZLY56lTAOqyEj
         tPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092934; x=1740697734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhX43RkJeHOzyL9QEiVx31rF6Y6JmPRuPUbmR6ly4C4=;
        b=r3AZfuW6Ql28zMML3AormsGA4KZbVg4Ql22Dw3woid8+4o/ykQZj195W7HN+GtNJUg
         kSF8AI+YCUYDTrC3d9G9BaVhiTgHn1SBgl+3TohwqSi8kz3k3aCXY8ZYN44tp2YenG4I
         krW9KuVC4MfhI8s049wd8ysWwAzBXo6Gz2HL1wCcxLbu5IQA7U2884k26b+O5n5Guwg+
         Frwq/J4BJ8boDYcwnlIAFEA/GqjOEdI5ZGYVEDppXKBRXZRAM1ZXRIc8A7jS27q3tFp4
         OezqiLfRVJ+AA4cy+WaX2X1oEGfYDAyCIQ+z4U8XLPa5bFbW/FiyeO0OuI/zu2OPnLDw
         ngJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ1KWd/tA5nDz3PNsp9shrieTHiSOaGeWh/Lt+RSSIu13zl0UVZ7uLiH6AvMKnzoQAIATWkXSqQ4q25n4SV3Of@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/M1JxyDLcsQvHZMgPqpE73R1VBGiOrSyvuH7NLYAkDZ85sihh
	bOLa4VSOfjCpIs4vF4ew/KsWJsvRqdfuoWLOVDBlKFY0PIQsfTWs
X-Gm-Gg: ASbGncsSrovE3Z7oz8bfgVuUTP2hrH1BOLlEPz9VR1hZyGrt031BJGepeXaJlSxkPT3
	irrUhG4oeH2GtfxL/OsWoyTf9ujUf45wPZuTaWrXeai0qcBEev5RdhDT82o9RLsgrSnHacV2QZv
	/tb36HLj9tTpmmh+EHEzyk0UXPBOBlAcxDwYCtKfSP/gwCqBEsSDs18hQeyCjmf8PVEbyFecMa3
	9az4g+W2A8m8ZczqPFeIFVeFGKkS0wtwCeEaxv4RcQXHAtR3+zirVVpbMJ/Gh1Fu3KIv0SE7FKr
	oRydqkU8UuzlJzOrwJqB/Iav3MPA
X-Google-Smtp-Source: AGHT+IHN9q1K9iy2cJqlLoBVyZt+NIVwf4Z/pfv0pnr1nZE9X5wgZJrRlMItfXGJSo5vo2ienwvsKA==
X-Received: by 2002:a17:906:4fc7:b0:ab6:dbd2:df78 with SMTP id a640c23a62f3a-abc09d31cd2mr102596866b.35.1740092934282;
        Thu, 20 Feb 2025 15:08:54 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:53 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 6/6] media: i2c: imx219: implement configurable VC ID
Date: Fri, 21 Feb 2025 01:08:14 +0200
Message-ID: <20250220230818.275262-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_150856_139282_BE5C5B63 
X-CRM114-Status: GOOD (  16.76  )
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

IMX219 supports configuring the Virtual Channel ID used for image and
embedded data streams.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/i2c/imx219.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 4c4ebe54f191b..ae93ac2bbe367 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -38,6 +38,8 @@
 #define IMX219_MODE_STANDBY		0x00
 #define IMX219_MODE_STREAMING		0x01
 
+#define IMX219_REG_CSI_CH_ID		CCI_REG8(0x0110)
+
 #define IMX219_REG_CSI_LANE_MODE	CCI_REG8(0x0114)
 #define IMX219_CSI_2_LANE_MODE		0x01
 #define IMX219_CSI_4_LANE_MODE		0x03
@@ -363,6 +365,9 @@ struct imx219 {
 
 	/* Two or Four lanes */
 	u8 lanes;
+
+	/* Virtual channel ID */
+	u8 vc_id;
 };
 
 static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
@@ -724,6 +729,12 @@ static int imx219_configure_lanes(struct imx219 *imx219)
 				  ARRAY_SIZE(imx219_4lane_regs), NULL);
 };
 
+static int imx219_configure_vc(struct imx219 *imx219)
+{
+	return cci_write(imx219->regmap, IMX219_REG_CSI_CH_ID,
+			 imx219->vc_id, NULL);
+}
+
 static int imx219_start_streaming(struct imx219 *imx219,
 				  struct v4l2_subdev_state *state)
 {
@@ -749,6 +760,13 @@ static int imx219_start_streaming(struct imx219 *imx219,
 		goto err_rpm_put;
 	}
 
+	/* Configure Virtual Channel ID */
+	ret = imx219_configure_vc(imx219);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to configure vc\n", __func__);
+		goto err_rpm_put;
+	}
+
 	/* Apply format and crop settings. */
 	ret = imx219_set_framefmt(imx219, state);
 	if (ret) {
@@ -994,6 +1012,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
+	struct imx219 *imx219 = to_imx219(sd);
 	struct v4l2_subdev_state *state;
 	u32 code;
 
@@ -1006,7 +1025,7 @@ static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->entry[0].pixelcode = code;
 	fd->entry[0].stream = 0;
-	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.vc = imx219->vc_id;
 	fd->entry[0].bus.csi2.dt = imx219_get_format_bpp(code) == 8
 				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
 
@@ -1149,6 +1168,13 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 	}
 	imx219->lanes = ep_cfg.bus.mipi_csi2.num_data_lanes;
 
+	if (ep_cfg.bus.mipi_csi2.num_vc_ids > 1) {
+		dev_err_probe(dev, -EINVAL,
+			      "only 1 virtual channel id is supported\n");
+		goto error_out;
+	}
+	imx219->vc_id = ep_cfg.bus.mipi_csi2.vc_ids[0];
+
 	/* Check the link frequency set in device tree */
 	switch (imx219->lanes) {
 	case 2:
-- 
2.48.1


