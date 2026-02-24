Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A98F3C985
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jm37TMqkBTkqNVXnN3xF7Pp+crAd08HrPHesCUh8FlI=; b=Zo0qhByfQYHdNCGeF/CbfzCBkt
	eGgIUkymMHLQStoZ8nkY5FQ7W3ZjEFPxQvDoPDfApLXw4KNgaOMzAT4ol4T4StLV+MzD0BQqs3hk5
	nZ87d0m0erdMI0j+rrCMik4KQrIdRsjnSfaV5mnXMf3A/+Tw7c2SfVmeLBLb7IJ3hlN29vg0VYJHv
	qtoQLt2UatQvMutbMmYWJto6p/QU/xbtMFuWleNoE1EdSqH4aNhaHkQwGAnF+ywK/blpehKjM9GQw
	jYg83ZWmZT9VtzoLgwgYJhfE54MJbydiSc4LegAqWnC8u8+OGR4V6g6voZF+e18XA3HOKWdFxukMC
	jWqIlPng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutgx-00000002GKB-362A;
	Tue, 24 Feb 2026 14:47:15 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutgu-00000002GIk-2kv8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:47:14 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8230c2d3128so2352263b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 06:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771944432; x=1772549232; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jm37TMqkBTkqNVXnN3xF7Pp+crAd08HrPHesCUh8FlI=;
        b=MI9ppA26/IEjpFCp2t8jdI7ECylX5z+jMUDKSEg6EJbuxA2WUw+lNFaxfIEDTtvzJ3
         m8g4ZlnpuWpWQGr6iy5K+40ph+6PTo+QLQuRQ0TkVwonhxyLmBI8RTTnje7fms3kMDh5
         SUi6p7w+GZdn+GoB1IhUv2UinOaWgvpzXObxnH7/N2W8OlnBRnUGL4L4CmXshWl3RKHh
         TivaK2g51QT8pODinmoVMGZgvTO+UAlAtTfmMDy3BiTmQwjI24s/jCWE8Pk49Dc76qnm
         0TUU0WnxaPjAiISTcwdvkkrpXrapnO7Eg50zyHe5bdjyPm7hhAkkoPJqR9rf5mxWdWBe
         G9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944432; x=1772549232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jm37TMqkBTkqNVXnN3xF7Pp+crAd08HrPHesCUh8FlI=;
        b=PJWHzH86Is6Ak/2hdtM42s7+oAtqj52ZpodeNxrF75izLFrtkx6ePI8Xv54+lE4mVY
         AD5Usc016C1N55nj9r65I+BF8g+wOl81/DKZUUSG5J/KF7cDeSwZvGgl6upWEKc+yXeQ
         r/AXewUxaEvxCmFiocBWfVAhh66v9ZDnLi0hnh44yZdTOw85O4X53A+C6AqW8zf3BGYZ
         InoPxPBOjX+97ZU9DpYw1FwHAFgSf2b0YGfUP3lWABx2bTwS2OnJsW0KC3JG4tFbTcZv
         7mzLaFBqy6cTh2lY1jUr4s0ZkLAUYZRouVDyeEU+te4DXosTdm0IEnnkcxFZwmtUozLn
         LXnA==
X-Forwarded-Encrypted: i=1; AJvYcCWtGBTyNEpVXGhOB3LM1DOy0J9dbIgwCdsOT/teGSkb/UrZAPKh+0ypzyGGtm29SZ3vGodHHyEtlwnP/jqpbmhW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5mcE2gk0Wp7AEkh9uDZEGLtRV82khgnLkYr2FUnJwu77IxOSi
	39m81N7zirqPgmbvDc+cx0uwLjlNzMCoGEqIeeK2crTIvkeVBLF8q2Ye
X-Gm-Gg: AZuq6aIqN3G6+vBzRO3AyAmM9KJLeCHEAISUTiPO+q3PDmckMI7FxlTUuiSoZCWm/lB
	QvMRkfBHm3Ka6Ur8aU9W9v9j4KkxGLMnmExXF80M18Cu/8lqmsS2MJiMcj4iD0XfZvhUrGoiF4y
	owDAEmNgyS8gMwMLRLOwhJJpK/p8chXp59Hn1xKTAGQrMt1oUWB5TIdxqhEyYmSSsfSH86OI4ml
	RWv3Ad5kWm8O6B07MCyFoGKoWCEHa3GCm9BtrzVbXjQ7UYyFwzXPrp1gjbhFUed0zUfQooAa6UR
	YYB7IPd6c1tTUHAq42IXUfY+PZikxmEPURnW1N4iNqXWWV8UzDkh1Lm0628Pt0Gvbb1EsvyH+Xd
	b2zUVt7FRpf+YEpP78nipVCKrrJNGxD7pB7LkTN0KBUjmDASU8t8ADTfiScmzmc3bix9G8TFqL8
	APmHvT/ZsstXune+3Lt5cyz7OPbl5QBgK+qwHTeHG9XX1NYKrQ
X-Received: by 2002:a05:6a21:16:b0:394:36ae:b91e with SMTP id adf61e73a8af0-39545e50b26mr10740461637.5.1771944431599;
        Tue, 24 Feb 2026 06:47:11 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.64.105])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-826dd64367bsm11149895b3a.4.2026.02.24.06.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:47:11 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Tue, 24 Feb 2026 14:46:48 +0000
Subject: [PATCH v2 3/5] dt-bindings: arm: microchip,sam9x60-pit64b :
 convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-arm-microchip-v2-3-8bedacd2cdcb@gmail.com>
References: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
In-Reply-To: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu@tuxon.dev>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_064712_708728_CC56FA25 
X-CRM114-Status: GOOD (  13.12  )
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

Convert Atmel Periodic interval timer of 64bit (PIT64b) binding to YAML
format.
Changes during conversion:
- Add missing compatible "microchip,sama7g5-pit64b" along with a fallback
compatible "microchip,sam9x60-pit64b".

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
new file mode 100644
index 000000000000..cbc0a999748a
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/microchip,sam9x60-pit64b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIT64B 64-bit Periodic Interval Timer
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Claudiu Beznea <claudiu@tuxon.dev>
+
+description:
+  The Microchip PIT64B is a 64-bit periodic interval timer used in
+  several modern Microchip ARM SoCs including SAM9X60, SAM9X7 and
+  SAMA7D65 families. It provides extended timing range, flexible
+  clock selection and supports both periodic and one-shot interrupt
+  generation modes.
+
+properties:
+  compatible:
+    oneOf:
+      - const: microchip,sam9x60-pit64b
+      - items:
+          - enum:
+              - microchip,sama7d65-pit64b
+              - microchip,sama7g5-pit64b
+              - microchip,sam9x7-pit64b
+          - const: microchip,sam9x60-pit64b
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - pclk
+        - gclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    timer@f0028000 {
+        compatible = "microchip,sama7g5-pit64b", "microchip,sam9x60-pit64b";
+        reg = <0xf0028000 0x100>;
+        interrupts = <37 IRQ_TYPE_LEVEL_HIGH 7>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 37>, <&pmc PMC_TYPE_GCK 37>;
+        clock-names = "pclk", "gclk";
+    };
+...

-- 
2.43.0


