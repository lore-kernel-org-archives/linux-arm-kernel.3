Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CECCCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JxC4wP5bi/PqrvaNLx4qtWBYafzvA8adhEOxdIGx4g=; b=0gJNHLZkGC3s5WqpxW7vcnJHVC
	1fFNAy7SJOlbrbYBu23KXkdNdVQSmpdM2i4FLt5vjx3OwLLxscxAS/bZUoBnnXJ7RAFomSxW3hNZF
	FULUzD5YiCk/9g6AwwyF7wdOtANeBl1xAU4c5XPedTClChtXFNDlIC+9hM4KOn1g9SWCC7YzbQ8P2
	RQ46kjsy4D2VTuG1zlKXGjZmeF0pmVohawznriQOEZtDt9wQnNp2R51aEaaYv7QzaksKZDcLKNzXH
	W1Gw/Dnz0MkjvFHo38byvy9h6UA0FLu6Zl5brIq5nUFrgMkzYZ2vdPt+iJUfyKTuL+4A6JNruTS+h
	3S0v1pGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcl-00000002wIB-0cjz;
	Wed, 22 Oct 2025 13:11:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcT-00000002w8y-2ElR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:11:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4712c6d9495so14691665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138671; x=1761743471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JxC4wP5bi/PqrvaNLx4qtWBYafzvA8adhEOxdIGx4g=;
        b=qr/t8JV1qUfBlmr71ln27ILld5+nS9FQh6yroPZJ7VCmdZYv7C9cR7/2W4dtI104X5
         jrQ4jX3bosKXNBJv9NizQrKUyFwsOLjWe7eLZ9lSX2dw9zDoxZMgpZi0StZR+HGSrn0F
         p41S6C0mWI6ev9AHnOxef/ismQOJJeCNAyFV8egCJAz6ZVo3WKlVgfiWD8zJwmDmNyti
         LVL/KwWie/mISE0W/ZStrlF0shkLsVLE9JnodiyEcJDNlJQkFKrqytdmODav0y3aUH2d
         4X7JTGAB7t+prSSkIWaxVVpHQt24KBioZtAZdjhwwxkGtVKJwcJe8OBXuQYaUP6rcgiK
         klqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138671; x=1761743471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JxC4wP5bi/PqrvaNLx4qtWBYafzvA8adhEOxdIGx4g=;
        b=V8DWgpnKB4kAYPvuRt0AS0bixKg8EyvsGnw+O4HZ7LdgATnV7ANROkrrLt5zJPlS2j
         iUGm8XISOMz7qKK7TKKqPpmWENgthq0HfgeSUblXVNKutZ1ijVhEzST90hNSnv9Geiak
         +gMVGudaDU6AXNtBF6vaz0mo3xinjP4d6MHEMKXr9Q3zH9wZCDvTzhz1j91MqCZgtTla
         RzbDIWmtXbNAzxyR3vADYyCysj6sFdCV9ANreEVhxmkbXc92/g8DADF5OL+dcvAi4TDG
         /csfd7BjwWbaI2+jTRkoeizm3V6rht/zhND0EzCokZchjxrXiijd615IlzxyC1bwJpCg
         TUrw==
X-Forwarded-Encrypted: i=1; AJvYcCUEqw50sZ0R4PAhYgdRA9/fBesyYXpCHgJaEzfFYb8Q3S+vKB7IhGiqqfXMiBY/p172Z2PvGr/ocrcQByUAIJbn@lists.infradead.org
X-Gm-Message-State: AOJu0YzonozNUH2abFWnpoCc8Y0RMwJ21BDARRLdADjpMSbHP2yvh2Di
	JHpc2kHhrMmZd0WKhQNFDNP6hvU0ziM3MweWY4hda3N96YkMEl4oKl6OqNYBj5eZyoE=
X-Gm-Gg: ASbGncvcS8HoOZUVM00MByG++2fmQDVqp9ftTi6EokYdIjbq8VTY7ziX7frnqotKpG7
	Je/poJyx/nqSCaq7p7h6eQHn/ZXH1WEFObewldpKnJVBNOVJHEWpFYyX310ECOO9ZjLmBw3F1Xa
	af0nykXML+WobTS1z5lhTxq/lVzoHwPRBa0NhcJHH1m2LopnS0UG2iJBt3LWY8jMzBIAMAaW2+Y
	7cmHO7fYZShBAIgxFjLNawz8ukIu+gZ2wiLwrhTQC2HtteNB0/cDzLx+JJbvsVIhJEqXEAZb8tH
	VrPp5j5+2Nedhfxyg7zj+Gxlns0j+m1qQlWnDoMJCTYmMecWXwOglDepr2nJM/+lXz9eReMWiJ+
	Qeqpdwp548ThoZkHmX+6RAEtzEPKYmwlLMcysUI3e22UgYjS5as94f8/S6fRWJhYZFNMa0Nw=
X-Google-Smtp-Source: AGHT+IHo7fpOJ7A4/PDFJApxVJPuvZ2+KhtSRrGrKQkN9hTz6RoVFtBwlxLDGySMMqM9OycqmRHnhw==
X-Received: by 2002:a05:600c:3e07:b0:46e:450d:e037 with SMTP id 5b1f17b1804b1-4711786c560mr160425345e9.5.1761138671092;
        Wed, 22 Oct 2025 06:11:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:44 +0200
Subject: [PATCH v2 05/10] gpiolib: support shared GPIOs in core subsystem
 code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-5-d34aa1fbdf06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4422;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zqXCTaI+O2fDGRyRHcv5jGy43WgDG3dY8izHkuOqT+8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfdN6WlD8MNTI0j9WttuM9GjMl2b/JJHHe5o
 KvW0ta3RKaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3QAKCRARpy6gFHHX
 cqSuD/9q1cd7HMe1XSEd4nF6dgis0elTdxxSKaEEOn4CmMimW6BoSdKLxlhAjaUYHolIY3lso6q
 FvKuLQ2VYwRNhHYvR2ZyjsPNv1adhD8f9WaAD9qjMJX942vR9KW4DYf7u83G+fMRXTW01V0x4tA
 sYHA44FyHa5JRbjKnYc0AjlnS3Rj50FjhhJWALXcI3YWU/sqcu90aof58IAI3hZQ/35j9i++VAz
 KoON8D4dPHJONeZh5VpM4guVUN5GRz3scQtiUlqE7Zb+QkL5pjX8Y8K2XkdSVh5Qjr4jJwmI2f/
 FcHboakvuRX4D8eBfb6B3ctXaQN8gjBOjkBo316BiDVQAMdkyU8GyoKptnm4howzrP1El0SHW8L
 Yh57Q8C+nVmRnqpJE5h9gPsg3MLEpHp67bw+yEhHqjaOWt3uunDCEgE6+ckk3jNmWu/2JowcaJh
 ZIc28gzPMQTPRr+bKm/X+Bn6GkbKQIIckVPwWvKbv7RaI8xqxZrd4m6jGwiX3tYYMSNI49L56h8
 akFjclqSdu2sKUzNtYnNeCRjQVrMyGPQi862Eens6P6K8VJ6EfQbAwEaj0qwqwUn8i8bQb8/OJ1
 IASPaL60AFqsfMYYYX1IwD0mdykLKKhYJQjKZcpBakJxjaCtLNt16nsAVSj/FSsTbTwvMwZ3prk
 4hqIq3rq17kDweA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_061113_770638_8B4C1697 
X-CRM114-Status: GOOD (  25.23  )
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

As the final step in adding official support for shared GPIOs, enable
the previously added elements in core GPIO subsystem code. Set-up shared
GPIOs when adding a GPIO chip, tear it down on removal and check if a
GPIO descriptor looked up during the firmware-node stage is shared and
fall-back to machine lookup in this case.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 50 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ba5df8a233fe75e16bae615f7f7c8591066c056e..03fd60e787fcf5846519fb2db9a701770ed15d6b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -37,6 +37,7 @@
 #include "gpiolib-acpi.h"
 #include "gpiolib-cdev.h"
 #include "gpiolib-of.h"
+#include "gpiolib-shared.h"
 #include "gpiolib-swnode.h"
 #include "gpiolib-sysfs.h"
 #include "gpiolib.h"
@@ -1200,6 +1201,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (ret)
 		goto err_remove_irqchip_mask;
 
+	ret = gpio_device_setup_shared(gdev);
+	if (ret)
+		goto err_remove_irqchip;
+
 	/*
 	 * By first adding the chardev, and then adding the device,
 	 * we get a device node entry in sysfs under
@@ -1211,10 +1216,13 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (gpiolib_initialized) {
 		ret = gpiochip_setup_dev(gdev);
 		if (ret)
-			goto err_remove_irqchip;
+			goto err_teardown_shared;
 	}
+
 	return 0;
 
+err_teardown_shared:
+	gpio_device_teardown_shared(gdev);
 err_remove_irqchip:
 	gpiochip_irqchip_remove(gc);
 err_remove_irqchip_mask:
@@ -1283,6 +1291,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	/* Numb the device, cancelling all outstanding operations */
 	rcu_assign_pointer(gdev->chip, NULL);
 	synchronize_srcu(&gdev->srcu);
+	gpio_device_teardown_shared(gdev);
 	gpiochip_irqchip_remove(gc);
 	acpi_gpiochip_remove(gc);
 	of_gpiochip_remove(gc);
@@ -4646,11 +4655,29 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 	scoped_guard(srcu, &gpio_devices_srcu) {
 		desc = gpiod_fwnode_lookup(fwnode, consumer, con_id, idx,
 					   &flags, &lookupflags);
+		if (!IS_ERR_OR_NULL(desc) &&
+		    test_bit(GPIOD_FLAG_SHARED, &desc->flags)) {
+			/*
+			 * We're dealing with a GPIO shared by multiple
+			 * consumers. This is the moment to add the machine
+			 * lookup table for the proxy device as previously
+			 * we only knew the consumer's fwnode.
+			 */
+			ret = gpio_shared_add_proxy_lookup(consumer, lookupflags);
+			if (ret)
+				return ERR_PTR(ret);
+
+			/* Trigger platform lookup for shared GPIO proxy. */
+			desc = ERR_PTR(-ENOENT);
+			/* Trigger it even for fwnode-only gpiod_get(). */
+			platform_lookup_allowed = true;
+		}
+
 		if (gpiod_not_found(desc) && platform_lookup_allowed) {
 			/*
 			 * Either we are not using DT or ACPI, or their lookup
-			 * did not return a result. In that case, use platform
-			 * lookup as a fallback.
+			 * did not return a result or this is a shared GPIO. In
+			 * that case, use platform lookup as a fallback.
 			 */
 			dev_dbg(consumer,
 				"using lookup tables for GPIO lookup\n");
@@ -4673,14 +4700,19 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 			return ERR_PTR(ret);
 
 		/*
-		 * This happens when there are several consumers for
-		 * the same GPIO line: we just return here without
-		 * further initialization. It is a bit of a hack.
-		 * This is necessary to support fixed regulators.
+		 * This happens when there are several consumers for the same
+		 * GPIO line: we just return here without further
+		 * initialization. It's a hack introduced long ago to support
+		 * fixed regulators. We now have a better solution with
+		 * automated scanning where affected platforms just need to
+		 * select the provided Kconfig option.
 		 *
-		 * FIXME: Make this more sane and safe.
+		 * FIXME: Remove the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag after
+		 * making sure all platforms use the new mechanism.
 		 */
-		dev_info(consumer, "nonexclusive access to GPIO for %s\n", name);
+		dev_info(consumer,
+			 "nonexclusive access to GPIO for %s, consider updating your code to using gpio-shared-proxy\n",
+			 name);
 		return desc;
 	}
 

-- 
2.48.1


