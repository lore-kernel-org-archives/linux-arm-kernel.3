Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209FECF9C74
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 08:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vn5NP0cGfea74Y3lyKidjSUH1ktUHughQxZQCQ+D1PI=; b=WjIuA/Ii63xbzdL9Zx4IWc5SZT
	3/R+GnRG/8rfZ7gv7vCSNp8o2sD/ozhRX8Xdw+b+dZ0iWcFk9dIagbLgbeXnbDt1GNV9LBBCa33c8
	57jXozcpIp4gLw2FO4G7b5H1ZR7VKXrNjVz3tqOZBbk8+MlA+QzFNrsVLpP8xOih7k+DAS2AyZWjI
	00/BL422WAn3dI/pd4tR7DjYx8Xq6EdUNNFgXJTCbx26fxkwwsYgzY7sAVY77aNnqeOhxxbtFIgHK
	ZmRKUPkD0Gg7KtGoy7RDESecz6f4jxcAK7kNt5GSGnZeyv/79uBcE/iTrrf5ltleYSGpKYg+igxId
	hCZduvEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMwe-000000086fL-3tWj;
	Fri, 21 Nov 2025 08:56:44 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMwb-000000086ca-11mx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 08:56:42 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b98e6ff908aso5473811a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 00:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763715400; x=1764320200; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vn5NP0cGfea74Y3lyKidjSUH1ktUHughQxZQCQ+D1PI=;
        b=1ZTAVLtx7auzy/ATz/7ybNZUNwRWnE3be2oP1m7fjT/tQEd7SonuCtcwuizo6oqgJ1
         6AQ8u6rxVEz5UntUIepRCFyC5ATi0X6bNVcCsn7rviZfqE10404sZNoLQfvvMKMKzYLS
         uTf0okRvi8gBoDVyC0wznyShPshI+RJ5EwHTPuSpb3pKBvND8Jy5t0UKYlMdc+tKMgD4
         lb9ZKnLmVW1rFsXW4CJLysKOBb+LsOZQZehW8i4QwDX+R9W0JY2gc03QY1B4k7k7X0lA
         etxptI8i0RmXbQyPsA3JOLQ/Q/twCRSoOJDbFDNZCjFPexKmX12vXWpvZsp/uGqtXCOZ
         DcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715400; x=1764320200;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vn5NP0cGfea74Y3lyKidjSUH1ktUHughQxZQCQ+D1PI=;
        b=URdhjoBYByzrsZ8tWnQoPikJ+w/Abs+u1Lj7Zh4s6RrBNOi350M+hY4diuWnXm4Xhi
         ki5/iJy8MEdkuYIq65SUuXG4z6HSawgFOYYYC4prAGiddadVgxFIgASxlJqXxLo8OzxD
         2qSRYD3wk/Mi4Gfn6UqBAiN/wyXgT8nosqFdS5dNSdskGnzGlSLTPupPApCykwyFQOGk
         fT4o2Q/d6Vl6AdtupmGwg5iKV9xQjdzybBBHaa5PKdyJwmGua6eq5W4cG1b/v8th6qn6
         NglJ/7YAwPWPDDmZc41BiB5EHL5nE/v+z2iei3tbYEz54cJHNCAfcar+DoxLojddUEnc
         QhSg==
X-Forwarded-Encrypted: i=1; AJvYcCXDIjzb1vt9C6fU4aZ3wboJuF9UFcxXjappO50fr1P70H/PhIR6bec2XfmNagXSRnbr0+TRyhDdM8L0DtwDZHln@lists.infradead.org
X-Gm-Message-State: AOJu0YwaMIxTkjyws76N/1faln5J2/go2Rq7qzz4itmffy3j79e880P3
	YYGHVlRKuxXBLajzlwega9/iI6hF+7FP5tCVP9t+Z5KjCR+G5+n5M0WmHCtYqJQME2nl2I08fZR
	pJacsJQ==
X-Google-Smtp-Source: AGHT+IFDdMrxjcppPqZfJnrNK+kHi6vCcjIwY4Y4M84oDtTvGViCP2xfFlDlQI2nSCDqp2hpRVKi0C8hcL4=
X-Received: from dyt23.prod.google.com ([2002:a05:693c:8097:b0:2a2:454c:f92])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:8244:b0:2a4:3592:cf5d
 with SMTP id 5a478bee46e88-2a7190a344bmr490773eec.1.1763715400036; Fri, 21
 Nov 2025 00:56:40 -0800 (PST)
Date: Fri, 21 Nov 2025 08:56:20 +0000
In-Reply-To: <20251121-phyb4-v7-0-df644fa62180@google.com>
Mime-Version: 1.0
References: <20251121-phyb4-v7-0-df644fa62180@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763715395; l=5147;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=VBoVbKgeWDxu8xXRvm5tzauXBx7SZr8OxNtDvYDeHzE=; b=JphE5nvH33SArlOM73vQrNifT2e2HTZhhsvejgwZZqcbKMf4uy7kEWN7cNqIV3T++Xd2oXXpm
 RgQz1NaN+s1A6BFoDCkIGeCsYi7VcpigMPTn7NwOtv4qAIGumq+GMdY
X-Mailer: b4 0.14.2
Message-ID: <20251121-phyb4-v7-1-df644fa62180@google.com>
Subject: [PATCH v7 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_005641_282244_5BE0EAD4 
X-CRM114-Status: GOOD (  15.08  )
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

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/phy/google,lga-usb-phy.yaml           | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

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

-- 
2.52.0.rc2.455.g230fcf2819-goog


