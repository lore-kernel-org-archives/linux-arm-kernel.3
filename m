Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BB9D72361
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Puv5oNZqLB4wAfJKKQOHYNLUVrHspWeFYFzRA8QbBT4=; b=LUCWIh8giYfY8pofOnjOKv5wrH
	kNTQmgIcjZ0KsWTGd+4qBpPS20QNDf4LULItx/FVmhn209fHPYD3O0H53D5Evb1++NerqLJLgbYEj
	ufIoYrosrBMJWStT8GRjajw8v7JdKu6eeCAdPywpsyXyMAo61Pk42S9Rt4oPU99t+/jGJeXoqOSH+
	uiIammVVd1JidS7lrpgHdoipkWWQu1GKLBz7VRx5HqJUEYT54lW+zdmRIVq0fWhB1gBysAVRtTXGV
	YfFHJ4GtHyt7VFbUFP2nJ/ib1FA6TYnqE+0RqjRg0UAAJyWoE0OqTUXCJEq2zrRfDO76mc6TgLcAD
	srGJPM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDRO-00000008Z27-2NHI;
	Fri, 23 Jan 2026 09:26:54 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDRB-00000008YsP-2epS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:26:42 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 Jan
 2026 17:26:27 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 Jan 2026 17:26:27 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 23 Jan 2026 17:26:29 +0800
Subject: [PATCH v2 4/6] gpio: aspeed-sgpio: Convert IRQ functions to use
 llops callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_sgpio-v2-4-69cfd1631400@aspeedtech.com>
References: <20260123-upstream_sgpio-v2-0-69cfd1631400@aspeedtech.com>
In-Reply-To: <20260123-upstream_sgpio-v2-0-69cfd1631400@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<bmc-sw@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769160386; l=3203;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=Hl9LdLVmaEDP86aDOaXmV5qwrfCQGY8Vf57r/K2vfGo=;
 b=K5o16m1x6dewUe7aGBZCQd8VhK7H5qvqCsuX/OtBs3wmUEm1li/l9HmMHp3sC1i6NAm2bdliC
 pd+fJU5ZViyAfNRcAtJ7kLlypsitiC5xTGENG39S2WcBt/1oECAdTz9
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_012641_682084_42FCE85C 
X-CRM114-Status: GOOD (  13.49  )
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

Update aspeed_sgpio_irq_handler() and aspeed_sgpio_setup_irqs() to use
the llops callbacks for register access instead of direct iowrite32().
This creates a unified hardware access layer, which is essential for
supporting SoCs with different register layouts like the AST2700.

Additionally, change the loop bounds to use ngpio instead of the static
ARRAY_SIZE(aspeed_sgpio_banks). This allows the driver to adapt to the
actual number of supported pins on the running SoC.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 33a830ea7d28..b5270e11b153 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -319,12 +319,13 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct aspeed_sgpio *data = gpiochip_get_data(gc);
-	unsigned int i, p;
+	unsigned int i, p, banks;
 	unsigned long reg;
 
 	chained_irq_enter(ic, desc);
 
-	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
+	banks = DIV_ROUND_UP(gc->ngpio, 64);
+	for (i = 0; i < banks; i++) {
 		reg = data->pdata->llops->reg_bank_get(data, i << 6, reg_irq_status);
 
 		for_each_set_bit(p, &reg, 32)
@@ -355,7 +356,6 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 				   struct platform_device *pdev)
 {
 	int rc, i;
-	const struct aspeed_sgpio_bank *bank;
 	struct gpio_irq_chip *irq;
 
 	rc = platform_get_irq(pdev, 0);
@@ -365,12 +365,11 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 	gpio->irq = rc;
 
 	/* Disable IRQ and clear Interrupt status registers for all SGPIO Pins. */
-	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
-		bank =  &aspeed_sgpio_banks[i];
+	for (i = 0; i < gpio->chip.ngpio; i += 2) {
 		/* disable irq enable bits */
-		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_enable));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_enable, 0);
 		/* clear status bits */
-		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_status));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_status, 1);
 	}
 
 	irq = &gpio->chip.irq;
@@ -384,14 +383,13 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 	irq->num_parents = 1;
 
 	/* Apply default IRQ settings */
-	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
-		bank =  &aspeed_sgpio_banks[i];
+	for (i = 0; i < gpio->chip.ngpio; i += 2) {
 		/* set falling or level-low irq */
-		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type0));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_type0, 0);
 		/* trigger type is edge */
-		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_type1, 0);
 		/* single edge trigger */
-		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type2));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_type2, 0);
 	}
 
 	return 0;

-- 
2.34.1


