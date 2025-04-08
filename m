Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E8BC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3/BY8PYvNQdk6fZrNkLE1hVwik+/X8XgJnJ+/zsRwY=; b=A0FrCO9rAYCu9CjZ3hbB5Vq7/d
	OkAdK+dzAwy87uVVzwUxl6l74sRyczsY6j2te4MFBK5+c6B81F+QR8aziGSqYS+37/YEoaMaaokb3
	Rn0QS1CCJXHkbZU74x6TWPBNwP8UYi9M3WhwnoXUp7byFwipRWhlsu7LDaSS6hij6A0FXoGrd9QvT
	6bYZFy6OaJgnrMqxO5rgx+kHkC/UyJR5TkZZfl8vjXCpcLapI3nwPGAC1y8ui3Y2yJBzJMeluJiwL
	oAaHRuFe2A4d5wNMHpfGi7he76WhcVmEhaZEY1wUELIM70DntGwyQKyYrsba7RiP8KN2W4P2b8i/f
	OXXh1DBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25zF-00000003c5z-0H1y;
	Tue, 08 Apr 2025 10:15:21 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25d7-00000003WAE-3DPJ;
	Tue, 08 Apr 2025 09:52:31 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39c14016868so4709233f8f.1;
        Tue, 08 Apr 2025 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105948; x=1744710748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3/BY8PYvNQdk6fZrNkLE1hVwik+/X8XgJnJ+/zsRwY=;
        b=bc8QMoIRu82/HL4NC+XT2RaeXNpHdOgYpmuqMjlWbBnyt6I4xJj/SH04oUJOCx3gJS
         LK0LUM+IaIAOujrg7mKKc2wSOPei0JB7ZWSe0Z9ls17dp06PTHYPBgKfafxX6dXtnTGl
         s9y/t48UM3pCfoUnhjtsDmFKlp7rKDLSI6WWAdYtKQYqWFXvXAV4Jp7MT5CWAZGcGIVI
         YBHl6sMvdaISBR8ON2FVL/rvIQiM7BmrVceDFtnCJAQD0JYjNkqWBPIgmxqZpU1CZKYO
         gbOBWga8wljIF0G+7ZCQLAlEk4JtAz1ww6fQI/hysiKsifN7O7bDPp3a/dTuCG30DTJq
         /NcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105948; x=1744710748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3/BY8PYvNQdk6fZrNkLE1hVwik+/X8XgJnJ+/zsRwY=;
        b=QdlTe0bEQ+ysE+XQGttU7LNqlO8cEE6eVRF5hRWL+Z+/iWzyhWRIQlxW8/E5UG4ddq
         WICc1rY6IZ8e9fQ3vGRnVJASApx6mbsr7lfQedRVhsv6TMB2JRSzS7+W4HE6uO1PFBuE
         eXTpr82vBIbzTpOgQTd0hmZBoPqGXUmp2hwjWuwbE2Nv5msNGLQPPHsWFR4VdCNPfcxC
         QdCWzU193x4YGgA4xKlnEJdX0cmuW6rcdTaeOs74IH+aC8uIMZOk4MAaqfAua3hM0mVh
         1P5Z2d5Cgs0UPZP2fwyUd3pLzHaEnz2hdSbLzAVboJjHwXgecG901Zqtsav8EfZvMOCF
         K47g==
X-Forwarded-Encrypted: i=1; AJvYcCUFr8eTfJzlPneHpwMkm4COLh5qOvlddq71UcoDo6AzQ7fIcN3fVJi/e3NhwjkTgErJaXziFFfB2IEtdh7HrqAZ@lists.infradead.org, AJvYcCV+FnXW0eTN9PsqZdwnrJzD0/5CVr7X2dBjXx22iTIPzBidWfCtVGqlKc7jdwGeaffQY7M1f9KocIl/rTslpv4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiFabQemuGbNhPRAwpoY43ERHijRtSuFeqm8v/VekV2muibIVM
	gMHO0vUfszxq5Uoz4cKCwA7w/Vt8n3eNvWJXtkQyFN2Su9ynaS/3
X-Gm-Gg: ASbGncsIdqoppjXfqVZdjwT5gxpF/F7kt5bzud/sf/9dipM93s21dGCcWn6hQaX+NCt
	pvZmcfSttk1SYk+cnRgf+VOEtFMAmS324+oTEv/w49mxdguf17CejcVAnkXHD2nce66l2cR6qrT
	XFCWAdUSHuRvPh6BOahrIOaNHT74qBhbyQVrKypfUyGR9Z05dM75/GMJqOhI6jeVTAOTogMqOZj
	5GBYF0tLuAaYBYw9JxomexkvKwWM+NiemwElmDNL6yA8qSK8x4RHRFtS0fpg2wr9CvedwIoKgfH
	xum2E7Fdvfrg789qmd55LZnx6eiasvmqQzr9cW6AGqFhMmu3p+tT4x8JG7+qmNXLOLHfT/ZXDCM
	PS2YO2qnk438MTA==
X-Google-Smtp-Source: AGHT+IGk6lh9oHKBenBhQXCD5vvAz3tN3/0sAx6/S8ROb2EOxvICxmB1O37yZcrWQXZCVWyacHoQ1g==
X-Received: by 2002:a5d:584e:0:b0:39c:dfa:d33e with SMTP id ffacd0b85a97d-39d0de2567dmr13218213f8f.23.1744105948149;
        Tue, 08 Apr 2025 02:52:28 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:27 -0700 (PDT)
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
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v14 11/16] net: mdio: Add Airoha AN8855 Switch MDIO Passtrough
Date: Tue,  8 Apr 2025 11:51:18 +0200
Message-ID: <20250408095139.51659-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408095139.51659-1-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025229_817166_649D668A 
X-CRM114-Status: GOOD (  21.67  )
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
 drivers/net/mdio/Kconfig       | 10 +++++++
 drivers/net/mdio/Makefile      |  1 +
 drivers/net/mdio/mdio-an8855.c | 49 ++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 drivers/net/mdio/mdio-an8855.c

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


