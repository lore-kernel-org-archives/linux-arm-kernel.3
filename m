Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FE4C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=; b=J2sKSnz/LEgRYrxJYmjlTxqQYv
	1DsHM8U198LHcYFKvS/Fsth0SfLVbTTqAvrqoBibYfygxD78jk/Y9DZPrIzboQ1O3AkOiRTjLCkbA
	ALBMxc1W8r2xu6jl/Vc9mcd2UVauvc9rppYKvlxOM/6dACa+Devjy8f93OdTCKvkn1gzrwIiypYUM
	uy54HPqq+wI6+U5qgjbDCFZxPJDo/OBItpILCWxH9kZcPwXQ6+Zn8N5OB+xTzg/u7LmDGFAQR0QW3
	j6WyU3iWMh214n/zbdPeXiW87LNzmNfmbYzrMYxChnTXfI4JmMcpLR7v/MZzZh8Vl8gs2zfkQBrt8
	hLl4s1cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeW5-0000000G01u-2tfX;
	Thu, 29 May 2025 14:45:57 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKddN-0000000Fu2L-0GNF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:49:26 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso1667445a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 06:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526563; x=1749131363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=;
        b=Jd8jMMW2uwX3JRfbqRXXXj1USotKONdiH/P1GgqhSse+sWKJgKPHMTkdl4amNRWaFA
         6gu/NGdWo2ltQRnJnIJoqk0M5s2ClZzFMt5ywg6AjDJQvYXUIeYLEhwxWG92BTcK2VRB
         cynP8OqyOAShYb4z2Vsu+G0SAvArrH69KjBqNARz+qjMPLLO9D5CzHY8PFQ0uUyrt9XZ
         DXIMcc4GCO9ExkLruRMORqKk2AnENS6mb9UihFbiGiAbcpBO9mqZZor2qllPmzVXUFlz
         Qo2R22dvs6yd+UHB2DrrPAQnMqsmxyAXjrYZta4XJ/NI/inlDsI3wm/3kvjG2kYJJ1NL
         +vTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526563; x=1749131363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=;
        b=S8kz5cmI2xddQZZf+6OARGjIU5pLw01TFW7UIpTV+zF1fNdadBlJ4ybTbrMbHQXvRo
         8QWGcxFJEXv2JIyw412VngAi3wAStoBt0sfRaR5yD2RQIEypmiaUpdJXi11LEQzOioc8
         44ip2aC+5QDtyt9jZL5P5UETf7r7Ic6LHoU3rB2LA7cy5QN/WgBY502rbvKx/ZhlV36s
         ETs6zxJyCXIAgdB/1qim7R6aRssUyUUDa0YeHxwPDDgky9jMtXdHOkHYzbqxf847Mv3Y
         nx83K2TdR5cghfroBm391mz38gbFM9qSmZXBNI3Hw8U3SgfV+jvPas0fY5ku9G1uOVew
         Cg2A==
X-Forwarded-Encrypted: i=1; AJvYcCW3aH0qMFGVc3UKWNrgNE8ew6Ojh/CgWYAqLGqj8ix7bOL2WxU3l/XFcc+WqxgeUO13+YsdZeXBPKRvUo6Vk+ni@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6S0zIPkq7WCqI2xgL+3OR/lmWT1Xb8tcL2/j2YiTRHEVTVONv
	SXJLKT/blLot8ImPK4G8/Mj/6Fxs1Uq7HHBOstd3fjbI1bbbZnx0IkuV5PwchNS3M/4=
X-Gm-Gg: ASbGncuSiO8/e3eSb8wAoTBI9rygTA3fbgST4l8uE1tAVMgsjnptelWDEE+FbjzA36B
	qk4LmKktI48lL+9feL2AdcLr1hg6PCzOsf1BvSRbnzwOZ9exf04X1BHkF461byFsswcuNf1I3vf
	N8LpA8lHionZny+LJaWDa67qmA/l3NYjwdjUbYIus15ZHlwOinxirbHXjAPgjhr/dmPQBWEecWr
	6Go1ZKIwF63ek0pCUK+CDhJEWDK+DoHahGKdcDEiapPWflyYzrg0S3LkSkmwxX78/6VU0wJpJPd
	aqOuEyLoWlyljJZJLOUWW2hMwsw+L5Na7UilHNfTWSo9ie2nwscZ2S7+aVSrB8ZMXmisAau3Q/k
	xEfk6ZxP9N/B3Bupi4/V9omTnOaSL/cLn
X-Google-Smtp-Source: AGHT+IHLDw/cbNRjtWAHUKqu34oYBH24EHQ5n5ttjPr6tuWv4XIn9OBdLMDkrA0vGPxlXkQow/C20w==
X-Received: by 2002:a05:6402:35c8:b0:5fb:ad3c:d0c0 with SMTP id 4fb4d7f45d1cf-602d8f5dd5emr16420841a12.1.1748526563235;
        Thu, 29 May 2025 06:49:23 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60567143860sm2191a12.57.2025.05.29.06.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:22 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v12 06/13] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Thu, 29 May 2025 15:50:43 +0200
Message-ID: <20250529135052.28398-6-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748526284.git.andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_064925_099540_57020AC7 
X-CRM114-Status: GOOD (  15.52  )
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

RaspberryPi RP1 is a multi function PCI endpoint device that
exposes several subperipherals via PCI BAR.

Add a dtb overlay that will be compiled into a binary blob
and linked in the RP1 driver.

This overlay offers just minimal support to represent the
RP1 device itself, the sub-peripherals will be added by
future patches.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 42 ++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi  | 14 +++++++
 2 files changed, 56 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-common.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi

diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
new file mode 100644
index 000000000000..5002a375eb0b
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+pci_ep_bus: pci-ep-bus@1 {
+	compatible = "simple-bus";
+	ranges = <0x00 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+	dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	rp1_clocks: clocks@40018000 {
+		compatible = "raspberrypi,rp1-clocks";
+		reg = <0x00 0x40018000 0x0 0x10038>;
+		#clock-cells = <1>;
+		clocks = <&clk_rp1_xosc>;
+		assigned-clocks = <&rp1_clocks RP1_PLL_SYS_CORE>,
+				  <&rp1_clocks RP1_PLL_SYS>,
+				  <&rp1_clocks RP1_PLL_SYS_SEC>,
+				  <&rp1_clocks RP1_CLK_SYS>;
+		assigned-clock-rates = <1000000000>, // RP1_PLL_SYS_CORE
+				       <200000000>,  // RP1_PLL_SYS
+				       <125000000>,  // RP1_PLL_SYS_SEC
+				       <200000000>;  // RP1_CLK_SYS
+	};
+
+	rp1_gpio: pinctrl@400d0000 {
+		compatible = "raspberrypi,rp1-gpio";
+		reg = <0x00 0x400d0000  0x0 0xc000>,
+		      <0x00 0x400e0000  0x0 0xc000>,
+		      <0x00 0x400f0000  0x0 0xc000>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+			     <1 IRQ_TYPE_LEVEL_HIGH>,
+			     <2 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
diff --git a/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi b/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
new file mode 100644
index 000000000000..0ef30d7f1c35
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+rp1_nexus {
+	compatible = "pci1de4,1";
+	#address-cells = <3>;
+	#size-cells = <2>;
+	ranges = <0x01 0x00 0x00000000
+		  0x02000000 0x00 0x00000000
+		  0x0 0x400000>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+
+	#include "rp1-common.dtsi"
+};
-- 
2.35.3


