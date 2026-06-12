Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2AACD98D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 15:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C77dw0Vtz8mOpBkQCeTh06vcPM193z5oy1TKnaUahRI=; b=QsiH4gRuTP94tdRqLFTxd2wZ+W
	O01y0ZCEZboHdSU0E8vaBYFyGFogh1oUaDEaKw0CpB5gXJ2IhdT9BMAatT42SfLVGTQl7AFQU4QmC
	VVoOkiWw2DuAtwf6/XEJ65XbQr/J/jtXp6MA/aCSRPm2/IZfKBIXBHN1650rIDabky7WzgqhQW2MM
	hPiXTwpYcDOhl+F4uDzltoYYGQvUHbI9Vk+TJBv/cC4el8kiGKfBRUZ4Swvub4QNfdcs/iggTlq+S
	UuRLQIYEA5jNFido90EigRIXfzedWuT6LuAyVFRVQ7oD0PavNAWuG/diKvGYMSmRdiF/TLgJBa/K8
	JRr1iYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3u4-0000000B9vE-3Ir3;
	Fri, 12 Jun 2026 15:34:40 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3u1-0000000B9r7-477u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 15:34:39 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso7607865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1781278476; x=1781883276; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C77dw0Vtz8mOpBkQCeTh06vcPM193z5oy1TKnaUahRI=;
        b=ZP1OS7a5N/Q4blGw2uPgzuXrUJrjkHlI52dlJUvecUek8tyjOveltayolPO8geb6kU
         LM9ZB/4g8ga93fERqMFenv63Fc3mL5MIQYmYS1HUG2vzaFz69sEFHMBQzC92DOj+ZoXm
         6YprRbkuXyFQteXD+CDotZt/CSbCAo9AgRstvVeKYgM+Y+b9d4+x3gPjODp1Bm6ZA1QX
         AHRAvsTts6dMc33qdxYi/C/+n1Y5SurDEu9N+ans3+ZPduMUaTTZ+LdUj9sb+bNTZcHP
         whNyQc2ozNuASBOXYK5k7uejHwrttC5kDWnooBc3bGLJGLFVqRnWJDAgD4ZgypOg6WSa
         6MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278476; x=1781883276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C77dw0Vtz8mOpBkQCeTh06vcPM193z5oy1TKnaUahRI=;
        b=QYGhPLbh5dYv6SQN+3hCVB3dHajinizVpWF+Qo+2zcWK/8o8xtKtpdwIg1z4zjKZis
         dFftsjrCgwXBX0z1RV4F61s/wnJrKY/DD6342Uve8xPopn6bmSf6Dl+hk9QBjyL+jUNy
         e6wOLlbK7JH/oKp2O4pHhtGqbJq94UXXf+v2EW2Sv8o6/LtIozt229SpWbe3YpmnXwX4
         WjQd5alG61tmw9jDoTtfCEIRECiG/hdp4QaydrDN1KBcUf2gyWIQ9VPZVVcEfVEH1fA2
         U33eJ6cjtfIbpEygGJRAibo2IAcbMhWf7v9RkucQK6ukKo+ASWnhuaYhrQCZjMA6OSxV
         /Pog==
X-Forwarded-Encrypted: i=1; AFNElJ9n9mbwW9fFa2d+LYhkrktnSGE70Z67PVTmdtK0Xe96QxUENAcWC/lepxA0+pFEFFnDAvN8FV5VtkCLFg3fZrpV@lists.infradead.org
X-Gm-Message-State: AOJu0YxSbyTcQs4VZkIQB/gobEuS1MU9ct3X+3diq79nwoNXEM9vG/c2
	TXasFz7upPi3vxSrsNFoI8bdGGAla8CHtXoR0wWeuRLaiDm5cexio/NudaT4UX0V80c=
X-Gm-Gg: Acq92OGft278YBnlL7e1ZfGkJYUk0F1/EzLlIjtOsdjPMpbDGjkga5omPnbRc6bN6tb
	Utjt9VFM7ag0Z/KO044cIN8JaPW4TxWgPn3gVL1L6FSyplqjySeys8mfkRrI3prtO9xZlozWgsn
	XlAdrNbpRYgjBZI9Afj8WKEpM2ByQ6CLx6KJysMpSrpozIegLmCKPUSXXIMJY8bhhxZLumD3b7r
	g/lPzc+u7jhIGnogNx4jivGYAtJfEmXOTjpBCVQhnJCHW6gVZyH4L7k9nnQhtgQNyttncnzHMHW
	xG/ogIfsst2Sw8zalsLwjKqoxuucDijWEjSlxgbhErByB8Ur8lbO5GfMSKtreJcw83ANfg2QXt+
	K8PbxtfdFkE/Mkjb0tKrJO601Cwsnw6xyCWKEWZ9TaBTO0Qdw6e8S+Grf4UPWFbc1LUDcz6cPJ6
	WG2qlth9YpuxypBPK2JCOkbMUdT4+mzWS+U+LbyXyk
X-Received: by 2002:a05:600c:314a:b0:490:bcc1:4edb with SMTP id 5b1f17b1804b1-490ec504eb5mr40584955e9.27.1781278475899;
        Fri, 12 Jun 2026 08:34:35 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm6916641f8f.20.2026.06.12.08.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:35 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 12 Jun 2026 19:34:17 +0400
Subject: [PATCH 4/4] regulator: Add support for UGREEN NASync DH2300 MCU
 SATA power gate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-dh2300-mcu-v1-4-ab8db1617bc0@flipper.net>
References: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
In-Reply-To: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5555; i=alchark@flipper.net;
 h=from:subject:message-id; bh=pO9z3jMa8HkpZeV2bnc4gj2kfzujnJX0LE3K/RZ5nqM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTpqP1teOQo+XzpyZz3a8S6NxuJ2Xouu9r2skcvSt115
 ZL/+YVfOiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqqecZ/ulqxO3/Z1LLxZzMcW3LYx4OufxULvOPre7GwcFdK/plXRgZJok4hS7
 ULmCdczdQd1nZrtkbHSxXPTfLcP8l/Zf90dsXrAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_083438_062587_C2A83E9D 
X-CRM114-Status: GOOD (  24.31  )
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

Add a driver for the SATA drive-bay power gate function of the UGREEN
NASync DH2300 embedded controller (HC32F005 MCU).

This is a simple on/off regulator, controlled by bit 0 of register 0x41,
with inverted polarity (0 = enabled, 1 = disabled). Boot-time default is
disabled, so this driver is required to use the NAS functionality.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 MAINTAINERS                                     |  1 +
 drivers/regulator/Kconfig                       | 12 ++++
 drivers/regulator/Makefile                      |  1 +
 drivers/regulator/ugreen-dh2300-mcu-regulator.c | 80 +++++++++++++++++++++++++
 4 files changed, 94 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9578a06fe651..2fc84be86e46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27638,6 +27638,7 @@ M:	Alexey Charkov <alchark@flipper.net>
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml
 F:	drivers/mfd/ugreen-dh2300-mcu.c
+F:	drivers/regulator/ugreen-dh2300-mcu-regulator.c
 
 UHID USERSPACE HID IO DRIVER
 M:	David Rheinsberg <david@readahead.eu>
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index a54a549196fe..e692ff864806 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1812,6 +1812,18 @@ config REGULATOR_TWL4030
 	  This driver supports the voltage regulators provided by
 	  this family of companion chips.
 
+config REGULATOR_UGREEN_DH2300_MCU
+	tristate "UGREEN NASync DH2300 MCU SATA power regulator"
+	depends on MFD_UGREEN_DH2300_MCU
+	help
+	  Say yes here to enable support for the SATA drive-bay power gate of
+	  the UGREEN NASync DH2300 embedded controller. The regulator is a
+	  sub-device of the ugreen-dh2300-mcu MFD core and is normally consumed
+	  by the SATA controllers via their target-supply.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called ugreen-dh2300-mcu-regulator.
+
 config REGULATOR_UNIPHIER
 	tristate "UniPhier regulator driver"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 134eee274dbf..44956d795923 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -206,6 +206,7 @@ obj-$(CONFIG_REGULATOR_TPS6594) += tps6594-regulator.o
 obj-$(CONFIG_REGULATOR_TPS65132) += tps65132-regulator.o
 obj-$(CONFIG_REGULATOR_TPS68470) += tps68470-regulator.o
 obj-$(CONFIG_REGULATOR_TWL4030) += twl-regulator.o twl6030-regulator.o
+obj-$(CONFIG_REGULATOR_UGREEN_DH2300_MCU) += ugreen-dh2300-mcu-regulator.o
 obj-$(CONFIG_REGULATOR_UNIPHIER) += uniphier-regulator.o
 obj-$(CONFIG_REGULATOR_RZG2L_VBCTRL) += renesas-usb-vbus-regulator.o
 obj-$(CONFIG_REGULATOR_VCTRL) += vctrl-regulator.o
diff --git a/drivers/regulator/ugreen-dh2300-mcu-regulator.c b/drivers/regulator/ugreen-dh2300-mcu-regulator.c
new file mode 100644
index 000000000000..69fda90f7ace
--- /dev/null
+++ b/drivers/regulator/ugreen-dh2300-mcu-regulator.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SATA drive-bay power gate for the UGREEN NASync DH2300 embedded controller
+ * (HC32F005 MCU).
+ *
+ * The microcontroller gates the SATA bay power rail through register 0x41.
+ * The polarity is inverted: writing 0 enables the rail, writing 1 disables it
+ * (the controller latches "off" out of reset).
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+
+#define UGREEN_DH2300_MCU_REG_SATA_POWER	0x41
+
+static const struct regulator_ops ugreen_dh2300_sata_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static const struct regulator_desc ugreen_dh2300_sata_desc = {
+	.name = "sata-power",
+	.enable_is_inverted = true,
+	.enable_mask = 0x01,
+	.enable_reg = UGREEN_DH2300_MCU_REG_SATA_POWER,
+	.supply_name = "vin",
+	.ops = &ugreen_dh2300_sata_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+};
+
+static int ugreen_dh2300_mcu_regulator_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regulator_config config = { };
+	struct regulator_dev *rdev;
+	struct device_node *np;
+
+	np = of_get_child_by_name(dev->parent->of_node, "regulator");
+	if (!np)
+		return dev_err_probe(dev, -ENODEV,
+				     "missing regulator child node\n");
+
+	config.dev = dev;
+	config.of_node = np;
+	config.regmap = dev_get_regmap(dev->parent, NULL);
+	if (!config.regmap) {
+		of_node_put(np);
+		return dev_err_probe(dev, -ENODEV,
+				     "no regmap available from parent\n");
+	}
+
+	config.init_data = of_get_regulator_init_data(dev, np,
+						      &ugreen_dh2300_sata_desc);
+
+	rdev = devm_regulator_register(dev, &ugreen_dh2300_sata_desc, &config);
+	of_node_put(np);
+	if (IS_ERR(rdev))
+		return dev_err_probe(dev, PTR_ERR(rdev),
+				     "failed to register regulator\n");
+
+	return 0;
+}
+
+static struct platform_driver ugreen_dh2300_mcu_regulator_driver = {
+	.driver = {
+		.name = "ugreen-dh2300-mcu-regulator",
+	},
+	.probe = ugreen_dh2300_mcu_regulator_probe,
+};
+module_platform_driver(ugreen_dh2300_mcu_regulator_driver);
+
+MODULE_DESCRIPTION("UGREEN NASync DH2300 MCU SATA power regulator");
+MODULE_LICENSE("GPL");

-- 
2.53.0


