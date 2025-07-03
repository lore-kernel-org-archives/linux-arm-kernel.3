Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DA0C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lnk4S/ZRBOAWFeTLBV16c83HbawKBbnUkwVc1Pl3Jgw=; b=mupaf4fFqtqWgE8q2qgErM2x9a
	WgCGk3KpgbM9Iyyv6JeL1B7RR0fVga94FbzuWxZO8S6XNvROlq2wmO8/D0jqASruixWv5R9BmFdRK
	uAzKXYEK1T0mUCvnOi/ZftzweVFTz7TSlAQAOYhJFMNmlQWp0eEnVjSwPB1p0/fluADVFi/RZ9K5J
	/9R9nR8X6cruDjRVAbGP3nrYM36H7Zd0OPxF2CIQi40Rulknbx8T3EtpzkRG9l7Umz5+cjoFMQk7Q
	h1TtH1cI/T4306l46vCmjvDXvGBBE2Wj+suhONjkhXlY97AMA1PjFJGBP9A1sARlsH4n3EILXVMJs
	fQ/YuZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzY-0000000CTGN-0PYy;
	Thu, 03 Jul 2025 20:57:12 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLcC-0000000BmI2-2mtS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:12:45 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-555024588a8so36090e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555563; x=1752160363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lnk4S/ZRBOAWFeTLBV16c83HbawKBbnUkwVc1Pl3Jgw=;
        b=A24w0+oMntBHkMlpwc6SFnPlmm3UHmXI1tx0i2x2r2raopvZg/83qPiRHFpW3iEkYT
         T6PXvXe7xYRsBkUlQ/DANkJFsn5hbb2cdqezy2vqPGEJGZBFIYtdEhGK+NFrFlVd4Ae2
         JWpWegoR3NUi6XtbQ8wuQhca7Y8QMfidyGrRqLpvY2mw6dQxsg9RpNzXaM5UxwdNqaiv
         K9cXJvi6/mXA7bQPB+vZACaG0Evz4St8LAPbllbKW9rI8ALusjq5OdOJCtixn29kGyzt
         jRTkHb/DLu2hhsO/3lWi0+Ckn9KXAEbgf/XFs3m6WAc6MG0sgoJ5//VOEbMNIbxO2JqR
         rrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555563; x=1752160363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lnk4S/ZRBOAWFeTLBV16c83HbawKBbnUkwVc1Pl3Jgw=;
        b=jOcS6BlDgj6k1EZRB+e72z1WKRBOU8yuBfXq6XusX+oYpGPwcBViQ5fjzFMywrzsyH
         YiT2ZNrH/xmG/nQ3YuGihr9EkhzPihwcT6mK79P31G1D72MMyDW8zEBA22CitGsuA8ag
         bOA3196xfnoiSxuubKNfiCoUzqW2M+/7DVWp0M0pVcll4UVX9k2hau66cF/PukVIxBWo
         1WZh3Azp4mgBCUMy4B6cw87BY+s0EFRyhcGvZ1SHSQUK5DYssIC2xZXqQHlHRrw1p6Ac
         H9C2UaOKhjjFBFaNPBgO3pvfHykh6pc0zp3awqU+sbcPj5TTl1amYZWSkRREmbhLLpkR
         Fqzg==
X-Forwarded-Encrypted: i=1; AJvYcCUPl/5B7r4xOlVIfL2paza0UiXpeaFCqO+U0ydRzufHDoRSTQBhdeNhLFRmq8YE8tORAjd7EtYd9jEkhr9FRyQY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4xW1VuXbaRKR92/J3c+7m/OFXWFBl9wgp5FG/uvYCwVRxMpjh
	gaufOyd8vmvNnxQNniLXi3BZkpqwHnvfJfAoBI2GV/kuz+6HkEziYgXK
X-Gm-Gg: ASbGncuvQx+shyiaY4bMOjUT9pBt0ef2DOWBMzAma6OwCBrdK/P6J07qq0Gunldi7qb
	iAYMqNqBW0MaiQOiGPExaGoU7A27hOAil66t9f3vEDbKlY0XXGn6XjCLs1o/hKAwrOJ2uV14FxC
	+TV9ZET5Qxs16uj47Fp8DpgTXpLHF0qFWdZvmoOh4i9LSwoIoDRRdWgglhe8wguWj68oUSGTMMw
	AZR80mUvtlFN95iDZKuGmtcyraa2zqjnVx2mp3NsW/NHtBWk1PhVixkcdICsRosuBYFTpeq9Rmb
	x47PrwSr2FAP0hVePmxkib5cxilqhJn1ztKZz36rxMnRadsQQDd1qu6TujooXEwDe6gC7sg=
X-Google-Smtp-Source: AGHT+IE4N9EPjYoVrJU71eRGRvfZjYij50QTT9ow8waF9KaIqcuDsIxMjitoZssy/2WBO9PRt9Qedg==
X-Received: by 2002:a05:6512:3d89:b0:553:2bf7:77ac with SMTP id 2adb3069b0e04-5562837286fmr2805513e87.41.1751555562586;
        Thu, 03 Jul 2025 08:12:42 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm725e87.178.2025.07.03.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:12:42 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 2/8] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
Date: Thu,  3 Jul 2025 23:11:26 +0800
Message-ID: <20250703151132.2642378-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703151132.2642378-1-iuncuim@gmail.com>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_081244_706173_AA02F740 
X-CRM114-Status: GOOD (  13.55  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Add a binding for D1/T113s thermal sensor controller. Add dt-bindings
description of the thermal sensors in the A523 processor.
The controllers require activation of the additional frequency of the
associated gpadc controller, so a new clock property has been added.

The calibration data is split into two cells that are in different areas
of nvmem. Both controllers require access to both memory cell, so a new
property nvmem-cells has been added. To maintain backward compatibility,
the name of the old cell remains the same and the new nvmem-cell-names is
called calibration-second-part

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 49 +++++++++++++++++--
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689f6..80657435a 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -24,18 +24,22 @@ properties:
       - allwinner,sun50i-h5-ths
       - allwinner,sun50i-h6-ths
       - allwinner,sun50i-h616-ths
+      - allwinner,sun55i-a523-ths0
+      - allwinner,sun55i-a523-ths1
 
   clocks:
     minItems: 1
     items:
       - description: Bus Clock
       - description: Module Clock
+      - description: GPADC Clock
 
   clock-names:
     minItems: 1
     items:
       - const: bus
       - const: mod
+      - const: gpadc
 
   reg:
     maxItems: 1
@@ -47,11 +51,16 @@ properties:
     maxItems: 1
 
   nvmem-cells:
-    maxItems: 1
-    description: Calibration data for thermal sensors
+    minItems: 1
+    items:
+      - description: Calibration data for thermal sensors
+      - description: Additional cell in case of separate calibration data
 
   nvmem-cell-names:
-    const: calibration
+    minItems: 1
+    items:
+      - const: calibration
+      - const: calibration-second-part
 
   allwinner,sram:
     maxItems: 1
@@ -107,6 +116,7 @@ allOf:
             enum:
               - allwinner,sun8i-h3-ths
               - allwinner,sun20i-d1-ths
+              - allwinner,sun55i-a523-ths0
 
     then:
       properties:
@@ -132,6 +142,26 @@ allOf:
         - clock-names
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun55i-a523-ths0
+              - allwinner,sun55i-a523-ths1
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          items:
+            - const: bus
+            - const: gpadc
+        nvmem-cells:
+          minItems: 2
+        nvmem-cell-names:
+          minItems: 2
+
 required:
   - compatible
   - reg
@@ -176,4 +206,17 @@ examples:
         #thermal-sensor-cells = <1>;
     };
 
+  - |
+    thermal-sensor@2009400 {
+      compatible = "allwinner,sun55i-a523-ths1";
+      reg = <0x02009400 0x400>;
+      interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC1>;
+      clock-names = "bus", "gpadc";
+      resets = <&ccu RST_BUS_THS>;
+      nvmem-cells = <&ths_calibration0>, <&ths_calibration1>;
+      nvmem-cell-names = "calibration",
+             "calibration-second-part";
+      #thermal-sensor-cells = <1>;
+    };
 ...
-- 
2.49.0


