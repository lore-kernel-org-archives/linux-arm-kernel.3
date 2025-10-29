Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFB8CCF9F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZnk+nYLZl4QMw6EhjYCVYds4/Rzm6O866RrS4AjrMs=; b=j09L/CzHpkahXAL8sg27VD5zqW
	kcRPZu2Tiap+B0V9k/TK2ezlYGl9Yqr5Yc4CwWLwCNuT1l9+onupyBDDfYaquA9lY6fGYiwt0OK+N
	sl1sC5EUS14uAJdXRDN3IKe/AYtNMMpIkPtCcWelB8lUVPn/pYCpONMNP2UdXLGIjhSpRq2wAn3C6
	PXJfFH6Ie1diKQF0ukE8dNrg/J+eElYlcgVa+nKXnYt/KJSEeBrJheK1/kwbMeli3bUwOrH90owJw
	0iPEUuGFBKYbB6ZlZvQV8RkkPRql/fC9tx7n7BtAGNGsU1sYQR8jMneE6GlQzAwycjatNPej2hVWw
	RVIUuLVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4F6-00000000w9Z-0cn9;
	Wed, 29 Oct 2025 11:21:28 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4El-00000000vpe-48fl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:21:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4270491e9easo5858108f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736866; x=1762341666; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZnk+nYLZl4QMw6EhjYCVYds4/Rzm6O866RrS4AjrMs=;
        b=DjNbXx6mWUZFACCMqbu5PtsDTx6ULrdSxbgBCR08pMJSwv4IUybI23YNsW9/2bzoRi
         PhrDF6lwB12QN88wptZurmBiSfQ6DPbyBMewXptiSbHlxTDuJFastj56Pf0PlxdbqDOp
         MvKmBeeG8uD7/hNS6iQ3R/GiDyd+Bdb7LbDKFP1TNUmBPwQjd6r4baOBxD1mSetPjIs+
         uz3FDNv1SJdyWqmEP9hnKa5UJjZ7ghXd59OQgk98VEbtz1ko+ojqYLfSC295rIECRItQ
         p/bqLJy3dL9W8mLfPvssWmU7JPnX7RYUJEOhQoDy5aP6+Jxg4WHB8KrcsgOcNPgg9vC5
         gsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736866; x=1762341666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZnk+nYLZl4QMw6EhjYCVYds4/Rzm6O866RrS4AjrMs=;
        b=wMBZw753PQOEnN2vY330mW9bzbV55HtSNfVeM88vozwFP66UAIl6/MeSaKdyhDX39f
         MuzTxvaxhtHxopTwFb2OKLVp3b5663IpExKZmsRg1m9S3K2wC100lbzMUJzp4Xf+9cOk
         uRbCO8FKRG5c45XfTv+5JF09+rXwHt6E4CD8t9dfkiqg5U+EJkYdddbLn2G4PNb4q9hm
         PnezfUJ7hjNZV3r3zHSRx/+E5xGya3RRQ0BJRLKOJ6XFKq2IZ3ssyNMT/dvliQkd4Dk7
         /PioWva9y+SQL3herhO0opa8O0aryKrb3DZkzAtF7GiK2PhcwGoGXjqJ2uE437nkHhze
         cTVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVArYB5on5TjIDn5UCwoa1hvYHxBZE3k/qCUgQKoTrlBXlYipSNxrPfbcdZx/4GodfgZhUnQ4PmEGkN+gqk8kLe@lists.infradead.org
X-Gm-Message-State: AOJu0YxwIx7Jh23IhtdVwb3WoUg36+ull+LVc0f3fVMbgu3T3rY/oAjR
	SBu+wRGgRA2XIj85KHsw3MhQIrAk+yHSytZiyge+3FYRk//yK92Jek8iKcK7IXTW1Qg=
X-Gm-Gg: ASbGncsZNL7E37xAx3h/ItNAToAgML3TgJ0RT5l68wPbmifidF0bpBhIN8RiH5x4mXu
	RDodCu0g0ZqS9U2YCwUfXAfeKTGwjT1xbmPC3IYy64/MXTyjCLb23/cyH6/xjVvqiZzk9hOp6Q+
	m/+zNXYR1RZjUteKDGIAts4uLpX9OiCHQPVYrls322aVv8fwR+HiOJRPb0xhJguZl7nvpKp2xQW
	r/EuIT3tmj0lNMwpdVGBQCACuBLP8S0EpJ9i2CsB9qEWLZZIRIWp6HSY1L4VxPIHNxce8DHXBUL
	rQpz4kwpd/IUorURy32cFpzW1OwpetWtyeLOTEasjDoxxP1WwcLSqc4MgrMT6z/m1cPmvj1D7i8
	wlXpmBYBSBYcW2LeIjo4SOIxCOCqozdM+tga+TD5Bn54BN9wkPBl8xy/IZy0jFeRzkKjli40Uzy
	hY4nD5
X-Google-Smtp-Source: AGHT+IEQUECFDEstV6QYZ881rRQLkcezBKVFVx3TzPPXX9d1qB7SalXkzG6fyMdXz4omLQ4r+N8hwQ==
X-Received: by 2002:a05:6000:26ca:b0:429:8d0f:ebf with SMTP id ffacd0b85a97d-429aefcce70mr2187907f8f.42.1761736865935;
        Wed, 29 Oct 2025 04:21:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:41 +0100
Subject: [PATCH v3 05/10] gpiolib: support shared GPIOs in core subsystem
 code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-5-71c568acf47c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4422;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Gv6nJIcFpujEIkYYyh8HXEYQVPnSJEXWWrdVFvalF94=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiW6yvKWgnemCKDMGGGyJIWSPB+dDUrSnYnN
 Wiel7dmsj2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lgAKCRARpy6gFHHX
 crO/D/4tlrX9yp1WjVs8pqfpRZSAPKctw3sdEeECrsNrR405t6KWbicf+OQ5JsugurdU4e9dEbB
 e2e46BloGBdTXEUJkOrn1r5rNX4fWzu1+PzqGz0g5xCbwtgxt++E/aGHr9Qt+BbYXmDD1eWSl0X
 ELqRsSwD0SI+BhNg8c8JYHOka42MroUFrP44E2Nt0wHFxvb3JItYz3Lj+FJ/XCN/UBscAhIg5nt
 N/SvZu73HDR/C/Kxi2QNMXLBHm4CBdHYzit4n2PO4ExLiNGI34Swsujoq6sv4JMNTop7nwzatqW
 0yadz+ifq/TfQZckDcpX6YB+VSyPyvYIGHZiTYz858Hg9ZMeZWzOCQX99neYMIPR/ncDxw0MaQ5
 1u98lJwk93IDhKU2bdn68hUP4XkDQPRrdiNNKaSi7nkMFSAYMKf787DhbEfFkP7IAkx2gzTPq2Q
 Og3LL6Kvc8e4W/KZBE0Vc+aHNe8nyESm7sAcyZ8ts3Y2nGsAUuI6QJ0s4BLxCqPxWZWjhx81P68
 qBRZ6nIi3cpK/shSnOLxW6BsUsA0Za8GP5ZwxdIy01lkH6Bp+pNOnR8Zk8uP2/BjHXdqL1VFbDi
 gzkJlQt4E0QSD4tx7v88qtkyBrDDQ+35e0utG+K6WWkd2bAEDsdzzGE6G/RsapiIfVmBgJmwQBw
 TI9kgjbFato4a2Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042108_071260_8ECC191E 
X-CRM114-Status: GOOD (  25.08  )
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
index a81981336b36db49d899634feafcd9bc25edf96f..c0c0e9370f150c340a7c79dc03c5afec64a440f4 100644
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
2.48.1


