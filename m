Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F665C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 19:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZolhV8X06QdceO7CzE5y1gL4qY3spYRGaKK90w3Qq18=; b=DgO+dq2heYXOvHeFJf9i2i02+k
	p/8IkbPEZwGmA0yFLAxWTX0fdWGSCh0WkWCzpPmf0Ex8qUkQ0U3GXA8ieQ6zYfLuUbMEnHXWJmXA4
	8gz0ey2RKjncDLY24Z+rI0agtwu4riH9m9mJ+2XgkfCSAwgXukJOZpj29800xF0R4N5fgdPJaS5lX
	Jm3uqwiwB2tb4JwTTZ9ft0j18RD/a25iTXIHZVoRcNQdwbJZch1pK+xEEKB+il/m1l3LZZFRqzxQZ
	Kqf23UAArMCo2SleJRqTBP6lIVF8TlFz6EoBSq4AX8bAWvxVJ135EZ9tEf8uckL0lSlYyCqrmE1QC
	hGDZtC8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNciT-00000000sWv-1TqV;
	Fri, 06 Jun 2025 19:27:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNceG-00000000s5C-0ugY;
	Fri, 06 Jun 2025 19:22:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-451d6ade159so21521145e9.1;
        Fri, 06 Jun 2025 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749237759; x=1749842559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZolhV8X06QdceO7CzE5y1gL4qY3spYRGaKK90w3Qq18=;
        b=kc7mAK83/CkAQI6QIYGaXyh1aaBD+ON9B+O9OdTxv7ifKU3rMhgb8x39amoXV8IIKQ
         J/M45mxkdVPF7EOeviPfPvfUFFIYoVq4KgkRlp0CzbOAd2QRRMuWZLuVz4+TSyfOhHeN
         JHR8qQ9t4yQxO1YsG0OPUOQYTareDDnJIdEP1MCUwy2uuyqQDnHAplhrJO81DDGoogQ0
         c1+JC2InWaswZ8UEeDy7VxuFn7tzi8ZeZpXi2L8WdB9Mp878agGR6YOG3+o4uZpI1Dxd
         IOR4Tt3n2dQVS66ng+ntV1WeZbrl2Hqn5hEQYgCDKxNnSYwq9bcBstsO2EZTQL7BRRnc
         wRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749237759; x=1749842559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZolhV8X06QdceO7CzE5y1gL4qY3spYRGaKK90w3Qq18=;
        b=k6xv6DrVZFmEZkdZZ1E4N+ZAW+0YH7IhpqhzaVCSviLN9TE1y84h38cBvBBKTe9nq9
         22nhtENrJlJYFPxI46NHHIdsCT2QJTOqgTlj8ax92HS2aeT4h35Tab/FttE8WnYPEzDv
         cxTSbl2LNDFoERCxaXLKBZbJn3fRaIfzanM+xKCu50mMtzsr/bGkfBdL4iXiehTDwe2g
         rJajjm2z4w1KWydIEPJL1U8qlXUQBMeYbLDlnBtn/LdQhspOqinuT5+Y+9rd1HfEzym2
         k2gITXtTnUqu2OOkYC8xp4He3DN+q4ZfMAmcuRyxVwZvLFSF7iwna8eOM3zSJL9MRRqU
         QNZA==
X-Forwarded-Encrypted: i=1; AJvYcCUsg3aZg2fFe3SFGsjmbjrK2LVS5dzeauAbpeiYBk0t9CRv7bM9L1VwU6stfE9BQHGnEyZqv6JKc/li@lists.infradead.org, AJvYcCXuJFbZhP/A5zviFjP9mvaY/DQXc7hg2P3UyI312JvSh2o2wZvzcCaxvNBrlScUzxQdEhSsb0B+pv5/v/LKnobg@lists.infradead.org
X-Gm-Message-State: AOJu0YzbzoP6IsRSraD4BzdTp3OoTuZWaNKl7tkeNPICe203N2WpWkY+
	SlUGy4n8GpjoMGEce/WohdkJi03elPyjtldsJHj3W0qtl6kmXd/KkDby
X-Gm-Gg: ASbGnctBhlWRbcczho7v00RYvclUSTUY5NcZopKa6UOLUmRpzG9omD7Uxqy746m45t7
	j5gmbqHWMAwygaGBsDeOOE8iw2YnrbDBG7c+DzjBSyJe6y0kPPM0yOf3SOhdj6Ht3ZDwtsLggAW
	UxASr11ovBz5q4+G0lFO0D6oHX//zy8qcgZPn3PwWBzzH/RrGQ+h43Phcz/hm9UFzg3UuEI2YTs
	TknvIiSzCcVICp05Mr3ElMMzW0KozuE5JSRrwl7WBFDQYDOrQJiM2D3CZIwhoXMBUn8e3ZU1Ex7
	sTJnhkTvtge0mqLAFF/CffclcbcGhgoh35pYkWxHrrLIHZt1pm9bV23CUQTSm8VP1o7+H2hAxPR
	F0ZHSCc3QOWWtpePwvEoTamMu7kWaIcU=
X-Google-Smtp-Source: AGHT+IHvYkioXXi9euOPF6eBXLqwVwcWGxM2cdh3Mcrbf418BuLqjjgdxRNMHv/c4ueJMT5PlyjZsw==
X-Received: by 2002:a05:600c:3b95:b0:450:d30e:ff96 with SMTP id 5b1f17b1804b1-452012b66afmr51338315e9.0.1749237758229;
        Fri, 06 Jun 2025 12:22:38 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-452730b9b27sm30951595e9.23.2025.06.06.12.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:22:37 -0700 (PDT)
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
Subject: [PATCH 1/4] phy: move Airoha PCIe PHY driver to dedicated directory
Date: Fri,  6 Jun 2025 21:22:02 +0200
Message-ID: <20250606192208.26465-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606192208.26465-1-ansuelsmth@gmail.com>
References: <20250606192208.26465-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_122240_255074_62CD0CEA 
X-CRM114-Status: GOOD (  17.79  )
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

In preparation for additional PHY driver for different Airoha SoC,
move the current PCIe PHY driver in a dedicated directory.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                                     |  4 ++--
 drivers/phy/Kconfig                             | 11 +----------
 drivers/phy/Makefile                            |  4 ++--
 drivers/phy/airoha/Kconfig                      | 13 +++++++++++++
 drivers/phy/airoha/Makefile                     |  2 ++
 drivers/phy/{ => airoha}/phy-airoha-pcie-regs.h |  0
 drivers/phy/{ => airoha}/phy-airoha-pcie.c      |  0
 7 files changed, 20 insertions(+), 14 deletions(-)
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{ => airoha}/phy-airoha-pcie-regs.h (100%)
 rename drivers/phy/{ => airoha}/phy-airoha-pcie.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dbdf02d6b0c..2f30432916a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -735,8 +735,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
-F:	drivers/phy/phy-airoha-pcie-regs.h
-F:	drivers/phy/phy-airoha-pcie.c
+F:	drivers/phy/airoha/phy-airoha-pcie-regs.h
+F:	drivers/phy/airoha/phy-airoha-pcie.c
 
 AIROHA SPI SNFI DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 8d58efe998ec..7f9f5b786643 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -72,16 +72,6 @@ config PHY_CAN_TRANSCEIVER
 	  functional modes using gpios and sets the attribute max link
 	  rate, for CAN drivers.
 
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
 config PHY_NXP_PTN3222
 	tristate "NXP PTN3222 1-port eUSB2 to USB2 redriver"
 	depends on I2C
@@ -93,6 +83,7 @@ config PHY_NXP_PTN3222
 	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
 	  Speed and High Speed.
 
+source "drivers/phy/airoha/Kconfig"
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index e281442acc75..0ad0e5309493 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -10,9 +10,9 @@ obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
-obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
-obj-y					+= allwinner/	\
+obj-y					+= airoha/	\
+					   allwinner/	\
 					   amlogic/	\
 					   broadcom/	\
 					   cadence/	\
diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
new file mode 100644
index 000000000000..1674134ea664
--- /dev/null
+++ b/drivers/phy/airoha/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for Airoha platforms
+#
+config PHY_AIROHA_PCIE
+	tristate "Airoha PCIe-PHY Driver"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Say Y here to add support for Airoha PCIe PHY driver.
+	  This driver create the basic PHY instance and provides initialize
+	  callback for PCIe GEN3 port.
diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
new file mode 100644
index 000000000000..616dc96302af
--- /dev/null
+++ b/drivers/phy/airoha/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
diff --git a/drivers/phy/phy-airoha-pcie-regs.h b/drivers/phy/airoha/phy-airoha-pcie-regs.h
similarity index 100%
rename from drivers/phy/phy-airoha-pcie-regs.h
rename to drivers/phy/airoha/phy-airoha-pcie-regs.h
diff --git a/drivers/phy/phy-airoha-pcie.c b/drivers/phy/airoha/phy-airoha-pcie.c
similarity index 100%
rename from drivers/phy/phy-airoha-pcie.c
rename to drivers/phy/airoha/phy-airoha-pcie.c
-- 
2.48.1


