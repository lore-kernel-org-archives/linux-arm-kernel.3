Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21658E85371
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 16:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdZNe2Ig8V0faJo42NxK05AepE0JZL6S5awj/VsLWIE=; b=cxdwAZgpjMAKVOiWU2VUd8lql7
	TwzXUMdZbvqtAH3Ekbaf/yHrE3xFtkVJG1xXTbfhEqaRfb0wO7E60ZAYu8keVvhFWF84MBTzoPp83
	ejKLBC2Lop74GbNcCOro2Jl1RKgCo7G+roHvGkmQ44y7kRnSGt0TlOwYUHemJzEHRCi64Mh6SKzu9
	h72Klx4iG7lXX60L1WQE4W3cPJ5NkngJjk+Xk82Nx70z9PDl2fTCG7TZu/FJGnnR/rw7XXirrLH4J
	g/ye4gBhsiBO7CiEjfPWVBrKHtWfjzMXbqtt5wA4r34+NuflVm/MmG2oRRRSEACf4vGdxqOKdGSsL
	ADMCmDjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5O-00000002GBb-0f9m;
	Fri, 03 Apr 2026 16:09:30 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5J-00000002G6d-45iy;
	Fri, 03 Apr 2026 16:09:27 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775232560;
	bh=J2SoalosCyxImvGFu5R4J5FtFH7pMqPC3RBWKZVsADo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EUSknzW6QXDFBYi2M6ZqAl4SVbok284Y2Y48z/7aUBxPgf4Wpt3v5SPa+HbN7rpAL
	 WLGiXGrBZ6X60yVoUYMxcDSv7r2UdRJMBp69j74ROe1H5U2LKzKOLdGzrlQcwXe0DL
	 c+A9m97tM5uv7aU3VCXXjAr06SfFnq444i9f2uco=
Date: Fri, 03 Apr 2026 18:08:38 +0200
Subject: [PATCH v2 5/8] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-add-mcu-fan-khadas-vim4-v2-5-70536b22439a@aliel.fr>
References: <20260403-add-mcu-fan-khadas-vim4-v2-0-70536b22439a@aliel.fr>
In-Reply-To: <20260403-add-mcu-fan-khadas-vim4-v2-0-70536b22439a@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1775232552; l=3477;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=J2SoalosCyxImvGFu5R4J5FtFH7pMqPC3RBWKZVsADo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEFj0nfFG83jnBBd60nayCy9VVofB4EIdNwOIGL1JZxdO4sU2taPxbmzNMnLl+Iy7VzNGFGRYEq
 v3kniuehwGQI=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_090926_335746_9F40D37B 
X-CRM114-Status: GOOD (  16.25  )
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

Replace the hardcoded MAX_LEVEL constant and fan register
with values read from platform_data (fan_reg, max_level),
as new MCUs need different values.

Optionally acquire and enable a "fan" regulator supply
at probe time and on resume,
so boards that gate fan power through a regulator are handled.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/thermal/khadas_mcu_fan.c | 49 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
index d35e5313bea41..24559bf65de46 100644
--- a/drivers/thermal/khadas_mcu_fan.c
+++ b/drivers/thermal/khadas_mcu_fan.c
@@ -13,13 +13,15 @@
 #include <linux/regmap.h>
 #include <linux/sysfs.h>
 #include <linux/thermal.h>
-
-#define MAX_LEVEL 3
+#include <linux/regulator/consumer.h>
 
 struct khadas_mcu_fan_ctx {
 	struct khadas_mcu *mcu;
+	unsigned int fan_reg;
 	unsigned int level;
+	unsigned int max_level;
 	struct thermal_cooling_device *cdev;
+	struct regulator *power;
 };
 
 static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
@@ -27,8 +29,7 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
 {
 	int ret;
 
-	ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
-			   level);
+	ret = regmap_write(ctx->mcu->regmap, ctx->fan_reg, level);
 	if (ret)
 		return ret;
 
@@ -40,7 +41,9 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
 static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
 					unsigned long *state)
 {
-	*state = MAX_LEVEL;
+	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
+
+	*state = ctx->max_level;
 
 	return 0;
 }
@@ -61,7 +64,7 @@ khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
 {
 	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
 
-	if (state > MAX_LEVEL)
+	if (state > ctx->max_level)
 		return -EINVAL;
 
 	if (state == ctx->level)
@@ -83,11 +86,32 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct khadas_mcu_fan_ctx *ctx;
 	int ret;
+	const struct khadas_mcu_fan_pdata *pdata = dev_get_platdata(&pdev->dev);
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
+
 	ctx->mcu = mcu;
+	ctx->fan_reg   = pdata->fan_reg;
+	ctx->max_level = pdata->max_level;
+
+	ctx->power = devm_regulator_get_optional(dev->parent, "fan");
+	if (IS_ERR(ctx->power)) {
+		if (PTR_ERR(ctx->power) == -ENODEV)
+			ctx->power = NULL;
+		else
+			return PTR_ERR(ctx->power);
+	}
+
+	if (ctx->power) {
+		ret = regulator_enable(ctx->power);
+		if (ret) {
+			dev_err(dev, "Failed to enable fan power supply: %d\n", ret);
+			return ret;
+		}
+	}
+
 	platform_set_drvdata(pdev, ctx);
 
 	cdev = devm_thermal_of_cooling_device_register(dev->parent,
@@ -124,12 +148,25 @@ static int khadas_mcu_fan_suspend(struct device *dev)
 
 	ctx->level = level_save;
 
+	if (ctx->power) {
+		ret = regulator_disable(ctx->power);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
 static int khadas_mcu_fan_resume(struct device *dev)
 {
 	struct khadas_mcu_fan_ctx *ctx = dev_get_drvdata(dev);
+	int ret;
+
+	if (ctx->power) {
+		ret = regulator_enable(ctx->power);
+		if (ret)
+			return ret;
+	}
 
 	return khadas_mcu_fan_set_level(ctx, ctx->level);
 }

-- 
2.49.0


