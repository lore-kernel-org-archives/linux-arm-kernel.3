Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51591C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 19:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cASi4beLN5z6XxY/m0It44LL3MvOC5VTlaXm8/Ow5Vs=; b=IWRuxeiTA1NVUPdPWLuGJi1KlZ
	8K0f3GsihIJk3RXHotOYq0oNPXK3AxVKhUfI54iE/WtIKAy1uxLah6Sh8mRzYyiadAf6H+EYRmTcB
	7KlsUnb8i7KNW/HZG6IYU4WTR+ch2XOFyF4LJCnHrYi3L8ouTV+mxfvjvavvl1wu2OJfLJvw3hHWN
	vNzw8kG0yHajDLM9eftM3US+DtLoOzXMhNRr65vanefzHEe1vwC7u/evMYOhWV1t1Kp+Fb55sS0p7
	QZEB0DTq2LM4qy8PWQ0rFPIoqOAPELKdk96/Qe2uVeabhJlls3QpLF0oE34PcK+ilOrX2LfHZv9uM
	AsRp2wVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNckZ-00000000sg5-1d31;
	Fri, 06 Jun 2025 19:29:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNceH-00000000s5a-37fS;
	Fri, 06 Jun 2025 19:22:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-451d54214adso21549275e9.3;
        Fri, 06 Jun 2025 12:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749237760; x=1749842560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cASi4beLN5z6XxY/m0It44LL3MvOC5VTlaXm8/Ow5Vs=;
        b=bxcpPiYWc8LtQUW+tX+OLQNPwz/GS/O8O10tmqzk/D30uKv4+hRzg5Kih/zzA0llHo
         3BJwhsGDaYj4gcHL7JlL3CfaKbdryg1xwd1gqVoEXQodk3GpJU0r3lphhOz+te+D9Ba7
         s8GwewcfC7LuffvPy+x9ACu+ygvwK+ZkHcMpkXILfDlsKcHE1DMk1jsiaornnncOkjvF
         r7W2JLg5feZ7IqIT4d2bToRUVjQbQRlyeNxEjoYsNcxVyuOF2j5voddkw6I4U3auR95R
         rPuDsILTszw9/rfwMhkCP8AWyO6KFj2qVxVH/5MQbJEtNR0RgG+KzaaUJhPcMvoJwdmz
         RAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749237760; x=1749842560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cASi4beLN5z6XxY/m0It44LL3MvOC5VTlaXm8/Ow5Vs=;
        b=OMR8yYkFwEkWE6KuYFlxKnP9vJMaROdEBD1k65hBR/owQHr4rZijrytDUXEY8vXyLY
         +e6/K4SJ8eJBcSa9K+m0wlIlTk0MrPMbQhkT/4lOTJrnD/Z+zIbHvmAQ+07Cg2X/W76N
         6wpC5yULdMO/Wr8df/vrjBUURfURwHSSfvYqlrDXS4tp9+jrGr8+asUzVq+P15oijSpB
         YHTZmfOnPTkwelShvmbP6K2dpQiDn6bUS5Z89N7JWa0Q8IoSv7hgL4vB6r6MLVhk2B48
         WA73GVxON54MQ57DCSDzBH306zXLnvmAvPM5fnnJp/hd9hOu7gAn2O9f3YG2KGRPws+A
         415w==
X-Forwarded-Encrypted: i=1; AJvYcCUpyEjUXuHWsIMut32dWk2JPtFneY/3fH2CkjsEjJQKQDetRXSIb6DMG++oq3TMqzktUU/zno+KiTYK@lists.infradead.org, AJvYcCX9Xge50vKYeisembY+fS6F/PGIek84DlVy/gD83X34I2Y2OhdMLOcGOEfBZPyRvAYx92gC5Wk7r2I5F2lfS5re@lists.infradead.org
X-Gm-Message-State: AOJu0YxZM6SQR0azKNfhBJQd8DI+8Ra27M8MwOuYFk6TBKuFZnVwOU4G
	W3VIuiOLL9JPh6Q0SjMEiz5CJVTs5VxLK82eFzcrR5GPPDgJtB5x9b4y
X-Gm-Gg: ASbGncsNrZCRYsNOhWBk+oO2uI/eTNOtv+8Z3TGVXVJjKG/Q/qMun1KrPgo2Y4wZipg
	02La24xCL+/2/sWVnY4li0L0FttbRBWFjRDQB4IoTytErHyf6E2VBucons5X5f3WhNC80v98JA+
	DZGaBcN30bIPTn6GmGd7Xtn/v5tW0ijJQcgOVH0zE7JIpW0ESSsE+6D6z4Q8K/Lj3ygYkxV71Dj
	O3Z48G5qwePptG3iO/fcq8o8sBD4A6nei3NhGoUcYJucsi96qOFptUW6F4XetFjbdpdH4cX3tm4
	HlfZAnBuwX73WbyRZUjZx671urJwAf0wsb6/DWZRCnloqFX3GjPuAo3K8uP1KLbS6Iwl9i+2H/v
	XRuDnWmsA5PB2E75n/4Mj
X-Google-Smtp-Source: AGHT+IHDXYu8owykXvL2eQ1VC2oUvIdu6RDT6wGekHH4SyafOc1nP6I1fUcVwnFtSQpdG7bbdIngNQ==
X-Received: by 2002:a05:600c:1d04:b0:43d:ac5:11ed with SMTP id 5b1f17b1804b1-452013d230bmr45510795e9.24.1749237759872;
        Fri, 06 Jun 2025 12:22:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-452730b9b27sm30951595e9.23.2025.06.06.12.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:22:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] phy: airoha: add EN7581 tag to PCIe PHY driver
Date: Fri,  6 Jun 2025 21:22:03 +0200
Message-ID: <20250606192208.26465-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606192208.26465-1-ansuelsmth@gmail.com>
References: <20250606192208.26465-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_122241_779838_C08D3D1D 
X-CRM114-Status: GOOD (  16.66  )
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

In preparation for support of Airoha AN7583 PCIe PHY driver, add EN7581
tag to PCIe PHY driver and register header.

This is needed to better differentiate the 2 driver and 2 register
header between EN7581 and AN7583 that require a very different
setup process to make the PCIe port work.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                                                 | 6 +++---
 drivers/phy/airoha/Kconfig                                  | 6 +++---
 drivers/phy/airoha/Makefile                                 | 2 +-
 ...phy-airoha-pcie-regs.h => phy-airoha-en7581-pcie-regs.h} | 0
 .../airoha/{phy-airoha-pcie.c => phy-airoha-en7581-pcie.c}  | 6 +++---
 5 files changed, 10 insertions(+), 10 deletions(-)
 rename drivers/phy/airoha/{phy-airoha-pcie-regs.h => phy-airoha-en7581-pcie-regs.h} (100%)
 rename drivers/phy/airoha/{phy-airoha-pcie.c => phy-airoha-en7581-pcie.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2f30432916a3..2ea56cd21c8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -730,13 +730,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
-AIROHA PCIE PHY DRIVER
+AIROHA EN7581 PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
-F:	drivers/phy/airoha/phy-airoha-pcie-regs.h
-F:	drivers/phy/airoha/phy-airoha-pcie.c
+F:	drivers/phy/airoha/phy-airoha-en7581-pcie-regs.h
+F:	drivers/phy/airoha/phy-airoha-en7581-pcie.c
 
 AIROHA SPI SNFI DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
index 1674134ea664..08cc1fe4a11c 100644
--- a/drivers/phy/airoha/Kconfig
+++ b/drivers/phy/airoha/Kconfig
@@ -2,12 +2,12 @@
 #
 # Phy drivers for Airoha platforms
 #
-config PHY_AIROHA_PCIE
-	tristate "Airoha PCIe-PHY Driver"
+config PHY_AIROHA_EN7581_PCIE
+	tristate "Airoha EN7581 PCIe-PHY Driver"
 	depends on ARCH_AIROHA || COMPILE_TEST
 	depends on OF
 	select GENERIC_PHY
 	help
-	  Say Y here to add support for Airoha PCIe PHY driver.
+	  Say Y here to add support for Airoha EN7581 PCIe PHY driver.
 	  This driver create the basic PHY instance and provides initialize
 	  callback for PCIe GEN3 port.
diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
index 616dc96302af..f8949a291486 100644
--- a/drivers/phy/airoha/Makefile
+++ b/drivers/phy/airoha/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
+obj-$(CONFIG_PHY_AIROHA_EN7581_PCIE)	+= phy-airoha-en7581-pcie.o
diff --git a/drivers/phy/airoha/phy-airoha-pcie-regs.h b/drivers/phy/airoha/phy-airoha-en7581-pcie-regs.h
similarity index 100%
rename from drivers/phy/airoha/phy-airoha-pcie-regs.h
rename to drivers/phy/airoha/phy-airoha-en7581-pcie-regs.h
diff --git a/drivers/phy/airoha/phy-airoha-pcie.c b/drivers/phy/airoha/phy-airoha-en7581-pcie.c
similarity index 99%
rename from drivers/phy/airoha/phy-airoha-pcie.c
rename to drivers/phy/airoha/phy-airoha-en7581-pcie.c
index 56e9ade8a9fd..ea448cdf9ae0 100644
--- a/drivers/phy/airoha/phy-airoha-pcie.c
+++ b/drivers/phy/airoha/phy-airoha-en7581-pcie.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include "phy-airoha-pcie-regs.h"
+#include "phy-airoha-en7581-pcie-regs.h"
 
 #define LEQ_LEN_CTRL_MAX_VAL	7
 #define FREQ_LOCK_MAX_ATTEMPT	10
@@ -1279,12 +1279,12 @@ MODULE_DEVICE_TABLE(of, airoha_pcie_phy_of_match);
 static struct platform_driver airoha_pcie_phy_driver = {
 	.probe	= airoha_pcie_phy_probe,
 	.driver	= {
-		.name = "airoha-pcie-phy",
+		.name = "airoha-en7581-pcie-phy",
 		.of_match_table = airoha_pcie_phy_of_match,
 	},
 };
 module_platform_driver(airoha_pcie_phy_driver);
 
-MODULE_DESCRIPTION("Airoha PCIe PHY driver");
+MODULE_DESCRIPTION("Airoha EN7581 PCIe PHY driver");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_LICENSE("GPL");
-- 
2.48.1


