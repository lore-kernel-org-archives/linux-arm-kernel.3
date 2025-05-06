Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E903C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u71xXPv2Cn7JbdcKCIhenriwZi9FR0pSz159YD5Hm9o=; b=D65cb/znhJnfTS/b5Kr03Z92he
	zrau9xP1MuoIkU5XZe0fqm3kdR932Wj1psWWH60C4tL2n8w9V1GQc0pQrNwU5Lztc2VFWGaMtC/Kj
	Qq79qH1Jpaeml1Ch8hwwkFQzLsobleBygcFutBtc8DDeQAz+z9uKQCQ7ubc0P3p4KXE+PtDFUlAXp
	vQe3QR6xJHCH7thDKpUR/wa9xu96M3poFjQAWNx6ry96UE0DnzKxYonw98vzHpGEQ1eIcqAA/bKTN
	9gr7gu1BaP/pi9aXRxBV453zm2sf0jnnmrfrgeeZGb6NsVQZoU7zHf3eUv2PCEUUx7BvMHLRq5Djn
	XVxsQ7xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCF5H-0000000BUNh-2iBq;
	Tue, 06 May 2025 09:59:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEBf-0000000BFy0-00te
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:02:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso23889255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522121; x=1747126921; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u71xXPv2Cn7JbdcKCIhenriwZi9FR0pSz159YD5Hm9o=;
        b=eDydnHz3lK/w1zWNuJezaNqhOm5llsuG6+fUpQ4Ep44+htAFbaMxvT1EFuX7NtuHd6
         SOlQwzGASuxg4ZpkCfyG8nKFxn14eX/exQTTj/PKOJk3RyyKl+/oGFfzzg8f2MnVwWh8
         fLlT1jj6OplmiuKFeqJdKt5JedDkUoF99aYCWrbLBvDjue150qiV2hYn0egXZRJ1jwgI
         /25LA/l/aPfwtU+3sVNp70Rd0MyRDXQR/VEWuAiRJDAKSCIaaLNPhJhkb0dY6DBLjxnp
         TmGQPTQD21NVQhGqhQut5LcN51JEGVzH7O4T5dNd4UpA9DjdUIVXcQbgFJwVh8IR5si3
         R+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522121; x=1747126921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u71xXPv2Cn7JbdcKCIhenriwZi9FR0pSz159YD5Hm9o=;
        b=YsT3hyiHoKaEAb8cnoRSkLQdKz2wNhZJUYScBhEkNqQK1HqgkWs030Az6fikrH0m+2
         UrlP/IwuSPVLsb/ZV9pNrITOIo8iqhQLnmlUBCIU+lnGXNsh0EKknjLmPqTvcvKk+ZfG
         QRh785/MOi07jtbz6+WmsvDXjy8hoew9kyRDWfvm1re0FVY8J6+w3i+zOkOT/9hwkF/p
         qB3mrzFLrYj9VGq+5eBMp+o5XT3QY87JKv85DV6K3QUWpe4UjgjFjkKNf1VcdLQzb8qW
         kHNmPGo/9BKFqz4Vm0GTaBUpYG7EVQnqmvbA8uAwzgwnQVaO16Ydog6j8YhViOSHcpyF
         L3RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAKLSPzeV4XtPVQpBvyv184P/UX1/w6TUqJ25AV4R80xrUrrSg74GoHiWrizcnQ/CWUYkWp55l/gCWrksrKe8K@lists.infradead.org
X-Gm-Message-State: AOJu0YypC517WCT/Uf2fusHctXrKPSyzWk57cXcr3qLFF21A5lBDUNXy
	D5YkA1BbLRLtoWML2/3osqLQFRrrWOwIS7Tu/r+V0VmCA5sSDzVxfruVZFrONno=
X-Gm-Gg: ASbGnctFEmGO5RCcrvctYpB6xa9h90n9DTJqYZeE6q1nTDF4+pZyhd6CDChql6qKffG
	4FLi8j8v9UybMhyZeABGUvUKYGrTSVssPwx4uUSlQjZId6dtqyVKr6H8LQiozFR8EvQBcaMEXn0
	Aq42+em69PJ9J+egygmDA+pp/oUPrTE+jIJ6kSmgfgrGb0rAeS9CcL2x+IRPVh/S9+kfwfJrFws
	iHtsmNT2AH6RZNErMOXBRo5x3A8JpXWZeU45ijbBUdmk3gGiimnyQLT5C+TfoYUdOfRI6kfW6io
	k1/GEMok/g7bfVgAuxfH4SMqJF+v8MBkcMU=
X-Google-Smtp-Source: AGHT+IHXB3gkSMrAkiaEdkZgfwPUxM31hHCvMRRqx1aDQWE8PbU/eLSpr9sDJNShzozwei4n8wZn6A==
X-Received: by 2002:a05:600c:4ec8:b0:43c:f8fc:f686 with SMTP id 5b1f17b1804b1-441d0fbd494mr16499275e9.3.1746522121626;
        Tue, 06 May 2025 02:02:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:02:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:51 +0200
Subject: [PATCH 08/12] gpio: max732x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-8-0fbdea5a9667@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2114;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+ZH07YfdYJrmGtGKxfVboFth3KKtcaZ+GSxu05Ln8Qs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/+lvgMQ4oQLj/Eaktuwp8Im+zWEzU1mIo+f
 E1B/S8mAleJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/gAKCRARpy6gFHHX
 cuuSEAC2pyP7juGwnu8AnZibZ0/xjMAmnRTRcL04Pm0UhdkxVpm+6aQ8khE/D7bgVXSp3FccL/3
 2jYnQ9XYJM+/AHIAlPbtcIpl/Ep16qBqdLQFAZJyudTQw5emHdDNCpAJL6WVcUy7tScevv+93Cq
 +sLanICe0/iy5Eq4PG1Rd//mpz3FIPbR2IfU6aKestqMvnonexknwOY5yc9dTsXlqpxAPVxV88l
 mcYWutkd225tHOYT1MR6QYIDmEK18C+N5qFE/MQWrZWIA7ixLDoPTbW8KSn7u8SKARs3yEF02Z0
 1XrDaB8wlkmlme34eU79hg89bscEmb9ZldhoPAgkpTHlL1+hR+pPCSoV1pVVOgB1GxOjLP1HSsu
 kMrYNPOiO+pauSJaHd3nYHL8CIeLj0yIBT0r1PlOO3ISM0fdlFZYzdZS5Bufh2kCRh2SzYf7nzG
 elYIUetSzi/RDeR5vHN9geaeW1Zi5jF4jldlXsqki83hz840gy2ribrdaj224iQMLfkoKFgbKLc
 ZNkHwV7FZ12U6lT9vuIn0kFyzmtcyeLzkM7MRJgwsQela8SVqVmbud1Q34yl+qyZJvGgaI5gdLs
 Y9jumqWY5pjlx8BSNrkkuR2ZRJU+JE07KiDNkx4YXP4E089iCHnMW+5GQ2krp9kKz5ElnqUFCwi
 +RcqvFGksZTkCqg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020203_048263_ED062775 
X-CRM114-Status: GOOD (  12.46  )
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
 drivers/gpio/gpio-max732x.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 49d362907bc7d..d5ffedb086af4 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -225,16 +225,19 @@ static void max732x_gpio_set_mask(struct gpio_chip *gc, unsigned off, int mask,
 	mutex_unlock(&chip->lock);
 }
 
-static void max732x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
+static int max732x_gpio_set_value(struct gpio_chip *gc, unsigned int off,
+				  int val)
 {
 	unsigned base = off & ~0x7;
 	uint8_t mask = 1u << (off & 0x7);
 
 	max732x_gpio_set_mask(gc, base, mask, val << (off & 0x7));
+
+	return 0;
 }
 
-static void max732x_gpio_set_multiple(struct gpio_chip *gc,
-				      unsigned long *mask, unsigned long *bits)
+static int max732x_gpio_set_multiple(struct gpio_chip *gc,
+				     unsigned long *mask, unsigned long *bits)
 {
 	unsigned mask_lo = mask[0] & 0xff;
 	unsigned mask_hi = (mask[0] >> 8) & 0xff;
@@ -243,6 +246,8 @@ static void max732x_gpio_set_multiple(struct gpio_chip *gc,
 		max732x_gpio_set_mask(gc, 0, mask_lo, bits[0] & 0xff);
 	if (mask_hi)
 		max732x_gpio_set_mask(gc, 8, mask_hi, (bits[0] >> 8) & 0xff);
+
+	return 0;
 }
 
 static int max732x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
@@ -580,8 +585,8 @@ static int max732x_setup_gpio(struct max732x_chip *chip,
 		gc->direction_input = max732x_gpio_direction_input;
 	if (chip->dir_output) {
 		gc->direction_output = max732x_gpio_direction_output;
-		gc->set = max732x_gpio_set_value;
-		gc->set_multiple = max732x_gpio_set_multiple;
+		gc->set_rv = max732x_gpio_set_value;
+		gc->set_multiple_rv = max732x_gpio_set_multiple;
 	}
 	gc->get = max732x_gpio_get_value;
 	gc->can_sleep = true;

-- 
2.45.2


