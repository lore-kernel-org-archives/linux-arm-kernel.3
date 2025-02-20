Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD51DC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrD6Cu+ma2ey5dVvO2q4VCmeyk9hPbaJ87jyuD084/E=; b=UEEOLNjkf3yubANB6WlU9rtJ6l
	C0YDMeLGcoNKptwqc1VuoUsSakM5p5hVyVtXRORbXA0argNuNdt8ePRwhfBpgQlTpZcnCQfg4Edcm
	VOB8jeB2wgtwn9eiQCW/OKFZbtgq4NJ9aCFVvXkVyNtdig2+9HEMCQ/9XNQJj7RGuTRKsfypoBKjC
	6/TFnVpuQaM1eTCR6T9JM8GL3XWDZKVXA9ZK8Asla8Fy/9ntuN38tyr+8OeEkZgWZYZSW1inmZKGa
	yqRMcj+Jy5m/ntTw2cLk7MFTbVlPhxo94TRx72D2N6r9RV0kbLyhPeXgVuz7jbc6XyjEjpNXpe9RW
	JAOdPG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7ZW-00000001K1f-31j9;
	Thu, 20 Feb 2025 14:30:38 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7NL-00000001GX3-0jeO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:18:04 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso1551100a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 06:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061081; x=1740665881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrD6Cu+ma2ey5dVvO2q4VCmeyk9hPbaJ87jyuD084/E=;
        b=OlGsxHX/lB6gjPNwqb67/RJdmyoWHF2bcNWGCVcWbbZgdHwAqdEYGL+NzYpBi39gUo
         t4Fl4z1Ntg2t3pEFqN4ttuJptBIygwumEBWPYwe1/OWtR1s+UxSArBToavtX/7T1SfJc
         0rEMLpY32yWu74I0SYvnmvnrlqmhkFlq24eWXsqZg8bpHhG5+8nrNBeBX6gNuMsbMISQ
         4xHjKvrfYROJkB6KhfJh2cq4zTJJwWSxHhhwCjYE27TmvjGSBuNvGotI9d4e0Nd/9paC
         wJP3DKNNI4VdbIzJi5yA4Vj0gKAqAeY3hc3uuZzwDQsmjlrFWKnXXo1Fr2+E6O/p+Hux
         DISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061081; x=1740665881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrD6Cu+ma2ey5dVvO2q4VCmeyk9hPbaJ87jyuD084/E=;
        b=Eq0I4Nk2pac3viJzEhRI6WHjfr01lveuagKeFyaE+IF2NBq0WzbC9ypZ9aUtCVQjEX
         Ep7WXeJJ7iDs5dENFYpedbz/Ev0uWbSRmY/q93GIxzPl4+K/RZR++UZsJsoSCrocjv3d
         CcuxYeqONuYt+pAT3r/RdVka3V+UmDqLiq3HnECSkLnpmo22y0tWPtgkLWLTwIVNPm4r
         SY/bQi+OUa2cg+yq+Gcss0NNp+i06IkF6CqLmoh3LMz9Kh6hwi0zBLxWPv11vonOdXSe
         lcG6d0HqYtqOfAyGppRKG2gc+dmhd1WK+/p5BsS4WOsFH7YjjNKAjBrmnwaIsfuCUIEJ
         7Vaw==
X-Forwarded-Encrypted: i=1; AJvYcCXr/CXf85GxlmDDQMOvvStk6rdWS2vLcQaden+5koCespUtmxrTZSzpNbkE2okNdlLzBK1Lt4M04C5xxocOg1cm@lists.infradead.org
X-Gm-Message-State: AOJu0YxGFNK1UiKxhfIs9BBHU2T1R7ibGW0lIAX/0ktE1JBvg84iyYej
	T2ZInM8QikgLqgwx7PXK5h/TzOe34T7LtlrzFvEL231+znBfL5pxOYgS0w==
X-Gm-Gg: ASbGncs+yjCW93y2YPHUWc4vrr+PSdXkp7HtTwTihcdjdw91wUb+HbaFZ6mY0xmwZjt
	zPvllqdqB6lDjbWTtvidm/efDzYShnJwmv7FoVChkoDURi5BnUZQ9si2LTCjh8Rmtt6fgQHSVu7
	ZVrrtWDJdSOReSCgOUdcP8rTD+bcGRM57m5Unlv/zqrrPJ2JAwCaSwlvoys2D2Rq2UstZT6liFR
	0FN8sa8M4INPazgqZOaJiOvGC//3XknEiGeiqguU6xnfx2daU/F8HpX2Y29r1ZbY5mSbdQbcB6Q
	ulDgezfQZaiwwtTKtX7uYg3wfkFQ
X-Google-Smtp-Source: AGHT+IEI5BjiSueHGowWB7V0AX0jphOzOkC+hVJDCuWo2okxV45XHcKYucaW0FwCHe0/kc3RlhAM1g==
X-Received: by 2002:a05:6402:35c1:b0:5e0:3f83:92ab with SMTP id 4fb4d7f45d1cf-5e0a4bcbb50mr2539326a12.30.1740061081463;
        Thu, 20 Feb 2025 06:18:01 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:18:00 -0800 (PST)
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
Subject: [PATCH 6/6] media: i2c: imx219: implement configurable VC ID
Date: Thu, 20 Feb 2025 16:17:28 +0200
Message-ID: <20250220141739.228714-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_061803_211204_7A702405 
X-CRM114-Status: GOOD (  16.20  )
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
 drivers/media/i2c/imx219.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 4c4ebe54f191b..5790106b35936 100644
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
@@ -749,6 +760,11 @@ static int imx219_start_streaming(struct imx219 *imx219,
 		goto err_rpm_put;
 	}
 
+	/* Configure Virtual Channel ID */
+	ret = imx219_configure_vc(imx219);
+	if (ret)
+		return ret;
+
 	/* Apply format and crop settings. */
 	ret = imx219_set_framefmt(imx219, state);
 	if (ret) {
@@ -994,6 +1010,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
+	struct imx219 *imx219 = to_imx219(sd);
 	struct v4l2_subdev_state *state;
 	u32 code;
 
@@ -1006,7 +1023,7 @@ static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->entry[0].pixelcode = code;
 	fd->entry[0].stream = 0;
-	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.vc = imx219->vc_id;
 	fd->entry[0].bus.csi2.dt = imx219_get_format_bpp(code) == 8
 				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
 
@@ -1149,6 +1166,13 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
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


