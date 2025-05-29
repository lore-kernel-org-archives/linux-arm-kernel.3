Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65BEC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZBCgnAET/7svvvAxCFqw/qkQj58y6b6iHWz5ZaJvGE=; b=I8G+ofaZcJZ+wV8/+1hee3NiJR
	VJ7ThDLe/ktelPqle/WyiKfXLJV5hNcJrrp/xUePq3RO1QdLs+lCEXZ0+7UUB5lqtQY8vweqGYti0
	yglBH/wqWHlD1ghJZvfZe3lFZaqvZREK4Iav0nyh9edPYlHew3VGgEE3E+ZvbgqBztT2JTvM4qwoo
	Jf+eX9DqKEM8nhhId1ZSCdmH11JZfqAYM4rn6JAFkPCXSERfgO+px4YXEr7/H7EykOowbC2VuNGxg
	jPg1aHl7p/pMuIHLxKuH9nLFhE22B+ue+Sj0JjaRMA883Zajr4KpJsJGbZrzisOBOUoX6laqC88pE
	GvIADH/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKf7u-0000000G40A-0GSc;
	Thu, 29 May 2025 15:25:02 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeMN-0000000Fyzq-2BEa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 14:35:56 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-adb2e9fd208so35409266b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529354; x=1749134154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZBCgnAET/7svvvAxCFqw/qkQj58y6b6iHWz5ZaJvGE=;
        b=V7F0ZkZEwEMsBL9qDUZ/kk5n8Ar5aWwXBuDH9HUdbIPg65LJE+zkEtOvrLbep/UC3q
         AaC0bcGs+njudCuxMhWEJS8HVtCTA1Q/38EDzIxO88HyfxCHYi7Dp4xtVVPxgrCRUUTl
         2vAHKy9AsrKExQaUmCxRU4uvsaOFSIjohFNpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529354; x=1749134154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZBCgnAET/7svvvAxCFqw/qkQj58y6b6iHWz5ZaJvGE=;
        b=RH0G1rxqqqc/ukkD/Smg2BcsJkw8mFM85yxk8gU76LV79o+OQHvEVafav2Z2HWaBng
         NNlmPa69PLJCfs2cPzO7D2+z/mJgIopgPgz61lGsKITZFaRlvHsKIq7alLGcn+tOJ4Bk
         MRBWWIEcKNXk5nQRPKyc5uruSV9DixVCQviwsso5mPgsFIDbD9aYGdPbnfEKd5ts34hB
         fQgD5akSAUvrY3IPGkq2DD/s7MgI2C6Ua9t66ybkCLjgjGOf4SY3iODkWA2sHit1O0hW
         FDr4RVjnQUe3p55pnU1kg/LSCJckL3ufqYYytLxb99rAT2PCELkSoizey/dse6v8v5Vs
         F0zg==
X-Forwarded-Encrypted: i=1; AJvYcCUdXFOgtaYjxsMHv7s446YJi98S3ZyBiput/KzcXl1DQrqS8ALoEcvagXz5Jxrifi3MEwZ7zXgiYhz0Ubf3kx60@lists.infradead.org
X-Gm-Message-State: AOJu0YzBYNPOFNaVfqf1Qv+4XIQSFcIOoYXga40MbKFUbNRuMOP1CoOW
	jdNlmnhzPBmOSyr1o05dfbhrNvtEaBxlpAO5nxZOJ5I8LdPLob5kjWvh2UfQnYC3zh0=
X-Gm-Gg: ASbGncvND3GnUepRq2udT40rAoR3rEaK97WVR1kCDDPIT5i0c+Cu5++bDWn6DMP41Fc
	MGmXniqWA2v++x9PEHbb/VmaglFauR2CVb/Acj/7Er9th0iMe9ShJ+zBDMc6rsI9jJcVYkfK/XW
	UtFCKm+Df1s9sj0YgDvGr+E3xboqsR/wPBPdOq3Hs1VUb5wKjAGYX03IA6jTcAoOl9Ts129JLcj
	ngghP5X4BqHBX8Alj4tT2Rc8YxOSifp9hqDqUptH3kt06OrnfyqAYURJneAyBl28qoVQkYWBObk
	aLH2TV17IsSUmjII+AR1kwnR6tNb5EMl9ML8JSM7ksxiEk7dGlRWhJwKa6DdCDG+gPaAxKNFT13
	e+mDBPBM+c8eE/C1Q
X-Google-Smtp-Source: AGHT+IHa52b+vSbAsyz/N9mzyCKngvFXo9cXYY8r05kAw/BK0bB/NY6TNVZhWWYTAv9SIpftClPn9A==
X-Received: by 2002:a17:906:b810:b0:adb:2f9c:34bb with SMTP id a640c23a62f3a-adb2f9c7504mr24458666b.49.1748529353961;
        Thu, 29 May 2025 07:35:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:35:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/6] dt-bindings: mfd: convert mxs-lradc bindings to json-schema
Date: Thu, 29 May 2025 16:35:08 +0200
Message-ID: <20250529143544.2381031-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_073555_563188_411079F4 
X-CRM114-Status: GOOD (  20.45  )
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

Convert the Freescale MXS Low-Resoulution ADC (LRADC) device tree
binding documentation to json-schema.

The clocks and #io-channel-cells properties have also been added; They
are present in the respective SoC DTSI files but were missing from the
old mxs-lradc.txt file.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v4:
- Fix typo Low-Resoulution -> Low-Resolution'
- Wrap lines at 80 char.
- Drop '|' from the description
- Describe what each interrupt is for.
- Move touchscreen-wires constraint for imx28 to the top level

Changes in v3:
- Add Reviewed-by tag of Conor Dooley

 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ------
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 131 ++++++++++++++++++
 2 files changed, 131 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml

diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt b/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
deleted file mode 100644
index 755cbef0647d..000000000000
--- a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-* Freescale MXS LRADC device driver
-
-Required properties:
-- compatible: Should be "fsl,imx23-lradc" for i.MX23 SoC and "fsl,imx28-lradc"
-              for i.MX28 SoC
-- reg: Address and length of the register set for the device
-- interrupts: Should contain the LRADC interrupts
-
-Optional properties:
-- fsl,lradc-touchscreen-wires: Number of wires used to connect the touchscreen
-                               to LRADC. Valid value is either 4 or 5. If this
-                               property is not present, then the touchscreen is
-                               disabled. 5 wires is valid for i.MX28 SoC only.
-- fsl,ave-ctrl: number of samples per direction to calculate an average value.
-                Allowed value is 1 ... 32, default is 4
-- fsl,ave-delay: delay between consecutive samples. Allowed value is
-                 2 ... 2048. It is used if 'fsl,ave-ctrl' > 1, counts at
-                 2 kHz and its default is 2 (= 1 ms)
-- fsl,settling: delay between plate switch to next sample. Allowed value is
-                1 ... 2047. It counts at 2 kHz and its default is
-                10 (= 5 ms)
-
-Example for i.MX23 SoC:
-
-	lradc@80050000 {
-		compatible = "fsl,imx23-lradc";
-		reg = <0x80050000 0x2000>;
-		interrupts = <36 37 38 39 40 41 42 43 44>;
-		fsl,lradc-touchscreen-wires = <4>;
-		fsl,ave-ctrl = <4>;
-		fsl,ave-delay = <2>;
-		fsl,settling = <10>;
-	};
-
-Example for i.MX28 SoC:
-
-	lradc@80050000 {
-		compatible = "fsl,imx28-lradc";
-		reg = <0x80050000 0x2000>;
-		interrupts = <10 14 15 16 17 18 19 20 21 22 23 24 25>;
-		fsl,lradc-touchscreen-wires = <5>;
-		fsl,ave-ctrl = <4>;
-		fsl,ave-delay = <2>;
-		fsl,settling = <10>;
-	};
diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
new file mode 100644
index 000000000000..f90fdfbb74a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mxs-lradc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS Low-Resolution ADC (LRADC)
+
+maintainers:
+  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+description:
+  The LRADC provides 16 physical channels of 12-bit resolution for
+  analog-to-digital conversion and includes an integrated 4-wire/5-wire
+  touchscreen controller.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,imx23-lradc
+          - fsl,imx28-lradc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  interrupts:
+    minItems: 9
+    maxItems: 13
+
+  fsl,lradc-touchscreen-wires:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [4, 5]
+    description:
+      Number of wires used to connect the touchscreen to LRADC.
+      If this property is not present, then the touchscreen is disabled.
+
+  fsl,ave-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 32
+    default: 4
+    description: |
+      Number of samples per direction to calculate an average value.
+
+  fsl,ave-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 2
+    maximum: 2048
+    default: 2
+    description:
+      Delay between consecutive samples.
+      It is used if 'fsl,ave-ctrl' > 1, counts at 2 kHz and its
+      default value (i. e. 2) is 1 ms.
+
+  fsl,settling:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 2047
+    default: 10
+    description:
+      Delay between plate switch to next sample.
+      It counts at 2 kHz and its default (i. e. 10) is 5 ms.
+
+  "#io-channel-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - fsl,imx23-lradc
+then:
+  properties:
+    interrupts:
+      items:
+        - description: channel 0
+        - description: channel 1
+        - description: channel 2
+        - description: channel 3
+        - description: channel 4
+        - description: channel 5
+        - description: touchscreen
+        - description: channel 6
+        - description: channel 7
+    fsl,lradc-touchscreen-wires:
+      const: 4
+else:
+  properties:
+    interrupts:
+      items:
+        - description: threshold 0
+        - description: threshold 1
+        - description: channel 0
+        - description: channel 1
+        - description: channel 2
+        - description: channel 3
+        - description: channel 4
+        - description: channel 5
+        - description: button 0
+        - description: button 1
+        - description: touchscreen
+        - description: channel 6
+        - description: channel 7
+
+additionalProperties: false
+
+examples:
+  - |
+    lradc@80050000 {
+        compatible = "fsl,imx23-lradc";
+        reg = <0x80050000 0x2000>;
+        interrupts = <36>, <37>, <38>, <39>, <40>,
+                     <41>, <42>, <43>, <44>;
+        clocks = <&clks 26>;
+        #io-channel-cells = <1>;
+        fsl,lradc-touchscreen-wires = <4>;
+        fsl,ave-ctrl = <4>;
+        fsl,ave-delay = <2>;
+        fsl,settling = <10>;
+    };
-- 
2.43.0


