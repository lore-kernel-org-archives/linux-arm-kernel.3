Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9367C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMHaAkSc/mi83kBCslhtD5+Hl3KktEIZpzS91Yh6h2M=; b=O9FXzK1M/laKc6Rex0/QKPE0f6
	+Ih47wfdDzw7FlVu0Db0k+F82YRjqaYckMb7ZezfMykog96GgddqhMBqU1mHN4tSId+QGx2htvtNn
	4Vu7wfe/jQZAde/m1wrPFxWbrylQe3LKX/lnrXYEc/qd8u82UEgRt7selqmnGpFs/E/hfgsjwmqZ2
	/U09ou2qkPu2LHFaHt1tbQbiKGmnbCeRBOrKyLsjA+ky0Sk1IdeQEOmUzxnrHm1D3dFEvvyMqWN+t
	bbSaLlWYH+K/9UCNCwZw/xQbb8bL/rHJBno4tnFwHs6zu0rBcfxOpgLPtWD7lFM9pNRPcZCmO9QIv
	PPSaJDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBIZ-0000000CZWO-3WZY;
	Thu, 19 Jun 2025 09:11:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAiI-0000000CRKn-3Ubq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 08:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AMHaAkSc/mi83kBCslhtD5+Hl3KktEIZpzS91Yh6h2M=; b=oTlnYTUCKcn+EQQ1jPkykJ1RLF
	gdMYoOfzla5aKLKRVVBMjwrUsNclGTY6gZMh2rvbtGKyQYh8Dul34G5+oGo8UMCliL6gPhD2xT5XN
	Nskt6jVhuZpNlyWv/M5rW3FVrBYJPG2imdENh8NWupYe+wqdjwRs1AUfJAoReKZr5K2LPzijnLFX0
	diLwjn84m6FMCDbnLv9oWAZYF0KI564fqozCCXmXtD45aaOpSbZTucxBNe9C5EETzyd/RU/pneK6L
	KwnUyKJACUcQ3lIRdYkJv1GMwbswyLonvVN7vdS2UV7qYXx69qKug01O+As9CV6sLBq99DZZ0MstK
	vS6+noug==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAiG-00000004Nq0-2qMH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:33:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso4004755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322014; x=1750926814; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMHaAkSc/mi83kBCslhtD5+Hl3KktEIZpzS91Yh6h2M=;
        b=Q3x/J3XjhM5VZASyDwz98PVMuc7ExNt0SJPnSDPYvz2qbTXsdaRbLSZYs0jlaJs558
         kWunSm7d+DIhCkbMcVv5RCbM92DbCJ0zodf/kfaU/JY4mxdM1whmUI3BWr29YnKqGTsw
         xh5h9v0cTlkVPW6QMrpvVi4WnM/mYWSBnby/NKV6PQ2qrXdlIPnER/cg5200Too6rNeU
         h9vjGxdush3JPLNzUYVERJFUbm07qhQRdn/KygwtL61bMasNi1v1gMMTDcFLxDTw2KlJ
         flFu1YVt3yFV2dYTnxO3P3qwWCdz7G6xn6VVF4LDBabYqGjJtRCnJI+/vLNRj7YYL+N+
         TDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322014; x=1750926814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMHaAkSc/mi83kBCslhtD5+Hl3KktEIZpzS91Yh6h2M=;
        b=oaLZLRcrMYVgAtrOdzgevaSqafh1YFiQDdYT8TIJ3Vbcz+NAuvZ0yPIEa48fBq93Ql
         nfsaeHaJXCeRKPKrHAhctE0p9Kq2oI6LQBlcbZDUx2zXjEMOEFVH+3ftfx/cCH6E/ma6
         C/w0J/Vz5qttcj7v5sDN3i+fymNAtU6ItH/tf5T568gZvh/qsVQJjNfgEd+UEeULSjk6
         s4F1bn6YsYhMa9eGouZ5Joj1cPjZMQ9feVLay4VgSDbcu6Vn9t1o/R6jXhq0MRfPB7m7
         B1aNTEJClT+yOPHot1NpMOhjmdCmHXKgptm0zGR/MLlr5L02nBhQSk870VBDZcjHK4T3
         Qndg==
X-Forwarded-Encrypted: i=1; AJvYcCUFTvg86rxUR7PfMdk5UU+hzugygbUp7LvBEyoT7G+dMi9YyU/Ju0lnKdj9EeTAQ3kGTG/8Z/u0h/lmjHtlKAch@lists.infradead.org
X-Gm-Message-State: AOJu0YwZB4PrUT1KSPmlK2fy9eoZPIZipa7fkzLY2NkD6+RAbJAgaczu
	4Pmbo1ikXgWQ3a/w5M9WVCrZY82wmNaShshdbDcyyhA5QCpFao1dj4GoPO8G0IyOZV8=
X-Gm-Gg: ASbGncs1y0ktA7VPfHECVC3f4hkR51pS0UqKvbHF6LGqgFjKK8rilaoQTh/ram9irsI
	joVvBp6L2W4uw7W10ccfgEnZjIYNnyzFkasZ3yeYtRKHh1eNBj1Fh1FSNs6eSK5mfEK8qhrU0E6
	L4bi2+LlomTtYf2YjWq33Pfvzq1BVxHru/1zwGFU4e2PTN0J+ODc3RPgOWBf6qhh8xQUuxG1LTi
	RITgzlDNvriV6fmiErWVq/FWXfnnJyMOLx+w4WYFVAdSxaR155rMRRvz/cx7ggMJkBSIpu3TWtp
	oRYsh/2AzT7feUyCEiJVTMIrdEoB1vE2zU5twvFIGGbrIA6X07QGRlwo
X-Google-Smtp-Source: AGHT+IEhu8xC4VxkK8D9y/IzWa7IE8mDdOLXw/zM9eziYcYO06FvESnlV4hQatzpue43BXOUc1GptA==
X-Received: by 2002:a05:600c:674a:b0:453:dda:a52e with SMTP id 5b1f17b1804b1-4533cad28b6mr179151175e9.33.1750322014059;
        Thu, 19 Jun 2025 01:33:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:21 +0200
Subject: [PATCH v2 08/12] gpio: rdc321x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-8-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/FTgaK1cWGc0DF5sQuXKwdEauaSqv0NFqrELnWAzquo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tSnuKbzHD0kBPGGPIrGC9b8qHlgSZpDe/Nl
 /r9LV/9112JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUgAKCRARpy6gFHHX
 cpppEAC8RwVAaPlajD9OEFEZmq9MCIAXiIYRgG5/b2nHs3KNntWqL//mWx9dmU1WzpQn39fw3Xq
 54qItaAMTtJVR7Ok6px0QA7xvOmK8exjF0AibgNZWkDnDu0jxXoOS0lUjn91yY51gL1LIqNpK+/
 m2GfPgRLaDPRy8sDWUezXb+u2HBhpOLWWRX33x+QTPVB4F67ri66CvcmDCiVou6Kyy7RNCEwRO8
 t8+lVxl5KyE6FNyAX3+nUWFq3dVOnLGcGK5AEbpKhF9Ho7M94LLbTthkWETb9dG+6BdpPEzJn3X
 Y6ZenbKzHOLjRkv9g/jb3ivNuMnqWedVOoQnC98hoz1DXHWtakIS60+xX7BJUvJc6aCoGiNhOe2
 o5I9kBFYOF8iwdn94Hvvh5+poPJGpuRaIuX8Xuikqmvo+b8cU/UeC16gHp1wOLnOci9bz/6SwK5
 IU7dotGSRGQAAXKT9q5y8Ue1723khYjt8QYHavZA+R3s/SvWCY4Qu3YL+TkasH5x2Mn+Bpe4MYN
 c4EKErHmU0mnLxxfIbL/lYKmkqYN7uOscb5iJDYkd3R0GLE3mBBDeAfeqGpqoZRXBsx5JX8HZe0
 OByPtqosTCnUi1LkQheHJCv8kNnRTMl6iOlz+6Rw6e18MCMvRGFVWQm1UkdwUkcjLJAqQniLweV
 B7jLW9cNfptPhnQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_093336_851910_193C1D39 
X-CRM114-Status: GOOD (  13.47  )
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
 drivers/gpio/gpio-rdc321x.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.c
index ec7fb9220a4747fad5dfdb88e25e68d2a104e37a..a75ed8021de57db122938e4736c3ac994bcdd2d1 100644
--- a/drivers/gpio/gpio-rdc321x.c
+++ b/drivers/gpio/gpio-rdc321x.c
@@ -64,8 +64,8 @@ static void rdc_gpio_set_value_impl(struct gpio_chip *chip,
 }
 
 /* set GPIO pin to value */
-static void rdc_gpio_set_value(struct gpio_chip *chip,
-				unsigned gpio, int value)
+static int rdc_gpio_set_value(struct gpio_chip *chip, unsigned int gpio,
+			      int value)
 {
 	struct rdc321x_gpio *gpch;
 
@@ -73,6 +73,8 @@ static void rdc_gpio_set_value(struct gpio_chip *chip,
 	spin_lock(&gpch->lock);
 	rdc_gpio_set_value_impl(chip, gpio, value);
 	spin_unlock(&gpch->lock);
+
+	return 0;
 }
 
 static int rdc_gpio_config(struct gpio_chip *chip,
@@ -157,7 +159,7 @@ static int rdc321x_gpio_probe(struct platform_device *pdev)
 	rdc321x_gpio_dev->chip.direction_input = rdc_gpio_direction_input;
 	rdc321x_gpio_dev->chip.direction_output = rdc_gpio_config;
 	rdc321x_gpio_dev->chip.get = rdc_gpio_get_value;
-	rdc321x_gpio_dev->chip.set = rdc_gpio_set_value;
+	rdc321x_gpio_dev->chip.set_rv = rdc_gpio_set_value;
 	rdc321x_gpio_dev->chip.base = 0;
 	rdc321x_gpio_dev->chip.ngpio = pdata->max_gpios;
 

-- 
2.48.1


