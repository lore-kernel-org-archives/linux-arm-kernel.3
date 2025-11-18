Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEE2CEDDA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HinfaPqd1yRAzxd+xjJYcXYd+xWyrMsS3t+eI3gtPdU=; b=b7ckoZ6SX2utYK87zRQi4vbvot
	QtDOssHSAVpJYsVe3HbXoblT9udvNjYH8FuxuLoGxxpeEMbo9Nx56FdOGOEmHyRCddpiCW8bK7qqr
	osJ7AHcZdN5L95vLsmVjTJBiqBitPrQ8MXTmn5n3LCXgjKHV85P+QHSZdfsUQ/Iy/qdiFPtTBRhMv
	P55wNhnfbFveWbkXUJbJbJeuCQREzwwbmZEj0U4wWS6u8o/R6pEZ7XhB6tGpltajhG5Y7A1AqTgTv
	f3f/IHQkhJ+4W/Bw5O1+r5Ci+ihWX8r6H6YZLEwZU0SNlZ7761m6GFSbslZu7I+Su9Mr2XtuIPjVk
	gI3kJcfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKL-00000000bPv-0s14;
	Tue, 18 Nov 2025 15:09:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKF-00000000bMc-0VhA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 15:09:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso12129205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 07:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763478537; x=1764083337; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HinfaPqd1yRAzxd+xjJYcXYd+xWyrMsS3t+eI3gtPdU=;
        b=YIZqrOpqV3ONolN3U6VJ4PBVfmAPcc9Cz71WKeY+E8/9aAT8us7yex7BO6lJnmtF36
         09F45FaHygY/DX3DHAor16bF/viC5m7dOTTEugwcpil8f8bsTJfJUKhpea60oErMW+YE
         +/8x2GwYlgZ2xhlAlNN3XG1Ww7rhK/AcIV7O4WwtwMTZtOtfYXBcqQqhw63aFogxMCAd
         GS6ZSsjehqGdx769eg3iVirrgK9fem4CjC5P1zTh3/2APo8dzxvXf9HkGv7Nz7W7+4ME
         EyJR2s+SR5oYlZlLq03wITUFTgEm/9E5tlRoyc3Hpq7fov7jvFdn0hWQX/Dy2JbTKIxY
         UUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478537; x=1764083337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HinfaPqd1yRAzxd+xjJYcXYd+xWyrMsS3t+eI3gtPdU=;
        b=tUVM/f4yP7oyqKTeJvvsiRWa4Ah3XY1IAv4DkasAkGu74T6j4ZfEV/J46oYzOrYCQ6
         RMvnFRUJcKEX+IDg1pWI7Eplrax23pL5UFtSrYcAo2t0wRcy+WTjVw0fwyyhOXAWfK5c
         zLn0yuoCrLv2n9e+qYF0+1LmYovmDzacZPJi1U38fy7x/yBYGUplRC+XuPOBWSXFhRHW
         Odm9pvu8p+kaKyq5x2hO/UHxzPYHmW2A83xwJnhEFwogG841djEIj5NjmHE+m+J3U2Ab
         CWvPv1Uty4Gi8AaWF9waRCN9KqlBf7kXgC5tYle9q0a4v1IzVrzSOQzyKEitP2uwrMdZ
         wxjg==
X-Forwarded-Encrypted: i=1; AJvYcCUqQp19YQQbQdTawn4S/9TIUEUofWslALWUI9QDaPeZpg3uOpHTak2P9HF6uwQ50v60qn/l6nujtMTe/nfVin+k@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8EUpxSWEuf/peuflHQx1ZJVRBWMi4TxCFTLq0V4xy83+FqeSa
	odpZuXNELqiSxjVuFPskng9S+AJSDhJ+QGyuYOHZDHSf3Xd14EMq3ioY
X-Gm-Gg: ASbGncstEhHf1qU/x61InUu4Cbh2FjHiiBbngiwkdBFBTMiJtcWsvCtZx9nL0gXA/Wh
	7ldvKyvKWz1bZeQXGYVwA6/vnHh9srfBZbMU7LeGqMh8GQMLhs4izGZ4JBT9F8pCBIodtU8u0Ej
	cN/3KgJQfSdupJS1AffT51MbpdYJbPYcREv+DrugLRkClyUFBLYt+fcmTvZ38xS1REFuK2bSkU1
	fpnc7cbiLR2MyzehYBreG/8fTepyJJi1jKVHr2K5cxlYGXAZG61uNdMyiC9HV2sAppbeRPtuD4F
	8tThyJWYOAHHDvwGV2qysDWGyk3Km2UBRpDz7ts7y+gZScZls4exIF03/KieZkxAiebBsDI2bFq
	0vfvG5tMuBaqNYHrGcebpG1bQbQ6EOWEdVPvGNCrXtizQ76UuVlqGe98PHW4pKmq/yOLYYRt8vL
	zTBUgOiQ/G6jICbsH//BRKQBpFCYWbTpUDagMGh64h+2nBIEZ/ytKxcDo2P/WomGU6FTX79T4xR
	GFKxXSaNAOzNqHN
X-Google-Smtp-Source: AGHT+IHv1whfW/Gt4BR/61l0viGTeaPUBKraWX/Mr+1w9f4M9OK/6wicCkkZeRbs80bygRAnGOgpxw==
X-Received: by 2002:a05:600c:c4ab:b0:477:8b2e:aa7d with SMTP id 5b1f17b1804b1-4778feaf8e6mr180161735e9.30.1763478536873;
        Tue, 18 Nov 2025 07:08:56 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net. [2a02:842a:9b20:d01:432b:dab:f195:2b25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e36ca3sm397339915e9.5.2025.11.18.07.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:08:56 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 18 Nov 2025 16:07:57 +0100
Subject: [PATCH v9 1/7] dt-bindings: memory: factorise LPDDR props into
 SDRAM props
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251118-b4-ddr-bindings-v9-1-a033ac5144da@gmail.com>
References: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
In-Reply-To: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-86b30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_070859_211391_094E2DE3 
X-CRM114-Status: GOOD (  24.23  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
index 000000000000..fedd66eeb9d5
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
+      lpddrX-YY,ZZZZ or ddrX-YYYY,AAAA...-ZZ where X, Y, and Z are lowercase
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


