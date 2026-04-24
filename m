Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C93FED3D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HtsKnJimkvSDq27zxzOBcts8EWGa0Icm0zDH9uj2wY=; b=A02xeVaI3G7eb18LQzJnFdOpan
	gmoyMP9VJZ2oMotx6sZN0ay7eimmY8kcW2TFEc9ni8mXRbEyjdWitZVmMiz8AIbna6akW2Nq/cFp2
	qN+oefJ2pTDEcHDDDxpYCBJnxFjSh0EOT/MAJsas+W3D/T91Old21H7ScE39uKnUXjr1bIxSvH6f0
	geqOTFt9IRSqHJu0RUJ9tvuO54c8Zd0/T/2oFKAsA3cEl9QtYOUIwJUAjSN5pkKdq/FTKibTSBqxu
	d18h48musJvT8ZC35dDqCLo45ysV9kNMtmHWawwgMCIFnoWUoDN62vD6TDYmy7baUL71BOVpWkTHz
	UNUEDapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHOF-0000000DJEN-0w3C;
	Fri, 24 Apr 2026 14:20:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHO7-0000000DJ5D-0uqz;
	Fri, 24 Apr 2026 14:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F06744703;
	Fri, 24 Apr 2026 14:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2987AC2BCFB;
	Fri, 24 Apr 2026 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777040410;
	bh=d9NCTi+Rcq2wKZJ9kEiQHUc4L2hpQSLttTrOJrWTet4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oLhw+15VW4xV0seFJuMjgOu+CAsE+QCt7gTwxnzIKtGS875pTmDzUbwccsJ06k88P
	 aZHeXbmoTW3XiRPfYo8JS8rQyoOIbc08QqN9rLtq3UKRLIO4YSy+gpNHB6H2lsJUKF
	 jNZ20l3d6F5hzV+sxfwfMRObSaId17VQQOG7sOMs2VAwumkTGrzSjgcraOJbp1tzSC
	 tlurH+fHtwWOnharzpsifICH/SCW5e58a0s0tU08S0Iz4flPXgmJjC19exLPNAf9+/
	 TCLIUSqtYyJqTvh0iZ/EsqwLQ5nFiAEL/ExcVI1P+zZFjge4g/Ye8J6yfQoEdUcwTK
	 1G2JI4SwQ0L9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FECEFED3CC;
	Fri, 24 Apr 2026 14:20:10 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 24 Apr 2026 16:17:36 +0200
Subject: [PATCH v5 5/8] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-add-mcu-fan-khadas-vim4-v5-5-afcfa7157b23@aliel.fr>
References: <20260424-add-mcu-fan-khadas-vim4-v5-0-afcfa7157b23@aliel.fr>
In-Reply-To: <20260424-add-mcu-fan-khadas-vim4-v5-0-afcfa7157b23@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3485;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=JiLx8eTR6rFqMVIEqmUsuF0zE3OLjg1JbYglE13jrOs=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ+brGmH/3WXGDQXLVWaV9MybvSOcr8ijfqPb1/bVEy1rN
 ze/uF/VUcrCIMbFICumyNI/1/LEu8tHz3zdo54CM4eVCWQIAxenAExkRSojw7bVGryrM0pmf2hY
 +uJN0rtHS6byK7DtT03K/dCiFrne3JPhn0rJU1XTo+KfVTUCMr7JnssuzUl+2RzjWBcb0XVXZac
 UMwA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_072011_304656_921EFDD7 
X-CRM114-Status: GOOD (  16.00  )
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Replace the hardcoded MAX_LEVEL constant and fan register
with values read from platform_data (fan_reg, max_level),
as new MCUs need different values.

Optionally acquire and enable a "fan" regulator supply
at probe time and on resume,
so boards that gate fan power through a regulator are handled.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/thermal/khadas_mcu_fan.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
index d35e5313bea41..5603fa099a858 100644
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
@@ -78,6 +81,7 @@ static const struct thermal_cooling_device_ops khadas_mcu_fan_cooling_ops = {
 
 static int khadas_mcu_fan_probe(struct platform_device *pdev)
 {
+	const struct khadas_mcu_fan_pdata *pdata = dev_get_platdata(&pdev->dev);
 	struct khadas_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
 	struct thermal_cooling_device *cdev;
 	struct device *dev = &pdev->dev;
@@ -87,7 +91,21 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
+
 	ctx->mcu = mcu;
+	ctx->fan_reg   = pdata->fan_reg;
+	ctx->max_level = pdata->max_level;
+
+	ctx->power = devm_regulator_get(dev->parent, "fan");
+	if (IS_ERR(ctx->power))
+		return PTR_ERR(ctx->power);
+
+	ret = regulator_enable(ctx->power);
+	if (ret) {
+		dev_err(dev, "Failed to enable fan power supply: %d\n", ret);
+		return ret;
+	}
+
 	platform_set_drvdata(pdev, ctx);
 
 	cdev = devm_thermal_of_cooling_device_register(dev->parent,
@@ -124,12 +142,17 @@ static int khadas_mcu_fan_suspend(struct device *dev)
 
 	ctx->level = level_save;
 
-	return 0;
+	return regulator_disable(ctx->power);
 }
 
 static int khadas_mcu_fan_resume(struct device *dev)
 {
 	struct khadas_mcu_fan_ctx *ctx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_enable(ctx->power);
+	if (ret)
+		return ret;
 
 	return khadas_mcu_fan_set_level(ctx, ctx->level);
 }

-- 
2.49.0



