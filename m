Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E6FC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsaSC2HaVJRroJP0HwzWYTmvmXosq879cETOeyvqI4E=; b=NxKAlonZv6m7o+3MBtkB3fJMtf
	da5wyHvXEUdH1tfsO9A4oZNn0tRZnbWb0ZAeWLE1CyI9b8hnEiNYoltLwaiX6t0oECnSRF32msbiM
	OGMrsKXVmY9EQDqqw2e4gS+M4hZ4YbB1foD9dGsVA122SwKHVLp9U0qsghP4CvnGb4l5qr165PKhZ
	r5q/J4qLqk6UX6tnRhUAdTI/DUF6GyGRGPAd+1eA0+Rq8b9x3NC8w5J3rREiBdzkvCNv+dFcJLqx9
	+W86qKD8dGtxKhNCG/flGhCXfruSLKqs9HgZuKeq7l0Fk2LTX9unzW/B1n3JpdorKyTCPtDqrgQ4R
	H7Bt4a1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gkS-0000000GiZh-1n2M;
	Mon, 07 Apr 2025 07:18:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gbu-0000000GgTS-0elG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 07:09:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso19913135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 00:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009772; x=1744614572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HsaSC2HaVJRroJP0HwzWYTmvmXosq879cETOeyvqI4E=;
        b=SNr/c6Bvv0xoYcvqnITwcDaA7evnY85CUlJtvLlI+1gYWJi1bmNNapfHBTI1M7Z02S
         E1ShW6ZZzRoYnz/RbLPG3qzjyUvM2qTpN9NlJR5ZNDR5IjqvrIquTN2/Xqno/FaV+eCX
         fdcM+fvuI+P9dZW1o0//RK0A5YAN2Ru0w6m+y01n7wofaZ4QnJRh5FOccCnAsRGa38xO
         cL/8NTn9mqeZc2543+SAYi+I41ctXWbsenUYt19ZtnfxLI9RuF2rICrhZn6Vq10WEHHp
         fiyISG/m4W81iwKxIX+c41udAM6yUFii59g9nQHm0iD0t63U/6T5JFIk5WhidEXY2QMu
         bgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009772; x=1744614572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsaSC2HaVJRroJP0HwzWYTmvmXosq879cETOeyvqI4E=;
        b=oLj5odzs8KHSTKQDecbNDdnaqs7HAybMQLE/JPIlZwCkpWYu+LXn+4W/A9xm5ZNBY/
         QzmsoTLPAudmf+Lv7a1sDkdokePBp9JhuDVjXgQf9L8Go1+ASOlUm203krodpBAkPC4P
         wtuiBSeKeIfTYvViKidQRBdQOjAaY7tqx+Ps4r++Qb1YhgLSP9QOzqD0hS6PEOSWSWLk
         0tsFLLffZ03iOwid+q4H9+3lkfs/eDvD3HUiAlh5dAavq+mGh1qX+CT+P3HrWvnRtaAV
         K+KadYS5xUu1GtMTPR4RXhSX6qIYx5Oub2XYOb7IwkB+172QTdbVyXcdiWOZpmQ7NrZ8
         vFKA==
X-Gm-Message-State: AOJu0YwirIbUyLHGBFlRflfIjH1C+qUVqA/KLkcJGdeB9f7Y8fNVbpM/
	t88OhM4SXFvnrFY8eYjhh/4BAoikNMWKofCyndY+xPKY7Jj96HtCspeUh0n2Bsc=
X-Gm-Gg: ASbGncuSwYUMnE14rKJpvSEgYKfzQmS1Y8Abvj5C1eYaNBmYzpZ4jB6RrfNkeZevYCp
	xJPOBiER2pJZuj37wKVPdLMLVOx7cpQsxL7CJHgieBDHBP5g3heVWuLlm9IT/1q9wVDvEbKdO65
	KkT+txTg14FhLYNGefTbVXqI/7uf66JVJZpgrJsUzJP4yR2ChzWBmUSJiVZAR2vylp0KNpgU3yH
	YCcHyZq0lj64rP/4QFnbXxQF3GR1KdyHbAH1ZI4SOlG2zyOt/XfGb6xsPRPUDKrv8pOfmLmJnyP
	+KW1bJZpaZJ7G+6vmyRdbUd3XS91yU8/4ad8Gg==
X-Google-Smtp-Source: AGHT+IFoq+Y3x3L+TzUAPfnpayxhMl0EXTH8ChvoeKZsiBjolFAg72wzCsqeqv6HGqtEWqKDzyAzpA==
X-Received: by 2002:a05:600c:5394:b0:43e:bdf7:7975 with SMTP id 5b1f17b1804b1-43ed0db4aa5mr81239825e9.32.1744009769231;
        Mon, 07 Apr 2025 00:09:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663060sm124622795e9.14.2025.04.07.00.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:09:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:09:21 +0200
Subject: [PATCH 4/4] ARM: s3c/gpio: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-arm-v1-4-9e4a914c7fd4@linaro.org>
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=abv30zYA5XuyGwoeP1ru48ZEwjgixTtNG3nmu6YE3a4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83oktedBQx8pZUxbFWhdPQr1mhvAceAMNekvM
 eg9/SFm5bCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N6JAAKCRARpy6gFHHX
 cr4uD/920+W4HTn/DythHwMtCVrHef5JpB0YFglUyOJ4l+wrZNhV0VZcDRiw3F4l9uygDSEhyso
 biZUtfnWodZkYBVGq/dILl7oXl7vF8oWyBJBOzWK3dQxlFdzjiwjxS61wFDTiJtDqrwoHDBGvTP
 cdZzcOKwYrcWrxD1m8tsHEr4sYBaocCBaMA2DwOBsmTMuwLcnEhYE5HaoI7qjMdz+F5QjH+F5lT
 F4ogzhuGDbEZ6J5R06tmUkVr48izLrPyCCplJRhaREIq62mx+mTilrFqFpqxB2iDdfr46vmCzuJ
 7xIvHs5P4COrgPm6/I5bKr+h3+1VzO7HQFBoDKY2Xuzejttwa3sTTD2RzFuKJiHYYkQM0Oxw178
 Evb4gwQE/VxyQWocnlavibF52tIaBu3yLnHlf677OVaESjEllEOiw4lWfYVjj0vfVMDeR1OMO1/
 +KBoC+MsYFiv2hkzvDRonuAMQITxCp1ygc3x2w6s9X7KYWS1CkudDWlCs/NRSMobunZUcYUkspl
 nsvorsS0oxCLJ07Oetc1JL7Q7A9uln5YELWlRQEIIT8hUBtLX7zVdJtvH6QwPqg5flDaNLjrTz/
 O4tqaQq1mIozfl75z4Xn3k4+O6OudAZzvKN7VnXBJAK8HhrKrll2cDu2DajhxBcH61elXnqtFyn
 KFr7Ne2L2ryXdeA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_000934_200145_AF3D1603 
X-CRM114-Status: GOOD (  14.01  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/mach-s3c/gpio-samsung.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-samsung.c
index 87daaa09e2c3..ea496958f488 100644
--- a/arch/arm/mach-s3c/gpio-samsung.c
+++ b/arch/arm/mach-s3c/gpio-samsung.c
@@ -430,8 +430,8 @@ static int samsung_gpiolib_4bit2_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static void samsung_gpiolib_set(struct gpio_chip *chip,
-				unsigned offset, int value)
+static int samsung_gpiolib_set(struct gpio_chip *chip, unsigned int offset,
+			       int value)
 {
 	struct samsung_gpio_chip *ourchip = to_samsung_gpio(chip);
 	void __iomem *base = ourchip->base;
@@ -447,6 +447,8 @@ static void samsung_gpiolib_set(struct gpio_chip *chip,
 	__raw_writel(dat, base + 0x04);
 
 	samsung_gpio_unlock(ourchip, flags);
+
+	return 0;
 }
 
 static int samsung_gpiolib_get(struct gpio_chip *chip, unsigned offset)
@@ -515,7 +517,7 @@ static void __init samsung_gpiolib_add(struct samsung_gpio_chip *chip)
 	if (!gc->direction_output)
 		gc->direction_output = samsung_gpiolib_2bit_output;
 	if (!gc->set)
-		gc->set = samsung_gpiolib_set;
+		gc->set_rv = samsung_gpiolib_set;
 	if (!gc->get)
 		gc->get = samsung_gpiolib_get;
 

-- 
2.45.2


