Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87CBCA5FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBFy3gRg9djAHfzdZsNUfVoPCNaFFvApu+nxOmSEsi0=; b=OLtiLvj77IoX7EaZovvYy555ve
	H2SvJPPch3j9dMqfQICY79DIXaDtC4XAU2vdO67mUNiJUh7FPkUXtcklhwOdiXEtiUHrZQrbPwU9y
	sfgy9mF3DdKUUrHZW1XPSvpnTUNwk6FILmbaC5AHnUua+3F/ybcd7QgFt8mW9Zo9e6yqbQ9e7671f
	Hay57IjEtVj+M0uEAaG9I1haS35aW4ZkBHdBd8KaYmJhzLy2bexCRK5uI34yFBjDxn7IAcpMBBWqF
	4veVvme2ykEGrC6fIKN12yWP4pe/2kfrKuFLtDXVtQxdLRnMvqR0Rh2RGtSf5P0BVXji5vhftrzAW
	wt7B3Xvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoaY-00000005Flp-2A85;
	Wed, 30 Sep 2026 07:18:50 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoaN-00000005FiB-49Kb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:18:41 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so27254965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 00:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752718; x=1791357518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OBFy3gRg9djAHfzdZsNUfVoPCNaFFvApu+nxOmSEsi0=;
        b=VqrESNZyng5QFkPOQQ/4aqg6wk7xkZ5WHxPlLgedUfqxLcInNCwEUfTkg9lBgRCQ4J
         dNX+kyPDHtUwX5ExUMlJ4RB97vlMMV4QnMSI3JKp/eulJGrR9Biw0BVbZrxjLUVlwqKg
         /iq+aS3bmfimVuTpauH/qsEBLMdS1EfjrOcCJYJBGeWBwI3ufQ/Yt6fW5kmFZR0Zmaqp
         gKlU9BJrbfTdhNc2cIncQGehhswBMxqqHIxcHAaQK7wM033dnJq0avWGyyTFN2KrYP0W
         lmrOXRg1AtWwRt6Z996oLcujfMfSY7xMu0aWt4tC2YWqJzwbUNvnjM8zyqy0pbKFzOw3
         9UOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752718; x=1791357518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OBFy3gRg9djAHfzdZsNUfVoPCNaFFvApu+nxOmSEsi0=;
        b=PfGp3Za6CcepuvPH9qnxVSUUU+boGPx/zIE9nJMkEv1WBVGTW+35fht19YlepS9P33
         nE1gFYKjzCUuYM0YYVeEp5BxY/aWBkWcx8D4SdCRzUgh4h/s8kPS3t7WBG4vnohVKLlJ
         KjhxASlbYsQX+VNRKltXVX4u+pnpO5dschw3Q3vQ3PvuV5kf0pkQPxPn6SUVGZ23kJVk
         v5V2yywBqXxXSq4YRHVbkYw5cC6FDICq78/j5TDPRCfj/MsonFajFYknee7J9Y9V9W3D
         /MVb9hvXU8LkXE5Frzg9j+GfmCSRF3DdZsjksCslRzvI7uRXvKnPovjgrYWb1cOpQNd6
         vdFA==
X-Forwarded-Encrypted: i=1; AKwUvBzHFWWksVp8Q3iGINYm2qd1fI58yRJFLlXa13fsZoztQufcVPWY2j6jo3Meywq4DEYezv0U3XDQyyVxuryVwo+o@lists.infradead.org
X-Gm-Message-State: AFuF++m7cOO2RwwKJ8ljifMMiqqUGcUsBPUbjbJ2zPjmnxV5evn4pWpy
	DY3xpnOgnQJDoUwonPzlPJCV4I9g0EpBadr66l1lQuBwgRQzeM9EZqJ8
X-Gm-Gg: AYBFou2JOZALKpTXFxumrj+iHl6nS9x8h/bstOWpc6ykeTp8jXnxHyGeGfTfe0n8XII
	kO6G9+vK5aMcj6+IjiM9SGyEBos9Lm9chK1AeydEXhxAgQokds6oIJI20Mki2mB3L6i8TskPcQ5
	2pktLLTA8ejlAKMRUTPYFmvZKCOocPg+bsQju+JuVdnxkbrP47aUjo/rQbgyjQHnOWaq3A1FNe+
	Z4Bea640flyyBODCACx5DGyoMVSNmGaJmRG1STv6N/fh+fhdVlxk3xoQxuFkKP1t+c0THF3mTDq
	2bQ90arh7wo9RMYo+MqoAwbcT9JfUY7AgtF9+8vQrbqARiSRfEeGuNGyJtzUEwvqV82EVHoibAj
	QefVzVJ7yDywRb10bID0UlG2yRU5YPXpqeDSaTP2uQaXAU5ws3fIqfw6d3UY3lyi0oLMLzlSyP+
	N2qIRGuOeILcVHgwR+RBK56eMnm1HpG/e/M5yDGfSWOXXa2H5GU7o5e+Z6MmhMb3s7S21cvXwiN
	roKoVVAOzS14cf4jSBVBDXgjAUTnexnpsIydjGeqd9wMXAibYJrnoZ3PLtWGfyK
X-Received: by 2002:a05:600c:37c4:b0:49f:ce78:356b with SMTP id 5b1f17b1804b1-4a01b125598mr5076455e9.28.1790752718096;
        Wed, 30 Sep 2026 00:18:38 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e79e4sm10590905e9.2.2026.09.30.00.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:18:37 -0700 (PDT)
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
Subject: [PATCH v12 2/3] phy: move and rename Airoha PCIe PHY driver to dedicated directory
Date: Wed, 30 Sep 2026 09:18:18 +0200
Message-ID: <20260930071826.48811-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930071826.48811-1-ansuelsmth@gmail.com>
References: <20260930071826.48811-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_001840_087633_C1E6CB0D 
X-CRM114-Status: GOOD (  26.93  )
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
index 0b9946c532af..d2f2a491f3c0 100644
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
 
 AIROHA SOUND DRIVER
 M:	Christian Marangi <ansuelsmth@gmail.com>
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
2.55.0


