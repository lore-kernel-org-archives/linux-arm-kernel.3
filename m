Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD87C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1V5REDmi/qwmeZmzS61DPGBCJO64NPZWi8x4XF3HxB0=; b=a+2E/oS9fb3jS3E+1rwV80iLEo
	7XrlYvfxo+aTVxfrRMj2iJVHujThVCCZ6wfpD0vVeiVRqKGhizY20zoudTGrGZrglmtD+9PZ4YtGt
	WHDktD3ijCG/OmTLPhPZk7TvxXNLWTxwicofaniCn1evaO4iiHrgO01v1Ev4j/ozb6H1gksPF1Mjd
	aIWKEkdeMEjgmGW4u/RGTxbK9owl7brQYuWGkXVhAqL4YWhP8pHMioofQAhsL8Yfx0DBinsbg96JQ
	ov7ivuxxKXVpsqgf8HzhvK/rzHn4LAdBPHLEPD10rcEDcKh+FFaWORAyWYMWD14dVq61GCQET1EIB
	nxjQdFuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7Wa-00000001J42-1frF;
	Thu, 20 Feb 2025 14:27:36 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7NE-00000001GTy-1fhe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:17:57 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e02eba02e8so1319531a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 06:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061075; x=1740665875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V5REDmi/qwmeZmzS61DPGBCJO64NPZWi8x4XF3HxB0=;
        b=YTLOiRuMkPC/qBqjTtyFYAU1pAAknG2jsr0IvotExS2P5dJBFjkAZSovifeCj4OxcQ
         saIingPaXpAhkbu2lnJl9v3rYMKL+VdH+BubKZkTBqCSGQSgxSkAmbzKiedwk8zBgTxf
         mLG1nfJx3JBpYJKtyl7VyfzS19yXIsD6JicnInOY3VtqoSjpWlPtQSb8XVwiFHdMVnoO
         uLJ3ab0CUrPlSGej6u/yxcKSNPP1EJxA2ny+BgYW20tp3iBQnVJKTUsr5nIgzGXXFk3Q
         Cs04eUJLZZPheqT+Qyt2NY95rR+HLH6SQwila+cA3min2aWwNV1gAhqUi08hfu0RKTXc
         CEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061075; x=1740665875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1V5REDmi/qwmeZmzS61DPGBCJO64NPZWi8x4XF3HxB0=;
        b=jeeiVFtGcBlAGLx60yOrWNPqcK7V5J6YJ1efRSerSYhhaOR+3VgSZ3ixxkOGy3ZLMz
         IoFgQ3s7ySR9Z4e3MRXIzQY9YIWjAH4OzP2ktj2vuBC8QvBMsQDxf4risvKbZGPdUeUg
         UIGuLW3eZcXOYWEGlU8n/mhwcmILDInmzKLYVDrdn4xwxIZeqviWthRz26CSOWRYouBS
         pXrtddACQM7uU4Da9mA+BgTi8At9C9YxHI86tvgSrS0nJ/5c9Vum1aAl1rJ81FRex4Ng
         50bet0aV6NZ9r1dQiG6C9/VUZtDVD5u9G7t4mklaIKdff2ElWwFZvx0wRMTpInyZVl+J
         psnA==
X-Forwarded-Encrypted: i=1; AJvYcCXcQ5j5LpB9Y29yWdimB+mn6PlYVyuVBQobUFb/2LrNr/+T9WWXcl61uDkkGf134eMu1rqvK1RCUCafgRLylxe4@lists.infradead.org
X-Gm-Message-State: AOJu0YwgxC9dVum6cPAnE78Xfx6AHq0dG96udBRofvixjvmUN06zpDk4
	zzgmhcWRA+AsyyX/vwKwW7mm98UvVI2Qk1o2PGIajLz59V52Dn2o
X-Gm-Gg: ASbGncvd0tXltpXY0iVdceSR4/XrH5a9poREAMCMLlv9cES2UN3IJ8V5mBj6/MVJGT2
	GFl9d4DSGHO5OVJ6eb5pJMWxewPM4lfW5QMs83vdCK7EfFJHYv+8m9xXGnUyNOsixe3YHIxiw3F
	ZYoFAse0727OtEz/3b+WAd91JOKnGOyRrv/I51mQ8MUKGX/fyzd7Wxnm1Ok7NCQNQLJNGzc4HTn
	N1vtX9+6i9I88tM80Tk82dplZSt5C+G+AZsN63qkD4ckmJWAXBEqqzyNCs4cVySqeePJc0Q1u23
	YlSudGkmgBFj5f/RBRJ+fl/9Ga3q
X-Google-Smtp-Source: AGHT+IFFJvKPRHucc1r4QGSkduMvmNCXiQ/0XGioq753EqOOggpo2+xqmAhfLNknWvVEGi+w56gFTw==
X-Received: by 2002:a05:6402:a00e:b0:5dc:ebb8:fe64 with SMTP id 4fb4d7f45d1cf-5e089523080mr6461869a12.14.1740061074548;
        Thu, 20 Feb 2025 06:17:54 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:54 -0800 (PST)
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
Subject: [PATCH 4/6] media: i2c: imx219: pass format's code to imx219_get_format_bpp()
Date: Thu, 20 Feb 2025 16:17:26 +0200
Message-ID: <20250220141739.228714-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_061756_436847_CCEC1B2D 
X-CRM114-Status: GOOD (  12.92  )
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

imx219_get_format_bpp() only uses the code of the format, pass it
instead of the whole format to allow usage when the whole format is not
available.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/i2c/imx219.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index fcd98ee54768e..ad1965a91ae3c 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -387,9 +387,9 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 	return imx219_mbus_formats[i];
 }
 
-static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
+static u32 imx219_get_format_bpp(u32 code)
 {
-	switch (format->code) {
+	switch (code) {
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
@@ -680,7 +680,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 
 	format = v4l2_subdev_state_get_format(state, 0);
 	crop = v4l2_subdev_state_get_crop(state, 0);
-	bpp = imx219_get_format_bpp(format);
+	bpp = imx219_get_format_bpp(format->code);
 
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
 		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
-- 
2.48.1


