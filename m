Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2027FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kX3ghmSADof/fdYKGzDtB/q8+rQu9IUcD4dmFIXduMs=; b=KAIot0fVfy5mxKhjYC7vfATXsk
	vyQThdo5uYsDtNn2gXTph9932GOSE5NmYWGadPF0shV0wSEYT0JrSEahS95zBZ9DsdKrC84Fpc1mt
	8uLFngLRw/7886Qqgimzz6pXgOOaqET4VDiWC6RF4CFkpNbbpV6xnwcpb8WvEyIDbUdpQvWs4Kl43
	T12nRpqd6GZXeEHIcInMS/BVgh4CxSCfjM3oFQcUPkD6Wodv66ha/b+kiJqlTIbTsmzn8H1A4JNHL
	xbip1f4FXl9BhrhfPC2O5ziSOKKgHCeGR/X2EDbD5P0rw4jI71U0lVuUlNZYzbsvDvxik6oUl6vxJ
	y6JPXbKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHl-00000004iUF-09BQ;
	Tue, 11 Feb 2025 17:43:01 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu3u-00000004g7N-39NE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:28:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38dd93a6f0aso2178495f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 09:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294921; x=1739899721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX3ghmSADof/fdYKGzDtB/q8+rQu9IUcD4dmFIXduMs=;
        b=YiAJsWd+HCulJZwgeyfxeb01pAQnQdwIKH3gOwx/7ULtH3yN9nEyoMqtg66nH1FxxP
         KSgowKoUVoSyTAGU/DfoQgyJMf/rwJduWlRmZmbncCsO6UIeuNDU7y2evUqG7akasRP1
         4fn3le4Bk72sx7rYDuGtGRTPxYI4FX4rSf7cwM3OlputMAf6seJAgV7Vo6jsnki4WRx0
         m7FBnbxBjc4CjRxMNZUWPiGTTdAMpHK5pb30aPc56k2vzaAb7cN9zlZmH0pTn50uZaHG
         sFS/u35c4//H6GQ60O3GazZyn9XWu2APlQL34dbAKtjKpH0bRpVpl5W+Kh5fQVy5PG/s
         3B5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294921; x=1739899721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kX3ghmSADof/fdYKGzDtB/q8+rQu9IUcD4dmFIXduMs=;
        b=Q/G1uWXvCtEL7u77a4dLcSo746wSKcItwDZl78jbLgKzL8+qsLJ5Trd3w6msKGDeWb
         y2EZT3UQO3+fcMJSaRgGxvEMCgpnjeOPG5OpKsn5RkmrW9KzRCNwIdQ49QG1TKar9O8t
         8R3orkLR5gILaxeGSnJAlxFC5bltBExJH7LECOJYlF6PgGZ3eHBGlEzb7YlNs5VeouR3
         psiSSSmfcjxv7Z1KPTM1L9Fa9WjF6hDO6Z3EDSSBXQhu6WvJMtpQMS6cTRUVPbMGryXi
         3ceaT7lwVMwQpPS6A9nmYO+dXz3WJHkEZMYRgqhBmCuMnoKtzI0sLk3GYMWEy0m65F5O
         zzrw==
X-Forwarded-Encrypted: i=1; AJvYcCU9g/vJtGznTpkJ7Cm32yITLAAchESVDEUZGg9wiSzaKauR1dZKh/Di/dT3UnHBhLLiF0iVX0OIOXMUb/s56dMu@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq1oTbNuvuMeVR+oeOo3QjjJSUPnkGI951oTPoiRMdKjmfRSVB
	UlCxQFp6SzLrLSQ2hBXa30VzvO+geviVG5+hZ+10nOaKbZUvQLYZlsLvz1LpLIg=
X-Gm-Gg: ASbGnctvMwCoYNWT+agsptK+QiTwsZFM2my2uaDph9wZGYh59rUdVJv6lFc0fz/jQje
	PyUGeGgpTkWQoLvk2Hy6gWwDDgEwxFMR5fKlxt1QHMjDuVYSdmvYibN07DX2ika1F99WteUAbRF
	jOiZPhbBrW8LotRjepf2GpjqqNYXPftRyo0Tkyd57Q4KhafENaQ4tdgdam5JjlbtbBVQRpC2svG
	z1dq0zJufU9wHz78EpX2YM/nqLFrnR8IMkT8Cdqj8zPi33az6s/LnuNDsjNaItrU1kIhtL+tnZp
	bd49hiaHYLHPR3gpnA==
X-Google-Smtp-Source: AGHT+IHNZKomgYXqcV4iueNtMWjdqrJCqK18R/l4YoIndkgvWwENIn/juV5TQLvLjyHtq/y8uwbzbg==
X-Received: by 2002:a05:6000:154d:b0:38d:e481:c680 with SMTP id ffacd0b85a97d-38de481c6d6mr3134750f8f.18.1739294921265;
        Tue, 11 Feb 2025 09:28:41 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:40 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset driver - take 2
Date: Tue, 11 Feb 2025 18:28:04 +0100
Message-ID: <20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5921; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=TI3PyQ4RBlsYvn/3ym2zOR51oxwz92ZVC/TIhelLgEk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g7rK2qbvDSMWo7y7IKYVc4VNag+NKBkBwBX
 7AivAacwaKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uIOwAKCRDm/A8cN/La
 hbzVD/0aQSeKG38/WN0LzdAbQTHjP8c2dJCCutKqih2e3zHr0RKjaYamy5oVuPOh498VVAmF9cn
 JeAalYPQoR3MZ8oiPIpwNYFmdLz9SdTLYUF+PKdNWbORrKgBWRKu2ivLUtegcvaJUMhHO5Ix5bG
 CrQz74Dt9ScsD6/j3QRGph2BODHh8TbsywwrMIS5K/urLzgDSwanjOPXFfQzQfbJMYU09h3YUDs
 e3xEkGsqD9aIqFiYJHTVPTMJ/+vbqp334Lqc9hnPqgNJcOoDO193NJiXYa1yVU95vo/72i38MBq
 3crANEecIqg7ti6Gz60LNk2WTZAFJ3gZqhxhQr/imfzRiZ7siLD3ZjmPJPZ1b4owNJscGsqQG2/
 PswDJyFP788jPnd1LdniQrVQWuYG5yUzBu7jJyinlYAY+MgUcgelAC9bt7VKJNydWJLWbheq1O1
 JVY2z1C35EIyV8hU1Gd4eAUofbzasGlOz8CjvwQrMAv+ip84NLLoqzvnvJGgRFm1igRtkHWw96X
 oHd1iR7mYoTUtOPuC+NQWLoZ7FhdSXsAbCawy/ai4kYIx0SwT/S8WQV+WfxcSxkir99fqoEjLso
 XAYvea00nIRJBgjfT5Kl03ruc1yRSK0CM6ZpO6eN7w1Kf14T+sfeD13r5XgO16wfSNJVWGktDas GH37TQ7hJz+6o9g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_092842_915519_777FCEE1 
X-CRM114-Status: GOOD (  30.76  )
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
 There has been a discussion about the use on imply here.
 After re-reading the documentation I've sticked with imply in this
 version:

 > This is useful e.g. with multiple drivers that want to indicate their
 > ability to hook into a secondary subsystem while allowing the user to
 > configure that subsystem out without also having to unset these drivers.

 IMO, this is a pretty accurate description of the use case in this change.

 The pitfall mentioned in the doc does not apply as there is not link error
 regardless of the config of RESET_MESON_AUX.

 I also think this is more readeable and maintainable than a bunch of
 'default CONFIG_FOO if CONFIG_FOO' for CONFIG_RESET_MESON_AUX. This approach
 also would have several pitfall, such as picking the value of the first config
 set or the config of RESET_MESON_AUX staying to 'n' if CONFIG_FOO is turned on
 with menuconfig.

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
index 9df627b142f89788966ede0262aaaf39e13f0b49..6d798705c5fd1e6190192294783c955fc9be1e21 100644
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
+		if (IS_ERR(auxdev))
+			return PTR_ERR(auxdev);
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
2.45.2


