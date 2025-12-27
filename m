Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FE3E8FDB0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 00:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlaDIAdKGeeEE97V6RgS1GwSBK9EgzDYZZe0KxdpZdU=; b=qQ/x1IXubG6m+hmpMnWUCAVlZ1
	RW6g7tacUXCMb2w6YepB/cn+tNuD8ojVMXSG8/Hi6ga1V2Ej2MBEVeHgCeHhstOp+nx8K14qxtKtH
	aQNv1VSiwFeMXuU+s1GszNnohcoW/A0Z9FTcmWOvzofAnHec1XZEJiFh9mhi+s3mjxNMDIgEIMZKN
	eAblCkOcZMfencJABFGXjQ2yYN8Bykvg2P45ACH5eCbsupkv4XCxJLUMcVwWlPb3Jjofy/PJk+pcF
	ao2nxFvZYGfvbpFQuRmRX2CMcIK1RUf43fK9KeexQiOCuFd2q7cR1XnQxqWAMX12u2ssraQ0usUn4
	rCO7ZrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZIZB-00000001brp-09j8;
	Sat, 27 Dec 2025 00:53:57 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZIZ4-00000001bod-3ocD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 00:53:52 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7d481452732so15167273b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 16:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766796830; x=1767401630; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LlaDIAdKGeeEE97V6RgS1GwSBK9EgzDYZZe0KxdpZdU=;
        b=a9QddMBFV+3GkTnzGg2Ve0hWDuOeoNP+AsldDsR/GWREjF9dGP4OPBtShwz0SELQjw
         tU4RsUV+7/ItUIWraoGeGu2nGDLI6MrxZ+f/7+YUT41y3hvOhSxl/BrW7BxZAIwZYZC/
         fvN59KSVuOh3M48VsiNPvOb/P8X/QjLjDqvSlKrL1hSRFqbMj93MyGcY6ELVUVYr2v0K
         5brvbEXIXkG8LtAP6C6lpJ3lCYavzR8fQZpoHOmmni+ffxOtVpiQP1GefSIqzu/pYjZl
         4DSUyrld8kSYdLCMw95LvnQ5LBdVCvMBXZAjgA+jL6ditmSHcWAB4sVkJ/TQwZQAQDYq
         f/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766796830; x=1767401630;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LlaDIAdKGeeEE97V6RgS1GwSBK9EgzDYZZe0KxdpZdU=;
        b=RV7RlOdMhv3IDsCLDhVrUlrRJ8EAiY/DBkp0dDTIDzLafXntk8+MZ9hseONGoFSlZr
         3QW4b8pctDG9bBSFs9YLLOju5on/efRkt1rEYuZjvIODO+KuSeXuanK6w4cza/uRx/f6
         MkjGsVyLTLarmSJNBjllD6T32sHjaEYS21mbuHkfWgf6vpQDsY85aqCT2xaEdW4j98I5
         5scrXHbqW4g1VuUM8gy16ucJyGAirXCU6xnFQe9dHfZcwADjKeZkjYIV9J1P8MH+K94b
         2iFnzXG12DZhaRjoOUEULgj0biFT1bbg+y9ynAX+V1LFzR4Z2x5imTw7iI9zjPa+3tG2
         yrMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrOgHqDLrYdbMfOEhcAhjHXNrtiT7Uz11Y7NWkhFvIPRsNj4pwOZPvfJwwIDel4NMpUi8lPPGYugPtE0982ZAC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw267pliNlKHy8Cf761d3ZbRIwsNJF12orQfVslxUfm70UW8pWh
	mGSH6AQ99u+j6YKbXxIHpsItFiIzqc0aWPRS9OGeEOBG7iBSnhSpG8ozyDLNJR51d6wqQGJgX/r
	IHyf9Fg==
X-Google-Smtp-Source: AGHT+IFdXmCN0u4mwRWY3qy77Zh8cuuoKlVEaOOUO4nfVPcIZQQ2y2aoetI8D8XkJwqZNnz/tP4uXOVy3WM=
X-Received: from dlbcm20.prod.google.com ([2002:a05:7022:6894:b0:11d:cde5:d78e])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f68e:b0:11a:641f:ba11
 with SMTP id a92af1059eb24-121722eaec0mr21209839c88.29.1766796829667; Fri, 26
 Dec 2025 16:53:49 -0800 (PST)
Date: Sat, 27 Dec 2025 00:53:28 +0000
In-Reply-To: <20251227-phyb4-v10-0-e8caf6b93fe7@google.com>
Mime-Version: 1.0
References: <20251227-phyb4-v10-0-e8caf6b93fe7@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766796826; l=5832;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=yO5DAcUjBQX68ofPNIg3Y07ecCOxCD4cuKyrN6eAnIg=; b=Y9mnKBfrv2Vcz5viNwaqvzFo0OcadQFfBlwicMDic3XcsdlvHf2j/Zc1UrCHcX4KE0QZ8RFVc
 tLvF/umZnhyAR7TNQ8DTLJ+IiLk5BiNX2R+QBBw43H3ZLBuu8ukVw1u
X-Mailer: b4 0.14.2
Message-ID: <20251227-phyb4-v10-1-e8caf6b93fe7@google.com>
Subject: [PATCH v10 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
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
X-CRM114-CacheID: sfid-20251226_165350_953028_938476F1 
X-CRM114-Status: GOOD (  16.86  )
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
index dc731d37c8feeff25613c59fe9c929927dadaa7e..faedcf6994e0be0c29c03dc424ca86bc9a1bbd70 100644
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


