Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3D7CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6UVlAeR3fwHCFjy4a5d3B3zx2pe4QnNId31mWH7HxM=; b=M+QTHvLMx6Xet8vxFFA/dcjC3d
	a0Ta8o7qEXpoQFut7MG2U3f72gD12s+b4okeJowuvyN34zb7b8RNHAzrG+ADpdhenOUpphhl+TDB1
	8FPKiD2tppxu7UMn7HAST0mcWRUTRXzWCUvxhLz0caWqPTLCKFHgRDE/lfmlZnNd+OLp0cYYVHhRV
	GDMCzUjUAfBHjs6439eGYF4qUOqjIyQt4eCPLtz/YDulWGXXVN6mtLWXWrZTiATo5dIOsxCRtbkDF
	nW/zh94K1+Bz9pDkS3RsCUZr1CpuDFqxs+prBQvGAxbTTQETmNShrrgyw4eTgjJQpc2+xgOuvr/+j
	boPgKyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqsY-0000000BceD-3l6W;
	Tue, 26 Aug 2025 10:26:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq5F-0000000BR0D-42pC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:35:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3c79f0a606fso1701650f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200916; x=1756805716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6UVlAeR3fwHCFjy4a5d3B3zx2pe4QnNId31mWH7HxM=;
        b=tSahmB80/bR8wFRkcUP7iJzbUljj7gnjCkS19fZQ78eLGLsjyGEG39PAxEFSgTJMmK
         P8l2lqxVPfNufG3xfjqGaPc+GpjSSYpTQiJBTTTDPodaZ2gSbDYsOlS4XfDj1z4jOKMn
         eWAK41yv4N8VPIPlgXOAb34KbB0Jw9arOIa2IA5ABi7hTM/5OdwcR9XHdLSQt5lXt/fs
         mMrzkY69RjzQ7L4o9zGgCIqcwFORtH75Ce4nRDoXCprEWNgROFK0TX90Py0tnJqDV/By
         xV+iQNM9RVHhd5tSsV3cGYCh20jk34Rh/CwWe2k+DVtnlxYcKDLarBhTgW5EgYK61DUW
         aUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200916; x=1756805716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6UVlAeR3fwHCFjy4a5d3B3zx2pe4QnNId31mWH7HxM=;
        b=IKG8qRY26Cd4sgAUtfF2PtY/9LwmQ+uO2c/j8baQbXqJ5PbvM1DXlkUNhEehTpWk7V
         qYiejzsjYOQkxcGwxHLcrgtEnO7YQtdeIaHlpGDIgecI5+fUeEDN+eEyoNny0QN/LGjx
         nMp1ex9McPgIpqxIVbDdh7vKysdUeYaxV4hp+o7KPreCQKrAzXKDs8okl5WW/y8fBYrn
         ujROeQrttAWZVMWIERCiRtqQUDGOwVFuqW/6V1SHlCiFoEGRPZcIXkbVBlceBwDFFKH4
         vTpnzrMe3aOtxu73BniBT+BcDjVlx3SCnU3/oUObuHYSjd89+O3b+nuw8XTQ6GnfYUcQ
         HZ2g==
X-Forwarded-Encrypted: i=1; AJvYcCVb75ZsbRB0rG4Gkbyga0hd5wPcRWqpLSZTQaLlG1dnOJZMlkv10NsijB2OIIeVm3E4R4tpDPALzc2CDPqNnLkp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4LxqYPm5BOYfDQrvhGO4coeuJtzGuAxjB7esyCWDK8by+2WI2
	J9rYq24pHiZZ3AiDfqFL/xo04tnEufcD8c7se/k7lwrKLQJQAKuWUL3LsFv6zWqqqro=
X-Gm-Gg: ASbGncvIkV2TWBNz/hIhaxCwS/RxL7msg4DrVvg+YsGyXCwAmyZJ7Dfcdxz1/wtgqaF
	IQacrdXROxd5znvUcHC6tmI9xgF8l+zDJxQSQiNb2zugT3z0lKhZL3EWm8JweLqztMPDqfkj7xw
	BOuBkiLql8tN89/H8r44u70oaXuDSmVZ76K+I8/UnfTcdrKj1I32WzJoPfD181V80FSVjW3CVBa
	KEzoQF2Rzyu+iQX7SrMbOXLJeAUugJQ3VbC5dC4+QPaWXyGz1wOsjATj4xz8Bd0iloIjhSfIxC0
	eRAru0aqj3foz5Zu/96wXomNgSGgbM75A9hYKMcX8IOZqWCQLfTt6tAZcYipWinr1dgnPIqHJH+
	MezLyp1/PDKv2FJHm
X-Google-Smtp-Source: AGHT+IHHMs8HHGoX5pQrBguiSZlF9A3BQe4UKuEJbCj0cIrDBD5J1SUnyxSXmIGXuAVtd2TxeU4iVA==
X-Received: by 2002:a5d:5d0a:0:b0:3b8:f358:e80d with SMTP id ffacd0b85a97d-3c5db8ab097mr12681160f8f.5.1756200916017;
        Tue, 26 Aug 2025 02:35:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:05 +0200
Subject: [PATCH 04/12] gpio: mlxbf2: use dev_err_probe() where applicable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-4-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1971;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4Y9QgbF00FoI4B/3f7jAJj3cl2aWhCMkDNYuPbS1EZY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/Mp2Ad+I7SUoOZM6v519gOx/CLUv6RIzX8O
 Ar5I9b0l/mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zAAKCRARpy6gFHHX
 csC1D/4se4kSHgMsVlmXVig251ULGbAuknuYAURfTPA+Gx/KWNnNaq2HC17vXfvReZjWV+38lSW
 RKsntS3xYeQEEwKabO82u1QzKaWhqgxHiWa2HPldhJNj4h24871wvnXhv4sMXdHFHa+FhVexotj
 tJIw9MPiRgqECLk4Sq4ww6+9xZ3KlEPSjEYfz6mHT0rQeO8vpzHge3towl0LkAar3hPV37QjEAg
 6kmt58UNYU6ZoAaRB6YZHmkKDCOPNY4YdrtKxv+wGTsqGizXc0KDHgU1mdyj4Xln+g6ZYFyKtLy
 F/WXoZPBa8oTZpYXi4yC+at09xkqkNquwPrMkSvUweF5lZSxWqyKRlS3mklC2K729dq3ykdFsoQ
 vESYOohtsAMjdEusqxNc4hAlbIfWcb3DHsOKpWPKm2VBMJ7WMX4xHWE5vOdrpga0dac6pKDMhFH
 uWmPPI7P8kqcHGdfVe+UaGyTxGasjE5z2B2r6Zs+V/rTJ/zMpVMjZ/sSXGEDejFQhyazm+MV+04
 eh5BDWYp9VbxaAIjL0IfIK6CMkIrCMgpoeDIV/Tz3lj4ZYNQCuHi3fe5u3nCDwEUjUb+j3PdUE0
 3hOTlZKXsSLqw1CyligsQHbM6AlryxzOPZTeW5jD3psp16PB1l3ih/gQWZGfMYL1zGuj3ROcDdR
 6ZxueVzBhI6xB+A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023518_019760_03DF6B82 
X-CRM114-Status: GOOD (  11.47  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify error handling and shrink the code by using dev_err_probe()
consistently across the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mlxbf2.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 390f2e74a9d8193f924ee50f4a8f2d7bc6ae2168..bc4bba8b567c2605a77d4f9d4d7d916e8b096569 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -369,10 +369,8 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(gs->gpio_io);
 
 	ret = mlxbf2_gpio_get_lock_res(pdev);
-	if (ret) {
-		dev_err(dev, "Failed to get yu_arm_gpio_lock resource\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get yu_arm_gpio_lock resource\n");
 
 	if (device_property_read_u32(dev, "npins", &npins))
 		npins = MLXBF2_GPIO_MAX_PINS_PER_BLOCK;
@@ -387,10 +385,8 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 			NULL,
 			0);
 
-	if (ret) {
-		dev_err(dev, "bgpio_init failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "bgpio_init failed\n");
 
 	gc->direction_input = mlxbf2_gpio_direction_input;
 	gc->direction_output = mlxbf2_gpio_direction_output;
@@ -414,19 +410,15 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 		 */
 		ret = devm_request_irq(dev, irq, mlxbf2_gpio_irq_handler,
 				       IRQF_SHARED, name, gs);
-		if (ret) {
-			dev_err(dev, "failed to request IRQ");
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to request IRQ");
 	}
 
 	platform_set_drvdata(pdev, gs);
 
 	ret = devm_gpiochip_add_data(dev, &gs->gc, gs);
-	if (ret) {
-		dev_err(dev, "Failed adding memory mapped gpiochip\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed adding memory mapped gpiochip\n");
 
 	return 0;
 }

-- 
2.48.1


