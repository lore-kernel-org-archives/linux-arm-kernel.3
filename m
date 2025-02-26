Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FA9C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 05:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbHt8KaVm6W9ybH6mAXw1pap+uiqp+dNdpjUxBkQdzM=; b=z0or5sSvNc6CKdL+SZTbodpgrA
	zQSBtRF9qz5LYHnB/R3EDlq8nYsZ69/qpcndy2+0Fl6/BgRFJlTFQ1+vvmk69pbLvDw3x5VSCxwfW
	NJrqg0bPTo6kN5VELGzfn0Ygiw91UvrBHhtZNdjdoHxyWT+EzXuy8zV7ZgYsCkvvVYcvE+klfnpy1
	h3AmI/rgb9Mq6x6g+eyfuZD8szyyyEYoztp/IcbRYaLFMcqUrfcgmR9RIVdiJBP0kwDgKApVhY7g1
	fIE8qPCFDaMX9foLyrVCIKeXkblQ2DWQkzXbfM3J7irjyMa6WtqP03Czpxu/Mcequ329Lkk670TLe
	d0vMPvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnANO-00000002TBR-28i9;
	Wed, 26 Feb 2025 05:54:34 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAHR-00000002SAj-1Vcs;
	Wed, 26 Feb 2025 05:48:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14A1E61222;
	Wed, 26 Feb 2025 05:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69FECC4CEEA;
	Wed, 26 Feb 2025 05:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740548893;
	bh=gFcgMIS9ztIZn6S2K6MNHWlWfjjJX8W7NeJumA0V9vc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uJ/8z1OekqM6+Ovqkn/Xl23EUSQPr0gaRGLiARhL+4bXxwMRVgpQ9s4wT4HNFET8e
	 yhCKuCZJJIcKfApT2vcZDp7WdCsh/JFzDNqU/nPS38MHfP3Dv75EFfdShIVrGDstIm
	 wzMO+ETl/HgSPVS0O+720dzLcPVFacFD+E6fa2b7lyH1IwACNfiIY4ken+NqZv++S5
	 ABz7FUFQwoMpHCjg6xapTQmJzA7oxeXJ/ukMNH94sSqbek8o4RFQ5VnwfB8bXUfD99
	 Q9IKk7DAKQWCW82TyLpeBhwEzD6YAZU0vJVIiNOORQeoFabY0+EE90ncW7kjGoh3RS
	 F6OQ7j1Yd5R8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BF9C19776;
	Wed, 26 Feb 2025 05:48:13 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 26 Feb 2025 13:47:53 +0800
Subject: [PATCH v2 2/4] irqchip: Add support for Amlogic A4 and A5 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-irqchip-gpio-a4-a5-v2-2-c55b1050cb55@amlogic.com>
References: <20250226-irqchip-gpio-a4-a5-v2-0-c55b1050cb55@amlogic.com>
In-Reply-To: <20250226-irqchip-gpio-a4-a5-v2-0-c55b1050cb55@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740548891; l=5268;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=ShCEtX+584NPfGq4QXGBKe8uO5ZA7smL2hEHYLb1QYg=;
 b=s2CUePXilok0VUMnzCNHy4hsYxfXpUAeCrQXm6Cs95dLuJtLcuLdFRTJymXc80r/6Sv+e15rg
 JEAEh5EEiMHAoaFI/qBA6Um0C0aRnO0IF8pmNBTykdySJ8zj4QyP/K2
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
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
 drivers/irqchip/irq-meson-gpio.c | 42 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index cd789fa51519..f1cf0c228ca4 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -26,8 +26,6 @@
 
 /* use for A1 like chips */
 #define REG_PIN_A1_SEL	0x04
-/* Used for s4 chips */
-#define REG_EDGE_POL_S4	0x1c
 
 /*
  * Note: The S905X3 datasheet reports that BOTH_EDGE is controlled by
@@ -57,6 +55,8 @@ static int meson8_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 				    unsigned int type, u32 *channel_hwirq);
 static int meson_s4_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 				      unsigned int type, u32 *channel_hwirq);
+static int meson_ao_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
+				      unsigned int type, u32 *channel_hwirq);
 
 struct irq_ctl_ops {
 	void (*gpio_irq_sel_pin)(struct meson_gpio_irq_controller *ctl,
@@ -72,6 +72,7 @@ struct meson_gpio_irq_params {
 	bool support_edge_both;
 	unsigned int edge_both_offset;
 	unsigned int edge_single_offset;
+	unsigned int edge_pol_reg;
 	unsigned int pol_low_offset;
 	unsigned int pin_sel_mask;
 	struct irq_ctl_ops ops;
@@ -105,6 +106,18 @@ struct meson_gpio_irq_params {
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
@@ -112,6 +125,7 @@ struct meson_gpio_irq_params {
 	.support_edge_both = true,				\
 	.edge_both_offset = 0,					\
 	.edge_single_offset = 12,				\
+	.edge_pol_reg = 0x1c,					\
 	.pol_low_offset = 0,					\
 	.pin_sel_mask = 0xff,					\
 	.nr_channels = 12,					\
@@ -146,6 +160,18 @@ static const struct meson_gpio_irq_params a1_params = {
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
@@ -168,6 +194,9 @@ static const struct of_device_id meson_irq_gpio_matches[] __maybe_unused = {
 	{ .compatible = "amlogic,meson-sm1-gpio-intc", .data = &sm1_params },
 	{ .compatible = "amlogic,meson-a1-gpio-intc", .data = &a1_params },
 	{ .compatible = "amlogic,meson-s4-gpio-intc", .data = &s4_params },
+	{ .compatible = "amlogic,a4-gpio-ao-intc", .data = &a4_ao_params },
+	{ .compatible = "amlogic,a4-gpio-intc", .data = &a4_params },
+	{ .compatible = "amlogic,a5-gpio-intc", .data = &a5_params },
 	{ .compatible = "amlogic,c3-gpio-intc", .data = &c3_params },
 	{ .compatible = "amlogic,t7-gpio-intc", .data = &t7_params },
 	{ }
@@ -358,16 +387,19 @@ static int meson_s4_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 {
 	u32 val = 0;
 	unsigned int idx;
+	const struct meson_gpio_irq_params *params;
+
+	params = ctl->params;
 
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
@@ -378,7 +410,7 @@ static int meson_s4_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
 		val |= BIT(ctl->params->edge_single_offset + idx);
 
-	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL,
+	meson_gpio_irq_update_bits(ctl, params->edge_pol_reg,
 				   BIT(idx) | BIT(12 + idx), val);
 	return 0;
 };

-- 
2.37.1



