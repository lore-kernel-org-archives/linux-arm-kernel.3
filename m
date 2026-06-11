Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A81CD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Vp9ej7slQue/aNRKaS0NajKMIkHAqH4RdtwsSI+9iY=; b=SypzfJTykLWQXzQnURPXDUTqD2
	R91T6H6AZBHeks8oE6+pXCehPjVK5f9taMp/0DPrk41IKlvm1q2b0ymWHKFfAI+3xasY8NA1AM0ux
	Mnc6TsqEjk5vWo93Bak8BdGqtLvOS7G3W/9ZLdYM1eY+JtCpJ9Zhhqq5ucgiUECOMJ0PO+4DA0OlE
	aO3dtlKR1enifuYyet7ENO33pk0T2ROR/0UmKqbayqs/18WHVVQmEPnUOUQxWrHhpYjgxIWG8lZ1I
	5b6zF/Yu2LqdWPwBu/KAV+gJL18LJfU0UbkC1ds6E5bJ6VfJ0li5QMVTOvT2wHjNfOvH4uhiFolCf
	GSVZHztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaFR-00000008uVN-3V9O;
	Thu, 11 Jun 2026 07:54:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaFP-00000008uTX-2whx;
	Thu, 11 Jun 2026 07:54:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 898764321B;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66AA7C2BCB8;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781164481;
	bh=Lk019Dztwyn/9Xt9I2lihcTIhugfoZ5LXTUNTOSl0XA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bIdFMKrVFIKOJofERwD8lXccS52amM1URc1hQvin3+H0tKQrzGtJb3sDKFtGx+aL7
	 smxmXjlkuVYiEGpj1SAIGr4NfiAZQerIaVC2AqyIMoB9XnTGO3629HAR8vuGibBjP0
	 w48xMaxrG9HwyODOkSXjE8tGXavK0qH1MUahOusG+YiHCb6j7O0q7tQC6b7aChnlh0
	 LKT8tB8IE6hXWbyvffqSsd9YjJbNi/UcYsPk/8ZY1vjAcXj58LozrT02oSfutQRKqf
	 N4K304b6du+SHK13JJTxXGlQjKDng2Pmn5OU1b4Zr5wx1KlnfPiDeERI4eyf2uey3c
	 i9+oIW70r0bmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50589CD98D4;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 11 Jun 2026 07:54:34 +0000
Subject: [PATCH RFC 2/2] pinctrl: meson: amlogic-a4: support gpiod_to_irq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-gpio-to-irq-v1-2-12201716f23f@amlogic.com>
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
In-Reply-To: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781164479; l=3292;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=wam4L3P2h/0NFdexAcbLeoEfUZ98TPeWasBAMHYVyak=;
 b=s65JzHoxnO5BzjEeGLbrqC0khJxXlE8BIifX49u9Y9PHSK4mRgDOh3fPDe/XP0mhHRyCgy3Zp
 5sEiMS4ywQNDGuHS8ziMDdXaacMr3Y7C2Mf8kNx3YDj5wdiSytG5hhT
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the to_irq() callback implementation so that
gpiod_to_irq() can map GPIO lines to IRQs correctly.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 54 ++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 5ae0c19d007d..663681887f35 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -10,6 +10,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -97,6 +98,8 @@ struct aml_gpio_bank {
 	struct regmap			*reg_gpio;
 	struct regmap			*reg_ds;
 	const struct multi_mux		*p_mux;
+	struct device_node		*of_irq;
+	u32				irq_start;
 };
 
 struct aml_pinctrl {
@@ -836,6 +839,32 @@ static int aml_pctl_parse_functions(struct device_node *np,
 	return 0;
 }
 
+static struct device_node *aml_get_of_irq(struct device_node *np)
+{
+	struct device_node *of_irq;
+
+	of_irq = of_irq_find_parent(np);
+	if (of_irq && of_device_is_compatible(of_irq, "amlogic,meson-gpio-intc")) {
+		of_node_put(of_irq);
+		return of_irq;
+	}
+
+	if (of_irq)
+		of_node_put(of_irq);
+
+	return NULL;
+}
+
+static u32 aml_bank_irq(struct device_node *np)
+{
+	u32 hw_irq;
+
+	if (of_property_read_u32(np, "hw-irq", &hw_irq))
+		return U32_MAX;
+
+	return hw_irq;
+}
+
 static u32 aml_bank_pins(struct device_node *np)
 {
 	struct of_phandle_args of_args;
@@ -1003,6 +1032,27 @@ static int aml_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return !!(val & BIT(bit));
 }
 
+static int aml_gpio_to_irq(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct aml_gpio_bank *bank = gpiochip_get_data(chip);
+	struct irq_fwspec fwspec;
+	int hwirq;
+
+	if (bank->irq_start == U32_MAX)
+		return -EINVAL;
+	if (!bank->of_irq)
+		return -EINVAL;
+
+	hwirq = gpio + bank->irq_start;
+
+	fwspec.fwnode = of_fwnode_handle(bank->of_irq);
+	fwspec.param_count = 2;
+	fwspec.param[0] = hwirq;
+	fwspec.param[1] = IRQ_TYPE_NONE;
+
+	return irq_create_fwspec_mapping(&fwspec);
+}
+
 static const struct gpio_chip aml_gpio_template = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
@@ -1012,6 +1062,7 @@ static const struct gpio_chip aml_gpio_template = {
 	.direction_input	= aml_gpio_direction_input,
 	.direction_output	= aml_gpio_direction_output,
 	.get_direction		= aml_gpio_get_direction,
+	.to_irq			= aml_gpio_to_irq,
 	.can_sleep		= true,
 };
 
@@ -1079,6 +1130,7 @@ static int aml_gpiolib_register_bank(struct aml_pinctrl *info,
 		bank->reg_ds = bank->reg_gpio;
 	}
 
+	bank->irq_start = aml_bank_irq(np);
 	bank->gpio_chip = aml_gpio_template;
 	bank->gpio_chip.base = -1;
 	bank->gpio_chip.ngpio = aml_bank_pins(np);
@@ -1154,6 +1206,8 @@ static int aml_pctl_probe_dt(struct platform_device *pdev,
 				pdesc->name = pin_names[j];
 				pdesc++;
 			}
+
+			info->banks[bank].of_irq = aml_get_of_irq(np);
 			bank++;
 		} else {
 			ret = aml_pctl_parse_functions(child, info,

-- 
2.52.0



