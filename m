Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D859CA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6qZ1hBsm+xN1P6TzN/THVD/Mds3MJJk5yLYQnWA52I=; b=iJzJw+n2LprVI1chMv5c0eIDEy
	6WplBVbmZ1n9Yw2rz+rXR4YRaBVvEoVxmsfhQc8b1aTBfAeDrKNEl7mGh/KtqBe73gcu0ti0loKBq
	Q7YmQqFeiWUY3KD+nh4NaMfILnDM8PAfibmpS8WRFl17U7aRYLOOEzMm2mv7ea5JgGa+9fdOZy2Vy
	HeR73C8RRI2sBDXU6MKv5ERe4+iMHlB0kQ6EHl/67eKcZbMNA0zVbcAYEx8bMoGXREOg1PGvJpAeb
	kEBVZs9puaHs5G/soxR5uXKSk70ho2dBC8afj4j23e/+OY1u7eXEhV+rHXzYqBu5huVcfh2V0aiFL
	sSAGDXZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgMc-0000000GFWA-2Abc;
	Mon, 05 Oct 2026 10:56:11 +0000
Received: from mail-wm2-f13.google.com ([74.125.225.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgMJ-0000000GFMG-0pRH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:56:09 +0000
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so6011235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 03:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791197749; x=1791802549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q6qZ1hBsm+xN1P6TzN/THVD/Mds3MJJk5yLYQnWA52I=;
        b=DmKn2qcIyP5sACzax0/8CmeTpZjUMwkqec9DZVnMqgr6inmDBR9eL/Z+5cpmgJenYS
         GK5dAI8+uYcm7s9M0zhBKzHf0BVi8ZZtQ7WSxmVQ8zdJYraRrLqCqce6fD2oRqNwF0dG
         h0+InN5XnRoNFqWI1dL70M/pYyXXt4c4xfXr0joCSioQkG8OrbUNJgmjd+Y4J1LuZbHA
         uvs2lM4rvylZ2os4hXMbrmYfm5Spm6N35RCrQo6C11jP2gy8M1Q4HxyQmT8AMso46DEX
         dXbQwv+ZZ47C1zAscNhLKo8Npvv5aOiICawS2ojjCYX78ah+p4t3ozLzrY0zQ9dPe7hs
         lCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197749; x=1791802549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Q6qZ1hBsm+xN1P6TzN/THVD/Mds3MJJk5yLYQnWA52I=;
        b=oDPaMLGu/QjnomnF48az0rDCBcQNEWCqb2mCQHDDfC1KYyQah7p++cGCLkfkQxJwkW
         I81OL73zYqjT9N9ZveOjXWtT9ihqroqTyYKhXMWv+obCe2m/cjp3Ggzf5SVhOKf6JX5+
         gw3hmjdZup6cMDZnfuRUzVRW8sRA0WPtwJd5zB+UAKLv8HhDPipIp5l/Nv6xTwzqTTX4
         Gn7aOsuOOWBFf68NjnZ9wcyJlzCy7bS0vmMt1+rTCGOLBPtyrAlwg8E5yPC4OOcsYcXX
         SCz/1Y+i22ljNxYbEKSCLG2OoDLer+KvVwEtoAkfbOsmLm9DE9y7XNy+/7Ts11DOe9zT
         b87g==
X-Forwarded-Encrypted: i=1; AKwUvBy5NMcj9MQHoXE0Q7hVr956BXiO+HnsPXnDf+Rl10CIw0amZP37bbjW0otCT5GEsVvuTEJoB/OR7qVvkZDHqjKt@lists.infradead.org
X-Gm-Message-State: AFuF++k9+7pvjF+bazQN2mWPjBrYeCndX8DFrJNTNBqCVaplWDdJ9b7Y
	WINrOHqlvxluOC4OnY98AUpxo1wBFQ9ZwbwETrFzuW/pXlF/l24xBURJSQaTKA==
X-Gm-Gg: AYBFou0MW0/G5b/W0cPRhrnu62V0DCbe3zYQ67cKHItViqlZ87l/A1VSzWdgzXv95sM
	L6nTrl5AOLNCt5aizoBBf6yjmKf0WcmNzFkgAnmGQFCF7EnXCosKHo8RV5KdhoI7PxrRSE+RsfB
	8mWjeFa7WzR0e8z+rLVo6acZm2i+S5e/SIHwtfiQPRXXhfXNrH+krMKudctAKISOAMMzJQLfdZv
	VhRWVZgjsCDiKuyh/V6wZFN0qBZ4kE45avnNRyTKe8+z7E+dQpVMXYiJ4A+tWr5nAB6YPzhnQnz
	C3cx+xlDSZTFnuEUN7qP1932B7ujo3BbULlHJ263D+gXz8UXM36h26lZ+Ww+C5v9hS3ffU3mj2N
	ZwOWAPg+dQnvyfOMRUlij/27yMUtA+VmGoBPNCSGW9gEYqz/RWUDWpiiLPu5bRmqNNflc9rIkZ8
	7Um08WFbN479dkbuEHI+Fr2MYFyki/OfleIYggtm1rsf/jYMNtdT/14aETBZrPOP2d6DTR8zT6T
	1YwWDYYQi48hOXWvnp/LT8nCQse/wwCXHBaFqgZSdI6khrIrGhDzY+pUuJkX8lrngPhYTeNyg==
X-Received: by 2002:a05:600c:3b05:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-4a027561e0fmr167300395e9.13.1791197748928;
        Mon, 05 Oct 2026 03:55:48 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a030326132sm270319635e9.0.2026.10.05.03.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:55:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 2/3] phy: move and rename Airoha PCIe PHY driver to dedicated directory
Date: Mon,  5 Oct 2026 12:55:31 +0200
Message-ID: <20261005105535.2472-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005105535.2472-1-ansuelsmth@gmail.com>
References: <20261005105535.2472-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_035551_267882_C7E413D4 
X-CRM114-Status: GOOD (  26.56  )
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
index d8cf9722f76e..26ba9624acd5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -764,8 +764,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
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
index 105fbe408aa2..4ac7475dccfa 100644
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
index c6dd02003bbe..dcc88a3cbaa7 100644
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
 					   aspeed/	\
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
2.55.0


