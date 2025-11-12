Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C710CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqf/JX2L7LJxSdDCATW4KSy8LDgu/Cgd29UQPhypHSU=; b=FAAeexKyUja7fOpGa+67tO4I7T
	m4T6xfHLzSrlyrX7xDZvnFVCwn/awa2idsxkKq3B42XknY9kYk09+1zVhew0ShLwCwSAcUxP3/GWX
	cJHsAjDNiH87qG8PHl1dV1QPJd62g1iiuZ32RjPi7qNb0G5/aCm9e0D3Prj6yUlu/E0ma8iUs32m4
	r1tXT2a/ZcM9m/TbIEsrNPX6sl4KhaU3t/qXuB7HZSQ4zJS4QokVoU6KZnVI1Nz8ny00+02G5NkY3
	+aLFjexKlQuE40S/SyF2WyLcPqiVKnQgT0giFymrcGvAL5K1N/4NpJy/+BdbGkoh7++U+sLVMRsiT
	RitZBA5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBKG-00000008sYk-46nh;
	Wed, 12 Nov 2025 13:55:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBKB-00000008sSu-00BT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:55:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4711810948aso5888255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 05:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955749; x=1763560549; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqf/JX2L7LJxSdDCATW4KSy8LDgu/Cgd29UQPhypHSU=;
        b=CEXB7pbBGsaq+HHrQCvclm3yLC30TO9XFn6naBCh5JaDYFu9WA9rVXXyU9MKWyCzdm
         MtDdbBVmfELjoC76plfjq+hU4mGIaB8MtDhj83TCeC8CwITkFAd6yRyvdOokauE1K1jm
         9G5acz4ujzUkUZfphp/J6SwnazoQxH25/92+jrJ/8zGGH3WJc/hXy1fuokQ2J6tcFtq8
         nsURDvGBK6gteYfzT6Atq7jT76XTpqqhpMFVgzyjeNmbjQh2PalizQ70l8LjmPeZoA1Z
         /HPXFr99+5ahYi8+ydhQ6h7Ueqn2Qi1EkLHjQz3U4O54knt18lkPm+lFfdKv5YVRI7Kq
         Z9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955749; x=1763560549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uqf/JX2L7LJxSdDCATW4KSy8LDgu/Cgd29UQPhypHSU=;
        b=k0aDOMS4BP+vVuBbybg4ixtg3EIPgg1ByxiKGpmw1ttcZU3Nw4MqBdyWcK8E3mQe5f
         jAH0uzHHhWS3fMhp8x4fQJ8l0sE8Nxh3Kz7jLwxLewheGtQ+4gQdXHdsbc5kbcqWw5fR
         RUab6zFdcZjGV2tqKv5LpCzSfYtDwwvVXv6FXEVU0+a4NLzZFsTObhP/HzxotfrnfOpK
         dcpgWIne2KpBjhpTLWHrJRJqU1FwXjMGwj6QBDTuISExMnSeZTFq4eWG0BD0mS64D5fh
         ym2Bv8ynnoFVyPzwk/QWjFKRVUy+xTiRcEPRe+YPPjOaxIC1jXGBzNPxn9UPeE1TSmt2
         E3/A==
X-Forwarded-Encrypted: i=1; AJvYcCXRHfM/lz93pv5wb1/ctowUJXj4e2HsNEAIbOFtd3uWYubSmS/5Md5x9ukxFK+gvsPut25B1EqhWe6/TKPcPoRi@lists.infradead.org
X-Gm-Message-State: AOJu0YwipSwEV/oN2XEGZgT+F9+Z3DbLModj2k/CoSKA8DRpQXjYx5I+
	QT/xaWBCOh+5TGT4xS8WLPtVNYwO2IBvCpe7Bs2v4aY+oFAIwnFLk4nUnYHGU4SQTUI=
X-Gm-Gg: ASbGncvG2rkXSo9I96YL2FNsNXjTlooSel2idlZV6ZsT1UnTkVHOTINQHQ/5dItTbBU
	bKaPgvYho3BgaZ3At3BmL9jJkG6PrQ1OMgbikO5oU3YyMOHU5/FaZhTCla7Q0ltsQhPxeqOtZsn
	qVmVhZBjZHSTxjtW2+ULCW1nHp8t528sIFN3LgONeNUa+DzQyR/uDggCn75iiNmLsTsYEaknVTk
	CMDhc82or8Y+Sef+59oUME0G5yPhDLvLo2fR3X97IjoqfS2mmTExB9u/FcLvNveTavn3ZTCs06u
	f5rCClr6+9tF7Ph4FNaOAiTjD8kPXskgcgkyYfB2V5ttwsjEQGX8t1JXqK8OhuK+k7EpDy6Dm/D
	130JgHMp09yck4ekPRkIn9z0naO7NY8RA2+xBCcKSc06C45/pMdCwBQw77YBJwaCHyNY=
X-Google-Smtp-Source: AGHT+IEFNNscHY36LRUkabyqy8pJkgvj8lmUeTc4bSwD2osPChT3dNC9Hz4duL4aGHcwmKNCJ8VeaQ==
X-Received: by 2002:a05:600c:3113:b0:45d:d353:a491 with SMTP id 5b1f17b1804b1-47787044ccbmr30737595e9.1.1762955749313;
        Wed, 12 Nov 2025 05:55:49 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:35 +0100
Subject: [PATCH v4 06/10] gpio: provide gpiod_is_shared()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-6-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
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
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4871;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rku5j8/61mOnZo3K42RMkCwcBTvPmLvpWhJ//UjCrvY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHW5VasetWt4Jh3G+BgPMs12efA7BJwxMkfN
 LcE6bdJIyqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1gAKCRAFnS7L/zaE
 wyd0D/9nnLMMOh4sABy5YsnZXVjgdMnmhhhkvdisFsVsPBV5TdVo/A7IhF054U2v5Uf6AF6M79q
 JKYRgvSvOiVoAK9cd6Go279E5RxLepgNj3QQeUZktSE7dYru17LTKqyFhuCl4nTbJBa4vKMFpZk
 4FmCLE00GUkv9sFfJaTYmLAoM9bKTl5a5PCL/lzQlAOXeQNcW8nuTLFWQ5DjYj6NCXX1BtvluBX
 fGN2+VFE4s4ZG2eMA6SjZXl2Ld7Or34kZqrNk29UjtwLu5tHGZlitked6O287oU0aUDEOuOoe58
 wuq0mXhxryoQoVZ5vaRLg6/nln6JZEiiNUPyA6IJr4d+xvhE3Y5A1H4pxDrDfBUPGCOc+mTPVqf
 t+KydMKuSENCE9s0hrAMkJXGfTq2XWMDfVmAk5eLqgJ8AOBcbvFUWuWvnClrCWJELcKLNXqJq7H
 k/YyvmMLu3gj04lAngDuLFhdostRkko2DGNlRe+qHZO3O4XErlCwRB6srlPh4jpjlzyrnBJLLSi
 ddeU7IRRp+5x+JvnFQFQguPXJfiI/UT5/gYie1UKRGbctmpjnwmeEG4GtZTXOCNaxV8c50oPVyi
 BjJodEz9ejOIsugiXzpWd7gGACNRr1Jmrj+Bi38K3wLeJLqGzlaOwsPe+lHRPC/aSKek5zBPSF8
 1gKY7wU6NFDHO7A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_055551_146187_B6FE43B0 
X-CRM114-Status: GOOD (  22.21  )
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
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
index c59fe05c838e073b4bc99c4a7667cb1ff40c26b4..91e0c384f34ae5c0ed61ccd3a978685d4f72e867 100644
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
2.51.0


