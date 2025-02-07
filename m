Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2196C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 21:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40fBozq6c0TkdqArUgdBEkwINdlhv9dUFzf9IoId2GU=; b=uOVmEwvMqbQhaUCA440w5y4TrO
	wQN90li3Qr3xYM1TB69hrh8ZF6agil+PMVNvS6XOX7TlxZKuF067Fp8DB9C/WTseBXBSeeBSkb+1I
	tlj346tqpb14u2mJ3vqhcqqtGAM4O4s1T14oTqjnG6COaRfKbjYBKTS4jFNPkyJQuNOBnLHgVjcgw
	zaL/8TS5mc6nrCvsKhhySaiYh8WGBwhQjAJU4NU4LzkJ/pfdFujx9K0XgYMN83QuZ+6ZM0GxQZFtl
	0AHnpHERgZkx/VtqrSAa6DsKKnfKGmnZ5f8zerm6VSwZX91JQk/DPvff6u4lPHAS24ksTFLnTs/0p
	d69ezCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVzX-0000000BFQx-30sK;
	Fri, 07 Feb 2025 21:34:27 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwB-0000000BDKG-1ZJm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 21:31:00 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso6895007a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 13:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963858; x=1739568658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40fBozq6c0TkdqArUgdBEkwINdlhv9dUFzf9IoId2GU=;
        b=QcTZZVUJ3PuiU8QN8X0t1WcQFQgmOxjrt8xbOtg2VY0VzRyam6b4BxNECFUpxtSg9K
         El/2iE+iI/haqYPwChj8YroaQC1GERTQZe8IEbRLSyvLtv6Ssp0f4Jz4W/RTosDunuFb
         TX71B3MCwtaVmsLkP3o6DcyyLXq1x/wb9vAnzMXGTV/RO+ebxpwn2++3ISEh/eYITOMc
         bJkfSFyeXoR5jBmsyCAym6UV0AUsF6Pnvgp7iIiWdV8NT1w9xouCme6NHxGz7FTYuukc
         twu+w9Sv+NHJAehlG0BMpqq3qh7vZLxwQcR7qWQZYRvichF8b8VM6Lwzxe3dCdKpZfmd
         0qRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963858; x=1739568658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40fBozq6c0TkdqArUgdBEkwINdlhv9dUFzf9IoId2GU=;
        b=PlzEbtjKIZzMe6/cLtgJwqZ1/g1BHjhjY4cQt2xZCPo4Re6S07Z767slblVVeF9m1k
         4vAiJ9PL00H8mMVbExX0OJvjPc4f3kas9Rxmg2vhMwuZZ7xjdpHc0C8ld2hCtZ+ywCDP
         XmKsU5ykFFoZUx5zgX6tI4O8soLug+B/tNEQj0L9MD84YQrlHYEQ981YdIoKuDBmU7Oa
         xjIe76HbTuAcR40kMJSfsKRI4WcRbf6BXFecL6dMalI9PlyjzI4zEXwKYNdxnENwBYKh
         D9CpLRIWCQbDlHcCzqkU6iNHuqR/akqlNLb5oM1E1I4HDODSslOhFBx62OMonT2hMEFR
         LeRA==
X-Forwarded-Encrypted: i=1; AJvYcCW6LKYfDRzmHZ0VRdXw+TLSi67pa7Jjb/pKh3HGVDnptqG+COYvI7Enm0bElYvnRncsuox18DSBdf96NUPOzh16@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy+R/C5l0LiqSDJXGqiPXsp6G8ZsH5z9ZeCBfQuC+zo/JPrKRv
	42X/+RtJYHUerok+aNy92yGcM9lDlvw5pwjvRzOCN3zVT27Vr/Dk2Fc5dmDmg8c=
X-Gm-Gg: ASbGnctFrbvN4PL4VgoY88UgKxNAGCH2D7BA3pIGSnMrmvICqhIF26d5H9O/pRlVPPk
	mk2NnFpChhg0OPqZKGLy0eo2mrgh8qaGtqDL1+GWR+YjdDvJnOn8RyuWtLIKef+4o8643WuEEh8
	VjlCDJ8kCF2CflcucGdNjmUv3+PQItCAckU+Z8m1mDPyJIAi+wuPSYpqlIpM5cKK8/4aK+sJkZh
	/R2y5xbLxhPzMBemX7mAQPHTPXmaUrYrOnfWZJNQtp4QhFzG6FzQyR3uOgOLNTKCR+yZQAyS/Wc
	6f/O+Bs6nu0hqmW5ALBcu0kUKxfgoLyJN8gYUrmjre6wQoRpPInUzp7+B4g=
X-Google-Smtp-Source: AGHT+IHdgQJ7DwynP053GuIeTr8ET1fqfbj4b4w2jAvtUK8o6z4D6NWZ0Lj9wjRmGi2DVjCyZAY3SQ==
X-Received: by 2002:a05:6402:278e:b0:5de:5a85:2f1f with SMTP id 4fb4d7f45d1cf-5de5a853144mr824186a12.7.1738963857569;
        Fri, 07 Feb 2025 13:30:57 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b80fa5sm3198428a12.34.2025.02.07.13.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:30:57 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 01/11] dt-bindings: clock: Add RaspberryPi RP1 clock bindings
Date: Fri,  7 Feb 2025 22:31:41 +0100
Message-ID: <915c345d51f7743ea0eeaa814249fc366c0757e9.1738963156.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1738963156.git.andrea.porta@suse.com>
References: <cover.1738963156.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133059_415992_5877D655 
X-CRM114-Status: GOOD (  17.92  )
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

Add device tree bindings for the clock generator found in RP1 multi
function device, and relative entries in MAINTAINERS file.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../clock/raspberrypi,rp1-clocks.yaml         | 58 ++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 .../clock/raspberrypi,rp1-clocks.h            | 61 +++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
new file mode 100644
index 000000000000..19af5eccb8cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 clock generator
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
+
+description: |
+  The RP1 contains a clock generator designed as three PLLs (CORE, AUDIO,
+  VIDEO), and each PLL output can be programmed through dividers to generate
+  the clocks to drive the sub-peripherals embedded inside the chipset.
+
+  Link to datasheet:
+  https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-clocks
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+    description:
+      The available clocks are defined in
+      include/dt-bindings/clock/raspberrypi,rp1-clocks.h.
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+    rp1 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clocks@c040018000 {
+            compatible = "raspberrypi,rp1-clocks";
+            reg = <0xc0 0x40018000 0x0 0x10038>;
+            #clock-cells = <1>;
+            clocks = <&clk_rp1_xosc>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..266569c1edd9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19748,6 +19748,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
 F:	drivers/media/platform/raspberrypi/rp1-cfe/
 
+RASPBERRY PI RP1 PCI DRIVER
+M:	Andrea della Porta <andrea.porta@suse.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	include/dt-bindings/clock/rp1.h
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
diff --git a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
new file mode 100644
index 000000000000..248efb895f35
--- /dev/null
+++ b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2021 Raspberry Pi Ltd.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_RASPBERRYPI_RP1
+#define __DT_BINDINGS_CLOCK_RASPBERRYPI_RP1
+
+#define RP1_PLL_SYS_CORE		0
+#define RP1_PLL_AUDIO_CORE		1
+#define RP1_PLL_VIDEO_CORE		2
+
+#define RP1_PLL_SYS			3
+#define RP1_PLL_AUDIO			4
+#define RP1_PLL_VIDEO			5
+
+#define RP1_PLL_SYS_PRI_PH		6
+#define RP1_PLL_SYS_SEC_PH		7
+#define RP1_PLL_AUDIO_PRI_PH		8
+
+#define RP1_PLL_SYS_SEC			9
+#define RP1_PLL_AUDIO_SEC		10
+#define RP1_PLL_VIDEO_SEC		11
+
+#define RP1_CLK_SYS			12
+#define RP1_CLK_SLOW_SYS		13
+#define RP1_CLK_DMA			14
+#define RP1_CLK_UART			15
+#define RP1_CLK_ETH			16
+#define RP1_CLK_PWM0			17
+#define RP1_CLK_PWM1			18
+#define RP1_CLK_AUDIO_IN		19
+#define RP1_CLK_AUDIO_OUT		20
+#define RP1_CLK_I2S			21
+#define RP1_CLK_MIPI0_CFG		22
+#define RP1_CLK_MIPI1_CFG		23
+#define RP1_CLK_PCIE_AUX		24
+#define RP1_CLK_USBH0_MICROFRAME	25
+#define RP1_CLK_USBH1_MICROFRAME	26
+#define RP1_CLK_USBH0_SUSPEND		27
+#define RP1_CLK_USBH1_SUSPEND		28
+#define RP1_CLK_ETH_TSU			29
+#define RP1_CLK_ADC			30
+#define RP1_CLK_SDIO_TIMER		31
+#define RP1_CLK_SDIO_ALT_SRC		32
+#define RP1_CLK_GP0			33
+#define RP1_CLK_GP1			34
+#define RP1_CLK_GP2			35
+#define RP1_CLK_GP3			36
+#define RP1_CLK_GP4			37
+#define RP1_CLK_GP5			38
+#define RP1_CLK_VEC			39
+#define RP1_CLK_DPI			40
+#define RP1_CLK_MIPI0_DPI		41
+#define RP1_CLK_MIPI1_DPI		42
+
+/* Extra PLL output channels - RP1B0 only */
+#define RP1_PLL_VIDEO_PRI_PH		43
+#define RP1_PLL_AUDIO_TERN		44
+
+#endif
-- 
2.35.3


