Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888E7E6ADFE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 21:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVF2WomVdPFzNIoefnUCnz93OVDZpJzBA0U6XyUPFKk=; b=tN4rClj9ILQELKxY/v7TZDxuec
	Pfg7MoANpucQErLb1pkgoV/oMGb7zzpv8NcdfRLayMcmwRuC5Z4UqXoAduaBMGeqTPALyRJkOF9yF
	VPdPW0rgazA99XSydx9rRsh1nxEczRfw9cuu6ReXm4sDNCPyTp2dbQu+9grdRpOwZHpulWWRp7NOC
	+HHWS0Bup0jmHXiW3ztmFB+r4a/eSk98t6cZUkSuz7P+s5toUlHHBbp0qcmpRNFKV+H+sR7RrGIJ9
	qRnu8KtL2sYpB9aBhBKCf83GsS5SDjKYlLF9kuurpdE6WsBoscSYHP8rE0OiC0gm0pRV8F0vQmZwv
	FDcGtqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXnVO-0000000EBei-13eI;
	Mon, 22 Dec 2025 21:31:50 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXnVJ-0000000EBb7-37Bp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 21:31:47 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-bb27b422cf2so7668438a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 13:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766439104; x=1767043904; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gVF2WomVdPFzNIoefnUCnz93OVDZpJzBA0U6XyUPFKk=;
        b=FlRAuq9pxx+iPwZrbdEiFhQUl83UqaP7YQzRwPYjdOAbM5Hfj8GwUMRFnr60TwvjpE
         PYUDrospX6L4GUIN0NMVeuagpFuOmrU2J98qCANMqTivlE3BmWZKu6GjcT/sXIOvvTKd
         2Yf8lO/1RY2ez4udJCCuXVRFgd57bnEu7Sdi9EZ3biTXcRNsZKkc6hnaJEmJGmGEW01j
         J7Wpsk2wzRL2hXp5zlwpGTCdy+mC/QShjXkWGzawJW98FeIzL5I/DF5rJYoHqa2V+apl
         4iSQUngfW4ptaRD5ZovtyIDuVKUrlOizzGUrJc0cUcxtzO1qxzhwJ6VGvh28ys2DphNg
         dy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766439104; x=1767043904;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVF2WomVdPFzNIoefnUCnz93OVDZpJzBA0U6XyUPFKk=;
        b=qp5as1FfEXOijKC483Ii0wh2/2PgzzD4+3yX2Va2Q3L/GrSeYg6hcEpRpuCz+vUUJX
         d22pZQacI88vgXXUPFXp4Mb1WxirHf/coJywYmMi9PVASQJsDMeabLdSLqbTs7Q5SWg2
         Rfkgfrm5wF7lVqKsZYi3ihzmLbuZXtKVpKwBoaoMfWMaaqAF+uyRdqIVA6Qnvui3Nqt1
         L88JWY+/DLsFZBa1nzh/zMgoxGVTjdisirHTKEP5EJM1n69jc+1tn9PeY8bdJ5hRudJu
         qZUhyXTstlp4x5YbmVapKij/nvsIy02maLrD54kmGHzdUG8sKGb9ikaEaXlYfgONnzjp
         ctmA==
X-Forwarded-Encrypted: i=1; AJvYcCVOra5b7ATdpiNc18KV3R2lIDsgzm1P1xthD4CiGq1umUH8G4AqBgEMXSBtMKh5DNvGzlSFStZVjr5mEbE8w/OK@lists.infradead.org
X-Gm-Message-State: AOJu0YzQCaa7jsdS+VNyUmcMZS4oYxpUxJJQpUXORwxjVQuUMI+MXFnN
	JctySUcPu5AtlN/1ZstxWXS44P9Yl2gPnhQIbPEGqBnyCi5ePD01GRZZP3Cp/du3cwOWik2b2jp
	mvqwHwA==
X-Google-Smtp-Source: AGHT+IEadse2H2MBU5amRT0HmVakvYhU12erWvzXxONZUG4g9KJkyb2AnDvGW+Q4/OY40rrIvihJgmg3uXM=
X-Received: from dybqr5.prod.google.com ([2002:a05:7301:6085:b0:2ae:5b73:d751])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:e008:b0:2ae:5b9d:63ef
 with SMTP id 5a478bee46e88-2b05ebb2f43mr7833481eec.12.1766439104201; Mon, 22
 Dec 2025 13:31:44 -0800 (PST)
Date: Mon, 22 Dec 2025 21:31:26 +0000
In-Reply-To: <20251222-phyb4-v9-0-82c0b671b070@google.com>
Mime-Version: 1.0
References: <20251222-phyb4-v9-0-82c0b671b070@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766439100; l=5832;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=V/MthuzjpdgySHPr4fd3G1SYz+Sz3GXYCBSx4+Jrmds=; b=C8VFwpL/N7rzYa8Hq9kAJZRSHbCDiUqw/Y25LIYyJCo/9pt5NOTi8xLYRxQ8CciWUq6fZksOI
 K8yXP3jhB/ZAShqN8WpZGJg5vcvkJVy5+wBtbfJ3irC1fwxlXqc+LZ1
X-Mailer: b4 0.14.2
Message-ID: <20251222-phyb4-v9-1-82c0b671b070@google.com>
Subject: [PATCH v9 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_133145_785036_4F2A3BB8 
X-CRM114-Status: GOOD (  17.31  )
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

Document the device tree bindings for the USB PHY interfaces integrated
with the DWC3 controller on Google Tensor SoCs, starting with G5
generation (Laguna). The USB PHY on Tensor G5 includes two integrated
Synopsys PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo
PHY IP.

Due to a complete architectural overhaul in the Google Tensor G5, the
existing Samsung/Exynos USB PHY binding for older generations of Google
silicons such as gs101 are no longer compatible, necessitating this new
device tree binding.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/phy/google,lga-usb-phy.yaml           | 133 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 134 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..427e2e3425f645f40c0813e29d6efe4f62b20609
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025, Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/google,lga-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor Series G5 (Laguna) USB PHY
+
+maintainers:
+  - Roy Luo <royluo@google.com>
+
+description:
+  Describes the USB PHY interfaces integrated with the DWC3 USB controller on
+  Google Tensor SoCs, starting with the G5 generation (laguna).
+  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.0 PHY IP
+  and USB3.2/DisplayPort combo PHY IP.
+
+properties:
+  compatible:
+    const: google,lga-usb-phy
+
+  reg:
+    items:
+      - description: USB3.2/DisplayPort combo PHY core registers.
+      - description: USB3.2/DisplayPort combo PHY Type-C Assist registers.
+      - description: eUSB 2.0 PHY core registers.
+      - description: Top-level wrapper registers for the integrated PHYs.
+
+  reg-names:
+    items:
+      - const: usb3_core
+      - const: usb3_tca
+      - const: usb2_core
+      - const: usbdp_top
+
+  "#phy-cells":
+    description: |
+      The phandle's argument in the PHY specifier selects one of the three
+      following PHY interfaces.
+      - 0 for USB high-speed.
+      - 1 for USB super-speed.
+      - 2 for DisplayPort.
+    const: 1
+
+  clocks:
+    items:
+      - description: USB2 PHY clock.
+      - description: USB2 PHY APB clock.
+      - description: USB3.2/DisplayPort combo PHY clock.
+      - description: USB3.2/DisplayPort combo PHY firmware clock.
+
+  clock-names:
+    items:
+      - const: usb2
+      - const: usb2_apb
+      - const: usb3
+      - const: usb3_fw
+
+  resets:
+    items:
+      - description: USB2 PHY reset.
+      - description: USB2 PHY APB reset.
+      - description: USB3.2/DisplayPort combo PHY reset.
+
+  reset-names:
+    items:
+      - const: usb2
+      - const: usb2_apb
+      - const: usb3
+
+  power-domains:
+    maxItems: 1
+
+  orientation-switch:
+    type: boolean
+    description:
+      Indicates the PHY as a handler of USB Type-C orientation changes
+
+  google,usb-cfg-csr:
+    description:
+      A phandle to a syscon node used to access the USB configuration
+      registers. These registers are the top-level wrapper of the USB
+      subsystem and provide control and status for the integrated USB
+      controller and USB PHY.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the syscon node.
+          - description: USB2 PHY configuration register offset.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - orientation-switch
+  - google,usb-cfg-csr
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb-phy@c410000 {
+            compatible = "google,lga-usb-phy";
+            reg = <0 0x0c410000 0 0x20000>,
+                  <0 0x0c430000 0 0x1000>,
+                  <0 0x0c440000 0 0x10000>,
+                  <0 0x0c637000 0 0xa0>;
+            reg-names = "usb3_core", "usb3_tca", "usb2_core", "usbdp_top";
+            #phy-cells = <1>;
+            clocks = <&hsion_usb2_phy_clk>, <&hsion_u2phy_apb_clk>,
+                     <&hsion_usb3_phy_clk>, <&hsion_usb3_phy_fw_clk>;
+            clock-names = "usb2", "usb2_apb", "usb3", "usb3_fw";
+            resets = <&hsion_resets_usb2_phy>,
+                     <&hsion_resets_u2phy_apb>,
+                     <&hsion_resets_usb3_phy>;
+            reset-names = "usb2", "usb2_apb", "usb3";
+            power-domains = <&hsio_n_usb_pd>;
+            orientation-switch;
+            google,usb-cfg-csr = <&usb_cfg_csr 0x14>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9de1e9e43f63787578edd8c429ca39..8a2e94be2f5c5e6e7315bb7bec385798dbd52493 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10721,6 +10721,7 @@ S:	Maintained
 P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c

-- 
2.52.0.358.g0dd7633a29-goog


