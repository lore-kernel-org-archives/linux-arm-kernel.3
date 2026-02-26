Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4654FD8FD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 16:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSWTbNL/6QdNnBgGRc4rlVRWsEK1pvjK/NfqqE+tJ94=; b=gZmnNwOUQuD2w2NINcpW6tLFjx
	s0+HBukVDmGA8X11jKbH9quVtND0ZV94I1wMVc+Dp+Ot7yrQ6dQP0CJ0k2BKs5CmPBkqD4ZCyrZR6
	QlXY8STjPpqh3JMPCDkos8vdX0Kkw4aC70jPekIWouOpgsE3U/5H+VZ9QD+s3z9eRMI1Vz0fDQVqq
	wbOI49dK2JINpKpTC1TKaJLp74vpa13j4/U4tlq8uTd+fMw6mpRAKCbVud+BHadnQisQQom+KonNL
	IMDn3cigXLvwWAIz91GZUbGKnKfRdO6KdmryHEteAjdUn3kT+mihtMKfXwJ74jmaHeP+wdJVmi6HF
	HaL81l/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vve01-00000006hhO-31En;
	Thu, 26 Feb 2026 16:14:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vve00-00000006hfw-46wh
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 16:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YSWTbNL/6QdNnBgGRc4rlVRWsEK1pvjK/NfqqE+tJ94=; b=fkVtdscgyFXyYPCzHG5kpFKmB0
	K7AKTPCEMGn5Byk25KDQUnEZ4dxvF5v89Cikrf3TyI67oRJEJa9hKBShZFI+LExE/DaDBVw3TUDox
	9fd0r1F4ZtnDdnYFz1Y7e0vVpVlCw5vIaUprYdToPK73NjnSEA127fxXB5/3VmdtHrMnD2LVzPPhO
	bP8YqsgLSQTIPw8z7XnmuzkTloWvUcxw3FQJxMc4hweFlwH/IPaJDNiTwP4EgmT9WgpYSpeIFdmuf
	y6F1MfeyRpjjrWrB2QBW2JQpFvslNLZgR3fzgNS5chlmnaIQwUiwP1tIaEMgBCpS9arHDXQ9ZQdI6
	yNDz3f4Q==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdzx-0000000BRfr-3ozG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 16:13:59 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ade574f05eso7160885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 08:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772122436; x=1772727236; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSWTbNL/6QdNnBgGRc4rlVRWsEK1pvjK/NfqqE+tJ94=;
        b=BFhQ1hndeHhQ0isBWG/Sw0EtvgdtrrrgOuyUs9yaXIiQfBj9UAdjyqh5+B2P2YCz3i
         /hkp7bR23lsFGd+sCfcPmFWPaBnMU4Fy2KHcMH7YL3OMbmYi0hdnlWIDwC9jYZSCVmL3
         lYyGlBddIEIIofOY14qxEg5u84E6bn16TvR3YzkBYuGndSH4eDtmxfu5p15w/agWUuX0
         MDZq+1H1Uk2U0wOndaoPNsq4ff1xO29hVaODut90yDnxA9J2atpV/Ewvn7FfVrr5sznP
         ayHTgaOyzPoLhd4IFXHeIltn1m+2wRJIbjJ8TPuIHforoZsJrdDumGH2pUez7oggh6/t
         N4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772122436; x=1772727236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YSWTbNL/6QdNnBgGRc4rlVRWsEK1pvjK/NfqqE+tJ94=;
        b=XfSvJwQ9B8Dim9TPY2WaAUcbc0mFfM+ibZtjC3ncAwN9T3NoPucEQOqxFnXGwAPluL
         ogBDYNCycCPvskaTFWd9+iTjKOg+M+yz+AZidZF6q9kXUdcxzsJcW1yj+SWhig35U7I9
         KgKn14VBot5RZYy1aep0U7/mq+J47/x17E7y78Mzz6iAiJTy2whLEidKavpW5je+obob
         0q2d5tGZDvafpf8Q2gz03CG0bXu+tbJsLItyWedqezAgMU8b5UeUvxisqTmYiz3b6OeI
         xrdHMwH9MgsI1O6ncTGzgm++3rNo8nGwG/ZKVvS/KsfOhHPpzhDz8a8GZ1ymBuQ05WeE
         SyPw==
X-Forwarded-Encrypted: i=1; AJvYcCVrDCpdT08cu0KtbtOjfzQCjVoPRz2shPaUzjKh0MFGoduWOAXY1/FbmhsiFPVwxk718GA7zAMZPX/lBZBJkh72@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4je6VlSzfXSeUbpAUyP1EvXWWw6eFDnh4HRb0HUijbsHF6A5N
	oqgDgQdYij0x0cUioRLwsUCBSuVQoikzROHBDh0GAZ1RG+Rqk5/Do7RQ
X-Gm-Gg: ATEYQzyaOX6lkdEB9ka2jdGBLGkJe5NnsS0e2MtYZF+n+LF3xqEXiMw6jsN9VJJH7Vt
	wQJV4ustUit25/p3VrT8tpR7VNpePJ/QRBWCSUr+HU2R0DXjGcQuLxkHrWrLL0PX/M7P2sCX0R5
	YXLG9ZJNiDo/GSiykm4fbaQG6gIWbuJfMI2EKgFQFeHINfupjkXy1vud35jf44vPD50CZaE5cuh
	OhNHsmHapm9KnFHSZI7Z37KXk2LRissscKJgZ7/Ymp5TJ5/0SiajfZtyaNfsTA8/87QWcH7BadR
	XXAQiK2YA6DhDRah0AGjPFRk++bypnwqhUEVUgxLXwfx85JaqYmr7tUc+U9yHvJNpdVuiGxB9uR
	cKxkITKKqqTklqNlKnbeFzmCiKevmaAe4jwU2SIvWa49I5WaqWzUlDdXPc11pX6gU3zPdhZEwJA
	3alio06tCUQqLdHL9f6s+ptKSNMTVMi+X0QyKBvLsdx/ZYdQ==
X-Received: by 2002:a17:902:ef0b:b0:2a9:47ff:101c with SMTP id d9443c01a7336-2ae035bd264mr29398815ad.46.1772122435459;
        Thu, 26 Feb 2026 08:13:55 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.183.54.8])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2adfb6a0432sm44384595ad.52.2026.02.26.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:13:54 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Thu, 26 Feb 2026 16:13:35 +0000
Subject: [PATCH v3 3/5] dt-bindings: arm: microchip,sam9x60-pit64b :
 convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-arm-microchip-v3-3-0bda15abd922@gmail.com>
References: <20260226-arm-microchip-v3-0-0bda15abd922@gmail.com>
In-Reply-To: <20260226-arm-microchip-v3-0-0bda15abd922@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_161358_040447_3A5FAF51 
X-CRM114-Status: GOOD (  15.36  )
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
 .../devicetree/bindings/arm/atmel-sysregs.txt      |  8 ---
 .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 68 ++++++++++++++++++++++
 2 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index 70059f66f2b4..d0561f7f465c 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -1,13 +1,5 @@
 Atmel system registers
 
-PIT64B Timer required properties:
-- compatible: Should be "microchip,sam9x60-pit64b" or
-			"microchip,sam9x7-pit64b", "microchip,sam9x60-pit64b"
-			"microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt for PIT64B timer
-- clocks: Should contain the available clock sources for PIT64B timer.
-
 System Timer (ST) required properties:
 - compatible: Should be "atmel,at91rm9200-st", "syscon", "simple-mfd"
 - reg: Should contain registers location and length
diff --git a/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
new file mode 100644
index 000000000000..f00ac7e858d9
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
+  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
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


