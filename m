Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE43CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hcL4kpvQbOeIH3v4HuNZyUeMcKWWe+FM1vHkVhUWQI=; b=qPVfHzVc/011dR07QxIOvDjaSm
	1fyeTAqBXtS0UZGgyA3Bed1V/2mDnA/z9ZOPeM1KYOMCZThXGtJ9TJuOWG1vHp9Ba5qFAZexSlBJW
	c92/bUh3wGXwsjz0SqWVH6S6NvH+VD5HhLhiQESTplMrVBaQs+K2ujMElxyQAn9Esu07v1MIAMuTA
	8fO8DvR+/4v1lfw/wOL7+Ms5wx0qJAx9XT6q0U47w9CMkC9UDo0D2xI3grmPTKXzmRISKVDQ+NcQk
	Sg4O0lkIhlqd0HvA9153pC1lYrbnD047Ya5LazEArrmfJCxAwpdKyVq0INn4CkCAJ5VyivDcQpc2E
	7rqHKtlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOvw-000000003Bh-3LXM;
	Fri, 07 Nov 2025 16:03:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOvr-0000000035a-01ty
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 16:03:26 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-429c7e438a8so865556f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 08:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762531401; x=1763136201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hcL4kpvQbOeIH3v4HuNZyUeMcKWWe+FM1vHkVhUWQI=;
        b=MwICSt53dSwUIgk+RP3J/1XYctU9pttcEY2CO9M8u4yIJFb+HsA5VmoYSCbzpvdYCM
         hJhVpMMNNct/RpTCMI+aUQvyuldcqefkfYy5N41Edm6XyflqxURxBiwPTFU4ShE2X2An
         r1HV86P1Wl1GlMG/ToNaZKSfJntY804wDtj6FMS2ze0QYTjyR6oC/CazTtU38au1g+Q5
         pxghQXFHIzsMDY3iHGeM6LzH9q6slq1rghMSMm0yNJiym5pnYX9QP8+2nd0yVyBuDfDm
         pYaDPjjNhsDtMnivEauL1SN2cyM9YadIIOFTLiJDzdIwjAz6p23tyR8v5Q8F0TSbmH9S
         9vgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531401; x=1763136201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9hcL4kpvQbOeIH3v4HuNZyUeMcKWWe+FM1vHkVhUWQI=;
        b=bcpm33ed0Tt68QT4QFlPZCOv6m+iJDLyDLLSKJivxw62N7bEN53+nd3YNcu8v7jDdo
         FqHUoGRGgKUpKyopOakz9doEA2iB2dByUJUqv5IewZXl/i+SB/kaxvNC/Ppug50XmqIB
         xFei3c2MhQvdpk+h7Zw+Foxp2YpGQXbBllLQnDPSCmQXwa3soZLG17clS40qsr7pWNy9
         epuT43HaLhoKJ6JdHadX3ONY9U89QaqLf1DekqW8V8dsBv2YseI9vBjyBA9O4hjoAGWu
         V1EpGSsssManUxoqFYlLj4fO38TJJQA1w3Dzmv3PHCyUPnJDNZtYw3weXNx3F2yu1P0E
         kKbw==
X-Forwarded-Encrypted: i=1; AJvYcCUFqFqL8oD3yKWgFElNVZLtYYGb3qkQGTyl1ENFQQADtgcgSfzRY6Wd3gG8nac03IPJx3yTGOd0MW4dHNBCukgk@lists.infradead.org
X-Gm-Message-State: AOJu0YwF8b7Y2qBRTUa58HHk7sSo5SpEDIJSzkBkGg2nYqfO4jd3dEaM
	jmR/D6cTn5vcjZ351WBjem9z39UQ797AS0sinz9vJHfTl6quJSPQ6tC3
X-Gm-Gg: ASbGncu8JPeCfTsWRb2nlGjun1qD8PD5piXafUIc/vp7yb2lYayh8DuCDqddcSWYkHz
	F6ERRaQVC40hjt8WhdY+AlCrZR62v9n67t6zQX1XU+HOD2HnPBUpALidTsL88WGXXFKOat7mWmQ
	02R4/a3zmzZZcI+Wsfv9UIqCrvzYRhUAIl2m/YOBcLHhy+Mi3HZfpNH52ptJAYXtKO3CoGMkOpM
	sVlsJjNCjJeKWtZLm/DZSYrwI651CznmwAaHbFNBC8eLwd+GF0FBX1sT8F56ujVdSox7ktZV5+5
	HmVVUMJQqiauWYrCeumvSHCOuWtP0lNr2L7wtREll2WpTnbEIOXG4+dGIjMsLJaBs4Z4VMbEPZ5
	yDVv1sPK7t5jFUd44w4OSh2iC1dh0m5tiZlLq+SvtC6MVW5pDqQ2JLd1fapRXBwA96iZ6Ioefr8
	DNqcFbjLn4ter7kj4pbYJy0Fh6z9ZeQw==
X-Google-Smtp-Source: AGHT+IF8GggcDHi7QBttaxWPpT3fGLhlBtflkbGQN9Mx0mk3VkwN/vNspcQRMJ6TT7pwAxV2Ni2hCQ==
X-Received: by 2002:a05:6000:64e:b0:425:742e:7823 with SMTP id ffacd0b85a97d-42adcb583e1mr2941066f8f.12.1762531400677;
        Fri, 07 Nov 2025 08:03:20 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm6058016f8f.19.2025.11.07.08.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:03:20 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] phy: airoha: Add support for Airoha AN7581 USB PHY
Date: Fri,  7 Nov 2025 17:02:46 +0100
Message-ID: <20251107160251.2307088-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107160251.2307088-1-ansuelsmth@gmail.com>
References: <20251107160251.2307088-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_080323_305691_B0618AEB 
X-CRM114-Status: GOOD (  22.99  )
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

Add support for Airoha AN7581 USB PHY driver. AN7581 supports up to 2
USB port with USB 2.0 mode always supported and USB 3.0 mode available
only if the Serdes port is correctly configured for USB 3.0.

The first USB port on the SoC can be both  used for USB 3.0 operation or
Ethernet.
The second USB port on the SoC can be both used for USB 3.0 operation or
PCIe.
Both port operation toggled by the SCU SSR register and configured by
the USB PHY driver.

If the USB 3.0 mode is not configured, the modes needs to be also
disabled in the xHCI node or the driver will report unsable clock and
fail probe.

For USB 2.0 Slew Rate calibration, airoha,usb2-monitor-clk-sel is
mandatory and is used to select the monitor clock for calibration.

Normally it's 1 for USB port 1 and 2 for USB port 2.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                         |   1 +
 drivers/phy/airoha/Kconfig          |  10 +
 drivers/phy/airoha/Makefile         |   1 +
 drivers/phy/airoha/phy-an7581-usb.c | 614 ++++++++++++++++++++++++++++
 4 files changed, 626 insertions(+)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5fb5b188e424..77d1054e9a36 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -768,6 +768,7 @@ M:	Christian Marangi <ansuelsmth@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+F:	drivers/phy/airoha/phy-an7581-usb.c
 
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
index 9a1b625a7701..bb4e3367baa5 100644
--- a/drivers/phy/airoha/Kconfig
+++ b/drivers/phy/airoha/Kconfig
@@ -11,3 +11,13 @@ config PHY_AIROHA_AN7581_PCIE
 	  Say Y here to add support for Airoha AN7581 PCIe PHY driver.
 	  This driver create the basic PHY instance and provides initialize
 	  callback for PCIe GEN3 port.
+
+config PHY_AIROHA_AN7581_USB
+	tristate "Airoha AN7581 USB PHY Driver"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Say 'Y' here to add support for Airoha AN7581 USB PHY driver.
+	  This driver create the basic PHY instance and provides initialize
+	  callback for USB port.
diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
index 912f3e11a061..944bf842deba 100644
--- a/drivers/phy/airoha/Makefile
+++ b/drivers/phy/airoha/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_PHY_AIROHA_AN7581_PCIE)	+= phy-an7581-pcie.o
+obj-$(CONFIG_PHY_AIROHA_AN7581_USB)	+= phy-an7581-usb.o
diff --git a/drivers/phy/airoha/phy-an7581-usb.c b/drivers/phy/airoha/phy-an7581-usb.c
new file mode 100644
index 000000000000..6e4fad6dc3d9
--- /dev/null
+++ b/drivers/phy/airoha/phy-an7581-usb.c
@@ -0,0 +1,614 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/soc/airoha,scu-ssr.h>
+#include <linux/bitfield.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/* SCU */
+#define AIROHA_SCU_SSR3				0x94
+#define   AIROHA_SCU_SSR3_SSUSB_HSGMII_SEL	BIT(29)
+#define   AIROHA_SCU_SSR3_SSUSB_HSGMII_SEL_HSGMII FIELD_PREP_CONST(AIROHA_SCU_SSR3_SSUSB_HSGMII_SEL, 0x1)
+#define   AIROHA_SCU_SSR3_SSUSB_HSGMII_SEL_USB	FIELD_PREP_CONST(AIROHA_SCU_SSR3_SSUSB_HSGMII_SEL, 0x1)
+#define AIROHA_SCU_SSTR				0x9c
+#define   AIROHA_SCU_SSTR_USB_PCIE_SEL		BIT(3)
+#define   AIROHA_SCU_SSTR_USB_PCIE_SEL_PCIE	FIELD_PREP_CONST(AIROHA_SCU_SSTR_USB_PCIE_SEL, 0x0)
+#define   AIROHA_SCU_SSTR_USB_PCIE_SEL_USB	FIELD_PREP_CONST(AIROHA_SCU_SSTR_USB_PCIE_SEL, 0x1)
+
+/* U2PHY */
+#define AIROHA_USB_PHY_FMCR0			0x100
+#define   AIROHA_USB_PHY_MONCLK_SEL		GENMASK(27, 26)
+#define   AIROHA_USB_PHY_MONCLK_SEL0		FIELD_PREP_CONST(AIROHA_USB_PHY_MONCLK_SEL, 0x0)
+#define   AIROHA_USB_PHY_MONCLK_SEL1		FIELD_PREP_CONST(AIROHA_USB_PHY_MONCLK_SEL, 0x1)
+#define   AIROHA_USB_PHY_MONCLK_SEL2		FIELD_PREP_CONST(AIROHA_USB_PHY_MONCLK_SEL, 0x2)
+#define   AIROHA_USB_PHY_MONCLK_SEL3		FIELD_PREP_CONST(AIROHA_USB_PHY_MONCLK_SEL, 0x3)
+#define   AIROHA_USB_PHY_FREQDET_EN		BIT(24)
+#define   AIROHA_USB_PHY_CYCLECNT		GENMASK(23, 0)
+#define AIROHA_USB_PHY_FMMONR0			0x10c
+#define   AIROHA_USB_PHY_USB_FM_OUT		GENMASK(31, 0)
+#define AIROHA_USB_PHY_FMMONR1			0x110
+#define   AIROHA_USB_PHY_FRCK_EN		BIT(8)
+
+#define AIROHA_USB_PHY_USBPHYACR4		0x310
+#define   AIROHA_USB_PHY_USB20_FS_CR		GENMASK(10, 8)
+#define   AIROHA_USB_PHY_USB20_FS_CR_MAX	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_CR, 0x0)
+#define   AIROHA_USB_PHY_USB20_FS_CR_NORMAL	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_CR, 0x2)
+#define   AIROHA_USB_PHY_USB20_FS_CR_SMALLER	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_CR, 0x4)
+#define   AIROHA_USB_PHY_USB20_FS_CR_MIN	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_CR, 0x6)
+#define   AIROHA_USB_PHY_USB20_FS_SR		GENMASK(2, 0)
+#define   AIROHA_USB_PHY_USB20_FS_SR_MAX	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_SR, 0x0)
+#define   AIROHA_USB_PHY_USB20_FS_SR_NORMAL	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_SR, 0x2)
+#define   AIROHA_USB_PHY_USB20_FS_SR_SMALLER	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_SR, 0x4)
+#define   AIROHA_USB_PHY_USB20_FS_SR_MIN	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_FS_SR, 0x6)
+#define AIROHA_USB_PHY_USBPHYACR5		0x314
+#define   AIROHA_USB_PHY_USB20_HSTX_SRCAL_EN	BIT(15)
+#define   AIROHA_USB_PHY_USB20_HSTX_SRCTRL	GENMASK(14, 12)
+#define AIROHA_USB_PHY_USBPHYACR6		0x318
+#define   AIROHA_USB_PHY_USB20_BC11_SW_EN	BIT(23)
+#define   AIROHA_USB_PHY_USB20_DISCTH		GENMASK(7, 4)
+#define   AIROHA_USB_PHY_USB20_DISCTH_400	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x0)
+#define   AIROHA_USB_PHY_USB20_DISCTH_420	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x1)
+#define   AIROHA_USB_PHY_USB20_DISCTH_440	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x2)
+#define   AIROHA_USB_PHY_USB20_DISCTH_460	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x3)
+#define   AIROHA_USB_PHY_USB20_DISCTH_480	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x4)
+#define   AIROHA_USB_PHY_USB20_DISCTH_500	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x5)
+#define   AIROHA_USB_PHY_USB20_DISCTH_520	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x6)
+#define   AIROHA_USB_PHY_USB20_DISCTH_540	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x7)
+#define   AIROHA_USB_PHY_USB20_DISCTH_560	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x8)
+#define   AIROHA_USB_PHY_USB20_DISCTH_580	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0x9)
+#define   AIROHA_USB_PHY_USB20_DISCTH_600	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xa)
+#define   AIROHA_USB_PHY_USB20_DISCTH_620	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xb)
+#define   AIROHA_USB_PHY_USB20_DISCTH_640	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xc)
+#define   AIROHA_USB_PHY_USB20_DISCTH_660	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xd)
+#define   AIROHA_USB_PHY_USB20_DISCTH_680	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xe)
+#define   AIROHA_USB_PHY_USB20_DISCTH_700	FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_DISCTH, 0xf)
+#define   AIROHA_USB_PHY_USB20_SQTH		GENMASK(3, 0)
+#define   AIROHA_USB_PHY_USB20_SQTH_85		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x0)
+#define   AIROHA_USB_PHY_USB20_SQTH_90		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x1)
+#define   AIROHA_USB_PHY_USB20_SQTH_95		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x2)
+#define   AIROHA_USB_PHY_USB20_SQTH_100		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x3)
+#define   AIROHA_USB_PHY_USB20_SQTH_105		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x4)
+#define   AIROHA_USB_PHY_USB20_SQTH_110		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x5)
+#define   AIROHA_USB_PHY_USB20_SQTH_115		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x6)
+#define   AIROHA_USB_PHY_USB20_SQTH_120		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x7)
+#define   AIROHA_USB_PHY_USB20_SQTH_125		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x8)
+#define   AIROHA_USB_PHY_USB20_SQTH_130		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0x9)
+#define   AIROHA_USB_PHY_USB20_SQTH_135		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xa)
+#define   AIROHA_USB_PHY_USB20_SQTH_140		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xb)
+#define   AIROHA_USB_PHY_USB20_SQTH_145		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xc)
+#define   AIROHA_USB_PHY_USB20_SQTH_150		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xd)
+#define   AIROHA_USB_PHY_USB20_SQTH_155		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xe)
+#define   AIROHA_USB_PHY_USB20_SQTH_160		FIELD_PREP_CONST(AIROHA_USB_PHY_USB20_SQTH, 0xf)
+
+#define AIROHA_USB_PHY_U2PHYDTM1		0x36c
+#define   AIROHA_USB_PHY_FORCE_IDDIG		BIT(9)
+#define   AIROHA_USB_PHY_IDDIG			BIT(1)
+
+#define AIROHA_USB_PHY_GPIO_CTLD		0x80c
+#define   AIROHA_USB_PHY_C60802_GPIO_CTLD	GENMASK(31, 0)
+#define     AIROHA_USB_PHY_SSUSB_IP_SW_RST	BIT(31)
+#define     AIROHA_USB_PHY_MCU_BUS_CK_GATE_EN	BIT(30)
+#define     AIROHA_USB_PHY_FORCE_SSUSB_IP_SW_RST BIT(29)
+#define     AIROHA_USB_PHY_SSUSB_SW_RST		BIT(28)
+
+#define AIROHA_USB_PHY_U3_PHYA_REG0		0xb00
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV		GENMASK(29, 28)
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV_2		FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_BG_DIV, 0x0)
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV_4		FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_BG_DIV, 0x1)
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV_8		FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_BG_DIV, 0x2)
+#define   AIROHA_USB_PHY_SSUSB_BG_DIV_16	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_BG_DIV, 0x3)
+#define AIROHA_USB_PHY_U3_PHYA_REG1		0xb04
+#define   AIROHA_USB_PHY_SSUSB_XTAL_TOP_RESERVE	GENMASK(25, 10)
+#define AIROHA_USB_PHY_U3_PHYA_REG6		0xb18
+#define   AIROHA_USB_PHY_SSUSB_CDR_RESERVE	GENMASK(31, 24)
+#define AIROHA_USB_PHY_U3_PHYA_REG8		0xb20
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY	GENMASK(7, 6)
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_32	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_CDR_RST_DLY, 0x0)
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_64	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_CDR_RST_DLY, 0x1)
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_128	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_CDR_RST_DLY, 0x2)
+#define   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_216	FIELD_PREP_CONST(AIROHA_USB_PHY_SSUSB_CDR_RST_DLY, 0x3)
+
+#define AIROHA_USB_PHY_U3_PHYA_DA_REG19		0xc38
+#define   AIROHA_USB_PHY_SSUSB_PLL_SSC_DELTA1_U3 GENMASK(15, 0)
+
+#define AIROHA_USB_PHY_U2_FM_DET_CYCLE_CNT	1024
+#define AIROHA_USB_PHY_REF_CK			20
+#define AIROHA_USB_PHY_U2_SR_COEF		28
+#define AIROHA_USB_PHY_U2_SR_COEF_DIVISOR	1000
+
+#define AIROHA_USB_PHY_DEFAULT_SR_CALIBRATION	0x5
+#define AIROHA_USB_PHY_FREQDET_SLEEP		1000 /* 1ms */
+#define AIROHA_USB_PHY_FREQDET_TIMEOUT		(AIROHA_USB_PHY_FREQDET_SLEEP * 10)
+
+struct airoha_usb_phy_instance {
+	struct phy *phy;
+	u32 type;
+};
+
+enum airoha_usb_phy_instance_type {
+	AIROHA_PHY_USB2,
+	AIROHA_PHY_USB3,
+
+	AIROHA_PHY_USB_MAX,
+};
+
+struct airoha_usb_phy_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct regmap *scu;
+
+	unsigned int monclk_sel;
+	unsigned int serdes_port;
+
+	struct airoha_usb_phy_instance *phys[AIROHA_PHY_USB_MAX];
+};
+
+static void airoha_usb_phy_u2_slew_rate_calibration(struct airoha_usb_phy_priv *priv)
+{
+	u32 fm_out;
+	u32 srctrl;
+
+	/* Enable HS TX SR calibration */
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR5,
+			AIROHA_USB_PHY_USB20_HSTX_SRCAL_EN);
+
+	usleep_range(1000, 1500);
+
+	/* Enable Free run clock */
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_FMMONR1,
+			AIROHA_USB_PHY_FRCK_EN);
+
+	/* Select Monitor Clock */
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
+			   AIROHA_USB_PHY_MONCLK_SEL,
+			   FIELD_PREP(AIROHA_USB_PHY_MONCLK_SEL,
+				      priv->monclk_sel));
+
+	/* Set cyclecnt */
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
+			   AIROHA_USB_PHY_CYCLECNT,
+			   FIELD_PREP(AIROHA_USB_PHY_CYCLECNT,
+				      AIROHA_USB_PHY_U2_FM_DET_CYCLE_CNT));
+
+	/* Enable Frequency meter */
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
+			AIROHA_USB_PHY_FREQDET_EN);
+
+	/* Timeout can happen and we will apply workaround at the end */
+	regmap_read_poll_timeout(priv->regmap, AIROHA_USB_PHY_FMMONR0, fm_out,
+				 fm_out, AIROHA_USB_PHY_FREQDET_SLEEP,
+				 AIROHA_USB_PHY_FREQDET_TIMEOUT);
+
+	/* Disable Frequency meter */
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_FMCR0,
+			  AIROHA_USB_PHY_FREQDET_EN);
+
+	/* Disable Free run clock */
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_FMMONR1,
+			  AIROHA_USB_PHY_FRCK_EN);
+
+	/* Disable HS TX SR calibration */
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR5,
+			  AIROHA_USB_PHY_USB20_HSTX_SRCAL_EN);
+
+	usleep_range(1000, 1500);
+
+	/* Frequency was not detected, use default SR calibration value */
+	if (!fm_out) {
+		srctrl = AIROHA_USB_PHY_DEFAULT_SR_CALIBRATION;
+		dev_err(priv->dev, "Frequency not detected, using default SR calibration.\n");
+	} else {
+		/* (1024 / FM_OUT) * REF_CK * U2_SR_COEF (round to the nearest digits) */
+		srctrl = AIROHA_USB_PHY_REF_CK * AIROHA_USB_PHY_U2_SR_COEF;
+		srctrl = (srctrl * AIROHA_USB_PHY_U2_FM_DET_CYCLE_CNT) / fm_out;
+		srctrl = DIV_ROUND_CLOSEST(srctrl, AIROHA_USB_PHY_U2_SR_COEF_DIVISOR);
+		dev_dbg(priv->dev, "SR calibration applied: %x\n", srctrl);
+	}
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR5,
+			   AIROHA_USB_PHY_USB20_HSTX_SRCTRL,
+			   FIELD_PREP(AIROHA_USB_PHY_USB20_HSTX_SRCTRL, srctrl));
+}
+
+static void airoha_usb_phy_u2_init(struct airoha_usb_phy_priv *priv)
+{
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR4,
+			   AIROHA_USB_PHY_USB20_FS_CR,
+			   AIROHA_USB_PHY_USB20_FS_CR_MIN);
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR4,
+			   AIROHA_USB_PHY_USB20_FS_SR,
+			   AIROHA_USB_PHY_USB20_FS_SR_NORMAL);
+
+	/* FIXME: evaluate if needed */
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			   AIROHA_USB_PHY_USB20_SQTH,
+			   AIROHA_USB_PHY_USB20_SQTH_130);
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			   AIROHA_USB_PHY_USB20_DISCTH,
+			   AIROHA_USB_PHY_USB20_DISCTH_600);
+
+	/* Enable the USB port and then disable after calibration */
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			  AIROHA_USB_PHY_USB20_BC11_SW_EN);
+
+	airoha_usb_phy_u2_slew_rate_calibration(priv);
+
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			AIROHA_USB_PHY_USB20_BC11_SW_EN);
+
+	usleep_range(1000, 1500);
+}
+
+/*
+ * USB 3.0 mode can only work if USB serdes is correctly set.
+ * This is validated in xLate function.
+ */
+static void airoha_usb_phy_u3_init(struct airoha_usb_phy_priv *priv)
+{
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG8,
+			   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY,
+			   AIROHA_USB_PHY_SSUSB_CDR_RST_DLY_32);
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG6,
+			   AIROHA_USB_PHY_SSUSB_CDR_RESERVE,
+			   FIELD_PREP(AIROHA_USB_PHY_SSUSB_CDR_RESERVE, 0xe));
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG0,
+			   AIROHA_USB_PHY_SSUSB_BG_DIV,
+			   AIROHA_USB_PHY_SSUSB_BG_DIV_4);
+
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_REG1,
+			FIELD_PREP(AIROHA_USB_PHY_SSUSB_XTAL_TOP_RESERVE, 0x600));
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U3_PHYA_DA_REG19,
+			   AIROHA_USB_PHY_SSUSB_PLL_SSC_DELTA1_U3,
+			   FIELD_PREP(AIROHA_USB_PHY_SSUSB_PLL_SSC_DELTA1_U3, 0x43));
+}
+
+static int airoha_usb_phy_init(struct phy *phy)
+{
+	struct airoha_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct airoha_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	switch (instance->type) {
+	case PHY_TYPE_USB2:
+		airoha_usb_phy_u2_init(priv);
+		break;
+	case PHY_TYPE_USB3:
+		if (phy_get_mode(phy) == PHY_MODE_PCIE)
+			return 0;
+
+		airoha_usb_phy_u3_init(priv);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int airoha_usb_phy_u2_power_on(struct airoha_usb_phy_priv *priv)
+{
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			  AIROHA_USB_PHY_USB20_BC11_SW_EN);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int airoha_usb_phy_u3_power_on(struct airoha_usb_phy_priv *priv)
+{
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_GPIO_CTLD,
+			  AIROHA_USB_PHY_SSUSB_IP_SW_RST |
+			  AIROHA_USB_PHY_MCU_BUS_CK_GATE_EN |
+			  AIROHA_USB_PHY_FORCE_SSUSB_IP_SW_RST |
+			  AIROHA_USB_PHY_SSUSB_SW_RST);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int airoha_usb_phy_power_on(struct phy *phy)
+{
+	struct airoha_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct airoha_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	switch (instance->type) {
+	case PHY_TYPE_USB2:
+		airoha_usb_phy_u2_power_on(priv);
+		break;
+	case PHY_TYPE_USB3:
+		if (phy_get_mode(phy) == PHY_MODE_PCIE)
+			return 0;
+
+		airoha_usb_phy_u3_power_on(priv);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int airoha_usb_phy_u2_power_off(struct airoha_usb_phy_priv *priv)
+{
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			AIROHA_USB_PHY_USB20_BC11_SW_EN);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int airoha_usb_phy_u3_power_off(struct airoha_usb_phy_priv *priv)
+{
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_GPIO_CTLD,
+			AIROHA_USB_PHY_SSUSB_IP_SW_RST |
+			AIROHA_USB_PHY_FORCE_SSUSB_IP_SW_RST);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int airoha_usb_phy_power_off(struct phy *phy)
+{
+	struct airoha_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct airoha_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	switch (instance->type) {
+	case PHY_TYPE_USB2:
+		airoha_usb_phy_u2_power_off(priv);
+		break;
+	case PHY_TYPE_USB3:
+		if (phy_get_mode(phy) == PHY_MODE_PCIE)
+			return 0;
+
+		airoha_usb_phy_u3_power_off(priv);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int airoha_usb_phy_u2_set_mode(struct airoha_usb_phy_priv *priv,
+				      enum phy_mode mode)
+{
+	u32 val;
+
+	/*
+	 * For Device and Host mode, enable force IDDIG.
+	 * For Device set IDDIG, for Host clear IDDIG.
+	 * For OTG disable force and clear IDDIG bit while at it.
+	 */
+	switch (mode) {
+	case PHY_MODE_USB_DEVICE:
+		val = AIROHA_USB_PHY_IDDIG;
+		break;
+	case PHY_MODE_USB_HOST:
+		val = AIROHA_USB_PHY_FORCE_IDDIG |
+		      AIROHA_USB_PHY_FORCE_IDDIG;
+		break;
+	case PHY_MODE_USB_OTG:
+		val = 0;
+		break;
+	default:
+		return 0;
+	}
+
+	regmap_update_bits(priv->regmap, AIROHA_USB_PHY_U2PHYDTM1,
+			   AIROHA_USB_PHY_FORCE_IDDIG |
+			   AIROHA_USB_PHY_IDDIG, val);
+
+	return 0;
+}
+
+static int airoha_usb_phy_u3_set_mode(struct airoha_usb_phy_priv *priv,
+				      enum phy_mode mode)
+{
+	u32 sel;
+
+	/* Only USB1 supports Ethernet mode */
+	if (mode == PHY_MODE_ETHERNET &&
+	    priv->serdes_port != AIROHA_SCU_SERDES_USB1)
+		return -EINVAL;
+
+	/* Only USB2 supports PCIe mode */
+	if (mode == PHY_MODE_PCIE &&
+	    priv->serdes_port != AIROHA_SCU_SERDES_USB2)
+		return -EINVAL;
+
+	if (priv->serdes_port == AIROHA_SCU_SERDES_USB1) {
+		if (mode == PHY_MODE_ETHERNET)
+			sel = AIROHA_SCU_SSR3_SSUSB_HSGMII_SEL_HSGMII;
+		else
+			sel = AIROHA_SCU_SSR3_SSUSB_HSGMII_SEL_USB;
+
+		regmap_update_bits(priv->scu, AIROHA_SCU_SSR3,
+				   AIROHA_SCU_SSR3_SSUSB_HSGMII_SEL, sel);
+	}
+
+	if (priv->serdes_port == AIROHA_SCU_SERDES_USB2) {
+		if (mode == PHY_MODE_PCIE)
+			sel = AIROHA_SCU_SSTR_USB_PCIE_SEL_PCIE;
+		else
+			sel = AIROHA_SCU_SSTR_USB_PCIE_SEL_USB;
+
+		regmap_update_bits(priv->scu, AIROHA_SCU_SSTR,
+				   AIROHA_SCU_SSTR_USB_PCIE_SEL, sel);
+	}
+
+	return 0;
+}
+
+static int airoha_usb_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct airoha_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct airoha_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	switch (instance->type) {
+	case PHY_TYPE_USB2:
+		return airoha_usb_phy_u2_set_mode(priv, mode);
+	case PHY_TYPE_USB3:
+		return airoha_usb_phy_u3_set_mode(priv, mode);
+	default:
+		return 0;
+	}
+}
+
+static struct phy *airoha_usb_phy_xlate(struct device *dev,
+					const struct of_phandle_args *args)
+{
+	struct airoha_usb_phy_priv *priv = dev_get_drvdata(dev);
+	struct airoha_usb_phy_instance *instance = NULL;
+	unsigned int index, phy_type;
+
+	if (args->args_count != 1) {
+		dev_err(dev, "invalid number of cells in 'phy' property\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	phy_type = args->args[0];
+	if (!(phy_type == PHY_TYPE_USB2 || phy_type == PHY_TYPE_USB3)) {
+		dev_err(dev, "unsupported device type: %d\n", phy_type);
+		return ERR_PTR(-EINVAL);
+	}
+
+	for (index = 0; index < AIROHA_PHY_USB_MAX; index++)
+		if (priv->phys[index] &&
+		    phy_type == priv->phys[index]->type) {
+			instance = priv->phys[index];
+			break;
+		}
+
+	if (!instance) {
+		dev_err(dev, "failed to find appropriate phy\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return instance->phy;
+}
+
+static const struct phy_ops airoha_phy = {
+	.init		= airoha_usb_phy_init,
+	.power_on	= airoha_usb_phy_power_on,
+	.power_off	= airoha_usb_phy_power_off,
+	.set_mode	= airoha_usb_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static const struct regmap_config airoha_usb_phy_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int airoha_usb_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct airoha_usb_phy_priv *priv;
+	struct device *dev = &pdev->dev;
+	unsigned int index;
+	void *base;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	ret = of_property_read_u32(dev->of_node, "airoha,usb2-monitor-clk-sel",
+				   &priv->monclk_sel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Monitor clock selection is mandatory for USB PHY calibration\n");
+
+	if (priv->monclk_sel > 3)
+		return dev_err_probe(dev, -EINVAL, "only 4 Monitor clock are selectable on the SoC\n");
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->regmap = devm_regmap_init_mmio(dev, base, &airoha_usb_phy_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	platform_set_drvdata(pdev, priv);
+
+	for (index = 0; index < AIROHA_PHY_USB_MAX; index++) {
+		enum airoha_usb_phy_instance_type phy_type;
+		struct airoha_usb_phy_instance *instance;
+
+		switch (index) {
+		case AIROHA_PHY_USB2:
+			phy_type = PHY_TYPE_USB2;
+			break;
+		case AIROHA_PHY_USB3:
+			phy_type = PHY_TYPE_USB3;
+			break;
+		}
+
+		if (phy_type == PHY_TYPE_USB3) {
+			ret = of_property_read_u32(dev->of_node, "airoha,usb3-serdes",
+						   &priv->serdes_port);
+			if (ret)
+				return dev_err_probe(dev, ret, "missing serdes line for USB 3.0\n");
+
+			priv->scu = syscon_regmap_lookup_by_compatible("airoha,en7581-scu");
+			if (IS_ERR(priv->scu))
+				return dev_err_probe(dev, PTR_ERR(priv->scu), "failed to get SCU syscon\n");
+		}
+
+		instance = devm_kzalloc(dev, sizeof(*instance), GFP_KERNEL);
+		if (!instance)
+			return -ENOMEM;
+
+		instance->type = phy_type;
+		priv->phys[index] = instance;
+
+		instance->phy = devm_phy_create(dev, NULL, &airoha_phy);
+		if (IS_ERR(instance->phy))
+			return dev_err_probe(dev, PTR_ERR(instance->phy), "failed to create phy\n");
+
+		phy_set_drvdata(instance->phy, instance);
+	}
+
+	phy_provider = devm_of_phy_provider_register(&pdev->dev, airoha_usb_phy_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id airoha_phy_id_table[] = {
+	{ .compatible = "airoha,an7581-usb-phy" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, airoha_phy_id_table);
+
+static struct platform_driver airoha_usb_driver = {
+	.probe		= airoha_usb_phy_probe,
+	.driver		= {
+		.name	= "airoha-an7581-usb-phy",
+		.of_match_table = airoha_phy_id_table,
+	},
+};
+
+module_platform_driver(airoha_usb_driver);
+
+MODULE_DESCRIPTION("Airoha AN7581 USB PHY driver");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.51.0


