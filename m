Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B2CC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1V5REDmi/qwmeZmzS61DPGBCJO64NPZWi8x4XF3HxB0=; b=TQJ6OcgwM5QR3te7mcORKEoKEB
	NCzwkX3bBLLS6b57OlSCefRc8qJYFinaJsMx0WK1tiYWP4vj56It2lnjDH8p5q3K1YwJH7gkvDTLY
	UXR8mA0puBbZM4e4iTqxPB33wq7dFP9aOvWUFdJQLe6BSG+UVKJF+prC/Jos3LUcbwxWHbRvmuTEC
	fJFql9IZxL4bbgVkfkqyeKe/PmQhqXeXOzIrMQKCf2UBqZTayXkVAjTlJuC4y0qa47JJmwcvU1VkL
	3f1oZSnac7bkIvXH7jMG+F+OlOhx1vcM77ayjpZ73hainFwaKADk3VHJZne8Uo/5Bh1aOW4muwfFD
	gWcALJ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFly-00000003Gvq-2uos;
	Thu, 20 Feb 2025 23:16:02 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFf0-00000003FJh-2j3c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 23:08:51 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ab771575040so464176366b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 15:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092929; x=1740697729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V5REDmi/qwmeZmzS61DPGBCJO64NPZWi8x4XF3HxB0=;
        b=Rt3Chlq++uM51vR3rdo9zbAe8Gi/jDw3NVEOSMpluZY4fywKjcHEsPcPHFWAVTWi0v
         vIso7V7vV7Ik4wK7pdxMccpQ3dFkxCoJEmD7RgdbusISEltYemS69imACskFZz7HR6zh
         egyetU9wRR8LlarAfOUO0rc9cTvfz1ypz7IOx2SCcufZbqFqQevRZnBrahCLOrt3mMeE
         dgL+akKsuvr+9VqBBO4fScct4wlF0XXvDKN79jGwYNf1xgTa1r0t4HT4b/ntW0fVX3Sk
         KISi7oWc6JIxWFHrJwTNPTkUAthav/ANxRGskjNmBapbrwvL+VrLDi1zXMw4a/DvfD9U
         A5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092929; x=1740697729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1V5REDmi/qwmeZmzS61DPGBCJO64NPZWi8x4XF3HxB0=;
        b=HycOVVAeQWscLve+qQagXRe4PFEj4RxON5ctS3GFa7uIfKlpYMu7u3kKd0cN49035d
         No7xXXCFcXsaRKWSKlgZgcW3dxRAuuXGhP1Mvbqxv+UPrKUHwNJHdDu7I9XcgzSFRRQp
         tkQK8Od9VEdWHNxhj6AP/juBg3y6tFzcXalyPhTmFDGfFKy8kJYxpaVh1XH8feCkslDz
         Cg5OQeMxrxs1FucqjIuvGQMWXg+Vej13BYQGB7SCAea5tL1d4Q7udtzVsNOlOPo2fmXC
         AVM/SE049D4wGsfjo0O0PdSZHF6SsyhXaj4CpYHidrBAs51ZahsBgdZdVc6v3TgTPtJi
         lmog==
X-Forwarded-Encrypted: i=1; AJvYcCWnGLo+nTsLMabsZ5KUHS89joL8O0U4b82frLEkmuOTz4J9V95bsIfM0s308VE70hwUagatWs+pXcx81KmEZQMj@lists.infradead.org
X-Gm-Message-State: AOJu0YzTfbBbqgTekNlcoJwfvdtVR+QhCsn7Sptl9pBx2pYFfHk4uwZd
	uwgtHxipaYw1+cO6TnevzT34zhb68/+haxphnjdetwoXYb+9zaSP
X-Gm-Gg: ASbGnctN5wPq1KuMmoJuEybCIBHIESi0XLKRzLFqYmKLnNjm4+gUiTHz90uddezjEkA
	sZguDitfCbNIizGz8Ejug+0/27GqQzzhgPnQfI421B7T69+1qt2iLlHnoE0+Vmq243tO7T3f4sp
	pYyq4hVnTRy6dFT2k0YwWuWHF8qX20zuffuY6+s1vp+zUYuOIdYrYhqlV6vMMd3X39phY2gp33H
	S4vESkOCFnluCUdDMLPLBTWJjVW6XYawtac02q9HQ3J3V7WEciA/IksU6e7ZL6dUcygpUGDbzeH
	E3r0KSc2Qm9H0Zw2WzISIoWCnVbL
X-Google-Smtp-Source: AGHT+IEydEuTk0agw+AF9f8wYzDAN5oKuTWK4h1DVKaFvIYPrYzGCYHJkQgTkbLioaZGj3jOXXoyBA==
X-Received: by 2002:a17:906:318b:b0:ab7:b7b5:2a0c with SMTP id a640c23a62f3a-abc0ae1b6e9mr76032266b.6.1740092928857;
        Thu, 20 Feb 2025 15:08:48 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:48 -0800 (PST)
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
Subject: [PATCH v2 4/6] media: i2c: imx219: pass format's code to imx219_get_format_bpp()
Date: Fri, 21 Feb 2025 01:08:12 +0200
Message-ID: <20250220230818.275262-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_150850_682595_1D4BB6B2 
X-CRM114-Status: GOOD (  13.18  )
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


