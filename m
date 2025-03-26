Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6B7C36012
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8KBeY+WG2SeCKTmJwKN1zPIAY+YJUVXltkxaxf+9+4=; b=pvFK1Kz3n1h5ea1/CHy2sAbd48
	qC3utOHm66B5rxzO6V2fvsavOHp0Hkpz9eVzhQFfyvcVlh3L1Zvukga2eVggh6v2GO3DYVd9Mq+iO
	ORl0Byz3nJIo+0SweADQcw1BQ6pQ8K13iyuJZz7l7RobobjrV41oDcQo9Z4hl2wECAxRVOcIPrbJu
	ng1nH1+T1tLBZGI0ZTClhbia4r7tB3rtl6/315Z4pqRMPWFea4rh+2dq+m2upW6/Ylu0NJWRPhc56
	sFqC+1sMuARLobzgbg3JVnaaMBMZ/whJbnase9w6yUD8/YVWQaHqdLw687+KR6diQ/8z37gYJekdo
	aUfVALtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTD1-00000008wMK-1eNI;
	Wed, 26 Mar 2025 16:02:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSnz-00000008sev-29v0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 15:36:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1743003395; x=1774539395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=szVEnhvPvUBlfCtyjfvV2jfNXNmn2KFpzc9sZGjFHCQ=;
  b=Q73lDjvp2lr5n41B5Rbu2r0wiokWPSloan6XjJwZVfxyjQwLDm3dWTjC
   EYnjsFt5abU4GVJJaRmMw1Vcf1PAKWgoPC/TYRY6JQzdDFxyrGacognl3
   mUv+gXP+AuuHoTvT1MVandO+fGKyG5/Z9urFMyetS0ftpZfe3n9vbG9Jc
   TUEnRKsF1XXhYyXxq4fBmnfZ/RyexKxi09gzDnANT7RqSQYdX5Vt1RkVD
   2g21s3nKn9umosdGKKTuCGPxqjThN0B5ph2XgEu8JTaTY3Wz8SJFLk6i0
   ZrjehWMMhc/yt1vbt9FlrxLbpOVlM2PWobN4W5RhvYHVl/L/8Oz9RwHvB
   Q==;
X-CSE-ConnectionGUID: NRxSiTFnT3ucBnaYj7CaZg==
X-CSE-MsgGUID: nc1Hn/qqQNGMW2FQWcbFQQ==
X-IronPort-AV: E=Sophos;i="6.14,278,1736838000"; 
   d="scan'208";a="44096107"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Mar 2025 08:36:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 08:35:51 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 08:35:51 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>, <sre@kernel.org>,
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v4 07/11] dt-bindings: mfd: syscon: atmel,sama5d2-secumod: convert to yaml
Date: Wed, 26 Mar 2025 08:35:40 -0700
Message-ID: <271b23440f79bfad3e902689a9f4b240ab43eb28.1742936082.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742936082.git.Ryan.Wanner@microchip.com>
References: <cover.1742936082.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_083635_562536_4A184759 
X-CRM114-Status: GOOD (  14.82  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Convert Microchip AT91 secumod to YAML format.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../bindings/arm/atmel,sama5d2-secumod.yaml   | 48 +++++++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt | 25 ----------
 2 files changed, 48 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml

diff --git a/Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml b/Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml
new file mode 100644
index 000000000000..6edeb320220f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/atmel,sama5d2-secumod.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip AT91 Security Module (SECUMOD)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+
+description:
+  The Security Module also offers the PIOBU pins which can be used as GPIO pins.
+  Note that they maintain their voltage during Backup/Self-refresh.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: atmel,sama5d2-secumod
+          - const: syscon
+      - items:
+          - enum:
+              - microchip,sama7g5-secumod
+          - const: atmel,sama5d2-secumod
+          - const: syscon
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    secumod@fc040000 {
+      compatible = "atmel,sama5d2-secumod", "syscon";
+      reg = <0xfc040000 0x100>;
+      gpio-controller;
+      #gpio-cells = <2>;
+    };
diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index d3821f651e72..5ce54f9befe6 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -46,28 +46,3 @@ Examples:
 		reg = <0xffffe800 0x200>;
 	};
 
-Security Module (SECUMOD)
-
-The Security Module macrocell provides all necessary secure functions to avoid
-voltage, temperature, frequency and mechanical attacks on the chip. It also
-embeds secure memories that can be scrambled.
-
-The Security Module also offers the PIOBU pins which can be used as GPIO pins.
-Note that they maintain their voltage during Backup/Self-refresh.
-
-required properties:
-- compatible: Should be "atmel,<chip>-secumod", "syscon".
-  <chip> can be "sama5d2".
-- reg: Should contain registers location and length
-- gpio-controller:	Marks the port as GPIO controller.
-- #gpio-cells:		There are 2. The pin number is the
-			first, the second represents additional
-			parameters such as GPIO_ACTIVE_HIGH/LOW.
-
-
-	secumod@fc040000 {
-		compatible = "atmel,sama5d2-secumod", "syscon";
-		reg = <0xfc040000 0x100>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-- 
2.43.0


