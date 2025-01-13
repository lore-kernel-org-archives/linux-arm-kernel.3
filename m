Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF86EC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNkcoMI8KVkLdMTp/Wnf7EJlHExvvawc0wHJ3X9W32s=; b=rc/jtETmTmvbQ3OX52w9lbNBtZ
	g0nJ86XlgY6SUCkYSxiWjXnwhISMx+//moeY0mm1yfC0rJcCPxJbYKNM1vz8mxMpYeDUqy2gA143P
	R7o05FxQRwsWkjoPLb0Qxv84QkjHdY19n0z+RiyC26VKeF6nHC8CR2zbfkRJL/1RUXz/Hyj90uzyR
	BFDrmdhejjVR8lZ8O8GP9ncNEROwS+btd6hPTlELxICrl8NV5m9zwqqhmI4U3KpADYgCVntRnEg0s
	qRPVy2Z3Dg3piFMGJO83/8SObFuwpiojWwBk6Srd9OEkOShCzCLVsxGKshilnMWVDjAWuAMukLBJw
	BTJI0gFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMfM-00000005i8h-30i3;
	Mon, 13 Jan 2025 15:47:48 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLsh-00000005VvB-3D85
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:57:34 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso627781266b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 06:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736780250; x=1737385050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNkcoMI8KVkLdMTp/Wnf7EJlHExvvawc0wHJ3X9W32s=;
        b=cro7OuWh0b5fPCg/veQBm5fTUpRSy7SP8Dn6mW3SODvjBwEKlLKetAwRaZWlmMGzIY
         UuMyXc3hSJo7yTQr5NWfktr2zvtGbJdVDf37uVIabLe7xYXCr6sor/Fv2NqOGIJwNNEy
         MHc9xvYUP+wwJpwtQkcg6QhNyRP3pTxGnx1dJilcL71Yv0gZ6upJm/RQKVeL3fHJ/Phk
         EOiJ8vv6DGJrP8e8jI0XiAbVO39MHBFDUSqmMaVQ3jMGbtvTT8yteHc2xk/RcJkuLwMs
         rc0nuuUo3p5oT3W4s6qOuH4McEy7hpMkyLxvK0BhJJY2wqE3K9BYhaQX6z0Z5kpFlYHF
         fu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780250; x=1737385050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNkcoMI8KVkLdMTp/Wnf7EJlHExvvawc0wHJ3X9W32s=;
        b=MJmwYQ/pdJ9XxMNqbRuvQK5HRXto4PzOg6snwlrkNYDwiJCJy2bFg0lc7fOZ8A3RYX
         S3GDjxqBmII7RLFllLgaueBHr+zrlTH0zwtqADeeXYd1k6+XmNcFh5pCy61hpLPOUyJv
         eq6sKwhJM6QK7MXx/40z/qml1ZAmtNimWk/JeiWu3gV9mgX13pR97hHQmH7mwZMjzI+k
         X3D8l19EntyU3DYsgIYkQ4j6YPkOjECeuc2TYfSMXGLasq+q5yWKcoqtgbz5lg2LLYbp
         vsAt6DV7YDB1Ts30se/3HBTrW1+9o4WzlHPZxAyWp2cN25c4gRikT0xYs2s+8tS3hax6
         OxVw==
X-Forwarded-Encrypted: i=1; AJvYcCWE3r927XmlekHZuqZAS4p8DllUZ2pYf9AWFK31ri0+Q9hMhUOVGVfnnMZDcUw6TblL7mJx65PE9LDMniLJ6afO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5HGv6WijXo+uK4+bNY0rMoJ/mDxMiSXyTqsgJd94UPZELxe6U
	jw95a/aBPZ7oFn+P56AcP6u+xN0yWLGyB5lBfZxZYuocCkDgp6uleQw/Et7+3lE=
X-Gm-Gg: ASbGncsdJDXDFkeeTpNolFARH4J37xAm9qmhbNO6M8Wzop0vzRRxIul6aQTfyl3gar1
	5E+r2y9xmOY33Nfba8Em7ROd6gVXv/hLBl+pu9NjmQF6sVYly1crk5Fib+G2CQWiLOf8eQtVRVw
	Ccf6ANeBiTRwSwgM2NEd64sb/eFghthvSuY7ghlaLQVK5QDaH3IcI8Yzc2n/pHtirQMxXSjiQTA
	0h69WRf4ak/aaTZCOtrDvUxaZpS5ezwlyh55BXfuIS9wMwJ/z3RK0ZNDYKhxhureeAF7n7ZwI1S
	t+2IdTBq7BY9QLW34/wxSf2yx+8=
X-Google-Smtp-Source: AGHT+IE0lB/Z/M0JENSutXiuKzUpKT6XRU04v2g7l/oehHu7+mE7WUzdLqmrfCaPku+KevtO9JvYLg==
X-Received: by 2002:a05:6402:34d2:b0:5d0:8f1c:d9d7 with SMTP id 4fb4d7f45d1cf-5d972dfff46mr45266300a12.4.1736780250364;
        Mon, 13 Jan 2025 06:57:30 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99d05bec4sm4450960a12.14.2025.01.13.06.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:57:29 -0800 (PST)
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
Subject: [PATCH v6 07/10] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Mon, 13 Jan 2025 15:58:06 +0100
Message-ID: <528c8c136b31483e345d07803b5e8ae5d2cb1b68.1736776658.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1736776658.git.andrea.porta@suse.com>
References: <cover.1736776658.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065731_855539_E066F48E 
X-CRM114-Status: GOOD (  18.07  )
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
"[PATCH v6 08/10] misc: rp1: RaspberryPi RP1 misc driver", since they
are closely related in terms of compiling.

 MAINTAINERS                           |  1 +
 arch/arm64/boot/dts/broadcom/rp1.dtso | 58 +++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b8e87b8d6de..fbdd8594aa7e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19577,6 +19577,7 @@ F:	drivers/media/platform/raspberrypi/rp1-cfe/
 RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1.dtso
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
new file mode 100644
index 000000000000..cdff061e2750
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -0,0 +1,58 @@
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
+				ranges = <0x00 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+				dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+
+				rp1_clocks: clocks@40018000 {
+					compatible = "raspberrypi,rp1-clocks";
+					reg = <0x00 0x40018000 0x0 0x10038>;
+					#clock-cells = <1>;
+					clocks = <&clk_rp1_xosc>;
+					assigned-clocks = <&rp1_clocks RP1_PLL_SYS_CORE>,
+							  <&rp1_clocks RP1_PLL_SYS>,
+							  <&rp1_clocks RP1_PLL_SYS_SEC>,
+							  <&rp1_clocks RP1_CLK_SYS>;
+					assigned-clock-rates = <1000000000>, // RP1_PLL_SYS_CORE
+							       <200000000>,  // RP1_PLL_SYS
+							       <125000000>,  // RP1_PLL_SYS_SEC
+							       <200000000>;  // RP1_CLK_SYS
+				};
+
+				rp1_gpio: pinctrl@400d0000 {
+					compatible = "raspberrypi,rp1-gpio";
+					reg = <0x00 0x400d0000  0x0 0xc000>,
+					      <0x00 0x400e0000  0x0 0xc000>,
+					      <0x00 0x400f0000  0x0 0xc000>;
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


