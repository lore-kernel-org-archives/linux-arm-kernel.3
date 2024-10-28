Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82683D3398C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVZZiKyJj7ZnmSyKDxiL2Ewqy8l9yzTHRtpEpGvvetk=; b=X2BX4pP0NtMkGNLIcN3QQ8weGO
	nCR+TY5Pj3QbevjxafNlw3X1ijeyRIJcSmKQdujZJxakHfK2V9Weedk8rbCqkWVCH4uhwUVe/L0cQ
	EL+0yo5SCcxBKpv3ra9VheYBJFprHAMsCoIfePWyBqQDfpWhtL6ZwV/ALzM5oj94v/O9EyhbfBHoN
	GqD1mwE4J8ETO/zTy6aYhThwDLPuat5QTrh8Ko8K44oKN9FWzJ2+ZjOn/7yJ9BNZUZB55LvHA0kR6
	oUAjh8qjw58MIBz9E1mfBSS6BLCQoXFG6bMOwtbygLkOzPgLme9C+byO14wdcoXQYc9fv38F7mAXz
	/dide//Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QbR-0000000B5vs-2u5b;
	Mon, 28 Oct 2024 14:20:17 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QP1-0000000B2nW-2Xlu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:07:30 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9acafdb745so782279766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 07:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124445; x=1730729245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVZZiKyJj7ZnmSyKDxiL2Ewqy8l9yzTHRtpEpGvvetk=;
        b=fkshA+52sXDgHdW22duulN7yRiCMzy5dvspQgOw11O+JAZOuDC/bL3AA58N4lAJdO+
         XM3x5EcXMNO3KILlasVh9bOad+U0iR8pXTy/GPp5Gpszate8cJ1ZngwkzJzOHAk+BbYa
         qxVhT09AYnU7962F2pzFWon9xhk4x+uiVqK2HDh6Q5Kd4SzouV3Hsaj3UGOf91j0ODRE
         hku+iXZQnxO93wtWtLs4wyFNNK65FSnd6wCXG3jMVZqo8IVP5Q0i6eV6J9/MLITEtn9g
         A0vjPf6wxaBtDwU+sNrNQo2kIDisbXOdUdiD/OpvxHHraaLlC6oEXuULdTvCn9lnj35I
         S0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124445; x=1730729245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVZZiKyJj7ZnmSyKDxiL2Ewqy8l9yzTHRtpEpGvvetk=;
        b=LC1OlwM/1QpcYCy8w/0jQ3vr/vLAu7/IZVYbGntpYKL4P/qBE80H37OmMk40QTNfcV
         /u/GJ/A41jOZrrFtVDVIzJmnc6vC9v06C82ttgQGH1fXSZwhDvctlAWSCbA4CU6Xc3ii
         uRF4bq4MT8KKqDcZ5h7bQPXwjcIy8BabYEOWAKjxYuo1rVQd6e/TiTHRsuuKxX93j6iA
         MSAQDgS70VvU2sg3zCcqtg/tTovuu1+7iaNXogjo2n+G6Txdx+xUtuk4zP2IMG3qNpP5
         8a3kyGQyWfVqH8l1DeYkVzTXm0IEEVp5agH6fdqQANMX94HMGY+seek0DDurNN3JG1w7
         NWRw==
X-Forwarded-Encrypted: i=1; AJvYcCV4uE4tF0Mt5HM9n9LBJK4zQAV6iGHQoa5P+ho91IV/inW8GSub/WhBE/Dy2NXtGiW0w9B2fKhosKkmqHD4o9mg@lists.infradead.org
X-Gm-Message-State: AOJu0YzHFSDpak7qS2DVxuNZpGO+2zlpW7jVjhCtJvWRo4aQ4PdZfL9j
	Dpcl7LrL0D6YJTy40acBdgvVW3prUyqPmNMNHYSVquxKHFbHi5nawtxU7gmuW5Wrc1Cw+RudqER
	KKI8=
X-Google-Smtp-Source: AGHT+IEQdbITjqhgIXETXbiDGS9CpxFITbMxPJxEoYU59S+9lkAwLuR8Fmvi9lRxn9X6MPz0PlOOOw==
X-Received: by 2002:a17:907:1c92:b0:a99:f9fa:5c01 with SMTP id a640c23a62f3a-a9de391b292mr763533366b.32.1730124445300;
        Mon, 28 Oct 2024 07:07:25 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dec7d16sm378731766b.21.2024.10.28.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:24 -0700 (PDT)
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 09/12] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Mon, 28 Oct 2024 15:07:26 +0100
Message-ID: <1f4cec50493ec5d3168735c0a005771787e5cd59.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_070727_710445_C636AAE4 
X-CRM114-Status: GOOD (  18.17  )
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
---
NOTE: this patch should be taken by the same maintainer that will take
"[PATCH v3 10/12] misc: rp1: RaspberryPi RP1 misc driver", since they
are closely related in terms of compiling.

 MAINTAINERS                           |  1 +
 arch/arm64/boot/dts/broadcom/rp1.dtso | 61 +++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/MAINTAINERS b/MAINTAINERS
index 06277969a522..510a071ede78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19383,6 +19383,7 @@ F:	include/uapi/linux/media/raspberrypi/
 RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1.dtso
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
new file mode 100644
index 000000000000..8d1bbf207a30
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	fragment@0 {
+		target-path="";
+		__overlay__ {
+			compatible = "pci1de4,1";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			pci_ep_bus: pci-ep-bus@1 {
+				compatible = "simple-bus";
+				ranges = <0xc0 0x40000000
+					  0x01 0x00 0x00000000
+					  0x00 0x00400000>;
+				dma-ranges = <0x10 0x00000000
+					      0x43000000 0x10 0x00000000
+					      0x10 0x00000000>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+
+				rp1_clocks: clocks@c040018000 {
+					compatible = "raspberrypi,rp1-clocks";
+					reg = <0xc0 0x40018000 0x0 0x10038>;
+					#clock-cells = <1>;
+					clocks = <&clk_rp1_xosc>;
+					clock-names = "xosc";
+					assigned-clocks = <&rp1_clocks RP1_PLL_SYS_CORE>,
+							  <&rp1_clocks RP1_PLL_SYS>,
+							  <&rp1_clocks RP1_CLK_SYS>;
+					assigned-clock-rates = <1000000000>, // RP1_PLL_SYS_CORE
+							       <200000000>,  // RP1_PLL_SYS
+							       <200000000>;  // RP1_CLK_SYS
+				};
+
+				rp1_gpio: pinctrl@c0400d0000 {
+					compatible = "raspberrypi,rp1-gpio";
+					reg = <0xc0 0x400d0000  0x0 0xc000>,
+					      <0xc0 0x400e0000  0x0 0xc000>,
+					      <0xc0 0x400f0000  0x0 0xc000>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+					interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+						     <1 IRQ_TYPE_LEVEL_HIGH>,
+						     <2 IRQ_TYPE_LEVEL_HIGH>;
+				};
+			};
+		};
+	};
+};
-- 
2.35.3


