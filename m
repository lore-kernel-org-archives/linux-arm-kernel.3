Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8D6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 19:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzWMDQiQhqKDucj4xDCvdrZWSeCpiJ1tZaaA5u2Est8=; b=tq6hslEV26sWQtFXcHLUx+3rVk
	hTCIXY2JqBfSk4qChv9tWpSYXHq5WCVl73n13UkdxulzRDyR76Qm4m6KCnBZqpPIQMS8G85ytQPAL
	O9si4A3E9Hy7l4a8X3VYfjh/c8+9sHcsFFjJuK5Fhj+0wBjkN+BiFPVnV1bwwq+7MVq6oPdtjok6m
	JlQW80q37YlY7ngLMGcJM9a6h0HDBNteVOMTcSS++DJ/ehLvOEhJowt/pTysr7HS9jWef9gMtf64o
	vK1Vyuj2F60jt9DXPqfMhJgxHlI4pH68Bc6gsUSnaZ71w08wylaE0X2EIWyxfeU9xNJueHGYyYHX8
	SGMl/DIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uda3k-0000000Fg5Y-0b8r;
	Sun, 20 Jul 2025 19:50:56 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZsK-0000000FfN7-2Zt5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 19:39:09 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-73e7bb65255so2008855a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 12:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040348; x=1753645148; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzWMDQiQhqKDucj4xDCvdrZWSeCpiJ1tZaaA5u2Est8=;
        b=cnCSuCkVwF7PpkVa/oHddI51po9UyS0uGTGzSOfWD0KbHFmaWEuhFALi3R3ZyuxKAy
         hGfiO0rkrujz2HEs0uc/e/rfeFQqMDz5PJdJOTUfs4D6BaoR+MeY0YrxtZU7KMjQglOj
         Q2ZFrXgfDkxuSqFmCoIg6EO/SlP+V81XoFIKAREwJw8aP23VuzpZOWj2HtfjiG1QWF0X
         o3SUKStLFeFW1ekfYRM5kCKsA4QXDTqk1l8L6nnwabfeEiEg+FUPatTSciesmdb/cl6v
         2JYGmKGCvHgwpR/2igdMjvc55fPcioeIwcgauy6M0SeI3XhZzQGzIYWiv2lxDi516UwR
         xrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040348; x=1753645148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzWMDQiQhqKDucj4xDCvdrZWSeCpiJ1tZaaA5u2Est8=;
        b=JQTqbwdXwj0JjXV0tm7y0yxTtb89HtkaCPMPm2r6vxyVM72KVXGbS81IkcEbiUOj88
         ATWhujCfO+baq1K4Wa8YlP8h0x4TK0TOcEAkoyG43rsZ8RjpJZPioxFQg6yFdbrnA4sS
         01HloNlEHbGtXs2IMbrxeh3B+ohvEZc6gRFCeePSH+O/12TR9sL9Wsy2INVKrK9Ua73V
         QeBFx9DbuzhjHc0wresuWIsSS8OI4EXfIG3QtTHQxUJBJwphSE8n4H0oq4Cy3wwePpKZ
         xCul2ABKO53yRg6HNdLjvJBIHqapq5Jw1pr2d/kFlkfFYtBpVNC8DoAS9xcp1A44BH5K
         JpmA==
X-Forwarded-Encrypted: i=1; AJvYcCWn3i24Vem0sUP5vdP7O2daUrZzpFx1X128UVfEoC5vY51IvoHWkLowfD7u3zTGVFaMND5RK6eURr7fpF4Ki6dP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg7m2FCnAi28BGYcJctDWXtZUeTdjomgnytrKHL07nq7f1zeva
	5vYe1mpOMKbe1WG7A8lUe2aMQ/rWUXrK6sJAI85Kv/v1Pj20zbbrZttgdhdZh9WtJhU=
X-Gm-Gg: ASbGncujE2U+TeXDarhRnXkHuXAIIj9LqSxsc+2NgVLd9ODtCAWmtv/rIzzqhXcCuo8
	4CoZNYQa8fODNRUQuY/uDK18ugopE3zSDrprY4sKwR9U9FDa/onJPtkDQiN1NaAmN15OOadmx9H
	S+Oo+fes58LOPhIhSHzVbnoffUEFzgRY+KhdHc9wOd+02J+FAWQBhZhte5FZq3jsCbSkyHzMDto
	dysxQBAU3Tj8IVbfCixTtoFYY8ZSNU7mu7j9ly28ZM/1uKZ1aesN/xCX0bUBez72qY+AFqMdGaH
	74p1jPrnaS7q886aeLFJE2FbfcJkJ87Y/f8grvqOKjFXCxpQK8osjYTdBIrDxUa0YJa7suq1RUs
	ht4mSjzUp/Zo=
X-Google-Smtp-Source: AGHT+IHG0eQajqarHbENrvaixxkoziriMrVyGz1oaBStUnyceEv9srArOzG9hJaXtUODGRIJ4Pm6Aw==
X-Received: by 2002:a05:6808:3a15:b0:40a:533c:c9cb with SMTP id 5614622812f47-41d05654bcdmr12175951b6e.38.1753040347679;
        Sun, 20 Jul 2025 12:39:07 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41fd498c1cbsm1799638b6e.27.2025.07.20.12.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:39:06 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:39:04 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC v2 6/7] pinctrl-scmi: Add GPIO support
Message-ID: <bd79aa90-73f7-4d7b-a340-539b52a73bcf@sabinyo.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_123908_659744_28887E57 
X-CRM114-Status: GOOD (  25.02  )
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

This adds GPIO support to the SCMI pin controller driver.  It's an RFC
patch because I'm not really sure how these are used and so I don't
know how they should be configured via devicetree.  I've labeled the
places where I think devicetree configuration would go with a FIXME.

This driver was based on work from Takahiro AKASHI.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/core.c         |   8 +-
 drivers/pinctrl/pinctrl-scmi.c | 206 ++++++++++++++++++++++++++++++++-
 2 files changed, 207 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index bbcc6881b119..91882c68bcd5 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -947,7 +947,6 @@ EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
 int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned long *config)
 {
 	struct pinctrl_gpio_range *range;
-	const struct pinconf_ops *ops;
 	struct pinctrl_dev *pctldev;
 	int ret, pin;
 
@@ -955,19 +954,16 @@ int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned
 	if (ret)
 		return ret;
 
-	ops = pctldev->desc->confops;
-	if (!ops || !ops->pin_config_get)
-		return -EINVAL;
-
 	mutex_lock(&pctldev->mutex);
 	pin = gpio_to_pin(range, gc, offset);
-	ret = ops->pin_config_get(pctldev, pin, config);
+	ret = pin_config_get_for_pin(pctldev, pin, config);
 	mutex_unlock(&pctldev->mutex);
 
 	if (ret)
 		return ret;
 
 	*config = pinconf_to_config_argument(*config);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_get_config);
diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index fba0a3a2fc10..9a947ced0df7 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -6,6 +6,7 @@
  * Copyright 2024 NXP
  */
 
+#include <linux/bitmap.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -16,6 +17,9 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <linux/gpio/driver.h>
+
+#include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
@@ -42,6 +46,7 @@ struct scmi_pinctrl {
 	unsigned int nr_functions;
 	struct pinctrl_pin_desc *pins;
 	unsigned int nr_pins;
+	struct gpio_chip *gc;
 };
 
 static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
@@ -505,6 +510,197 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 	return 0;
 }
 
+static int pinctrl_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	unsigned long config;
+	bool in, out;
+	int ret;
+
+	config = PIN_CONFIG_INPUT_ENABLE;
+	ret = pinctrl_gpio_get_config(gc, offset, &config);
+	if (ret)
+		return ret;
+	in = config;
+
+	config = PIN_CONFIG_OUTPUT_ENABLE;
+	ret = pinctrl_gpio_get_config(gc, offset, &config);
+	if (ret)
+		return ret;
+	out = config;
+
+	/* Consistency check - in theory both can be enabled! */
+	if (in && !out)
+		return GPIO_LINE_DIRECTION_IN;
+	if (!in && out)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return -EINVAL;
+}
+
+static int pinctrl_gpio_direction_output_wrapper(struct gpio_chip *gc,
+						 unsigned int offset, int val)
+{
+	return pinctrl_gpio_direction_output(gc, offset);
+}
+
+static int pinctrl_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	unsigned long config;
+	int ret;
+
+	config = PIN_CONFIG_INPUT_VALUE;
+	ret = pinctrl_gpio_get_config(gc, offset, &config);
+	if (ret)
+		return ret;
+
+	return config;
+}
+
+static void pinctrl_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	unsigned long config;
+
+	config = PIN_CONF_PACKED(PIN_CONFIG_OUTPUT, val);
+	pinctrl_gpio_set_config(gc, offset, config);
+}
+
+static int pinctrl_gc_to_func(struct gpio_chip *gc)
+{
+	struct scmi_pinctrl *pmx = gpiochip_get_data(gc);
+
+	return (gc - pmx->gc);
+}
+
+static int gpio_add_pin_ranges(struct gpio_chip *gc)
+{
+	struct scmi_pinctrl *pmx = gpiochip_get_data(gc);
+	const char * const *p_groups;
+	unsigned int n_groups;
+	int func = pinctrl_gc_to_func(gc);
+	const unsigned int *pins;
+	unsigned int n_pins;
+	int offset = 0;
+	int group;
+	int ret;
+
+	ret = pmx->pctl_desc.pmxops->get_function_groups(pmx->pctldev, func, &p_groups, &n_groups);
+	if (ret)
+		return ret;
+
+	// FIXME: fix the correct group from the device tree
+	for (group = 0; group < n_groups; group++) {
+		ret = pinctrl_get_group_pins(pmx->pctldev, p_groups[group], &pins, &n_pins);
+		if (ret)
+			return ret;
+
+		ret = gpiochip_add_pingroup_range(gc, pmx->pctldev, offset, p_groups[group]);
+		if (ret)
+			return ret;
+
+		offset += n_pins;
+	}
+
+	return 0;
+}
+
+static int get_nr_pins_in_function(struct scmi_pinctrl *pmx, int func)
+{
+	const char * const *pin_groups;
+	unsigned int n_groups;
+	const unsigned int *pins;
+	unsigned int n_pins;
+	int total = 0;
+	int i, ret;
+
+	// FIXME: get the correct number of gc.ngpio
+	// Find the right group from the device tree
+	ret = pmx->pctl_desc.pmxops->get_function_groups(pmx->pctldev, func, &pin_groups, &n_groups);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < n_groups; i++) {
+		ret = pinctrl_get_group_pins(pmx->pctldev, pin_groups[i], &pins, &n_pins);
+		if (ret)
+			return ret;
+		total += n_pins;
+	}
+
+	return total;
+}
+
+static int register_scmi_pinctrl_gpio_handler(struct device *dev, struct scmi_pinctrl *pmx)
+{
+	struct fwnode_handle *gpio = NULL;
+	int ret, i;
+
+	gpio = fwnode_get_named_child_node(dev->fwnode, "gpio");
+	if (!gpio)
+		return 0;
+
+	pmx->gc = devm_kcalloc(dev, pmx->nr_functions, sizeof(*pmx->gc), GFP_KERNEL);
+	if (!pmx->gc)
+		return -ENOMEM;
+
+	for (i = 0; i < pmx->nr_functions; i++) {
+		const char *fn_name;
+
+		ret = pinctrl_ops->is_gpio(pmx->ph, i, FUNCTION_TYPE);
+		if (ret < 0)
+			return ret;
+		if (ret == false)
+			continue;
+
+		ret = pinctrl_ops->name_get(pmx->ph, i, FUNCTION_TYPE, &fn_name);
+		if (ret)
+			return ret;
+
+		pmx->gc[i].label = devm_kasprintf(dev, GFP_KERNEL, "%s", fn_name);
+		if (!pmx->gc[i].label)
+			return -ENOMEM;
+
+		pmx->gc[i].owner = THIS_MODULE;
+		pmx->gc[i].get = pinctrl_gpio_get;
+		pmx->gc[i].set = pinctrl_gpio_set;
+		pmx->gc[i].get_direction = pinctrl_gpio_get_direction;
+		pmx->gc[i].direction_input = pinctrl_gpio_direction_input;
+		pmx->gc[i].direction_output = pinctrl_gpio_direction_output_wrapper;
+		pmx->gc[i].add_pin_ranges = gpio_add_pin_ranges;
+
+		// FIXME: verify that this is correct
+		pmx->gc[i].can_sleep = true;
+
+		ret = get_nr_pins_in_function(pmx, i);
+		if (ret < 0)
+			return ret;
+		pmx->gc[i].ngpio = ret;
+
+		pmx->gc[i].parent = dev;
+		pmx->gc[i].base = -1;
+	}
+
+	return 0;
+}
+
+static int scmi_gpiochip_add_data(struct device *dev, struct scmi_pinctrl *pmx)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < pmx->nr_functions; i++) {
+		ret = pinctrl_ops->is_gpio(pmx->ph, i, FUNCTION_TYPE);
+		if (ret < 0)
+			return ret;
+		if (ret == false)
+			continue;
+
+		ret = devm_gpiochip_add_data(dev, &pmx->gc[i], pmx);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const char * const scmi_pinctrl_blocklist[] = {
 	"fsl,imx95",
 	"fsl,imx94",
@@ -559,7 +755,15 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (!pmx->functions)
 		return -ENOMEM;
 
-	return pinctrl_enable(pmx->pctldev);
+	ret = register_scmi_pinctrl_gpio_handler(dev, pmx);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_enable(pmx->pctldev);
+	if (ret)
+		return ret;
+
+	return scmi_gpiochip_add_data(dev, pmx);
 }
 
 static const struct scmi_device_id scmi_id_table[] = {
-- 
2.47.2


