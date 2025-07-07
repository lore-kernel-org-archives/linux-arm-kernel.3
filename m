Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EB8C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+JA5hCDJONRdLbjJGk+bpg/C8XRBbWfR2uFkIyaXac=; b=M0ylHffjLTTzDdSVtsVHFOPl/6
	7MLR7Z+T1Bzd2RnPgu5Al8dhvF/nL41gzPSZa7rItd0Yw3ul0LFa9usOvIKRcigzq2ugP5VZ1JG7d
	Nhi4aXGViPSgj50PEBfL+nmgYlWg1Xpi+cfUQMI5UcRmcltoGG2frHH5IqYPd1v0ewoJfa4Z4HUkt
	z9taZTbBBDxRwj8X466YcXIapBz/pBPM9rtbLc1hJzUVldP6uz8TpPt8Wq0S0kKSIHpEqLYLKn/cw
	xTyD/uDXUOdj+v5cwyT7tWyG0h4nZrbyTH/6JHcIt4KJVGPOUXafvqbU4/5pJmf4A1WTMpnt7MVxE
	3RwqaTFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhVU-00000001t5e-1kGZ;
	Mon, 07 Jul 2025 08:47:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgcR-00000001kKe-2XMC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:50:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so24881235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874630; x=1752479430; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+JA5hCDJONRdLbjJGk+bpg/C8XRBbWfR2uFkIyaXac=;
        b=zocnwPQQgVZokqquyaWN3X+TIaKw2kC70PnRh4gBOBH9vz9yHJR0sh/mIuSJrRggUO
         81MvOnQ9vRKQy3kRZ1MEBkzxPD72XDzHQRsrqphphE4pUm9U6do7C4jwbMICV3QAyAGs
         7/6kBb3pOmopyaZJCcxE7Uj28va2X8HuzlZ1fzrt1Dm41LiEKRlIS8kJsEpDPOJqcPhx
         Gbsfh1ay0+YeAckna48xNzQGo62p7w5Gj3GOAX5biYI06JFVv3Anw4+leNMGhulMIMgD
         HtLp9YhqiUtwi1mEFRcs11aApRcKjeuPeTF0wkXYIYuPCNMUmyhZUYEssRJAfRcOtRLQ
         6K1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874630; x=1752479430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+JA5hCDJONRdLbjJGk+bpg/C8XRBbWfR2uFkIyaXac=;
        b=uQ/uYbmCfRQjr4b2LSew7F0mireojlT/OUWP+iju4wZuEaQRSNheQ6cwLJoicnUk/n
         /xFe6OC+8hQl8F+r/8qhk2gkpxxbBC1kGjvrLoFi5ZyAXseR6JN+MFoeYFxCi/WKYtvW
         IlSPfwRlQPJXu6k/t5Pem5fpJf1ElU+HkzFDbIUrQjrEXblPQ/cu7UuFVMqlDiHVui8b
         qzJxHI0LKfcPw8Ykm8hMZH1G12fmFPVUDbctdQZFYCEARF1+WC4cC5lOvVVQzfG6eX5y
         vLtCKDN7XZhzb+ac+NsLYSf9R+h2MNf+4I2JFeiRkALnXqqW2axmh83FTryADoqYvEoW
         hsbA==
X-Forwarded-Encrypted: i=1; AJvYcCXdcWpo73vhgObbC2F1EFcKhmlr4m5bBzZgNlwFk1eFGVxJ8jcr00s4xG0r4eeYvXDUSj7BcvYidu5gmwcE5j2+@lists.infradead.org
X-Gm-Message-State: AOJu0YzDCFVbavLKyRlwo7ODkiqMO7Z43k8jYiZ4tjCneRgB3qABhUnz
	e3KrAgyXIS8REh+3XDrNVwBjf9DG2oaxz5zrqvWfFSkBwIDQ2/WU3g6FntIr4kiWrJw=
X-Gm-Gg: ASbGnctZz88nI35xETAUThMygsv35iCr4D/q9y4N8NvqXLY3QlsSN5adg8/UpU+kfNv
	QrSAeHwmYaQl4sVl0PSDQQRP8sm4x64kuuRkqHqN5wnEyOID1aVc2IvpSjP/21/gJEVYlqvq3px
	n6NptmkhIqaWqmDU66P2Rq4xmIlx0ihpPAG/mUXJwvMZVD+y22pKYQTNhT1uZNaKDDGcyiXZEOp
	bByTalqi8LYB5eqE/TclROMyf7fdqzcdZhveM3djQQbPHN9vGy4eU6PGr16b96GNz1FxPM4/s2Q
	WtaTnz2x+hIYh5b4r86dDyMPgoydSLQfpM0cQ62juWMYJ7HnU/l03pse
X-Google-Smtp-Source: AGHT+IHBlhSVc9pwEwajWE6AJVXz+4dQ6VQo86G02JHQBXvnIQfQwXZfMZgi+u0WCVRbP0X4BD5n/A==
X-Received: by 2002:a05:600c:630f:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-454bc4a5dbcmr50148525e9.20.1751874630164;
        Mon, 07 Jul 2025 00:50:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:20 +0200
Subject: [PATCH 07/12] gpio: twl4030: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-7-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3195;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=3JDOrR9hQWFdJNurWCS9HHF9izhub7RSmsduqXEIo4Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w7CxXxYgJaTdua9NdZqS9G8KYjVQfCYdNfk
 2GOraQ2CeKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OwAKCRARpy6gFHHX
 cqxYD/0aBgjkJNPm4W7AZUCumlwmMA0qFydna27fs9jkLYlIrVJtgngogU+DST19V5q6cnDiImH
 wwW+TreR6ojk5TotayIWj/VbBFKk11n+zW8r0R1Tzzqw+LzNqcwJcwUH2OXciSY7ymP/Ga7K45o
 suOmzS+NUqpuZSKjgGBg2IOgZVOSUuPhwDw1NTMFcQ0/5unrA1oPn7bsfBs219WYyre7nFEoBdv
 nzB0kOdXwd+vqzVdwjOfjOlDLw6NI2gkEvuFCMD+vGemXldP/ZuX0WGb7LK/mpssPNoCokrvqai
 QvjodAJCSkKLbS6frryk7/ETMYFnFPvpxEPwdc5dAj0sGrBi6H3uwBYMx9D6h0SYKVv/9skpe1v
 sVfO+vHdDoNN8SRtawKAjZ/DGAhlD4N4kxKF2mnen8xOwLZy1z8mSCYQaWxGZzStQB1W3aLKCLz
 +B2IEG26H4uIesiJWUHUdUDopwBrp4WlKdJQK4A6vEJs8U+V5eoHdGB3Ec+ZGeQnk4WmOg4ogRO
 +TkZFheAA4BTmwoCZutj8iaIpui2gifmFl8o0Rbez9WNv4lQa6CEIt5B8/BP7RgqL24CtHl3ono
 m7yBXe7J/Yz7aKLhlMcuvrSy7H+5AF0K5YB8GlRfviv+XZyju9xUNXiyUDWzEnaxaLP1KwAilMo
 vfiX6GFF8XIxngA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_005031_674760_2C2ACDEC 
X-CRM114-Status: GOOD (  14.64  )
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
 drivers/gpio/gpio-twl4030.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index c5d7825f19c18bfa84083aa5a46e48d174b8fce6..e39e39e3ef85b7c60c1f29f78c11d6eeccec6206 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -120,7 +120,7 @@ static u8 cached_leden;
  * external pullup is needed.  We could also expose the integrated PWM
  * as a LED brightness control; we initialize it as "always on".
  */
-static void twl4030_led_set_value(int led, int value)
+static int twl4030_led_set_value(int led, int value)
 {
 	u8 mask = LEDEN_LEDAON | LEDEN_LEDAPWM;
 
@@ -132,8 +132,8 @@ static void twl4030_led_set_value(int led, int value)
 	else
 		cached_leden |= mask;
 
-	WARN_ON_ONCE(twl_i2c_write_u8(TWL4030_MODULE_LED, cached_leden,
-				      TWL4030_LED_LEDEN_REG));
+	return twl_i2c_write_u8(TWL4030_MODULE_LED, cached_leden,
+				TWL4030_LED_LEDEN_REG);
 }
 
 static int twl4030_set_gpio_direction(int gpio, int is_input)
@@ -278,7 +278,7 @@ static void twl_free(struct gpio_chip *chip, unsigned offset)
 
 	mutex_lock(&priv->mutex);
 	if (offset >= TWL4030_GPIO_MAX) {
-		twl4030_led_set_value(offset - TWL4030_GPIO_MAX, 1);
+		WARN_ON_ONCE(twl4030_led_set_value(offset - TWL4030_GPIO_MAX, 1));
 		goto out;
 	}
 
@@ -334,15 +334,16 @@ static int twl_get(struct gpio_chip *chip, unsigned offset)
 	return ret;
 }
 
-static void twl_set(struct gpio_chip *chip, unsigned offset, int value)
+static int twl_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
+	int ret;
 
 	mutex_lock(&priv->mutex);
 	if (offset < TWL4030_GPIO_MAX)
-		twl4030_set_gpio_dataout(offset, value);
+		ret = twl4030_set_gpio_dataout(offset, value);
 	else
-		twl4030_led_set_value(offset - TWL4030_GPIO_MAX, value);
+		ret = twl4030_led_set_value(offset - TWL4030_GPIO_MAX, value);
 
 	if (value)
 		priv->out_state |= BIT(offset);
@@ -350,6 +351,8 @@ static void twl_set(struct gpio_chip *chip, unsigned offset, int value)
 		priv->out_state &= ~BIT(offset);
 
 	mutex_unlock(&priv->mutex);
+
+	return ret;
 }
 
 static int twl_direction_out(struct gpio_chip *chip, unsigned offset, int value)
@@ -373,9 +376,7 @@ static int twl_direction_out(struct gpio_chip *chip, unsigned offset, int value)
 	priv->direction |= BIT(offset);
 	mutex_unlock(&priv->mutex);
 
-	twl_set(chip, offset, value);
-
-	return ret;
+	return twl_set(chip, offset, value);
 }
 
 static int twl_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -418,7 +419,7 @@ static const struct gpio_chip template_chip = {
 	.direction_output	= twl_direction_out,
 	.get_direction		= twl_get_direction,
 	.get			= twl_get,
-	.set			= twl_set,
+	.set_rv			= twl_set,
 	.to_irq			= twl_to_irq,
 	.can_sleep		= true,
 };

-- 
2.48.1


