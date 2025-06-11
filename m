Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D010CC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 16:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdZFjl2fccvj0QADc8xzOcmXiXilDJiFfw1wc4K1F9g=; b=MYg9XBxnsVdN4Pn65miNJgmPEZ
	kql8fFnbikuMgqa0+QuvOXEAZiKymxSXjAvtqxE+FSoGVocnQzWrGHA/A0FY5ron3GyCcdFWSwJ1c
	ftN8D1HutdSOg1/OYHbs0RMWPqYFH1GJ4OFiHM/Xl5FeP4fH3EZDZ4eqLC9Q6NaFY5ykXnTqpA261
	ycEV+iQZEW+GgVc7n5eXsgO9j5Tu87Zk82BVLB2+7zmB/YYaUFfsn2R+iZPs7FjClPTeLw4BIVWvV
	bLEx+OIN9eeOT16B8jco/muZOOiRIAgxS0HzDZFH7N/ESkH/aJ21TP6jFxmjeqXcoC0RGeCQCDZF6
	/bvyu9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO3f-0000000AYpU-3GTp;
	Wed, 11 Jun 2025 16:12:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKyC-00000009t9e-0zmR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:54:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so80737765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 05:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646459; x=1750251259; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdZFjl2fccvj0QADc8xzOcmXiXilDJiFfw1wc4K1F9g=;
        b=1YsrMUP6IXORF4rHYrWrbi479Ei31iENhhxy0oVk4MRMQl+Mzfud+GPNy2Wsa81Sxm
         GoBlmLs1L3wquQM3APj6BEhIg6/j9U5hpwVzfIgCtst+1s2XmUsIorvospByP2l4t5SH
         ZpeZ8/OZxTCy9CosWy329uD15GPnHr50UzTL6sCV+zCz9KzpH3IjsAXttmxIVQO2i9yT
         zs2Q6Uw6B2r9na0OJfiRtL4QdC4p29nyEPZ6NDgMCKK8ZgYNZK6HLiQ/m3fEw05rk62q
         xAYGqI5t0GmAg9he07JOkyng/n5uGXK1DR8zmHop8sgcWeFrY9/JYI9W6EhC2Kp8SQDv
         i/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646459; x=1750251259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdZFjl2fccvj0QADc8xzOcmXiXilDJiFfw1wc4K1F9g=;
        b=LvqGdXKFdW9cCnWwU887x85LB6Ng0PZ02zP8I1+QNzWU3SW4/wVX+4ndkXzb5EjFSq
         MDJYbwSmCRm5YmDp8YYyQF0lO6z79JlGMyKlsUr6QMPIMgasS7OV4pHZDQwCOerFfOgd
         gTcsTfa5PfUUZUQbCf9FaSdEznSgEDHYExA2pPMMtXBDK+kv28sH8joq4x2aPI5URx8n
         q9iiD2xvOXpSZNOCJ3OUeIRsF6xRn7anBH7nXckfbMHdqq/o0sn1SAIZpeDrKR3ZW5J8
         h25UX2gm3xP0MUZAf0IPGjgLs04mr9MfcTmxxPLrj1ogffCDrNAtux2FiYfLZ+/w/Fx0
         GC4w==
X-Forwarded-Encrypted: i=1; AJvYcCWqX0yJQXE8IZErM7/LYMVk8wnBzTZo75iEbaUR1P+P+B9jmykvVAQGNZPE2ixWJ9KGS2CkuhpaIZ1Or8veqAsJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxot8d3o8RK4HS69FgvSw2cRu10PWv8xPDsU/9w6oVZXbBTn5iF
	JmC3oYbARt/I+6eXoNPBuvkRWbvqrl0B9MgpuRZuUWn/cN217I++EG58yWORpW8MwrxTEhPlY7n
	2zJgO
X-Gm-Gg: ASbGnctnw+YoZdPHXleK4smgIcyxg1BtJMLn15N5xwafpXUw4gfjvHCr6YIGDvWV7sc
	ZN7x5rBLCpdb+TAciU2XKJ3ji4enowkFQ5Xi75tjfNLuOlRhu3B7+DIVR1qQsHt5MciL0xf6VtJ
	Ua7jVYTHRwigDbSsxBIj8WwnJQ1dtmxAzYPOU9r/NB2BO68s4jCnVKoLZX5wUetNm5WpWL8RQ+d
	8d3ijpWflX6ZxYMOZZl9DKhEvZLwvze/bfjFNofx5AO/rXPbYRbTvMszo2c08qrpo7YftsE7rke
	NmXHWnvO6Vb1i/qZg9aXnH3WmJdUzDYXoJmmqvdSIfDrAsdjLQDKb0G1RhRaI/q6ydAFywHsuF5
	/
X-Google-Smtp-Source: AGHT+IFwVwM1VBdaMyjnvhb9KUvhpjuoSTMLyxFLI5Ds1mjnS+Tvk4Fdx9g7hYxsolgprYuijG/Grg==
X-Received: by 2002:a05:600c:83c6:b0:442:ccf0:41e6 with SMTP id 5b1f17b1804b1-45324879755mr33205135e9.3.1749646458645;
        Wed, 11 Jun 2025 05:54:18 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 14:53:59 +0200
Subject: [PATCH 4/4] clk: amlogic: axg-audio: use the auxiliary reset
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-clk-aux-v1-4-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5930; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=huEY8ThqIGGefkr+NwFuL0lRYACFVhJDRBYG4OTx8VY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXx0TIJvPb4pFL/m7UQSR8q8Mbmnm6OXPs6eY
 BlR75emBm6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8dAAKCRDm/A8cN/La
 hYBdD/4q4nR6sR3pGrG2npIFVDhtrUeD2xlhg3MU+t88JlBrPmoOz41y1Wf/bedDpP/faKO/bBr
 TOoSV5jth7KOZPGgyHqDPHAsKRsHJbhqNCunHDD2lrgPZ1G5sFpWda3g4iTBjdRcQA/hejB/ms+
 k5kKyGyh2k5q+aslEn26t+PeUGNpnURdMTXra3MoWA5iNFxnRyBwh/kYcv/SxH7xOvYdjSuuQ8E
 3O/rX23FNPho4XyEsvHCxK6eNI8G/drzYrSTR7x0ho6tYHGXQyO8kiVyz6X4VNpDaxSjhFZgtVs
 27d3xyfPLL9D3gANvpytNJ2TDCZsxI/bnxBzvX3PWBNnqFEsMtzQL3AbbDXmszrQ7KZoWmYGgIr
 kol4jbVM1bYwt1uW7lFipMrRLaPUOBp0ZgU8cEXKBdjBEbvBTNPYPiONQgGcjLC5wORPH0Tx/bX
 EOgo9478Bt3rTMhrDtnvInIoRkS/hWafp/2eyaerWzpsG2CT7gPmDEgGPCFYpEeDbmxUgFSDaPu
 gaPRwD8xreYmjOVrY8ouBs8ZP5hRfRPj99j8QNqli0LMOWUgollWYlxxCg176YGEd1Ahlod6wdZ
 VlYbRSa049s3x8nrmijC9a0qHqGHNlDHhkm9JTN8P+uDvgj4y+wuGe+UNy3WC/9xpve12kAEbiW
 Zd2BjFIZ3ZYGjVA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_055420_293064_6EE3DC72 
X-CRM114-Status: GOOD (  20.77  )
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

Remove the implementation of the reset driver in axg audio
clock driver and migrate to the one provided by reset framework
on the auxiliary bus.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig     |   3 +-
 drivers/clk/meson/axg-audio.c | 114 +++++-------------------------------------
 2 files changed, 15 insertions(+), 102 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index ff003dc5ab20d904c91fc34c701ba499a11d0b63..5c669b2e2f268c7608c8d9c64bba3c5b54da39b2 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -106,7 +106,8 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select REGMAP_MMIO
-	select RESET_CONTROLLER
+	select AUXILIARY_BUS
+	imply RESET_MESON_AUX
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 9df627b142f89788966ede0262aaaf39e13f0b49..3948f5d0faca372dd5cc4ed6dc95f9c89fe5bae8 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -4,6 +4,7 @@
  * Author: Jerome Brunet <jbrunet@baylibre.com>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
@@ -12,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
-#include <linux/reset-controller.h>
 #include <linux/slab.h>
 
 #include "meson-clkc-utils.h"
@@ -1678,84 +1678,6 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
 	&sm1_earcrx_dmac_clk,
 };
 
-struct axg_audio_reset_data {
-	struct reset_controller_dev rstc;
-	struct regmap *map;
-	unsigned int offset;
-};
-
-static void axg_audio_reset_reg_and_bit(struct axg_audio_reset_data *rst,
-					unsigned long id,
-					unsigned int *reg,
-					unsigned int *bit)
-{
-	unsigned int stride = regmap_get_reg_stride(rst->map);
-
-	*reg = (id / (stride * BITS_PER_BYTE)) * stride;
-	*reg += rst->offset;
-	*bit = id % (stride * BITS_PER_BYTE);
-}
-
-static int axg_audio_reset_update(struct reset_controller_dev *rcdev,
-				unsigned long id, bool assert)
-{
-	struct axg_audio_reset_data *rst =
-		container_of(rcdev, struct axg_audio_reset_data, rstc);
-	unsigned int offset, bit;
-
-	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
-
-	regmap_update_bits(rst->map, offset, BIT(bit),
-			assert ? BIT(bit) : 0);
-
-	return 0;
-}
-
-static int axg_audio_reset_status(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	struct axg_audio_reset_data *rst =
-		container_of(rcdev, struct axg_audio_reset_data, rstc);
-	unsigned int val, offset, bit;
-
-	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
-
-	regmap_read(rst->map, offset, &val);
-
-	return !!(val & BIT(bit));
-}
-
-static int axg_audio_reset_assert(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	return axg_audio_reset_update(rcdev, id, true);
-}
-
-static int axg_audio_reset_deassert(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	return axg_audio_reset_update(rcdev, id, false);
-}
-
-static int axg_audio_reset_toggle(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	int ret;
-
-	ret = axg_audio_reset_assert(rcdev, id);
-	if (ret)
-		return ret;
-
-	return axg_audio_reset_deassert(rcdev, id);
-}
-
-static const struct reset_control_ops axg_audio_rstc_ops = {
-	.assert = axg_audio_reset_assert,
-	.deassert = axg_audio_reset_deassert,
-	.reset = axg_audio_reset_toggle,
-	.status = axg_audio_reset_status,
-};
-
 static struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -1766,8 +1688,7 @@ struct audioclk_data {
 	struct clk_regmap *const *regmap_clks;
 	unsigned int regmap_clk_num;
 	struct meson_clk_hw_data hw_clks;
-	unsigned int reset_offset;
-	unsigned int reset_num;
+	const char *rst_drvname;
 	unsigned int max_register;
 };
 
@@ -1775,7 +1696,7 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct audioclk_data *data;
-	struct axg_audio_reset_data *rst;
+	struct auxiliary_device *auxdev;
 	struct regmap *map;
 	void __iomem *regs;
 	struct clk_hw *hw;
@@ -1834,22 +1755,15 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/* Stop here if there is no reset */
-	if (!data->reset_num)
-		return 0;
-
-	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
-	if (!rst)
-		return -ENOMEM;
-
-	rst->map = map;
-	rst->offset = data->reset_offset;
-	rst->rstc.nr_resets = data->reset_num;
-	rst->rstc.ops = &axg_audio_rstc_ops;
-	rst->rstc.of_node = dev->of_node;
-	rst->rstc.owner = THIS_MODULE;
+	/* Register auxiliary reset driver when applicable */
+	if (data->rst_drvname) {
+		auxdev = __devm_auxiliary_device_create(dev, dev->driver->name,
+							data->rst_drvname, NULL, 0);
+		if (!auxdev)
+			return -ENODEV;
+	}
 
-	return devm_reset_controller_register(dev, &rst->rstc);
+	return 0;
 }
 
 static const struct audioclk_data axg_audioclk_data = {
@@ -1869,8 +1783,7 @@ static const struct audioclk_data g12a_audioclk_data = {
 		.hws = g12a_audio_hw_clks,
 		.num = ARRAY_SIZE(g12a_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SW_RESET,
-	.reset_num = 26,
+	.rst_drvname = "rst-g12a",
 	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
 };
 
@@ -1881,8 +1794,7 @@ static const struct audioclk_data sm1_audioclk_data = {
 		.hws = sm1_audio_hw_clks,
 		.num = ARRAY_SIZE(sm1_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SM1_SW_RESET0,
-	.reset_num = 39,
+	.rst_drvname = "rst-sm1",
 	.max_register = AUDIO_EARCRX_DMAC_CLK_CTRL,
 };
 

-- 
2.47.2


