Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6258ACAC59D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 19:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhXb/2uPDctybQp69raLE07PDirXc34/qERwJKOUJ64=; b=aMA4ouB+LOCivcU8gnTp0fCHc6
	aYfAWSkA/cpWEvwc+V6JZavXKCAjyT6ffh2oVFJHLSiTH7nyP3sW+zf+OZ3JI5zLqBBoMFkiK8/Ro
	k77mSpdBIk7MlCJ9PxMl1+Q1+zhaWOXF8bEk31q5E8hdE/276rJGIDaiEQrYbZIxUG6JnwLNqNv14
	0zO84Dt/GR1GzfD4GHmJUqjz2x6nzpbyyAvORD3pfFb9znhF/QY361E0cpjqlOl5qajgvoYlotZX6
	wxc2GgEM0Km7ui8J+yY9RGM+dQHP0p8b5HwSRP92CseXJ2vx/e/exdlO+yYq/qmjb0QoyXn1K+P4f
	9VTZk0gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybhY-00000008tdm-1mDO;
	Tue, 16 Sep 2025 19:50:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybhT-00000008tc3-3Ylm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 19:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758052251; x=1789588251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WYEakKaGIgOHZEwp+8RyHz2DG4XYM1t05a+iyML1wAk=;
  b=Jmc9YdyTY/vx7rPTAZhaqt39jwdW3KJMBbQMaadm/c9hiR36NKqUCO85
   AnQcS321VLoNJK2pMM6L73C22L5PU3mGnkeAmjXKNXFQ8dVQcGL899+Ct
   Y3MrOFQT4f3x9mn54GZHChH2W/76UXwqOOoeVQId7J2ePDF4XgBMWMynD
   83Kt7sL9OonCJTF5ZTcNRnfuqYB2cA+Iaj7qLmSSt7rCeA2rP8+pf24dC
   WU7YTxQ/+DQaEFr/VyfQAhuPbSPltO9fRFA1t/8bHNzEYjd/R9gmjC5Gd
   9Lj9EF81oqV4pFOs66Ja/u6Yo/FlsESwTYlzaJIoCLnCb9nVsvNq6ke3p
   Q==;
X-CSE-ConnectionGUID: OpVEzCAsSoaW6AVT1s3wKQ==
X-CSE-MsgGUID: +kdF4wBhR8+O8zYogwmtAg==
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="47129845"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Sep 2025 12:50:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 16 Sep 2025 12:50:17 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 16 Sep 2025 12:50:17 -0700
From: <Ryan.Wanner@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <sre@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: power: reset: atmel,sama5d2-shdwc: add lpm binding
Date: Tue, 16 Sep 2025 12:50:30 -0700
Message-ID: <d8fc40a97008cb0b4001684b3c9e1cc4bf3fb706.1758051358.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758051358.git.Ryan.Wanner@microchip.com>
References: <cover.1758051358.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_125051_954199_DED64FA1 
X-CRM114-Status: UNSURE (   8.21  )
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

From: Varshini Rajendran <varshini.rajendran@microchip.com>

Add microchip,lpm-connection binding which allows to specify the devices
the SHDWC's Low Power Mode pin is connected to.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
[ryan.wanner@microchip.com: Add sam9x7-shdwc SoC to properties check]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../power/reset/atmel,sama5d2-shdwc.yaml      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml b/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
index 9c34249b2d6d..668b541eb44c 100644
--- a/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
+++ b/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
@@ -56,6 +56,13 @@ properties:
     description: enable real-time timer wake-up
     type: boolean
 
+  microchip,lpm-connection:
+    description:
+      List of phandles to devices which are connected to SHDWC's Low Power Mode Pin.
+      The LPM pin is used to idicate to an external power supply or device to enter
+      or exit a special powering state.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
 patternProperties:
   "^input@[0-15]$":
     description:
@@ -96,6 +103,18 @@ allOf:
       properties:
         atmel,wakeup-rtt-timer: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - atmel,sama5d2-shdwc
+              - microchip,sam9x60-shdwc
+              - microchip,sam9x7-shdwc
+    then:
+      properties:
+        microchip,lpm-connection: false
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


