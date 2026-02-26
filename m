Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF20FD8FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFga16pAfpv0gli5xDLk4KBBaOwrjAv2u5Qo96sb+dM=; b=1WxXppWYmpsizEaTj/NdJKYcSJ
	WkLRwZShZqk88hFHZKYgRZbGL/+vZu+LvRvkaSj0pK3X0Qv/4/vPTBJ051if4j0hQal4SyR7/YFtL
	qGthmhSOYIFMytcJuwJpElE/F3DhFn1usZpbyr5ZCVoPrUffnO4JLvJeSUVZAHUcok54pKkVSrMoM
	Y+WRtGt4+QyFYlmpdRpyHsfiqbxjRn0B6A3qjSy9NWu8OlZ8mE0Q3EkH8omVTPcI/5lEH6pO7Iln0
	TnaqBKxwx2n8EwlsPdOX5R4GU04mHsl1umvwPdNGiipIoETRCNLvuSQWS1P8PLBll2UWsC9MgkO9S
	HHgpKxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vve09-00000006hnE-1QiD;
	Thu, 26 Feb 2026 16:14:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vve05-00000006hkU-1g4c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 16:14:06 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2aae146b604so7757645ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 08:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772122444; x=1772727244; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFga16pAfpv0gli5xDLk4KBBaOwrjAv2u5Qo96sb+dM=;
        b=NVsCClLSziVRlNfxJXXIdjBzRrT670xtsRkm4NJVgk/9f2XBnaN7VXyhcyu/bG0QTS
         PPKWPi0qmFB1VAkkJuUVEgyoc1Zcq3DbkhxV75wvrYPAUCqN48fH1ogawt0K2S9pXyLv
         5PZ+LIajsZVbqEv06t47CYDUEtKYWAXuU8X2h9Phbzm1+x0lW8BjsblNMxE5b74usr20
         frnxp/Ba1HAsmgEM1Eyca5nx2H3bGX1s36LeUlwx5Ri6rNPZl+dUZOw/xCW9H5jVQ1u6
         GAieLyAf52++AXAir4eYW/5lQ67u5lCWQb61Mdw8/8EOYtKg5jlDu68Ox4jvpUOUBP1m
         1jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772122444; x=1772727244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EFga16pAfpv0gli5xDLk4KBBaOwrjAv2u5Qo96sb+dM=;
        b=K/AZxsVrjrjTA4g7kud5Uc0ecyAPj2/Q/kACbG6fyhg+fvDFENc8IxDnEfe2KXw2qX
         GD5MxrSMLgim3Y047DKTtaWm5aZbAx0yjeyWnpvuTZ249ceGd8VfcD9rGsKJA7v4hYCG
         1UY/LYXLd+VnfnkBBXm1N9wvAuacA9OYQfC0mXNWVV0a09iKAYxBZQFFVqcjVhbN++eb
         7oW8w+ATqgJihBZ1ukQ2mIptgOmCIoVZODagEFu0yz5HMdx2wMEe0SG6Nm0b6zxRy0D6
         YW3ADGdRSbifsHXlOKF7eEB4MhpY6sY7zikoDgAxKt6Ye4PxGiHdUO7+hBfv0tF6Mb8C
         iZow==
X-Forwarded-Encrypted: i=1; AJvYcCUuuslx1bVP7VW6gpKBrKyY2WfV+BZrtjoPOMD2CSZ8aaS9CGxBpLgH2KtFw0h3144GfszmPwHirjzDyQCHxXNh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7WybtE50xcqTRccpH6vfhUf0r5+DHeOVzFLOzl4s3Fj23z1/6
	hKX8Kbrxn/Q5L8hzCnSiOWqxPmqzhOzIZNvVrSZygRkKU+pNRXCpKS6uNpASww==
X-Gm-Gg: ATEYQzxVHnVSC5lz3O7CbR2kGMBT4+jK4btrSaLcoUMTzE3AGqObvC7o2tfeM08ZkA3
	nplSP5K0FmZbUd9j0U2agj5CfYqircwl8nHeH6K2EDwZEMe3Pw38sN/Ec3eliEjgM1rnhuwR1ec
	VDIehTFz1al+2wZGCdahQtK+uex9bZNOPasxuwSEnn9cALdSoF+9GpiocW1/anEVz4KcW9eq2CT
	luoE8YP9MNACOiPUkHGv1AyBPePkNrVYQrgW10mta3dZaEomDuzW3pYHubGc3mQx+nTMiZ9PXM5
	j31tVSa+ggMsdAKOZIw0Ny4eBbLNIw688sIDxfVjUpDm4ILB6gFSUlxDwvMdB4SKCAZpJWJ+/uA
	DVEoYm6MzloxXtSY4TXMLzzADRs8KoXQ45Vx/WaQyWa0AjaubmOaWLJWBAk/GysM0SdWcjA56nR
	0CQJ45FDcqSKJyky8V6d7aAxBPRRfM/VxigpV6hlUL1RqvUQPIswccw/vo
X-Received: by 2002:a17:903:1b4d:b0:29f:2f40:76c4 with SMTP id d9443c01a7336-2ad744e05demr198619235ad.34.1772122444511;
        Thu, 26 Feb 2026 08:14:04 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.183.54.8])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2adfb6a0432sm44384595ad.52.2026.02.26.08.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:14:03 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Thu, 26 Feb 2026 16:13:37 +0000
Subject: [PATCH v3 5/5] dt-bindings: arm: atmel,at91rm9200-sdramc: convert
 to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-arm-microchip-v3-5-0bda15abd922@gmail.com>
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
X-CRM114-CacheID: sfid-20260226_081405_458054_5F26E4B2 
X-CRM114-Status: GOOD (  14.52  )
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

Convert RAMC SDRAM/DDR controller binding to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 67 ++++++++++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt      | 20 -------
 2 files changed, 67 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml
new file mode 100644
index 000000000000..1516fc8e09e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/atmel,at91rm9200-sdramc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip (Atmel) SDRAM / DDR Controller (RAMC / DDRAMC / UDDRC)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
+
+description:
+  The SDRAM/DDR Controller (often called RAMC or DDRAMC) in various
+  Atmel/Microchip ARM9 and Cortex-A5/A7 SoCs  manages external
+  SDRAM / DDR memory. It is typically exposed as a syscon node for
+  register access from other drivers (e.g. for initialization or mode
+  configuration). No interrupts or clocks are usually required in the
+  binding.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: atmel,at91rm9200-sdramc
+          - const: syscon
+      - items:
+          - const: microchip,sama7d65-uddrc
+          - const: microchip,sama7g5-uddrc
+      - items:
+          enum:
+            - atmel,at91sam9260-sdramc
+            - atmel,at91sam9g45-ddramc
+            - atmel,sama5d3-ddramc
+            - microchip,sam9x60-ddramc
+            - microchip,sam9x7-ddramc
+            - microchip,sama7g5-uddrc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: ddrck
+      - const: mpddr
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/at91.h>
+    ramc@ffffe400 {
+        compatible = "atmel,at91sam9g45-ddramc";
+        reg = <0xffffe400 0x200>;
+        clocks = <&pmc PMC_TYPE_SYSTEM 2>;
+        clock-names = "ddrck";
+    };
+...
diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
deleted file mode 100644
index 14642384bc87..000000000000
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Atmel system registers
-
-RAMC SDRAM/DDR Controller required properties:
-- compatible: Should be "atmel,at91rm9200-sdramc", "syscon" or
-			"atmel,at91sam9260-sdramc" or
-			"atmel,at91sam9g45-ddramc" or
-			"atmel,sama5d3-ddramc" or
-			"microchip,sam9x60-ddramc" or
-			"microchip,sama7g5-uddrc" or
-			"microchip,sama7d65-uddrc", "microchip,sama7g5-uddrc" or
-			"microchip,sam9x7-ddramc", "atmel,sama5d3-ddramc".
-- reg: Should contain registers location and length
-
-Examples:
-
-	ramc0: ramc@ffffe800 {
-		compatible = "atmel,at91sam9g45-ddramc";
-		reg = <0xffffe800 0x200>;
-	};
-

-- 
2.43.0


