Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BED0D41D52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 05:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5evVJe9YgCMoLbOq7vFTmVzweZlO6clGzRhDs8KjQ4=; b=QfnyHdjVdt7qkjn6/QqSwKKbPF
	mRU1HDnTfT6X3lDBOrPIJGTokbQE/4w9OUtAu6DHquIbOMrX1cV61uHgNVLJEpy0OsV1wmuUnL9oC
	EElku0IHOW04Sxqkmy/48fN+Gdo/rwdI8+2RDLeDV6bFUbjHt+DOWJ0eqzAJRpfDliJnkGqrDFeBc
	OrV2x9dbMsehyWmUIAMMaeeA8zfYZXWaiQaoF7LbdGSIRXmH0YEdU6JsBj3catub91vN7jLz4e2E2
	byk44pbcz5doyB8T9cXWH1jr5M5qJkL+j/1HUBDvJSZF757+74OiHotcW42FxahXzx3b8WbMTw+mY
	jM+AMhZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAjYT-00000002GTv-1jCU;
	Tue, 12 Nov 2024 05:35:09 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAjVK-00000002G72-0xS8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 05:31:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20caea61132so45372715ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 21:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731389513; x=1731994313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5evVJe9YgCMoLbOq7vFTmVzweZlO6clGzRhDs8KjQ4=;
        b=Tv37y/AZP/9jcUzwo91N77Ge2WQPOpXMdCIPvkvVGYCLQFJlXtwj1Pzbpsvlp5amB6
         XzNDfsRcehEzGZCHvE7A3VsaPKPWLYdlfY/xPx5E1axLiLK4B51mjUvxbxDarEiAImbl
         65xz4Rk1miKuMeNFCSjpZCy+0fyFSUUUo88hRpEzGhXuKzWkX2TlWfJW6D0uDOaAwrnc
         +Ygz6/PvZZTbiLeF/IvCAPadr9G2L6GsfgYaz51RQWxvF9Elw0e2W1uYUDcxz5Vte6FT
         fkY7igKxj4cAGr3utOO3DywlgpNTqgS3xKNRgzxnVEBgoAe7Co9MoH7GPtMVWQHBF/PD
         z7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731389513; x=1731994313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5evVJe9YgCMoLbOq7vFTmVzweZlO6clGzRhDs8KjQ4=;
        b=L0YP2nbTMLScDGGeheCXX6CcOtNuboCdy4fcj75kjU5m5gr9TZ/dGeR0S85SnzIuVG
         B2GoSOQoF1mTMtQaILIARI7z5VHnTL1f/A8/v3Am/LQp59gIvNL5DMJQpiVzEJ3eoN2W
         fkIv+8+daZ76RNqqRgY0aO363YR2wDTOB0tmU1LCQfXY/9zAIxMX/17xVEGpa7KRrQ7W
         70WSTc7is4inqZ4biHAiPACsKw1LhJY51p9LNhuK5L8BrED+GY/WaD4wDSgV1ZY55sDj
         3Gj8zKwXhHCeel981rd/JLvKcMzbJyVxo92rwRsNRijAsnXnrJnuM3OF6oBZw9FhbMdT
         V81g==
X-Forwarded-Encrypted: i=1; AJvYcCVp7GI5oDMS0z/gKqim2xi9Tk0mi3xxsG1LwEtXlIbBCF71CzsW3NuYkmC2VmqbU2K8c3SmRbHAy63NAof+lWPZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0TmfguvlbMiLP9NBetxr4pPW8eXn14fT6sq+x3CrXp48SDQQZ
	3ue0JRcQ2dqIzd+Ut4/EjNrzN0/HNvxtQwG32pufPZMUEzadkVCrWabo1tf+
X-Google-Smtp-Source: AGHT+IGZcCjvN1JPlKYyMIXS7wcYyjBWhgB0d+UbZEbzCOILH5e3F6ERAex9O4PI4FBWMj8kvxPryg==
X-Received: by 2002:a17:902:f54b:b0:20e:5777:1b81 with SMTP id d9443c01a7336-211835b1f2dmr223702395ad.50.1731389513249;
        Mon, 11 Nov 2024 21:31:53 -0800 (PST)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177ddf19esm85815505ad.92.2024.11.11.21.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 21:31:52 -0800 (PST)
From: mjchen <mjchen0829@gmail.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sudeep.holla@arm.com,
	peng.fan@nxp.com,
	arnd@arndb.de,
	mjchen0829@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mjchen@nuvoton.com
Subject: [PATCH v2 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Date: Tue, 12 Nov 2024 05:30:58 +0000
Message-Id: <20241112053059.3361-2-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241112053059.3361-1-mjchen0829@gmail.com>
References: <20241112053059.3361-1-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_213154_289967_4B3551EA 
X-CRM114-Status: GOOD (  16.07  )
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

Add YAML bindings for MA35D1 SoC keypad.

Signed-off-by: mjchen <mjchen0829@gmail.com>
---
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..71debafc3890
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Keypad
+
+maintainers:
+  - Ming-jen Chen <mjchen0829@gmail.com>
+
+allOf:
+  - $ref: /schemas/input/matrix-keymap.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-kpi
+
+  debounce-period:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192]
+    description: |
+      Key debounce period select, specified in terms of keypad IP clock cycles.
+      Valid values include 0 (no debounce) and specific clock cycle values:
+      8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, and 8192.
+
+  nuvoton,key-scan-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Set the time it takes to scan each key in the keypad, in clock cycles of the IP.
+      This parameter controls how frequently the keypad is scanned, adjusting the response time.
+      The valid range is from 1 to 256 clock cycles.
+    minimum: 1
+    maximum: 256
+
+  nuvoton,key-scan-time-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Set a divider that adjusts the scan time for each key.
+      This value scales the time it takes to scan each key
+      by multiplying the key-scan-time by the specified factor.
+      For example, if you set key-scan-time to 64 cycles and configure key-scan-time-div to 2,
+      the scan time for each key will be increased to 128 cycles (64 cycles * 2). time.
+    minimum: 1
+    maximum: 256
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - linux,keymap
+  - debounce-period
+  - nuvoton,key-scan-time
+  - nuvoton,key-scan-time-div
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    keypad@404A0000 {
+      compatible = "nuvoton,ma35d1-kpi";
+      reg = <0x404A0000 0x10000>;
+      interrupts = <79>;
+      clocks = <&clk>;
+      keypad,num-rows = <2>;
+      keypad,num-columns = <2>;
+
+      linux,keymap = <
+         MATRIX_KEY(0, 0, KEY_ENTER)
+         MATRIX_KEY(0, 1, KEY_ENTER)
+         MATRIX_KEY(1, 0, KEY_SPACE)
+         MATRIX_KEY(1, 1, KEY_Z)
+      >;
+
+      debounce-period = <8>;
+      nuvoton,key-scan-time = <1>;
+      nuvoton,key-scan-time-div = <24>;
+    };
-- 
2.25.1


