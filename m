Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BBFCFD36C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 06:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=88kFkP2tiIFI/W0cIcRfnFOjGOXOrhask+3UfD3dOMc=; b=qV1LfNunRtuzPeyokyjdgj2Psj
	BiiFKyNuZcxH0IXhpM7aI2gA4hC/6Opy/v6VssMy5CDLKNSgpG61oXs4BwFtTL3T5gxpf9H/oA+F/
	LjPGHXqwjmR5Wt3PyqcRNqo+44GV2zqvGTbrPWp4on2FdLxrn08ftdwcp0+06IOn6qL6BbskE7XOq
	uH77yn9hMVSiGoHlIHl4uB6sS6tC3XWwVarSjXVNbCMnuR9LTbAorg/SpRprb2J6I0Dmh2LS0JWtg
	vfI4oFSjTeBIV12Snzh/Dq0SGhhFAKTZf4qPUc2lYuRqsZ4gHVcJHALOfa6CNjBU8I0UUCO66vGqR
	W1sHHjrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNmrS-0000000CqAv-00sK;
	Tue, 25 Nov 2025 06:49:14 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNmrQ-0000000CqAX-0Dns
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 06:49:13 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so5043591b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 22:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764053351; x=1764658151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88kFkP2tiIFI/W0cIcRfnFOjGOXOrhask+3UfD3dOMc=;
        b=KKdERuOM27q5qx9tKOY+E/3QuMJW5bqEXaVqjDsmJ25OGlceeDL0eYSiAKlaiH9EHS
         G9noWvRiawd78b/lUivpymaFIK5jIFgYzvV1hQJTymjs6ECq2lYrrfGfHJb/PfsgKXn/
         jHpnkTq05yquD5Ulgvq6bmT+cdeMr2ZHLA50c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764053351; x=1764658151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88kFkP2tiIFI/W0cIcRfnFOjGOXOrhask+3UfD3dOMc=;
        b=jCD5lXXL/oc+HJ7gkhpv+Mh2vrVwwp42WaZT3tEu37uL4jYNjYbGBAZwz0XCCluX5i
         ICDoWzhLAwNj1AuOMLZRCQnWqzhoXuxAPJtj5Iyy4OReY3sZnb5nmHtbHVVEu8hy3ZO4
         qigAthTWQOCGETjqjBoWHpyEdNy5zpQRCSBptrTkYqizVJEKc+ovNxBgbWXnh8g43Of0
         XVtvRn/gP3DjI9/XCd0gsZGDB6lnvRX6r3cUf3nRPrmxDcRnu5UXGPISiM4L9DfWZ+09
         qO61I+IiZ3b/b3mXZOJ7PCPfEokxFXwAgNDWPzdXF27ht/qWBPzkCjvk99c2wHVV8gIJ
         FTzg==
X-Forwarded-Encrypted: i=1; AJvYcCVVBVeLU4dNcpoRtYSFYYvyco2BpH0jFELYuLeRSdaFBGbrTpZhMtt7eT36Z8nXB+zcDSEXJiEhJoBWd58RlJXy@lists.infradead.org
X-Gm-Message-State: AOJu0YzlF9qONhweZdpq6pJGBlECf4yGEHKBKGpMDiKlsp2JCkkRL6X1
	Rhk1Gt/oAEvQx8Lc70zF11Ve9s3ZF1YID17ZB7RMojLu8AtaJtZpMzf6+2ANIm+wcQ==
X-Gm-Gg: ASbGnctOKoPhEBq5NTCv7Kd89UaRyBApCJtO9hKVYEdS0dnqB+BtSiYwLiN1o2tHCUO
	NwOFFo0PBCcN4NiJetl65Hb93A6jG8IdGdrQ9TW6lrC3tgzjxE0UNFlFFeAUa8Gvg0oEdLbYubS
	IJGe69s6atZmK3H81CCYAQYdQWlZyy8rqY7Pnv9VSoZam7+Wc+sw4kaI80mxTCh/cgKJgio3tX7
	rDqHvK643LUMCCU4ItFreUz8eBoQmbhSh26jt21qLH3gx3IC96eafdpPNRgK09UQ1uJph45tWya
	FVNELmHATNV8qQEwolCrDHqMdfd24I8wpm0GAx4U1c3puyMIA/uiMR6LbMXXvTlA9aLQk84WZJZ
	U2Apq/HtiTeX8f2FtcaTqI0C83qkXYhbqtHlbt2wWcSOU0kDTQJ+6TYcPTUAkmzybgljDaE0lBp
	KB52vQ3tnfIFJZQmbeZmmldvJVx9Fxh1IkkL9OlhCaKAsxj8eWJCYXHhL9CfxRH/R9jZAv
X-Google-Smtp-Source: AGHT+IElth1ajKpACCGhmlgof/CcbLxkdUN0v+MBgrJOs6SF5vNzmM++ExuwEs9TPuCVCvtXkQXH5Q==
X-Received: by 2002:a05:6a00:228a:b0:7aa:a2a8:980f with SMTP id d2e1a72fcca58-7c58db2cd79mr14042173b3a.20.1764053350629;
        Mon, 24 Nov 2025 22:49:10 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:2b48:6622:575f:f283])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471022sm16853335b3a.21.2025.11.24.22.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 22:49:10 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: firmware: coreboot: Convert to YAML
Date: Tue, 25 Nov 2025 14:48:49 +0800
Message-ID: <20251125064851.3781993-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.460.gd25c4c69ec-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_224912_236360_0E475C6F 
X-CRM114-Status: GOOD (  23.15  )
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

Convert the existing text binding to YAML.

The description has been change to reflect the possibility of coreboot
inserting the node itself.

The example has been modified to compile and pass validation without
any errors. A comment was added to note what the firmware actually
emits.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/firmware/coreboot.txt | 33 ----------
 .../bindings/firmware/coreboot.yaml           | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/firmware/coreboot.txt
 create mode 100644 Documentation/devicetree/bindings/firmware/coreboot.yaml

diff --git a/Documentation/devicetree/bindings/firmware/coreboot.txt b/Documentation/devicetree/bindings/firmware/coreboot.txt
deleted file mode 100644
index 4c955703cea8..000000000000
--- a/Documentation/devicetree/bindings/firmware/coreboot.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-COREBOOT firmware information
-
-The device tree node to communicate the location of coreboot's memory-resident
-bookkeeping structures to the kernel. Since coreboot itself cannot boot a
-device-tree-based kernel (yet), this node needs to be inserted by a
-second-stage bootloader (a coreboot "payload").
-
-Required properties:
- - compatible: Should be "coreboot"
- - reg: Address and length of the following two memory regions, in order:
-	1.) The coreboot table. This is a list of variable-sized descriptors
-	that contain various compile- and run-time generated firmware
-	parameters. It is identified by the magic string "LBIO" in its first
-	four bytes.
-	See coreboot's src/commonlib/include/commonlib/coreboot_tables.h for
-	details.
-	2.) The CBMEM area. This is a downward-growing memory region used by
-	coreboot to dynamically allocate data structures that remain resident.
-	It may or may not include the coreboot table as one of its members. It
-	is identified by a root node descriptor with the magic number
-	0xc0389481 that resides in the topmost 8 bytes of the area.
-	See coreboot's src/include/imd.h for details.
-
-Example:
-	firmware {
-		ranges;
-
-		coreboot {
-			compatible = "coreboot";
-			reg = <0xfdfea000 0x264>,
-			      <0xfdfea000 0x16000>;
-		}
-	};
diff --git a/Documentation/devicetree/bindings/firmware/coreboot.yaml b/Documentation/devicetree/bindings/firmware/coreboot.yaml
new file mode 100644
index 000000000000..568afd1abb92
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/coreboot.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/coreboot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: COREBOOT firmware information
+
+maintainers:
+  - Julius Werner <jwerner@chromium.org>
+
+description:
+  The device tree node to communicate the location of coreboot's
+  memory-resident bookkeeping structures to the kernel. Coreboot's
+  FIT image payload can insert the node into the device tree. If a
+  second-stage bootloader (a coreboot "payload") is used, then it
+  is responsible for inserting the node.
+
+properties:
+  compatible:
+    const: coreboot
+  reg:
+    description: Address and length of the following two memory regions
+    items:
+      - description:
+          The coreboot table. This is a list of variable-sized descriptors
+          that contain various compile- and run-time generated firmware
+          parameters. It is identified by the magic string "LBIO" in its first
+          four bytes.
+
+          See coreboot's src/commonlib/include/commonlib/coreboot_tables.h for
+          details.
+      - description:
+          The CBMEM area. This is a downward-growing memory region used by
+          coreboot to dynamically allocate data structures that remain resident.
+          It may or may not include the coreboot table as one of its members. It
+          is identified by a root node descriptor with the magic number
+          0xc0389481 that resides in the topmost 8 bytes of the area.
+
+          See coreboot's src/include/imd.h for details.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    firmware {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        /* Firmware actually emits "coreboot" node without unit name */
+        coreboot@fdfea000 {
+            compatible = "coreboot";
+            reg = <0xfdfea000 0x264>, <0xfdfea000 0x16000>;
+        };
+    };
-- 
2.52.0.460.gd25c4c69ec-goog


