Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E47D7497D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGV/n/Ugam46hql9btLSYEeBOG83+nolyClCQ9yXEuc=; b=sTbrQ3UQKYBabcT+3DQAYBrOuM
	7nRVViooi2ibFfoeu6FvEvSj69bsTAjIbKbYhn3HoStLjbYU4q7nmIW6xXqNEpCilN1r7dwYOGwt1
	GFrNHhMCQyPQEyizQPZSQCVYJB1hSU3Y215148LODcuvcS1mDRYxQggCAC7fXgATX+y1Hhi277/BV
	dKKBRlZvs+apjFbTSu0MVAPbhR5HIvbdqdDEZwxxKjBGmaeZRMBwFo7YWBKntr5xzl9ESSDtkznfZ
	SXmgxQbapQT2bugcWYNvYfbp7mtWE3Ck69fjEolRiG8wpu+v/WeFJ1DuZ6CTkkF+wwZ0NRd9xPdpE
	e7beTepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t63C5-0000000H9Pj-2m6H;
	Wed, 30 Oct 2024 07:32:41 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t632b-0000000H7nh-2kra
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 07:22:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20cf3e36a76so63658415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 00:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730272972; x=1730877772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGV/n/Ugam46hql9btLSYEeBOG83+nolyClCQ9yXEuc=;
        b=Bvh1xlrU9NYBtWQiVYjHbVjfwSCJlCOYpP7DFnVZ+Sb978MN0pcDvgBIXLatLh0l70
         qBM6QCrOQOetOS4rO3qG14qYveTrahxH9B0ermXncQrm/uVl+Oz0bh5T7Z8ucngAgf4P
         xWZXJViOE33QbiBbS3XdTEgO9zjXIYcZqsO+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730272972; x=1730877772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGV/n/Ugam46hql9btLSYEeBOG83+nolyClCQ9yXEuc=;
        b=jfHQp6DPGR4lb3GegHlXneKjwKBaGoEmZ0eVEcCSuQX9uQn077hCL5aqQLMwwAZv0Y
         hrPtOpF+9TuylAn+H0aLWLlFyZuQ70dRIKmo6gR9hWhVHr6GWGPloHHBGFABLUwRVyeE
         zIql9otSEGD7tcoUvuOcVtFPIg+nS6VXHi4IYK4ySLW1WzEZkhqbmSntHnH9k9fL457Z
         /t4qhXD8QGhCfwTXJ6CbUGNOPhty4prJUErOa1gl5kd5T8gfU5zZjclPgEo2QjT88nwO
         noUn8YPl0M5kZwaZFwMbwJv/PYfRYeP1Pk5RsDKcnosHk6BkktgUZnsjgOszfyBTqmMN
         AQIA==
X-Forwarded-Encrypted: i=1; AJvYcCVRFUaqBPtUxXWeHo/wyAcQRSJuDGjxlHPBkYVwWwHhVy2LEB4J5hYocIzBhRVhih9aNZOzGes8Xjfz86fhaXPB@lists.infradead.org
X-Gm-Message-State: AOJu0YxAcZX9BVeb0+e5Q5BcZho2kcTf6tt+1EVipM9rLhCubU4nRdEB
	cNblP1R0hVqMeDC00vVHfwKhASTlu9jKhthRq4Cvn1HQj9B2LXujNpy/4DxqFA==
X-Google-Smtp-Source: AGHT+IEy1Vg0oRHVJFHBfqLUCfRXAUxJa8Aozk2EFlORmIleEz2egKAvzOhCZhekzAigBDhVAejjRA==
X-Received: by 2002:a17:902:e80b:b0:20c:83e7:ca54 with SMTP id d9443c01a7336-210c6c06346mr162621725ad.27.1730272972509;
        Wed, 30 Oct 2024 00:22:52 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1f3:aa64:657f:d8a8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e67esm76641445ad.186.2024.10.30.00.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:22:52 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v10 5/7] i2c: of-prober: Add GPIO support to simple helpers
Date: Wed, 30 Oct 2024 15:22:26 +0800
Message-ID: <20241030072229.1013235-6-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030072229.1013235-1-wenst@chromium.org>
References: <20241030072229.1013235-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_002253_857027_6FD5E9B0 
X-CRM114-Status: GOOD (  33.67  )
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

Add GPIO support to the simple helpers for the I2C OF component prober.
Components that the prober intends to probe likely require their
regulator supplies be enabled, and GPIOs be toggled to enable them or
bring them out of reset before they will respond to probe attempts.
Regulator supplies were handled in the previous patch.

The assumption is that the same class of components to be probed are
always connected in the same fashion with the same regulator supply
and GPIO. The names may vary due to binding differences, but the
physical layout does not change.

This supports at most one GPIO pin. The user must specify the GPIO name,
the polarity, and the amount of time to wait after the GPIO is toggled.
Devices with more than one GPIO pin likely require specific power
sequencing beyond what generic code can easily support.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Changes since v9:
- Picked up Andy's reviewed-by

Changes since v8:
- Moved |struct gpio_desc| forward declaration before |struct regulator|
  (Andy)
- Dropped GPIO descriptor validity check from
  i2c_of_probe_simple_disable_gpio(); GPIO functions check it (Andy)
- Dropped comment from i2c_of_probe_simple_disable_gpio() (Doug)
- Reworded comment in i2c_of_probe_simple_cleanup() (Doug)
- Picked up Doug's reviewed-by

Changes since v7:
- Dropped mention of time unit in struct i2c_of_probe_simple_opts
  kernel doc (Andy)
- Added check for non-zero delay before msleep() (Doug)
- Simplified GPIO name check and reverse conditional branches (Andy)
- Added description about the supported power sequence
- Switched GPIO usage to logical levels (Doug)
  - Changed some variable names and comments to fit
- Added description of power sequence to struct i2c_of_probe_simple_opts
  (Doug)
- Added comment saying i2c_of_probe_simple_put_gpiod() might be no-op
  (Doug)
- Combined callbacks (.get_resources with .enable; .cleanup with
  .free_resources_late); renamed i2c_of_probe_simple_free_res_early() to
  i2c_of_probe_simple_cleanup_early()

Changes since v6:
- Restructured into helpers for the I2C OF component prober
- Reduced to only handle one GPIO
- Set GPIO to input on (failure) cleanup
- Updated commit message

Changes since v5:
- Renamed "con" to "propname" in i2c_of_probe_get_gpiod()
- Copy string first and check return value of strscpy() for overflow in
  i2c_of_probe_get_gpiod()
- Add parenthesis around "enable" and "reset" GPIO names in comments
- Split resource count debug message into two separate lines
- Split out GPIO helper from i2c_of_probe_enable_res() to keep code
  cleaner following the previous patch
- Adopted options for customizing power sequencing delay following
  previous patch

Changes since v4:
- Split out from previous patch
- Moved GPIO property name check to common function in gpiolib.c in new
  patch
- Moved i2c_of_probe_free_gpios() into for_each_child_of_node_scoped()
- Rewrote in gpiod_*_array-esque fashion
---
 drivers/i2c/i2c-core-of-prober.c | 100 ++++++++++++++++++++++++++++++-
 include/linux/i2c-of-prober.h    |  20 +++++++
 2 files changed, 118 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 76df75c51cae..b9ca785f8b17 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/i2c-of-prober.h>
 #include <linux/module.h>
@@ -31,7 +32,6 @@
  * address responds.
  *
  * TODO:
- * - Support handling common GPIOs.
  * - Support I2C muxes
  */
 
@@ -246,6 +246,62 @@ static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c
 	regulator_disable(ctx->supply);
 }
 
+static int i2c_of_probe_simple_get_gpiod(struct device *dev, struct device_node *node,
+					 struct i2c_of_probe_simple_ctx *ctx)
+{
+	struct fwnode_handle *fwnode = of_fwnode_handle(node);
+	struct gpio_desc *gpiod;
+	const char *con_id;
+
+	/* NULL signals no GPIO needed */
+	if (!ctx->opts->gpio_name)
+		return 0;
+
+	/* An empty string signals an unnamed GPIO */
+	if (!ctx->opts->gpio_name[0])
+		con_id = NULL;
+	else
+		con_id = ctx->opts->gpio_name;
+
+	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	ctx->gpiod = gpiod;
+
+	return 0;
+}
+
+static void i2c_of_probe_simple_put_gpiod(struct i2c_of_probe_simple_ctx *ctx)
+{
+	gpiod_put(ctx->gpiod);
+	ctx->gpiod = NULL;
+}
+
+static int i2c_of_probe_simple_set_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+{
+	int ret;
+
+	if (!ctx->gpiod)
+		return 0;
+
+	dev_dbg(dev, "Configuring GPIO\n");
+
+	ret = gpiod_direction_output(ctx->gpiod, ctx->opts->gpio_assert_to_enable);
+	if (ret)
+		return ret;
+
+	if (ctx->opts->post_gpio_config_delay_ms)
+		msleep(ctx->opts->post_gpio_config_delay_ms);
+
+	return 0;
+}
+
+static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+{
+	gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
+}
+
 /**
  * i2c_of_probe_simple_enable - Simple helper for I2C OF prober to get and enable resources
  * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
@@ -253,7 +309,11 @@ static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c
  * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
  *
  * If &i2c_of_probe_simple_opts->supply_name is given, request the named regulator supply.
+ * If &i2c_of_probe_simple_opts->gpio_name is given, request the named GPIO. Or if it is
+ * the empty string, request the unnamed GPIO.
  * If a regulator supply was found, enable that regulator.
+ * If a GPIO line was found, configure the GPIO line to output and set value
+ * according to given options.
  *
  * Return: %0 on success or no-op, or a negative error number on failure.
  */
@@ -282,12 +342,24 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	if (ret)
 		goto out_put_node;
 
-	ret = i2c_of_probe_simple_enable_regulator(dev, ctx);
+	ret = i2c_of_probe_simple_get_gpiod(dev, node, ctx);
 	if (ret)
 		goto out_put_supply;
 
+	ret = i2c_of_probe_simple_enable_regulator(dev, ctx);
+	if (ret)
+		goto out_put_gpiod;
+
+	ret = i2c_of_probe_simple_set_gpio(dev, ctx);
+	if (ret)
+		goto out_disable_regulator;
+
 	return 0;
 
+out_disable_regulator:
+	i2c_of_probe_simple_disable_regulator(dev, ctx);
+out_put_gpiod:
+	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
 	i2c_of_probe_simple_put_supply(ctx);
 out_put_node:
@@ -296,17 +368,40 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_enable, I2C_OF_PROBER);
 
+/**
+ * i2c_of_probe_simple_cleanup_early - \
+ *	Simple helper for I2C OF prober to release GPIOs before component is enabled
+ * @dev: Pointer to the &struct device of the caller; unused.
+ * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ *
+ * GPIO descriptors are exclusive and have to be released before the
+ * actual driver probes so that the latter can acquire them.
+ */
+void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data)
+{
+	struct i2c_of_probe_simple_ctx *ctx = data;
+
+	i2c_of_probe_simple_put_gpiod(ctx);
+}
+EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup_early, I2C_OF_PROBER);
+
 /**
  * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C OF prober simple helpers
  * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
  * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
  *
+ * * If a GPIO line was found and not yet released, set its value to the opposite of that
+ *   set in i2c_of_probe_simple_enable() and release it.
  * * If a regulator supply was found, disable that regulator and release it.
  */
 void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
 {
 	struct i2c_of_probe_simple_ctx *ctx = data;
 
+	/* GPIO operations here are no-ops if i2c_of_probe_simple_cleanup_early was called. */
+	i2c_of_probe_simple_disable_gpio(dev, ctx);
+	i2c_of_probe_simple_put_gpiod(ctx);
+
 	i2c_of_probe_simple_disable_regulator(dev, ctx);
 	i2c_of_probe_simple_put_supply(ctx);
 }
@@ -314,6 +409,7 @@ EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, I2C_OF_PROBER);
 
 struct i2c_of_probe_ops i2c_of_probe_simple_ops = {
 	.enable = i2c_of_probe_simple_enable,
+	.cleanup_early = i2c_of_probe_simple_cleanup_early,
 	.cleanup = i2c_of_probe_simple_cleanup,
 };
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_ops, I2C_OF_PROBER);
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
index df95aa6ad90e..a232f3cbb252 100644
--- a/include/linux/i2c-of-prober.h
+++ b/include/linux/i2c-of-prober.h
@@ -85,6 +85,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
  *
  * The following helpers are provided:
  * * i2c_of_probe_simple_enable()
+ * * i2c_of_probe_simple_cleanup_early()
  * * i2c_of_probe_simple_cleanup()
  */
 
@@ -92,14 +93,31 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
  * struct i2c_of_probe_simple_opts - Options for simple I2C component prober callbacks
  * @res_node_compatible: Compatible string of device node to retrieve resources from.
  * @supply_name: Name of regulator supply.
+ * @gpio_name: Name of GPIO. NULL if no GPIO line is used. Empty string ("") if GPIO
+ *	       line is unnamed.
  * @post_power_on_delay_ms: Delay after regulators are powered on. Passed to msleep().
+ * @post_gpio_config_delay_ms: Delay after GPIO is configured. Passed to msleep().
+ * @gpio_assert_to_enable: %true if GPIO should be asserted, i.e. set to logical high,
+ *			   to enable the component.
+ *
+ * This describes power sequences common for the class of components supported by the
+ * simple component prober:
+ * * @gpio_name is configured to the non-active setting according to @gpio_assert_to_enable.
+ * * @supply_name regulator supply is enabled.
+ * * Wait for @post_power_on_delay_ms to pass.
+ * * @gpio_name is configured to the active setting according to @gpio_assert_to_enable.
+ * * Wait for @post_gpio_config_delay_ms to pass.
  */
 struct i2c_of_probe_simple_opts {
 	const char *res_node_compatible;
 	const char *supply_name;
+	const char *gpio_name;
 	unsigned int post_power_on_delay_ms;
+	unsigned int post_gpio_config_delay_ms;
+	bool gpio_assert_to_enable;
 };
 
+struct gpio_desc;
 struct regulator;
 
 struct i2c_of_probe_simple_ctx {
@@ -107,9 +125,11 @@ struct i2c_of_probe_simple_ctx {
 	const struct i2c_of_probe_simple_opts *opts;
 	/* private: internal fields for helpers. */
 	struct regulator *supply;
+	struct gpio_desc *gpiod;
 };
 
 int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node, void *data);
+void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data);
 void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
 
 extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
-- 
2.47.0.163.g1226f6d8fa-goog


