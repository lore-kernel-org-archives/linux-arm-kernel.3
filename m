Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67644C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 16:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4y4aJLpRHg93RygCDV746A0LLkmeQjNEa/sOSVLGr8=; b=E4QSFat33QTWmBn2Z7BigwPyLP
	WFzI3awxh2G6g9AhMMp6XXlT1Q6vMZAxY8Fz0qk6VblsyAwCb8Ew6Kufp7YRRKWjo52S+0VrmFoLW
	AYJM8LtSrW9enKtQTih39ShhVNHct1j7Qlf8coz/O8cUk+O50eF4Jx4Rw1RIu5PpMZ1unleOgOaQy
	1yrAlprakfD6xgQOrH7KrA73RhA3ZVutdelevdxLx32kb59jM+IMcuaO7PXg+kMesE1rWVycX1Tqt
	j/o9Qw5GnWjyI0ajoRyhpwbo4ySni7iB+pXEVB0F6lRsxKLgVL4IY9ZTEbh0A6gx5cyVIcHKcI/RY
	m3mm3slQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttU0i-0000000GZWx-1RUT;
	Sat, 15 Mar 2025 16:05:16 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTh5-0000000GX5Y-3YFu;
	Sat, 15 Mar 2025 15:45:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43d0782d787so4706725e9.0;
        Sat, 15 Mar 2025 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742053498; x=1742658298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4y4aJLpRHg93RygCDV746A0LLkmeQjNEa/sOSVLGr8=;
        b=WsaIkHa1e1zDlhq1sho7cgy0SCGhQPPQXu3/e6GpiSP28FJOCFiO53jmagTK2Wkl/M
         YavKZiZkGwVyeq92rMvOu0o7Ch+Mc+YH+YCzmRs/5IqhH9GWogpwFD3FFybWBns3grjo
         +0nwxW2hhStBHhFWJgFtRy3Qnieo6W/S2XtiyrtcFaodfgwUIisN1jQNqxUga+dlePaN
         uc5qpeTl64Mf6lJ7N6MBaDR/Gttk05EPO2nFHNZVsCBQudiRGThbvrBQzjQig+DZ96WU
         1jLvqiPjgQaK4Gi6AmbF2AWrLSQn2w+v4a0l2rJrwCPc5E03+wbxgq48HoTBtv4t/fA6
         neKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742053498; x=1742658298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4y4aJLpRHg93RygCDV746A0LLkmeQjNEa/sOSVLGr8=;
        b=BLfYD/YPpdELpRHsnhySt0fAo3/2Mkm99Z6NaFx8i7V//JeGl3jL1/wW5nNpCcOkee
         FFqXYbIDUMZKQbMeYkC2KpaT1y6dVowtz3yuwdzTRnR8RD5zgwaLxn+XVrJIt0Pygnb8
         aVWwOsQzwD3CRj94JqshorXM3vkDupQwL2kC2wH8Jd4fJzBfJPc7uHa+u05w71GwjSff
         Dah86vPMHuBBkeGecFyGRDnQIFaN99eezAxOC5yF8sGVmlIx8kUaagweUtAcQ8G5GTa8
         NS5tCEEbo1lXUat5EjomVTj9ip7Whji50RP9bXrWZRIk+WuYCJUDNAwaXljiX/Qy/JWd
         mz+g==
X-Forwarded-Encrypted: i=1; AJvYcCUQxvU61Q/TpgrtQZNPdxRkWXOPvOtGVhh1dLkGzIZw1/n4JiouBg5KWGOxj3+DvgfUxRW3nyH+aLYS7j17qkA=@lists.infradead.org, AJvYcCUwMx8A9IBap+ZsVoT3mYerotIgv1yHvIGqfBzP8OgkikeXTQyJvxo0AM4cqsjxTGsGar/fbP5ZWcUsAF4//LhV@lists.infradead.org
X-Gm-Message-State: AOJu0YzaFiIZtJLzs8j4xLfjYI3/gZfJgnvNxqWU9xcKtlGHPpLzeKGP
	bk9Z0c646dOPJ+VMSPogZLGc8ec/8yEqPtAI9UbCp/A7oCK4KBkO
X-Gm-Gg: ASbGncuuKbUakD88BEyJk2u6QxJ66acVcpkUSDy1cM9k9EBcyKmYAivnVXuTMl7qZLz
	nzSv42l801iiplejT4/qNpoAW/K60lrKNdlk9H3zGgWkKJogoJb0jtGOEwvb8HaaE/GF2n2G4+J
	jzsHQYmns6NUiukIEMX9xaZ9qukrk9UGTLQc52oC/LGrLxCqlQdfmCx/Nx3VliDaletOYnJSGHS
	CusnNgvgy7HfZwukvsX8p4Ymewht2+Tb7SBXx+BDdk753Ydb07T2CSnErvTrN9BhcAx0yRWWeMK
	k/Q7t27frqXfoy6IWu2Nh4UDGOOzGxSKh3Aa47Q2KJsS+c39LVDx3zjeNGCHz2A5e39g4fNExNt
	tm+yw7aHS11IhYufoUVCCzPf/
X-Google-Smtp-Source: AGHT+IHdZpkFNBjA6COduNegwovJkZNCckMp9sNMex24ZFcOREOSr4DDptLMW0v+z79ptMTJ93Mulg==
X-Received: by 2002:a05:600c:4f46:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43d1ed0ea8dmr86614825e9.31.1742053497868;
        Sat, 15 Mar 2025 08:44:57 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d1fe0636dsm53464195e9.11.2025.03.15.08.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 08:44:56 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v13 11/14] net: mdio: Add Airoha AN8855 Switch MDIO Passtrough
Date: Sat, 15 Mar 2025 16:43:51 +0100
Message-ID: <20250315154407.26304-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315154407.26304-1-ansuelsmth@gmail.com>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_084459_884044_5512B945 
X-CRM114-Status: GOOD (  21.64  )
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

Add Airoha AN8855 Switch driver to register a MDIO passtrough as switch
address is shared with the internal PHYs and require additional page
handling.

This requires the upper Switch MFD to be probed and init to actually
work.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                    |  1 +
 drivers/net/mdio/Kconfig       | 10 +++++++
 drivers/net/mdio/Makefile      |  1 +
 drivers/net/mdio/mdio-an8855.c | 49 ++++++++++++++++++++++++++++++++++
 4 files changed, 61 insertions(+)
 create mode 100644 drivers/net/mdio/mdio-an8855.c

diff --git a/MAINTAINERS b/MAINTAINERS
index aec293953382..f4c8054d3980 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -731,6 +731,7 @@ F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
 F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
 F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/mdio/mdio-an8855.c
 
 AIROHA ETHERNET DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 4a7a303be2f7..e31a37064934 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -61,6 +61,16 @@ config MDIO_XGENE
 	  This module provides a driver for the MDIO busses found in the
 	  APM X-Gene SoC's.
 
+config MDIO_AN8855
+	tristate "Airoha AN8855 Switch MDIO bus controller"
+	depends on MFD_AIROHA_AN8855
+	depends on OF_MDIO
+	select MDIO_REGMAP
+	help
+	  This module provides a driver for the Airoha AN8855 Switch
+	  that requires a MDIO passtrough as switch address is shared
+	  with the internal PHYs and requires additional page handling.
+
 config MDIO_ASPEED
 	tristate "ASPEED MDIO bus controller"
 	depends on ARCH_ASPEED || COMPILE_TEST
diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index 1015f0db4531..546c4e55b475 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_ACPI_MDIO)		+= acpi_mdio.o
 obj-$(CONFIG_FWNODE_MDIO)	+= fwnode_mdio.o
 obj-$(CONFIG_OF_MDIO)		+= of_mdio.o
 
+obj-$(CONFIG_MDIO_AN8855)		+= mdio-an8855.o
 obj-$(CONFIG_MDIO_ASPEED)		+= mdio-aspeed.o
 obj-$(CONFIG_MDIO_BCM_IPROC)		+= mdio-bcm-iproc.o
 obj-$(CONFIG_MDIO_BCM_UNIMAC)		+= mdio-bcm-unimac.o
diff --git a/drivers/net/mdio/mdio-an8855.c b/drivers/net/mdio/mdio-an8855.c
new file mode 100644
index 000000000000..22d199942f1c
--- /dev/null
+++ b/drivers/net/mdio/mdio-an8855.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * MDIO passthrough driver for Airoha AN8855 Switch
+ */
+
+#include <linux/mdio/mdio-regmap.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+static int an8855_mdio_probe(struct platform_device *pdev)
+{
+	struct mdio_regmap_config mrc = { };
+	struct device *dev = &pdev->dev;
+	struct mii_bus *bus;
+
+	mrc.regmap = dev_get_regmap(dev->parent, "phy");
+	mrc.parent = dev;
+	mrc.valid_addr_mask = GENMASK(31, 0);
+	mrc.support_encoded_addr = true;
+	mrc.autoscan = true;
+	mrc.np = dev->of_node;
+	snprintf(mrc.name, MII_BUS_ID_SIZE, KBUILD_MODNAME);
+
+	bus = devm_mdio_regmap_register(dev, &mrc);
+	if (IS_ERR(bus))
+		return dev_err_probe(dev, PTR_ERR(bus), "failed to register MDIO bus\n");
+
+	return 0;
+}
+
+static const struct of_device_id an8855_mdio_of_match[] = {
+	{ .compatible = "airoha,an8855-mdio", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, an8855_mdio_of_match);
+
+static struct platform_driver an8855_mdio_driver = {
+	.probe	= an8855_mdio_probe,
+	.driver = {
+		.name = "an8855-mdio",
+		.of_match_table = an8855_mdio_of_match,
+	},
+};
+module_platform_driver(an8855_mdio_driver);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("Driver for AN8855 MDIO passthrough");
+MODULE_LICENSE("GPL");
-- 
2.48.1


