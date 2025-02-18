Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A666FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E174y95QWB8sLP4kKdqQSVofl2EIrt9GShIhCjB+Tv8=; b=5CvP81nniI+z3FdGyctWcfDeyK
	vwuA2b3PmOSN7SE4VV0KOY+t+EZUoYc7OInISfpNJQ2DUBijpd+wnx1Bv4UbZRS9dIZ9ReOSAVPPK
	dEOZxfkRiVHLNFLv4QlyElsFobslDXQIXmW2DieaTrCGVyhgLA33w0hzEtanyY1P2ZaEq24zPoSyB
	QxvIAYpNEWFEG5XgLxxDoibeaIHBada8npcRxWGKwMg0OpbN8VbkJitDpO8lL9o2hrZttfsRMB1VI
	On8D+xP2PtWFXI34cUKKeFOKJ0XYbt28Mam2g0B16G7TWUbXfFQJ//zQ5q/0kNIkaV+OJ1976HsiY
	RPSlwOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUY8-00000009rEw-00zG;
	Tue, 18 Feb 2025 20:50:36 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTJ3-00000009aGd-2ThT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:30:58 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5dec817f453so10148910a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 11:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907056; x=1740511856; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E174y95QWB8sLP4kKdqQSVofl2EIrt9GShIhCjB+Tv8=;
        b=pLtjJ7loSzv0eAgM+ZsYCE2uQ6Atyda57pikXujev2PVauPBfhWCQkCn0PQEx9zYYE
         5Pw1Il1FmkKrW+cGrOMIQlrrZu4M5pMmozTRHA7usTS/LBRMqT/X4gWPedjUYK4f6AU5
         4PlYmEZaBlwy+Wr2KYPK4bhMftfq3jvidBWF/jM0xiP5WPrnPExiEPLl01nwzNzn/NSi
         we9wyuvIIz8K5rgM4WjRxUm+151MF9km+QciHgVgjLva/FY/QCo0t7G1v/QAicU33K8N
         bTAC3Wz3CNIHAtnzdRPGvc+7CtVpt2IxdW4j5+69gqyZa7WZPuQKqc7abvMbF8lDREve
         ILKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907056; x=1740511856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E174y95QWB8sLP4kKdqQSVofl2EIrt9GShIhCjB+Tv8=;
        b=Z4MVC8dMMWL4ceHVzPhHCABKpe/gzn4qNWahVKI0NngYkDF/Yae5Btmn/XUouQOuY/
         VShJa3C4FKrSURs/kYPNBPlMKOaNwNQ4EEhkTpTs9a/AZ/bE+f6fps8uPbGB0GGmnxN/
         oDox4l0uX8LFCp2a+kVnVLqlFmilT+qKRKV88QwU4G+C6wvNr9NEBlSixMg8xkdyBfs6
         dekAp5wpOou8qCAw/lm+vFIu2PdtKj9syUbaTHI7O/kyYNi3WGZs0yyW/XjWzdXX2D+Y
         7NduiguvT2XzfQUNcXOGpHhWkHJsWMueO4ZBWJUoO40rw+O7SK1EfBedpU1+Z5SzoJ/m
         B0jg==
X-Forwarded-Encrypted: i=1; AJvYcCVbYU+v1cIIC1vjRxuo/tv4j81d6Q9QHLTwrd+2Eo129ivrFe2LY45FBRu9ly0KtCU7HC6JFhNQWegDQ+VoZv00@lists.infradead.org
X-Gm-Message-State: AOJu0YxzVDrAsfaZgKdi45EPlL14MhGOl70+EpjJtxbq3G59bNttlvap
	lPXtPkAeXB95A8/yVfv7EiVxrT/S6jRNzijp/tLdwVb2QH4FaiIhDWqmZCtQopM=
X-Gm-Gg: ASbGnctKkY/t/f82AToedj09d9GeqW2Fu8U0cjUpTXv0ZK+8Ji4LIpqoXA/AhOsmKaG
	bg48uvqwUY02lDzoV4YDQXm+MtOmw23cwalbq3W3vOyUidrJHtePBbd89Svh5G8KAQK/4hun+Z9
	wLHJhwVWdJQnsiqVYe026s7+b0mTJl6AzwZVeh9UmuZbn8azbgp3Nxcv6IY8czGOOfhEvARDY3u
	5X3ylyPFZurqHTCbYQwtpZ5kEGjQsReeUDvpv2meRMVQfA5eHOOS+rEOzkO+UxU/OA35CUzzJ9t
	aj4ffKhnuskzf8eP8uB+4dtLZrC6
X-Google-Smtp-Source: AGHT+IH6dYXNSP6vLBRqe/ecMthhMu5dDSxKiguicPwszoCj13HXx3I+/2icxv2B1ExrsNYAjEdIdw==
X-Received: by 2002:a05:6402:2354:b0:5e0:4c04:4186 with SMTP id 4fb4d7f45d1cf-5e089d2fb1dmr614186a12.24.1739907056050;
        Tue, 18 Feb 2025 11:30:56 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:53 +0100
Subject: [PATCH v4 8/8] clk: amlogic: axg-audio: use the auxiliary reset
 driver - take 2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-aux-device-create-helper-v4-8-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5906; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QQ/ztLzccoD2euaC9XiJx7WBiQoWT8xupZIvkEt0604=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/VtNnyVBp1TZn2uakB3wDmrM70EYdAQGZ+h
 wV2jlYYVniJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf1QAKCRDm/A8cN/La
 hQBjD/0RTaMxkXwenpFzTWRtbkfYP170epu7rqTng51UkW5dx0c746c0Qrzw65ygwvKsO9bol97
 b/pX1khkHz4ELctHC0/gUmfugRQcCjQABsrNxkCDZbVBWRI7TKwaVoFcjcogbLRmvhkjiXSfa1S
 76FtH1DuaN7gQrQdnBBv1x7FKtahKBLyNkCamDmUN9/H+D4B5VUNpcymmgVRLIBszSinmGqPTL3
 MFDp0iDIpcxyoimExExtn7UXtiiqjTpiVC3WAuZQXY27zbMEjJJxtF7SWARmqxnkHPm4H6w4tje
 yctm1scmNxdLcnIBZBttjcu1TSntqESMEE4DFI03peNUvXuIL/XIFKO9EyRcTaq7T5JooFZ+uYF
 LjdTh5p1c+BdBEMRNBzCgChSerJ/F58X3dhAkb7BXDZfPr8Y2bCPMd1mwrJAwZRHh5EgJA5zdFo
 rSJu5S0ppYvzv4qYrPuiIwYXLpBN9djNeVshuwVJwGsoAJqs06vCyDgSjU/Wht/lVTA6m64V/xZ
 oA6dK3fHpBl5KIXSw65n854LYYRdWFln2yKyuGoYuso0i2Ib91Z91bnr/bzsBtM6h7s6w+3u2D3
 qcBQmOQ4aRSkyjclGXHc52MWgItdbJJ6s4Skitguub8FI3JxLo5cemUnME0vG2oMshqf0hDvQex
 S37+rb/FVdA14/A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_113057_662384_5E0635EC 
X-CRM114-Status: GOOD (  22.92  )
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
 drivers/clk/meson/Kconfig     |   2 +-
 drivers/clk/meson/axg-audio.c | 114 +++++-------------------------------------
 2 files changed, 14 insertions(+), 102 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index be2e3a5f83363b07cdcec2601acf15780ff24892..7cb21fc223b063cb93812643f02f192343981ed8 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -106,7 +106,7 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select REGMAP_MMIO
-	select RESET_CONTROLLER
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


