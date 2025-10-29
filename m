Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBC3CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bec5DtjUMCMZ+LaW5PfzvbvdukX10M0RMuKRh3c/XPA=; b=Ozbv24BAkkbAMVhsHSApb+FZ4T
	PUAZ2GixuVaIBoldAQz7i5MfIOcz6pZ+56V3cyBy/PQg8FnJBoW9X+cdgckyTmUFc5JjptclmWThQ
	myVvhpdZZOLQfOClzT0saeIdDooCT/+bhqTpfsQEkd0rfxiY6gcPjU8meue8adJ9ZfdJyRfpYIeS6
	Mv0/njq68lJMsUacDeWIDMScjQ66+S1y/HLhMWDSIawTKyqbJTvbvpSmxFPYfOaTwiXJD1j9fbRX/
	e9WflndDFaJJ5JKsVlkB0c6pRCAk3A/n7IeSkNCEqXnhf8AW1DxhAEe+QOQMewko5HG0FPhq8Cti7
	btqO4IrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEA77-00000002E7B-3z48;
	Wed, 29 Oct 2025 17:37:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEA72-00000002E4b-0Mhg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 17:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=bec5DtjUMCMZ+LaW5PfzvbvdukX10M0RMuKRh3c/XPA=; b=XxTdx6rO7UsLm15zj5AF/qnr2w
	MwT0eF+AMbgl+VzZLnIt9PSKBlA+npHWt+zeKVuMqEsDXO5epbjTIZgvzvKMLqWYBYdIYoZAvVxZ9
	9vGJeixMqXPf6oyQuRLulV+O0cXgD8Vx1TrTMz+/euUJPDI+ard/7OZRX4ECm4CDH+os1INW6xACo
	JnAjkfJaI+wZHddVDb54P06lGEFUG+3r3CW09mNS0SxgbPxVtgh+tiqdu5Qy2g6ESgdlQwR/IFOEl
	XTtUYYqfVnvMB55yJ/NWklHA+9EaMzz67bLVDZYFEZcW6T+t4NWQTyIhwRa0bhMEv9bipNQD/yGlN
	yJ0vFX3A==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE9FE-00000007T9e-1r8J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 16:41:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-427007b1fe5so90324f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 10:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761759446; x=1762364246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bec5DtjUMCMZ+LaW5PfzvbvdukX10M0RMuKRh3c/XPA=;
        b=LIbfj/hJt1DLt1akLLbWS8xGmCo2f7VVMy61tzzUr/Dr8kTfngfo3H09bg2cDlijkc
         /Rf6CYeTEfQ3Xv2rGwQ1u5TeAKuOg/g4RYL9CwDDpvyI2DdDOUlmSQ7d/oxvJncumIg/
         OdO191Or5ns5O1NdnzQq8u1puhWthnJhCGZwCpgjfvlM2WW/QzgkmyoyCipfuwxOXaqf
         nb3G6zJXxNvHbKZdcqsytbpSGJxmdBI/NZS/3Y/pdVyYQcsD5N/OlMjzIjdr/gEsC98W
         B/cqGhGSrI/QNdyZq5/Gtwg3hVsbqfxNehUVXTSgppy7Zsu4CqOBYx6CghFEG2LOIrrM
         S19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761759446; x=1762364246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bec5DtjUMCMZ+LaW5PfzvbvdukX10M0RMuKRh3c/XPA=;
        b=WyQEA5FnxZ7OjwcV/P0DJN2FENY3OpSpz/SWrjYaNF/ij99CukH6wje5EYG/+5b+DB
         MEXb58NJ8/UhdoIb1NyKbewskzFaAiHfN4CJ9+XjqDGlgiCG5oxAwBiCy6QUjD6+soJy
         xGcIw6HhfSw3Vf1uL7oap8hEu6nxE/Wj776XZrKatV3LUeFq3x52pfpCE5BK60gds0QI
         ESOCGDUbsjvR10yJx+VF0PQYhECsedPLHgB7zKJd7OJzKx7ZMsfj9IkIr1mDro35jqpy
         9v1vhd1+glFPJDEdHaqGxhYH5DY3JDS94uAXg1Y1Y5R8E1cDia9d/XPwmA5rneSzp22w
         SoQA==
X-Forwarded-Encrypted: i=1; AJvYcCUCCs0jwa5SKtRsHMU1QNJ1hTq6bBrMAQcGGhceg4tVPUzQ+vpn0E3a6k1UEYDox8iazsIWHCu6I3yWQOZuz7mz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn+1W//e4dtZ0Ngw5oc4/wfltKvNENVK7GhtOh90DCUVAPClmo
	PPtW789U0R5hwqoPSFmVZ5svQy+F8VFjHUAGIsp3t8hykiVQTMcMrC6h
X-Gm-Gg: ASbGncuD0x8745HNs/LzxpF9SX5yHEYCNSQqceE0OzEWSEbLSC8qUbiV34ertNyln+q
	jKcaGKDIB8acu4eRRAa7C9nhh0rRsnOGJpuQLM8GtD9NkGiaqF8E4BuOko1rjxiZkF0WELGqe3D
	ZDl37aemBESK6fLPb/V6vu/EC+jIcdiQgGyewYEL7YAVwRP22vekiezd0GQRb1ga+WPCDlCOzP2
	I5eTjeoNQae2oOp+70WQTb2TvJx1z+sAbm5w3vCJFUI9ZlMFpEAGEJCjaQn0xnBj4A8Heu+20GN
	SpGpmaP0KE1roAmnCqXu46DwmZFKyjORIL7vbsVBBkB0POkbgpOCcGwNBm4ccbEe7mNehHkB2Ve
	epEYKfT0xTIJiXyx2XFH9auR5KASdFhJd8rNZOJIk7i1erEaw9E1XeRrlX9I3TAxSMc2SutrExe
	KfezaFy6dlc11R/kFHEO1ggZ5CKqW68g==
X-Google-Smtp-Source: AGHT+IGerI4odt8yvZLvuwrqAAAQ1NsWiR0PnVGWdiklZSUkMpKCbKISgvvccIoZVLhmQ6qz4uNj3g==
X-Received: by 2002:a05:6000:2481:b0:427:151:3db6 with SMTP id ffacd0b85a97d-429aef7b230mr3253676f8f.24.1761759446075;
        Wed, 29 Oct 2025 10:37:26 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429952d9e80sm27493844f8f.28.2025.10.29.10.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 10:37:25 -0700 (PDT)
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
Subject: [PATCH v3 2/4] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Wed, 29 Oct 2025 18:37:10 +0100
Message-ID: <20251029173713.7670-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029173713.7670-1-ansuelsmth@gmail.com>
References: <20251029173713.7670-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_164156_553637_280162C6 
X-CRM114-Status: GOOD (  20.06  )
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

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

The first USB port on the SoC can be both used for USB 3.0 operation or
Ethernet (HSGMII).
The second USB port on the SoC can be both used for USB 3.0 operation or
for an additional PCIe line.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---

For DT maintainers, in v2 there were some comments, hope the new
description and names of the property better clarify the usage and
why they are needed.

 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 76 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 .../dt-bindings/phy/airoha,an7581-usb-phy.h   | 11 +++
 3 files changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 include/dt-bindings/phy/airoha,an7581-usb-phy.h

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..5106685c124d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
+
+  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+  The first USB port on the SoC can be both used for USB 3.0 operation or
+  Ethernet (HSGMII).
+  The second USB port on the SoC can be both used for USB 3.0 operation or
+  for an additional PCIe line.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+  airoha,usb2-monitor-clk-sel:
+    description: Describe what oscillator across the available 4
+      should be selected for USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  airoha,usb3-serdes:
+    description: Describe what Serdes line is attached to the USB 3.0 port.
+      Can be either Serdes USB1 or Serdes USB2.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2, 3]
+
+  airoha,scu:
+    description: Phandle to the SCU syscon to configure the Serdes line.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  '#phy-cells':
+    description: Describe if the referred PHY is the USB 2.0 PHY or USB 3.0 PHY.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - airoha,usb2-monitor-clk-sel
+  - airoha,usb3-serdes
+  - airoha,scu
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/airoha,an7581-usb-phy.h>
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <AIROHA_USB2_MONCLK_SEL1>;
+        airoha,usb3-serdes = <AIROHA_SCU_SERDES_USB1>;
+        airoha,scu = <&scu>;
+
+        #phy-cells = <1>;
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 8085fdca7bcd..af23c590bbc6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -763,6 +763,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+F:	include/dt-bindings/phy/airoha,an7581-usb-phy.h
+
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
diff --git a/include/dt-bindings/phy/airoha,an7581-usb-phy.h b/include/dt-bindings/phy/airoha,an7581-usb-phy.h
new file mode 100644
index 000000000000..efbb0ae75e3a
--- /dev/null
+++ b/include/dt-bindings/phy/airoha,an7581-usb-phy.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef _DT_BINDINGS_AIROHA_AN7581_USB_PHY_H_
+#define _DT_BINDINGS_AIROHA_AN7581_USB_PHY_H_
+
+#define AIROHA_USB2_MONCLK_SEL0                 0
+#define AIROHA_USB2_MONCLK_SEL1                 1
+#define AIROHA_USB2_MONCLK_SEL2                 2
+#define AIROHA_USB2_MONCLK_SEL3                 3
+
+#endif
-- 
2.51.0


