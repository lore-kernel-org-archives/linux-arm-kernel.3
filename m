Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2C4CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFJZE0pKNCv07L2HqBXLecNS6deU/WhVUmv/yCRIV1Q=; b=2D1B6SCpGSAvmcn1+InzdwHc7a
	lHUoLl0azYq2t35xt5vCShlzXCx6c0zo7mxoQ1ardsnp/JPEb5/B+FRkeyoc6KyQG5ZA6F1GAw6XU
	fkr5boV4uRWHZbqyQlGib2gat9C1BngK1c6UrZHQI53FehxfGYtwA7QWsJNRQeB7Nu1zqa3AkEq1M
	7tXkxcA4zHzJxoXAqqLv/GF55D75UXgYriGUCsqEe2wqsegYs+tdlC37cY7+xKKfKisuh/6882lP5
	9/Lx9K6bLIZ/Ef4uE5p/mXgVtH/TrUaol6wevleabGGooYJqU2vTw912sW1ul5ttXvqarU4GUXIfB
	xdt++q/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JzR-000000047df-3AgN;
	Thu, 16 Oct 2025 09:09:41 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JzO-000000047b6-3USG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 09:09:40 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so372538f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 02:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760605777; x=1761210577; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFJZE0pKNCv07L2HqBXLecNS6deU/WhVUmv/yCRIV1Q=;
        b=XdmPp4dqv0WYzt7S70OuT0ATj9Sv+k6z3/xxQ3vhZSg9VjR0xhI9axaYT3RyPnw3fh
         egBCR/i5LEPqq0/lGMDjasVc2qtAST8K0FrSxDCnLQtHmMv110qZTc/n3peHmSkMnE0e
         5a3re3aSfRuxd1nnrygwIOVvLTfIMkQLiV1jBtgpv2oG0+V973VqZha/Gobes2kAPh8V
         VwTJO7fYu3ZyiziH6L+B8+552ak0gy8avg25+pzGxfFFSOsWLJ6zbwtkilbj3ucD2EZZ
         5HvNj09IguJXmyFHCxZ5ZI51y3afFCkZboLJ7oY215PBG3W1KfcbJgJPvZA+nj4vl5++
         wC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760605777; x=1761210577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFJZE0pKNCv07L2HqBXLecNS6deU/WhVUmv/yCRIV1Q=;
        b=k1utUjdUgWxCHwlgfHjZYR5qsKnXvsdsKnhdkWn6a16EGNm1WrjzjBnuBFObMBEdWE
         +HLVL6eeholuPvil1qppn7cYWCSvsDwH0kcHHNvr/A/D7RmtZh5o1bMtP+uw5cvi23Re
         JJamwHJAi8TM3yPktCU4WVB5xNB5R9HdDSKji7bQZv//WCfnSX/I4UMYgXSA7J2jKshV
         ZW+etM9cdaXXBOf6qPocl7XkZTngZ2b/54vuDB3FQKERHAE937r1s/xCjJ2q77QPf9XS
         gUBjotZxa0YgB1aHBXUvnWDas0dBBPMDVt5aE1oTrNcQux3XuYnQtKSj7M40kjrQ0zWS
         XHMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1PCLdlxbwpcSiSvyPYEMtZHUyrRnEIwpM9AffUDkCx6o1yE2+Uq5wmuummLdrbu2MSWdTzH44iK0BrOAalGln@lists.infradead.org
X-Gm-Message-State: AOJu0Yy93Yl7qQi+gIFBGCB6lz7LEPpgPHmshTWp5qHLWMu/CVtMXej+
	gPX9LF9D+DHUwhOXK0cTHP3rsfJyoUaiAhtOpdk0yllV5rgqcSBIK+DyCo29RZar16c=
X-Gm-Gg: ASbGncsX6qIcXK5eauqVyQJNl7/3bwl0Fp/jPIc3+m894zWkJxzAvRtJdwfuRX2EDbU
	RGvWwpM6Do3+wULMkUVuVCwgGERL7q8GdcjAm/0u6+lU2jb0gFCWVhXNvW61QBRAngb82BVLzkl
	ZAY5M21yPy0JpDGlUDsgKDvDdSz+2R6Eee/SdKapHbvmUIr6HeE2uHJZXFpP1OuijxjEQ9MNjfV
	9XPHIMiqisKL3CIUtBhGYUihCbkfcxXCK/1rESdD6R5+d801JYrIwzpQQ5ANaBghKpY+ynktUxN
	49WUE7Y6yQ/zevwk23C7BA/4f4NfdWgUqAeNqB7DQJR+GyowL/oHmfkTt8rYkToLLAbED0twoyr
	jTrUk9aJ0A1RrONAdVHnEMDtt/64q5IcZho1uRySMk2dwH1bPPFccz5YIKoXKHzWhbIw0x0dxeV
	zS4jz0YqfXPUWbq/uB
X-Google-Smtp-Source: AGHT+IFdyzKUrKRAlW14tVUX4b2aHHspc9PvsRC+rGSFJEZ9Pd8418vrWH6Ug7r4l2yDUGoozqULLQ==
X-Received: by 2002:a05:6000:4014:b0:3ec:e152:e2ce with SMTP id ffacd0b85a97d-4266e7e0149mr20224020f8f.32.1760605776501;
        Thu, 16 Oct 2025 02:09:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef97:57cb:86cb:f7c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e1284sm33191287f8f.45.2025.10.16.02.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:09:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 16 Oct 2025 11:09:26 +0200
Subject: [PATCH 2/3] gpio: export gpiod_hwgpio()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-aspeed-gpiolib-include-v1-2-31201c06d124@linaro.org>
References: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
In-Reply-To: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2579;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XUEzgJKIWaOU7M01Lj57Hof44CTqsVlDHoOHP1+/564=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo8LZLfz4E1D7KIi+IF13RRnzlttgMRQMtMTXyT
 T8pl1U+bZWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPC2SwAKCRARpy6gFHHX
 csGsD/9IG3JL4wNs996oayX3obUxxPuPx7WtnTFG9Zz/7STe6Bs3vE7iYGDEdB+7w7c0usFGx6H
 f6bF4sfw5xMl7/nWM/BZhreiMkZ/5arno7zwm6zSsUJdhSSDf+LXFe3TUcoEF1SJCGK05XMOkDP
 FfMMW/lggT11D2LyLxFwwz6Dndun07u/ARkuQN2lVIsVuBZirAkxMhglPJctetYBczNNGK3Y05N
 EztIen5eCJ64VX0UFV7ZRSHosveM3eVSOMooQo6KFWqJ7tHHKxFjsulCtbWRSR5Msho6qHxc8cp
 G38EOz0ojt7EXrSNICnK4wGqSMEx8OiWLC9IveXoWkI2D5Pcj40w0uQAVqWH9t9oeXjDBlCoKXs
 CVCkqk/6t2wI3adax4H14MRqGsAEspJU1x3ak3L6WrnL5Zxo3FtgotN/dUIhdC/5j2q85v+oIho
 qXLZE1Pn7O/yNa1jAEk0JTCwbKRLLFa0UXGKJ+Dgffeae/KEmGXTZw9yGO9T85be16egWax+jVS
 cwrg0juZgZKe1A6zwlrctxg356u0V14r2yO+zGmjbVkcB7E3V4wWAHq0hEM82sbwXaa9mYK0A2K
 tmQroP4qMsKE1onX2wQ9SYB0bJHw+z7/IHutRY/XvVAjwZyjFKOLT2MvnVcgB8J4g3xpnU1h10c
 lzMNmtNCPdwKdNA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_020939_179164_F514D4F3 
X-CRM114-Status: GOOD (  12.35  )
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

Reading the GPIO hardware number from a descriptor is a valid use-case
outside of the GPIO core. Export the symbol to consumers of GPIO
descriptors.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c        | 13 +++++++++++++
 drivers/gpio/gpiolib.h        |  8 --------
 include/linux/gpio/consumer.h |  2 ++
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5a450dac8f3acea3e381b09767b9fe9c9dadc2f7..a81981336b36db49d899634feafcd9bc25edf96f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -235,6 +235,19 @@ int desc_to_gpio(const struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(desc_to_gpio);
 
+/**
+ * gpiod_hwgpio - Return the GPIO number of the passed descriptor relative to
+ *                its chip.
+ * @desc: GPIO descriptor
+ *
+ * Returns:
+ * Hardware offset of the GPIO represented by the descriptor.
+ */
+int gpiod_hwgpio(const struct gpio_desc *desc)
+{
+	return desc - &desc->gdev->descs[0];
+}
+EXPORT_SYMBOL_GPL(gpiod_hwgpio);
 
 /**
  * gpiod_to_chip - Return the GPIO chip to which a GPIO descriptor belongs
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 62d4c15b74f580273412e6d432ab306a2d2fe682..14e6a9807a89da6d7c6594a0a2de5f5032c49e0d 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -273,14 +273,6 @@ int gpiochip_get_ngpios(struct gpio_chip *gc, struct device *dev);
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc, unsigned int hwnum);
 const char *gpiod_get_label(struct gpio_desc *desc);
 
-/*
- * Return the GPIO number of the passed descriptor relative to its chip
- */
-static inline int gpiod_hwgpio(const struct gpio_desc *desc)
-{
-	return desc - &desc->gdev->descs[0];
-}
-
 /* With descriptor prefix */
 
 #define __gpiod_pr(level, desc, fmt, ...) \
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 00df68c514051434e6fa67dc2307c6a8ce4ce3df..994d46874d560416175c9099e18180237839bd4c 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -171,6 +171,8 @@ int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
 struct gpio_desc *gpio_to_desc(unsigned gpio);
 int desc_to_gpio(const struct gpio_desc *desc);
 
+int gpiod_hwgpio(const struct gpio_desc *desc);
+
 struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
 					 const char *con_id, int index,
 					 enum gpiod_flags flags,

-- 
2.48.1


