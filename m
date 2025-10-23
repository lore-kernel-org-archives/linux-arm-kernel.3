Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D89CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 17:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+RlscW0fJPcI4w1cVrsdBX2mHMbYD0iZ1loDXnboKus=; b=tFGet0OubUwHBtxCdED2vCDJaw
	c2WSdFl6cI6T1kMLa/SPgPz+MCZ/x/bsyfP9AAWsWklg3zT47DMy0Hzm1tlbFaSUFywTkZUZ0mgZy
	2vMVLc96ZFNlt0ZN476CSvBWD01X77OiWuL1wqj2Rr4BLU/V/BZptfz+WUZWD1gqoHwpGm6yK0DWc
	pEaPWulGIsdEfhLS+GpxpT4juTUpXEB8mwCGJf/0EWu6qdSle/MM9vw4uz4SSZ/3ddcv4TsIYvITf
	FEGOUUAhjJwXmWvAjLnvkZGijSeL6xoUn8bWR67rsD9INv3erULWb9K6KK2y5BqiLZkIYcOlVRj6d
	77jRZPNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzJY-000000076En-42ig;
	Thu, 23 Oct 2025 17:41:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzJV-000000076Dw-3CfM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 17:41:27 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2947d345949so6921405ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 10:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761241285; x=1761846085; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+RlscW0fJPcI4w1cVrsdBX2mHMbYD0iZ1loDXnboKus=;
        b=axSUDvY1+oBRGzpmZfr8U8uvWGxXH5pZUdZI0k+0xli8v658cfiOYtIMB+0myKZqGJ
         roE5Qmx13heRd73xIoGPqK/kqHS1OgaDYMTF2LUqW6FdCsshEcXa6qx6Yzl35e0Nfj2K
         TDwvimqmUiMPsj84a1aVpT7pCK8H8cJ5iPQx3V0VMxmyzageQgGk4IVnjwAtMXJlJj42
         DlheMqTzw9pIzv7WfKZpDZmUStfRExs/tt/WuYunhhq4E+3KhroywGuZvnMFy2TsDkQn
         iO40d9AXHJaMTaZsyr2LzhyC2EPI/ihsQq9MEkLNXTpSgOUPyUgaFgOifIu0EY38wNHS
         XFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761241285; x=1761846085;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RlscW0fJPcI4w1cVrsdBX2mHMbYD0iZ1loDXnboKus=;
        b=IkBJr4/9bYDZlXjkrCUw25MSM6cNDXWoN+9hdJ1SfivvMWSerrZFWCu2WaUHyPxtJp
         CmNq0/C0Pzz35kx0drFT4mvXQNbdZ3poYfM9xZiZjWSgbA3NZFX51npggymnrcGxVzRp
         8oUdEMj1E47HTT/vlmpJ00OmRkX9ZDYzPRweUz833juIjKsjDoyfJTzDjAY8hHPWU7/e
         1dbbQAHFSlhsbRrBmQ57rx8r5Y82fc1OEZekvFV4X7dsd26bCN5skhA13d3nenSp9f/M
         KVshixiy2L8y8FFnuERP+Cj0abz7eTM7UDW7abG4lNXeFqEHAMLV91d+KJ8nWMpjFeeb
         pgKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX+PHAg2lx1MFZjI3OVD/pCAtQdRE7//QOlgq277a7W5ExAS9fwhbR0jRG1LxD6x7hIAU/DbyBPyf3Lqy5ZBbc@lists.infradead.org
X-Gm-Message-State: AOJu0YxEa/SEoE92cUGcGzmFPb05Ahz/iLObdwDylqceGCyHEmw47gY4
	HECQOmRRQ7GsnpgYA5Y5qY3af/iXcfzQ2GoEzsrDcnBneTAjKEbnkya7xRx/vg==
X-Gm-Gg: ASbGncvG21nd4C1M1DzTG0eJBn3Adqt82n+hnJufQNHS15D2KXpl85z94pokKQw4Pxc
	8b/hH9C68+afvkqeSpeKl51x18OxV+FXCAoCfHd38oF9g2G6v0a9ljw+NUH41TlAh6WiTW5rOnk
	U5wkk8uuO8e2j1vac4XCDTfIEDsdoSXjMeUbHjxSc82RMxj9QTysvWLpgXix0SKJ/cVVhgLzJsc
	Uk99/w1n2EMc2SNiyTwgm+UafhTaXxcyfcHA8UTty9Z7MqdkWoDtmcRd6zQl4wZJDR8BAdmHMv/
	8h82+EqfwT6zl3MCp04Gej774o/TumuFAs/WGG9/FlaEZ/Wm+F+GdWX9RkcfTt5cFAzRn7tgNq2
	zDZP0bNZvwB3WunI7Rle5yMNURRMEfJbtl9KfCAQUuzT8RoMrciSQIacEwjo1uaORU+dzIkD8iC
	Sc2S9OrOM4W59TsQiEFbtx3bpDJhhJIpI=
X-Google-Smtp-Source: AGHT+IFfxGetZxOYzBkLMbSAX9vob0YlVWtcztLEw1yU6xI6aPUDPEqjnKvkoiTPdJH966r2PqACrQ==
X-Received: by 2002:a17:903:2443:b0:24c:cca1:7cfc with SMTP id d9443c01a7336-290cb947830mr310655975ad.59.1761241284484;
        Thu, 23 Oct 2025 10:41:24 -0700 (PDT)
Received: from Black-Pearl.localdomain ([27.7.191.116])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2946e21fbbdsm29202205ad.99.2025.10.23.10.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:41:24 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Thu, 23 Oct 2025 17:37:36 +0000
Subject: [PATCH] dt-bindings: mmc: socionext,milbeaut-m10v-sdhci-3.0:
 convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-milbeaut-v1-1-3e4ff67110ad@gmail.com>
X-B4-Tracking: v=1; b=H4sIAN9n+mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyMT3dzMnKTUxNISXdNkAyMzc6B4qlGyElB5QVFqWmYF2Kjo2NpaADb
 XLoxaAAAA
X-Change-ID: 20250524-milbeaut-5c0267202e2c
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_104125_815969_3388B1CC 
X-CRM114-Status: GOOD (  16.74  )
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

Convert SOCIONEXT Milbeaut SDHCI controller binding to YAML format.
Add a new property "voltage-ranges" to resolve dt_check errors.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/mmc/sdhci-milbeaut.txt     | 30 ---------
 .../mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml     | 78 ++++++++++++++++++++++
 2 files changed, 78 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt b/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt
deleted file mode 100644
index 627ee89c125b..000000000000
--- a/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-* SOCIONEXT Milbeaut SDHCI controller
-
-This file documents differences between the core properties in mmc.txt
-and the properties used by the sdhci_milbeaut driver.
-
-Required properties:
-- compatible: "socionext,milbeaut-m10v-sdhci-3.0"
-- clocks: Must contain an entry for each entry in clock-names. It is a
-  list of phandles and clock-specifier pairs.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: Should contain the following two entries:
-	"iface" - clock used for sdhci interface
-	"core"  - core clock for sdhci controller
-
-Optional properties:
-- fujitsu,cmd-dat-delay-select: boolean property indicating that this host
-  requires the CMD_DAT_DELAY control to be enabled.
-
-Example:
-	sdhci3: mmc@1b010000 {
-		compatible = "socionext,milbeaut-m10v-sdhci-3.0";
-		reg = <0x1b010000 0x10000>;
-		interrupts = <0 265 0x4>;
-		voltage-ranges = <3300 3300>;
-		bus-width = <4>;
-		clocks = <&clk 7>, <&ahb_clk>;
-		clock-names = "core", "iface";
-		cap-sdio-irq;
-		fujitsu,cmd-dat-delay-select;
-	};
diff --git a/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml b/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml
new file mode 100644
index 000000000000..6b67bef30347
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SOCIONEXT Milbeaut SDHCI controller
+
+maintainers:
+  - Taichi Sugaya <sugaya.taichi@socionext.com>
+  - Takao Orito <orito.takao@socionext.com>
+
+description:
+  The SOCIONEXT Milbeaut SDHCI controller is a specialized SD Host
+  Controller found in some of Socionext's Milbeaut image processing SoCs.
+  It features a dedicated "bridge controller." This bridge controller
+  implements special functions like reset control, clock management for
+  various SDR modes (SDR12, SDR25, SDR50) and physical pin property settings.
+
+allOf:
+  - $ref: sdhci-common.yaml#
+
+properties:
+  compatible:
+    const: socionext,milbeaut-m10v-sdhci-3.0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+
+  fujitsu,cmd-dat-delay-select:
+    description:
+      Its presence indicates that the controller requires a specific command
+      and data line delay selection mechanism for proper operation, particularly
+      when dealing with high-speed SD/eMMC modes.
+    type: boolean
+
+  voltage-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description:
+      Two cells are required, first cell specifies minimum slot voltage (mV),
+      second cell specifies maximum slot voltage (mV).
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mmc@1b010000 {
+        compatible = "socionext,milbeaut-m10v-sdhci-3.0";
+        reg = <0x1b010000 0x10000>;
+        interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+        voltage-ranges = <3300 3300>;
+        bus-width = <4>;
+        clocks = <&clk 7>, <&ahb_clk>;
+        clock-names = "core", "iface";
+        cap-sdio-irq;
+        fujitsu,cmd-dat-delay-select;
+    };
+...

---
base-commit: 7bac2c97af4078d7a627500c9bcdd5b033f97718
change-id: 20250524-milbeaut-5c0267202e2c

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


