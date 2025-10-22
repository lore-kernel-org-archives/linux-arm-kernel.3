Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2462ACCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmyJwyGotfh3JyXhmJS/1rlzs+tHyJOuYkq2PFxtZmQ=; b=Xc86wDeGiYSksSyWuCZ63cG6j3
	uykxtIXdCHG+wZoV/YM+V806ll16vIxaTTKWeU6vdALQtWGhWAhQrIsLIx8MvLNxlEBKGNwPjUwqE
	RzIrsHZtmFYCyg/y5gWRCXNr2x0ejJ3U8ZDP8usokaGtlRQKvFvlFPT8Ua0EhOWNW5g7zayhzTKZE
	I/B8fVblqjDrBC9v5n0/wvRtNN9DzfR9WMjtF+GGDSpEHi4MnK9OKi0P+0qsPcqRNt159wKCt0X0K
	QlRNcS8uVDRlIUAJu7QXvXFvMxgk2iIXC2eGqxGOKWMZH9rbmChUqBouYhwWnTbqtGlYvyEnNZT/w
	Pti3LjsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcn-00000002wKX-2MZc;
	Wed, 22 Oct 2025 13:11:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcX-00000002wCq-3Yxs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Oct 2025 13:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NmyJwyGotfh3JyXhmJS/1rlzs+tHyJOuYkq2PFxtZmQ=; b=Y5gPQeIEfnwZSfomC2Wh1bgViC
	Qk4WeTL8a7V9c2JMEEd3x/0CLyKYZtlrVl+DOieFM32N3KdAZev+3uV1O+n8Ok7vDMaUFPndpzuKa
	mfJWBWaKKh2W9Nc++LYtknxcXmNelbuZ3ZsIw3HnuX5W9jJjtwjWfcE9U/1AQ9I5ecOK4F8YMgm1A
	nuTeehvwCNbPJc8JZSX+AdIZ95wexrxPFgXzL3VS4NilCG50pliFbv7byRUEZs8W7eOT55/woow9S
	7AG2cPFnz3kmd+BwM2XB9XJodbG9DAjRPBExCQT75BfC/LCFraEAGKms2SzGiUlmBhXOJQ1Cdc/mQ
	Vi19leqw==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXkp-00000000ZSg-02pe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:15:48 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47106fc51faso81677465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138673; x=1761743473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmyJwyGotfh3JyXhmJS/1rlzs+tHyJOuYkq2PFxtZmQ=;
        b=Jj8x5G0yAjEMRyw9//yWwC6T5b784e06mkdJtbRG7oS84HAUzcy/2hOhL3hexBz77L
         yHIn2WPNYzXBNbmQDyqvT9CDGrIGhTaGT2Qp3zArOaxKn9oeeuHtMLN4BWK69erylQ8O
         fVhpSeiqjpWczXFPzr4bg8RYsCZvZiweoDYm+r58sDkzVmcQfSXVxIRz7qYm4utuoGTW
         rSqnA/QpWx3y8aCzXeBvgEFV5NPIhtHDmv66qvNmC5b0jFu38eyxV8xYyJ4GMpXKgxTo
         7HbbbjX7VNRoi9m4DDM+CcfWs3em4qt45fPlqas5Yt+kgUdTJ8bBaTKP6Uhq5IP6xevT
         qPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138673; x=1761743473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmyJwyGotfh3JyXhmJS/1rlzs+tHyJOuYkq2PFxtZmQ=;
        b=pNt4zFcMmT6+/vclR3XjP0VN9OFYKBml4dn4dH2hJPdx0zIqLFLgVz9Jy0ndISD3Rt
         cTa9CZdN4KahqFwsC9vmVuhwWkY9RRWFLE98yZd7/SjDoIJ90HLil4Wmf6GaGfduOUE2
         SpQaEtKL1OhcvAd0K6WGU9Zjtoh79BToNqin3YCtHDA7xI0L6kQZL0L4Yg5G+gY4nuFv
         C8RgXXqWQm1XUo7X/FWTAbk6TcJiDHhlU5XuEbWHH+bP++Ect9WgHS6KLzqo3Zeh1nUR
         kgUXRPx7HIQ5B+ME6XaIsIDXCRHWEhRkZ9I7NNogjC9AODtdPsntavPhl7wvV3t9WAYu
         ZyFw==
X-Forwarded-Encrypted: i=1; AJvYcCUA+Z8seha4o3pZuLRgJCC261hMiL37iKMrhQt3E4PItJj3Ef7xJonwuFZxje+au79WylCjyLWynNXbUM6dwI32@lists.infradead.org
X-Gm-Message-State: AOJu0Yy61Cue0yYRGugiAFbPlWw5AFq3bOFWeeHzcXr+z75G+uSnMk1k
	bTdS3qSLLzP+PeG9pdfXWrfUfjXmymWWcaZt0nrfIC04Q6HesOf4aU1xEPaYfAvYPGA=
X-Gm-Gg: ASbGncvefycczTIIxkOfy6vGoFbw0o1e7eEE4pV+6C/olaG7im5WPlul9wnfsGt6/Jd
	BFt2a9vbfyCSjRyBnsG39Nyto2WCwwo7ghXGOlmYV4gsXMSQ4v9OV0EksxkWOOX8DINGASKS9EI
	mc0DpKwSss2q5E1DsAmzmYrC7LV5Wg/jEeB2EBmdn2/Toyg+/7NkAuicli6/IVFuEjT9CmZMalb
	S2yJZoNqsm8Xnq70S5+jui23WoIX68rvmwhkW97Kw5f5UyJElaCIQh7FfL8JfcfsCkwsBq7inrf
	614MQ42kfC8TmyRqUNeOMkQXV2kuNsOWPvxLflGKfIBoZajWCgJX6YVxgI9TCIt9bR/csjb8WEM
	V+QQyEU5pbLDXraYAxFP9g8MnO4q34VBEjb/GBLiUDV1ucYKNXD5Etf/N7sv6wxxQwNHE27o=
X-Google-Smtp-Source: AGHT+IFvKb3JoyG866nslJyNC3Ibg/oUQ/wlCU6/03uxa7bXbKsZVrSqlRlb8S4Ya6isf5ldIVuivg==
X-Received: by 2002:a05:600d:14:b0:46e:4705:4958 with SMTP id 5b1f17b1804b1-471179174f4mr126289245e9.30.1761138673264;
        Wed, 22 Oct 2025 06:11:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:45 +0200
Subject: [PATCH v2 06/10] gpio: provide gpiod_is_shared()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
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
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4760;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=x7L0RijU+LCdHfGCAJ/VkOYZp/t4v/DX9On78RPb0YU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfdZs8MgTMizrWDvDv1UjUZTogiIeLTWekA/
 YC4FrScCIGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3QAKCRARpy6gFHHX
 cnAgEADBzLwtXPh2XKMVjNVTb3+/+na90OoVl87WRHstD2bKhyf3X1zCGxWwdcpFH7ZAY3X5cj6
 /QMO3st1TRPyuwvJjld52dtJWPYqkpxKokQOroUrZUNtkurk1CW87T3aGzO8lOZbo0Lfm23dQwO
 sBkrJTztEWsGyJiq6ofdmzamQhN1EVEQJRWC/c2QY1lozPK2lp5Egdi0Z0tlhxeqpA/phf9Ncw7
 Qe8kksbK1r5OO4SyBZZxCe9gNQYH04PEzWsgCI5oT0pKIyaFaQXAtEhUI8S70m+77npYxr8Mzz0
 xBzSAFPuVIYx3RLeQFPnpxMpT5XgGTzD4knJaa0ONGXTZGLYvUg7VJK2tmwb1bhL3aShR73MpDv
 MTeQjM7Ss/oksGzF5/Pt+VPnNBESFJ2cwYIuCP0S14CuOoqZwvMmrU4Afd8ZyS8CnQjfbzNkp/n
 abe0kCW+B8VEJMnXQiboWKlmEvmOSpmPFAlv8e/jNV8e/JV9stT4bXTjKxHtoQBjC1Df4Va/24w
 0o/JgFDARBNyFVOM3GYNWuZjFv8lSd/Ux3+vFPnWEhyVDjDbAqoeZrJL3fbWfiCfZmlup58aZPA
 PzJmNLr/bcmpc/+f4I4gy+TNt7c88z+qB7fnIdOPkbYuTBDtkrGpHMutGANHANOxN3C7Pt+Uy1f
 5DYXoQM9Pkhsz0Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_131547_169932_9F18530C 
X-CRM114-Status: GOOD (  21.95  )
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
index d2087d0df4ab7bcd23d3736e341c0f57cd748af4..b5c33bccff0765eb940fedd5d678c47a05f1a25d 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -309,6 +309,24 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
 
 	guard(mutex)(&gpio_shared_lock);
 
+	list_for_each_entry(entry, &gpio_shared_list, list) {
+		list_for_each_entry(ref, &entry->refs, list) {
+			if (gdev->dev.parent == &ref->adev.dev) {
+				/*
+				 * This is a shared GPIO proxy. Mark its
+				 * descriptor as such and return here.
+				 */
+				set_bit(GPIOD_FLAG_SHARED_PROXY,
+					&gdev->descs[0].flags);
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
index 03fd60e787fcf5846519fb2db9a701770ed15d6b..d689065471a1269ac0671b964c67670df5c95dd7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3984,6 +3984,26 @@ int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name)
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
index ae9aa145ca055c08dad55a537567a27de57f7066..8deed8a7d1128f01f0696af040d06f5fe140c7f8 100644
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
index 00df68c514051434e6fa67dc2307c6a8ce4ce3df..a8acb7c0b5af5066fd05e533468fc28616c68d78 100644
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
@@ -520,6 +522,13 @@ static inline int gpiod_set_consumer_name(struct gpio_desc *desc,
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


