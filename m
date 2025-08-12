Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017D8C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=; b=ynPbLG3vOCQR4y5qeSl/6acXSD
	BlEndDKoQlggiOAZ6IGpc15n02HRut1C+xbO3iJz/H+vlDNrZ5XRH+yqbYtI4mnF572jLb+acVcXM
	WZ8XiAxiA5K9tHRNyMmr+ahcGP/nItjzrVXgJid+iW1UPIHkRgl+vDfXVfu1CyMA3oCSv97kJkpmJ
	V9rqbOXpT4Ee4gP1tyyApnbkw+EODHsZrMFzEeSYBUlsJQWoLtu2mRFrPnzEltOHqVwf3FZtQ1Rz4
	/Nw24CwCnMcr4F6+96U+ihqvPiagYEGHL5pQ15rpPOD/4GyQ2X7c2nhNmnkTs0W55IY2KT8sNBPhD
	dst6/zaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloN0-0000000ApQu-0yCF;
	Tue, 12 Aug 2025 12:44:50 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulllx-0000000ARyA-3OzX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:58:27 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-458bdde7dedso36074825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992704; x=1755597504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=;
        b=TV38pkc/KtbOCsrIHX4lMhgVEMl3M12+WAW6C9rG0DCZ6fnlWPeu1AAXy2tDvRDQey
         lrNdIR2JwhRT4b1zF9r+JFVzdxhxjloS7Uuf7wlvSajw5KhxtbibQIDfTFupXnlUdj3v
         XjOoYqwNAW/dyEpYozLvDkVVL0/fwHRRNy7fJkzaPiSgM29Vp7LB67tUdlTzRnsYvgev
         vjgGDNbWFw2BHisV8EfMIvTecTDdsYIeD6ln+Ktbx3/kckwpIYo2wqnIpXgURS+qHGCK
         6dEK0DLvWi9FojThF3DX860Zx+qiqDzifFT3aWaIruDyD3HRCQh3vcjJ7B/hV/BoqkNf
         HTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992704; x=1755597504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=;
        b=u524w7RfVszjFEpgML/8A58D9jhEIlFjf627gxU8HI0gscoiB2K3rq9H6HRcrye2fi
         M3tvajIb7ufooXBNQyk07KRPSgXbiX7W13EQ0chKTd081lTvkKvikXJfnJg/WdtGqtoI
         UmI/C/T7O3yUaOw1gYU6pmpdCIhhqxlhsCeGWme+gRShBnmWjJVlQ7zAucwvP9em6MFn
         FsDSp7nspC+dQDiwQfSHScs+7CBwpcZsdtRjK8mY4jbgx7nhxWsF+jfFd+eOd5WCloH5
         cFi0SaKNYgzYEQb7tcDOAUsQvL9WPPRmtQtFWXT0DgrDG+0sF8SPZhhbF2LZcELkcihv
         t+8A==
X-Forwarded-Encrypted: i=1; AJvYcCV6StAsTjIoPgSZWcpj1B+0ugoAoYkqUVTWAJPXg+J/Mtpko2WNp9NfDAR10lKfHtyPjjSIJwkRgahFRoq8KlZ5@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ6GG7qKO6B4FsWQOXZSIy3o0nYca1nb3OFDXf8iVqmpzYSqJ/
	eOt3Y+ZtACAvwBkpy3dK6Yk6IOLuwUZ6UXnyi+nqHatK6k73iup+aY3bmS3KALBLqog=
X-Gm-Gg: ASbGncv0jamUZxAr010E/MMb6aZW1uF6GYDaq2I8Pcdd+91bH6pWNCwlaD9OxLqBH9M
	6tx8vHbYeTMngZl0KMdpLj/kMWi/dVoSeI0xWCF5mL8wlU9d4nHlvi37lJGoT4656bx+H/Tkj7M
	OlmZ712KjgyCvM6hLXi21kq8XHaQw8nhQSGJT2PGbws85Fz0IOnIfCKjBUVzD62EXTwgOGKvReB
	s/+vhP0EhYa/oGKfOZIIzeFUBuE+f3gVhAidF4Gw2b5NYCbrNeLtv8IV5IOiSdGXg1NiXAtu3Uf
	xYDqh6rJNocIyTk6A9CsaAZto8vefwCovo97ThOf9THLgPBrBIYkRV68tUeT0tvhonAwsj6UBG1
	8sY6KkOfvOwV4uQ==
X-Google-Smtp-Source: AGHT+IETc2VFJD6WTh/91nIk+3gAu+AcWC/ofcybzRsIFvbjSdsyABVww9OeJCzbqdCHVlFUHmhimQ==
X-Received: by 2002:a05:6000:2410:b0:3b7:9c28:f856 with SMTP id ffacd0b85a97d-3b91100f0aemr2158938f8f.48.1754992703989;
        Tue, 12 Aug 2025 02:58:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm33098977f8f.50.2025.08.12.02.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:58:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:58:00 +0200
Subject: [PATCH RESEND 05/14] gpio: ts4800: use generic device properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-5-8492f4a4c1e4@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nK9pJAlcVqEpACXDhaB9m0pP1KYR56NEQPbKtHUMK9c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomxAn7DZWSmDqB5J9Fc8ZXnhimTO0gmQTjYaWM
 Kvgc8T9xu+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsQJwAKCRARpy6gFHHX
 cgS6D/9XMPtIAwi0zbr6uiskR2Wqc1guI1zNrelHFgOmZMDydKyTrrc6/W4f0X4mGgR/Qs8jirN
 DBba5LGqFntJJGSuhSVGp77VdKIUYdcPzKC71PgkuGGzERQiWszoYheEZLq4AsaaT9OQgB5X6/L
 CJj3l77/qI0Skc0XmPq98c6DJHkhOLlUnQ9ZYPFgTLe58AeCZEVrRj6HJBTR9YpC/I3InnCnEBc
 FgxOVaifUwTRExnnbPtAEzLEEqmtzoS0q3DBUzKE7z1eLYsG6hi4RBU3E6852/NsqqcSJaKcXYf
 fDS2D+amyX3erOx30crxMbR8ETVK55EcW5fBACwk1nolh0pZk6CXslpMdDOLjh6AFsxl4JrPPC7
 QTZytHNv2fRwK5pTdZFcWzCS3fcy0bveVpi6LgSXTJyhPr6wlNxuig0f6JezrGT2iR4p2lUK6LK
 W47alVB0AeB3Y0PYAJlhEOLNZU1154VTOq1cZYQaWkvyJ1QR6YN/roFuo8bYZEbO0KGZCddgX1R
 jDqTrb+wvonBXo5x05uqluoT3jQMbpc+uxIzNHqpO8eTIhkXVzYhQvOM5evc+QebCmIRiINHrrc
 sjb7gshciOtuWuqIyGy2zX2wQnqISrUU7fTflKa0WOPuptu5g3WofUhpU1Vy3dQPs92vTErZji/
 iC3ZvuVWnOC4Whw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_025825_850646_29E7CAE2 
X-CRM114-Status: GOOD (  14.65  )
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

Avoid pulling in linux/of.h by using the generic device properties.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4800.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 86f7947ca9b2d23292c1e6660fe93c611e0cb837..f4ae87325393c909c66eda3bb7b2f849e645b7a4 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -7,8 +7,8 @@
 
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #define DEFAULT_PIN_NUMBER      16
 #define INPUT_REG_OFFSET        0x00
@@ -17,7 +17,7 @@
 
 static int ts4800_gpio_probe(struct platform_device *pdev)
 {
-	struct device_node *node;
+	struct device *dev = &pdev->dev;
 	struct gpio_chip *chip;
 	void __iomem *base_addr;
 	int retval;
@@ -31,11 +31,7 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(base_addr))
 		return PTR_ERR(base_addr);
 
-	node = pdev->dev.of_node;
-	if (!node)
-		return -EINVAL;
-
-	retval = of_property_read_u32(node, "ngpios", &ngpios);
+	retval = device_property_read_u32(dev, "ngpios", &ngpios);
 	if (retval == -EINVAL)
 		ngpios = DEFAULT_PIN_NUMBER;
 	else if (retval)

-- 
2.48.1


