Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FFBCD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2MTlGdLnnx84SeHTRkSWUbFZVMSjGe7LyFztDYyPJA=; b=QtUhxe+tXyNjQCQW2xge7fzRxU
	hIisiq4s1EzrmeHfb6kygAsuQ323bMdjvXZEXigYSoyoqB/FBaLuxu300zuhIejFUvIuvidPSr8u1
	APe4p5wzDr9XvZcQkr0ZyR0Uw1fZOoAeUm0FzDyZ7LGNzxbI2kfcQasGPTikOSsSfslHljKbarRRF
	g0JgITyEIDG8DP5kVTCye1p80rS5E8NE48jjei31jH2+8RNxmJjJ275sfi6TRlk36bZhguVmuh8DS
	oVIUBsNQZsdZYe/ySyV7gMtQHJYKKBC4DJDTdmFC/2t26i61rI5eTpF3B7a48PTBQJCR2t7AWnS7t
	FqaNUU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiYH-00000004vVk-0QTK;
	Wed, 20 May 2026 15:09:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiYE-00000004vS2-0PSK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:09:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso41994925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779289776; x=1779894576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2MTlGdLnnx84SeHTRkSWUbFZVMSjGe7LyFztDYyPJA=;
        b=XGZZZ5eQkZrcNi/hQALqbMVpXgIDTd9WqcEV5ko98jQX29EqQBGIwSgwoObhQ3Kjhy
         RqIomSdeboDDIUJxRLwALGLBhEdePFegQX+zb7fP8YnXRUB0mQrSKwPQCdeZnvQx/AvB
         UrFPN1GTNHoA74t7vSJxxSpNHt+9GpBaMbZk975TFaZH+DXifNANsBwY/0f5G38kfiQt
         f60p+ocv7SFZ6EcGp3A7t8phsJ/iqBwsKtHhNY3v9Va1k/4D0cPnrMEDx/4ZHT4ROpsy
         edqDFtksVdy5aCk/QqyQUgfGrLWfoOQ4TPtwVECUXvVbGN6UUJJTQ4Fjlc7e+zH8Jo3/
         G2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289776; x=1779894576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+2MTlGdLnnx84SeHTRkSWUbFZVMSjGe7LyFztDYyPJA=;
        b=mhq8a25HARt37bxQllyBvcPrpKkuce+bgL/oC9IEMJJt7vW2DUDYypRiEyXwOhBlcc
         f25ibm5BYA6TgXOuz5AlNNqQ4eYKWsgMZkaf8h8huhpSuLd7IWp+lhAIUztTknv0yjjT
         hRR/U3x3tgWLsjPUu8iuy0vnfRZ3mLKHW3/JVDEXKHPPzVndCwLk0OhouRqTZWQBvrHH
         9Nos0aJSwsPiyr+WY57PvwsGeId4/RmvE/xCHhS839hNzXasUJ7o0bVZmpyoOVXfle6C
         o8waSJE/WsFmbERota/V6W0E2dNeW3H9wJ0ZDVzKGqDeZx6flvavwyISec2SDAyDduOe
         tCHw==
X-Forwarded-Encrypted: i=1; AFNElJ8V6t44ZY9ositD5FHDt3afGKy8L9blO8gQ9IVz2XFSI8ehs9iZ7OeF21qNiDMiAXjSOXDZFlePXNAVHoKpRBDd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhn31rsb6lcrwp0oB5BE7zR6ESA0rUGuH78epAly6pvgIJ+naV
	dz5MyR3teQTGZbBOnbSM6PmXYie3GEtKVi9Heuj+IPm653Rs1fXfYpZm
X-Gm-Gg: Acq92OEGceVHPNAtp5RUpP6wOBm5ESQFmQ09mQ5KokW7wbQv3+q9Nb8PA/DKGPlazLP
	pulX5//CUCUH/lO8VB+p8T3pprB4oMfrcf9YjRZ+Nju0tvfw2J+m0bzoJ0VtN8qOjdZk6kXuODu
	qCVEkIkPOCyDcGcBccRanSGT7x+47CdV3q9T9kVHznDUEpAdA0nAtAR/TP88tNLNVidIclRFjvp
	I4KaKEENavVsjkH76hmrNLzajignmfyInVdbnbvPW0jYMwGJCi07V/dSO4wBrJUKdKs3m+SoPjU
	r39BcF71UIo8Ke2+8Gx4RIw1wvvQyEnGObxY3cJt+dxZI73OV6c+rtD2nAHGspUhiq9FmJweEC6
	1TS7Bhs2b599Ph7QR8p3hM/t/ZQV8m1tu06POfVrBXp3Lb22fl7yQprFnyvkGCS6NsxernE4W1U
	xxUBgaCCT7ZkujKTqYg8lsxZrLjrhipWw8HklqOXGvCwJvV0pOeM9oxnqToap3Zcc=
X-Received: by 2002:a05:600d:8496:10b0:48f:eb8b:9980 with SMTP id 5b1f17b1804b1-48feb8b9ademr241288455e9.30.1779289776052;
        Wed, 20 May 2026 08:09:36 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm53639804f8f.9.2026.05.20.08.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:09:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v8 4/5] phy: move and rename Airoha PCIe PHY driver to dedicated directory
Date: Wed, 20 May 2026 17:09:09 +0200
Message-ID: <20260520150912.11614-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520150912.11614-1-ansuelsmth@gmail.com>
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_080938_175671_A01B807B 
X-CRM114-Status: GOOD (  27.33  )
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
index 932044785a39..7bea8c620da8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,8 +759,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
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
index 227b9a4c612e..f9cd765a3ccc 100644
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
@@ -133,6 +123,7 @@ config PHY_XGENE
 	help
 	  This option enables support for APM X-Gene SoC multi-purpose PHY.
 
+source "drivers/phy/airoha/Kconfig"
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/apple/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index f49d83f00a3d..84062279fa63 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -7,7 +7,6 @@ obj-$(CONFIG_PHY_COMMON_PROPS)		+= phy-common-props.o
 obj-$(CONFIG_PHY_COMMON_PROPS_TEST)	+= phy-common-props-test.o
 obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
 obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
-obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
 obj-$(CONFIG_PHY_GOOGLE_USB)		+= phy-google-usb.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
@@ -17,7 +16,8 @@ obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 
-obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
+obj-$(CONFIG_GENERIC_PHY)		+= airoha/	\
+					   allwinner/	\
 					   amlogic/	\
 					   apple/	\
 					   broadcom/	\
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


