Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF63C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 06:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKseLkdLESjwl3bhRvFHFFac9Q4CaY8qolBaID7XlZ0=; b=aM5w/q7ULV/z45yXlCI1UYeIga
	tJZqBXPKvxPG9iBv4aNAf6eOyzbeXITlcc8YADRET6ro6RRMFOzxV41ewtPonRzsmP5RlD/mGz+jF
	d/bgSVuTcSHTQVAr0qb48xjbzxXsBD0GNFZcwaVaBFHXRUiHW0gOR09ZP6rYidfYAuiiSGcZnr6TS
	n80Jynb5Ehb8iWXwY3fC3Ag3eITxogKhvCbkjhhDq5FBo39AegJLZ6kUbrbdeniqNz0V0xw0lQQsJ
	Cf4WzyoJxNIMk+RK+rLboGlRyP9W0IgXQ/7Wib5rGE8eHH7ER9GUv4n5duiakXHJ3QKD/A5JcC8F2
	RM0IWUuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Na4-000000019Rm-1x46;
	Fri, 04 Sep 2026 06:39:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NZz-000000019LP-3cYh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 06:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDB0944020;
	Fri,  4 Sep 2026 06:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AFCEC2BD05;
	Fri,  4 Sep 2026 06:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788503954;
	bh=Ey6hHEAKzHtbiSwYiAX2p23FeQWcW7aXVVQjV1l8O20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fQIH/icosV8X2Qiqs7f3y7AaNSU7mUW8Rqdeue+uVZnDTwzzpe7RYlldFtht7YHR3
	 p5h/Ez0eLpA6aoe5MG4udWOdFeuBXAb3bkAIMc4eqQDk/2TapwvW/Rd9bHM8qO3jOj
	 us4FcvRayFHRNRnlDWcKzOswzyhyJOlEWMBtlJuMVbEQ8QdTFBbfXKvccvNX/DxBj5
	 Z104H0OMN4cYKW5gBtfZ5fSULxu4ClZcudUrERCUNVH1HSXNCJISYANiraT+prERXA
	 FoJPZEYNI/Blarry5Mm4uGXEP/mk6iSWYRYc0K8c80AUCbic0yk9LH459GQLL4Hf9C
	 enqLL7x7JAOCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A8BC61DD6;
	Fri,  4 Sep 2026 06:39:14 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Fri, 04 Sep 2026 14:38:18 +0800
Subject: [PATCH v6 11/13] serial: 8250_dw: add Ambarella CV75 quirks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-cv75-v5-v6-11-e918514cb3b1@ambarella.com>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
In-Reply-To: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Long Zhao <longzhao@ambarella.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Long Zhao <zl020895@163.com>, Lee Jones <lee@kernel.org>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788503951; l=3281;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=Z5nzeIPvLPUzlAn30nqY+z7UiEoVXDand3R1os5q42Q=;
 b=xJ3lb4R3PdX4OCLG6tIEbcBo62x+owepbHCBd7hLxw13rzqXb19saOwGcjzuxfdOWZgy6qLCn
 +E/ccfIZMOTCz+l5VdlDnnEp9HHYjH41kSPIxNeuVTW2hxaFlvXdbS2
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

The Ambarella CV75 UART is Ambarella IP, not a Synopsys DesignWare
licensed block. At the register level it is close enough to DW APB UART
that a full custom UART driver is unnecessary: reuse 8250_dw with a
small platform quirk.

Quirks:
- keep IER ETOI (bit 5) set for RX timeout behaviour
- skip set_rate; baud clock is managed outside the UART block

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/tty/serial/8250/8250_dw.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 5fba913f3301..b15de40d1e2a 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -43,6 +43,9 @@
 #define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
 #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
 
+/* Ambarella IER: receive timeout interrupt enable */
+#define AMBARELLA_UART_IER_ETOI		BIT(5)
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
@@ -60,6 +63,7 @@
 
 struct dw8250_platform_data {
 	u8 usr_reg;
+	u8 ier_mask;
 	u32 cpr_value;
 	unsigned int quirks;
 };
@@ -572,6 +576,27 @@ static void dw8250_prepare_rx_dma(struct uart_8250_port *p)
 	dw8250_writel_ext(up, RZN1_UART_RDMACR, val);
 }
 
+static int dw8250_ier_mask_startup(struct uart_port *p)
+{
+	struct dw8250_data *d = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int ret;
+
+	ret = serial8250_do_startup(p);
+	if (ret)
+		return ret;
+
+	/*
+	 * Ambarella keeps variant IER bits (e.g. ETOI) set for correct RX
+	 * timeout behaviour. Force them into the 8250 IER shadow so later
+	 * generic IER updates do not clear them.
+	 */
+	up->ier |= d->pdata->ier_mask;
+	serial_port_out(p, UART_IER, up->ier);
+
+	return 0;
+}
+
 static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 {
 	unsigned int quirks = data->pdata->quirks;
@@ -606,6 +631,8 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_in = dw8250_serial_in32;
 		data->uart_16550_compatible = true;
 	}
+	if (data->pdata->ier_mask)
+		p->startup = dw8250_ier_mask_startup;
 }
 
 static void dw8250_reset_control_assert(void *data)
@@ -879,6 +906,12 @@ static const struct dw8250_platform_data dw8250_intc10ee = {
 	.quirks = DW_UART_QUIRK_IER_KICK,
 };
 
+static const struct dw8250_platform_data dw8250_ambarella_cv75_data = {
+	.usr_reg = DW_UART_USR,
+	.ier_mask = AMBARELLA_UART_IER_ETOI,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+};
+
 static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
 	.usr_reg = DW_UART_USR,
 	.cpr_value = FIELD_PREP_CONST(DW_UART_CPR_ABP_DATA_WIDTH, 2) |
@@ -889,6 +922,7 @@ static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
 };
 
 static const struct of_device_id dw8250_of_match[] = {
+	{ .compatible = "ambarella,cv75-uart", .data = &dw8250_ambarella_cv75_data },
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },

-- 
2.34.1



