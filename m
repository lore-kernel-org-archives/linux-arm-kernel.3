Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47068CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZL4+irwvWE4SsBdHoCJTCTy+AX9NkTo9OPK52JUB9wc=; b=peHnQBh8CKBkWbueDSRXOIJweL
	tjB69aI7gDgbeN0Teq4xDbXPZDafEoku8B/vSK503d3vJ/qXxtQ7rQ4OFNYduSL/QUCb28YmXFQIt
	OpCE6RarDWECSL+2GyeZm1eKcrH4+kvYsAMA/jj/YnwoSTSI0pws0ivfhhSSpbbYiXAwd0w5Y7zGK
	bYq4hPqNAoJeVGickEOC3BJAvH4am0XSGs4WBW4KgRnfYteDn4CsBL8CJcVeSIOh40BHqnTw5RPxy
	SV9KMvo+l8vm1H1FOw05rPqN/PmlmAdotaVGQsnbD/uNKHNhNZ6BB2Oh+wAJNVOyLoqTML8G0WC5a
	7c6eOkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqx-00000000tSq-0QlK;
	Wed, 24 Sep 2025 14:52:19 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqk-00000000tBT-36Nl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 14:52:08 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3ef166e625aso4031729f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725525; x=1759330325; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZL4+irwvWE4SsBdHoCJTCTy+AX9NkTo9OPK52JUB9wc=;
        b=q/HT2KepdXTvNmuL+97/97rb4OvA90ea8xlL5Rl/a/uAizzpXdyFWSDZ9BptIm9aeD
         K12Q9s8gBiV3duIc+qWQ3W8EbPuNLH7RFqYKeFRW4cntKJJoR15vczUVFzd2aC4oyu3i
         W8cZpHIAyWOn75kyk53mkT+FultEk6nAr5+Ejn1R/GxoJ+NqzZdeCXzcfglZthvIr4tq
         CON/Orw85J+Nnixt5o3LOrYomplLoAgPvtxZxCcjVXNMC5Q9jpEv0KSBGXK7PJQNeOqY
         kWqhQGvfl4uhy/8hLBY8g+TI4n8/15j1f/lcEdEqCnau+WMD9jdqKqG2kVN55zyjUfDC
         Dvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725525; x=1759330325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZL4+irwvWE4SsBdHoCJTCTy+AX9NkTo9OPK52JUB9wc=;
        b=LBzD/6kkNLBk4szlTMBR/NPhnXtWqEkmFljy9cSZILv4gQ5ZMeli48zwmQK9bp7PsS
         BiBl69D/AeuROb0bc3Xe4+l+dRfmE4MwzOIsraq3mBWdvgmt0DhW6QByw62PIJCkgvfm
         fIXjTMSv2AKXtho0OMXz31HkJCNpR1nM4coSltMNzjjQbq2W+K3p1HsJdOrswxCrfzBd
         idJw6LkThZXeo5ELqAE7hINooj3bvHGTxonov6W9k8zycIgUywl9N13oFI9zWpv15hvK
         D8SP7GRFpH29wBeXi7mXCLHrMDW62n9BEI70ebE6D8oBVXpFLKObY0P6BdCXvvEcPcOj
         QFTw==
X-Forwarded-Encrypted: i=1; AJvYcCWkYNAE67AVBa248iN8z4/3EE3eahimBMB3a1hXgws7ONSxNYlK7ifmWFIQhid/mVRaYwCakJQHa3gZsandlQYK@lists.infradead.org
X-Gm-Message-State: AOJu0YwpDQr3lmkBsrF80FyQeHQr+wOWdQ2DyfNb9FiZ/Y3TDYxKUtgZ
	ytLD+CP+i5JkVWVZSWUeJyxZnBYaNro1oQzS/lxJUBEwfgnQbW8SjHO5QGxsZy7SSQM=
X-Gm-Gg: ASbGncvAdE/zmMXbjV5YST/fAD8TNbQkUw4VBuwpCsMTy8ybZz1YprwTOTdatKyfhAC
	dBE9XK/jEZK31UPwGr6qUNjmGtJxyixYt6tAPystFhJeDoCTmKgKxDY4jw5RYBCllDzsqLr/KeP
	xSTvG44ARkDRYVD3xYHebnT939YTON3kP7RAW4fDsPVWoWaoPX0VnArvg0bRbxjHfAAnOj+ZBxo
	tQPBOq+TCtx/33wCg4A07RyItqEomM1uk/pCozGyAt4XaLYPHRORuDcuMctaGbfT9CR3HzUoQ12
	prwZC9V3BnIe+WHrrtBhs0legJmN0xwGCTLCK2kxX6odnJLXC9m/nl723lPybPAAL39wgHLp3UN
	9CQkY4EidoMcfgbkyRrcuM8VyEuAY
X-Google-Smtp-Source: AGHT+IEWHNWM3PMiQi39DCUY0P65dMCtUAmW0aNINKZlaMoAKd9G+OFLiLVmnpWbGaFejBIGTe5r6A==
X-Received: by 2002:a05:6000:22c5:b0:3f6:9c5a:e202 with SMTP id ffacd0b85a97d-40e4a8f9b01mr211100f8f.24.1758725524742;
        Wed, 24 Sep 2025 07:52:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:52:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:34 +0200
Subject: [PATCH RFC 6/9] gpiolib: support shared GPIOs in core subsystem
 code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-6-775e7efeb1a3@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
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
 bh=D3LlX9JCIHILUSECKUB0i2KcvXBRhYifvdj8HcLrtsY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWGtEm9BZBoHOyi6MRlpVU3iN4/m5ugqizXb
 cb5jiakzJqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhgAKCRARpy6gFHHX
 clvfD/9ggshaV+wkSDLG7IqfR2kbj7iMCsyqumue5okcVW4slPGxJZrj33JjG2A5jCcf5zg6aYH
 mBJRXK2dlpCQk6WnUdIITocpEX+OdGe7/sDWBRWoez9hMSLBgwjFRegmHLSTckq3MRMtccedLZj
 ktqpmoRdheHwIgrqtKKBYZEhMeSEfkFz5E5WwJ4XlzUmnS5XT0n/t1gpt4jHTmdrJRV9inQSCD7
 3iEIFwiCcO8NV05SRR52jeC9dOiu/EnhQmKZ9+v5UvLDkbdpnLJA+HuRFKyegz6Jve2KB4jngsq
 iabVmFlK/1ZLkfzuA1OBa7Wcc2ca1XKXAFCXoqRqDhxMcB56XsKHpUnj9tOQ9br2hGjXCh1Dmm7
 I/VgNk1ApegakrszD7wB+reSA4O8W+7flw4KRo821kAyRsSVxQm/gyAXYUHuVFfUA76aS0yE5Rq
 uedGX/Vc9Xa9J79webxMRgOyfdm03s8lWUxsqBWOupPZ7owkAMCk+NARXtgQvNyfhR9sofkHvpv
 wJUntMKhrtDw2qs/eMXDnzBG+3YLhGQg+bD351X+Auc/ZUnNt232Y9ndJpJKKCrf0gmtDNDQKWE
 jXk3uBqKSiBvrcGmhPTiIoqhXV1cBhxQf7FC4wyMQQpIdx4grMPvIc87j5rVL8IXMMpr1z/C/0l
 lBZI30IhdmleP1g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_075206_854046_5393449D 
X-CRM114-Status: GOOD (  25.04  )
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
index 9952e412da505c12ceddfefd9cfd778aad3bd5e6..1e4c991797126d0d91233bbe7c3ae3831bf77d6c 100644
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
@@ -4652,11 +4661,29 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
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
@@ -4679,14 +4706,19 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
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


