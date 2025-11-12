Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F379BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHDkpdBIkAui+sOwURBjRa8uCHeO7j00sh0QVBNbm7E=; b=gOu7fmjOTEdt9q5IVDq00/jY8Q
	XxEUTN/qnnSpHc5l0TD88L7HTit9MSmjsPrNpoDyLw8xMpW5OREbPRIEn7/EISdTmyN/Nii2rT95a
	ZipFClcw0ClnYKLYLI6Z9vThBXjJw5tnaJ1yTmFNDtERKLTKC6LjZzvmhr+LfwbI/DH50tdkhbtl4
	wcMoxsbhhjuzxV/rpfwmDaLSN3aSl5j7SfPQAuA+DRnaSYFgXxvgK9oWiteldoTgdgBzpDJsoFnVb
	RiLgh69+f9nYegZS54krK9gczeNUDqWZUaPzDJPWDlVsT+yW31njBgTYUYbkIYbNTdKoQCk9Wqhr9
	3MoUZcsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBKG-00000008sYL-2iBW;
	Wed, 12 Nov 2025 13:55:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBK9-00000008sSB-2XVZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:55:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477770019e4so9778675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 05:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955748; x=1763560548; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHDkpdBIkAui+sOwURBjRa8uCHeO7j00sh0QVBNbm7E=;
        b=emznldmsgb2kUUpmW3DlI70+pBOkciaYSADTkostGeGSjEUm7D1vDAPxURn4Qom6Qc
         orguWHN4Mx8CgHIIvR//MT4hqtYsi5IK6AZVXVtxpK3xFPHs3HPnVJlcao6iyMD1XmJd
         WWG9tidsyPw44xmzO0Boqpcc/xxyiZQWukpDgXloCPwoR32b/zLqifZX19s9tdSbLO4X
         iyHUIWaRQKR2BMAPe3JOZ927zKyanh9j4fCoz9gWNm0P/H4jSdoQ/X4RWhZz6rYT3CJW
         +jVNfFzLkIw72uBZ/vJp9vAeP7Nj7mpEnUgtAHCnivHAR/0ZmjFFrx+f3CmLBSGW7E9V
         AcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955748; x=1763560548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iHDkpdBIkAui+sOwURBjRa8uCHeO7j00sh0QVBNbm7E=;
        b=Lmt+kBp9kpeg1S4Us/Gki7UFrViXtx1EdmdSSKFv/nKhW9jbrQ7J39cK9DXyBAthKx
         oIjFl92e6tAtADaUS79k5XEO5lBT3XxpYnrvJLNZcMdLN2BLYH3Gfq89s+QTquiHG4DL
         ux2MKZb3WXcPRuobjazkh/fkhrZ+iQXPbpwtZiYSKj0F8XutIvfTxQ32xoIofmPXqmmp
         r7lDusmLMNcpSXE4mbOdAuzvp6jeu4fY38JVJyNsRi7EnE4XL3FJRbdl5ePCrFD1HuR2
         MRrIyMgxaLwldumNNmXAVaWKMOyirXLO7wZ/WnH4NUtRnGNogK2QjUtfvf/LwLG5hR3R
         z0qg==
X-Forwarded-Encrypted: i=1; AJvYcCVFHIvSB6An+qIEAXNODovRmEsIkDqiJAMXGvpkXtFoJq3Mwh/HrTJhuEzvFO0Ficx6/qVNgrWxjYhSLovdN0hy@lists.infradead.org
X-Gm-Message-State: AOJu0Yye9RpFt6SzVLcqHks0Na1TqV72FNipqH9E9ss9t/DXInq0mUZP
	UJ6ztSTD2YJujBVZ9quKMPmSnfssrG1Xulw9rSCLCaNm+yvB592J/1xiQ5wcfrq0088=
X-Gm-Gg: ASbGncvBKdkSD2o/Iwou8j0JClQcrw2tpXOJWiR6KhPN5bohRSdqqFRYm8etMv7z+G4
	axiuWY4JMSnf1T0O78uUAvYQ9NkWgpe7YFQRNDGEReDTlPvgIkmq3aLEu8ZWzv9XpXP29pdw/V0
	dyyOTgk/jkYyX6BOXeyhzswkpSiAQsM8PaGsepLeGXoP4cna/mWzUq1qWvOlW6fW0ooTzjrhNA8
	qfc9mDHcsX1TlKeR7BfHb2IdWMVkZ45TI+Nw5/lvTV0Q8+yRzMg1ePf5jf9eQ/8oRl5uIsVZgf2
	EfbaCwJIjAy/105w5aVSvD+6lhTEb+HkpWlggpJEN/t/gzuWysv6d6CuaSSJygKR9f9mEWvsxer
	N5+ih78z1w78V7AobL49glXtU+o+OrAkw/grOD/SWbD32EO0WVU9x9ZDSfqw1pInYHj0=
X-Google-Smtp-Source: AGHT+IE1m/lfGGA9jUE04kJURKhYINHzlwKRis11jsG5v9Y4unsiMKmAyG3c24nrHJCwH+vPFfgVMQ==
X-Received: by 2002:a05:600c:6305:b0:477:1326:7b4b with SMTP id 5b1f17b1804b1-4778708e66bmr26506715e9.19.1762955747543;
        Wed, 12 Nov 2025 05:55:47 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:46 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:34 +0100
Subject: [PATCH v4 05/10] gpiolib: support shared GPIOs in core subsystem
 code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-5-b51f97b1abd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4529;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AmdhmrGwNQekKUZMok9IIzwjRaNxDuviwqIp/MhPR5A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHWryXicSatd6ZW0nliwok8A3Z6ggfafAewq
 EZ+P6kfOlWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1gAKCRAFnS7L/zaE
 w0/ED/9OB9/L38MYlq9i08Z6GeffUbPMAcKM3KtVy4fVrmm8NxkDb5fdangJdaI4cz6n6/TI5UL
 qMnmJhYHDPim+wIGI6qxRNUQSfynPXGp0/YO/wOg5dj+xBn+m9KBNCDH2sFxkcdLn03FTgBAW+/
 Ch3bG3mod1OAlt9ryvejRDUL2P9HR2jHd6FQp5Fjfs8ItDBBS+hG5W5sshAxHZmy3o0X1XsTdP6
 kCUHpraGJcWd2nGRbKbCqCoQp/Nt5ANyOhAL8o6QRAwrR5GIWTl4nZkt6cTKwjFiJCXN14bhbt9
 xfj4ZQuZ3F6WrnJ0hGxeRuTaoyfZsJQVKo4aeAkK8W2gyuVY9xdiGJUcga0kjkbPyjiaaF87Pk1
 vJ12P9kc+ijBk2SY14erx7PceZ3ll2fI/TEcIXHsEX8ZccnsGdziL2YS5UiEni5LXPhN+yY9MnF
 Qo6XuQ2AXh8w4LaH8JsTr2eHfQ92UT94MW+YP/Ni2QR3eHP+PS4gQey2IUV5bVeQhoMR8bysXw9
 1KpsS01+LicdwF4aL+v0AwdrwMbYTbZV5Yy39Ke9NRvPq5BkL0MB3wGzIxicLSHUPWvqIFDrshp
 rpyJM0p0Go8LIqNqUq3CR1DoBTtwVL0DWTQlRSBb1AfJ2a7X725/0qydGg/zQtast9HfIloE/NV
 /RT9pvuSj8nMpaQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_055549_712356_D135435D 
X-CRM114-Status: GOOD (  25.38  )
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 50 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3659acc600d9622d5d2baeb055ac083556f344a9..c59fe05c838e073b4bc99c4a7667cb1ff40c26b4 100644
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
@@ -1213,6 +1214,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (ret)
 		goto err_remove_irqchip_mask;
 
+	ret = gpio_device_setup_shared(gdev);
+	if (ret)
+		goto err_remove_irqchip;
+
 	/*
 	 * By first adding the chardev, and then adding the device,
 	 * we get a device node entry in sysfs under
@@ -1224,10 +1229,13 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
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
@@ -1296,6 +1304,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	/* Numb the device, cancelling all outstanding operations */
 	rcu_assign_pointer(gdev->chip, NULL);
 	synchronize_srcu(&gdev->srcu);
+	gpio_device_teardown_shared(gdev);
 	gpiochip_irqchip_remove(gc);
 	acpi_gpiochip_remove(gc);
 	of_gpiochip_remove(gc);
@@ -4659,11 +4668,29 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
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
@@ -4686,14 +4713,19 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
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
2.51.0


