Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1C7CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwyOQFxKD6v8+Vijfrpb6af7Tgda7juGJv7xRyBxXBI=; b=Ji5PQ6cOyTdmmsUZ8Yj4Y85bc9
	ZyZBv7z9gJ6VYDW+px1JgiN0jTs1kYil5lnpwJNz7sam1aHWmNUcrJPsBQtbgvMjJWuJdOdoCMXJb
	TULRgW1T4lMjIUewu8t/ZdSAogSXTTS22e5DDtdBG3ds5xLB/qVWgXbdbjh4+PAuNeMu5nI8J4CER
	qJqYCKcj+bUqzNfQ5UHOazLgEZqooLKDUiDaIYSRSzxQWSNpWNqZPrq3ZKdl/BlEstGrAMW71tB3T
	5QHy5ulTHn0lPC3X42rJqnBfOaoB2SlWwD0zhul5D6TvRMYrQd7+TwWOtu0yZxnIHy5f5kMFxhiZI
	rjWuUiQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4F6-00000000wA1-2QsL;
	Wed, 29 Oct 2025 11:21:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4En-00000000vqi-3KJc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:21:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so4915165f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736868; x=1762341668; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwyOQFxKD6v8+Vijfrpb6af7Tgda7juGJv7xRyBxXBI=;
        b=ZaKZNv0yJ1EobMz0KgciY8gdanuqdSFR2J6YssMzkpgZdnn9Zxb+fVwIFjJRjEZYUr
         EPVPKpCTIuNC7VIPfm+QuzeKyiogDsUO5BdB0plyO6WJ35pVOD/56qfiJkDOSOiZHahJ
         ToQk/4l9daGl1lEtDo4JmM3h0rvRjuHmQrK2pRakL7HKBcysqlGsNtljfnx4hseTr2MI
         6yt2mbOdXrJpztZ8mGW7xlEZNBoCi2blPKIXL3sXtkRTsu7CUIpDuenGANqXIbs4Ou9o
         jjbIa85C4S4IjMrLtUsIvSogmAl1Z8C2G7ruCmkc9PtBZE5OQkguswFzxNerfK3xM5xg
         5j1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736868; x=1762341668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwyOQFxKD6v8+Vijfrpb6af7Tgda7juGJv7xRyBxXBI=;
        b=Du2KJuz5HG1Sj9QYwzDodp7Vy189VlPBgLLhHFkcoq+m5tU540PPWO6uVXyxJiB7uQ
         9qrmHbq1ohzKQxDcZooRTgJbxmTcAQSpRF80o7tQ/dy21fOGeVshVizol/1V3x3dBMfK
         XwMM1etoCUqLzmJzuHjh10OY36yFsIAvSumvkfJV/NjWrZ+1P8H5ioPZ/8Zz638SKztU
         miaSJQ2G4RoI/9BAaMR6Kx34zu1mLFaTPs8MgB3Ub51sCX3OIDo8s4yb3aZi0hoyJ15e
         uTrhIOQIU6Z6rg2Oa60iRCm5xecBRW2KDMc0Jl6DUU2S3md6roe26XRHs5HvSAZovrk2
         vR5A==
X-Forwarded-Encrypted: i=1; AJvYcCX/7FpDeyFtLeOl5pmSG8wcu3BxULAx8Ho9J6KJtFBFb+ndrtvtAyQ64giI23oj+p3cnFmrWzxiove2oK2VXqYt@lists.infradead.org
X-Gm-Message-State: AOJu0YzUj3HtqT1F6LaqJvkwDOrtegyGcq5w2O54lPWK15OMRUO7IYJ+
	CYVFWFiGkBgMQ3aK17GGd9amCiR8/ih7oRFAR44BD9buxLQfvYIos+xd7l76aCq/Lqg=
X-Gm-Gg: ASbGncvTvuKSwN/osmbVQbwWpwD1ocbljUlW3XhNgVKUM6sOs1FCVK74/UpvGlsLrXp
	GQMQUMM3VEmz3iR8Ao5hoOjLT90zCGaAGYQf17mAgZbxTNjjVXOYO0/MmsLRLXhGJppHLrYlHNo
	HlghJIwqwPb96fVMznNMW4M6xSihsmw5OHcejFFg/hkJyciqbN9RcTXuRXVwEqtqSM4qZhq/oE6
	wS0vjEjcq3eili47aX+ignzW2Ml7byUIi73cHC1hxg29wmwjQ56duVoannOSyp4IKjF6y+tdhsj
	khwO++P6X0/IiNOwY0k8DjjQ6VqvuPSeEym/92fti8f0krX7v60yJcNegcr46wodxALp6korILU
	KkDAYPZpXV0u3ZTUdscB7oLWx+AX86QmQELsmOYgp2/TMjxTnB3GspHZXhCPvuxcyd9PW9g==
X-Google-Smtp-Source: AGHT+IFIp7+UTDG8Mo+34fKN/ODFuhtxQqO8HkLZOExm++avTsEPa/O05hlDIAIwB6f3V1lsHOMS/A==
X-Received: by 2002:a05:6000:3107:b0:427:370:20a3 with SMTP id ffacd0b85a97d-429aefbdc04mr2206317f8f.38.1761736867751;
        Wed, 29 Oct 2025 04:21:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:42 +0100
Subject: [PATCH v3 06/10] gpio: provide gpiod_is_shared()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-6-71c568acf47c@linaro.org>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4764;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SHc2LMOdJGlhdyjQkFVMTs07D3cYT7+feKhUydYkGmE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiW0Na3G1N5t7fsKNsK2pUTfvrIgTuAwZdX6
 A4Q9KaaezWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lgAKCRARpy6gFHHX
 ckPbEACjlYkF7MWG/wEbiOP6H5JvyALh/B9OFrKmPM1LM/UFQaXskpAsIWILwlcCFQjmfYb/OK5
 f0auh39mZpVSR2cHXl+2KYaEIZ4xmlTl1UATnRKrCt5QtWCGuLtwG5i/O/EFvrPpei3vJFFiO1R
 EPF2Li4Kd2y5OA0QrCf3ssPORs9Hl5e/QUvvSwCL/m8mfJ2AN3DZ13SVezWk5O3jGLPAYXEwO6p
 tCkFlhEvpIDQ5m1FuzjcphPFgK+NZsTnr3pgxjnEF3morSktQxFraqnL+McdZTMJiWaawgXw1Vo
 QgTg3JAOlq6kgoh4NrdYAlg7mboV3GtNssgRbqENq5p5fDK4LIp0xkfz1Zda18Qqe4ucpr/Pf1z
 XmLT5hl3Ee8hkY2Iu/zXhK618YH3gerDRmED6d/XCL7TWkEq/UvTpXmNWOKlxjTZ2a2Y3kx9xqs
 gTFnUcpokMmLC/eFwEcQIT6b+GClp+ufnH/l94/28rSRZt4QNNkULCrOSNMKLX+t+eA//Chxyfg
 GD9dFaGpJ7aQAk9OHImV+xhowrQPJ3ZVhjkmou5X6XoVqt8KxP9s5MXJDFOoF7kquHTIUqIZZ0j
 2FwjrM28Mg70hu4fkzW7MXfppWUYje8SFOGvWWDIj/I5yYNrugag4ZHP3U3mTnZXrUM4WHo62uO
 lr9QzzS3hxNQ5Dg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042109_895061_602EE587 
X-CRM114-Status: GOOD (  22.07  )
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

Provide an interface allowing consumers to check if a GPIO descriptor
represents a GPIO that can potentially be shared by multiple consumers
at the same time. This is exposed to allow subsystems that already
work around the limitations of the current non-exclusive GPIO handling
in some ways, to gradually convert to relying on the new shared GPIO
feature of GPIOLIB.

Extend the gpiolib-shared module to mark the GPIO shared proxy
descriptors with a flag checked by the new interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-shared.c | 18 ++++++++++++++++++
 drivers/gpio/gpiolib.c        | 20 ++++++++++++++++++++
 drivers/gpio/gpiolib.h        |  1 +
 include/linux/gpio/consumer.h |  9 +++++++++
 4 files changed, 48 insertions(+)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 56b9b03cbb6dbcdf095a656fc36ff321770035da..c22eaf05eef23a7f5f111708c3db9412c4c30231 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -314,6 +314,24 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
 
 	guard(mutex)(&gpio_shared_lock);
 
+	list_for_each_entry(entry, &gpio_shared_list, list) {
+		list_for_each_entry(ref, &entry->refs, list) {
+			if (gdev->dev.parent == &ref->adev.dev) {
+				/*
+				 * This is a shared GPIO proxy. Mark its
+				 * descriptor as such and return here.
+				 */
+				__set_bit(GPIOD_FLAG_SHARED_PROXY,
+					  &gdev->descs[0].flags);
+				return 0;
+			}
+		}
+	}
+
+	/*
+	 * This is not a shared GPIO proxy but it still may be the device
+	 * exposing shared pins. Find them and create the proxy devices.
+	 */
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c0c0e9370f150c340a7c79dc03c5afec64a440f4..fb4311d41161051dfd3c996b6e8e9e8556b97cbc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3997,6 +3997,26 @@ int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name)
 }
 EXPORT_SYMBOL_GPL(gpiod_set_consumer_name);
 
+/**
+ * gpiod_is_shared() - check if this GPIO can be shared by multiple consumers
+ * @desc: GPIO to inspect
+ *
+ * Returns:
+ * True if this GPIO can be shared by multiple consumers at once. False if it's
+ * a regular, exclusive GPIO.
+ *
+ * Note:
+ * This function returning true does not mean that this GPIO is currently being
+ * shared. It means the GPIO core has registered the fact that the firmware
+ * configuration indicates that it can be shared by multiple consumers and is
+ * in charge of arbitrating the access.
+ */
+bool gpiod_is_shared(const struct gpio_desc *desc)
+{
+	return test_bit(GPIOD_FLAG_SHARED_PROXY, &desc->flags);
+}
+EXPORT_SYMBOL_GPL(gpiod_is_shared);
+
 /**
  * gpiod_to_irq() - return the IRQ corresponding to a GPIO
  * @desc: gpio whose IRQ will be returned (already requested)
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index c9de4bb10584206f4888c0f28468762a3680aae6..77f6f2936dc263a67b31a38799a841128a57603a 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -205,6 +205,7 @@ struct gpio_desc {
 #define GPIOD_FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
 #define GPIOD_FLAG_EVENT_CLOCK_HTE	19 /* GPIO CDEV reports hardware timestamps in events */
 #define GPIOD_FLAG_SHARED		20 /* GPIO is shared by multiple consumers */
+#define GPIOD_FLAG_SHARED_PROXY		21 /* GPIO is a virtual proxy to a physically shared pin. */
 
 	/* Connection label */
 	struct gpio_desc_label __rcu *label;
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 994d46874d560416175c9099e18180237839bd4c..cafeb7a40ad1c25aeb7deaf598410d5f2f004a82 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -167,6 +167,8 @@ int gpiod_cansleep(const struct gpio_desc *desc);
 int gpiod_to_irq(const struct gpio_desc *desc);
 int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
 
+bool gpiod_is_shared(const struct gpio_desc *desc);
+
 /* Convert between the old gpio_ and new gpiod_ interfaces */
 struct gpio_desc *gpio_to_desc(unsigned gpio);
 int desc_to_gpio(const struct gpio_desc *desc);
@@ -522,6 +524,13 @@ static inline int gpiod_set_consumer_name(struct gpio_desc *desc,
 	return -EINVAL;
 }
 
+static inline bool gpiod_is_shared(const struct gpio_desc *desc)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(desc);
+	return false;
+}
+
 static inline struct gpio_desc *gpio_to_desc(unsigned gpio)
 {
 	return NULL;

-- 
2.48.1


