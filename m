Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59404C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19Blhbug/ViMibEwSUq3xAqJ9uRR52sZJ3C/I6CrjH0=; b=MK7cS5kVQx2OMTnCYfpGjbdJct
	Gq0x7wJLHRrYUfMZyiXu+hXvSpS9VXZWeG3hvLbiblT5M27LknoZTMVgP8FNddTBDLUwoQv9Q4BBY
	0n1jx12+uavEPiLaOb/sXpLOJ8QJR983MBLW6rRksPSvtc5z7FX0xzFy65GRfQT7ZehqXVIILPOcW
	hNB9fZfyjqd0DnW0nHqG0PbDTFq3P/zlfgOgwq53gEw4yXCtT4mcBZKUA3oFkcKY36QOPdHeEizl1
	GUFnclz3G2BKh0mHiVuxVSHkWEdSlNDJAH2SSr7LjJ9AKcLFL17Rq4zwBwtdlP5HzVmpXkrDaUs7j
	Txu2oeVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKu2-0000000H5RV-0g1w;
	Fri, 24 Jul 2026 18:45:46 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKtu-0000000H5Mk-2W1w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 18:45:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so4346735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 11:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784918737; x=1785523537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=19Blhbug/ViMibEwSUq3xAqJ9uRR52sZJ3C/I6CrjH0=;
        b=WvH7ooz9Gforo017l2LTuwEDs29H9iXu+hbxK7WbN6Xz+TeNsGc6L1DL5PUJTsZ/Tw
         QcXd5E6ZYA86R4AlWWOmDWZm9+ODd+rjAflb90Qu5zK4Kz+offHEeuyN1fTNVXz7L1rl
         O+EsUm5oyve7fV2z1x4Q8g8+BkPy7812Iuih9DcioEiqVQRgzZrDrwTn6cTDudSKdrYm
         4DRfYuT7W2t/4wM1clrxMq3JFJB2hy6vAwQp1tg8bQDf9DuJaYFk4/9sWmA3fGypNXDc
         ekRjKWfahUsGudMAEny9WwYf4cenSGct8v+cjBCOzPmWO1u2bB4CUBJVD96JmOlEL5MA
         a1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918737; x=1785523537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=19Blhbug/ViMibEwSUq3xAqJ9uRR52sZJ3C/I6CrjH0=;
        b=gIAydnQQQbFTIi/nDuVLKuuTFuVl2xDnJ5wdx2vglVtZJQ15ra/pyIVC19X/F0MAv0
         iNyG4QhPA621gtinXHTwHQ3x/oumMdueI3qIkgIf7dign/CsmJLQhTx+cWWA0TR36dw7
         QLLhjqRxNHiwfjHWf7qBQppggows/vEoy7W5ZnV8PF1bYrXrd+yCcnd4ucWM1ICTS/I7
         Ua70WUaZgBtDGTkbas3w0nEAMrEcliTYAEucTaQXT5QS3GoSN5Mw2vzzwZAvl8jPIQcX
         L0QVSrMG83fBqXViLex913yEeZC8Ws2YPssI9dtO+oOoQpavOy9w4/VrHrEPUx9nLqeE
         +8ww==
X-Forwarded-Encrypted: i=1; AHgh+RpMIDeRyz7AiGWIANfIX8t6JPXY/fWNnn6OYOsGTae4RG15lOu1/YY2ys06DjgOFcwOfIpi8I1xYq+70iZZjGWs@lists.infradead.org
X-Gm-Message-State: AOJu0YyOFSDOMZ2NZHWlk9DVqztjBxqi3hvVdmdgZQmDlngp1zA73eT0
	d0Z95678bi/9Mrh1tW8cVOjFgm/qqRr0D5Y8xMFeivqUm7vzmdAVcUkh
X-Gm-Gg: AR+sD12j0HXKRvZKSg+9mKi/cRxftuSWbaq/o7sX3hvRBQgg5ZAL8bDwVjOXRt7zV8f
	ARZGF5noTx0/XaNRrG6F0i8FnWoVu3RrGDDhs2poQDe/rTGBc8WUrNQPAxSXw5xr/1EUkDDYUzL
	bItz4+cGpc8Fi9FErzK83wWfo6ZGOfPTmd3z/K4MNSBJy7FDVmUIvhf3Gk4sOlfed4lbW6EzZmC
	mlAyzfUqDXVXN6g9cC9FAfF2CbReKal+qMtepVYjouQ0bdbvx0QJG/20mk5RliVk9l8IVdouRJY
	DS/VMblg2g+PPbnx502VBJh9/fMoK4AFXVZk8tdm1Lp80A6+nwnXTy4cOea//0qgzCoEc/nNuk6
	sg1AuCsmJ2SHSa2sFU7nemATU07QroKUJlDMI3HWCNCxnIp3NTyYrXc1iXG9C8tiVSHW7gEyOu3
	zdzH7mrCGTxqt60Lc9RQlnMhLhjI90lk5bX1UXEE0R1vjHcvOXlJR7eUxVNt1bpliU6K3rMAapD
	rA=
X-Received: by 2002:a05:600c:5942:b0:495:6397:14b1 with SMTP id 5b1f17b1804b1-49573cf0ec2mr70244405e9.34.1784918736409;
        Fri, 24 Jul 2026 11:45:36 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496b4858e85sm11278335e9.1.2026.07.24.11.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:45:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 2/3] phy: move and rename Airoha PCIe PHY driver to dedicated directory
Date: Fri, 24 Jul 2026 20:45:21 +0200
Message-ID: <20260724184523.193661-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724184523.193661-1-ansuelsmth@gmail.com>
References: <20260724184523.193661-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_114538_677163_E7D61AAF 
X-CRM114-Status: GOOD (  26.46  )
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

To keep the generic PHY directory tidy, move the PCIe PHY driver for
Airoha AN7581 SoC to a dedicated directory.

Also rename the driver and add the relevant SoC name to the .c and .h
file in preparation for support of PCIe and USB PHY driver for Airoha
AN7583 SoC that use a completely different implementation and
calibration for PHYs and will have their own dedicated drivers.

The rename permits to better identify the specific usage of the driver
in the future once the airoha PHY directory will have multiple driver
for multiple SoC.

The config is changed from PHY_AIROHA_PCIE to PHY_AIROHA_AN7581_PCIE.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 MAINTAINERS                                         |  4 ++--
 drivers/phy/Kconfig                                 | 11 +----------
 drivers/phy/Makefile                                |  4 ++--
 drivers/phy/airoha/Kconfig                          | 13 +++++++++++++
 drivers/phy/airoha/Makefile                         |  3 +++
 .../phy-an7581-pcie-regs.h}                         |  2 +-
 .../{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} |  6 +++---
 7 files changed, 25 insertions(+), 18 deletions(-)
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05e90c3f7fe0..952653034c4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -765,8 +765,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
-F:	drivers/phy/phy-airoha-pcie-regs.h
-F:	drivers/phy/phy-airoha-pcie.c
+F:	drivers/phy/airoha/phy-an7581-pcie-regs.h
+F:	drivers/phy/airoha/phy-an7581-pcie.c
 
 AIROHA SPI SNFI DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 19f3b7d12b7d..e93951a4a898 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -46,16 +46,6 @@ config GENERIC_PHY_MIPI_DPHY
 	  Provides a number of helpers a core functions for MIPI D-PHY
 	  drivers to us.
 
-config PHY_AIROHA_PCIE
-	tristate "Airoha PCIe-PHY Driver"
-	depends on ARCH_AIROHA || COMPILE_TEST
-	depends on OF
-	select GENERIC_PHY
-	help
-	  Say Y here to add support for Airoha PCIe PHY driver.
-	  This driver create the basic PHY instance and provides initialize
-	  callback for PCIe GEN3 port.
-
 config PHY_CAN_TRANSCEIVER
 	tristate "CAN transceiver PHY"
 	select GENERIC_PHY
@@ -168,6 +158,7 @@ config PHY_XGENE
 	help
 	  This option enables support for APM X-Gene SoC multi-purpose PHY.
 
+source "drivers/phy/airoha/Kconfig"
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/apple/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index d7aa516bcc49..4ca4a07963fc 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -7,7 +7,6 @@ obj-$(CONFIG_PHY_COMMON_PROPS)		+= phy-common-props.o
 obj-$(CONFIG_PHY_COMMON_PROPS_TEST)	+= phy-common-props-test.o
 obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
 obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
-obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
 obj-$(CONFIG_PHY_ECONET_PCIE)		+= phy-econet-pcie.o
 obj-$(CONFIG_PHY_EYEQ5_ETH)		+= phy-eyeq5-eth.o
@@ -20,7 +19,8 @@ obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 
-obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
+obj-$(CONFIG_GENERIC_PHY)		+= airoha/	\
+					   allwinner/	\
 					   amlogic/	\
 					   apple/	\
 					   axiado/	\
diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
new file mode 100644
index 000000000000..9a1b625a7701
--- /dev/null
+++ b/drivers/phy/airoha/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for Airoha devices
+#
+config PHY_AIROHA_AN7581_PCIE
+	tristate "Airoha AN7581 PCIe-PHY Driver"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Say Y here to add support for Airoha AN7581 PCIe PHY driver.
+	  This driver create the basic PHY instance and provides initialize
+	  callback for PCIe GEN3 port.
diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
new file mode 100644
index 000000000000..912f3e11a061
--- /dev/null
+++ b/drivers/phy/airoha/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_PHY_AIROHA_AN7581_PCIE)	+= phy-an7581-pcie.o
diff --git a/drivers/phy/phy-airoha-pcie-regs.h b/drivers/phy/airoha/phy-an7581-pcie-regs.h
similarity index 99%
rename from drivers/phy/phy-airoha-pcie-regs.h
rename to drivers/phy/airoha/phy-an7581-pcie-regs.h
index 58572c793722..b938a7b468fe 100644
--- a/drivers/phy/phy-airoha-pcie-regs.h
+++ b/drivers/phy/airoha/phy-an7581-pcie-regs.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2024 AIROHA Inc
  * Author: Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/phy/phy-airoha-pcie.c b/drivers/phy/airoha/phy-an7581-pcie.c
similarity index 99%
rename from drivers/phy/phy-airoha-pcie.c
rename to drivers/phy/airoha/phy-an7581-pcie.c
index 56e9ade8a9fd..81ddf0e7638b 100644
--- a/drivers/phy/phy-airoha-pcie.c
+++ b/drivers/phy/airoha/phy-an7581-pcie.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include "phy-airoha-pcie-regs.h"
+#include "phy-an7581-pcie-regs.h"
 
 #define LEQ_LEN_CTRL_MAX_VAL	7
 #define FREQ_LOCK_MAX_ATTEMPT	10
@@ -1279,12 +1279,12 @@ MODULE_DEVICE_TABLE(of, airoha_pcie_phy_of_match);
 static struct platform_driver airoha_pcie_phy_driver = {
 	.probe	= airoha_pcie_phy_probe,
 	.driver	= {
-		.name = "airoha-pcie-phy",
+		.name = "airoha-an7581-pcie-phy",
 		.of_match_table = airoha_pcie_phy_of_match,
 	},
 };
 module_platform_driver(airoha_pcie_phy_driver);
 
-MODULE_DESCRIPTION("Airoha PCIe PHY driver");
+MODULE_DESCRIPTION("Airoha AN7581 PCIe PHY driver");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_LICENSE("GPL");
-- 
2.53.0


