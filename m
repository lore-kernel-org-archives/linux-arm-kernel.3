Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B21C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 07:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bblWb/A3f8Vp31ZlZJvX8Y6uILdxWWSmqIBQEBD8XE=; b=Rc86dpqR/iC113nbNkDsNFO358
	zyPjoDaxqegfbjIJ3GcFR/UumcSrJ8K14goAiz2YKRXHrAX/tUDKrdTA31yWpvCqqgVdA1dEy8sRo
	/7P0ZuRYiXZOArY3IO5o2JG5OAAxFTusUO1SPuIcvitT8aJrqGx8kj2IqIZfB51Q6y3x+d7usZIBX
	+jHITTnb3gL1SnjnrpNQwbHTt03DmyyGZaRxTgS924i1yvRjh7Ytg9EB/YqpskyT+Z7WYLuhUTrjX
	p4elOgFm9AKQE2GyPkzZAss+7WtDwHD8Tsa4ppfFfoJM2Fn43Nl8GXfCW/uP1jnKuDvfrrwSkLV77
	dxhViMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23T8-000000035I3-35Kn;
	Tue, 08 Apr 2025 07:34:02 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23Je-0000000331j-34tq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 07:24:15 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-548409cd2a8so6172574e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 00:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097053; x=1744701853; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bblWb/A3f8Vp31ZlZJvX8Y6uILdxWWSmqIBQEBD8XE=;
        b=TIkULY0G55+hSIJqzLnGL/KpEHN9Z6kuwe/zshQQpckDQxB20glI+QfBmR+GODCHMP
         g3iHSaJ5SbuBj6WciZZkqcky8xZA1Hd8kIy1PhiY3PnlmMsXX99k0zGal2PRU3pHtSsm
         7rYupgUt4mEk8DfUjlEzdOdVpUbSSUXW6VEZfuB665gKy5btl98DpJ0uCHHWGree0urA
         DoeX6lSBQ8F/Tv6SuzpUbDuJFuXvh4aDgOsEl8rF/0hRfdlcUGnDomQgVdA6M9jYvWPi
         PIgajNpPbjo5Rvks7oFgPJJ00G7lKzGMcVYK0YL0+z1dQnYgqvZb34tXobnD0ZpL02G5
         YB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097053; x=1744701853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bblWb/A3f8Vp31ZlZJvX8Y6uILdxWWSmqIBQEBD8XE=;
        b=c9OyvLvGeqeGVAb//zLoqCFXaoW9JQpplfA1VvbL4u6TmMYEHGtxEGafc84ZVPXWzF
         eV+xyo2qNOafKYozLxDNSWXbSyfdkgMljoH1R885drXANi4r4pj/FnGcHjIyDO8idFi2
         C3w8u79U7S3lVQsgA1dEyQBSC9KSh/Aayz+TbLLekqH54iQU2NWgqJXyxQuAtwPApS4X
         9n7n9D6eYx0GP+a5j8dKSd0MxAN3h4fDuqk37ae1iAnpCtzsPKR+CZDx/QhPDthiX5CD
         mmL5ipvl8Ro/y+9dsqTGIK35wDGrvhlQwpW6wCg2TDG8r+lHPYjggQzTY3Z/BzQt/txt
         /d3Q==
X-Gm-Message-State: AOJu0YwkJq8DzYPb1tZI8C1v9r3aXzLjjD+EOZUjUKdu7N3wDvssiIPH
	FUZz0wK216zG6sl5Yf27iS6gimiUzov77Q9CBHCHIsmvrVZM4Br/0Qio6tWtwnMTcOFwxkst6ZE
	kicI=
X-Gm-Gg: ASbGncsNkVOZ6uJjgyGEjWmHuAcnXDmaThVJMaipNkHjrnczqM/4Gj7sXDVrnmYeVFc
	iAaXOhtgw9UFVIKW1CGm58JOSWT7bGW6S8Z3ksZaNCnHiGTCSmDgPGJqw1vSf0P0Xq6NMJY+CeE
	liJskEE5mlZHE4B9VbW7t8f+AwLX4CDNuo98PvcmN7ZMrovqdZ8VIRLWS/3c6OmTshTCnFuY3z2
	mymBuTGuLKPchzfBUoRaXNfik16TIiyvDzHJ3hJuWuD4G5qPNKBNf3B7S9PWR7607mfS+Llq1Po
	dv9rLC+Ol7Tq/XJiO91nmsDy4JwpqyusYkp3Vw==
X-Google-Smtp-Source: AGHT+IHqIWuX5sWz9MJQWDS2IT6lTfF85m614lClDoVvdHMGky/Ix50ZxwKNqFgfUZCLhjcPg/Mzog==
X-Received: by 2002:a05:6000:4313:b0:39c:2669:d786 with SMTP id ffacd0b85a97d-39cb359830amr12025582f8f.19.1744096669312;
        Tue, 08 Apr 2025 00:17:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:38 +0200
Subject: [PATCH 01/10] pinctrl: at91-pio4: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-1-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2256;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6oXQdDn+JiYI7kPrR9MR4Ulr8BlxDaIdgOQst72f6aI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2ZS1CVSr+OpPpLt+g73dsnxK7Cn+5jOBkEm
 S4RhLYFpI2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmQAKCRARpy6gFHHX
 ckshEADgmKAecLNRDwbY5cLUNohPOOEtx7wPD6IeqZgsOFSImxcR1AYiTklwNvcEyx4WnHhAmzb
 oG3lzRmS0xFVCzQi9mX4uHbuIJXP1MxN2ddsgnB6lg1CEj1b4qv6DNNxxtBQ0ipnDwRNuawQcwH
 aeYqABy61n2vfrZJBJVOSi9TQAkdSEJwgvanfueiX/vJnvVKET+cxjJqHSgRCxlPdre/sm0kKMI
 CCPKVMovBcpT7OOGP0j4+p0kCB6NCqevlaTewuoV/h4tWjYpF6SH9gESREPjsk7R213eO+DWr4n
 UFTfB1ByxQw7vd5agHmcng2yl1ZV7SUNOsT5kf6nSoI4cvkeO4ons+t63tePlkRUDoQumIQzhga
 N/mIkjV7W2xjVvZrcZEGS63D38/fzY4sA7sVuWaWgZwWrCrfhPajPxotxjxOsvTWXSWJkfh6ixI
 f2yLdNBgi9wSYNat2UoYPTLeRh3lzFjphWxPajFb+ZQczTx/bXcjtpDXNQewa78BXhZ30rEIrF/
 M3gIErsXpEjyv3RmSJV7CGPdxfLwaxjHq9SZNfNqeeYValUtoqirxITK0jSaQrmdUBMmUx/IqJs
 XwWZMdG3msE++lZ6NvgjhT2WFVsie3VhFAI2l/WdsxXhiwXItFE0r0m2V8VtqyUKn2/YCh5ew2+
 nnZya7p1LkYH6fg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_002414_777818_9333AA22 
X-CRM114-Status: GOOD (  13.86  )
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
 drivers/pinctrl/pinctrl-at91-pio4.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 8b01d312305a..5db839fa9b3f 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -390,7 +390,7 @@ static int atmel_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static void atmel_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
+static int atmel_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
@@ -398,10 +398,12 @@ static void atmel_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 	atmel_gpio_write(atmel_pioctrl, pin->bank,
 			 val ? ATMEL_PIO_SODR : ATMEL_PIO_CODR,
 			 BIT(pin->line));
+
+	return 0;
 }
 
-static void atmel_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
-				    unsigned long *bits)
+static int atmel_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				   unsigned long *bits)
 {
 	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 	unsigned int bank;
@@ -431,6 +433,8 @@ static void atmel_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 		bits[word] >>= ATMEL_PIO_NPINS_PER_BANK;
 #endif
 	}
+
+	return 0;
 }
 
 static struct gpio_chip atmel_gpio_chip = {
@@ -438,8 +442,8 @@ static struct gpio_chip atmel_gpio_chip = {
 	.get                    = atmel_gpio_get,
 	.get_multiple           = atmel_gpio_get_multiple,
 	.direction_output       = atmel_gpio_direction_output,
-	.set                    = atmel_gpio_set,
-	.set_multiple           = atmel_gpio_set_multiple,
+	.set_rv                 = atmel_gpio_set,
+	.set_multiple_rv        = atmel_gpio_set_multiple,
 	.to_irq                 = atmel_gpio_to_irq,
 	.base                   = 0,
 };

-- 
2.45.2


