Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626C8CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GX+sTdpEzTQBrbSJ0pcywLand2fAZwDGOC6xpowTvg=; b=1Y+nUyTyZwp99c+D6ul7s/KDbS
	G37lnNfGVWhL5YNOAkcUSPuoastQGIE1KdHDIiu+jZGNOGkOKGHRrIV0OV3mrSt2TAqhkoL3HYpZl
	g/2PoB19aTvo1GnJFH1jsi5ve0ky1NjeVQHMz9NI/WLrXDKbfTg7iXtGohILYp7yAViF/B+DVX7Ov
	i2Lm4FFCDaXEx8FV+nlKd7N8ZFiHl4dnqeltN+osiBWk6Xn9U/XH+lChDf3+waB8Rf3BAwOVfFXMP
	TEtSO8ILGiwMowm3te3eWIkNA8aC93uTO8/2TjqUOusLdPss+VZUCSwzTeuQcFhpcTQq1aqJxgNLM
	aE/Mk44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNak-0000000FRp9-11GH;
	Wed, 10 Sep 2025 16:22:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNaf-0000000FRl4-1cvp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757521357; x=1789057357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=scNnRW/xaf/hHxWjoSyQk47lXv/bg4g6PJeBtBDImSg=;
  b=NyWFEwztc0pffGYRUZCeWZHga6AYxtWkY+sidc9Pe5air/a2Diaonkre
   SgdNrAKUN7C85//78ED4N5KJcwQpWfmm3/UGjrHl06fRUgIG8Nu3aY7IL
   s0DotAV/14ax4dOVOiPDTVzb0vnx7OzHNqviL6Ivus0ww29P2qj2tESDg
   E8GvsUcigeHQu+51FKRjHIiT7E+kalsHbfKxE6doEogwsLTisuw7OIGZG
   3u4A7HDnePUNdA2FMOYYKMQZPw/hqMxAJvARS416xvM4DWDBuWIQZIoH0
   yxjp4SziKgEp+YnyyPv4U/01UKfKV8v8sRz282GPALJQMsuOpT85oPJ/C
   g==;
X-CSE-ConnectionGUID: yOp9HMF6QSeW0ZytE26RNg==
X-CSE-MsgGUID: iiaFCm9vSaC9R8K+buWEdQ==
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="46875548"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Sep 2025 09:22:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 10 Sep 2025 09:22:10 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 10 Sep 2025 09:22:10 -0700
From: <Ryan.Wanner@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <sre@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>
Subject: [PATCH 1/4] dt-bindings: power: reset: atmel,sama5d2-shdwc: add lpm binding
Date: Wed, 10 Sep 2025 09:20:36 -0700
Message-ID: <71c7d25f64612ca9571aa544be8f2651be8fe33e.1757519351.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757519351.git.Ryan.Wanner@microchip.com>
References: <cover.1757519351.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_092237_495249_58174DE1 
X-CRM114-Status: UNSURE (   8.49  )
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
the SHDWC's LPM pin is connected.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
[ryan.wanner@microchip.com: Add sam9x7-shdwc SoC to properties check]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../power/reset/atmel,sama5d2-shdwc.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml b/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
index 9c34249b2d6d..b1a8ccd0873d 100644
--- a/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
+++ b/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
@@ -56,6 +56,10 @@ properties:
     description: enable real-time timer wake-up
     type: boolean
 
+  microchip,lpm-connection:
+    description: list of phandles to devices which are connected to SHDWC's LPM pin
+    $ref: /schemas/types.yaml#/definitions/phandle
+
 patternProperties:
   "^input@[0-15]$":
     description:
@@ -96,6 +100,18 @@ allOf:
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


