Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1D4CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 21:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/TLi9zqr3TmkEqRKNugGrU2dzYH7WuLg9EN/41Yje0=; b=GekPc1ZVU+37OmfG+ScMbGeMKp
	/kF04LM6oROG/cvonyfLf95NkQyGUBLGBpZLcm13xBdfnmI+5Hkzq8KSzDGy+7lqvNxy/bZqTGfnE
	1wWZqY8HBrPxQ93gk0aa0fq/e3yxkgy3gX/Jmynfx9V2kBxHmlieYclmN3o3K1cPQbWodSGT2qwZv
	M8fkl0s+Vip1KFxEIkBSg6U6tiZFV0kjs1US16AhUwO4GgQ2FmbyuEcIsMwFXQa1YGi4VcGjuLi4k
	B9vTYaRd+yD26qASMTSBXsNXLkb62x1SyBK6Ojibz+K3o8/ZKqB0EdxH9tHTNG5bEtXdDcp/L6HPa
	McMyYf2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDul-0000000306Y-3VgF;
	Wed, 29 Oct 2025 21:41:07 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDud-0000000302p-48NS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 21:41:01 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-29085106b99so2472045ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 14:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761774059; x=1762378859; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q/TLi9zqr3TmkEqRKNugGrU2dzYH7WuLg9EN/41Yje0=;
        b=JYyefb42YXLziQR+URZYaWw1oSoBFakhKiDiimH/96uq0SEj3Ue2Cz0TfzC/CpoHkG
         KtEs+gyncamBapMdnrPNLZF1zrggLFlTPkC+jSnjSfYwE/eSF5BsX5uzIVZyyAYJexwF
         g8fpbMNeG/mYSPxZgWXAiDVxtOpPcCVwIZChXndsPvPCEedg6IQj0nkiDw96j+mSIrnS
         zjxKRpXzojolVvurONQq7tWHjpqczYmnV6nUbyMABC71Z9peY3yxfs8akAuTRDWQlZsW
         v8nT5HY5tDHDMbN18StEoHoHZ6JgVFVWTgyIjlsV3AAhBQHghqWQbr9NNdl/2GR49Q8s
         FAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761774059; x=1762378859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/TLi9zqr3TmkEqRKNugGrU2dzYH7WuLg9EN/41Yje0=;
        b=BsgtbSbKckeWf6JfQH8DOzMj9OVEwKNNqXL400E7NqEsye0iC1eE185lSmT3wwVWhr
         NmSvA1Wp94gxUZ6nVurWr5kprN/JVfGVqo8Vld3vnNA9XcMUyZeJbk2O/Hdzylzyuu2e
         +IflBRxXrOOQYe2yn4ulgD1YeOVFQP8tjpLwbAaq4OUJuiRHVefVdA/rt4Hkrc/RuPvN
         caFbJXPD+GhXyNbPKXaez46PnExhEm/8JFSwFCfqacSMs22/szOZNs077dUlz6Yg0+lJ
         qqScXnx7Sm+8sTwjf3vR+0jqyGyQnD+Zia2tOB012pPqO4magAcDph9agFtlBDAXuzhz
         i+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQZbfbDcizyuLIll9xFVu9mDFOaE/Rd6QvNj5KNxR40we3/R47eN8M9ByWPkG8U4L5dF5ti/k03HWXabHavfF7@lists.infradead.org
X-Gm-Message-State: AOJu0YxYcIhdiuS7LpIirESBUqmlqjOrxSsP6yiaLfOzoCj4pA2G7LVi
	4eC9YqJKEYRrEB7nSKSah5sWp+YMRRpEVzyS0QgupxqdICg7hguyHjCB1Yk3XApTyI+ij0vP+75
	HZ2KXPg==
X-Google-Smtp-Source: AGHT+IHjZCapQlgh36DZaiJIbU3mEEeF0xr5npuEpjzvxQ1RgmrSJTd3OvlwYm13zuS1GDPmiCuLj+1oRUQ=
X-Received: from plbla5.prod.google.com ([2002:a17:902:fa05:b0:27e:eb0e:15aa])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea03:b0:292:fe19:8896
 with SMTP id d9443c01a7336-294def36a78mr46266815ad.52.1761774058892; Wed, 29
 Oct 2025 14:40:58 -0700 (PDT)
Date: Wed, 29 Oct 2025 21:40:31 +0000
In-Reply-To: <20251029214032.3175261-1-royluo@google.com>
Mime-Version: 1.0
References: <20251029214032.3175261-1-royluo@google.com>
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251029214032.3175261-2-royluo@google.com>
Subject: [PATCH v5 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Doug Anderson <dianders@google.com>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_144100_048421_94906441 
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
 .../bindings/phy/google,gs5-usb-phy.yaml      | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
new file mode 100644
index 000000000000..8a590036fbac
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
@@ -0,0 +1,127 @@
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
+
+properties:
+  compatible:
+    const: google,gs5-usb-phy
+
+  reg:
+    items:
+      - description: USB3.2/DisplayPort combo PHY core registers.
+      - description: USB3.2/DisplayPort combo PHY Type-C Assist registers.
+      - description: USB2 PHY configuration registers.
+      - description: USB3.2/DisplayPort combo PHY top-level registers.
+
+  reg-names:
+    items:
+      - const: usb3_core
+      - const: usb3_tca
+      - const: usb2_cfg
+      - const: usb3_top
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
+    minItems: 2
+    items:
+      - description: USB2 PHY clock.
+      - description: USB2 PHY APB clock.
+      - description: USB3.2/DisplayPort combo PHY clock.
+      - description: USB3.2/DisplayPort combo PHY firmware clock.
+    description:
+      USB3 clocks are optional if the device is intended for USB2-only
+      operation.
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: usb2
+      - const: usb2_apb
+      - const: usb3
+      - const: usb3_fw
+
+  resets:
+    minItems: 2
+    items:
+      - description: USB2 PHY reset.
+      - description: USB2 PHY APB reset.
+      - description: USB3.2/DisplayPort combo PHY reset.
+    description:
+      USB3 clocks are optional if the device is intended for USB2-only
+      operation.
+
+  reset-names:
+    minItems: 2
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
+        usb_phy: usb_phy@c410000 {
+            compatible = "google,gs5-usb-phy";
+            reg = <0 0x0c410000 0 0x20000>,
+                  <0 0x0c430000 0 0x1000>,
+                  <0 0x0c450014 0 0xc>,
+                  <0 0x0c637000 0 0xa0>;
+            reg-names = "usb3_core", "usb3_tca", "usb2_cfg", "usb3_top";
+            #phy-cells = <1>;
+            clocks = <&hsion_usb2_phy_clk>, <&hsion_u2phy_apb_clk>;
+            clock-names = "usb2", "usb2_apb";
+            resets = <&hsion_resets_usb2_phy>,
+                     <&hsion_resets_u2phy_apb>;
+            reset-names = "usb2", "usb2_apb";
+            power-domains = <&hsio_n_usb_pd>;
+            orientation-switch;
+        };
+    };
+...
-- 
2.51.1.851.g4ebd6896fd-goog


