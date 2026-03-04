Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDD5EDEBFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 00:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlMIMnnFvGQh9H4rXco95q08uvYkPIZ1pCJzedO6tQU=; b=b85dTsK184dvMJIZ1Fy8nnTfLi
	B8SN0t9XuaZ4WuIC53H4LeBuVT3task6bCPqkpWIjLJMDEWD+xTdFjv37nJuG7KNdMNC5kG2A/Vft
	X19V1xp1o9fcjmrLItyK6KR9ugKASa3MroY2f5OiAHXPM8XBi+62wgajFITgseY9R9G4BkvgG4I+P
	x4KXYv7CjtWtclSt/OQliUQLKBx1KTNM0Ll3gP+jvVK09VFw+XCj5rUEM6sIy0k3YilOkumXT/sm4
	FIvQVVEh93mxsI6PX+fmmaLwoxF6ZqFBpq6cX44gn7L0UP3gmstVIxaN0d2AltWauEpJ0/HmW8yJI
	SRvUcIxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaa3-0000000GCW7-32mv;
	Wed, 04 Mar 2026 00:59:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaZz-0000000GCRI-1gzL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 00:59:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so71084265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 16:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772585950; x=1773190750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlMIMnnFvGQh9H4rXco95q08uvYkPIZ1pCJzedO6tQU=;
        b=gJjiPGGIPIp7R3g5GGU0lFGeYkIsc15kYa1pWPVI6I9Wv2ptdrzW0kP/XffvGnchP8
         DG+afGb8AHhzW9vW+1QKmYSN8VCfaq9uFL64Tzd7cz8FC+ClJ6B0ypBi8d+KcpPMCrMn
         FF56oH6D4pA9whm3DG3Jgr5o+piyQM3V2FhFCInPYUQ2x38b5Dq5d0e3GWD0jiqhJ9b2
         jAW+SbOdiR1dRTTwjUxXwOhd5ugJwssrZREo0g3ws0f5zZOTYB/xnYqtDLDMEUR0ppKo
         TdrDGTtBZz/E5Puj0J8+a/khGX40d1eYwg39H7UMiWFoHeQRV4DETyF8buJ8op8VTbwe
         VSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772585950; x=1773190750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tlMIMnnFvGQh9H4rXco95q08uvYkPIZ1pCJzedO6tQU=;
        b=k1naHwKkl4wnQX8vMTRVbPh7iKb1CNvLGPp5C0cfw/TYGLvnIcfMfSrUCkNFy8WtOO
         hZANGSAyD80BsAr4R5b6VhaCTYF27HhzKycW8lms1AC1JefJ12I6Q4cr7ilpmV/8gs+m
         +3J1Rid/jaAbogK0kzVwLv0U1hKv7xqdEdiCfTMH4UWp70lb6EMaohf49nylWipaGRLk
         IuRj3pLE3HQa59PXHAYC8yj/dz/kfsSUjo89B+uwlfikitRaDAnb11KFhTeB7LVPQTVc
         lwjYEJ4/BqObJDp442r/HNC1xA8aHeE+9/YMOUZPYBGEcMsNcGb0+UBTZJqjWuzyrpqL
         ySqA==
X-Forwarded-Encrypted: i=1; AJvYcCXrgKnt5owo/MeifGGH+CXZaq2tNZccc+I1cP4AFfjabI2prp3XsgPbFipEmw5GtB/196LqhY59Kl/1NtJZQ8eC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+y/SmAvH3nBvvGQeKTI1PkJ6FJKO5QCphFCehxEdsnFIYBc9B
	Hvhjf0MNg2tEJcpRDy87yMeN1F8/cIUUqoU3RZR/w7CgABRc9xOsEaOE
X-Gm-Gg: ATEYQzwBCv5L2DwGAHk15vFsBX/jpIgsEyiHhTnrgGdte1lpaPmTnMVatdzjJXcGAac
	VwjYdIRVDbpM0/mv4FSspESxRes1nWwiJMaq1hxBpoKejzVyhUXzJC/IExGImLuGHGdCa8meND+
	zO7D0dxW0aHopZnW4iPq3t0rePeYvnYa+GPxptR2pGQuK4qw5pwtnTdewy4uzW82sDEq9L/x54K
	vZfvY/TPo+Kf77r/sm/rgPAJOcaE8vjCzkqfZJlCYilodNkks3QFmJLAFbHJezTKivP0oNtSDeU
	GZetL46xZ1lHR3p8xdDQ6uHSVDDRb9oQ+Kb/JLeye7jX/DpeP+46ylYuHwwoSYqnMhQ1Z0NQVPn
	x/JOcZhEeBO9LXEXqnNyB0pLIA9PqB5EGACzRlPtFCf0KMhzaxsvioZANYody4kdkml/UzQ1bBH
	XfPOrXmtAXPlja4nbpaX/JFCXXyd5nyAFXgBEAecCyV9XQBpafyR84nWc=
X-Received: by 2002:a05:600c:4e4e:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-48519854b39mr3346085e9.10.1772585949471;
        Tue, 03 Mar 2026 16:59:09 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4851880724esm26927575e9.9.2026.03.03.16.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 16:59:08 -0800 (PST)
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
Subject: [PATCH v5 4/4] phy: airoha: Add support for Airoha AN7581 USB PHY
Date: Wed,  4 Mar 2026 01:58:36 +0100
Message-ID: <20260304005843.2680-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304005843.2680-1-ansuelsmth@gmail.com>
References: <20260304005843.2680-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_165911_671929_569CB148 
X-CRM114-Status: GOOD (  23.58  )
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
 drivers/phy/airoha/phy-an7581-usb.c | 640 ++++++++++++++++++++++++++++
 4 files changed, 652 insertions(+)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ec9064e92d33..ee3dfa7b7f04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -784,6 +784,7 @@ M:	Christian Marangi <ansuelsmth@gmail.com>
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
index 000000000000..68cd1ae556ef
--- /dev/null
+++ b/drivers/phy/airoha/phy-an7581-usb.c
@@ -0,0 +1,640 @@
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
+#define   AIROHA_SCU_SSR3_SSUSB_HSGMII_SEL_HSGMII FIELD_PREP_CONST(AIROHA_SCU_SSR3_SSUSB_HSGMII_SEL, 0x0)
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
+struct an7581_usb_phy_instance {
+	struct phy *phy;
+	u32 type;
+};
+
+enum an7581_usb_phy_instance_type {
+	AIROHA_PHY_USB2,
+	AIROHA_PHY_USB3,
+
+	AIROHA_PHY_USB_MAX,
+};
+
+struct an7581_usb_phy_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct regmap *scu;
+
+	unsigned int monclk_sel;
+	unsigned int serdes_port;
+
+	struct an7581_usb_phy_instance *phys[AIROHA_PHY_USB_MAX];
+};
+
+static void an7581_usb_phy_u2_slew_rate_calibration(struct an7581_usb_phy_priv *priv)
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
+static void an7581_usb_phy_u2_init(struct an7581_usb_phy_priv *priv)
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
+	an7581_usb_phy_u2_slew_rate_calibration(priv);
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
+static void an7581_usb_phy_u3_init(struct an7581_usb_phy_priv *priv)
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
+static int an7581_usb_phy_init(struct phy *phy)
+{
+	struct an7581_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct an7581_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	switch (instance->type) {
+	case PHY_TYPE_USB2:
+		an7581_usb_phy_u2_init(priv);
+		break;
+	case PHY_TYPE_USB3:
+		if (phy_get_mode(phy) == PHY_MODE_PCIE ||
+		    phy_get_mode(phy) == PHY_MODE_ETHERNET)
+			return 0;
+
+		an7581_usb_phy_u3_init(priv);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int an7581_usb_phy_u2_power_on(struct an7581_usb_phy_priv *priv)
+{
+	regmap_clear_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			  AIROHA_USB_PHY_USB20_BC11_SW_EN);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int an7581_usb_phy_u3_power_on(struct an7581_usb_phy_priv *priv)
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
+static int an7581_usb_phy_power_on(struct phy *phy)
+{
+	struct an7581_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct an7581_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	switch (instance->type) {
+	case PHY_TYPE_USB2:
+		an7581_usb_phy_u2_power_on(priv);
+		break;
+	case PHY_TYPE_USB3:
+		if (phy_get_mode(phy) == PHY_MODE_PCIE ||
+		    phy_get_mode(phy) == PHY_MODE_ETHERNET)
+			return 0;
+
+		an7581_usb_phy_u3_power_on(priv);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int an7581_usb_phy_u2_power_off(struct an7581_usb_phy_priv *priv)
+{
+	regmap_set_bits(priv->regmap, AIROHA_USB_PHY_USBPHYACR6,
+			AIROHA_USB_PHY_USB20_BC11_SW_EN);
+
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int an7581_usb_phy_u3_power_off(struct an7581_usb_phy_priv *priv)
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
+static int an7581_usb_phy_power_off(struct phy *phy)
+{
+	struct an7581_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct an7581_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	switch (instance->type) {
+	case PHY_TYPE_USB2:
+		an7581_usb_phy_u2_power_off(priv);
+		break;
+	case PHY_TYPE_USB3:
+		if (phy_get_mode(phy) == PHY_MODE_PCIE ||
+		    phy_get_mode(phy) == PHY_MODE_ETHERNET)
+			return 0;
+
+		an7581_usb_phy_u3_power_off(priv);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int an7581_usb_phy_u2_set_mode(struct an7581_usb_phy_priv *priv,
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
+static int an7581_usb_phy_u3_set_mode(struct an7581_usb_phy_priv *priv,
+				      enum phy_mode mode)
+{
+	u32 reg, mask, sel;
+
+	switch (mode) {
+	case PHY_MODE_ETHERNET:
+		/* Only USB1 supports ETH mode */
+		if (priv->serdes_port != AIROHA_SCU_SERDES_USB1)
+			return -EINVAL;
+
+		break;
+	case PHY_MODE_PCIE:
+		/* Only USB2 supports PCIe mode */
+		if (priv->serdes_port != AIROHA_SCU_SERDES_USB1)
+			return -EINVAL;
+
+		break;
+	case PHY_MODE_USB_HOST:
+	case PHY_MODE_USB_HOST_LS:
+	case PHY_MODE_USB_HOST_FS:
+	case PHY_MODE_USB_HOST_HS:
+	case PHY_MODE_USB_HOST_SS:
+	case PHY_MODE_USB_DEVICE:
+	case PHY_MODE_USB_DEVICE_LS:
+	case PHY_MODE_USB_DEVICE_FS:
+	case PHY_MODE_USB_DEVICE_HS:
+	case PHY_MODE_USB_DEVICE_SS:
+	case PHY_MODE_USB_OTG:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (priv->serdes_port) {
+	case AIROHA_SCU_SERDES_USB1:
+		reg = AIROHA_SCU_SSR3;
+		mask = AIROHA_SCU_SSR3_SSUSB_HSGMII_SEL;
+
+		if (mode == PHY_MODE_ETHERNET)
+			sel = AIROHA_SCU_SSR3_SSUSB_HSGMII_SEL_HSGMII;
+		else
+			sel = AIROHA_SCU_SSR3_SSUSB_HSGMII_SEL_USB;
+
+		break;
+	case AIROHA_SCU_SERDES_USB2:
+		reg = AIROHA_SCU_SSTR;
+		mask = AIROHA_SCU_SSTR_USB_PCIE_SEL;
+
+		if (mode == PHY_MODE_PCIE)
+			sel = AIROHA_SCU_SSTR_USB_PCIE_SEL_PCIE;
+		else
+			sel = AIROHA_SCU_SSTR_USB_PCIE_SEL_USB;
+		break;
+	}
+
+	regmap_update_bits(priv->scu, reg, mask, sel);
+
+	return 0;
+}
+
+static int an7581_usb_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct an7581_usb_phy_instance *instance = phy_get_drvdata(phy);
+	struct an7581_usb_phy_priv *priv = dev_get_drvdata(phy->dev.parent);
+
+	switch (instance->type) {
+	case PHY_TYPE_USB2:
+		return an7581_usb_phy_u2_set_mode(priv, mode);
+	case PHY_TYPE_USB3:
+		return an7581_usb_phy_u3_set_mode(priv, mode);
+	default:
+		return 0;
+	}
+}
+
+static struct phy *an7581_usb_phy_xlate(struct device *dev,
+					const struct of_phandle_args *args)
+{
+	struct an7581_usb_phy_priv *priv = dev_get_drvdata(dev);
+	struct an7581_usb_phy_instance *instance = NULL;
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
+	.init		= an7581_usb_phy_init,
+	.power_on	= an7581_usb_phy_power_on,
+	.power_off	= an7581_usb_phy_power_off,
+	.set_mode	= an7581_usb_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static const struct regmap_config an7581_usb_phy_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int an7581_usb_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct an7581_usb_phy_priv *priv;
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
+	priv->regmap = devm_regmap_init_mmio(dev, base, &an7581_usb_phy_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	platform_set_drvdata(pdev, priv);
+
+	for (index = 0; index < AIROHA_PHY_USB_MAX; index++) {
+		enum an7581_usb_phy_instance_type phy_type;
+		struct an7581_usb_phy_instance *instance;
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
+	phy_provider = devm_of_phy_provider_register(&pdev->dev, an7581_usb_phy_xlate);
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
+static struct platform_driver an7581_usb_driver = {
+	.probe		= an7581_usb_phy_probe,
+	.driver		= {
+		.name	= "airoha-an7581-usb-phy",
+		.of_match_table = airoha_phy_id_table,
+	},
+};
+
+module_platform_driver(an7581_usb_driver);
+
+MODULE_DESCRIPTION("Airoha AN7581 USB PHY driver");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.51.0


