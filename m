Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3315FC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=; b=l4bkLXNFaxSpRBWeiHqdz2X2wO
	BmnPqDfcBU7c/6a4teIBKKedUyxG2yAzmdP4rhQjqysFpnyEJhv19iqSuln3RbWjNjiIkanYpgiuI
	B3ec33TbB7KHIpebcXmlHZxB6Vgz2C0Zsq80E4zFvWINctVm8N/f3z21STY/xXCMJi7FAIO0w6sER
	+Tzsn51Gbs+QxEuDUgy2iIk8xtTSv3a6yZySBbKt5kW0bWdxVEDADJ2Br1T0jTLvYB6rcogwjLnoS
	1fcAeCGtqFFxGOF7gmR6wZ1WWeM4dJBdTFdCI3bFOLaLd4PeWGXORzdpLHMrB2Ww1ds52WfWXHCZe
	P8fbhKPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbeH-0000000FfDI-46d4;
	Thu, 29 May 2025 11:42:13 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbL6-0000000FbDJ-19XY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:22:25 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-60410a9c6dcso1477961a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517743; x=1749122543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=;
        b=YsbKukoflbFlYcgKMAucFiFV7sWy6YM3DGzLdzrYXKTWSnfgPGDCdFBR6a01LcADOJ
         kHxJJGT6hXKSxYNIOP8C73ra8NUaVARMChofSVF1hJvrt4cNy/97s0IfIJrhfCbLowWf
         8tgWgORFKBclXcjDF7Qb7xy9peD9NJfHlX8C1Q3KFeE37K666pzmzWSxXxfwkRpDhu2J
         SmSwNMfpNl+t0Mox4z2KhMolzoWHMtRjolVY2my8KxNeH6y1ygXaX8m27rk+X9IQqT55
         IyqYM5SV6kYX/hDXySQrwQwJuWgoOblKhjcOSVLFFB/Rqdm9/nVf7GR3SJsi1beLknAK
         Em1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517743; x=1749122543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=;
        b=d18lH00ZsOc5e5c+phdV+LYhU7wwU8WCn/m2Qu1vwTAfwR6JIvIuTun+tU6tGUI2nN
         +CRoMdGcu2BwXHlqjep7rD9cFAql11BGv4bmjWZrF1wqPS3A5TRGp3sonlcS47OZ3Z9O
         8LqPyIJsTxMg7/8p2EHDHx1wgaCFHhdsHT/5DaAyjaX7jDOKk4219hsvdl+fI+sOuQQ3
         bPrb6VukxJPd5IEiTbKYchpTlhocN0MNuGSUqqP3kdvw8FefI3Z6qYYVb4dxccG1Ievx
         tgdhiRxXthFBERUGtWn37ScnBuZDOXTR5g0TVrTty87S+PpxI2yI2r7yLU56/M1vzonM
         4Ycw==
X-Forwarded-Encrypted: i=1; AJvYcCV3egbpLDJC53tziUPi+yldLG1Yoj7gvtdcJh6mf/1pqLQBYIbiGlo8N0krAaz27PHlwYvtKyUeg2kSZ6kWOSmy@lists.infradead.org
X-Gm-Message-State: AOJu0YwCC7Bb/mEArdwq0aSN8SeH1YG2fqqH1zfJVidV5guDLOhKnY4D
	oK0csYxB4DZpbNbP6+Ekb08iRu0VbovhmUHWy6V+Qid1Rf4u0TmQvmrc8VMivteIc18=
X-Gm-Gg: ASbGnctBlmi4i8pxmy7A6PawqU47co/MWncljr+ISGFN8i3m0wD3QNXv3PzgGGGydUE
	2GHVMkHZ2AnZ1IIitg11SyOv9/1eFEP4ekDeiGXT0KVEe3/1wBvdu5LSWyyKCnpj46db7HoeAMY
	8KJEewvdQfiQRY9xHGRXxY8vdwIqaSrfrUBI3MjuBAJ92s4P4Gr5XdveAPu8SHT/f/DoLA+XUX0
	y5GRVjJXxAkTKdFAIYDh26LxNyEi9NusBQUVM0zgSXCAM96aZwpVTWb3mrOl//g+95nL4IJJqS0
	8X4cwGVwert7FDva5MXJYdx3UrdNS2dA2sLyHLWIzLvIG5ZTzu0r5+uOKIU01zLX72gtxNlryAq
	MiiSc0+7u8PH4wHEhVUypUw==
X-Google-Smtp-Source: AGHT+IFCN6hRr/RrR+RIMXcb3Tq7I7fRbENqTmEG0i8BEd7W5tpHwCuHSDbIDfo8Fje/1qMDW9uKSA==
X-Received: by 2002:a17:907:d90:b0:ad8:9428:6a2e with SMTP id a640c23a62f3a-adacda5d03bmr182833966b.4.1748517742521;
        Thu, 29 May 2025 04:22:22 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2bf05csm122528066b.113.2025.05.29.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:22 -0700 (PDT)
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
Subject: [PATCH v10 06/13] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Thu, 29 May 2025 13:23:41 +0200
Message-ID: <20250529112357.24182-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748516814.git.andrea.porta@suse.com>
References: <cover.1748516814.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_042224_315976_FB544088 
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


