Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B556FF8FA65
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 11:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pkrq8jNaXtigZ/55/sQ8fKpt1OCTdpcg/i/f47v0Bc4=; b=Ypq3I/6UWSDz1a5NumkmLd6+gG
	HRO+4yPx2/J23AslpWvr8qNGF927PpE31YuBqtXMO5T8ZTn82oMTcVB2arq+B+brhKevmNLeJd615
	R3WMzo3uwTJ1qjp+41HZMVRpHpQ9IFwBzxoDBfwEq6RJe30a9yvZNs6oKR0ijvwX1aNlBe49l0Loq
	JxBuuIs5/i3xilWNfCpI65uOOdtSyfaYbxRKygeBUmqj4PXl2bPjnLmB5RXLWXeymdzmvOeC9n5pP
	5emfGMLMgfFyoIFy9HoBD1++1z+Lg0R5UF7nuKZj2KuiNCSjLb4GFD0dZzkf4J+c1GG+tSfllaln/
	J0qlUyWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9cb-00000008XSg-3Myx;
	Tue, 21 Apr 2026 11:50:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9cV-00000008XNi-2DNa;
	Tue, 21 Apr 2026 11:50:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AAE536132E;
	Tue, 21 Apr 2026 11:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5862AC2BD01;
	Tue, 21 Apr 2026 11:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776772222;
	bh=Zbff+Q1NNBAuNma3SXEmyypcrouelh1AUI3L2B9B6fM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AKYPhc7CT6LfUtWcL0NNRE1pRke0WKyVgBHJkEI2O6VCCObOo/m4DS0Jq/P3J8i5F
	 D6b4RhKM09PD/Jn/s5vQF6CsHIoHJE3m5yaJapCjhz8k9bNxeHqWD2H67XJU3OVKqk
	 jWYszjL/SiqAJDSDakYqOu7/R/LhhpT5UdW9mq1k1WTK3elCW3Lkg7tEzfkD9ZkLnX
	 T20XgE5vMsAU7oggqit6tPNRRttqPW67v5WLSVIYedKiDPBT8KtU3oxtIgSj4Cr0su
	 AV1Du5nn3owRJtRNz9F03yvA6Qy3f4j5LJMJraTuPn6tP6J1KQlRWGBSGRY8tGUdCS
	 Kl4kRJZBHBtQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C24DF8FA66;
	Tue, 21 Apr 2026 11:50:22 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Tue, 21 Apr 2026 13:49:22 +0200
Subject: [PATCH v4 5/8] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-add-mcu-fan-khadas-vim4-v4-5-447114a28f2d@aliel.fr>
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3477;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=J2SoalosCyxImvGFu5R4J5FtFH7pMqPC3RBWKZVsADo=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ+bzlPLlTeIN0jP27FGsjaxbu/beu7K+5pfFMtzeS5esb
 b219ndnRykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjCRl6WMDBt+xtuUOOuxLRB0
 uJWp8ih64t/ADY+VX/c1Ndxv0rTba8fIcONI84OeJEONROnnYklVW/Qv2Oasb/9v5xy/djbXmzZ
 PVgA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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



