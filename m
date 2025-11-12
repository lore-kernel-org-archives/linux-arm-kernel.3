Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610F0CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okxpEuXb1rioQLTWx+EehnmQO9hSAr1CFW8NOoMs7fs=; b=VxBtUYqo2OdBSCCKttbemtK+1W
	QRjLXDGdCAIdmWdsA4jmaPnbCSzcl8rMc5TB27D88WFmEQokMTCS8Cj+Z6WFKUCBh3J2uVT1ILd4u
	MyQrxTUr8depwn0x+3HtDPmp/O0qJ6XNA0MLrzzhxjuEY/YaLWLugx8DzYTLeavzuFt92bNLn1Nt6
	KsNaXVl7NqNql6wnlYOVwxHhWBpfUCx4OPa7dPbw/6bk/dapi7DUgg3XKm3bk4GRHXQ/CfvsoeIiC
	cqwKRJX3g/N8pITKsIX9ExOcuoqubz13hs2BhC1GwjdPUa5vXDKBJ5vuxvpl4wDjZKgMMSQyIxaz7
	xbJE3/3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBKA-00000008sTV-0xLI;
	Wed, 12 Nov 2025 13:55:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBK7-00000008sRD-2bPT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:55:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47758595eecso4621175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 05:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955746; x=1763560546; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okxpEuXb1rioQLTWx+EehnmQO9hSAr1CFW8NOoMs7fs=;
        b=oT1PxFthUjYDaIgAciiVpyoX+MbjewUyLccXRybnPRmXsb2kxoxjiXc+B3O6iiMOLv
         VSPYgjQxm9zrFH62N32+p0iDGOETTTwal0hO+v4eY2tuxkU2tFw8w/+O5Atv+oxz643q
         oGKOxA6D7SmAYgyQPvKNfLaZNYN4QQXi6FOCNtnnFQba+JzUa+8g7uU15mblswwL68L2
         KPJFGWMdLWzjWvBd8dRNMtNbXPSKWbCyLw65AtPVGkI1suFQIQaL0A50+Ed4Wqy3XPEM
         s2ztcPj/QlZwxORtq3Bm3s0gMf04v3vv9+AfgcfEQ5HwAo/Ivj09k7Oy0+zu0sPNt0Ja
         m1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955746; x=1763560546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=okxpEuXb1rioQLTWx+EehnmQO9hSAr1CFW8NOoMs7fs=;
        b=LRKjPWT4zDj7O211iKieAktmJUNonWOfGn/LG7mBQsXatT/2Am/0MoQzWsZZny9XXr
         OQ24i+QPiwdE7g8t1axkZg1BTsngJy8FP24p0JYVwy3+CqwLG6+s46zST8mOPrX3Bb2d
         BgVSpqbGdbciRiEOUj4KTtHyVy7tPilKVEsS55mnohvYyPyKE+iEmmBSOtzlhsb1NTlf
         C8F6Jd5OF4cvUFnb8DKmx8noXlEiat9iiDXKAc1GLsWI9Yeg823OhgZOqW0rfx/ezpdO
         LapB3Ud3VUUGJg1wOX5uIEiK2btn0MRAk1bUUv9mukbJCle2YcFSH5mCfxgLKzmm4XTm
         kb2w==
X-Forwarded-Encrypted: i=1; AJvYcCXgWE1ChahAE8WhAxDikaEhaT4V/esazQu/Ge8ReVnzDHojJaMYNtq7zXEELB+Wkp92P7DaExGZb44dHVA+g9In@lists.infradead.org
X-Gm-Message-State: AOJu0YyQQbn7v0L16RhhU6wggmu2gVXCWGbUufrC0ESynLlZyCYdPxj5
	h4zFo3Z7HSMHJrlLVKPZwRcrpAsu+3Ga9xtl6qcngctV4T1Ept45d/MMPMuOro88VeY=
X-Gm-Gg: ASbGncuW8zAnd8WiYxdAzbcntEWD8M4LBwNitf8v7MCF/DrLFdm8mQ2PuwfqhG7wH2R
	BLxI6d2DriXbH/aQjyoUTV0Fsi3Srn+xGm+IKpOR3C656A0iuWx6BKWfFx/NVgv0eCzzi3fIWFQ
	8izickmo3+7wR4azQ/hVbsgaD9RjfUVHffUMppYgbEMjnE5yW21knFkRqwOVKfN2OMjY41PklMu
	2HFgpbtGfQiO2bI0qHvf74WplfYDiDP+nCp77Cexa66IRq/lDcwbrw0bk7gG/tAP4KoHBQXmbL5
	jw2shqjr6qAYdF762vYZVAbGmObGF5grLbOzwbbDqMrdeCPDN2qeX/eQ9EiCQsbX7ZESwq2wZmN
	JCwi2NOyW09m7C9V7JzXJOiVQCBpeyvXXPho0bgCZL86Ja2ilMF/chlsP66taYoLAybE=
X-Google-Smtp-Source: AGHT+IFrq4LOscGgyiaHGmHOOTxjacCxX8HGFaagLmdraJ6fFxhX4nYpJwcLo5aDxi19wWPTXZZRRg==
X-Received: by 2002:a05:600c:1c85:b0:477:76cb:4812 with SMTP id 5b1f17b1804b1-47787000e64mr32508585e9.0.1762955745795;
        Wed, 12 Nov 2025 05:55:45 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:44 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:33 +0100
Subject: [PATCH v4 04/10] gpio: shared-proxy: implement the shared GPIO
 proxy driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-4-b51f97b1abd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12178;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0FrWcL7+b43kJTdQOvLH0UXC/dEHaWLrwVCfSK/xBPY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHVf+xVOt8uIIE7Q3GL+Iw/0lWC7Onn98eAr
 Q057KyMCyuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1QAKCRAFnS7L/zaE
 w2xdD/0YjJ2WVr1x7Md1meYTvfYwZL+7Z/SMjXxODil5PrnPx7Hv8h9QcUoxqYym2nQPi4ON2aA
 1IZxll6V80bXl4X99ItUTRNq9xaUIZ8Ayr3cBnLrGmmSeD5lIYgtgM+dHnMFIbXjyZsYQe49WXJ
 dLRQTs7Gc5vmoNHgF4YKt2bPoxD9JMAR7OU+PcM8twtXLFuXvpkaifEiA4yhpVcQcIOpd7KzCBo
 MWsqdTnOQHOwyxuS1/9x65Tp6ArxVY0Y4zTr0q2cQHhvgbfcRlqEmGQ81Kl7xbuhKhAsbbywKqm
 +nOcUb6qA5SKj+wgLsSp3Ufyg3JeiOoHuvLdfiSvGCaeoFyYtc9oVFukSr1ejYPZX/XzZNx0Pgf
 f8C+tohg8JQV0zVIHB7xh5z2mQD1aQQGbjCyQb9bh69ry8N7KJKzQZlPuidh8C6Be6EAjo/a/dq
 pmJk5/53afBHz5YciwGbJ5Lp5vN2GUjVZbe1RujsVjNr2r3BoQPHsKg9FY4rQM2jiwQOUl2Ojz/
 T5G6kJOSm7Kvp1/d9p3TU2fLbwgbMh0FLOpS+3OeF3IkjVkU8BN3mlyIT6LeWyyYUh97neuRjJA
 ikUGW3EKjXCkqZM3E8B0wO6c5yla0AddUYCHDkMTXsXNhB7JRuQGCpxJDiurov/XS8JObvZolQW
 GIoPLoyHE55tAvA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_055547_742753_94284DEB 
X-CRM114-Status: GOOD (  30.87  )
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

Add a virtual GPIO proxy driver which arbitrates access to a single
shared GPIO by multiple users. It works together with the core shared
GPIO support from GPIOLIB and functions by acquiring a reference to a
shared GPIO descriptor exposed by gpiolib-shared and making sure that
the state of the GPIO stays consistent.

In general: if there's only one user at the moment: allow it to do
anything as if this was a normal GPIO (in essence: just propagate calls
to the underlying real hardware driver). If there are more users: don't
allow to change the direction set by the initial user, allow to change
configuration options but warn about possible conflicts and finally:
treat the output-high value as a reference counted, logical "GPIO
enabled" setting, meaning: the GPIO value is set to high when the first
user requests it to be high and back to low once the last user stops
"voting" for high.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig             |   9 ++
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-shared-proxy.c | 333 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 343 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f90b4d3e77f7cab46525b7adfcf114a21d276678..f910c20f0d5d7771f7f8f3d52ced7bce413d24f1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -2025,6 +2025,15 @@ config GPIO_SIM
 	  This enables the GPIO simulator - a configfs-based GPIO testing
 	  driver.
 
+config GPIO_SHARED_PROXY
+	tristate "Proxy driver for non-exclusive GPIOs"
+	default m
+	depends on GPIO_SHARED || COMPILE_TEST
+	select AUXILIARY_BUS
+	help
+	  This enables the GPIO shared proxy driver - an abstraction layer
+	  for GPIO pins that are shared by multiple devices.
+
 endmenu
 
 menu "GPIO Debugging utilities"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 48f309c764e3286c23dbe604be933f7180f0b89a..2421a8fd3733e0b06c2581262aaa9cd629f66c7d 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -161,6 +161,7 @@ obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
 obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
+obj-$(CONFIG_GPIO_SHARED_PROXY)		+= gpio-shared-proxy.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
 obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
new file mode 100644
index 0000000000000000000000000000000000000000..3ef2c40ed15229074052eda93b6ee56f0a2bfb72
--- /dev/null
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Linaro Ltd.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/string_choices.h>
+#include <linux/types.h>
+
+#include "gpiolib-shared.h"
+
+struct gpio_shared_proxy_data {
+	struct gpio_chip gc;
+	struct gpio_shared_desc *shared_desc;
+	struct device *dev;
+	bool voted_high;
+};
+
+static int
+gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy,
+			       int (*set_func)(struct gpio_desc *desc, int value),
+			       int value)
+{
+	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
+	struct gpio_desc *desc = shared_desc->desc;
+	int ret = 0;
+
+	gpio_shared_lockdep_assert(shared_desc);
+
+	if (value) {
+	       /* User wants to set value to high. */
+		if (proxy->voted_high)
+			/* Already voted for high, nothing to do. */
+			goto out;
+
+		/* Haven't voted for high yet. */
+		if (!shared_desc->highcnt) {
+			/*
+			 * Current value is low, need to actually set value
+			 * to high.
+			 */
+			ret = set_func(desc, 1);
+			if (ret)
+				goto out;
+		}
+
+		shared_desc->highcnt++;
+		proxy->voted_high = true;
+
+		goto out;
+	}
+
+	/* Desired value is low. */
+	if (!proxy->voted_high)
+		/* We didn't vote for high, nothing to do. */
+		goto out;
+
+	/* We previously voted for high. */
+	if (shared_desc->highcnt == 1) {
+		/* This is the last remaining vote for high, set value  to low. */
+		ret = set_func(desc, 0);
+		if (ret)
+			goto out;
+	}
+
+	shared_desc->highcnt--;
+	proxy->voted_high = false;
+
+out:
+	if (shared_desc->highcnt)
+		dev_dbg(proxy->dev,
+			"Voted for value '%s', effective value is 'high', number of votes for 'high': %u\n",
+			str_high_low(value), shared_desc->highcnt);
+	else
+		dev_dbg(proxy->dev, "Voted for value 'low', effective value is 'low'\n");
+
+	return ret;
+}
+
+static int gpio_shared_proxy_request(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
+
+	guard(gpio_shared_desc_lock)(shared_desc);
+
+	proxy->shared_desc->usecnt++;
+
+	dev_dbg(proxy->dev, "Shared GPIO requested, number of users: %u\n",
+		proxy->shared_desc->usecnt);
+
+	return 0;
+}
+
+static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
+
+	guard(gpio_shared_desc_lock)(shared_desc);
+
+	proxy->shared_desc->usecnt--;
+
+	dev_dbg(proxy->dev, "Shared GPIO freed, number of users: %u\n",
+		proxy->shared_desc->usecnt);
+}
+
+static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
+					unsigned int offset, unsigned long cfg)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
+	struct gpio_desc *desc = shared_desc->desc;
+	int ret;
+
+	guard(gpio_shared_desc_lock)(shared_desc);
+
+	if (shared_desc->usecnt > 1) {
+		if (shared_desc->cfg != cfg) {
+			dev_dbg(proxy->dev,
+				"Shared GPIO's configuration already set, accepting changes but users may conflict!!\n");
+		} else {
+			dev_dbg(proxy->dev, "Equal config requested, nothing to do\n");
+			return 0;
+		}
+	}
+
+	ret = gpiod_set_config(desc, cfg);
+	if (ret && ret != -ENOTSUPP)
+		return ret;
+
+	shared_desc->cfg = cfg;
+	return 0;
+}
+
+static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
+					     unsigned int offset)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
+	struct gpio_desc *desc = shared_desc->desc;
+	int dir;
+
+	guard(gpio_shared_desc_lock)(shared_desc);
+
+	if (shared_desc->usecnt == 1) {
+		dev_dbg(proxy->dev,
+			"Only one user of this shared GPIO, allowing to set direction to input\n");
+
+		return gpiod_direction_input(desc);
+	}
+
+	dir = gpiod_get_direction(desc);
+	if (dir < 0)
+		return dir;
+
+	if (dir == GPIO_LINE_DIRECTION_OUT) {
+		dev_dbg(proxy->dev,
+			"Shared GPIO's direction already set to output, refusing to change\n");
+		return -EPERM;
+	}
+
+	return 0;
+}
+
+static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
+					      unsigned int offset, int value)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
+	struct gpio_desc *desc = shared_desc->desc;
+	int ret, dir;
+
+	guard(gpio_shared_desc_lock)(shared_desc);
+
+	if (shared_desc->usecnt == 1) {
+		dev_dbg(proxy->dev,
+			"Only one user of this shared GPIO, allowing to set direction to output with value '%s'\n",
+			str_high_low(value));
+
+		ret = gpiod_direction_output(desc, value);
+		if (ret)
+			return ret;
+
+		if (value) {
+			proxy->voted_high = true;
+			shared_desc->highcnt = 1;
+		} else {
+			proxy->voted_high = false;
+			shared_desc->highcnt = 0;
+		}
+
+		return 0;
+	}
+
+	dir = gpiod_get_direction(desc);
+	if (dir < 0)
+		return dir;
+
+	if (dir == GPIO_LINE_DIRECTION_IN) {
+		dev_dbg(proxy->dev,
+			"Shared GPIO's direction already set to input, refusing to change\n");
+		return -EPERM;
+	}
+
+	return gpio_shared_proxy_set_unlocked(proxy, gpiod_direction_output, value);
+}
+
+static int gpio_shared_proxy_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+
+	return gpiod_get_value(proxy->shared_desc->desc);
+}
+
+static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
+					  unsigned int offset)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+
+	return gpiod_get_value_cansleep(proxy->shared_desc->desc);
+}
+
+static int gpio_shared_proxy_do_set(struct gpio_shared_proxy_data *proxy,
+				    int (*set_func)(struct gpio_desc *desc, int value),
+				    int value)
+{
+	guard(gpio_shared_desc_lock)(proxy->shared_desc);
+
+	return gpio_shared_proxy_set_unlocked(proxy, set_func, value);
+}
+
+static int gpio_shared_proxy_set(struct gpio_chip *gc, unsigned int offset,
+				 int value)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+
+	return gpio_shared_proxy_do_set(proxy, gpiod_set_value, value);
+}
+
+static int gpio_shared_proxy_set_cansleep(struct gpio_chip *gc,
+					  unsigned int offset, int value)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+
+	return gpio_shared_proxy_do_set(proxy, gpiod_set_value_cansleep, value);
+}
+
+static int gpio_shared_proxy_get_direction(struct gpio_chip *gc,
+					   unsigned int offset)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+
+	return gpiod_get_direction(proxy->shared_desc->desc);
+}
+
+static int gpio_shared_proxy_to_irq(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+
+	return gpiod_to_irq(proxy->shared_desc->desc);
+}
+
+static int gpio_shared_proxy_probe(struct auxiliary_device *adev,
+				   const struct auxiliary_device_id *id)
+{
+	struct gpio_shared_proxy_data *proxy;
+	struct gpio_shared_desc *shared_desc;
+	struct device *dev = &adev->dev;
+	struct gpio_chip *gc;
+
+	shared_desc = devm_gpiod_shared_get(dev);
+	if (IS_ERR(shared_desc))
+		return PTR_ERR(shared_desc);
+
+	proxy = devm_kzalloc(dev, sizeof(*proxy), GFP_KERNEL);
+	if (!proxy)
+		return -ENOMEM;
+
+	proxy->shared_desc = shared_desc;
+	proxy->dev = dev;
+
+	gc = &proxy->gc;
+	gc->base = -1;
+	gc->ngpio = 1;
+	gc->label = dev_name(dev);
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+	gc->can_sleep = shared_desc->can_sleep;
+
+	gc->request = gpio_shared_proxy_request;
+	gc->free = gpio_shared_proxy_free;
+	gc->set_config = gpio_shared_proxy_set_config;
+	gc->direction_input = gpio_shared_proxy_direction_input;
+	gc->direction_output = gpio_shared_proxy_direction_output;
+	if (gc->can_sleep) {
+		gc->set = gpio_shared_proxy_set_cansleep;
+		gc->get = gpio_shared_proxy_get_cansleep;
+	} else {
+		gc->set = gpio_shared_proxy_set;
+		gc->get = gpio_shared_proxy_get;
+	}
+	gc->get_direction = gpio_shared_proxy_get_direction;
+	gc->to_irq = gpio_shared_proxy_to_irq;
+
+	return devm_gpiochip_add_data(dev, &proxy->gc, proxy);
+}
+
+static const struct auxiliary_device_id gpio_shared_proxy_id_table[] = {
+	{ .name = "gpiolib_shared.proxy" },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, gpio_shared_proxy_id_table);
+
+static struct auxiliary_driver gpio_shared_proxy_driver = {
+	.driver = {
+		.name = "gpio-shared-proxy",
+	},
+	.probe = gpio_shared_proxy_probe,
+	.id_table = gpio_shared_proxy_id_table,
+};
+module_auxiliary_driver(gpio_shared_proxy_driver);
+
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
+MODULE_DESCRIPTION("Shared GPIO mux driver.");
+MODULE_LICENSE("GPL");

-- 
2.51.0


