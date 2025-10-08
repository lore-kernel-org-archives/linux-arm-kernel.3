Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DC6CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 06:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3nQ2IBXVlqup3yhiw/z2ZC4B8Uznh8ZXWkNRIY9DZ0=; b=iX09kxz0BlxLp94IE+81bDF/L1
	gwTobmcdchY9sdk+cLgE+g2x1aOAngGNdY8qSiDmRYRdommrSeOtW1tmoKQfP1tWSOtMsyrhHeFjr
	znxyEqnEtyXSNuiBrWgYNMds9JxflGZxf/S0GcIb0W7iTmbDJEnAfLPkNdLBKlgSYpws1qWmowTzJ
	NYYb+LVKE5TVcHMHjsBFx/u4wWe66Xk7INtX0YmqoXLE0i5J5C0uiQnja5U1worarEp3pOz/oCVGH
	zJ9NAaYajQWbQ+Cn9hNsCPH8hrdBE14eZq2ZNahi7MLqqSVSzD/9PyFAwNIcRdbt9+BeWHTr2vHTp
	JXXYu92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NDt-00000003FKo-1TrE;
	Wed, 08 Oct 2025 06:00:25 +0000
Received: from mail-yx1-xb14a.google.com ([2607:f8b0:4864:20::b14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NDp-00000003FGc-2AzJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 06:00:23 +0000
Received: by mail-yx1-xb14a.google.com with SMTP id 956f58d0204a3-6352a642093so7551538d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 23:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759903220; x=1760508020; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O3nQ2IBXVlqup3yhiw/z2ZC4B8Uznh8ZXWkNRIY9DZ0=;
        b=XpPfc3/oMxTW0l+MgwRsxgd/bChWIlDAoOy5WBfAp0kJbciZEnYITspB/0rRl28HYW
         L4wqVHvN211qu7dswRNepgFFn8Z7T5tsaKqCRagPDW0FARYEkrRpiTCuPNA9WBQJURMU
         KGPh13j9NXTYb5M5p50gMkz0O0NGHxk8D5uoITaUUh1hr9u0hkDzFtm0ldbQhRtmkICl
         4eUR1W6EtMjTULjo++kgI7hqI4FcsuQsymAbDFiahnjJoDMk5ySWt2XD7UVPDvm6nf9V
         nzH9oebbl765bKyK7zlopElxYongg7bqNR0KbNxGmjn6akVLGuZ7E+eb8tNnmFEEOF/S
         gjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759903220; x=1760508020;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3nQ2IBXVlqup3yhiw/z2ZC4B8Uznh8ZXWkNRIY9DZ0=;
        b=D3BgjSRPhpY/O7nilDAB5pN2Hob3O+S7kcrHfIBmVx3x3N3qHQ3hi0NwIB0BGjh2xg
         mltGjgs+4D6sM05RzK/6p1AxPU2EjpE09An+nK1UKMO0NEL7XEBGhVGLVxeo6zZ0EkVU
         cfc///bIX0wKi2FvNU4DHtRc+jr5M2X0wT2vchOKKLfwvElwpFC8WYwqXYHJ2h1iWCHt
         NZ2CxrRj98kmjAa0Wh2Tr8Jxpbtwox8U93w/mjbr/4/hcknZeSbJadCyFcQhwcEITgH5
         afUQ52veOtLWLDLR3Z+Tk6TU3GVHCUT7LOuPyijOVy+j/v9/aB3zmBudxUoOHUPG22uz
         dhEg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ2DhkWvjC9/yp36Vznx501h+VcCuaqZs1vz03iawZHQfi0WIsMypCQwvm4reEQRQNOO9YEFIkRBzTghcFdPcj@lists.infradead.org
X-Gm-Message-State: AOJu0YzPi7yN7VAyfA27B1v8B0YMDRmfZpGZu57lc8Ef0jxp9z0zR2WW
	A6YLrTct6hrWZhjltz0V+qAny4xAq/354jcB0hxSbhj3MqEzjBIRoN/JEu6/e9ju+lTcCYcVrz2
	sGdyaTA==
X-Google-Smtp-Source: AGHT+IHkVcxa2pum021wuuoLs2okLrcMUb66ABXH6XTGYhxmFAHtMt5/klv2Td06QQp5AMBpCeX1Xhqxjbw=
X-Received: from ybbch13.prod.google.com ([2002:a05:6902:b0d:b0:eb5:2c5e:6965])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:6c08:b0:77f:667f:61f6
 with SMTP id 00721157ae682-780e155533dmr45405427b3.15.1759903219488; Tue, 07
 Oct 2025 23:00:19 -0700 (PDT)
Date: Wed,  8 Oct 2025 05:59:59 +0000
In-Reply-To: <20251008060000.3136021-1-royluo@google.com>
Mime-Version: 1.0
References: <20251008060000.3136021-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008060000.3136021-4-royluo@google.com>
Subject: [PATCH v2 3/4] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
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
X-CRM114-CacheID: sfid-20251007_230021_561550_AA9ADC5A 
X-CRM114-Status: GOOD (  16.76  )
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
generation.

Due to a complete architectural overhaul in the Google Tensor G5, the
existing Samsung/Exynos USB PHY driver and binding for older generations
of Google silicons such as gs101 are no longer compatible.

The USB PHY on Tensor G5 includes two integrated Synopsys PHY IPs: the
eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP. Currently only
USB high-speed is described and supported.

Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/phy/google,gs-usb-phy.yaml       | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,gs-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/google,gs-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,gs-usb-phy.yaml
new file mode 100644
index 000000000000..22961e2da6ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/google,gs-usb-phy.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025, Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/google,gs-usb-phy.yaml#
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
+  The first phandle argument within the PHY specifier is used to identify the
+  desired PHY. The currently supported value is::
+    0 - USB high-speed.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - google,gs5-usb-phy
+
+  reg:
+    minItems: 3
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: usb2_cfg_csr
+      - const: dp_top_csr
+      - const: usb_top_cfg_csr
+
+  "#phy-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: usb2_phy_clk
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: usb2_phy_reset
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
+
+unevaluatedProperties: false
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
+            reg-names = "usb2_cfg_csr", "dp_top_csr", "usb_top_cfg_csr";
+            #phy-cells = <1>;
+            clocks = <&hsion_usb2_phy_reset_clk>;
+            clock-names = "usb2_phy_clk";
+            resets = <&hsion_resets_usb2_phy>;
+            reset-names = "usb2_phy_reset";
+            power-domains = <&hsio_n_usb_pd>;
+            orientation-switch;
+        };
+    };
+...
-- 
2.51.0.710.ga91ca5db03-goog


