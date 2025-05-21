Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B54C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 03:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsQ1pwHer+Pi+xJrx5Lcv+AeKmNl2Ju7Rhqd9Eg3bJE=; b=f7N+HavP9LDpsuQfAAuG/I7wt6
	4M+JstuwxxIG7y8SQB/iO7SUFHu+PFGtdqBggkKGGNstagsH4mMlCN3Escmd3WPSGEdRGXGTnb7/6
	hcdDQNunRb2O87HwY/PYTgNsSzr28dK4gZi58ldS0ycVQV5YQnQnF0VLXoe8TqU4HOZQJqhwK0OQf
	fJ2bEwnWOubAlbCI3Y00Xusyv+KIhPY1vjj3YcTuK2u7PRU6VRQiIjHpV5xoidZW87p63ozTVZo2H
	yx0ojtf1R7AtRzlBfUfklJwI4NIJRN0S/eqiRIf2ykcWK41XCopjAymxUiLdyi/V/10O9VXCNP6Sk
	V3Ckjw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHaA5-0000000EgXd-471U;
	Wed, 21 May 2025 03:30:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHZzr-0000000EfKP-0vde;
	Wed, 21 May 2025 03:20:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 318054A4CE;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0089BC4CEF2;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747797598;
	bh=xlb1hFCZHKPe922gxi3v68NhnIgKYyYUZCFuJIwfggk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=laXZNrjiHl+azqzTqJ3vZR9Y1jVwqiD0wiqDvXVDNGUqx/pRJZlqIehc1B1PGvVU0
	 su/enxPz16tIdkgjNDDO/iY0jtTN/hPMX2PzImRXI4+4wVgy6z4VeQ8epoi7cVHSq9
	 aneebdWkiO7R2gi8Dx70zpW8vLnyjbAhteQPUpWAqEXEyOyHKfrWos88c4DQMDeYUZ
	 RXQRiKRicuLsWMUNx7azYQOE0HViQ9HU/bjghsSOD5OglpRmRCejfI9adkHWmUc+OG
	 VtTfKE2gYqkdSrMROLQWPVgPx/kQysBC7W2lTrTZO4EuhNSh+MI2qqTLKkamapWU7a
	 4u4dSRmWxLFdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB57C3ABC9;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 21 May 2025 11:19:59 +0800
Subject: [PATCH v2 5/8] pinctrl: meson: support amlogic S6/S7/S7D SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-s6-s7-pinctrl-v2-5-0ce5e3728404@amlogic.com>
References: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
In-Reply-To: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747797595; l=5342;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=qYNWhkH55B8d6PXwynFbW7T5kFGFgc23N8HQ5eIP7KU=;
 b=QvYZPAPFGbFupNf3kMpAq0MdikmqUAzF9AkXLAjKTxDOrf3pOwraAOdhugAivF8DWRbC4FKSK
 FMX5FoBXxyfC1xgktF5YcL60skrUEzR9hMrVZYdwt3yuXnnp9Wnb9nu
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_201959_319198_5BED6024 
X-CRM114-Status: GOOD (  21.99  )
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

In some Amlogic SoCs, to save register space or due to some
abnormal arrangements, two sets of pins share one mux register.

A group starting from pin0 is the main pin group, which acquires
the register address through DTS and has management permissions,
but the register bit offset is undetermined.

Another GPIO group as a subordinate group. Some pins mux use share
register and bit offset from bit0 . But this group do not have
register management permissions.

This submission implements this situation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 101 ++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 90d4d10ca10b..598c126ff62e 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -50,8 +50,23 @@ struct aml_pio_control {
 	u32 bit_offset[AML_NUM_REG];
 };
 
+/*
+ * partial bank(subordinate) pins mux config use other bank(main) mux registgers
+ * m_bank_id:	the main bank which pin_id from 0, but register bit not from bit 0
+ * m_bit_offs:	bit offset the main bank mux register
+ * sid:         start pin_id of subordinate bank
+ * eid:         end pin_id of subordinate bank
+ */
+struct multi_mux {
+	unsigned int m_bank_id;
+	unsigned int m_bit_offs;
+	unsigned int sid;
+	unsigned int eid;
+};
+
 struct aml_pctl_data {
 	unsigned int number;
+	const struct multi_mux *p_mux;
 };
 
 struct aml_pmx_func {
@@ -71,10 +86,12 @@ struct aml_gpio_bank {
 	struct gpio_chip		gpio_chip;
 	struct aml_pio_control		pc;
 	u32				bank_id;
+	u32				mux_bit_offs;
 	unsigned int			pin_base;
 	struct regmap			*reg_mux;
 	struct regmap			*reg_gpio;
 	struct regmap			*reg_ds;
+	const struct multi_mux		*p_mux;
 };
 
 struct aml_pinctrl {
@@ -106,13 +123,46 @@ static const char *aml_bank_name[31] = {
 "GPIOCC", "TEST_N", "ANALOG"
 };
 
+const struct multi_mux multi_mux_s7[] = {
+	{
+		.m_bank_id = AMLOGIC_GPIO_CC,
+		.m_bit_offs = 24,
+		.sid = (AMLOGIC_GPIO_X << 8) + 16,
+		.eid = (AMLOGIC_GPIO_X << 8) + 19,
+	},
+};
+
+const struct aml_pctl_data s7_priv_data = {
+	.number = ARRAY_SIZE(multi_mux_s7),
+	.p_mux = multi_mux_s7,
+};
+
+const struct multi_mux multi_mux_s6[] = {
+	{
+		.m_bank_id = AMLOGIC_GPIO_CC,
+		.m_bit_offs = 24,
+		.sid = (AMLOGIC_GPIO_X << 8) + 16,
+		.eid = (AMLOGIC_GPIO_X << 8) + 19,
+	}, {
+		.m_bank_id = AMLOGIC_GPIO_F,
+		.m_bit_offs = 4,
+		.sid = (AMLOGIC_GPIO_D << 8) + 6,
+		.eid = (AMLOGIC_GPIO_D << 8) + 6,
+	},
+};
+
+const struct aml_pctl_data s6_priv_data = {
+	.number = ARRAY_SIZE(multi_mux_s6),
+	.p_mux = multi_mux_s6,
+};
+
 static int aml_pmx_calc_reg_and_offset(struct pinctrl_gpio_range *range,
 				       unsigned int pin, unsigned int *reg,
 				       unsigned int *offset)
 {
 	unsigned int shift;
 
-	shift = (pin - range->pin_base) << 2;
+	shift = ((pin - range->pin_base) << 2) + *offset;
 	*reg = (shift / 32) * 4;
 	*offset = shift % 32;
 
@@ -124,9 +174,36 @@ static int aml_pctl_set_function(struct aml_pinctrl *info,
 				 int pin_id, int func)
 {
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
+	unsigned int shift;
 	int reg;
-	int offset;
+	int i;
+	unsigned int offset = bank->mux_bit_offs;
+	const struct multi_mux *p_mux;
+
+	/* peculiar mux reg set */
+	if (bank->p_mux) {
+		p_mux = bank->p_mux;
+		if (pin_id >= p_mux->sid && pin_id <= p_mux->eid) {
+			bank = NULL;
+			for (i = 0; i < info->nbanks; i++) {
+				if (info->banks[i].bank_id == p_mux->m_bank_id) {
+					bank = &info->banks[i];
+						break;
+				}
+			}
+
+			if (!bank || !bank->reg_mux)
+				return -EINVAL;
+
+			shift = (pin_id - p_mux->sid) << 2;
+			reg = (shift / 32) * 4;
+			offset = shift % 32;
+			return regmap_update_bits(bank->reg_mux, reg,
+					0xf << offset, (func & 0xf) << offset);
+		}
+	}
 
+	/* normal mux reg set */
 	if (!bank->reg_mux)
 		return 0;
 
@@ -836,12 +913,30 @@ static const struct gpio_chip aml_gpio_template = {
 static void init_bank_register_bit(struct aml_pinctrl *info,
 				   struct aml_gpio_bank *bank)
 {
+	const struct aml_pctl_data *data = info->data;
+	const struct multi_mux *p_mux;
 	int i;
 
 	for (i = 0; i < AML_NUM_REG; i++) {
 		bank->pc.reg_offset[i] = aml_def_regoffs[i];
 		bank->pc.bit_offset[i] = 0;
 	}
+
+	bank->mux_bit_offs = 0;
+
+	if (data) {
+		for (i = 0; i < data->number; i++) {
+			p_mux = &data->p_mux[i];
+			if (bank->bank_id == p_mux->m_bank_id) {
+				bank->mux_bit_offs = p_mux->m_bit_offs;
+				break;
+			}
+			if (p_mux->sid >> 8 == bank->bank_id) {
+				bank->p_mux = p_mux;
+				break;
+			}
+		}
+	}
 }
 
 static int aml_gpiolib_register_bank(struct aml_pinctrl *info,
@@ -1008,6 +1103,8 @@ static int aml_pctl_probe(struct platform_device *pdev)
 
 static const struct of_device_id aml_pctl_of_match[] = {
 	{ .compatible = "amlogic,pinctrl-a4", },
+	{ .compatible = "amlogic,pinctrl-s7", .data = &s7_priv_data, },
+	{ .compatible = "amlogic,pinctrl-s6", .data = &s6_priv_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, aml_pctl_dt_match);

-- 
2.37.1



