Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2BECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 23:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pilEeHQO+FyIhwT8vsqE7kBUhsB1RCnW8CxJp4flC8=; b=FglBv7xVNMH6ScWQ4CEyEQf6PM
	ajFYFi+P7Rqsw7tvWIyKM5FQiMwNZtisI3hzQw0rKSSGM7ZWPx+BzwThiY4cQVpl3XY3ww/ikpawO
	qa66ZgRIpdyzjruaTUSXIkBybeOP2kJ4B7rxerVjTQR4L/nDSZDFHgAY7asO8Z93gL4CUDjot076W
	zlMSuyKGCpy5ghiOeVhOgkH7y23QkcL+l1aCBSAVcsrfMkbRWZg3IYxgdoGW2xoh4Ll7xDaksZuZh
	v0gP9rr9nnMt/OD+aooCOIgzHesMOP41NkddsHLSXgYM67rV31B4r0lu05aUnCFpMEhtVYhTm6WU9
	48RrbHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9rB-0000000GQI1-0MF9;
	Thu, 06 Nov 2025 23:57:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9r5-0000000GQ9V-3Me5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 23:57:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so1121575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 15:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762473446; x=1763078246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pilEeHQO+FyIhwT8vsqE7kBUhsB1RCnW8CxJp4flC8=;
        b=cJngtD6gn9VRTYxi7rqrJI6rK6BGBKuF3GdSMaaCWOjEXcmwr51fLFSucms2NmMWkb
         dIvOa0gARV6OZ3fYvDgQv10Qz51QFcogZvVEZQaJ4KdW5q8BTfM8pHkrSGmDETMdoxkZ
         PtphIrFE6qUMA/4hgHyrIVQ3Vu/Dhv0djZvud8VLCh854CX4yL/yPKJfhYRxa2pq8tVj
         t/X81gWOoMZBtWqARKclhDDNu3DTaWZfhDtRtZQiUzfJ10wmKEqj3futJ3+kb0FtQs92
         NsAI1k7dDQPgFL6goq+tHOzHO0f492AFBNSwji3snKgubaz9lglpJ4dIhnSnlN+tBCmv
         +jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762473446; x=1763078246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5pilEeHQO+FyIhwT8vsqE7kBUhsB1RCnW8CxJp4flC8=;
        b=T9buhiXLekkQdxh14Fe/xyD0hiCK5fm1HF7UpmZibrkZwxv3ketx7TbvnwOW1VI5oW
         8lfmlcIrgzVNDFl2audYLoTRkqTeEcIfXxbIHTA8MAviCavK8/M/zPsIi/y4IOqmP7ud
         arwOoOAivFeJLhOnRYl5sbUGO1YlKstgXtYMMd2EGWEeJvJj4nIbj5KqFiA7DeKrtr0c
         7UccBYwmiw/NO1wF6v7sKouRt35Vok9koo2W617F9E0d03Dzo5xZvwd4fKyxDcz0rdVX
         FEjbwZ28ZyIVAE0nLVs1GS0CrFT6C6KKm8q+mpbDCTDn94RO7Crw5eyeVFB40EE8Ks7p
         Dkqw==
X-Forwarded-Encrypted: i=1; AJvYcCV/l9udmeoQRHHBd5v2anvl4Mht2ybo8DZfh5iba7zd6Kg6zUST/r5y1TOqbplsQ94q3ZLrJ8tmDRcgJDmFhF6s@lists.infradead.org
X-Gm-Message-State: AOJu0YzHXJe/oKGB65UfTJlrk99SP/xATw6WGPi4J8gzGJvKqZ4wdvyl
	4geqlRH6YvWpvOd+H5VwIx7kQ5hWt3rV88jCk9iRXDLmSs3kj63oEjFK
X-Gm-Gg: ASbGncttLiXjOZggG/kHr5HPG3wyhdZRKBZbaucY8y2gZU2QAJO5XTJVx246JK1JCOD
	f/vjn+sWfpO/M/vw83PZteNGnKDSujgrOd7UvepNfaT1zeJtraXTPTY0P0J02MZr8YcI9PcMdRX
	uY/7nSeMSM7E9Jt0XFNc0mppBvS8+tw2rABtWUbwbgnmDujlQ175b30CT/ZnbpV9hGbW2C6QZCM
	DiOL6T26sF3Lsz01UWHKX5O+WQnJ2QIXPjnkLjqtarjqxlgn00INIq8AcitWNm1ke3tf7husZNh
	I5m05cG/AZ92cV2/TUCdE0JMY7O1TTKCS599ou28G/y5QinQHYyqa0J1GKxLL4l6LJAh5Pyy54A
	wCN0kJUEMxYDtS+OkcjBtE+SZz1vpcF8ZwNioRHaQeLMKO+34Bg+9F7s8zwISFh021via1pNucR
	vm9oTKIcHZ/OaH4hxLUgi2In9SUbeAmjPz68VMsskj
X-Google-Smtp-Source: AGHT+IFiGFqB4J9gek1K6j17BwTcn02sy4NVhdapLkhnQqeGimPYGisCjq2JiJN69nmdcO4xR909oA==
X-Received: by 2002:a05:600c:a4b:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-4776bcde4d5mr8079985e9.29.1762473445998;
        Thu, 06 Nov 2025 15:57:25 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm129470525e9.0.2025.11.06.15.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:57:24 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 4/5] dt-bindings: pinctrl: airoha: Document AN7583 Pin Controller
Date: Fri,  7 Nov 2025 00:57:07 +0100
Message-ID: <20251106235713.1794668-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106235713.1794668-1-ansuelsmth@gmail.com>
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_155727_921473_1077AE91 
X-CRM114-Status: GOOD (  16.47  )
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

Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
minor difference on some function group (PCM and LED gpio).

To not bloat the EN7581 schema with massive if condition, use a
dedicated YAML schema for Airoha AN7583.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../pinctrl/airoha,an7583-pinctrl.yaml        | 402 ++++++++++++++++++
 1 file changed, 402 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
new file mode 100644
index 000000000000..79910214d9b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -0,0 +1,402 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/airoha,an7583-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 Pin Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The Airoha's AN7583 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: airoha,an7583-pinctrl
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - interrupts
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+patternProperties:
+  '-pins$':
+    type: object
+
+    patternProperties:
+      '^mux(-|$)':
+        type: object
+
+        description:
+          pinmux configuration nodes.
+
+        $ref: /schemas/pinctrl/pinmux-node.yaml
+
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
+                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
+                   phy3_led1, phy4_led1]
+
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+
+        required:
+          - function
+          - groups
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: pon
+            then:
+              properties:
+                groups:
+                  enum: [pon]
+          - if:
+              properties:
+                function:
+                  const: tod_1pps
+            then:
+              properties:
+                groups:
+                  enum: [pon_tod_1pps, gsw_tod_1pps]
+          - if:
+              properties:
+                function:
+                  const: sipo
+            then:
+              properties:
+                groups:
+                  enum: [sipo, sipo_rclk]
+          - if:
+              properties:
+                function:
+                  const: mdio
+            then:
+              properties:
+                groups:
+                  enum: [mdio]
+          - if:
+              properties:
+                function:
+                  const: uart
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
+                           uart4, uart5]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [i2c1]
+          - if:
+              properties:
+                function:
+                  const: jtag
+            then:
+              properties:
+                groups:
+                  enum: [jtag_udi, jtag_dfd]
+          - if:
+              properties:
+                function:
+                  const: pcm
+            then:
+              properties:
+                groups:
+                  enum: [pcm1, pcm2]
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [spi_quad, spi_cs1]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: pcm_spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
+                           pcm_spi_cs2, pcm_spi_cs3, pcm_spi_cs4]
+                  maxItems: 7
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [i2s]
+          - if:
+              properties:
+                function:
+                  const: emmc
+            then:
+              properties:
+                groups:
+                  enum: [emmc]
+          - if:
+              properties:
+                function:
+                  const: pnand
+            then:
+              properties:
+                groups:
+                  enum: [pnand]
+          - if:
+              properties:
+                function:
+                  const: pcie_reset
+            then:
+              properties:
+                groups:
+                  enum: [pcie_reset0, pcie_reset1]
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                         gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                         gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                         gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                         gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
+                         gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
+                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
+          - if:
+              properties:
+                function:
+                  const: phy1_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio1, gpio2, gpio3, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy2_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio1, gpio2, gpio3, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy3_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio1, gpio2, gpio3, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy4_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio1, gpio2, gpio3, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy1_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy2_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy3_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy4_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+
+        additionalProperties: false
+
+      '^conf(-|$)':
+        type: object
+
+        description:
+          pinconf configuration nodes.
+
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pins:
+            description:
+              An array of strings. Each string contains the name of a pin.
+            items:
+              enum: [uart1_txd, uart1_rxd, i2c_scl, i2c_sda, spi_cs0, spi_clk,
+                     spi_mosi, spi_miso, gpio0, gpio1, gpio2, gpio3, gpio4,
+                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
+                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
+                     gpio27, gpio28, gpio29, gpio30, gpio31, gpio32, gpio33,
+                     gpio34, gpio35, gpio36, gpio37, gpio38, gpio39, gpio40,
+                     gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
+                     pcie_reset0, pcie_reset1, pcie_reset2]
+            minItems: 1
+            maxItems: 58
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          drive-open-drain: true
+
+          drive-strength:
+            description:
+              Selects the drive strength for MIO pins, in mA.
+            enum: [2, 4, 6, 8]
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl {
+      compatible = "airoha,an7583-pinctrl";
+
+      interrupt-parent = <&gic>;
+      interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      pcie1-rst-pins {
+        conf {
+          pins = "pcie_reset1";
+          drive-open-drain = <1>;
+        };
+      };
+
+      pwm-pins {
+        mux {
+          function = "pwm";
+          groups = "gpio18";
+        };
+      };
+
+      spi-pins {
+        mux {
+          function = "spi";
+          groups = "spi_quad", "spi_cs1";
+        };
+      };
+
+      uart2-pins {
+        mux {
+          function = "uart";
+          groups = "uart2", "uart2_cts_rts";
+        };
+      };
+
+      uar5-pins {
+        mux {
+          function = "uart";
+          groups = "uart5";
+        };
+      };
+
+      mmc-pins {
+        mux {
+          function = "emmc";
+          groups = "emmc";
+        };
+      };
+
+      mdio-pins {
+        mux {
+          function = "mdio";
+          groups = "mdio";
+        };
+
+        conf {
+          pins = "gpio2";
+          output-enable;
+        };
+      };
+    };
-- 
2.51.0


