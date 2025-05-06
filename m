Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC27C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqmuA8vzWG7JwGdGuncL1WKx+Z40oy7BuFrvWPOr8LE=; b=r06vPS4NnGI6IA6QiFPs5tbsXY
	K8OCtRrpDsgSDIEKyRFdaeSUmLMdeGrn8hvW0BQBAqIecZ/idp4mxVIW/2v0/TOkRe5UeYIGC7kJv
	dfxGyWqyYYGzu0VeSdIHjOFwQjhdald08nOxRCwr9m9jy5sEKB+qVqKEBMTt/BqCkKOcYX+JUqToc
	0gunkeaRwET5RZUjIxNog+INkPD/3quzlE0Y/oRqKZCLa5078HE2sbDuCtKia97tY0JDyyoGEXUXI
	Wi2qcTKi7jjjrUljWxxt9yma24twawKeJ4UfntGh0wjn1jkx9U10kIFHzqM5CeS/8MGSg9Z1muyFN
	04esDGdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCF1T-0000000BTc8-0eXi;
	Tue, 06 May 2025 09:55:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEBd-0000000BFxK-0wPj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:02:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so47279305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522119; x=1747126919; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqmuA8vzWG7JwGdGuncL1WKx+Z40oy7BuFrvWPOr8LE=;
        b=p2SFWkvIoUJQJf6mpzWP8qJnqX5tw6sZxr1wQQ4PDNLA0qVKcsl85vH6RjCGsSIXK4
         ADPZxIxP1Ab1jD7SmSIjq3MTdjFWxk9eLIHBsxBJqz4li5tVOEKLOAtEaSpFP7OMk57k
         R9aRYVqxcqowqhujHaVRyk4CGxaIxdK3iTDPWzs0bwMOukiOqWGCmetVpVWSB08QFCow
         vUWVUNNpO3gk8cpnKRyiTTdUw3u6zx4SI2vObtvK0sZK7vBQ2GMH9bOcD97o2VhS93ef
         08WQnHuPclFbjW6mpUagj75jNr8tz0lgkabU9LTqd05FC1cKf/6SDDhOTiHLFfFUSWve
         Qdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522119; x=1747126919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqmuA8vzWG7JwGdGuncL1WKx+Z40oy7BuFrvWPOr8LE=;
        b=GGV8+DRLxmJZdJiPofqHqG9TdwRkQZP4sArdhbpS5fXD3tnwwkJz4LhAqO7NqwEmVv
         OMpmd8IHKlB79d8XAfRAsVD6TlIHmPhJqBNitLnB+9rgqoRJpltq6W/Q9x+5TxdPnjvs
         Jc3a0/rcK6dXlxCzP8P8nUarJXqu5IR7RMe9qmxfTiSDjj0GEhMYgSWPEaPdw0s3nmyw
         fNI88bQ39ECpSD7f/Nd1GLtPZGtrnZOmV2ZQBOM2Xw6rycfrcgFZG+wOt7VU1wAuQz5N
         j2+9t8CNoV3Q/Mz99PMUsTUv4taD6OP0QRzNmplbNN9p7heqqssVRTLOGfTAwDRIChpv
         kBBA==
X-Forwarded-Encrypted: i=1; AJvYcCV/KkPf3YROTp/qPfseVUJRGBWajxZPwqb3JUCOHWA3E0YD1k1FO6WxTbjag9gXJfiTIgWPbbZDhZChJR0WFiMp@lists.infradead.org
X-Gm-Message-State: AOJu0YxVlaAWMreyPBxxSa649COz68YIyK3ONSY5Hl9a2QH0HW//mUh4
	YWD31FL/0Sd64zvoL2e77twKSfRxT5ETnLgb++eoDzWf1DugASw2xPeDl4k5dE15mOtF3sQiflQ
	s
X-Gm-Gg: ASbGncvD7NqcKhykyqnDc4Dl1gZvDK2IzOiC+fRuAYSAKs+o8gDjm13VBgGm+EOPYaQ
	Qx9XBZN/7v1ATf2D6C+H5WTCxwX5ixeT+6m7KAku9mnINu40TFWmAI/+D5vapopaDW0bwggtmF9
	MB2XL1/cTnuPLqDepOx0rGRDC+n4fHpjbG7VjuRL3OYCd9PVYGuSZiO4rTamVUnaedGGCC4DR4d
	b141UpugjvsUDs+YEv1qQ6G/DdaAu6PwFAFJgx8P3ht5rT7dKbip65deU8HmEqQrY1mtPd2QnwS
	f6BmNHsF8VRCyNCkirubd1c1RrwjDZPhbSY=
X-Google-Smtp-Source: AGHT+IE8JUabBzKM92O/84MQPWd1WLHM3XpE0TI2Ymwc3HYRvwGlfQk0QZso0kEgfuXzy3SeMbuyHQ==
X-Received: by 2002:a05:600c:5105:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-441d100a80emr16950635e9.26.1746522119581;
        Tue, 06 May 2025 02:01:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:49 +0200
Subject: [PATCH 06/12] gpio: max3191x: remove unused callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-6-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uCZv0LrEzy8ud4KkWpNsBzdnLQeoymZc1NVUk4tf4VQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/+AppL2eFtEqFE/Vs0gNp1cXoYKuSQEWvx1
 S2/TAMByK2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/gAKCRARpy6gFHHX
 cq5HD/9HyaQrVcRS2SmjLzWGPQc6hSa3wPn27qklXKNgMw8ZoMukH+bqB5mfDRtM6NUrmQD4x7M
 3vd98abOWOBCZkKheY5mu84Ems1rxlmXI9p1M/Zi4lsYf26yT+Pt4dbMt/ZNXxNxFaF/XMUTQe2
 o+4aglfuV0lO3tHfmy7c9dLk8qEEiHXETDfcpHCJnB+BqDgz8aWwfrQYgMFDbXeTO/FVnBZp8Fw
 SutR3wH+u4ac6VY0sIXN3Zz35TrYg0bWElply7PdiJlVUty2whyWhAGt5YnI16f2OYymRDpb7I5
 nNntQtwTa0J8zJ1ArYsW6JaXlIYdBsdM8nXtqdavnT2FmMHLoIk+4CIzaWZ+PcEq5zBLzXWDPYT
 dZRSIwtUKeHxwJfN4T1yaZcF+WXGR5df4XTKfGEJ47Q3CtrRSClqXFT0kxNZvdgB+ovjRkStec+
 LHnqrVYf08eaSeSstqga6tksa7JA5HKAawG7Qr0ThwJmZ29w0HPY+VdzuNyB85PReUluYKkVlLS
 K75yhDoPQtYTnzkIyjpatRNoJ0whVIQaycWgTndtZlo0/Slg6lDwbN8eehGu5o9UVC2z1nSnWI3
 PaftfnkHNsifK6ahgdM/84ynLS728hSV0wOAmsiykjd9W49dktGiYn/5XHdBEKEuciZvq77o4oU
 02XZNAgeT4PdUwA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020201_267831_253AFD09 
X-CRM114-Status: GOOD (  10.42  )
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

This driver is input-only and as such doesn't need to define empty set()
and direction_output() callbacks. Remove them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-max3191x.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
index fc0708ab5192b..6e6504ab740a4 100644
--- a/drivers/gpio/gpio-max3191x.c
+++ b/drivers/gpio/gpio-max3191x.c
@@ -103,19 +103,6 @@ static int max3191x_direction_input(struct gpio_chip *gpio, unsigned int offset)
 	return 0;
 }
 
-static int max3191x_direction_output(struct gpio_chip *gpio,
-				     unsigned int offset, int value)
-{
-	return -EINVAL;
-}
-
-static void max3191x_set(struct gpio_chip *gpio, unsigned int offset, int value)
-{ }
-
-static void max3191x_set_multiple(struct gpio_chip *gpio, unsigned long *mask,
-				  unsigned long *bits)
-{ }
-
 static unsigned int max3191x_wordlen(struct max3191x_chip *max3191x)
 {
 	return max3191x->mode == STATUS_BYTE_ENABLED ? 2 : 1;
@@ -421,9 +408,6 @@ static int max3191x_probe(struct spi_device *spi)
 
 	max3191x->gpio.get_direction = max3191x_get_direction;
 	max3191x->gpio.direction_input = max3191x_direction_input;
-	max3191x->gpio.direction_output = max3191x_direction_output;
-	max3191x->gpio.set = max3191x_set;
-	max3191x->gpio.set_multiple = max3191x_set_multiple;
 	max3191x->gpio.get = max3191x_get;
 	max3191x->gpio.get_multiple = max3191x_get_multiple;
 	max3191x->gpio.set_config = max3191x_set_config;

-- 
2.45.2


