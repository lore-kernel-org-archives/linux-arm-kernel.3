Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D58DCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bU0p5jhyAkg+9M5zCJdzo0UOszCY1ZswUrkywMR8tm8=; b=vocsYPqUVpSZhQbLb/VQh7dLX4
	rR/RWU24tK7c+GhtU8Dyj1JbwCjhXxzd6gc9P9Ln/sarsNYS3PRbjDgUiC/eCHbWBIp0qCbBbe8CY
	rpeS5GN8zkJTblRCKwX6zQbcjsTK0rEx7WCGMsVE35YdpEgzsr9EV0ZfmynNqzmupJXmigney6FDd
	kF+2Bh+xJmDtb78Kurr8OKBvyVS2i3PKMXXfRflnn1IFZxhUvGZV9dBWDYhs7dVL148jAVNOH3RLp
	O9u66/8De0bDtbO9HMpQWxJPJUwOg99//ghu8kcssqCDT+KQdB0AxGx9mga1UGKE+Rq/DjbGRYRnN
	Y1q5QQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBK9-00000008sSh-3dKu;
	Wed, 12 Nov 2025 13:55:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBK6-00000008sPv-0KIG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:55:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so346899f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 05:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955744; x=1763560544; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bU0p5jhyAkg+9M5zCJdzo0UOszCY1ZswUrkywMR8tm8=;
        b=zHuxf749WBR08etg7b+ttcq/VuZAmsvvCXFzelndwZUjtXJeAHiUDrqi7SMaxceCBY
         9XJ3HPD0tGyEjWzJEnKuSEjQbcpXo4ljV0Lia9ZAtBsyEiDSt/OI1tmgz12xZJVwQq8f
         QRV+qWPAXW9RqxdHMX32FT7JPd8+Bv6H04uzUB0jrW1C0uOaD78EHL2YlK8mbFCkXL5P
         b+7pClcwwiVxo4V40DK6t+XujD4FDrP39fvQyJU4sclJHqyRKbA/XBpKt6N+KFdAt8RE
         hx4/W9Owkmc5kV8yzZ+9LNKGnXJIHXvTfgcPNWyZjPj4TfzBnh8WP49ZCbCPwnhGy09Y
         wAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955744; x=1763560544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bU0p5jhyAkg+9M5zCJdzo0UOszCY1ZswUrkywMR8tm8=;
        b=rby82EL9ScpK05cxyZ7sWBNbH+9siFwVsP6LgzPK5di4nghbUkLHAlIIxKB91viKQK
         qtndwdMSpIS1tG87mFYpbJi/N0h06BnGMSiiSXQyn9TBQgCajktBfCpikQSOVfVjXbhh
         5u++tXaAPInrzfHPozxT6PrFmfxathuBmHWlBzWNZfmotAhCFjCp5ZLrWHD9L8aP+PNH
         r1XK8n9+WLMfQ7e5riVxe5z87p1zF46UdXWt2OiftskeWzkwVR+1e6EQh8/7X2tI2aH/
         /pFViwtQUa0Fox/8AzdEEPxxiZUpniqBSfnWy8LCv9IV7Jbev2fbjkdkFDoBu2iZayvu
         KhHw==
X-Forwarded-Encrypted: i=1; AJvYcCVtlbC3iiqXTVBaUp2sftc9vLf4KLJto4WYXyqqgGCL3xREFkJnXBPkkJD3mTcVeR8czhi1PH/trifbKGesFA7L@lists.infradead.org
X-Gm-Message-State: AOJu0YxJkcVSs9kl8mnSXxwvMzqEi0QmHy0in2I5exX62Bf4872tywRq
	1MCRi93NNSeW0Ipdf4/lDT1bWae3tDfp3aljl3Tq9pTWE8mWN6rHVJ4qTRewqjlU6PM=
X-Gm-Gg: ASbGncsZEjOgW+VxlscKF+RF/nEhVwxVBJ+RjVnxo+oT7zVmEk4tqdlk2unhnwCOTet
	WFXkyxOJOc6IsPlZDaPb5XA6ovK/tqNuQhANKVS0QawwImYWAlOdQUXXCNLnKldrXoOp0kTNN9H
	n7zldMASCWzVA08h/P+D0F3BbY+qM/7Os9/GR+fY4iKWGockeoC8NyB8LwDm2tVmgUA5rxZ5Alq
	YHCBUFn41y608sRYcmDR5WEBkKLlEMMyKMtU+uodSt1CNWRZppcLXYIW9RST0pH9rWhEEYlp2EX
	7F0qa98fou7UJ1AQyYWeXZx8AJxm9SYNlX6pNGpC9DtYE6LxAn9+2/waS7WTBLLXVjpaJC+a5Ug
	6qlm3gOhG+M+bsGZdwq2IFAJfa1+0yxWQU4rMJhylOUUaUphlG+i2Wbs0qR1g+eet7Ys=
X-Google-Smtp-Source: AGHT+IGjwTXgphW/quEnGs67bFJbXJ9C9T372lL4McIb3rt4uORpNQqnqrGlLen4DAphFbFwLbGdBw==
X-Received: by 2002:a05:6000:381:b0:425:6fb5:2add with SMTP id ffacd0b85a97d-42b432c933fmr6469629f8f.19.1762955743952;
        Wed, 12 Nov 2025 05:55:43 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:43 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:32 +0100
Subject: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18980;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fGWc99aevRaj31ao5XoPsk2kEtFdFEMQgrWVi2eCMFQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHVbPA43EaseVfSX0YKeV1n6c3lUytGFYKMQ
 qOR+nIyP/CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1QAKCRAFnS7L/zaE
 w0yED/4hGzDn9JtFjJB6Rl5hGCn+zz3FKZowQ9V+bLXrL5b9DBiC6tWBrmTCIMVYXWsT0pQz50X
 VKWVeR5j6UKhmVXdxRFcLSya1c+lhgnobKVAGnt0t95dWeJbWuF1tJvqJpOsTCvExH1UKzsmz6S
 u9Zs4fC99CNCaQWQnQsqzAMjwZUZ0z9pPnpxZemZ9LIa9gd32X0BhGCDOkAl8yFj4ree5Zq4U0b
 euGkmwlZiEhSUlflf2mBeq7PhE76YaQMIF2H4kgGmqaR3kzshivWV6RW0Av35o17SfdMeDMa0lE
 zYLrWoasrgeULHqLUJd9AG4/w9jY/chzQULjh3fgjD5WEX5boRORQeS/OnJHaTirktJRWvsY//E
 qropO7m7VMaiHVyhbDOJhL/hcRP5IQW1unfYF4g/yaZfz2W5gpNAoVheti14ewwDNbRtW8nmRvn
 Ihv+FbYXHBSz8+0T89x5CTHgZLFtpRtqKsaOnjOgf8oHZBUiikB2xRKRyZ/i7wBKjsIxP6tToh8
 r7LtKd8Aupxc5cF5NYj8MrUal/rqSJqh2OZEMP3x2yMx7S3Dv3kP7sFkcGjoUmToBAsA9Gp7ueH
 fmOcjDHbG/Db3x3uwcFt81HDnC1ZNOxR6wgsDXIU8jbN4y0MUGqMsJL7z7D9pdMjNJROKse9vDt
 Gw97+dAd3rrfM1A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_055546_334223_3EF67442 
X-CRM114-Status: GOOD (  32.69  )
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

This module scans the device tree (for now only OF nodes are supported
but care is taken to make other fwnode implementations easy to
integrate) and determines which GPIO lines are shared by multiple users.
It stores that information in memory. When the GPIO chip exposing shared
lines is registered, the shared GPIO descriptors it exposes are marked
as shared and virtual "proxy" devices that mediate access to the shared
lines are created. When a consumer of a shared GPIO looks it up, its
fwnode lookup is redirected to a just-in-time machine lookup that points
to this proxy device.

This code can be compiled out on platforms which don't use shared GPIOs.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig          |   8 +
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpiolib-shared.c | 540 ++++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.h |  71 ++++++
 4 files changed, 620 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ce237398fa00eddad49afe995accae3abbb4b2cb..f90b4d3e77f7cab46525b7adfcf114a21d276678 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -6,6 +6,9 @@
 config GPIOLIB_LEGACY
 	def_bool y
 
+config HAVE_SHARED_GPIOS
+	bool
+
 menuconfig GPIOLIB
 	bool "GPIO Support"
 	help
@@ -42,6 +45,11 @@ config GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN
 	bool
 
+config GPIO_SHARED
+	def_bool y
+	depends on HAVE_SHARED_GPIOS || COMPILE_TEST
+	select AUXILIARY_BUS
+
 config DEBUG_GPIO
 	bool "Debug GPIO calls"
 	depends on DEBUG_KERNEL
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index ee260a0809d36cd07987f04e0ef17b05af764214..48f309c764e3286c23dbe604be933f7180f0b89a 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_GPIO_SYSFS)	+= gpiolib-sysfs.o
 obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
 gpiolib-acpi-y			:= gpiolib-acpi-core.o gpiolib-acpi-quirks.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-swnode.o
+obj-$(CONFIG_GPIO_SHARED)	+= gpiolib-shared.o
 
 # Device drivers. Generally keep list sorted alphabetically
 obj-$(CONFIG_GPIO_REGMAP)	+= gpio-regmap.o
diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
new file mode 100644
index 0000000000000000000000000000000000000000..56b9b03cbb6dbcdf095a656fc36ff321770035da
--- /dev/null
+++ b/drivers/gpio/gpiolib-shared.c
@@ -0,0 +1,540 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Linaro Ltd.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/fwnode.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/idr.h>
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/lockdep.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/overflow.h>
+#include <linux/printk.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "gpiolib.h"
+#include "gpiolib-shared.h"
+
+/* Represents a single reference to a GPIO pin. */
+struct gpio_shared_ref {
+	struct list_head list;
+	/* Firmware node associated with this GPIO's consumer. */
+	struct fwnode_handle *fwnode;
+	/* GPIO flags this consumer uses for the request. */
+	enum gpiod_flags flags;
+	char *con_id;
+	int dev_id;
+	struct auxiliary_device adev;
+	struct gpiod_lookup_table *lookup;
+};
+
+/* Represents a single GPIO pin. */
+struct gpio_shared_entry {
+	struct list_head list;
+	/* Firmware node associated with the GPIO controller. */
+	struct fwnode_handle *fwnode;
+	/* Hardware offset of the GPIO within its chip. */
+	unsigned int offset;
+	/* Index in the property value array. */
+	size_t index;
+	struct gpio_shared_desc *shared_desc;
+	struct kref ref;
+	struct list_head refs;
+};
+
+static LIST_HEAD(gpio_shared_list);
+static DEFINE_MUTEX(gpio_shared_lock);
+static DEFINE_IDA(gpio_shared_ida);
+
+static struct gpio_shared_entry *
+gpio_shared_find_entry(struct fwnode_handle *controller_node,
+		       unsigned int offset)
+{
+	struct gpio_shared_entry *entry;
+
+	list_for_each_entry(entry, &gpio_shared_list, list) {
+		if (entry->fwnode == controller_node && entry->offset == offset)
+			return entry;
+	}
+
+	return NULL;
+}
+
+#if IS_ENABLED(CONFIG_OF)
+static int gpio_shared_of_traverse(struct device_node *curr)
+{
+	struct gpio_shared_entry *entry;
+	size_t con_id_len, suffix_len;
+	struct fwnode_handle *fwnode;
+	struct of_phandle_args args;
+	struct property *prop;
+	unsigned int offset;
+	const char *suffix;
+	int ret, count, i;
+
+	for_each_property_of_node(curr, prop) {
+		/*
+		 * The standard name for a GPIO property is "foo-gpios"
+		 * or "foo-gpio". Some bindings also use "gpios" or "gpio".
+		 * There are some legacy device-trees which have a different
+		 * naming convention and for which we have rename quirks in
+		 * place in gpiolib-of.c. I don't think any of them require
+		 * support for shared GPIOs so for now let's just ignore
+		 * them. We can always just export the quirk list and
+		 * iterate over it here.
+		 */
+		if (!strends(prop->name, "-gpios") &&
+		    !strends(prop->name, "-gpio") &&
+		    strcmp(prop->name, "gpios") != 0 &&
+		    strcmp(prop->name, "gpio") != 0)
+			continue;
+
+		count = of_count_phandle_with_args(curr, prop->name,
+						   "#gpio-cells");
+		if (count <= 0)
+			continue;
+
+		for (i = 0; i < count; i++) {
+			struct device_node *np __free(device_node) = NULL;
+
+			ret = of_parse_phandle_with_args(curr, prop->name,
+							 "#gpio-cells", i,
+							 &args);
+			if (ret)
+				continue;
+
+			np = args.np;
+
+			if (!of_property_present(np, "gpio-controller"))
+				continue;
+
+			/*
+			 * We support 1, 2 and 3 cell GPIO bindings in the
+			 * kernel currently. There's only one old MIPS dts that
+			 * has a one-cell binding but there's no associated
+			 * consumer so it may as well be an error. There don't
+			 * seem to be any 3-cell users of non-exclusive GPIOs,
+			 * so we can skip this as well. Let's occupy ourselves
+			 * with the predominant 2-cell binding with the first
+			 * cell indicating the hardware offset of the GPIO and
+			 * the second defining the GPIO flags of the request.
+			 */
+			if (args.args_count != 2)
+				continue;
+
+			fwnode = of_fwnode_handle(args.np);
+			offset = args.args[0];
+
+			entry = gpio_shared_find_entry(fwnode, offset);
+			if (!entry) {
+				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+				if (!entry)
+					return -ENOMEM;
+
+				entry->fwnode = fwnode_handle_get(fwnode);
+				entry->offset = offset;
+				entry->index = count;
+				INIT_LIST_HEAD(&entry->refs);
+
+				list_add_tail(&entry->list, &gpio_shared_list);
+			}
+
+			struct gpio_shared_ref *ref __free(kfree) =
+					kzalloc(sizeof(*ref), GFP_KERNEL);
+			if (!ref)
+				return -ENOMEM;
+
+			ref->fwnode = fwnode_handle_get(of_fwnode_handle(curr));
+			ref->flags = args.args[1];
+
+			if (strends(prop->name, "gpios"))
+				suffix = "-gpios";
+			else if (strends(prop->name, "gpio"))
+				suffix = "-gpio";
+			else
+				suffix = NULL;
+			if (!suffix)
+				continue;
+
+			/* We only set con_id if there's actually one. */
+			if (strcmp(prop->name, "gpios") && strcmp(prop->name, "gpio")) {
+				ref->con_id = kstrdup(prop->name, GFP_KERNEL);
+				if (!ref->con_id)
+					return -ENOMEM;
+
+				con_id_len = strlen(ref->con_id);
+				suffix_len = strlen(suffix);
+
+				ref->con_id[con_id_len - suffix_len] = '\0';
+			}
+
+			ref->dev_id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
+			if (ref->dev_id < 0) {
+				kfree(ref->con_id);
+				return -ENOMEM;
+			}
+
+			if (!list_empty(&entry->refs))
+				pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
+					 entry->offset, fwnode_get_name(entry->fwnode));
+
+			list_add_tail(&no_free_ptr(ref)->list, &entry->refs);
+		}
+	}
+
+	for_each_child_of_node_scoped(curr, child) {
+		ret = gpio_shared_of_traverse(child);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int gpio_shared_of_scan(void)
+{
+	return gpio_shared_of_traverse(of_root);
+}
+#else
+static int gpio_shared_of_scan(void)
+{
+	return 0;
+}
+#endif /* CONFIG_OF */
+
+static void gpio_shared_adev_release(struct device *dev)
+{
+
+}
+
+static int gpio_shared_make_adev(struct gpio_device *gdev,
+				 struct gpio_shared_ref *ref)
+{
+	struct auxiliary_device *adev = &ref->adev;
+	int ret;
+
+	lockdep_assert_held(&gpio_shared_lock);
+
+	memset(adev, 0, sizeof(*adev));
+
+	adev->id = ref->dev_id;
+	adev->name = "proxy";
+	adev->dev.parent = gdev->dev.parent;
+	adev->dev.release = gpio_shared_adev_release;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
+		 dev_name(&adev->dev), gpio_device_get_label(gdev));
+
+	return 0;
+}
+
+int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags)
+{
+	const char *dev_id = dev_name(consumer);
+	struct gpio_shared_entry *entry;
+	struct gpio_shared_ref *ref;
+
+	struct gpiod_lookup_table *lookup __free(kfree) =
+			kzalloc(struct_size(lookup, table, 2), GFP_KERNEL);
+	if (!lookup)
+		return -ENOMEM;
+
+	guard(mutex)(&gpio_shared_lock);
+
+	list_for_each_entry(entry, &gpio_shared_list, list) {
+		list_for_each_entry(ref, &entry->refs, list) {
+			if (!device_match_fwnode(consumer, ref->fwnode))
+				continue;
+
+			/* We've already done that on a previous request. */
+			if (ref->lookup)
+				return 0;
+
+			char *key __free(kfree) =
+				kasprintf(GFP_KERNEL,
+					  KBUILD_MODNAME ".proxy.%u",
+					  ref->adev.id);
+			if (!key)
+				return -ENOMEM;
+
+			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
+				 dev_id, key, ref->con_id ?: "none");
+
+			lookup->dev_id = dev_id;
+			lookup->table[0] = GPIO_LOOKUP(no_free_ptr(key), 0,
+						       ref->con_id, lflags);
+
+			gpiod_add_lookup_table(no_free_ptr(lookup));
+
+			return 0;
+		}
+	}
+
+	/* We warn here because this can only happen if the programmer borked. */
+	WARN_ON(1);
+	return -ENOENT;
+}
+
+static void gpio_shared_remove_adev(struct auxiliary_device *adev)
+{
+	lockdep_assert_held(&gpio_shared_lock);
+
+	auxiliary_device_uninit(adev);
+	auxiliary_device_delete(adev);
+}
+
+int gpio_device_setup_shared(struct gpio_device *gdev)
+{
+	struct gpio_shared_entry *entry;
+	struct gpio_shared_ref *ref;
+	unsigned long *flags;
+	int ret;
+
+	guard(mutex)(&gpio_shared_lock);
+
+	list_for_each_entry(entry, &gpio_shared_list, list) {
+		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
+			continue;
+
+		if (list_count_nodes(&entry->refs) <= 1)
+			continue;
+
+		flags = &gdev->descs[entry->offset].flags;
+
+		__set_bit(GPIOD_FLAG_SHARED, flags);
+		/*
+		 * Shared GPIOs are not requested via the normal path. Make
+		 * them inaccessible to anyone even before we register the
+		 * chip.
+		 */
+		__set_bit(GPIOD_FLAG_REQUESTED, flags);
+
+		pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
+			 entry->offset, gpio_device_get_label(gdev));
+
+		list_for_each_entry(ref, &entry->refs, list) {
+			pr_debug("Setting up a shared GPIO entry for %s\n",
+				 fwnode_get_name(ref->fwnode));
+
+			ret = gpio_shared_make_adev(gdev, ref);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+void gpio_device_teardown_shared(struct gpio_device *gdev)
+{
+	struct gpio_shared_entry *entry;
+	struct gpio_shared_ref *ref;
+
+	guard(mutex)(&gpio_shared_lock);
+
+	list_for_each_entry(entry, &gpio_shared_list, list) {
+		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
+			continue;
+
+		list_for_each_entry(ref, &entry->refs, list) {
+			gpiod_remove_lookup_table(ref->lookup);
+			kfree(ref->lookup->table[0].key);
+			kfree(ref->lookup);
+			ref->lookup = NULL;
+			gpio_shared_remove_adev(&ref->adev);
+		}
+	}
+}
+
+static void gpio_shared_release(struct kref *kref)
+{
+	struct gpio_shared_entry *entry =
+		container_of(kref, struct gpio_shared_entry, ref);
+	struct gpio_shared_desc *shared_desc = entry->shared_desc;
+
+	guard(mutex)(&gpio_shared_lock);
+
+	gpio_device_put(shared_desc->desc->gdev);
+	if (shared_desc->can_sleep)
+		mutex_destroy(&shared_desc->mutex);
+	kfree(shared_desc);
+	entry->shared_desc = NULL;
+}
+
+static void gpiod_shared_put(void *data)
+{
+	struct gpio_shared_entry *entry = data;
+
+	lockdep_assert_not_held(&gpio_shared_lock);
+
+	kref_put(&entry->ref, gpio_shared_release);
+}
+
+static struct gpio_shared_desc *
+gpiod_shared_desc_create(struct gpio_shared_entry *entry)
+{
+	struct gpio_shared_desc *shared_desc;
+	struct gpio_device *gdev;
+
+	shared_desc = kzalloc(sizeof(*shared_desc), GFP_KERNEL);
+	if (!shared_desc)
+		return ERR_PTR(-ENOMEM);
+
+	gdev = gpio_device_find_by_fwnode(entry->fwnode);
+	if (!gdev) {
+		kfree(shared_desc);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	shared_desc->desc = &gdev->descs[entry->offset];
+	shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
+	if (shared_desc->can_sleep)
+		mutex_init(&shared_desc->mutex);
+	else
+		spin_lock_init(&shared_desc->spinlock);
+
+	return shared_desc;
+}
+
+static struct gpio_shared_entry *gpiod_shared_find(struct auxiliary_device *adev)
+{
+	struct gpio_shared_desc *shared_desc;
+	struct gpio_shared_entry *entry;
+	struct gpio_shared_ref *ref;
+
+	guard(mutex)(&gpio_shared_lock);
+
+	list_for_each_entry(entry, &gpio_shared_list, list) {
+		list_for_each_entry(ref, &entry->refs, list) {
+			if (adev != &ref->adev)
+				continue;
+
+			if (entry->shared_desc) {
+				kref_get(&entry->ref);
+				return entry;
+			}
+
+			shared_desc = gpiod_shared_desc_create(entry);
+			if (IS_ERR(shared_desc))
+				return ERR_CAST(shared_desc);
+
+			kref_init(&entry->ref);
+			entry->shared_desc = shared_desc;
+
+			pr_debug("Device %s acquired a reference to the shared GPIO %u owned by %s\n",
+				 dev_name(&adev->dev), gpiod_hwgpio(shared_desc->desc),
+				 gpio_device_get_label(shared_desc->desc->gdev));
+
+
+			return entry;
+		}
+	}
+
+	return ERR_PTR(-ENOENT);
+}
+
+struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev)
+{
+	struct gpio_shared_entry *entry;
+	int ret;
+
+	entry = gpiod_shared_find(to_auxiliary_dev(dev));
+	if (IS_ERR(entry))
+		return ERR_CAST(entry);
+
+	ret = devm_add_action_or_reset(dev, gpiod_shared_put, entry);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return entry->shared_desc;
+}
+EXPORT_SYMBOL_GPL(devm_gpiod_shared_get);
+
+static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
+{
+	list_del(&ref->list);
+	kfree(ref->con_id);
+	ida_free(&gpio_shared_ida, ref->dev_id);
+	fwnode_handle_put(ref->fwnode);
+	kfree(ref);
+}
+
+static void gpio_shared_drop_entry(struct gpio_shared_entry *entry)
+{
+	list_del(&entry->list);
+	fwnode_handle_put(entry->fwnode);
+	kfree(entry);
+}
+
+/*
+ * This is only called if gpio_shared_init() fails so it's in fact __init and
+ * not __exit.
+ */
+static void __init gpio_shared_teardown(void)
+{
+	struct gpio_shared_entry *entry, *epos;
+	struct gpio_shared_ref *ref, *rpos;
+
+	list_for_each_entry_safe(entry, epos, &gpio_shared_list, list) {
+		list_for_each_entry_safe(ref, rpos, &entry->refs, list)
+			gpio_shared_drop_ref(ref);
+
+		gpio_shared_drop_entry(entry);
+	}
+}
+
+static void gpio_shared_free_exclusive(void)
+{
+	struct gpio_shared_entry *entry, *epos;
+
+	list_for_each_entry_safe(entry, epos, &gpio_shared_list, list) {
+		if (list_count_nodes(&entry->refs) > 1)
+			continue;
+
+		gpio_shared_drop_ref(list_first_entry(&entry->refs,
+						      struct gpio_shared_ref,
+						      list));
+		gpio_shared_drop_entry(entry);
+	}
+}
+
+static int __init gpio_shared_init(void)
+{
+	int ret;
+
+	/* Right now, we only support OF-based systems. */
+	ret = gpio_shared_of_scan();
+	if (ret) {
+		gpio_shared_teardown();
+		pr_err("Failed to scan OF nodes for shared GPIOs: %d\n", ret);
+		return ret;
+	}
+
+	gpio_shared_free_exclusive();
+
+	pr_debug("Finished scanning firmware nodes for shared GPIOs\n");
+	return 0;
+}
+postcore_initcall(gpio_shared_init);
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
new file mode 100644
index 0000000000000000000000000000000000000000..667dbdff3585066b7cbe2ebe476725fe7d683d84
--- /dev/null
+++ b/drivers/gpio/gpiolib-shared.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_GPIO_SHARED_H
+#define __LINUX_GPIO_SHARED_H
+
+#include <linux/cleanup.h>
+#include <linux/lockdep.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+
+struct gpio_device;
+struct gpio_desc;
+struct device;
+
+#if IS_ENABLED(CONFIG_GPIO_SHARED)
+
+int gpio_device_setup_shared(struct gpio_device *gdev);
+void gpio_device_teardown_shared(struct gpio_device *gdev);
+int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags);
+
+#else
+
+static inline int gpio_device_setup_shared(struct gpio_device *gdev)
+{
+	return 0;
+}
+
+static inline void gpio_device_teardown_shared(struct gpio_device *gdev) { }
+
+static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
+					       unsigned long lflags)
+{
+	return 0;
+}
+
+#endif /* CONFIG_GPIO_SHARED */
+
+struct gpio_shared_desc {
+	struct gpio_desc *desc;
+	bool can_sleep;
+	unsigned long cfg;
+	unsigned int usecnt;
+	unsigned int highcnt;
+	union {
+		struct mutex mutex;
+		spinlock_t spinlock;
+	};
+};
+
+struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev);
+
+DEFINE_LOCK_GUARD_1(gpio_shared_desc_lock, struct gpio_shared_desc,
+	if (_T->lock->can_sleep)
+		mutex_lock(&_T->lock->mutex);
+	else
+		spin_lock_irqsave(&_T->lock->spinlock, _T->flags),
+	if (_T->lock->can_sleep)
+		mutex_unlock(&_T->lock->mutex);
+	else
+		spin_unlock_irqrestore(&_T->lock->spinlock, _T->flags),
+	unsigned long flags)
+
+static inline void gpio_shared_lockdep_assert(struct gpio_shared_desc *shared_desc)
+{
+	if (shared_desc->can_sleep)
+		lockdep_assert_held(&shared_desc->mutex);
+	else
+		lockdep_assert_held(&shared_desc->spinlock);
+}
+
+#endif /* __LINUX_GPIO_SHARED_H */

-- 
2.51.0


