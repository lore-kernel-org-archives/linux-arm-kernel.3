Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728FDCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 20:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDMjRNZuXBcadxapfJv5DZnyvTWebZelvolDUVBwbeA=; b=0BZVcTgLEpKVTIfsWOBEcDWcQp
	h+lGHF3X6BwHKv97CUJgrgJTfnm7tidbEx42fwwdX8zEIkQhQYDPnqS4acpCWcJuTTK8z+FuCdCwN
	DiHHCajSj7FKkY6BfiAZma/FnWfefwQoHIb2EzkDwbq2B38pBuCQXOm0TvwlceMYJ09swlRGA6/w1
	ahnT58/9CarzdDo2jtXEibMD8hx3TV8T07JfBuQfT1SsZmPWX0X6Y+w46ICuBh8BKGeX17it9sNjL
	Hc/+1ZKbwKCDn6IjLtrWunDDLfZZ2ZapJwdg1X2gDXNbvbqZ6pc1N0D3YIUHKN+KxMnQiEfEFIsMz
	po9zBb9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7JXV-00000009IZb-1a2n;
	Fri, 10 Oct 2025 20:16:33 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7JXS-00000009IW9-3PXP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 20:16:32 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33428befc5bso7214818a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 13:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760127390; x=1760732190; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rDMjRNZuXBcadxapfJv5DZnyvTWebZelvolDUVBwbeA=;
        b=HTbZz4AHoyBWLKyt5PFxn4ulvqpTC/1bPiGw7ruDFLCn4On6Uqh0jf2VdQ+Zk6ORyA
         0arwGRWfD37eIQ68IvcA5lNDnGMSMhUlolS84SH8AVEo+0AzbNOeQLiJfSfJufMiw3gs
         5jDVYofDtUC0RXh6yUdKd5uK8uwpaPs56qME/xAZEqNkN1VKx+aCSlnEhs34Wph5lmSG
         IOFalpl1VKszgzUzfQPYXzRiO3rRUVwsmD0V2oGsPYaZ7IrCiBWmNNuq3w79rosK1eSB
         qxqK1HcBNTmDOyzp9iLcjWHu/beR3lx3YQlq7gWpkeOMR7soX6ZHqWsZhnLL228XjEvG
         Frjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760127390; x=1760732190;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDMjRNZuXBcadxapfJv5DZnyvTWebZelvolDUVBwbeA=;
        b=Us+InVQykXzHPl/6GfGiCigVbGoFDOqE0FJYTuMeBsyLy13WEoOv9mSBEkPvg4U0Qc
         7zi8ZfHWX7yujxprSeNIEvkpFLuzgnnQnTFmu0h/MqCVDcChjDjlrINrg1oX3PewCUTt
         AmCTHiaY3+quspObPuJe5kwG7+28nJJTGndOaiFlI/PQgvzK3lsVnWjXcNkL5QGBmPKi
         eZYdmVVEcw5NtK8BJIzDR+k70sqYnI2GpQUYh2Q63C9IYLFDqeyR+usrf4frRpk4HwIx
         2VigS1LHC5PABXKiXeVF/aOEswQWvIrXVBQRgjeGiiTZ8jfnqfa3ZXlecoD6ZMdD8H9r
         AQmg==
X-Forwarded-Encrypted: i=1; AJvYcCV4MhQJi31aDRZu07ar1FeS6qn08YKMKFYKXIzbLpj5+kH8r8w/SEEYFCxDedsL55GbdHqMTj1OR1QpyJHi/iQg@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ3NUc0DmHW3gy3OD2tQ6Syr4FyHzyZdkGyvMhxlaYzmnBfRyi
	74rDqZmB2b62GayrX5rvTiLXQzMcl8sbQEJIG0VyRhB/WZG54DLxoePz7IcXTwhInsk0TRgqJ8l
	YJ5d5TA==
X-Google-Smtp-Source: AGHT+IG2O2/hmz4EGHxbz6LI/FnWz/lYeOwpP5uEupOv3mruD2AaSSt/AAWUjN2TixtwciX5BwSqJ0FHSFw=
X-Received: from pjff6.prod.google.com ([2002:a17:90b:5626:b0:330:6c04:207])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a83:b0:32e:b87e:a961
 with SMTP id 98e67ed59e1d1-33b511173bfmr19125944a91.5.1760127389914; Fri, 10
 Oct 2025 13:16:29 -0700 (PDT)
Date: Fri, 10 Oct 2025 20:16:06 +0000
In-Reply-To: <20251010201607.1190967-1-royluo@google.com>
Mime-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251010201607.1190967-4-royluo@google.com>
Subject: [PATCH v3 3/4] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_131630_866558_25E5866F 
X-CRM114-Status: GOOD (  15.63  )
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
 .../bindings/phy/google,gs5-usb-phy.yaml      | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
new file mode 100644
index 000000000000..a40de31ac768
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
@@ -0,0 +1,88 @@
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
+      - description: DisplayPort top-level registers.
+      - description: USB top-level configuration registers.
+
+  reg-names:
+    items:
+      - const: u2phy_cfg
+      - const: dp_top
+      - const: usb_top_cfg
+
+  "#phy-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
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
+  - resets
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
+        usb_phy: usb_phy@c410000 {
+            compatible = "google,gs5-usb-phy";
+            reg = <0 0x0c450014 0 0xc>,
+                  <0 0x0c637000 0 0xa0>,
+                  <0 0x0c45002c 0 0x4>;
+            reg-names = "u2phy_cfg", "dp_top", "usb_top_cfg";
+            #phy-cells = <1>;
+            clocks = <&hsion_usb2_phy_reset_clk>;
+            resets = <&hsion_resets_usb2_phy>;
+            power-domains = <&hsio_n_usb_pd>;
+            orientation-switch;
+        };
+    };
+...
-- 
2.51.0.740.g6adb054d12-goog


