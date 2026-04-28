Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDD4FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u72ZAhM5YFnCsbKib1tv6V9fY85PjTFnRx7w4kmn504=; b=foZvB/HWr9uviNAY2ZowDAKAFV
	jC3ueUv8GFrzGolQ34yVxAAiNmGsk88V1M6sVZK0Vb3gAM4yVSKSROu4SomXPSp0Vvh5ffhnqIQpA
	XAXqsV3ZKAUTd+bl8dEr/4Nz51ECurZHjBUTW3wnzVNfAgENIPiMUAWzPvn/gYtb1C9Sf3bc6I1fj
	wvuMjFSlnTNHSkFXpYDGHnI35ZVh0LPpHuYwcpFtsu8Yy0eCzST/RiqL0n4FizbQDXuLlTBoeVrG3
	ruuUW41ZFHOZohn4o8TpGXJl+DyWI5fdP28mmJFswIEUoq+klL+ZXuFZo+OmFI3ip+rKNhDKoWvKg
	LAIOWW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdic-00000000sV8-0xVX;
	Tue, 28 Apr 2026 08:22:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdia-00000000sUR-1qM2;
	Tue, 28 Apr 2026 08:22:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD7B461145;
	Tue, 28 Apr 2026 08:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4E87C2BCF5;
	Tue, 28 Apr 2026 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777364574;
	bh=J7eh+XFrs78utGECZ29cgpAbZ3KJfDOdBszbElZ49jY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=klZST4EVDCkCSERgxKJjmaghR7SS3M6PCM3VxfzV6EmLaj9RfxSpSV5sfWZ0Gcccu
	 MRbQ3yElKf5P2a9Tx2AYv007AqyrFy5TXznuLH4rHNBxyPP1jC2nXfXljvKm3mQ50/
	 bpy5nQMVz0cBsQgUsCqLdsmRDbWvxeFOunvQODGlLHtqPgzZ4Ejz0r1a7XBIUYfcss
	 ne6Q9kwtxKh+qzBg+xd8aEO1Li9vAJcnvJh304F8Iich4IF2dPoNcnk7D9M/NKz0l3
	 Z6mqfHMif4be2wa4ZbXUTzNnlEmc9qp2VX2T5Xkf9X7b54xWzywFUdOZrTXiXB5BDs
	 1mqMV1WAN8TEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BD5FF886D;
	Tue, 28 Apr 2026 08:22:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 28 Apr 2026 08:22:49 +0000
Subject: [PATCH 2/2] pinctrl: meson: support amlogic A9 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-a9-pinctrl-v1-2-cd611bb5f52d@amlogic.com>
References: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com>
In-Reply-To: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777364572; l=4554;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=VUhEj9cKp+FmG7e6Zp2Dxko9ciBXVboEUbRooKfNrpU=;
 b=yqNFNjMSqcesmpLiPuDXeRbBy/kyQ64rWB4GCE6Y1F9HzNjtF9tMcqRjKm2T6SYiQXA5K4XnE
 L6M8w8ghn7uCK4j8bVwg/ZUoZXuyIRAM6s+UyTk/ofXLLYIXcRuWjX4
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

In Amlogic A9 SoC, subordinate bank reuse other master bank is
not from bit0, and subordinate bank reuse multi master banks.

This submission implements this situation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 61 +++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index e2293a872dcb..256d9787f004 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -55,14 +55,18 @@ struct aml_pio_control {
  * partial bank(subordinate) pins mux config use other bank(main) mux registgers
  * m_bank_id:	the main bank which pin_id from 0, but register bit not from bit 0
  * m_bit_offs:	bit offset the main bank mux register
+ * s_bit_offs:	start bit that subordinate bank use mux register
  * sid:         start pin_id of subordinate bank
  * eid:         end pin_id of subordinate bank
+ * next:	subordinate bank reused multiple other bank groups.
  */
 struct multi_mux {
 	unsigned int m_bank_id;
 	unsigned int m_bit_offs;
+	unsigned int s_bit_offs;
 	unsigned int sid;
 	unsigned int eid;
+	const struct multi_mux *next;
 };
 
 struct aml_pctl_data {
@@ -124,12 +128,51 @@ static const char *aml_bank_name[31] = {
 "GPIOCC", "TEST_N", "ANALOG"
 };
 
+static const struct multi_mux multi_mux_a9[] = {
+	{
+		.m_bank_id = AMLOGIC_GPIO_C,
+		.m_bit_offs = 4,
+		.s_bit_offs = 0,
+		.sid = (AMLOGIC_GPIO_D << 8) + 16,
+		.eid = (AMLOGIC_GPIO_D << 8) + 16,
+		.next = &multi_mux_a9[1],
+	}, {
+		.m_bank_id = AMLOGIC_GPIO_AO,
+		.m_bit_offs = 0,
+		.s_bit_offs = 52,
+		.sid = (AMLOGIC_GPIO_D << 8) + 17,
+		.eid = (AMLOGIC_GPIO_D << 8) + 17,
+		.next = NULL,
+	}, {
+		.m_bank_id = AMLOGIC_GPIO_A,
+		.m_bit_offs = 0,
+		.s_bit_offs = 80,
+		.sid = (AMLOGIC_GPIO_Y << 8) + 8,
+		.eid = (AMLOGIC_GPIO_Y << 8) + 9,
+		.next = NULL,
+	}, {
+		.m_bank_id = AMLOGIC_GPIO_CC,
+		.m_bit_offs = 24,
+		.s_bit_offs = 0,
+		.sid = (AMLOGIC_GPIO_X << 8) + 16,
+		.eid = (AMLOGIC_GPIO_X << 8) + 17,
+		.next = NULL,
+	},
+};
+
+static const struct aml_pctl_data a9_priv_data = {
+	.number = ARRAY_SIZE(multi_mux_a9),
+	.p_mux = multi_mux_a9,
+};
+
 static const struct multi_mux multi_mux_s7[] = {
 	{
 		.m_bank_id = AMLOGIC_GPIO_CC,
 		.m_bit_offs = 24,
+		.s_bit_offs = 0,
 		.sid = (AMLOGIC_GPIO_X << 8) + 16,
 		.eid = (AMLOGIC_GPIO_X << 8) + 19,
+		.next = NULL,
 	},
 };
 
@@ -142,13 +185,17 @@ static const struct multi_mux multi_mux_s6[] = {
 	{
 		.m_bank_id = AMLOGIC_GPIO_CC,
 		.m_bit_offs = 24,
+		.s_bit_offs = 0,
 		.sid = (AMLOGIC_GPIO_X << 8) + 16,
 		.eid = (AMLOGIC_GPIO_X << 8) + 19,
+		.next = NULL,
 	}, {
 		.m_bank_id = AMLOGIC_GPIO_F,
 		.m_bit_offs = 4,
+		.s_bit_offs = 0,
 		.sid = (AMLOGIC_GPIO_D << 8) + 6,
 		.eid = (AMLOGIC_GPIO_D << 8) + 6,
+		.next = NULL,
 	},
 };
 
@@ -177,31 +224,34 @@ static int aml_pctl_set_function(struct aml_pinctrl *info,
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int shift;
 	int reg;
-	int i;
+	int i, loop_count;
 	unsigned int offset = bank->mux_bit_offs;
 	const struct multi_mux *p_mux;
 
 	/* peculiar mux reg set */
-	if (bank->p_mux) {
-		p_mux = bank->p_mux;
+	loop_count = 10;
+	p_mux = bank->p_mux;
+	while (p_mux && loop_count) {
 		if (pin_id >= p_mux->sid && pin_id <= p_mux->eid) {
 			bank = NULL;
 			for (i = 0; i < info->nbanks; i++) {
 				if (info->banks[i].bank_id == p_mux->m_bank_id) {
 					bank = &info->banks[i];
-						break;
+					break;
 				}
 			}
 
 			if (!bank || !bank->reg_mux)
 				return -EINVAL;
 
-			shift = (pin_id - p_mux->sid) << 2;
+			shift = ((pin_id - p_mux->sid) << 2) + p_mux->s_bit_offs;
 			reg = (shift / 32) * 4;
 			offset = shift % 32;
 			return regmap_update_bits(bank->reg_mux, reg,
 					0xf << offset, (func & 0xf) << offset);
 		}
+		p_mux = p_mux->next;
+		loop_count--;
 	}
 
 	/* normal mux reg set */
@@ -1159,6 +1209,7 @@ static int aml_pctl_probe(struct platform_device *pdev)
 
 static const struct of_device_id aml_pctl_of_match[] = {
 	{ .compatible = "amlogic,pinctrl-a4", },
+	{ .compatible = "amlogic,pinctrl-a9", .data = &a9_priv_data, },
 	{ .compatible = "amlogic,pinctrl-s7", .data = &s7_priv_data, },
 	{ .compatible = "amlogic,pinctrl-s6", .data = &s6_priv_data, },
 	{ /* sentinel */ }

-- 
2.52.0



