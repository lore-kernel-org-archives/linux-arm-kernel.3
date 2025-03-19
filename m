Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F72C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qcu3jY9KMaHOfphKfi7ZmlunMsnQwTpMnv18LDk4Xi8=; b=ZDG+RvJ9g0q/ntA7FHqvHy+kAV
	34BLE4UmYbveuseu8MyoeAeqiMATFw84TlyqWcyQhnYDT5BaJ+VGW9XqzT6UFvmwNjT6/aK2Ptj84
	lUNzGP96bugIBqmU8ewj7OGR77R6d1yOSw62BEzxUmdpfZxlnZuiPuk8sys3YyUMegYsnYyzQLMSb
	YbNVeiD5OKOMNIdYHQqwRvcujBKXAQj/4scrhGUXJFeliXwuuGBFAHq/4+Bn0xHsa13POMmALdvSu
	3n+CbZadQMi4Tmj8AQ3pP3BA9tzpG/sP/O1cGnJ/ZtDPL66ktKF3vSBkbaK7l8ISvHDA/JG6QC/99
	2EW5FXjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1XJ-0000000AFHE-3GHt;
	Wed, 19 Mar 2025 22:05:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1K0-0000000ACRa-3v8G
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Mar 2025 21:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Qcu3jY9KMaHOfphKfi7ZmlunMsnQwTpMnv18LDk4Xi8=; b=KWiSmn0haiEwxGdFPxsauGotIK
	zg8xQkJv2MDXbyR6l5RMifQgdFvC7of0wYO5LU8Wbs2yaQnfGODcVLuOcMZ6cYa9+UfWvbnIh0pAL
	fL+VvXjf6wVypjZLGtByC0cbnwUCdXreamr50agZoJF1jwmMMBXYUutZHcJFjixUBhgMlJAGGAT5W
	HVSQ21t57rYgEDAqlyGKG/mu5AN0adoYQK3XZvsVhIjfyowjJR55fjMpqkWATjDYR3lgPpLBtUBTr
	fl9EHwZ6oyCANK5WhhNuUehUogRlsMqGD+cAVl+WmQ7a78AJeYXCi4mIa3ZPULUzZBPGbbAz8A2VY
	zJTi4pRA==;
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1Jw-000000041Eq-3Ymm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 21:51:31 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so29546466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 14:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421085; x=1743025885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcu3jY9KMaHOfphKfi7ZmlunMsnQwTpMnv18LDk4Xi8=;
        b=JGZPo8Cy+tckJqDzbc+gCz6G0HeB8Z9OpCVXVYoZih7aBvoGH4YXh4/uTGDOB7Elg2
         sK8CDRqKd9mvNwZFqHjuQ3/PiZbJrKe/2rG1cn0BsEZH+h1ZBSCQVFFGzJpwxYyNy4uq
         WBv3A6saA8It+6Kyw3jSVTb4HzkkkLcWNomSTBDR/QvTxnwrkwz0wAiFQh0XyaxI9ILT
         hEvFyoM13EAGQxFVKUXS1nBEG1E9N6JeizEVxc4HZ66YOQ+w/AonPMXtj2hOb07zUfSp
         erZ8xJQfPQ/marcMRa5Ssf2n5uqTQQJw88ize2nZ54IwFLBkiLZi9Zg8o7XxWU9snxAd
         erJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421085; x=1743025885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qcu3jY9KMaHOfphKfi7ZmlunMsnQwTpMnv18LDk4Xi8=;
        b=e42xitgpojswIkj1sFOYUG/JQ6rHdW5MJh0xvzBKfGO4FAO8TrbXPqG4GxeTcJzNym
         34/k5QcaiSmIirNWARLi7ocxOMetRmCMba/lzO7HZGbzQi5y3kDaDU8vfS+5qAir/OIH
         54nVsXp1W2qTM7dW5NcEYx2jrHFD+FjkwBOSaz6rqpIqo78npcVRRNLivicLrGQWZ9Jv
         OmU0X0lRXEVmWGnXQyW4FgaygWI2WTcd9nFgJgGJ0MKQ4NL4OAJysItEMYS9Pv4wVsDC
         3kWkrSZxbHL4Io0R/CTBFakUPejxnfy9XMuIvU0t18SzcSRlywH6s15hugAT6FZRLSqr
         HFPA==
X-Forwarded-Encrypted: i=1; AJvYcCU6xcPf2FuX+4aqQvzhBeD4v81QH+IcEJWRantItHpXwdrYz0WtMJ2yf86SdNf6sG1DSOYRshH8VloVfuf0a9Ao@lists.infradead.org
X-Gm-Message-State: AOJu0YzOtU95vbwUjLZ/8lYrCaksw5LcYIT6rVjoa8afMyePAf/Kjmsq
	EUL+ZmHF82vRFnp9bsaOkAU1E8cHcBAjN6yDIL4XeryJ+rL31u+mUiRfzK5tSWg=
X-Gm-Gg: ASbGnctHfD1TjCNUQHLZ9ol/qcOhUBj4Yic0TvrQy4c6UA6arFWUf+IBpNT334zwrCd
	PWg4g7/cq5PtkV+6MUmB6lYIcNm546Mi7/ToTzGC6x92l7Tp7k88XV+ieeKl7SHo+/NanaC7yg/
	WYyXfuBdR8AeTc9g7ot4J6ktyRsCarmBOXqJmyiihGaLTUSvvFKekWqbEYkNzEbdYO7N6gzUuoH
	GQaSGOewGqZJfBauMj4X97uHs+/0MjFtFTArTHdhlvqg7f+ttOyinWfMGJuIPVwHgR+XbxSXPmg
	Msu/jJoNFEDzUKcYQNH2i+Di2nIasIi0q73EZHmRCdBo8nBSPciOm3y1KBkyY5RMZwFAmJFJDbY
	G4B6le/XaYIiXGjHoBQVM
X-Google-Smtp-Source: AGHT+IHFXfT9lXYiw0VBkO6IJXON72H9MpCPzvj4UZ6S/fUWMDlO/HCZZlj2Y3SL16VUaUUCvGAphA==
X-Received: by 2002:a17:907:6ea9:b0:ac3:49ee:c5aa with SMTP id a640c23a62f3a-ac3b7dcf606mr456627066b.31.1742421085164;
        Wed, 19 Mar 2025 14:51:25 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a9d12fsm1059807866b.163.2025.03.19.14.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:24 -0700 (PDT)
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
	kernel-list@raspberrypi.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 01/13] dt-bindings: clock: Add RaspberryPi RP1 clock bindings
Date: Wed, 19 Mar 2025 22:52:22 +0100
Message-ID: <342a5ba676f7af34827cdd9ba8f10ba295c93022.1742418429.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
References: <cover.1742418429.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_215129_231858_8567B3F5 
X-CRM114-Status: GOOD (  16.67  )
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
 .../clock/raspberrypi,rp1-clocks.h            | 61 +++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
new file mode 100644
index 000000000000..cc4491f7ee5f
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
+  - A. della Porta <andrea.porta@suse.com>
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


