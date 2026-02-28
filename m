Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D89FEE4C8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 18:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BA9BRUpqJtfVLTnPLuM/6UaIA6/IWTrORNjtsMQdjc=; b=XYva2Rg5ibhmU+7ZfKDKpeqL9y
	uIGwmdwd2CUQapNmGslh7NHa87Jvv5vWR/IZBIZPfwM+t+qf/exyGwSmLVeO2llCA5uOI/nDu8a7w
	Yn9skQgMkeWT6j9mXXXoozAa4pejt0nST+5r4dYqCZX4+rGlJqzHY65f5YKF2Cvyr7JdkkdEWVGrm
	F+yQguZNY2teMAju5mxg7S5/PrSJ/4r7Pq8OwS/XdRaOFf1+G8sCjAtrPrRj2qONmqyE922XLYmXK
	ap9naQpTS6fnQPvUGdmDpZ7p+B/E0+UaWpHQttZeodX2va104+TnP6RFiRnGECOag/YSIyuGA6rQa
	SmQpao3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwOty-0000000A90B-1jpC;
	Sat, 28 Feb 2026 18:18:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwOtv-0000000A8zn-3wQU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 18:18:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EF7B4477B;
	Sat, 28 Feb 2026 18:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C649C19424;
	Sat, 28 Feb 2026 18:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772302730;
	bh=4WL4niNBc4LNDjYLHXwe/xfh27MyGtS+WTgnDFNMZ6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=geNJDCV4LekaAYqiwlk6QUUsoK7zp1ckHShoJM8TMR0urKxreuOAicCBl64hXxyWm
	 0PXLRQlblWNjtF/Zw+7wxxuR4lB1IWUVTNkg74LYuOXEITFuf3AGLYfdDuu59ZHxT/
	 YqaWuSmv96i20qemPU7LyGCz3rlejwkGGe5ZMIEn2UISWnH23iBsOfau+p4hVwux9m
	 LMAIfzf3o4+4ldoWKsHlTmFfft4C2A2hk93UyQT4vwdKaLHJKuSrcTH0c3us3LlgUp
	 +zwAZF9NPctlD1V/rhRBOoDMEzeSN6Tytm1kH+WvBvAGuDp0NJsLXL2mfD4n4oP7T3
	 PBNPj1GI6wddg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org,
	Daniel Mack <daniel@zonque.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10 092/147] power: supply: wm97xx_battery: Convert to GPIO descriptor
Date: Sat, 28 Feb 2026 13:16:40 -0500
Message-ID: <20260228181736.1605592-92-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260228181736.1605592-1-sashal@kernel.org>
References: <20260228181736.1605592-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_101852_045688_D49FB468 
X-CRM114-Status: GOOD (  22.13  )
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

From: Linus Walleij <linus.walleij@linaro.org>

[ Upstream commit cb6d6918c56ffd98e88164d5471f692d33dabf2b ]

This converts the WM97xx driver to use a GPIO descriptor
instead of passing a GPIO number thru platform data.

Like everything else in the driver, use a simple local
variable for the descriptor, it can only ever appear in
one instance anyway so it should not hurt.

After converting the driver I noticed that none of the
boardfiles actually define a meaningful GPIO line for
this, but hey, it is converted.

Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Daniel Mack <daniel@zonque.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Stable-dep-of: 39fe0eac6d75 ("power: supply: wm97xx: Fix NULL pointer dereference in power_supply_changed()")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mach-pxa/mioa701.c           |  1 -
 arch/arm/mach-pxa/palm27x.c           |  1 -
 arch/arm/mach-pxa/palmte2.c           |  1 -
 drivers/power/supply/wm97xx_battery.c | 45 +++++++++++----------------
 include/linux/wm97xx.h                |  1 -
 5 files changed, 19 insertions(+), 30 deletions(-)

diff --git a/arch/arm/mach-pxa/mioa701.c b/arch/arm/mach-pxa/mioa701.c
index d3af80317f2da..a79f296e81e02 100644
--- a/arch/arm/mach-pxa/mioa701.c
+++ b/arch/arm/mach-pxa/mioa701.c
@@ -577,7 +577,6 @@ static struct platform_device power_dev = {
 static struct wm97xx_batt_pdata mioa701_battery_data = {
 	.batt_aux	= WM97XX_AUX_ID1,
 	.temp_aux	= -1,
-	.charge_gpio	= -1,
 	.min_voltage	= 0xc00,
 	.max_voltage	= 0xfc0,
 	.batt_tech	= POWER_SUPPLY_TECHNOLOGY_LION,
diff --git a/arch/arm/mach-pxa/palm27x.c b/arch/arm/mach-pxa/palm27x.c
index 0d246a1aebbcd..6230381a7ca0c 100644
--- a/arch/arm/mach-pxa/palm27x.c
+++ b/arch/arm/mach-pxa/palm27x.c
@@ -212,7 +212,6 @@ void __init palm27x_irda_init(int pwdn)
 static struct wm97xx_batt_pdata palm27x_batt_pdata = {
 	.batt_aux	= WM97XX_AUX_ID3,
 	.temp_aux	= WM97XX_AUX_ID2,
-	.charge_gpio	= -1,
 	.batt_mult	= 1000,
 	.batt_div	= 414,
 	.temp_mult	= 1,
diff --git a/arch/arm/mach-pxa/palmte2.c b/arch/arm/mach-pxa/palmte2.c
index e3bcf58b4e639..a2b10db4aacc4 100644
--- a/arch/arm/mach-pxa/palmte2.c
+++ b/arch/arm/mach-pxa/palmte2.c
@@ -273,7 +273,6 @@ static struct platform_device power_supply = {
 static struct wm97xx_batt_pdata palmte2_batt_pdata = {
 	.batt_aux	= WM97XX_AUX_ID3,
 	.temp_aux	= WM97XX_AUX_ID2,
-	.charge_gpio	= -1,
 	.max_voltage	= PALMTE2_BAT_MAX_VOLTAGE,
 	.min_voltage	= PALMTE2_BAT_MIN_VOLTAGE,
 	.batt_mult	= 1000,
diff --git a/drivers/power/supply/wm97xx_battery.c b/drivers/power/supply/wm97xx_battery.c
index 58f01659daa5f..a0e1eaa25d93e 100644
--- a/drivers/power/supply/wm97xx_battery.c
+++ b/drivers/power/supply/wm97xx_battery.c
@@ -15,11 +15,12 @@
 #include <linux/wm97xx.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 #include <linux/slab.h>
 
 static struct work_struct bat_work;
+static struct gpio_desc *charge_gpiod;
 static DEFINE_MUTEX(work_lock);
 static int bat_status = POWER_SUPPLY_STATUS_UNKNOWN;
 static enum power_supply_property *prop;
@@ -96,12 +97,11 @@ static void wm97xx_bat_external_power_changed(struct power_supply *bat_ps)
 static void wm97xx_bat_update(struct power_supply *bat_ps)
 {
 	int old_status = bat_status;
-	struct wm97xx_batt_pdata *pdata = power_supply_get_drvdata(bat_ps);
 
 	mutex_lock(&work_lock);
 
-	bat_status = (pdata->charge_gpio >= 0) ?
-			(gpio_get_value(pdata->charge_gpio) ?
+	bat_status = (charge_gpiod) ?
+			(gpiod_get_value(charge_gpiod) ?
 			POWER_SUPPLY_STATUS_DISCHARGING :
 			POWER_SUPPLY_STATUS_CHARGING) :
 			POWER_SUPPLY_STATUS_UNKNOWN;
@@ -171,18 +171,19 @@ static int wm97xx_bat_probe(struct platform_device *dev)
 	if (dev->id != -1)
 		return -EINVAL;
 
-	if (gpio_is_valid(pdata->charge_gpio)) {
-		ret = gpio_request(pdata->charge_gpio, "BATT CHRG");
-		if (ret)
-			goto err;
-		ret = gpio_direction_input(pdata->charge_gpio);
-		if (ret)
-			goto err2;
-		ret = request_irq(gpio_to_irq(pdata->charge_gpio),
+	charge_gpiod = devm_gpiod_get_optional(&dev->dev, NULL, GPIOD_IN);
+	if (IS_ERR(charge_gpiod))
+		return dev_err_probe(&dev->dev,
+				     PTR_ERR(charge_gpiod),
+				     "failed to get charge GPIO\n");
+	if (charge_gpiod) {
+		gpiod_set_consumer_name(charge_gpiod, "BATT CHRG");
+		ret = request_irq(gpiod_to_irq(charge_gpiod),
 				wm97xx_chrg_irq, 0,
 				"AC Detect", dev);
 		if (ret)
-			goto err2;
+			return dev_err_probe(&dev->dev, ret,
+					     "failed to request GPIO irq\n");
 		props++;	/* POWER_SUPPLY_PROP_STATUS */
 	}
 
@@ -204,7 +205,7 @@ static int wm97xx_bat_probe(struct platform_device *dev)
 	}
 
 	prop[i++] = POWER_SUPPLY_PROP_PRESENT;
-	if (pdata->charge_gpio >= 0)
+	if (charge_gpiod)
 		prop[i++] = POWER_SUPPLY_PROP_STATUS;
 	if (pdata->batt_tech >= 0)
 		prop[i++] = POWER_SUPPLY_PROP_TECHNOLOGY;
@@ -242,23 +243,15 @@ static int wm97xx_bat_probe(struct platform_device *dev)
 err4:
 	kfree(prop);
 err3:
-	if (gpio_is_valid(pdata->charge_gpio))
-		free_irq(gpio_to_irq(pdata->charge_gpio), dev);
-err2:
-	if (gpio_is_valid(pdata->charge_gpio))
-		gpio_free(pdata->charge_gpio);
-err:
+	if (charge_gpiod)
+		free_irq(gpiod_to_irq(charge_gpiod), dev);
 	return ret;
 }
 
 static int wm97xx_bat_remove(struct platform_device *dev)
 {
-	struct wm97xx_batt_pdata *pdata = dev->dev.platform_data;
-
-	if (pdata && gpio_is_valid(pdata->charge_gpio)) {
-		free_irq(gpio_to_irq(pdata->charge_gpio), dev);
-		gpio_free(pdata->charge_gpio);
-	}
+	if (charge_gpiod)
+		free_irq(gpiod_to_irq(charge_gpiod), dev);
 	cancel_work_sync(&bat_work);
 	power_supply_unregister(bat_psy);
 	kfree(prop);
diff --git a/include/linux/wm97xx.h b/include/linux/wm97xx.h
index 58e082dadc683..462854f4f286c 100644
--- a/include/linux/wm97xx.h
+++ b/include/linux/wm97xx.h
@@ -294,7 +294,6 @@ struct wm97xx {
 struct wm97xx_batt_pdata {
 	int	batt_aux;
 	int	temp_aux;
-	int	charge_gpio;
 	int	min_voltage;
 	int	max_voltage;
 	int	batt_div;
-- 
2.51.0


