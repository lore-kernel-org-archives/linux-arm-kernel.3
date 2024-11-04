Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27775D1BDE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wNmoGpdqBnF8xbpJClvTxdZE+jErMdkV1eCey4FiIno=; b=uLyHZOjpQWe5WSNCoai3dX9ieO
	kmM4YEF0gDQPkVbdwDdtNRjOlm08y7gRQHdJZrm4GckZruRy7+bCpEylqmjPZdoVO1/kJrnwtNVsH
	NXjBpe1SofC+RaRpkvCeLkMed/QngJXL8ryKUWmMakeSm50C2wXq7sh1vc9/Bvfl0t5slu3JSYIXs
	/h2fIZAKeF6FtoxM3CRSMSkNs5R+YUDvluBEW1QXnglv0CT/sDlAJuq8qJ/molJDHVKMYKDR7sdI3
	EA/uKmmPkq5rJwZ6E/XDqUigg+h9FFHgmWKffGTag5dP6hkfgmvB0HN7GoNrbmZFVpE5Vn7v/Wty5
	IjBiZSOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t832D-0000000EwnX-2mvg;
	Mon, 04 Nov 2024 19:46:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t830V-0000000Ewf6-2RMA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 19:45:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F9F95C5036;
	Mon,  4 Nov 2024 19:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC41C4CECE;
	Mon,  4 Nov 2024 19:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730749498;
	bh=F5TDY0edd5TOHVsa9nkfCI0QHkRWt0Z3g03kUM0+sNk=;
	h=From:To:Cc:Subject:Date:From;
	b=RLz5OuVkuX++yabdrw8OTb4uivH8QsfN8MtSBZHD/UmXGolQzm9oaF8mAWREN1ReF
	 lUavWhmSllSFtUf4kUiA7qITxyI8NWuN6Zv3yr5Kf/xYa3heQv+yQ5zy/NItKasbWo
	 caJ7EaHbaemuliRdYu9yYe1la2ev1lpOZaeaE8NCVbFEdVRR2sPT6Qaicv6R5yjtfa
	 tTuemsKzoUBFNenXGj1oCHY64MS7sddDZQD1E4tdBsEKzui8MvxFH8XG2EYMBrQD5l
	 YAjNIXGifj9fCvvlle477Iabq93ni1tZzQzLJUzeG9J2lCU7bFXFbBsxOcCDTR9xlg
	 gSc0e7Oh6IVSQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] pinctrl: Use of_property_present() for non-boolean properties
Date: Mon,  4 Nov 2024 13:44:36 -0600
Message-ID: <20241104194437.327430-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_114459_731667_459F2708 
X-CRM114-Status: GOOD (  13.01  )
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

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c  | 6 +++---
 drivers/pinctrl/pinctrl-xway.c           | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c       | 2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index d05c2c478e79..842a1e6cbfc4 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -633,11 +633,11 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 static bool imx_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
 	for_each_child_of_node_scoped(np, function_np) {
-		if (of_property_read_bool(function_np, "fsl,pins"))
+		if (of_property_present(function_np, "fsl,pins"))
 			return true;
 
 		for_each_child_of_node_scoped(function_np, pinctrl_np) {
-			if (of_property_read_bool(pinctrl_np, "fsl,pins"))
+			if (of_property_present(pinctrl_np, "fsl,pins"))
 				return false;
 		}
 	}
@@ -746,7 +746,7 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 		if (IS_ERR(ipctl->base))
 			return PTR_ERR(ipctl->base);
 
-		if (of_property_read_bool(dev_np, "fsl,input-sel")) {
+		if (of_property_present(dev_np, "fsl,input-sel")) {
 			np = of_parse_phandle(dev_np, "fsl,input-sel", 0);
 			if (!np) {
 				dev_err(&pdev->dev, "iomuxc fsl,input-sel property not found\n");
diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index f4256a918165..48f8aabf3bfa 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1524,7 +1524,7 @@ static int pinmux_xway_probe(struct platform_device *pdev)
 	 * files which don't set the "gpio-ranges" property or systems that
 	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
 	 */
-	if (!of_property_read_bool(pdev->dev.of_node, "gpio-ranges")) {
+	if (!of_property_present(pdev->dev.of_node, "gpio-ranges")) {
 		/* finish with registering the gpio range in pinctrl */
 		xway_gpio_range.npins = xway_chip.ngpio;
 		xway_gpio_range.base = xway_chip.base;
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index aeaf0d1958f5..ec913c2e200f 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1457,7 +1457,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	 * files which don't set the "gpio-ranges" property or systems that
 	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
 	 */
-	if (!of_property_read_bool(pctrl->dev->of_node, "gpio-ranges")) {
+	if (!of_property_present(pctrl->dev->of_node, "gpio-ranges")) {
 		ret = gpiochip_add_pin_range(&pctrl->chip,
 			dev_name(pctrl->dev), 0, 0, chip->ngpio);
 		if (ret) {
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index d2dd66769aa8..33384f52f55a 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1169,7 +1169,7 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	 * files which don't set the "gpio-ranges" property or systems that
 	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
 	 */
-	if (!of_property_read_bool(dev->of_node, "gpio-ranges")) {
+	if (!of_property_present(dev->of_node, "gpio-ranges")) {
 		ret = gpiochip_add_pin_range(&state->chip, dev_name(dev), 0, 0,
 					     npins);
 		if (ret) {
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index 9cd5247ea574..87301a2445ac 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -832,7 +832,7 @@ static int pm8xxx_gpio_probe(struct platform_device *pdev)
 	 * files which don't set the "gpio-ranges" property or systems that
 	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
 	 */
-	if (!of_property_read_bool(pctrl->dev->of_node, "gpio-ranges")) {
+	if (!of_property_present(pctrl->dev->of_node, "gpio-ranges")) {
 		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
 					     0, 0, pctrl->chip.ngpio);
 		if (ret) {
-- 
2.45.2


