Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85348C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 08:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFf2CKyrX5PvFA1sBmKNvNeKTbHEPhDIhjGCFWVdfYE=; b=zKepvVSFuswuKtVFkL5oRUlS2q
	KH3vaaVRVNT08x4c9boRC5YjybjDnNvxJIwBelKOWBbNaadt7hSxrAOArS8Jli5IhAqFmGPGJNhm9
	NYnv1zick8hD3L/GJSoM8hVAvcm7x4w2Iv8fcLgCtFDCCyvOu6WnMMhJmxW9K9aXZC2WwGugqP1xo
	kQX58r4t/5bwJfQd22j11C3x3PNnvng0ZEBxTkOWMiCZUyfgPm/WvCLrOO9U01Gc3qeMdE20BVp/F
	M7obhQauja47EIb3vX4BoUc4Cenwn/CW+A+PPN0T2AXK71nm/xC4aUNFdLfdB5Mv1QgDm3HG7EvnS
	CfNklPfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTTM-0000000DciJ-2PwP;
	Fri, 07 Mar 2025 08:54:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTOX-0000000DbrP-3HRg;
	Fri, 07 Mar 2025 08:49:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 484D2A455C5;
	Fri,  7 Mar 2025 08:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 315E3C4CEE9;
	Fri,  7 Mar 2025 08:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741337364;
	bh=mKRLsZTbVirykZYDZavF7sEwY8hATvHzdNKK4oF1idY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q+DlPTgE+8QpRxARmg1serr87RDVD76htmCrnntIHjv+CVLj0ygAWtWmt0SsIxHac
	 F8Put2voT937XIYV5pfkQ+vFUvMGnLwyxEYnwUvh1Hy1S4nxagg7Q5hi/WXfKjpiIB
	 kB3Ug191jmbc5QytyYDAN90HAxcWdzzt+bVI96AJL4ERC428ywOcg7hMMXGnv+ur0C
	 WD7WVDgTDDSdBo9cLnIMJxUNgeH9Pl+rGat/rnAhVFyWpiBLZecusulP4bYAI2ZFvd
	 T05LQNluyUAxjc3Rxey9AVgTYFdU1LqkaVr6SdAOGgfKOlpflHrSEvoLs8xHqb9DHn
	 yMabKQhVfpA/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23295C28B24;
	Fri,  7 Mar 2025 08:49:24 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 07 Mar 2025 16:49:23 +0800
Subject: [PATCH v4 2/4] irqchip: Add support for Amlogic A4 and A5 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-irqchip-gpio-a4-a5-v4-2-d03a9424151b@amlogic.com>
References: <20250307-irqchip-gpio-a4-a5-v4-0-d03a9424151b@amlogic.com>
In-Reply-To: <20250307-irqchip-gpio-a4-a5-v4-0-d03a9424151b@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741337362; l=5381;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=1f21swc6jeBydx77oY7KRx0ym1tuna22S6LIF708IxY=;
 b=B2bqRkvVsIw7sJVwNAPEVd0aj6tFmKZPLsn3LHB7rk/hMzwoBn4zoKb4tq5JbVZ8uirXnCMOQ
 /5ni5TTCfVlDvmLhSi8AgpPYO9aZ6W6b6+OvUwL/zpe1K//e1wgdSzh
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_004926_006092_2A540777 
X-CRM114-Status: GOOD (  15.72  )
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

The Amlogic A4 SoCs support 12 GPIO IRQ lines and 2 AO GPIO IRQ lines,
A5 SoCs support 12 GPIO IRQ lines, details are as below.

A4 IRQ Number:
- 72:55   18 pins on bank T
- 54:32   23 pins on bank X
- 31:16   16 pins on bank D
- 15:14    2 pins on bank E
- 13:0    14 pins on bank B

A4 AO IRQ Number:
- 7       1 pin  on bank TESTN
- 6:0     7 pins on bank AO

A5 IRQ Number:
- 98      1 pin  on bank TESTN
- 97:82   16 pins on bank Z
- 81:62   20 pins on bank X
- 61:48   14 pins on bank T
- 47:32   16 pins on bank D
- 31:27    5 pins on bank H
- 26:25    2 pins on bank E
- 24:14   11 pins on bank C
- 13:0    14 pins on bank B

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/irqchip/irq-meson-gpio.c | 45 ++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index cd789fa51519..e0265d24e3e3 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -26,8 +26,6 @@
 
 /* use for A1 like chips */
 #define REG_PIN_A1_SEL	0x04
-/* Used for s4 chips */
-#define REG_EDGE_POL_S4	0x1c
 
 /*
  * Note: The S905X3 datasheet reports that BOTH_EDGE is controlled by
@@ -72,6 +70,7 @@ struct meson_gpio_irq_params {
 	bool support_edge_both;
 	unsigned int edge_both_offset;
 	unsigned int edge_single_offset;
+	unsigned int edge_pol_reg;
 	unsigned int pol_low_offset;
 	unsigned int pin_sel_mask;
 	struct irq_ctl_ops ops;
@@ -105,6 +104,18 @@ struct meson_gpio_irq_params {
 	.pin_sel_mask = 0x7f,					\
 	.nr_channels = 8,					\
 
+#define INIT_MESON_A4_AO_COMMON_DATA(irqs)			\
+	INIT_MESON_COMMON(irqs, meson_a1_gpio_irq_init,		\
+			  meson_a1_gpio_irq_sel_pin,		\
+			  meson_s4_gpio_irq_set_type)		\
+	.support_edge_both = true,				\
+	.edge_both_offset = 0,					\
+	.edge_single_offset = 12,				\
+	.edge_pol_reg = 0x8,					\
+	.pol_low_offset = 0,					\
+	.pin_sel_mask = 0xff,					\
+	.nr_channels = 2,					\
+
 #define INIT_MESON_S4_COMMON_DATA(irqs)				\
 	INIT_MESON_COMMON(irqs, meson_a1_gpio_irq_init,		\
 			  meson_a1_gpio_irq_sel_pin,		\
@@ -112,6 +123,7 @@ struct meson_gpio_irq_params {
 	.support_edge_both = true,				\
 	.edge_both_offset = 0,					\
 	.edge_single_offset = 12,				\
+	.edge_pol_reg = 0x1c,					\
 	.pol_low_offset = 0,					\
 	.pin_sel_mask = 0xff,					\
 	.nr_channels = 12,					\
@@ -146,6 +158,18 @@ static const struct meson_gpio_irq_params a1_params = {
 	INIT_MESON_A1_COMMON_DATA(62)
 };
 
+static const struct meson_gpio_irq_params a4_params = {
+	INIT_MESON_S4_COMMON_DATA(81)
+};
+
+static const struct meson_gpio_irq_params a4_ao_params = {
+	INIT_MESON_A4_AO_COMMON_DATA(8)
+};
+
+static const struct meson_gpio_irq_params a5_params = {
+	INIT_MESON_S4_COMMON_DATA(99)
+};
+
 static const struct meson_gpio_irq_params s4_params = {
 	INIT_MESON_S4_COMMON_DATA(82)
 };
@@ -168,6 +192,9 @@ static const struct of_device_id meson_irq_gpio_matches[] __maybe_unused = {
 	{ .compatible = "amlogic,meson-sm1-gpio-intc", .data = &sm1_params },
 	{ .compatible = "amlogic,meson-a1-gpio-intc", .data = &a1_params },
 	{ .compatible = "amlogic,meson-s4-gpio-intc", .data = &s4_params },
+	{ .compatible = "amlogic,a4-gpio-ao-intc", .data = &a4_ao_params },
+	{ .compatible = "amlogic,a4-gpio-intc", .data = &a4_params },
+	{ .compatible = "amlogic,a5-gpio-intc", .data = &a5_params },
 	{ .compatible = "amlogic,c3-gpio-intc", .data = &c3_params },
 	{ .compatible = "amlogic,t7-gpio-intc", .data = &t7_params },
 	{ }
@@ -299,11 +326,10 @@ meson_gpio_irq_release_channel(struct meson_gpio_irq_controller *ctl,
 static int meson8_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 				    unsigned int type, u32 *channel_hwirq)
 {
-	u32 val = 0;
+	const struct meson_gpio_irq_params *params = ctl->params;
 	unsigned int idx;
-	const struct meson_gpio_irq_params *params;
+	u32 val = 0;
 
-	params = ctl->params;
 	idx = meson_gpio_irq_get_channel_idx(ctl, channel_hwirq);
 
 	/*
@@ -356,18 +382,19 @@ static int meson8_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 static int meson_s4_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 				      unsigned int type, u32 *channel_hwirq)
 {
-	u32 val = 0;
+	const struct meson_gpio_irq_params *params = ctl->params;
 	unsigned int idx;
+	u32 val = 0;
 
 	idx = meson_gpio_irq_get_channel_idx(ctl, channel_hwirq);
 
 	type &= IRQ_TYPE_SENSE_MASK;
 
-	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL_S4, BIT(idx), 0);
+	meson_gpio_irq_update_bits(ctl, params->edge_pol_reg, BIT(idx), 0);
 
 	if (type == IRQ_TYPE_EDGE_BOTH) {
 		val |= BIT(ctl->params->edge_both_offset + idx);
-		meson_gpio_irq_update_bits(ctl, REG_EDGE_POL_S4,
+		meson_gpio_irq_update_bits(ctl, params->edge_pol_reg,
 					   BIT(ctl->params->edge_both_offset + idx), val);
 		return 0;
 	}
@@ -378,7 +405,7 @@ static int meson_s4_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
 		val |= BIT(ctl->params->edge_single_offset + idx);
 
-	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL,
+	meson_gpio_irq_update_bits(ctl, params->edge_pol_reg,
 				   BIT(idx) | BIT(12 + idx), val);
 	return 0;
 };

-- 
2.37.1



