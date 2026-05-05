Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBD2CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 07:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cv0e0ZcxFbihKX6j7j3gA25i1pz+rrg2uYk6pO36i4E=; b=dt3fcJz167BLiJ47jBmUnE1GMV
	lkiBYejGQfQdZT4PDhoDynhBqtr/3RGhEYSAEMKIt7fqeGgDZtMCtnXcQt3eS+zy2tP8b4WmPqM4f
	4W8mEAliD5Q5X0hIYYAP3plDgL6ICPHH35q8cUyZ0saPRDPvYtZ2Dk9OUTL56ATGWdqL9bWBISxYO
	FkdTs0oyrQpmJC907fnItFn+pLnKCcBvkZYDzxkqpKs5HcHaOgVI0qHKzBivy13IsSWkCT436rpUf
	M1VZWj2PMcG0lZ//zU8XehR8ksD4/jAnxAi1osdIKdHn/5FYN3iQtM8MtMvx1bBdE8Knfh9JBDYbQ
	1ppoJbZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9yb-0000000FMwz-3WVP;
	Tue, 05 May 2026 07:13:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9yZ-0000000FMvv-41ME;
	Tue, 05 May 2026 07:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777965231; x=1809501231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wb9iATfXW8/7d/+1AO6j/ytPYVfI1bbWli+zPTIAHOo=;
  b=rAccC1e+o/hEX3gKm9K0yQSH0oR2DsgBHfGqXbq7vaRm3dGpjtBkTOvL
   seLomHMfiafMWrBIQb8DZA6yJqA0J3lUK6VxLzeQ5swV3vvp5YgbCZSp4
   rEyYMZ48fbTxB1keRtvbAwithwRuof6isVM5uVrO3GPiBAsFzG3gcL8X/
   6He8Ig+bdvTjXnREupo2p8vJ+kgJZdzck+2z+Az2QClF2tFpFSQFbte8M
   DFwpKphI0c9W9jJRQH1NKwBy24f8OSsxAiEGjvqy2MAn73NiiTK11LEKh
   vzdjlrPKu47lnKvM8mB6yK/ABxRvJXBEPi1cTGC6q/ShTVbwry9rBOYSg
   g==;
X-CSE-ConnectionGUID: KCFYOMZvRKygeX0nADignw==
X-CSE-MsgGUID: 2FbC94D9Si+NVQDEp7pSVw==
X-IronPort-AV: E=Sophos;i="6.23,217,1770620400"; 
   d="scan'208";a="56268024"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 00:13:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 5 May 2026 00:13:50 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 5 May 2026 00:13:42 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <Ryan.Wanner@microchip.com>,
	<tytso@mit.edu>, <romain.sioen@microchip.com>,
	<aubin.constans@microchip.com>, <cristian.birsan@microchip.com>,
	<adrian.hunter@intel.com>, <jarkko.nikula@linux.intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v5 1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
Date: Tue, 5 May 2026 12:43:23 +0530
Message-ID: <20260505071327.125787-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260505071327.125787-1-manikandan.m@microchip.com>
References: <20260505071327.125787-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_001352_062028_E92BEA4C 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

Add the microchip,sama7d65-i3c-hci compatible string to the MIPI I3C
HCI binding. The Microchip SAMA7D65 I3C controller is based on the
MIPI HCI specification but requires two clocks, so add a conditional
constraint when this compatible is present.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v5:
- drop min/maxItems around clock
- use else clause
- cosmetic fixes

Changes in v4:
- Define and describe the clock in the top-level properties
---
 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
index 39bb1a1784c9..d488fb420945 100644
--- a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
+++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
@@ -9,9 +9,6 @@ title: MIPI I3C HCI
 maintainers:
   - Nicolas Pitre <npitre@baylibre.com>
 
-allOf:
-  - $ref: /schemas/i3c/i3c.yaml#
-
 description: |
   MIPI I3C Host Controller Interface
 
@@ -28,9 +25,17 @@ description: |
 
 properties:
   compatible:
-    const: mipi-i3c-hci
+    enum:
+      - mipi-i3c-hci
+      - microchip,sama7d65-i3c-hci
   reg:
     maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral bus clock
+      - description: System Generic clock
+
   interrupts:
     maxItems: 1
 
@@ -39,6 +44,20 @@ required:
   - reg
   - interrupts
 
+allOf:
+  - $ref: /schemas/i3c/i3c.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,sama7d65-i3c-hci
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1


