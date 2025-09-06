Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A02CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 09:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5r7laUgK6UaSZduibPms9snwduks49CsbJNlWcZQvtQ=; b=O4bMQPDSgH8yfLTRhWKEDZzlZE
	RVMt7fyXqXGLcQNi6p2rmtiBTVe6KYlt76QOKx4kq5KzkItzlpJ8ao1M8RHCFgGTW8LnVD9X+3Gjs
	aL+GvGXThz6kP2FOcwCmhsalfglXUNDNbzRky18dJC2Qp1hwaW7UzJLCCv7ck2mFonjX67nEi5Six
	WCjUmAx8omZOD6tLMJbmxllsGTYlacdnK16Q4BGux1XL1RvoHK6vmgF3chjDUxwhMFHEQ5e7xsma1
	GBG4CYZm7ecRzWMyobFkNl/aw6zzXJ+EXv4SBm5vBJDv+ZyCC41YxyWJPHDT7q/JVlUkxvbP+1+r5
	rT/lY+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uup75-00000007K70-2ur8;
	Sat, 06 Sep 2025 09:21:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuovv-00000007HSh-0fUx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 09:10:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E482245134;
	Sat,  6 Sep 2025 09:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8212C4CEF9;
	Sat,  6 Sep 2025 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757149806;
	bh=msEvFUeisbWsJc6bi1by+MeXaWzZWt4ywptS+2LY1cc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kkkU5gVqUfZJcXEKrsU0vjRRCs93ObZOOdvb/2Ir4sweO4xVcDHaK1+85a3Bi/F1p
	 HD0DCKCVdacG0LnIM6+pWq/HEuUFJ02yNpqdbXN/YfPZ9dB3a1RK0DhZDpeUAY1+mv
	 qrTyb8fnycaXtj70UNPpqRVaQQu+W4f7W+g64bdFO6AaR+j64tl5lAKw52i/djKgVl
	 EOMM/oJctUiG4PAKkxndQA4lYf6gvHKmbjyNg1kFUt4Yq6/QMQJ0c+nPqWlyge0OEv
	 8r+AdES5UDDCVpug/WIocnhY23vXngjbQbbS2oHpHrMlf4AakQtr610B8QmIyErYxN
	 8eqfesb7JoKZA==
From: Andreas Kemnade <akemnade@kernel.org>
Date: Sat, 06 Sep 2025 11:09:14 +0200
Subject: [PATCH 3/4] regulator: sy7636a: add gpios and input regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-sy7636-rsrc-v1-3-e2886a9763a7@kernel.org>
References: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
In-Reply-To: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=2073; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=msEvFUeisbWsJc6bi1by+MeXaWzZWt4ywptS+2LY1cc=;
 b=owGbwMvMwCEm/rzkS6lq2x3G02pJDBm7fwUuqNWOnBQgvK/Jrv5Vprr5Mb7sDzIy3y69lQ6zt
 p36PuNrRykLgxgHg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABMRfMDw32399+sOxpUN+0IX
 Z6+3XSA/pUEuwz14pat2fg7X7Jzycwz/I240bth+Zet+t/0byvhjkp+IajZbXpRljlA5fSws9eI
 LHgA=
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_021007_242665_CA7CFAD6 
X-CRM114-Status: GOOD (  13.40  )
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

Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
---
 drivers/regulator/sy7636a-regulator.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index 27e3d939b7bb9..bd8739624c727 100644
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
@@ -98,6 +101,29 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
 	data->regmap = regmap;
 	data->pgood_gpio = gdp;
 
+	ret = devm_regulator_get_enable_optional(&pdev->dev, "vin");
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to get vin regulator\n");
+
+	data->en_gpio = devm_gpiod_get_optional(&pdev->dev, "en",
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
+				     PTR_ERR(data->en_gpio),
+				     "failed to get en gpio\n");
+
+	if (data->en_gpio)
+		usleep_range(2500, 4000);
+
 	platform_set_drvdata(pdev, data);
 
 	ret = regmap_write(regmap, SY7636A_REG_POWER_ON_DELAY_TIME, 0x0);

-- 
2.39.5


