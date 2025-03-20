Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D27CC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjXZXNCMR7AMS8CMSFsXOaQrfC4KYnxI7xnrEz3bVbs=; b=cGbln7oj9UGAcjt015n82uFH2a
	t98+eZX1BO8VFUhwLYHL+fTBUd06t2l8PGJK7wCFYRNS0z2DXzDVBWFOaQF/p2wnI1lc3FRofIi62
	vc7DztpatPt0lDkBGmYqmBm5AcGzpjeMe7nGmjOPz5mL2L5douV6sRcsc+4w3M7t7P4iGlZyVFXRc
	Y+zVKsH5fRJt5NuXuD1ORYLFX7koa3GOyVlDk2ccysBRkwjA0w9jDH76lAmuzIsWAQECVzQ28h8CK
	QKtSBQtfBVnAWXvrQcqD4tKL1wsFPvHBuuoWedKJIQWvFv/9x09dOYhjGY02ZlIRkq9YiTxHB2i4O
	NvRrBQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFuS-0000000CE98-0qvm;
	Thu, 20 Mar 2025 13:26:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFWn-0000000CAdg-19ar;
	Thu, 20 Mar 2025 13:01:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so4531255e9.3;
        Thu, 20 Mar 2025 06:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742475699; x=1743080499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjXZXNCMR7AMS8CMSFsXOaQrfC4KYnxI7xnrEz3bVbs=;
        b=DApH5j6GCF3U4HyXypErJkJ84L5zaurbPinbOWMm6ItHQB2bvvhq6EedjZDUbKGEVN
         AD/db2csFkpkM940ot8k0C43lNQAaQJe8fxX4ygN6KZoUEsxM8n+di7+0aTY3nfANArx
         nuiwDR4isWRU1Vp2gNZMwtKbqqsQjU1BhPRAZadOem5ZeJw6cX93fs+hHhRaJUJYQex9
         NEZvspZfCrXd5JL6g9GIaCQr5ml9qK/UaA5XFIV5o0BGizkxmCJDBpsI2Uh4hv3L6Smf
         +bcHg3HFOWEws55H31PQ/mPTkTZybbTceloX2i0zRXH5clM+49SiW8YSBplRFBqJWyef
         5RQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742475699; x=1743080499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjXZXNCMR7AMS8CMSFsXOaQrfC4KYnxI7xnrEz3bVbs=;
        b=oXaHct9KG7pvhGYp7USgcgtEwDAQBYBtQeARzfeZs2d0u5jyhWDpCfNq82deFhhcHM
         CDZrUlPU7y56I7M/QcnjKBsmR8bdmySyBMGfwHNQ0kxxQH1CZFTQR3QOjT9BBAZ+APUj
         oMgG0Qhyk8j1mc1cL3mlMnRiitSwfRGZ8mDhRu8i6xEmJtkQ5fWhr286PDuuSjhSh81p
         EXedz0NPnsMS+9InUdEbLJd/S6LuB1Ugmi7lcg9Py7zHTLhMXGzNKNXDUQZMmfh13cSk
         x5W5ZKkDsZmQyIuyL/8iSHEk84S2Ygb7dt6kvU+k4YyRhXu9WOwlY2XRwWXH8RYG8ZSb
         m1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqITBAyOsYzzAocbRB/El5uwlf2TjLxufpbQt4YqdVuy7zh2EIgaBs2aQC37pq6ldpIXo/dMh2iSZMOV/U/b0=@lists.infradead.org, AJvYcCXZFTCKtMhB+Fh1TEvbt/ybr7lqZWbREfUwgBG3480nanj8Fv/BasYdz2RBXCTXdkM6EM2IcAqcqm02TxbbDjiL@lists.infradead.org, AJvYcCXmkAfHrwHt7sEIy7HFBMm+l4pLRzFrHDC5n17kXpy2j9pxdbz22STGjDRHIg4Ra7iV28e5T4GuQGp9@lists.infradead.org
X-Gm-Message-State: AOJu0YwNZRht9GH4Ot5RYskY5vuKHtA9Af1IHFNKPmcFin6NgVhSdI/Z
	2C2oXF7niML6B45ISBdDKmojUQLrKuIAableKC8S4v7WeDk6R6j5
X-Gm-Gg: ASbGnct1VWKiee31vRhxQVL5w7J3VU2MZjnOAEsbmfTL69Hl4KPw632FKwZo5rs8cR1
	FVVmZ4OdZZbY04KQ7fmX5WO0IlAyXKk2G731DbCDGu/6JVDIcJ/jseXBl49BEttw/JHPppGB6+1
	jlbtaNSgOYRFq4WYNOW+i90uURCBs4agqn4gRo/buC6w3JSQyo6gHblNFr5gSX7rgYJEBXuMH6w
	Eht7RBKPtpFHUZWmwaPVs8I0ZI/9x2eK7jDYBx5l4WUZmmloSMVaY+y1QIuV1iGiomywXCCBEbC
	GHP6+Han//+gmmxMBFIp71cPXAfMm7o8U1q1HKne+8CNA2Od0SAr9tCemkPeYBvbPWqFEBgvCDr
	2XhXiaj2nBjVVs9HLE63aYwat
X-Google-Smtp-Source: AGHT+IGmkDnnkoASLNKc7beCB36KTynfhE5+lNlk/tMYqhdW/dQRvuIWvPUsIp9fafc4LTtsm02Xxg==
X-Received: by 2002:a05:6000:186b:b0:391:2a9f:2fcb with SMTP id ffacd0b85a97d-39973b028a9mr4710707f8f.36.1742475697214;
        Thu, 20 Mar 2025 06:01:37 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-397f2837e61sm18492328f8f.97.2025.03.20.06.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:01:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 05/11] clk: en7523: define and register SoC SCU SSR driver for EN7581
Date: Thu, 20 Mar 2025 14:00:28 +0100
Message-ID: <20250320130054.4804-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320130054.4804-1-ansuelsmth@gmail.com>
References: <20250320130054.4804-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_060141_314604_DFB63E83 
X-CRM114-Status: GOOD (  24.37  )
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

Define all the possible interface modes and register the SoC SCU SSR
platform driver for EN7581.

Failing to register the SCU SSR driver is not a critical error (example
the SoC driver is not enable) but will prevent PCIe or USB port to
function correctly.

Reference to the SSR pdev are stored in the new en7523 priv struct.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c       | 99 ++++++++++++++++++++++++++++++++--
 include/linux/clk/clk-en7523.h | 10 ++++
 2 files changed, 106 insertions(+), 3 deletions(-)
 create mode 100644 include/linux/clk/clk-en7523.h

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 2a74bc8fed24..1f11fa769090 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -3,14 +3,17 @@
 #include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/clk-en7523.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
+#include <linux/soc/airoha/airoha-scu-ssr.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
+#include <dt-bindings/soc/airoha,scu-ssr.h>
 
 #define RST_NR_PER_BANK			32
 
@@ -81,6 +84,7 @@ struct en_clk_soc_data {
 	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
+		       struct en_clk_priv *priv,
 		       const struct en_clk_soc_data *soc_data,
 		       struct clk_hw_onecell_data *clk_data);
 };
@@ -361,6 +365,51 @@ static const u16 en7581_rst_map[] = {
 	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
 };
 
+static unsigned int an7581_serdes_wifi1_possible_modes[] = {
+	AIROHA_SCU_SERDES_MODE_PCIE0_X1,
+	AIROHA_SCU_SERDES_MODE_PCIE0_X2,
+	AIROHA_SCU_SERDES_MODE_ETHERNET,
+};
+
+static unsigned int an7581_serdes_wifi2_possible_modes[] = {
+	AIROHA_SCU_SERDES_MODE_PCIE1_X1,
+	AIROHA_SCU_SERDES_MODE_PCIE0_X2,
+	AIROHA_SCU_SERDES_MODE_ETHERNET,
+};
+
+static unsigned int an7581_serdes_usb1_possible_modes[] = {
+	AIROHA_SCU_SERDES_MODE_USB3,
+	AIROHA_SCU_SERDES_MODE_ETHERNET,
+};
+
+static unsigned int an7581_serdes_usb2_possible_modes[] = {
+	AIROHA_SCU_SERDES_MODE_PCIE2_X1,
+	AIROHA_SCU_SERDES_MODE_ETHERNET,
+};
+
+static const struct airoha_scu_ssr_serdes_info an7581_ports_info[] = {
+	[AIROHA_SCU_SERDES_WIFI1] = {
+		.possible_modes = an7581_serdes_wifi1_possible_modes,
+		.num_modes = ARRAY_SIZE(an7581_serdes_wifi1_possible_modes),
+	},
+	[AIROHA_SCU_SERDES_WIFI2] = {
+		.possible_modes = an7581_serdes_wifi2_possible_modes,
+		.num_modes = ARRAY_SIZE(an7581_serdes_wifi2_possible_modes),
+	},
+	[AIROHA_SCU_SERDES_USB1] = {
+		.possible_modes = an7581_serdes_usb1_possible_modes,
+		.num_modes = ARRAY_SIZE(an7581_serdes_usb1_possible_modes),
+	},
+	[AIROHA_SCU_SERDES_USB2] = {
+		.possible_modes = an7581_serdes_usb2_possible_modes,
+		.num_modes = ARRAY_SIZE(an7581_serdes_usb2_possible_modes),
+	},
+};
+
+static const struct airoha_scu_ssr_data an7581_scu_ssr_data = {
+	.ports_info = an7581_ports_info,
+};
+
 static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
 {
 	if (!desc->base_bits)
@@ -557,6 +606,7 @@ static const struct regmap_config en7523_clk_regmap_config = {
 };
 
 static int en7523_clk_hw_init(struct platform_device *pdev,
+			      struct en_clk_priv *priv,
 			      const struct en_clk_soc_data *soc_data,
 			      struct clk_hw_onecell_data *clk_data)
 {
@@ -661,12 +711,38 @@ static int en7581_reset_register(struct device *dev, struct regmap *map)
 	return devm_reset_controller_register(dev, &rst_data->rcdev);
 }
 
+static void en7581_clk_register_ssr(struct platform_device *pdev,
+				    struct en_clk_priv *priv)
+{
+	struct platform_device_info pinfo = { };
+	struct platform_device *ssr_pdev;
+
+	pinfo.name = "airoha-scu-ssr";
+	pinfo.parent = &pdev->dev;
+	pinfo.id = PLATFORM_DEVID_AUTO;
+	pinfo.fwnode = of_fwnode_handle(pdev->dev.of_node);
+	pinfo.of_node_reused = true;
+	pinfo.data = &an7581_scu_ssr_data;
+	pinfo.size_data = sizeof(an7581_scu_ssr_data);
+
+	ssr_pdev = platform_device_register_data(&pdev->dev, "airoha-scu-ssr",
+						 PLATFORM_DEVID_AUTO,
+						 &an7581_scu_ssr_data,
+						 sizeof(an7581_scu_ssr_data));
+	if (IS_ERR(ssr_pdev))
+		dev_warn_probe(&pdev->dev, PTR_ERR(ssr_pdev), "failed to register SCU SSR driver.\n");
+
+	priv->ssr_pdev = ssr_pdev;
+}
+
 static int en7581_clk_hw_init(struct platform_device *pdev,
+			      struct en_clk_priv *priv,
 			      const struct en_clk_soc_data *soc_data,
 			      struct clk_hw_onecell_data *clk_data)
 {
 	struct regmap *map, *clk_map;
 	void __iomem *base;
+	int ret;
 
 	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
 	if (IS_ERR(map))
@@ -687,7 +763,13 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	regmap_update_bits(clk_map, REG_NP_SCU_PCIC, REG_PCIE_CTRL,
 			   FIELD_PREP(REG_PCIE_CTRL, 3));
 
-	return en7581_reset_register(&pdev->dev, clk_map);
+	ret = en7581_reset_register(&pdev->dev, clk_map);
+	if (ret)
+		return ret;
+
+	en7581_clk_register_ssr(pdev, priv);
+
+	return 0;
 }
 
 static int en7523_clk_probe(struct platform_device *pdev)
@@ -695,10 +777,15 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	const struct en_clk_soc_data *soc_data;
 	struct clk_hw_onecell_data *clk_data;
+	struct en_clk_priv *priv;
 	int r;
 
 	soc_data = device_get_match_data(&pdev->dev);
 
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
 	clk_data = devm_kzalloc(&pdev->dev,
 				struct_size(clk_data, hws, soc_data->num_clocks),
 				GFP_KERNEL);
@@ -706,11 +793,17 @@ static int en7523_clk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	clk_data->num = soc_data->num_clocks;
-	r = soc_data->hw_init(pdev, soc_data, clk_data);
+	r = soc_data->hw_init(pdev, priv, soc_data, clk_data);
 	if (r)
 		return r;
 
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (r)
+		return r;
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
 }
 
 static const struct en_clk_soc_data en7523_data = {
diff --git a/include/linux/clk/clk-en7523.h b/include/linux/clk/clk-en7523.h
new file mode 100644
index 000000000000..fc3b320dc7e9
--- /dev/null
+++ b/include/linux/clk/clk-en7523.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __LINUX_CLK_EN7523_H_
+#define __LINUX_CLK_EN7523_H_
+
+struct en_clk_priv {
+	struct platform_device *ssr_pdev;
+};
+
+#endif
-- 
2.48.1


