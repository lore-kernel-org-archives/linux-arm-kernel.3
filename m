Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36297CEB2DD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 14:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JphR/yfHrqeoxGCFuZ74qbjmgj/bPrWp2+gxF4BO3oE=; b=cRNqlDlNj2DdNagvuta06E1f76
	pSvfFCWFS/O93SeY1cCIgpBWseRbPCkHzFcP8tnG7p0qdNBrwImJlhjMbvOmxEOQVrr09gLFaeESS
	pUvOm03KIC9vCQxs1pwBgfNshSpcfSgBWGwMR42R4OEp3hpbGgqdaTpaqCI51t0d5enBGzU8ReoGe
	NFwL9RJZszkbl5lwJFweXFtIISsD+iX6HOKGl5ka3DWfI3HflcpO8OXyUL5fYndRPdDBt6pNdtSMe
	oSbRZSv0kdVYBiX7izGGlEjg0UnZf+8wFVlbz0BcK24KRhG+2icWQEq0hhAApL8C80RvsRE30Y9Yk
	ioZSbk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKH2n-0000000DplN-0mma;
	Sat, 15 Nov 2025 14:14:25 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKH2i-0000000DpiO-2WmD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 14:14:22 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b7277324054so393182766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 06:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216059; x=1763820859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JphR/yfHrqeoxGCFuZ74qbjmgj/bPrWp2+gxF4BO3oE=;
        b=V7kLIzeSh0B3MjnQh648UgSg+wFT3eAG2fRZA1nsfJ7UN1fJwEzgcyNDFuRXlpZmrN
         KIWgSUWLMqFbzcxeYuGs9BCB1t+IuvP+U3/PFiBAm6ixHdmGL8dEiwAbVAHb+xrPnglr
         /0h7oNxMvwxiXCqbHJg39Dm7832PEN9/gW4GOB9t5NXRFs+jRLKaiTSKpTCQgy6MES7F
         zqyX3XrcJpx5v2Xm3EiNT0NvmB23gkEE74OOz9vYHNCO+oOVOTdm7ZQ/gOR14nhAihx2
         pJsofRWCibIKYqv8Gn3BQBZgtgzrrcZnJSlXqA+jC32aypEwTxIJcteXrAhzOcxt7KgZ
         D7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216059; x=1763820859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JphR/yfHrqeoxGCFuZ74qbjmgj/bPrWp2+gxF4BO3oE=;
        b=cgDLvNJdQxAg3EqW/AvIUxb62p7t0dN2LuWp5uN/JjeIL0KdDc721xx0bIdlBp8wB/
         c9J5CwlpMC4XmX2Hms3OjqhPvaklMMKo1pvbWL2Zj2/SVt/t3CI0NNk36cRskRhKIiId
         AGcbYtoY6bKlCfZSy7Rnb3pMFSSQO17StJf260IRgjDwH1PDbI4MbEMRKJcXRq+BxOL3
         9+Eqie75TB8NwnmET0I66A625SA3OjJemyi8/dEfes0tnyngHL2MKZUmKyxk/mZyTOxx
         nZngzgQDs7t0EVITWmbIzF6uNOCROB8eq/8BRY4iQh3S3fYmhf/9Kd6Jxsdkq0aZ3wTu
         ln8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLVBzo0ZkJ9I3mgYgqOzDJUWkkV2NIzBGHqgpPzUT2EWGigp6D2oqek3PTRHwQPgtfx7GqTQrexaethYC0zEWh@lists.infradead.org
X-Gm-Message-State: AOJu0YwQAmNquqFylMaVRxQxJ4IpdCiZh2IdT/lWSuK0k9IBPULT70vg
	jr5LK1KJswAK4rODmHYM+MNoOYD0Hevt3kEeDNIRR2mWNm1zfYQBDY1N
X-Gm-Gg: ASbGncviAlfA59Knor7m4zoH2hSd3BnU8O802EtrB3Qq2tyPIExZ7qzqI2XGKkYcmHG
	L5LDRH+ye53nrlFNR2kVWbE38ct779D4xdCiYStB0ksgNgm10t+voWgjhLe30SMmt7Nf9IyaoCp
	ST1QtL0F/ZG/bfovujBdmpY6hKMqPPMJ1pjUMxr2mpsBI3S4gzvnIaRxh6vXtblRJFTAPlyXfJn
	4T7iFNl0Qy3B4KuigGI23C/COnXIA+yEC5/SmN6xwBs+QGhZas2d2ueXRNkx7MeyswR7Xyg9NO/
	F7Sb7JC/yXNb31AIOFH/U/xpJLS8ZI9IyBtoBANfsArJ4dEQngqHERZD1V+IKZIgsjH5ksa+NlV
	8DY7LbOdboya9Oew9GBpWfB/DKVLK5yMBUdAhrSUEHHyoCMyiC8dzOEM2BEeezn6Hl6gFQljnVD
	yAPUGgBCcqERgjRKfLtXkxCLUPSj3NaZRuVr2Y0a5liQEXAQ==
X-Google-Smtp-Source: AGHT+IF/NKVfiJ7TrqEh+PcUiDYYnExZ1hICJ4keAyez444tuP7vZ12VBd4zl4CNGFC7PXxBkD/1Pw==
X-Received: by 2002:a17:906:7304:b0:b72:a899:168d with SMTP id a640c23a62f3a-b73677edba0mr706079866b.13.1763216058665;
        Sat, 15 Nov 2025 06:14:18 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:18 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 4/7] dt-bindings: display: allwinner: Add DE33 planes
Date: Sat, 15 Nov 2025 15:13:44 +0100
Message-ID: <20251115141347.13087-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_061420_671772_5A74D654 
X-CRM114-Status: GOOD (  13.11  )
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

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
new file mode 100644
index 000000000000..801e5068a6b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H616 Display Engine 3.3 planes
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description: |
+  Display Engine 3.3 planes are independent of mixers, contrary to
+  previous generations of Display Engine. Planes can be assigned to
+  mixers independently and even dynamically during runtime.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun50i-h616-de33-planes
+
+  reg:
+    maxItems: 1
+
+  allwinner,plane-mapping:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of Display Engine clock node
+
+required:
+  - compatible
+  - reg
+  - allwinner,plane-mapping
+
+additionalProperties: false
+
+examples:
+  - |
+    planes: planes@100000 {
+        compatible = "allwinner,sun50i-h616-de33-planes";
+        reg = <0x100000 0x180000>;
+        allwinner,plane-mapping = <&display_clocks>;
+    };
+
+...
-- 
2.51.2


