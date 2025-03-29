Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DBEC36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 18:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=akVyMKQyCxWZ3yLiQHM8pT2PU+T/9mwnNjkwN1GvFNU=; b=fzX827PWNeUqOvAwjATfZkfb7y
	SVaECiqxqsgoFgbcUF359mKMhJd6hBAOCrWIewzkz/lJs+725G62dEjQZafMsQgw0n90J1JGCqKHs
	tBOwYch//BnHrieEMFzfo1JmQQVcpQkf6Vqb0R9CBNb5BasEDK0HXbIjSNA8TtZkTCxWSGTqZf8L4
	9W5pvHvQTsZ1+rT7gUzVcjty4d+olgIOevb5PtyU+KlkhdxHdzo7IsHUaQcVXPSMLeO1U+cu3M3oQ
	ze7A0hdFZ4wtUNPfJC5bGFxkVHMxxTIcQUEz8xql3jxGHPR+W9sjFu0edqoj0b6sZ79oei0EQcf88
	XD7Wl8/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyak8-0000000FO4G-0PpK;
	Sat, 29 Mar 2025 18:17:16 +0000
Received: from 3.mo575.mail-out.ovh.net ([46.105.58.60])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyaiM-0000000FO0i-3tZq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 18:15:29 +0000
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.140.73])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4ZQ5Cj1gtwz1qht
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Mar 2025 18:15:13 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-bnbm7 (unknown [10.111.182.49])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9C73E1FE64;
	Sat, 29 Mar 2025 18:15:10 +0000 (UTC)
Received: from labcsmart.com ([37.59.142.99])
	by ghost-submission-5b5ff79f4f-bnbm7 with ESMTPSA
	id lXD9Eq446GegAwAAx023iw
	(envelope-from <john.madieu@labcsmart.com>); Sat, 29 Mar 2025 18:15:10 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-99G00370defa65-2e12-46e3-a76d-ab6dc0455f8d,
                    1AA15D79FD1645C8296C06E669C502FD88205396) smtp.auth=john.madieu@labcsmart.com
X-OVh-ClientIp: 141.94.163.193
From: John Madieu <john.madieu@labcsmart.com>
To: sven@svenpeter.dev,
	j@jannau.net,
	linus.walleij@linaro.org
Cc: alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	john.madieu@gmail.com,
	John Madieu <john.madieu@labcsmart.com>
Subject: [PATCH] pinctrl: apple: Make regmap_config static const and fix indentation
Date: Sat, 29 Mar 2025 18:15:06 +0000
Message-Id: <20250329181506.890043-1-john.madieu@labcsmart.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4085046338809924234
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeegkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflohhhnhcuofgrughivghuuceojhhohhhnrdhmrgguihgvuheslhgrsggtshhmrghrthdrtghomheqnecuggftrfgrthhtvghrnhepgeegteetieettdffleeludeliedvueeuuefhveffhfehtdehiefhfefflefguddvnecukfhppeduvdejrddtrddtrddupddugedurdelgedrudeifedrudelfedpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehjohhhnhdrmhgrughivghusehlrggstghsmhgrrhhtrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehjeehmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=akVyMKQyCxWZ3yLiQHM8pT2PU+T/9mwnNjkwN1GvFNU=;
 c=relaxed/relaxed; d=labcsmart.com; h=From; s=ovhmo4089092-selector1;
 t=1743272113; v=1;
 b=T0Vm1s/Vrkc1RsJQHrYki+Vr3ubVgaOhtDZs744k67Osex0cxMGi6iFlHHwWn/vqtIKTC93P
 e1VZxhXuFjq2tNtU8IkyAFaJdFJqmVsbUEGGyq9CTzs03Pkkr+6CVnfiJd3EHQVvA3sJIiWQp8G
 z3H/BNoJUOQ1Gq4qJcrHfL8gCaKqQJHnfybZLKx838mt49Bg+CXmbWEekOhzvM6HqxbKewphJAD
 JbpI7fIyADsh+2pmzFirD+dT7wEj6CYcVwUymZ9XlRDevENOV7a5hZsVYxGPgdPZSGmCzgLLnwj
 42HRqU1sPKlyqcFxY20HYqEYS7B1wY+6abjC+mwJEB5sg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_111528_079531_76013FDF 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Mark the regmap_config as static const since it is only used in this file
and never modified, allowing the compiler to optimize it and enforce
const-correctness.

Also fix minor indentation inconsistencies in function parameter alignment
to conform with kernel coding style.

Signed-off-by: John Madieu <john.madieu@labcsmart.com>
---
Most changes replace space indentation with tabs.

 drivers/pinctrl/pinctrl-apple-gpio.c | 30 ++++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index f861e63f4115..0f551d67d482 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -66,7 +66,7 @@ struct apple_gpio_pinctrl {
 #define REG_GPIOx_DRIVE_STRENGTH1 GENMASK(23, 22)
 #define REG_IRQ(g, x)        (0x800 + 0x40 * (g) + 4 * ((x) >> 5))
 
-struct regmap_config regmap_config = {
+static const struct regmap_config regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
@@ -79,13 +79,13 @@ struct regmap_config regmap_config = {
 
 /* No locking needed to mask/unmask IRQs as the interrupt mode is per pin-register. */
 static void apple_gpio_set_reg(struct apple_gpio_pinctrl *pctl,
-                               unsigned int pin, u32 mask, u32 value)
+			       unsigned int pin, u32 mask, u32 value)
 {
 	regmap_update_bits(pctl->map, REG_GPIO(pin), mask, value);
 }
 
 static u32 apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
-                              unsigned int pin)
+			      unsigned int pin)
 {
 	int ret;
 	u32 val;
@@ -100,9 +100,9 @@ static u32 apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
 /* Pin controller functions */
 
 static int apple_gpio_dt_node_to_map(struct pinctrl_dev *pctldev,
-                                     struct device_node *node,
-                                     struct pinctrl_map **map,
-                                     unsigned *num_maps)
+				     struct device_node *node,
+				     struct pinctrl_map **map,
+				     unsigned *num_maps)
 {
 	unsigned reserved_maps;
 	struct apple_gpio_pinctrl *pctl;
@@ -147,8 +147,8 @@ static int apple_gpio_dt_node_to_map(struct pinctrl_dev *pctldev,
 		group_name = pinctrl_generic_get_group_name(pctldev, pin);
 		function_name = pinmux_generic_get_function_name(pctl->pctldev, func);
 		ret = pinctrl_utils_add_map_mux(pctl->pctldev, map,
-		                                &reserved_maps, num_maps,
-		                                group_name, function_name);
+						&reserved_maps, num_maps,
+						group_name, function_name);
 		if (ret)
 			goto free_map;
 	}
@@ -171,7 +171,7 @@ static const struct pinctrl_ops apple_gpio_pinctrl_ops = {
 /* Pin multiplexer functions */
 
 static int apple_gpio_pinmux_set(struct pinctrl_dev *pctldev, unsigned func,
-                                 unsigned group)
+				 unsigned group)
 {
 	struct apple_gpio_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 
@@ -237,7 +237,7 @@ static int apple_gpio_direction_input(struct gpio_chip *chip, unsigned int offse
 }
 
 static int apple_gpio_direction_output(struct gpio_chip *chip,
-                                       unsigned int offset, int value)
+				       unsigned int offset, int value)
 {
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
 
@@ -282,7 +282,7 @@ static void apple_gpio_irq_mask(struct irq_data *data)
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(gc);
 
 	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
-	                   FIELD_PREP(REG_GPIOx_MODE, REG_GPIOx_IN_IRQ_OFF));
+			   FIELD_PREP(REG_GPIOx_MODE, REG_GPIOx_IN_IRQ_OFF));
 	gpiochip_disable_irq(gc, data->hwirq);
 }
 
@@ -294,7 +294,7 @@ static void apple_gpio_irq_unmask(struct irq_data *data)
 
 	gpiochip_enable_irq(gc, data->hwirq);
 	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
-	                   FIELD_PREP(REG_GPIOx_MODE, irqtype));
+			   FIELD_PREP(REG_GPIOx_MODE, irqtype));
 }
 
 static unsigned int apple_gpio_irq_startup(struct irq_data *data)
@@ -303,7 +303,7 @@ static unsigned int apple_gpio_irq_startup(struct irq_data *data)
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
 
 	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_GRP,
-	                   FIELD_PREP(REG_GPIOx_GRP, 0));
+			   FIELD_PREP(REG_GPIOx_GRP, 0));
 
 	apple_gpio_direction_input(chip, data->hwirq);
 	apple_gpio_irq_unmask(data);
@@ -320,7 +320,7 @@ static int apple_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 		return -EINVAL;
 
 	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE,
-	                   FIELD_PREP(REG_GPIOx_MODE, irqtype));
+			   FIELD_PREP(REG_GPIOx_MODE, irqtype));
 
 	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(data, handle_level_irq);
@@ -429,7 +429,7 @@ static int apple_gpio_pinctrl_probe(struct platform_device *pdev)
 	unsigned int npins;
 	const char **pin_names;
 	unsigned int *pin_nums;
-	static const char* pinmux_functions[] = {
+	static const char *pinmux_functions[] = {
 		"gpio", "periph1", "periph2", "periph3"
 	};
 	unsigned int i, nirqs = 0;
-- 
2.25.1


