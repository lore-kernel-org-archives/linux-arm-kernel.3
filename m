Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8825CCA46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQkyDL/UyU0AOlGBBg/p3sULFCOnQoFDn72vXxom41I=; b=d2dLPm0StpwaLUKbsYF7w2fDjB
	ECcCeSVxhumASpa2BDwtW6pQ1Q242SnXd20JQA1cMczZWI1za0EyWc18XtEr3gdJQL9T3fcIz6rxQ
	BPifTP5jiwT96LEHa1W8jiPLXibF/OuDpbhGhVVkrCs1wT5rJCGb2Tw0FoexMbZaoMPASRe3lXK9/
	chvZK6gD3M3uPowKmpjNxdgMz8CdrXTk5U9P4TWvC9BlQ2NbSS2e+xr+5WhLl1xSiQaBQgmP3iqC2
	8zrLnhDW98Khp2C8Kga7UJhtXbP1Q1MtGDdGCL/Xoqd9zpVy3NEfHeT8Hia8UmaQC2SpDOgH905a5
	uFeKU4qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0i-00000004gp2-37iJ;
	Tue, 30 Sep 2025 08:47:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0b-00000004gkt-1U7N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 08:46:54 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso36105325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759222011; x=1759826811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQkyDL/UyU0AOlGBBg/p3sULFCOnQoFDn72vXxom41I=;
        b=TdFT9IiBT1ZkP7+L0FfaEAZT8LH2sEMFt8xt0K6lY0vzWxbnfPR8GSCA5zgRlrrfod
         fGnGZNVmJJ+rMBQ3u4se+rYPD0gn/lNMmeCTlhC4CWpJDppl4uPeGpqUeJOntoSFqLWi
         YJ2cOrvyEqi1SHYPwxk46qppllaVbYJATEy+q6ofURJtaKDqM9nHrb3c6OUukLQ4M0sp
         iz5xXaeKdzSCaBhoTLQ6eX5bDp+oxQmBYX+twhipzAT7R42F+ym3Bl0Ju6fJ+pfWQYa2
         YPMkh6JEV192wzcm8ugTWIPV7+HfoPHhHFjTNk4WS9p8svfbGEW6FUhHaoOLTB6GbGNT
         HlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759222011; x=1759826811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQkyDL/UyU0AOlGBBg/p3sULFCOnQoFDn72vXxom41I=;
        b=bDa03yGJtIoyBOOUTPzhNs+E0vfZSXkvhjMoh5puCI0YdPIAWnKJIsoO3c9v3F0JL2
         MFtGA1R98jhW2VgNzamx/mhOd6BFNHM0Lb1PNtrbzLmXSoil+9qisWN3OChgaVNcaIx3
         JTXaON43MI/yJWfr7/5AaQkEH44a4ublxl1lmeubxjiLEnxo+ai2RmlrF2s3tBCXxhxN
         wTrMJ8JCgqWeIRz+vChYYGjsK8GsuWeNVPntchXRa2ATnZ1BQ2G3zbKGca2shRDrH7QG
         uUE4OSsFGggjcDgaYlI3FgxgEd4Z7imqdWy/zpRRRz4B/bFF7xUsVBEovZXXZlDpP3EC
         CVhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8a2y8pZUSX+3pgv/SeJ4WvseybisrWsTKhUlJXQ4Fy0iShh9elhDUaSzyKzAuhDdsC5ZqQZxXc+ntY/efyMkK@lists.infradead.org
X-Gm-Message-State: AOJu0YwU5KKu25nzgXgNa4BypoUPimP2kI7umBAN9ocxdH7I4vM0OL0A
	9+M5+uluCfbgl6ZVFZYt+6TzfImmzeCe+j1TJcKNhgFD4Nh0akQy1J1Y
X-Gm-Gg: ASbGncuXPTsMkmgddsP/E3La3ep5x2H0niYmJNDHKp3rNTXoQU0tKL+Fs1BOtt/ij3M
	RPaApm3/nwvldNJTbPGTUBGpRqwQ9IrMDDIJXPWM16akWAfvSyl5AD7Q9xf4I3cUH/9xA7n32ZW
	Q1nJP/QH7lNXwGUZBZHClvJ1adITq8O5xDLsx+NNF7fPMaikkl8K47tjsgk8WC3sYxucRCKyRn+
	e5bhQ1RLP0yZQP7PAyQn0JY33xRUmAQdaj6U9jA5U3FUG8Rg+84pJV/Bkeld8x2xcynT5Xsc6fr
	eKf9EhA5tShUWRLQl2ytCtO6RCBJ0i1f6tXYt6jdJeUOdIu15WFMqvtot9Y8fQSq+Kizt/zUDW1
	12XpsfoweGhBd1pkkcKQXdZcxP9JMP1tp4ImxDki7piaDBJNI7lbSwe+nebrpuQFibNxmtSUCHi
	2TdYj657eA72hhK/6sqKPK51jCEHsZvrdOptrBvnxF
X-Google-Smtp-Source: AGHT+IHUW0KY2FKWo8nrRUZMd7SAgnbVpiI5ywcibvVT2PdmAhNIG/bS07n3xK/3WjGB++9DpjRJUA==
X-Received: by 2002:a05:6000:2484:b0:3f1:2671:6d9e with SMTP id ffacd0b85a97d-40e497c346fmr16640937f8f.1.1759222011362;
        Tue, 30 Sep 2025 01:46:51 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net. [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb89fb2fcsm23116418f8f.22.2025.09.30.01.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 01:46:51 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 30 Sep 2025 10:46:44 +0200
Subject: [PATCH v8 1/7] dt-bindings: memory: factorise LPDDR props into
 SDRAM props
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-b4-ddr-bindings-v8-1-fe4d8c015a50@gmail.com>
References: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
In-Reply-To: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_014653_445877_2C91D45E 
X-CRM114-Status: GOOD (  24.39  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

LPDDR and DDR bindings are SDRAM types and are likely to share the same
properties (at least for density, io-width and reg).
To avoid bindings duplication, factorise the properties.

The compatible description has been updated because the MR (Mode
registers) used to get manufacturer ID and revision ID are not present
in case of DDR.
Those information should be in a SPD (Serial Presence Detect) EEPROM in
case of DIMM module or are known in case of soldered memory chips as
they are in the datasheet of the memory chips.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 .../memory-controllers/ddr/jedec,lpddr-props.yaml  | 74 -----------------
 .../memory-controllers/ddr/jedec,lpddr2.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr3.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr4.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr5.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,sdram-props.yaml  | 94 ++++++++++++++++++++++
 6 files changed, 98 insertions(+), 78 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-props.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-props.yaml
deleted file mode 100644
index 30267ce70124..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-props.yaml
+++ /dev/null
@@ -1,74 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,lpddr-props.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Common properties for LPDDR types
-
-description:
-  Different LPDDR types generally use the same properties and only differ in the
-  range of legal values for each. This file defines the common parts that can be
-  reused for each type. Nodes using this schema should generally be nested under
-  an LPDDR channel node.
-
-maintainers:
-  - Krzysztof Kozlowski <krzk@kernel.org>
-
-properties:
-  compatible:
-    description:
-      Compatible strings can be either explicit vendor names and part numbers
-      (e.g. elpida,ECB240ABACN), or generated strings of the form
-      lpddrX-YY,ZZZZ where X is the LPDDR version, YY is the manufacturer ID
-      (from MR5) and ZZZZ is the revision ID (from MR6 and MR7). Both IDs are
-      formatted in lower case hexadecimal representation with leading zeroes.
-      The latter form can be useful when LPDDR nodes are created at runtime by
-      boot firmware that doesn't have access to static part number information.
-
-  reg:
-    description:
-      The rank number of this LPDDR rank when used as a subnode to an LPDDR
-      channel.
-    minimum: 0
-    maximum: 3
-
-  revision-id:
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-    description:
-      Revision IDs read from Mode Register 6 and 7. One byte per uint32 cell (i.e. <MR6 MR7>).
-    maxItems: 2
-    items:
-      minimum: 0
-      maximum: 255
-
-  density:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      Density in megabits of SDRAM chip. Decoded from Mode Register 8.
-    enum:
-      - 64
-      - 128
-      - 256
-      - 512
-      - 1024
-      - 2048
-      - 3072
-      - 4096
-      - 6144
-      - 8192
-      - 12288
-      - 16384
-      - 24576
-      - 32768
-
-  io-width:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      IO bus width in bits of SDRAM chip. Decoded from Mode Register 8.
-    enum:
-      - 8
-      - 16
-      - 32
-
-additionalProperties: true
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
index a237bc259273..704bbc562528 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 allOf:
-  - $ref: jedec,lpddr-props.yaml#
+  - $ref: jedec,sdram-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
index e328a1195ba6..0d28df3d2bfa 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 allOf:
-  - $ref: jedec,lpddr-props.yaml#
+  - $ref: jedec,sdram-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr4.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr4.yaml
index a078892fecee..65aa07861453 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr4.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr4.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 allOf:
-  - $ref: jedec,lpddr-props.yaml#
+  - $ref: jedec,sdram-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr5.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr5.yaml
index e441dac5f154..cf5d5a8e94b3 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr5.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr5.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 allOf:
-  - $ref: jedec,lpddr-props.yaml#
+  - $ref: jedec,sdram-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-props.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-props.yaml
new file mode 100644
index 000000000000..eb6f429e9eb2
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-props.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,sdram-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common properties for SDRAM types
+
+description:
+  Different SDRAM types generally use the same properties and only differ in the
+  range of legal values for each. This file defines the common parts that can be
+  reused for each type. Nodes using this schema should generally be nested under
+  a SDRAM channel node.
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+properties:
+  compatible:
+    description: |
+      Compatible strings can be either explicit vendor names and part numbers
+      (e.g. elpida,ECB240ABACN), or generated strings of the form
+      lpddrX-YY,ZZZZ or ddrX-YYYY,AAAA...,ZZ where X, Y, and Z are lowercase
+      hexadecimal with leading zeroes, and A is lowercase ASCII.
+      For LPDDR and DDR SDRAM, X is the SDRAM version (2, 3, 4, etc.).
+      For LPDDR SDRAM:
+        - YY is the manufacturer ID (from MR5), 1 byte
+        - ZZZZ is the revision ID (from MR6 and MR7), 2 bytes
+      For DDR4 SDRAM with SPD, according to JEDEC SPD4.1.2.L-6:
+        - YYYY is the manufacturer ID, 2 bytes, from bytes 320 and 321
+        - AAAA... is the part number, 20 bytes (20 chars) from bytes 329 to 348
+          without trailing spaces
+        - ZZ is the revision ID, 1 byte, from byte 349
+      The former form is useful when the SDRAM vendor and part number are
+      known, for example, when memory is soldered on the board. The latter
+      form is useful when SDRAM nodes are created at runtime by boot firmware
+      that doesn't have access to static part number information.
+
+  reg:
+    description:
+      The rank number of this memory rank when used as a subnode to an memory
+      channel.
+    minimum: 0
+    maximum: 3
+
+  revision-id:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      SDRAM revision ID:
+        - LPDDR SDRAM, decoded from Mode Registers 6 and 7, always 2 bytes.
+        - DDR4 SDRAM, decoded from the SPD from byte 349 according to
+          JEDEC SPD4.1.2.L-6, always 1 byte.
+      One byte per uint32 cell (e.g., <MR6 MR7>).
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 255
+
+  density:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Density of the SDRAM chip in megabits:
+        - LPDDR SDRAM, decoded from Mode Register 8.
+        - DDR4 SDRAM, decoded from the SPD from bits 3-0 of byte 4 according to
+          JEDEC SPD4.1.2.L-6.
+    enum:
+      - 64
+      - 128
+      - 256
+      - 512
+      - 1024
+      - 2048
+      - 3072
+      - 4096
+      - 6144
+      - 8192
+      - 12288
+      - 16384
+      - 24576
+      - 32768
+
+  io-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      I/O bus width in bits of the SDRAM chip:
+        - LPDDR SDRAM, decoded from Mode Register 8.
+        - DDR4 SDRAM, decoded from the SPD from bits 2-0 of byte 12 according to
+          JEDEC SPD4.1.2.L-6.
+    enum:
+      - 8
+      - 16
+      - 32
+
+additionalProperties: true

-- 
2.43.0


