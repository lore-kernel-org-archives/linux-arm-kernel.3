Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83315FED2C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 04:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWRAHJ63jshBD/FoDm7gshmnJRJzBxVaKbd/5HvbctQ=; b=HZBkXIpcRuuRMGgBdoqSftwDIn
	G+zoMme3t4fiNqhF7q5VtTspw9f75WPKIlHDgG3w2qvnURTBIV3dM1peJXTxU54uS4bBZT6C6Eg64
	IlP/pmMgBui/C0oQgIT6ujYkL+xhLWMbqrymZVlpTnbMUc/EIfr2Lp+p/lZeCq/AwJ/zdxbhl8C5Q
	6qcYVE7NL1ib1lb4u24m0pmbjRz01QxJHl6neM1P1jFUCJZVmVeHmQwfBrxcJgdvVpC/UFGOnBhBz
	hWwrwGM5qQ3g9IXZ11KoyKhUlAQaM4Cw/9lQDReHgzkFUGv14y/wCxzJ1vlCaIrEWX9AMjg72lQUg
	lfhBnS/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XYs-0000000DFZf-1fdb;
	Thu, 12 Mar 2026 04:22:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XYg-0000000DFSC-2N3r;
	Thu, 12 Mar 2026 04:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773289320; x=1804825320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3wHXxRZW+3pyAHHF5bwYh0JQE5H6TZmyeNQhJB8UKIQ=;
  b=Pk3PYjwkURtFENqasa0SC9hDP+gS/A6x3Kc7BGFa3jCUBdUSag111iRN
   2UMDGe+kGw95aRNxGx7vHYlKLmThY9iVKHmIl3kXPoH3c3pm4va7BS2Nw
   1lWWAfCQBcUPKpJeQu0YmouexkwB9A0SMuYUj+AvvFrT5hnAHqcTh0EOl
   TLb0dZ6M/dKDCftv0OIM4j1HpJK6xeSDY9rTqpe50n6LBsP3zYXy6MrIt
   L0yLBqkGu/iH+N8K2WNoGXWDEk2PZ3AfW5zvKFiNHxaN+uua+iDvzBcuq
   Oyzl/XdwFGJkPrQNJ4QpX09wlSMAF/U872PmtWNhvnvJNHyhijmJcMLQM
   g==;
X-CSE-ConnectionGUID: NZXECXbnSTC3akxw2a7kVQ==
X-CSE-MsgGUID: n2UhO/M+TAONHhHV7VTwtw==
X-IronPort-AV: E=Sophos;i="6.23,115,1770620400"; 
   d="scan'208";a="62128084"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 21:21:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 11 Mar 2026 21:21:20 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Mar 2026 21:21:11 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <ardb@kernel.org>,
	<ebiggers@google.com>, <martin.petersen@oracle.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <kees@kernel.org>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v3 1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
Date: Thu, 12 Mar 2026 09:50:52 +0530
Message-ID: <20260312042056.309237-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260312042056.309237-1-manikandan.m@microchip.com>
References: <20260312042056.309237-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_212202_622055_B27DB4E0 
X-CRM114-Status: UNSURE (   9.38  )
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
 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
index 39bb1a1784c9..db659388a27d 100644
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
 
@@ -28,7 +25,9 @@ description: |
 
 properties:
   compatible:
-    const: mipi-i3c-hci
+    enum:
+      - mipi-i3c-hci
+      - microchip,sama7d65-i3c-hci
   reg:
     maxItems: 1
   interrupts:
@@ -39,6 +38,21 @@ required:
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
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+      required:
+        - clocks
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1


