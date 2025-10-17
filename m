Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A57CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 23:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFUd4KPZzUTUCisRlC6z64P8M16hH71AE+17EZ2+Cpk=; b=c9dcQzUcIpnEF3AG+KSR6B4BEc
	ApxT+ln66nIsR8NH2x0Fx8RF8ZEsQKhNeKTZvWzVrTzGJ5GzBp4Z+FgX9uf5a3xkPGJKxJliMT2LK
	23Pz/3IlPGbVZ39CVMS8P/fK/vyizCrzJnN5m4V4IfI37sjr11QYV8mituhUQ7RVChiYmbVIV3p1S
	Mui2B1+QMTH5PQG9pawiZkPZo40ugQX01Yu62eTc522UNK0Qr0OATnR9+Wleq8HW829rRjjfacHR8
	pj818yaOa+dleJLxA9Wk0pnwuW5ahImqzelSwofhatDCMml9hVEjcC8EmJ1ZgT92oz/bo37fqutnf
	oOm0jYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9uFA-00000009DBy-3Dm3;
	Fri, 17 Oct 2025 23:52:20 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9uF8-00000009DAF-2i8h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 23:52:19 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-28bd8b3fa67so23440045ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 16:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760745137; x=1761349937; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rFUd4KPZzUTUCisRlC6z64P8M16hH71AE+17EZ2+Cpk=;
        b=wNLA9FT5yqD7pJPoHGqwbxjdcoApGE07myLHgoZ3ldAYGrDjIUn70bmqEzJOuyR/oA
         D0fL/+cdTuxFl0oUfJfFb5ulq/7/7jDmpmAAvAdurCJ1+4uh+Yh3gjOKNVBPeOrCl1gU
         hFqwcfMkFHCkOqbDj2W5goK5elcKajwipQJG/uvAz5F43zKxclXEyRODyjZCDCeD9mz/
         eYbKHaMTFuamZpNBLJsk3+RA3nwmD5n6Rs7nyAzU8Y2gXwBkWSlsi4WMsTttHH1U2oil
         pEPtKz3nJ8+xZj/glMYQeg/KVoAUeyzSU/SjYVdmDrX5eOAsIPWDxXiMUC7M/PzOuL4R
         So0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760745137; x=1761349937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rFUd4KPZzUTUCisRlC6z64P8M16hH71AE+17EZ2+Cpk=;
        b=a4eLQ5aHzFURp9R8DzzWUxqW/XxCXLxngZ1/nJYS/MEUw2t/Wp0A3IAW8JLnzGN21r
         5nmq4QhaeJulAyiFxzOyd+/D/e7heAXi+Tfuzcfcrh3kWfQ2khh94ZFThqD18Tc22HwH
         VhBn8gogrfWrk6JSywRtJOUEWO2gJa6afyD4sumKQJDfy8M3fKzwrKynQetUgpx0pNNi
         ywrKN4JdXnfjGfwkjb+2pQhhRnkCrE+6B56ld9lOJFDrP0TJJHAE3DpsnqW8UMobsLJD
         uPDbWgSQ+hky+n/Mgoi0kgnC9RA02LeM2eYz8l6StdqW/4XeRwC0MdIxGkDBzHhu5HR9
         twfA==
X-Forwarded-Encrypted: i=1; AJvYcCVHWCcBUrAJ+iXlk5G8aa+2WuPfJ/weroAsg9F/i1h/lN0H4QwVwlIzL+XBODTLp2Wb07Lw6brvtATauIaHh0kO@lists.infradead.org
X-Gm-Message-State: AOJu0YwTuQTbd8u7gtcE3o1lZcHsuQexDS0i/TJXyg7qQyqyivALg1MK
	bjcMWlfWff5FsSSHzaS1zt6NOOCGyx/1Mz+kVvtSi8tg1K7zEPHfqB/AvEJI1g8cbHKGEuuTMLS
	pyIVoAg==
X-Google-Smtp-Source: AGHT+IGtonGWIlL28ar3C4SMS3Z4eGNFhKCMbFqjIxEvFkEnJLs3JqhHMERukcTD3gq5IHrZVsg/cEtJU7Y=
X-Received: from plbkg4.prod.google.com ([2002:a17:903:604:b0:290:be3d:aff6])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:384c:b0:27e:d9a0:ba08
 with SMTP id d9443c01a7336-290cb27dae5mr68350725ad.43.1760745137248; Fri, 17
 Oct 2025 16:52:17 -0700 (PDT)
Date: Fri, 17 Oct 2025 23:51:58 +0000
In-Reply-To: <20251017235159.2417576-1-royluo@google.com>
Mime-Version: 1.0
References: <20251017235159.2417576-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017235159.2417576-2-royluo@google.com>
Subject: [PATCH v4 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_165218_690623_DE13DB3B 
X-CRM114-Status: GOOD (  14.85  )
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
generation. The USB PHY on Tensor G5 includes two integrated Synopsys
PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP.

Due to a complete architectural overhaul in the Google Tensor G5, the
existing Samsung/Exynos USB PHY binding for older generations of Google
silicons such as gs101 are no longer compatible, necessitating this new
device tree binding.

Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/phy/google,gs5-usb-phy.yaml      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
new file mode 100644
index 000000000000..c92c20eba1ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025, Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/google,gs5-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor Series (G5+) USB PHY
+
+maintainers:
+  - Roy Luo <royluo@google.com>
+
+description: |
+  Describes the USB PHY interfaces integrated with the DWC3 USB controller on
+  Google Tensor SoCs, starting with the G5 generation.
+  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.0 PHY IP
+  and USB 3.2/DisplayPort combo PHY IP.
+  The hardware can support three PHY interfaces, which are selected using the
+  first phandle argument in the PHY specifier::
+    0 - USB high-speed.
+    1 - USB super-speed.
+    2 - DisplayPort
+
+properties:
+  compatible:
+    const: google,gs5-usb-phy
+
+  reg:
+    items:
+      - description: USB2 PHY configuration registers.
+      - description: USB 3.2/DisplayPort combo PHY top-level registers.
+
+  reg-names:
+    items:
+      - const: u2phy_cfg
+      - const: dp_top
+
+  "#phy-cells":
+    const: 1
+
+  clocks:
+    items:
+      - description: USB2 PHY clock.
+      - description: USB2 PHY APB clock.
+
+  clock-names:
+    items:
+      - const: usb2_phy
+      - const: u2phy_apb
+
+  resets:
+    items:
+      - description: USB2 PHY reset.
+      - description: USB2 PHY APB reset.
+
+  reset-names:
+    items:
+      - const: usb2_phy
+      - const: u2phy_apb
+
+  power-domains:
+    maxItems: 1
+
+  orientation-switch:
+    type: boolean
+    description:
+      Indicates the PHY as a handler of USB Type-C orientation changes
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
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb_phy: usb_phy@c450014 {
+            compatible = "google,gs5-usb-phy";
+            reg = <0 0x0c450014 0 0xc>,
+                  <0 0x0c637000 0 0xa0>;
+            reg-names = "u2phy_cfg", "dp_top";
+            #phy-cells = <1>;
+            clocks = <&hsion_usb2_phy_clk>, <&hsion_u2phy_apb_clk>;
+            clock-names = "usb2_phy", "u2phy_apb";
+            resets = <&hsion_resets_usb2_phy>,
+                     <&hsion_resets_u2phy_apb>;
+            reset-names = "usb2_phy", "u2phy_apb";
+            power-domains = <&hsio_n_usb_pd>;
+            orientation-switch;
+        };
+    };
+...
-- 
2.51.0.858.gf9c4a03a3a-goog


