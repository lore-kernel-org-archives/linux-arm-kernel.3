Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BA4CF9C73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYKYFwNEQpdo2niOcoCQ+9hrIxMyptwAEyhO1F6F0P8=; b=zC6PIMFXFmgBZyh4TFfe8L9UBa
	/pOFZi5uIZNXaqiqmr8RvV2AD90tlH0NEs5QhG8wUEATBhBfOhD2DiFJZPH/P54ASjb10xVGnB/1P
	7e0kySd0TnXNEgpQoPIUiMVyx6edRq8h7YIwNakrdaVimxLDMcc7ZebXxDUA1fq65YRWfJMnKDgox
	mqg9ref4BF4fdVrbwy/55c3UQpDthuvggyEciUzRFDFuIpGSiW10ZeK+Jvil1Z0PEex1B9TppjJqg
	bO2puTZiCZz2oS99ASZHJnamUoevqUT76dpISh+DVwB3rEIQzXVDTOWoXMVDRT3Fhv/6R6wp0ubsO
	sFhH+lmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8ah-00000007ASQ-2AQW;
	Thu, 20 Nov 2025 17:37:07 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8ab-00000007AOi-0teq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:37:02 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7be3d08f863so1955039b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 09:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763660220; x=1764265020; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UYKYFwNEQpdo2niOcoCQ+9hrIxMyptwAEyhO1F6F0P8=;
        b=ZIh2XrdVfIc3wOqrRKttpcjXKzeP0n51uR9zPE2iS+EYz4T6/0Dvg+YYokJ9enJ/Z/
         i5Lwr6PFNoo9sOEIG4oudiZdsCYSobbc4M5L59axG30Jk7i52DcXjF2zR6EHAitaDp1r
         xuemhCnjnstLBBMsq6GssnIfCfdd/cqk23LidULGKgphgAQ3JYgEynf7j8RSNkbWu5zd
         3uLmcyQitKOLT3on6YzsQiw6lRc/2IJFcaRVEYCPbddJwutTuocDs2+yOKw4l9IDPdvl
         R4Q71TnYMPnCIDWqvnIA0eQ9Nya8d0P5tmDN9H2afnzxI5LOi2D2BuKEQH8JEyJeD8Mo
         7XQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763660220; x=1764265020;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYKYFwNEQpdo2niOcoCQ+9hrIxMyptwAEyhO1F6F0P8=;
        b=eqovgGbxTQPknkGSj5mVL7hP/lknC2wO6RgB/12stelQXjBidF6o5gnf8c2xaPI10A
         wfaLhUDSdaw+5Ih7rCdTz/RcD4WTCTnbAOFrRqCqXEgMnJwZqu/nD7wUGThXwOabcpuT
         C7WXwt9goK17qWQpON9B8vydybTW/MiSbbdSuyOtQEWnM87Khd+w33dJjOXj+Vp/rl/5
         YMzU4ls7eH6IWe3iDuZc1HPnlQzPABOeUlte+wjhFosIMrRklYQ6jWn9hPrrCbeo4qmB
         EM0n0Aggp6GAZmDMMVqirLp4c+LAaSP+qO1Qk61ygAzZbktPNSGrywBZigwwtz046hga
         VomA==
X-Forwarded-Encrypted: i=1; AJvYcCWVKclMAwC0qabfWP8JTQHpNMXYvKGy7dBmm09GayUEVTQhiCc//V53kTm8BwtmqUxSmk37TJ5UAWVEyatFBxNU@lists.infradead.org
X-Gm-Message-State: AOJu0YySkP52M35jR9B+XL55Ur75at/qPQ6bky70sC4bvq1KFJzuf4xe
	Ovnxk90XiqVEPXT+zPiRvURDRXBkdMhB3rDyLM/Ou58rNQyV7L3PLYmcXJXfKvqdPGJZNN0m5vh
	tS9LDsA==
X-Google-Smtp-Source: AGHT+IEEioZM6++kQzrL7puAiFpulDJQBCemZP7kwWZkX+1d1todtDD+KaCy8lRZMXpYLS9GWuETJNyMVYY=
X-Received: from dlbay33.prod.google.com ([2002:a05:7022:6621:b0:11c:5640:3de5])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1b12:b0:11a:26dc:eb61
 with SMTP id a92af1059eb24-11c95735ddamr930764c88.7.1763660219952; Thu, 20
 Nov 2025 09:36:59 -0800 (PST)
Date: Thu, 20 Nov 2025 17:36:41 +0000
In-Reply-To: <20251120-phyb4-v6-0-b6694e1f0caf@google.com>
Mime-Version: 1.0
References: <20251120-phyb4-v6-0-b6694e1f0caf@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763660216; l=5106;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=/nlRAijHBYdsP293gnShy0fE1HhhnOtosa4NIMB2pDM=; b=OtgUI8TiSQQ3qjNKPmkO1gps1OW2/r18VExz8XfJT1PK4cN6ccCF38j3DpneIPr20f3mpnhzi
 vk8owTmMP1VBy5WlDaRr9sItysw6vjqGt12AWl+7cMAteJ2RVHB/STz
X-Mailer: b4 0.14.2
Message-ID: <20251120-phyb4-v6-1-b6694e1f0caf@google.com>
Subject: [PATCH v6 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
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
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_093701_275502_496F8D84 
X-CRM114-Status: GOOD (  15.52  )
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

Signed-off-by: Roy Luo <royluo@google.com>
---
 .../bindings/phy/google,lga-usb-phy.yaml           | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a0dd8e1afa56950b8371545e462db24cbb9a7959
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
+description: |
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
+        usb_phy: usb_phy@c410000 {
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
2.52.0.rc1.455.g30608eb744-goog


