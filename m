Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C17CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DhskNj1V9H2E2CaccYIYFRemuYJAKHjFWxdM08TW20=; b=N0LWOh4sP1R+SzSIf1I2hA/rFO
	dVoM8LIg0qMWekTyFBkBBhGH3I7SVAgokxtnQgwpA+YiEIVDnPN3a4egTcLRH70Wj4VRCKC6z6KR5
	xQH1+soE/kq1IKy3ecsnOl9byfCFP8pWaAk5u3+zcVJxEoMTy8xScFmirO4IV232QNaO3uQ4lciNs
	T5aaw8VYO4WiIFzktsiGT+9IBeKWOrjWIXqexNbz5gKj/LReX2m01ap8tX+LHoLxcfwtkfGN34NHH
	yWpYVo+oIo8XihdviRAe8+jrAX295OH6eU8t0GEM7I7fyCU8UBjy3CJ2Lq/TDvWyD2pDy3059O6Bk
	8k6JK3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymNe-0000000AQnQ-2sdo;
	Wed, 17 Sep 2025 07:15:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymNa-0000000AQkF-3HxM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:15:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 273D241925;
	Wed, 17 Sep 2025 07:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5E3C4CEFC;
	Wed, 17 Sep 2025 07:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758093302;
	bh=Sd9OX7cLVBw3ifGFhl2zDm5dTNzLv+EJ603kV1lQF6U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JOzp4bCODK1LOa1CeTz/28NtDBh5+qqOEO22zPpaEY0Kj9FqR68fU2Fkx7BEH9Nwn
	 DlXKMGx1WNEonEtcEEaVc1DnZj+CNW96GB1KiJBF4UO6YDuYt/bqRirsrIYfCQozlW
	 npUl4GjvmiOg1MOoBCgKlnKBJrzhwPrjib2PQXoUKg5eCB0PU7qwhCClgcRPe6pP7E
	 SjAUIQvB73xVcN79StBv59g6mOxwUxW3tLagVt2d8rh0+4Jdi48y4zeo3kq4XBERoo
	 DKBZ/QVLcY86WuAmSrk7BMMvRg9Zzf0R3IYx270LRM3/UpCLewUoTbOB/SOqPW5iL+
	 dDuVa/SSvon3A==
From: Andreas Kemnade <akemnade@kernel.org>
Date: Wed, 17 Sep 2025 09:14:30 +0200
Subject: [PATCH v3 2/3] regulator: sy7636a: add gpios and input regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-sy7636-rsrc-v3-2-331237d507a2@kernel.org>
References: <20250917-sy7636-rsrc-v3-0-331237d507a2@kernel.org>
In-Reply-To: <20250917-sy7636-rsrc-v3-0-331237d507a2@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <akemnade@kernel.org>, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=2188; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=Sd9OX7cLVBw3ifGFhl2zDm5dTNzLv+EJ603kV1lQF6U=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDBmn4l+etTI412eSuHGTT5H/cuflrlwTT3bdSxCcIPvi2
 /kV78Kud5SyMIhxMciKKbL8slZw+6TyLDd4aoQ9zBxWJpAhDFycAjCR5jCGv+IfpolPcv2Ynaqx
 hTEx5qnBRabLlUr/kvSXJ0q6M++2PcfI8PNg82x37cpLr2c2ul13CJ8bOF+t+831+sUzJrfK9q1
 dzgwA
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_001502_879857_52BC05EB 
X-CRM114-Status: GOOD (  14.55  )
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

Initialize input regulator and gpios to proper values to have things
basically working as well as in the case when these things are
hardwired.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
---
 drivers/regulator/sy7636a-regulator.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index 27e3d939b7bb9..551647bc10520 100644
--- a/drivers/regulator/sy7636a-regulator.c
+++ b/drivers/regulator/sy7636a-regulator.c
@@ -12,6 +12,7 @@
 #include <linux/mfd/sy7636a.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/regmap.h>
@@ -19,6 +20,8 @@
 struct sy7636a_data {
 	struct regmap *regmap;
 	struct gpio_desc *pgood_gpio;
+	struct gpio_desc *en_gpio;
+	struct gpio_desc *vcom_en_gpio;
 };
 
 static int sy7636a_get_vcom_voltage_op(struct regulator_dev *rdev)
@@ -98,6 +101,30 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
 	data->regmap = regmap;
 	data->pgood_gpio = gdp;
 
+	ret = devm_regulator_get_enable_optional(&pdev->dev, "vin");
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to get vin regulator\n");
+
+	data->en_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(data->en_gpio))
+		return dev_err_probe(&pdev->dev,
+				     PTR_ERR(data->en_gpio),
+				     "failed to get en gpio\n");
+
+	/* Let VCOM just follow the default power on sequence */
+	data->vcom_en_gpio = devm_gpiod_get_optional(&pdev->dev,
+						     "vcom-en", GPIOD_OUT_LOW);
+	if (IS_ERR(data->vcom_en_gpio))
+		return dev_err_probe(&pdev->dev,
+				     PTR_ERR(data->vcom_en_gpio),
+				     "failed to get vcom-en gpio\n");
+
+	/* if chip was not enabled, give it time to wake up */
+	if (data->en_gpio)
+		usleep_range(2500, 4000);
+
 	platform_set_drvdata(pdev, data);
 
 	ret = regmap_write(regmap, SY7636A_REG_POWER_ON_DELAY_TIME, 0x0);

-- 
2.47.3


