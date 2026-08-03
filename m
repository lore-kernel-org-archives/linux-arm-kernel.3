Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128A4C55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jidbxiox7dX03nOKASiwvW/wC69oSzUN52btxDpp97E=; b=BudBSq3t17Q29Tk9HGs5ZuL7IQ
	t6FZc0tVGcO9OTlhSC4vwoSmS/cO8Zj36t41LmLBLJBPairem9UTeNq/dnOcBnFyVHIQuEaAeR5P6
	h5FyqE9LDvMY4cGYMIUEU1aj34hZsIcy31W5lkKy+geBrtCxydMDm8wc9RXxheWaSXBx/uCbSZMYk
	h/gZJ/OAm9TFXQz1enAmP4fXd9pMneGyp/MTTS501V+ltTwGk4cfeSnqcLDBVjC6i0gMugV7lafIH
	LNq0lMyrxYu9EMa8RdMXoWRAb2r70+PXha3w8Th+8chleXXlrnhskc+FmhW/jks7NUKXl5XbPuBhW
	vxLrtQYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1e-0000000GL5G-3Eyw;
	Mon, 03 Aug 2026 05:15:46 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1a-0000000GKva-2zhx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:45 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso1945160a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734142; x=1786338942; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jidbxiox7dX03nOKASiwvW/wC69oSzUN52btxDpp97E=;
        b=d/ZNNkTdjBn6nblrP7NtkPHpEdDyjnH22n8Om2FgFMOMnAPg408fcUmddeNvNDgqrf
         Nn1Kda0AXbcxb6Om8lhuCpvk7Wx9IRdTOzGke+UZIX3W7r81KKpmskK+VuJap6aPhbdP
         nS4IECnCM0Jnn8UApy0RCAnPTvj2PPiR0zAAqwpm9yTZuIslWokN1ppnDa2s8m8WjPdK
         Uij0NKb2TBhDW03Y4kglXmiLmJOZcmxXKBkjc6ivsW+o0R40n/THWcxmF8LK8p85URvj
         V8go+EN61qpviCOwFObr7tNLgN5YmXeOISajPH+pY2Dgjq+hb3cDbmMg8Xdr3co5aESU
         mNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734142; x=1786338942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jidbxiox7dX03nOKASiwvW/wC69oSzUN52btxDpp97E=;
        b=GiN1R7TcE66L+G35da+St742WoqO4omvOaFQVngLsg5yg0/DBajeYiu00E16CnREYm
         gWF431fDOuMBOWvmMjMEEm++NJmhL/3Q4FbcPOakxGyT90Q546w8tcDv4aiGwvtnEOaP
         AYDWpaaireZ8zeHqpXx+Fd74X91cZHu+RWhr5nH65+ynNql3iwoUzWcVo8DIloUZkRd+
         yNKLGKYrByWzl/O9Y+8ZtKwGo+haNo7L0vknxRd2Z6RaxOPeBU+RLYq0m46tmFr4S8ey
         Oe6OBaHI7vevlRugCn+4EEttjD6jHJCbCoATfE7CGx/U+FBx9N+gyNaLkmb+AQMIY4Zu
         xVmA==
X-Forwarded-Encrypted: i=1; AHgh+Rpvc4M+C2KOdWeAXtVy0ZmX4ntDAsgeZe/iSYmyGrRLUl5RFIHG8nSmFznJCbVbBKvg24fpnrBsLU5s1nBr06pe@lists.infradead.org
X-Gm-Message-State: AOJu0YwsdGzNTdqnxxqLrR34sEZyXZTqX4KPt1e2jfsklb88yDDzbNGk
	+cdImxFy+RvDEMr81IBM26QefECguHxMMdxMx/EIw3kMJkl6ZoVou8bz8TDXu9Oh
X-Gm-Gg: AR+sD10SJPRenxIYn3kSqxpACRkaXa9RxLn/4sgtfkTxi+D05n/jWl5HYc1nz3dSNEU
	mP9aQOFvyQvc9FUXFV1a38gOkqppiQP4SzrEVEtvsvfu/9EkN/0OEXFRZa7su0v5qthPs+b3/K7
	h5/CsmC+vJcAoyCiQ41fZ4gOK+TjV3nfnDibK1VoaaI0WUbpuPX1SgMiEc5nCpz8ZlV7JOYaKCb
	ny1+utb0OI5ZPYT1PDqa9bU6Iv1wO4GO8r/KXUwAO+ykGqOpC7noD1TPm1TphEoeh24ah+IhWMS
	InKnCvKayKl9LiVlymgF01cmJPAPPKJUhxZtawqGP84HaEIHugebjgIizNAFBdidyYklMJyhpiO
	OOWqn7qtBv8u3gdaQQTGKVcvFjvlihW2FsjL+bpyVmQ5gg9t/XjhU+0URpVRbFiH5QSCG8YkD3M
	FNp4o/CoW/OLN70QcQBHBUxl7M415NFc+gKX9+ztwMwHcF+f1LbCcx+Q8gMipXdegLh7nluH+4D
	0NxirZq6JZapVqND6/C7u5QPKa4JnF5j4DcwTV1L0Qwlb+FgcWrdnjk1NfLsfoEXOpkcNQXmQWh
	b33/RgzdSmazSE0lxTuPgTi7kkBqdOPduGtiHnuzYEcZFTnVufiDX3t/pV45/gtp7QUNBQ8VW1S
	4FepwVOCt2hAFtky4
X-Received: by 2002:a05:6830:411d:b0:7d9:f50f:9691 with SMTP id 46e09a7af769-7f1968c88e1mr15370101a34.0.1785734141726;
        Sun, 02 Aug 2026 22:15:41 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:23 -0600
Subject: [PATCH 13/21] dt-bindings: net: x-powers: add AC200/AC300 EPHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-13-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_221542_893481_0FE2C8AF 
X-CRM114-Status: GOOD (  20.69  )
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

AC200 and AC300 companion ICs contain compatible Fast Ethernet
link-PHY implementations which report the same PHY ID but use
different control interfaces.

Describe the forced-ID link PHY and its control-device references.
Fixed systems reference one already enabled control interface. A fixed
AC300 system may optionally provide the configuration field for its
calibration-range bit; omitting it selects the normal range. Systems which
can contain either companion reference both candidates and require a
logical two-bit NVMEM field for variant selection and AC300 calibration-
range tuning.

The link node reg value is programmed through the AC200 control
interface, while AC300 requires it to match the package-strapped
address. A control reference is required to distinguish this
integration from other PHYs which report the same ID. Also describe
the optional xMII receive-clock inversion required by some integrations.

Describe the three fixed-function package LED outputs using standard
PHY LED children. Their functions are link/activity, 100 Mbps speed
and duplex, and their polarity is shared. Omitting the container
retains the vendor fallback with all outputs active-low; an explicit
container enables only the outputs it describes and may select the
shared polarity.

Allow a PHY with a routed interrupt to be marked as a wakeup source
for magic-packet and link-change Wake-on-LAN.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,acx00-ephy.yaml          | 217 +++++++++++++++++++++
 1 file changed, 217 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,acx00-ephy.yaml b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy.yaml
new file mode 100644
index 000000000000..3e01f6b44006
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy.yaml
@@ -0,0 +1,217 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,acx00-ephy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 and AC300 Ethernet PHY
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 and AC300 contain compatible Fast Ethernet link-PHY
+  implementations which report the same PHY ID, but use different control
+  interfaces. Systems with a fixed companion IC describe one control
+  interface, which must already be enabled. A fixed AC300 system may provide
+  an NVMEM configuration field to select its calibration range; omitting the
+  field selects the normal range. Systems that can contain either companion IC
+  describe both control interfaces and require the field to select the
+  matching one before the PHY identification registers are accessible. In
+  that dual-control topology, the AC200 I2C controller and AC300 control
+  device may use status "fail-needs-probe" so the selected one can be enabled
+  dynamically. The PHY node's reg value is programmed through the AC200
+  control interface. For AC300, it must match the address selected by the
+  package straps.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: ethernet-phy-id0044.1400
+  required:
+    - compatible
+  anyOf:
+    - required:
+        - x-powers,ac200-control
+    - required:
+        - x-powers,ac300-control
+
+properties:
+  compatible:
+    const: ethernet-phy-id0044.1400
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Logical SoC SID field whose bit 0 selects the AC300 control interface in
+      a dual-control topology and whose bit 1 selects its low-calibration
+      tuning sequence.
+
+  nvmem-cell-names:
+    description:
+      In a dual-control topology the configuration field uses bit 0 to select
+      AC200 (zero) or AC300 (one). Bit 1 selects the AC300 vendor sequence for
+      a low-level calibration value in both dual and fixed AC300 topologies.
+    const: configuration
+
+  x-powers,ac200-control:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AC200 Ethernet PHY control function
+
+  x-powers,ac300-control:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AC300 MDIO Ethernet PHY control device
+
+  x-powers,xmii-rx-clock-inverted:
+    type: boolean
+    description:
+      Invert the xMII receive clock inside the PHY. This is required by some
+      SoC integrations, including the Allwinner H6 AC200 connection.
+
+  wakeup-source:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicates that the PHY interrupt is routed to a wake-capable interrupt
+      controller and may be used for magic-packet or link-change Wake-on-LAN.
+
+  leds:
+    type: object
+    description: |
+      Package LED outputs. Output 0 indicates link and flashes for transmit or
+      receive activity, output 1 indicates a 100 Mbps link, and output 2
+      indicates full duplex and flashes on a half-duplex collision. The
+      polarity setting is shared by all outputs, so active-high or active-low
+      declarations on different children must agree. Without an leds
+      container, all three outputs are enabled active-low to match the vendor
+      initialization. An explicit container replaces that fallback: only
+      outputs described by available child nodes are enabled, with active-low
+      used when no child specifies a polarity.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^led@[0-2]$':
+        type: object
+        $ref: /schemas/leds/common.yaml#
+
+        properties:
+          reg:
+            enum: [0, 1, 2]
+
+          inactive-high-impedance: false
+
+        required:
+          - reg
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+
+oneOf:
+  - properties:
+      nvmem-cells: false
+      nvmem-cell-names: false
+      x-powers,ac300-control: false
+    required:
+      - x-powers,ac200-control
+  - properties:
+      x-powers,ac200-control: false
+    required:
+      - x-powers,ac300-control
+  - required:
+      - nvmem-cells
+      - nvmem-cell-names
+      - x-powers,ac200-control
+      - x-powers,ac300-control
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+  nvmem-cell-names: [ nvmem-cells ]
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+  - if:
+      required:
+        - x-powers,ac300-control
+    then:
+      properties:
+        reg:
+          maximum: 7
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-id0044.1400";
+            reg = <0>;
+            nvmem-cells = <&ephy_config>;
+            nvmem-cell-names = "configuration";
+            x-powers,ac300-control = <&ac300_ephy_ctl>;
+
+            leds {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_LAN;
+                    active-low;
+                    default-state = "keep";
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_YELLOW>;
+                    function = LED_FUNCTION_LAN;
+                    function-enumerator = <1>;
+                    active-low;
+                    default-state = "keep";
+                };
+            };
+        };
+    };
+
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-id0044.1400";
+            reg = <0>;
+            x-powers,ac200-control = <&ac200_ephy_ctl>;
+        };
+    };
+
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-id0044.1400";
+            reg = <0>;
+            nvmem-cells = <&ephy_config>;
+            nvmem-cell-names = "configuration";
+            x-powers,ac200-control = <&ac200_ephy_ctl>;
+            x-powers,ac300-control = <&ac300_ephy_ctl>;
+        };
+    };
+...

-- 
2.53.0


