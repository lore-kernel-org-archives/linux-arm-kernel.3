Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94F7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 21:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oq+di+NzafsnZZVYiDGspyVB58VLEjEhOjhN16peJTw=; b=pHoedc7gGBCY0rO7cq6Dj4R6Xn
	BE+jaCTKUHvRWTqReNUcxG4qUPDkbQnc8el40x7wpimwok3NQcfKpt5Wy4ZUJuFE2q/sSvhIjAfP1
	86rmdSfO/zt3OU8vl2H+L42fRCyue6bNxidsXfMiCar1Hkzyq6Wons/QF7dF07xiUfBMIhGhXQSjQ
	IUkxCESnwNgwT3R7RGAeOtAo5psQUCA9BWxlzak17+PO0BS1RvYUCNF2vcdsqoj/F+Jwd3RXx35Yh
	aFUInh56xuGW+xUm4m2fOYjXGdCH4RKbvfL2cavdbE0fWpDwj4Ry2i/aBX7kq2Nx2JQFZE72/0AjK
	rmQ/1y5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbKS-00000001UPO-44bg;
	Mon, 10 Feb 2025 21:28:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thb6X-00000001SVB-172y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739222049; x=1770758049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w2RzJqYLQDLs0eAHKRPSDmffq9ISN4Icv+3CsJAeg28=;
  b=F2+9IEj8Qx2INDaQ41RogAqF6lF2JWzWFO6gkEeNm3MiulJ6VR5TYg1m
   xSEcdKB10CiZOFzxPC7LDikXQehc//Kd5zF0joF0d/rAcim0231vuFbY7
   MPwS5aj0l60ZC4/y6I49Rpb+46FBjR8DJJsV4EKullEZtVYOMsdXDI6t8
   6R/3EaXQJLxAzAHcOAiiXn/nZK/zTBOK4nAzZAaJizcFfn8RK65ryTw1e
   YVvUIohX4THcqYgvo7D9lODkDbpL9Cqp3J15n7tUrJ6eqLUhcz3fuhic9
   fLhOOdN1I/XtSorbcZZpsGAjZ3qeQmF6qr6mLWY1I82yBPEYAaO9idu3e
   A==;
X-CSE-ConnectionGUID: AYqW9AG9RbOJ2Xf8Pt97Yw==
X-CSE-MsgGUID: AglZBN5NShyfNxjZ8zWUqw==
X-IronPort-AV: E=Sophos;i="6.13,275,1732604400"; 
   d="scan'208";a="205027973"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Feb 2025 14:14:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Feb 2025 14:13:46 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 10 Feb 2025 14:13:46 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 05/15] dt-bindings: reset: atmel,at91sam9260-reset: add microchip,sama7d65-rstc
Date: Mon, 10 Feb 2025 14:13:05 -0700
Message-ID: <b78ea6d7b306bca7012cff604b67b65b89b41093.1739221064.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739221064.git.Ryan.Wanner@microchip.com>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_131409_368032_F6161667 
X-CRM114-Status: UNSURE (   8.43  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add SAMA7D65 RSTC compatible to DT bindings documentation. The
sama7d65-rstc is compatible with the sama7g5-rstc.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/reset/atmel,at91sam9260-reset.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
index 98465d26949ee..a1c21c3880f9d 100644
--- a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
@@ -23,6 +23,11 @@ properties:
               - atmel,sama5d3-rstc
               - microchip,sam9x60-rstc
               - microchip,sama7g5-rstc
+
+      - items:
+          - const: microchip,sama7d65-rstc
+          - const: microchip,sama7g5-rstc
+
       - items:
           - const: atmel,sama5d3-rstc
           - const: atmel,at91sam9g45-rstc
-- 
2.43.0


