Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF05C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 17:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqRbWNLMFpR9KPwcpB1f2ftjk4mnZES8t+O0jPBCDUI=; b=vJLuWv/KTeO5m2P7r5H2YqwY/0
	UyaOvKX/9+HSAAc3G/XYbtbl6pJNuke+M8IdXKRPnWr6osbQ5fncN6NoHG+RAdId2ZM5QrpIG1smI
	1li0E3/mZ5wyLTNRhX6usJKAPItds3jPQJldSSVdlP2Up7XVFT9QOcR55Xelw0u+XdsD2YrLdv7CV
	nAphN0YB8ZNdc9sK4FVAqbNXYomWZOQgSsU3iqeeOGMwLGmgWi9hWSrPRrIGQtLlxQNAV2T7K/qSt
	Vj8F5wZEDE8RyGOCjwRJ+TWMBcbvdhbb1zO8/L5GTfZaZTNwfE1F6dQAgE5V2UUMoIynsxRPF1FUU
	yULNe3ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKj0-00000000sb7-30CY;
	Sun, 09 Mar 2025 17:46:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKRb-00000000pu9-0wC4;
	Sun, 09 Mar 2025 17:28:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso36383505e9.1;
        Sun, 09 Mar 2025 10:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741541286; x=1742146086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqRbWNLMFpR9KPwcpB1f2ftjk4mnZES8t+O0jPBCDUI=;
        b=E6VwEzESA+sxqWZn+R6fmaRod/5nyyNB/jqPvc9KjJKlCCu6yIV8DLaeuXcdhyJpZa
         bBRD8/fcZuENO56aa4Hnf9urr1tfFnJrLpjLRvgEx0NLBdvvXyHqFkjGByoIouEFa7S8
         0ZisuUv+kiOv55fdjdnw0A5W6v6fF6yaX6PKjA+KNuKj+wEA4n3PJo5hDqmHtTLQA/pf
         XEIBzPHx3T2ILodU7LTGpCi7Duy62Jo9bpKfGxG+OfH0+aSZQa/wILl77XWn41lQGY6O
         dw46bgXrUHyjc1lMfHcPjHX7Z3r8duQyCZ7Z0vh567TfthPHrUMBntbA4/hYKxShPeaO
         8L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741541286; x=1742146086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqRbWNLMFpR9KPwcpB1f2ftjk4mnZES8t+O0jPBCDUI=;
        b=HkIKD1UKkcDewRrmoODuxCS7l4ETNA2Uv5cGCoPHh6DV5XgovBHWSQZUxAJ/d7EB9a
         jEQbeM7QVZ1S4fuKWEydDafgXaYyZTi+uuz97yawI5L5A2hruMedoG1/w+zLYvaIlKHn
         QR4fGmsnaOLxTiGFV037+dAuem5+/p1CuWC8xqZCnOzrsRtUjCMSMWyUcHPl+N42yOgO
         g68nbB259lqRYT9Cwq4A3dwUpDoxuCMzYSTvyQdkPlzlBK6fNS2YQjjDGZFZSIDRb1Wv
         17qlzu3gPjL4WjyO2pPK1YE0TgVoO6J7xB1/2q8BQarzgQFCId3DmZ6x/gkYXPw+K8N5
         IHDA==
X-Forwarded-Encrypted: i=1; AJvYcCVSHxdF575uFUdSvHT7+iOpdFlCU1pUDyYIcNWJWff6kt/OUSCvNttXUyBRBzXiJRgWFDpky4yUes7cEBvbzdiK@lists.infradead.org, AJvYcCWs5LbOz+eCvuTbxJykXeItyr7G+g0JJ7kIq735VOFOjZPa0Dx4FhOXQbFsyT+sdbGqHqc71xgfMl43P2Jw8lg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlIKm9ZEwSGt1RoKU3P54IaDMERDfqxQwb0KcKu82vNpodtiUy
	Ue8p/DHPZWef/SLGKB1xYMcnaKOOHZe1WNWF06xu1lZ/gNa5ZLSk
X-Gm-Gg: ASbGnctFAZUaO64TZgEVv8369qBvpZBhwQW7UmY9f/9dyH/aA0XJNlmS7qOcwtKBU19
	P1i+YGB4DEtiYOxoADR0btItuaT3HZdkFNGKQHG+G1d7fNAA73orD8s2LaEEdXTRNgKOm6amUZL
	xBGIUjuPcHNiy3oC+kYognrslWRV4Eb3Us3BbCtYO09Yyo4j759L2lSxRkgcWH9sOCf0B/xmbJc
	uZVLmvwX+OIkH3NzYNne9p+Mqip1WyYEooHL6tshxaaSkNfGvtKxNmbwGtlWRWV3RJ7FRlQbZg1
	JcqWuoIN3Lj2hvJTTiLvruZEyEqn75OY4BvRXz2Ap5zrPiqOsPVTpU+8NlSoiTMdWCScg/QdV5T
	5yR8FgS2hCtp7mg==
X-Google-Smtp-Source: AGHT+IFD6AOwaOvthj1obMUkhcjcWW9Lb99/pnRyiMlPx5q3ab4zfTAV4SciIOYGcWdGBwDwsHL3cQ==
X-Received: by 2002:a05:600c:4fc5:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-43cf9691636mr3314145e9.29.1741541285689;
        Sun, 09 Mar 2025 10:28:05 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bfdfddcsm12564875f8f.35.2025.03.09.10.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:28:05 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v12 10/13] net: mdio: Add Airoha AN8855 Switch MDIO Passtrough
Date: Sun,  9 Mar 2025 18:26:55 +0100
Message-ID: <20250309172717.9067-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309172717.9067-1-ansuelsmth@gmail.com>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_102807_261704_B57A7ABB 
X-CRM114-Status: GOOD (  22.26  )
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
 drivers/net/mdio/mdio-an8855.c | 48 ++++++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 drivers/net/mdio/mdio-an8855.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5844addbda2b..8c83c446a69d 100644
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
index 000000000000..d45f71c4b0b1
--- /dev/null
+++ b/drivers/net/mdio/mdio-an8855.c
@@ -0,0 +1,48 @@
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


