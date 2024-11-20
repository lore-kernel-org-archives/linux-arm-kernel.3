Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9885FD743C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 19:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9/cR/dqviroqX2VCS26LbceoYUIdqbcsui+WHfkKVw=; b=feT0mZchKGKgvfDS/MDVCnDWVC
	f4ZA9PiCAXmA3Q8524jSQvpGiiDblzSmjpz5FIcByUuzYcJX3rFcc7wIhWtOCFn4z+RGCWEbZirLf
	ZYA6A0op6MJfgKwCnkyXuXdSUqQkLhH3hOvtH6Dt2JszJSP/0zPxdvR4YWWXyt2o3iS0YAiWCHQFq
	ngai6Ite60UcaL366Optd4bloLmG4QoRACMtw4xDRgz9Kz1SCZRv1TvnCbpQTW8OgRT6TiFNT33GA
	ntXzk0OzCy00FtKvtHsMpFpQPb2bV5XL8TqLIOipM4kqGkHka6S0SZR1NM1JEtBsWM3B+kIx2iZDh
	n8UCtNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDqFW-0000000G6nm-3CHT;
	Wed, 20 Nov 2024 19:20:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDqCi-0000000G61A-3gj1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 19:17:33 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3822ec43fb0so23130f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 11:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732130251; x=1732735051; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9/cR/dqviroqX2VCS26LbceoYUIdqbcsui+WHfkKVw=;
        b=Qyn5smVmkrmJa7SfP/s3/XxLA4DScDuNRxd52jv4RFPZiNea20ViG0UH3ar7K7AirC
         EK0P00wtZ/X6Mm7Op//R2EYg3xlb4Ujw8xwLe9Qbm+nDxJBDTfYK3GPjytg3rViTEpcw
         qJLg9jT9hjVidNX54Qm7XOqvsxQaqHS8Mz5ToQ0AThCjK+CX7Ahu8BM7xhZAn55MLu4h
         a1+NTHiOFgp2qhT89wMWSXYSDsM/2Vxjp6Q+z6hDQa5zaxz7mjuACmH1QQVvsgAFNZUU
         OI0Eyqg8T371OmzPytpeyi1jwHpVKmZAwPWHZytyRUWQrnCs+tvWDkIAZ+YqRoiev2K3
         sclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732130251; x=1732735051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9/cR/dqviroqX2VCS26LbceoYUIdqbcsui+WHfkKVw=;
        b=BwSFcTedVGzXRYWhuiMaO1EFbdPlIJPxJqdXLbVy6a9/M72I+vQE1+MgkssMGA2h9I
         gCH8zPRPBapKb7zcSoGzR5fNEbU+zsJwqvUCdPa32/ONxHcZ390yU6u/H2tt8aowpx01
         n7niPuVoaM9D5XrP3+y5I3cfm7S7HwVhtj3rxNR0aa+wy7k3Qvk3ywDvbPo99pkQ8nbS
         86hevril3MbdlLnsm+a+yugek+dfsPyS6j0DdvZWFZV5Oxd8yZR/hYldxOMLxMdwvFWB
         GnQadYz7pQTuPe1bnyq6g9bfIo6O+PQh2lKw8fCL+TdAzqW0Cwd+zG4QIIKvol6ONSUX
         qZRA==
X-Forwarded-Encrypted: i=1; AJvYcCXEY63CSurYeNuvlGOm6yKJu8lOrvg29b6lje7+XIa2vXuVvbve+wT0qs1kUWM7OGf2pM7QanzXXFoOJ591cWaT@lists.infradead.org
X-Gm-Message-State: AOJu0YwtNt+V3zRUq+yQTm1/U5JD6+GmIjEmGJXLxWtjH21GKdoveM6a
	gori13MILnF/WhNj8CUcbrvmOY0Lj97bZg0ONGBs8T0gYBVh+izpm28gKvdgApE=
X-Google-Smtp-Source: AGHT+IHPj9lIQrPiRfD7rVN0tVOtOkEexmIO3vjJFqQ8BVd0pibyDdS6UXNk2coAs2i3XgIY5wW6Sw==
X-Received: by 2002:a5d:5f52:0:b0:382:47d0:64be with SMTP id ffacd0b85a97d-38254afc606mr2848672f8f.29.1732130250837;
        Wed, 20 Nov 2024 11:17:30 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3825a2c5ef2sm172457f8f.53.2024.11.20.11.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 11:17:30 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 20 Nov 2024 19:17:04 +0000
Subject: [PATCH v2 2/4] media: i2c: imx290: Register 0x3011 varies between
 imx327 and imx290
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-media-imx290-imx462-v2-2-7e562cf191d8@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241120_111732_920070_19296E13 
X-CRM114-Status: GOOD (  13.57  )
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

Reviewing the datasheets, register 0x3011 is meant to be 0x02 on imx327
and 0x00 on imx290.

Move it out of the common registers, and set it appropriately in the
sensor specific sections. (Included for imx290 to be explicit, rather
than relying on the default value).

Fixes: 2d41947ec2c0 ("media: i2c: imx290: Add support for imx327 variant")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index da654deb444a..7d794a509670 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -268,7 +268,6 @@ static const struct cci_reg_sequence imx290_global_init_settings[] = {
 	{ IMX290_WINWV, 1097 },
 	{ IMX290_XSOUTSEL, IMX290_XSOUTSEL_XVSOUTSEL_VSYNC |
 			   IMX290_XSOUTSEL_XHSOUTSEL_HSYNC },
-	{ CCI_REG8(0x3011), 0x02 },
 	{ CCI_REG8(0x3012), 0x64 },
 	{ CCI_REG8(0x3013), 0x00 },
 };
@@ -276,6 +275,7 @@ static const struct cci_reg_sequence imx290_global_init_settings[] = {
 static const struct cci_reg_sequence imx290_global_init_settings_290[] = {
 	{ CCI_REG8(0x300f), 0x00 },
 	{ CCI_REG8(0x3010), 0x21 },
+	{ CCI_REG8(0x3011), 0x00 },
 	{ CCI_REG8(0x3016), 0x09 },
 	{ CCI_REG8(0x3070), 0x02 },
 	{ CCI_REG8(0x3071), 0x11 },
@@ -329,6 +329,7 @@ static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
 };
 
 static const struct cci_reg_sequence imx290_global_init_settings_327[] = {
+	{ CCI_REG8(0x3011), 0x02 },
 	{ CCI_REG8(0x309e), 0x4A },
 	{ CCI_REG8(0x309f), 0x4A },
 	{ CCI_REG8(0x313b), 0x61 },

-- 
2.34.1


