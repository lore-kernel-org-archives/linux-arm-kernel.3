Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2115D3F081
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjUncjcLWPAdsY5AzwGqsgN5nsZqzSUVUhLs3CXNF+s=; b=LqIv9a2HI+JI/G6tmje5CVXEab
	4OEv3kDifsmkbJFbfnG/IWQtte++HdYJyizdSx59l36xDKL9l+rAPYndBYNcDeByppC4+6tvrdGFk
	uCfMsDj5KVqph2kWmM9IQlJbrC6enuFLdLmQQfEcXea6tdsXhMbiS90isU3xexoHflBQxIR4oYDdc
	7pxoxfZJsEl6JBuT2MPEtL5L0yqKFCKhtPlJV/OoMxnkNjLztS9Qx6w8KctpZMUM5zAj0qJdcsoCP
	uKynU5hie/xghBQw0sl8LJlaNaBZTSPqfhnzve7xm2FD93ONmkWph7jyKEemPnXGw1qwe7n2t9ECD
	r/6QorNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7tV-0000000GK4L-3Xgd;
	Wed, 28 Jan 2026 15:55:49 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7tN-0000000GK2r-1gKG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:55:42 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-81f5381d168so6455418b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 07:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769615740; x=1770220540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjUncjcLWPAdsY5AzwGqsgN5nsZqzSUVUhLs3CXNF+s=;
        b=lK4nApb7I3m8cP1rEioWTprkLchaLpCMxW+xxmwA5PMCR7cap7vVTZYNDphFhycY3A
         T/M0aMbZiliAAGyontdyJZLpX5QrolrQXRhrI4MKr2dbFi55o6sC1uH1VaVXkU/cd+Z6
         TI4i4+P0C5MG7iahJD2TYIzyY55cyQp5+92ySYvlpi+ReB4JDcLs+5JKICGiMesjDyY7
         kx6aFQDQtKohBkM+O+flSJKRyhNTKRXZV8ejZqPXX8Rv7qTHDJ8LSZhykuElMg1LFKZA
         VDUCEO/F/jVtBgSA407gIg+Wbex4+y/BG5anuX1Zep+l+2KEQ1HJ8NNzbmMyZ1PjhWE3
         dVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769615740; x=1770220540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HjUncjcLWPAdsY5AzwGqsgN5nsZqzSUVUhLs3CXNF+s=;
        b=sFU3vZVtG2/lUK9VBlNBLMx9VjAbETsDLlPBXO8Lrtqko8yhTnuQhf8KIXkpawlK3H
         f+ugJm7jUh3vFg+48OSJwddofEN7coFGU6cROuOrUiY8Oh4HOoKZmg9imhKkui1pg6iW
         cihRK4njsEHTENEjMQSTTyl/m4ekvr+1r5neZDn3LwH3LAZ6inoVC1eiPfhopMRfmU/2
         LcHo1+R7ncgISNofUsRT8V4NHVrcVwwV7c1abMZFuxkFTs8GtV2t8XvNsz9NDYh8dBZ0
         6sd+UaLZBaJGVAzPe7rknuPs8bm7rDtljP0p7G+SaqgHsU5EK+PifpdScyPU1ACxXn7w
         jAZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjXlTkYz9k5pFnpFmkIbUMkgUCqJdDf0T/mBy3Egc6t5PnzKS628m7gmKpSWp3hRqKaBb5Py8p3FYPhO9LrKta@lists.infradead.org
X-Gm-Message-State: AOJu0YxFJHOg70HR4asasYXGP/F0BEkcROwqzo/iiUfNMlMyq8zzRKD5
	sOLydozm4jZZRlFddPoOTTfCJFboi/JPbOi9X3f/itCdql1CSETpZRyv
X-Gm-Gg: AZuq6aJ504B3a6cNcN1ogC951L+SBp9FSPnps3awFe8lWBp3vR1DIxyxi978EMqrPN9
	QRxKmkwGrCziWa1TyGkPaTDubEf3dXe+KWTF2jSXgowGLC4qbA5aVnof3aOmQVOgnT+FYcGNC9J
	FohFCglG3CA9xp/3y61DjJm38igydwHL9xkHWJcum0S9/sOu/1IYpikUEJHI3Teiv9JnSzcYDrv
	ze+IF/1ndBf3QsnbhWlhjv+15g42JGSmpe43gOdEVJjuKS/wClhc+3EWNTAAsoYO9VH/bCFU+6V
	4eP71clS17sUOgAsI0EFEokCeJNF9Mm4mx9w4EuTHWwXZ6bLbu+TmeD2EptrhRrrInwB/zOSV+C
	j/KxYWg0sih2lOErPhhQ8M61vSn1mgEFYYtLK95a1Eo2PN0Jflym0cNREYNShYqKkgMa1usVT2M
	WFtvXlPnUntBGzxCoyOGGVz3HRCHt50Kp6HzI4pRjnqAPVzxAUG8HVpg8=
X-Received: by 2002:a05:6a20:3d05:b0:366:14b0:1a2f with SMTP id adf61e73a8af0-38ec655cb7fmr5809916637.61.1769615740386;
        Wed, 28 Jan 2026 07:55:40 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6427da845csm2621521a12.12.2026.01.28.07.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:55:39 -0800 (PST)
From: Wig Cheng <onlywig@gmail.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaq14760@gmail.com,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v3 1/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Wed, 28 Jan 2026 23:55:29 +0800
Message-ID: <20260128155529.3699599-2-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128155529.3699599-1-onlywig@gmail.com>
References: <20260127025740.2601841-1-onlywig@gmail.com>
 <20260128155529.3699599-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_075541_441968_4DF8F0FA 
X-CRM114-Status: GOOD (  14.29  )
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

Add device tree overlay to support the MayQueen PixPaper e-paper display
on the NXP i.MX93 FRDM board. The display is connected via LPSPI3
interface and uses GPIO pins for reset, busy and DC control.

The overlay configures:
    - LPSPI3 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
    - PixPaper display device with proper GPIO assignments
    - SPI frequency set to 5MHz for stable operation

Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ce8f937c2315..c2727f8061e2 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -398,6 +398,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
+
+imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
new file mode 100644
index 000000000000..a78284c10838
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Overlay for Mayqueen (Open-EP Community) pixpaper display
+ * support on NXP FRDM i.MX 93 Development Board
+ *
+ * Copyright (C) 2026 Wig Cheng <onlywig@gmail.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx93-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&iomuxc {
+	pinctrl_lpspi3: lpspi3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO08__GPIO2_IO08		0x3fe /* SPI3 CE0 */
+			MX93_PAD_GPIO_IO09__LPSPI3_SIN		0x3fe /* SPI3 MISO */
+			MX93_PAD_GPIO_IO10__LPSPI3_SOUT		0x3fe /* SPI3 MOSI */
+			MX93_PAD_GPIO_IO11__LPSPI3_SCK		0x3fe /* SPI3 CLK */
+		>;
+	};
+
+	pinctrl_epd_ctrl: epdctrlgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO05__GPIO2_IO05		0x31e /* DC pin */
+			MX93_PAD_GPIO_IO06__GPIO2_IO06		0x31e /* RESET pin */
+			MX93_PAD_GPIO_IO26__GPIO2_IO26		0x31e /* BUSY pin */
+		>;
+	};
+};
+
+&lpspi3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
+	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+	fsl,spi-num-chipselects = <1>;
+	status = "okay";
+
+	display@0 {
+		compatible = "mayqueen,pixpaper";
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		reset-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		dc-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		busy-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+	};
+};
-- 
2.43.0


