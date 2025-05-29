Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7725EC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 13:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=; b=iNvKs3nRXAKTn79kZ/J0Mds46m
	TVjQS7hEAyRrQIF+KXYYaSkwcm/7tn2qrzeMRoYYZn6aIL3XmzG0qOsGa79yBDl85fiJFECbgb34t
	KSvt2TQstTW9o269sEKw1T6ab7rV7zDX1+LTphYhiBn2EOxvym26GayhSyG7tVhkhsc9EYXw6G16+
	nndyC89e6GLNS6XP/m7C5ZRfkq+DhItCopQIrS4VKswm4wHz2vV+GLec9RFC/ApHfk5E1E8Q9VKJF
	od59BVsFGvjKzRRf8J/FvzhNZMMkz4wkqB/zlEPQBv0AnGcJZJGY3kmm4FX0t+YJiMWFsWZvHkL+b
	Q0nM4O1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKd6X-0000000FpgN-1xk5;
	Thu, 29 May 2025 13:15:29 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcal-0000000FkiY-0x7V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 12:42:40 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ad88105874aso123743266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 05:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522557; x=1749127357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=;
        b=FwKAGejMv5gPwf0qQRFQuVtR9+xIVc34at4eQF3XA5fgLnp/i1qVDGXbcxl+KL+DmI
         l9E2M+dZtCCBK7e7msRzJUgo2NlX8kXV8ybktabHK9cESaV7KgH4k+ekZTtZJClNBuX/
         b3Zz2+cdv1QWdgSkZkeN5izCZBYtK7kc5XbAZbxMzfV5xBlvGoNKHUfoFtyZUEg7aD46
         PTo7Wn7RJ/xOakkvd54EfW4OUczGPiG3CZa9vySisN63RY0CAsLuyKCPaWPf/isRHavG
         KuuwpuwSe7UrZj0DhcidqBXyebPpj5FER8SwffcMihf7OVAbCAmjEj7oDi/yUco3cU1h
         IbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522557; x=1749127357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=;
        b=GCaOGPgB5yAOWuno2T9c6rtgc9FARIxlpPafZUqPraRyaCLXHSP3X6/Ny6IvdUVzy3
         GSD9gsNokMqjgg/CUyRCPTY/mKL8UhIGU0lXpvj2XsJFZ9sadfZtG02PPeZWFWHVg0sw
         Huogpu9dlnNkwgvP43yD4P8p5AeTdxgJwYm8EQpw6am2tTqTgdAJhPX1R4cDH/lh/FwR
         lwf5/WrAmUaEiT3lVcluUObw0uVNpjxflLdhvoUJ2Ht5YVKz+AzPWRJy95reO2ah9RvL
         sM/tKVOjlsXalP3j6qx92sqgyel6Q+QyeLKE+/NajwebIYWGQn4Smb3Op/NRME5Wyy67
         L5zg==
X-Forwarded-Encrypted: i=1; AJvYcCWVBReSCLW/Ispwrvg3ganor0yXyFHJmjybNhgYkhyfAYvPBuja6maTMp5Uy/tdg1FDnKJB4rvhA24Az1e/lEuZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxnJX+r+rSECDUrM8vWOsJGttDx9fXTFyzkgPTgBFFxWN8gbeP6
	LSqxh6MEFiIG9Jyc6FXiGUkijqTOksC3t2EAY3nkZqCLRpIZ21Ed3lh6hWt+pR8JnQ0=
X-Gm-Gg: ASbGncuJ811xlyP5aXJFcx/xLxbLoA/3GzcAq4OQLh3sfjjXfRXk2dGASqhGUHQHOn8
	sx9L3sOJgA0L+UeyPDrjfFxdkQ+Q5Ep3tziaPMq/+mY2sJxGyzxbqQ4h4SofLRB+nYJjVWADC8n
	+ZH3ypBUQsT5lplUtvnWzRd0m7hITDqkZci0/QpDwBg0f38bnu9UKMIZ6Pn9r7q3yfnj5ZV1TJo
	5NHR7oxBMQzd3u9YDurtA3LEHVazkCGpX/rSRyupM629rCV+UFdYOPZs9Bctew5aGW/OKRxi7Ky
	K7tqFDzU6cJbzwUq7c0gx9NrRn9LjisWFKXejkD7XBXarEzETgcTuZxPSCjIbonfw5RaT60t71w
	HUor4CSaYCpCDXuoxduQOHw==
X-Google-Smtp-Source: AGHT+IFgiCpfokGYPqFfNbRAwtykuDbZ9l9nPVNQ028I3fcbAmrbjnUjF4hg+nzReyJrKKzdPC5Qhw==
X-Received: by 2002:a17:907:3f1b:b0:ad8:9d41:371e with SMTP id a640c23a62f3a-adadee36a88mr195092466b.36.1748522557299;
        Thu, 29 May 2025 05:42:37 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3952esm136308766b.126.2025.05.29.05.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:36 -0700 (PDT)
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
Subject: [PATCH v11 06/13] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Thu, 29 May 2025 14:43:55 +0200
Message-ID: <20250529124412.26311-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748522349.git.andrea.porta@suse.com>
References: <cover.1748522349.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_054239_258927_470E0459 
X-CRM114-Status: GOOD (  15.44  )
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


