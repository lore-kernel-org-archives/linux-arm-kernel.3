Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5B5C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 13:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPNorcwe09JFFnqM9zhfrsqCB+MgIigFgdvHKE0gwN8=; b=wAOiPCmeng5oWb3zEe670uJWTX
	SKmuSuqIdnvJkDuFKxiBHsWXa1lPLkr7ab7YFTRx0+DbsrQBJS6GCgAwCh2kpnLodCgl04xbKmdo/
	HUBRCW9aKE5rc36NIkPGUxccliFkYZANlY2995hmC0EpGZOSCVONN9/OufB7G+4cIEQTTmS1gwjsW
	uHXvDDZDqhJbja3jQ+P2KoMLcX5LHc4DGsixBAq7ofwfszrAGVvZoaLz4t/V05hW+ibopYbLqjIkA
	dluKtNfyXrpWJSnc1vCd6X+5Aomt2mERZVb4PfLShG3FTB9K2pRylrxuHfriiFdgSTYUCrpTOPrfL
	wshQMKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU46S-00000005nNO-0NJK;
	Tue, 24 Jun 2025 13:54:24 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3gi-00000005i6z-01Xv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:27:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso305689f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771666; x=1751376466; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPNorcwe09JFFnqM9zhfrsqCB+MgIigFgdvHKE0gwN8=;
        b=psKGMalz/UTNHEoJY6S/ZdhHcdlSQps99MS+0ztbPUcKdIz+pUsyMm4fhuODBsfQ4d
         Xv8cLqoqneeRyYZfa7US2bozWO7Mxcni+yEJItMg0DDZuZIpek8hfOxNlix9/qCyEDGM
         O/WHxoOAt9nlBT4vcwJsEttU09PKcI1z0TqbDk2KDcuDsHZcznBWH6I4uEo/6LbIhtNz
         Fwnd4C/zauo3yEsIy4Q+xhLvWUkqgvytJBSKdMSv9n3gsLs7rv976tdVz3bNi2byj4HB
         0aM6XfkKZKAyYa4C6trn/B8iskA82vDjReZmEmU9ewwz0y5yDSOu3jonpWz6SQwvg8MJ
         KyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771666; x=1751376466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPNorcwe09JFFnqM9zhfrsqCB+MgIigFgdvHKE0gwN8=;
        b=AbA/sk8HdognxtqKCIeHMjn8Ga2hDRvJfiVQFGy/yT5Lew3RVPHUIThFkbJ+yjUwkW
         ItCoCsTsQZDbJVHEPjM0Jf7p+Xr6NKeCF45KsXy63xmCOZkJMVLAyN7Xkhaa8/iq7Gv/
         YriZCyk71iODu7rhpCf4lD/HZ8FyGQUV5EzKsv5DqGO6thIDETFlYMYWSz/Wonna9uAV
         ybBa79zINjZBq0NFcm6SH2dl3lC+apJl09CogTz8Rwls1HxY3qbMhRQEQxZkYyhdLfkS
         G0fiXl+i9J0/p0e7Ap0HpOVh2P4KPzeFytmHVoi6Vp2ZVLFPEclMKUeO2PcmkaeCPnss
         bDzA==
X-Forwarded-Encrypted: i=1; AJvYcCXNhSdBU6fG/Bc609j3ko5xwP56pFvOlSOmSOQnCav3I5JZLELOg5Qapm3GBtHAG3+JRJD2Jv4xkj/23Cr5yVPU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+fym6oiZgJn3+SkOqX3dCf3aLGICUPF10xC1TTLma1oA+6Pb9
	L4zvid1dYgaqxSpQyd1o0H3WyyWeSK4D7wnB3yWrMeyxXuSACvXGIdpQUnR2sb7kDWM=
X-Gm-Gg: ASbGncv8M9SiS4cjrNh2K/e/WNKy5/jTYckPKHZTT59KquBY4OcBMhDHERW48ZxugB1
	OWtBA2VFrAg6M0YcQKCA46Hd70O24NtrGke5FKH7LBAeDt10E9T1uOjDPV/his3wFmKwowRTiu3
	MR5n4fsAoT29RJcCH70OntJHSwQqrbTO10UTStqW/D+AALWhVskEQIkc1ARRhIg0+74/ww3DFwl
	iRpT5/P25CrqMGJv9qfwO0dLxQfLb5mEDCt5GOzRdrncrFse1ofFTYi2MNTRnWMic55/Mga/e32
	1G4qbiNHWi4f7EpJeKTAPj2RNC+gN7Y+PZqBZ65sJlHniZhmK4neOII=
X-Google-Smtp-Source: AGHT+IHyyzlTfmHjpkGDCzSsnZ1DoHQG/VRIolDKsd8x7zCVRfvxcc+irt0fOqtYbtA7YWl7zRSnVg==
X-Received: by 2002:a05:6000:2906:b0:3a3:7ba5:93a5 with SMTP id ffacd0b85a97d-3a6d130b3b5mr12981845f8f.26.1750771666426;
        Tue, 24 Jun 2025 06:27:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:35 +0200
Subject: [PATCH 3/8] gpio: mxc: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-3-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4585;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7dNBbQiZPeeOnrumTKTkdU6R2h9p96Y/Z73AlTuG4GA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfMNW+4W6lbQ4TTtSYHD/RiZ11H/66qnWka0
 tZx5c4m6dSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzAAKCRARpy6gFHHX
 cuXCD/92dA/AcL/4wIcsvFVT78uku8a94yvgCY8Yfwac7Bg7Ti5G8WOra1iPVj3PzNTYEvdD7N7
 QPpaOllct2qAG9pPQyearqxDiTmgNpH+vwWOBm4YIYcivJ1ivjy+GX7uSmEwsoGKVCnAOvFpcNb
 i5nQUqiFhHfc5qEfJ81SGLRjULjbOcc5W/zSRK2HrMNLRaH2DwxJYsbDb7zDW5Dp8ZTDFvFpTi4
 81OoKTZpPPqPC7XggbAADV5DIo9iLvaUzSIcR8SIAFZXuvtZXNGWzbrB8Bh5/S88mnOQfLaT+NL
 k6Ix9fgF/nWX89Xkc3MGYBnbr3BPIWblsijrf8Tt4Fsw6Mmjrccruqup722XCFIqs4ZVm6DL3ZL
 l+gj3Kg+h8ntt1RmeQvNmnPaMYK8dx3Qew4o5O5dnxfuJ1FVndQjbYh7MDR5lqUufuXlAH+KsqR
 t+aDny8kpkxxhMW78EQEUz8Zys/x1GKMX/Y2VuX4n2OcTSLJPoa4y63x39GqUolcl1/B32qqZBm
 aocA0tDiV+9i2PpRJkq/hZvbC+ZOLswyPjLKypJNlC/venBFAERaOwDFjGxZK/HWcSSV1DtgfsU
 Kg/TodCncoKm/fg0Su07rfoFDOV+Vfptr8hlH41In2UDKWRAHkPKF37WBhAJabiCvvS81XMsmMW
 vBB+Q/5N53fni7g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_062748_053038_6447FD59 
X-CRM114-Status: GOOD (  18.53  )
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

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mxc.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 1c37168c8d0a657d7f93067d9ac95cfbd821f757..433cbadc3a4cc67ebc89a4702280975fa8d2c9bc 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -23,6 +23,7 @@
 #include <linux/spinlock.h>
 #include <linux/syscore_ops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/of.h>
 #include <linux/bug.h>
 
@@ -65,7 +66,7 @@ struct mxc_gpio_port {
 	int irq_high;
 	void (*mx_irq_handler)(struct irq_desc *desc);
 	struct irq_domain *domain;
-	struct gpio_chip gc;
+	struct gpio_generic_chip gen_gc;
 	struct device *dev;
 	u32 both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
@@ -179,7 +180,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		if (GPIO_EDGE_SEL >= 0) {
 			edge = GPIO_INT_BOTH_EDGES;
 		} else {
-			val = port->gc.get(&port->gc, gpio_idx);
+			val = port->gen_gc.gc.get(&port->gen_gc.gc, gpio_idx);
 			if (val) {
 				edge = GPIO_INT_LOW_LEV;
 				pr_debug("mxc: set GPIO %d to low trigger\n", gpio_idx);
@@ -200,7 +201,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		return -EINVAL;
 	}
 
-	scoped_guard(raw_spinlock_irqsave, &port->gc.bgpio_lock) {
+	scoped_guard(gpio_generic_lock_irqsave, &port->gen_gc) {
 		if (GPIO_EDGE_SEL >= 0) {
 			val = readl(port->base + GPIO_EDGE_SEL);
 			if (edge == GPIO_INT_BOTH_EDGES)
@@ -222,7 +223,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		port->pad_type[gpio_idx] = type;
 	}
 
-	return port->gc.direction_input(&port->gc, gpio_idx);
+	return port->gen_gc.gc.direction_input(&port->gen_gc.gc, gpio_idx);
 }
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
@@ -231,7 +232,7 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 	u32 bit, val;
 	int edge;
 
-	guard(raw_spinlock_irqsave)(&port->gc.bgpio_lock);
+	guard(gpio_generic_lock_irqsave)(&port->gen_gc);
 
 	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
 	bit = gpio & 0xf;
@@ -414,6 +415,7 @@ static void mxc_update_irq_chained_handler(struct mxc_gpio_port *port, bool enab
 
 static int mxc_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
 	struct mxc_gpio_port *port;
 	int irq_count;
@@ -473,27 +475,31 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		port->mx_irq_handler = mx3_gpio_irq_handler;
 
 	mxc_update_irq_chained_handler(port, true);
-	err = bgpio_init(&port->gc, &pdev->dev, 4,
-			 port->base + GPIO_PSR,
-			 port->base + GPIO_DR, NULL,
-			 port->base + GPIO_GDIR, NULL,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+
+	config.dev = &pdev->dev;
+	config.sz = 4;
+	config.dat = port->base + GPIO_PSR;
+	config.set = port->base + GPIO_DR;
+	config.dirout = port->base + GPIO_GDIR;
+	config.flags = BGPIOF_READ_OUTPUT_REG_SET;
+
+	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
 		goto out_bgio;
 
-	port->gc.request = mxc_gpio_request;
-	port->gc.free = mxc_gpio_free;
-	port->gc.to_irq = mxc_gpio_to_irq;
+	port->gen_gc.gc.request = mxc_gpio_request;
+	port->gen_gc.gc.free = mxc_gpio_free;
+	port->gen_gc.gc.to_irq = mxc_gpio_to_irq;
 	/*
 	 * Driver is DT-only, so a fixed base needs only be maintained for legacy
 	 * userspace with sysfs interface.
 	 */
 	if (IS_ENABLED(CONFIG_GPIO_SYSFS))
-		port->gc.base = of_alias_get_id(np, "gpio") * 32;
+		port->gen_gc.gc.base = of_alias_get_id(np, "gpio") * 32;
 	else /* silence boot time warning */
-		port->gc.base = -1;
+		port->gen_gc.gc.base = -1;
 
-	err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
+	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
 	if (err)
 		goto out_bgio;
 
@@ -567,7 +573,8 @@ static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
 	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
 	    of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
 	    of_device_is_compatible(np, "fsl,imx8qm-gpio"))
-		return (gpiochip_generic_config(&port->gc, offset, conf) == 0);
+		return (gpiochip_generic_config(&port->gen_gc.gc,
+						offset, conf) == 0);
 
 	return false;
 }

-- 
2.48.1


