Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1303FC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MPclfNXGHsV8MZaXGNXPoIUNkZUY12DESp/EGnzFtA=; b=ZFms5eXc5uDgQxX3L46MzS8zjx
	5hR4TUYFrEVHfHIaDfxtWxivMfiMYxWWkGrA88gcpW6AUSfodT6nXTAzOBBE9Jt5rJOFiNW7iROUD
	qeW05E+AsYAo0LzWEfssB2XtP5hHZgg9u9/T7tncwzUFkp9zu9tRRw4KXa2Ag4uUUqx6CqR94Lik1
	SBBEoP3wEnffCedxftl1Uo8V/UyqXS9/KGQM3LG4r/FwjAoVToMIJ2i/9qNKuSH5reYTgWWxSB33P
	FZ3dvYOssdv6PYRtCk8MPN6f3YCUdf8eCNBYQrysPMdNF861S6m62xDAXjaNsqK6VbW84ZVuGeIHG
	8zK6XDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ulv-00000009Ykv-0evm;
	Wed, 23 Apr 2025 07:43:55 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKP-00000009TYA-1Lcf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:15:31 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3995ff6b066so3237111f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392528; x=1745997328; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MPclfNXGHsV8MZaXGNXPoIUNkZUY12DESp/EGnzFtA=;
        b=AQVQlG4uW3u+kUieATcsHRihm9dla9iU05N867qK8u0OyKCXbil1K0cFJ1uSMx7W2H
         euqjzXruYFbTdluyo8AIyLHsdmt/h1X4leUYNSgq1cI6wVRBx9NiNazm5KYxcQYfAV2u
         f9ZU0q6IXP8WJfn0chHGuvPupu/AXsQ4t3jRmoKE2PMq61sAIxZKq1HroQJS25P8aQmq
         fjhtHlTFF2Z41n7zC1THXy+qmTmNcuzaeERWnpEvRpxbjy2M55qncg/Ws03Cz6PrBjhU
         Su9wnC1fOOR/QzycafLcLztnL7JSVWPTWDDlQH2vXEs7sUqQ8X4FJjg/o6fMKUeu2K0T
         HtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392528; x=1745997328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MPclfNXGHsV8MZaXGNXPoIUNkZUY12DESp/EGnzFtA=;
        b=hcOYZ8TZEqS0X7BmU7WQpFjT54T/ETexSVkD16FvxtDg3w6OOVPk1RHLr0tyMWOdSj
         9lCPY1fYcnQiADmNy4Nh7NtJpmp+72mHX2YeZt+TwdllV8Rfl8qUuPlAgChbhtHzrmxZ
         hdY4m3mXIhTVeFN/VtpdUVx81RZz/Py9Ptt0GfGFMxb9tr5o/nDnxWFQP3y4q3fDvWmO
         4b+NTkQJVnF35qJ9pA/E0+QIpfGUecNwE3P5AyYPrBF1FIVkOAFqSOL6IhtL/5VrIas6
         62yeIkap5AgKBDOWAeIplAiMxzIquurwsfi8slypvDJERLgJ425GfA2TZ72jljoHKZYh
         iljw==
X-Forwarded-Encrypted: i=1; AJvYcCUBqkqcjoAofZk19Og5NAOXSf6mIOqFdMCCdiL4KIM4JiTGCHrnInV85Hiu0AtIfcY3NXxJYd96oEk/yXzcMN6S@lists.infradead.org
X-Gm-Message-State: AOJu0YxpGhCSzQ7WbVgpdnsBA3eJGppfPlcHUxeLItLH51WmHbg9dOF5
	SoBg+UdZg8VxvOT/qJD06FSVyuCzbYwHEhpCIzQjEJYlHa7WE8XxX4m7DuGq4bM=
X-Gm-Gg: ASbGncu3JEhX03DRFJXey1I11yGKIiR3b3ODzwKC7h0lTKB/HTlrqpG0aiXaQjUCuFK
	te0nPhtiVbFyTLuKUkUpgPKmPRiZeUaSo3Tv+2XjeLxlz2mIQmmj+paCpmBCybMEeAHtM41IYFm
	NCS9fgsuD4toOKvnjCccbiZidfxs3uOngPgMgnnz/xwUDFf+B1Z14tshhiubOTBxtMq4yY79+1o
	+DozTsr4TmhbXN303H5HBt0yYCBepbG0yWP4/ofw/2nvYmdgQ/bOSo5moP+2LAJccLWAGCLBPes
	L5XaDMV/zxkNDgUDy5ce3b0+caURflSl0Q==
X-Google-Smtp-Source: AGHT+IE+EYnrfW54icqKEGRQVESmbeO48iqpEBpeyStDk2tewi09mNWNZhnFX5SLcVdwpUyDg1P6zw==
X-Received: by 2002:a05:6000:228a:b0:39d:6f2b:e74d with SMTP id ffacd0b85a97d-39efbae02a8mr15795824f8f.39.1745392527777;
        Wed, 23 Apr 2025 00:15:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:13 +0200
Subject: [PATCH 11/12] gpio: loongson: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-11-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=99W25ILmVjnRf/yi2U9/4v/maPAhA/fNyMvWAd93oJw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJODuW1HwT5L1heIPW8u0acldNLxdbYmai+QB
 lCwyKbDCsqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgwAKCRARpy6gFHHX
 coNPEADBSAcxIsHdv3O6rLXDUMyohTqVcWNFYAMTwTqpb1HtgvRkHOabZqgoyERJ6y2hD9u1xeT
 LH5bBYVhdTXqAJSrMktvY/zTtO4hBbdFE1xgJLwB1qE+SsxnNL376z1PEoIWyJ1NZv6ZvhepPJH
 h5ckAt+F9XLL3pD03wOQXRXl7sUmsEbXEb72stmtgYIs2XE7o/5QRHWvmORaLInPdeCCV64w+NO
 pE1nmuWlRyZcNJ12iMJcmDeI93N+N/rIk0Wr0z4rk7gjiv2wsUvZMgKicQMeI43XEhfcsgdloQa
 vQ1KjIPR69EU42UH7WjYSlhdcn0nvU48In+PnIzDTk1EY5X87IEnShhQD8rCfiV8QYdfyQq9dHb
 2iSyRO9phbOJmQu8kfNbUuQrlwqJtvs6k9BlCVJ863HuyqBFhB0hvcxchOjIKZKhobV1in6uSxi
 lNxKCwfcmT82uYTDXRo8xvU6OosAsEg3jdNbREVJ19+WFQaQXSpGxKoW8VyNC1FFEWckucx4j/R
 UN/ChK+jIEeoK9VbnyYII9PSqWi9f63XZrDfA0WmATPC7zWUoRJ5AiyOQZgLWfjEJYTvxXyOWqp
 qvTPJyXN6SalFAOVDoHuVF1QdSMM0BV4ey6hVpSqGNN/BDvOZMQw7aqCot8ow8ftgamkYh/zsOP
 pxsEDKbDN+/kk4g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001529_367781_B9949DFA 
X-CRM114-Status: GOOD (  12.63  )
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
 drivers/gpio/gpio-loongson.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
index a42145873cc9..8f3668169ebf 100644
--- a/drivers/gpio/gpio-loongson.c
+++ b/drivers/gpio/gpio-loongson.c
@@ -48,8 +48,8 @@ static int loongson_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 	return !!(val & BIT(gpio + LOONGSON_GPIO_IN_OFFSET));
 }
 
-static void loongson_gpio_set_value(struct gpio_chip *chip,
-		unsigned gpio, int value)
+static int loongson_gpio_set_value(struct gpio_chip *chip, unsigned int gpio,
+				   int value)
 {
 	u32 val;
 
@@ -61,6 +61,8 @@ static void loongson_gpio_set_value(struct gpio_chip *chip,
 		val &= ~BIT(gpio);
 	LOONGSON_GPIODATA = val;
 	spin_unlock(&gpio_lock);
+
+	return 0;
 }
 
 static int loongson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
@@ -104,7 +106,7 @@ static int loongson_gpio_probe(struct platform_device *pdev)
 	gc->base = 0;
 	gc->ngpio = LOONGSON_N_GPIO;
 	gc->get = loongson_gpio_get_value;
-	gc->set = loongson_gpio_set_value;
+	gc->set_rv = loongson_gpio_set_value;
 	gc->direction_input = loongson_gpio_direction_input;
 	gc->direction_output = loongson_gpio_direction_output;
 

-- 
2.45.2


