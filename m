Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D69CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtvh1YoOiQl867tJFDiM88MLLi5+Jw1YB5zZVJ93V/w=; b=eUHXDDM++vgdnVk43uRbuZtrlk
	Pew79Cbhy8n1TYDwm0O5tMK89y93NCPEnRK/nIQSEHex0/cfjK6q42TzaE/Za2ascRJsndIN7dCry
	guNaw/6SSAjwljYh/C8TBbig6mANTDoa9F07FEeAhbkWOJ8ivfSjJ2Kv6ClWekq8oCuw7yQoBUlL3
	0xIp5B3yrpDmGjfNqsZarnHJJ3kuNidb+y6hbYcJG8Rtzo7bdOTcd/3mheeOUf3IkARH0OtUqDlYn
	RrI7R22A6Ui9qsPJT9w6h38YiUvJ7+3H9ZyEXJbh1YNntC9ySDV1qf/PpOGpBrA8RatYGmC5aTKbu
	uvgNhhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKys0-0000000G8rJ-0Coc;
	Mon, 17 Nov 2025 13:02:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyrx-0000000G8qI-3iOE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 13:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763384529; x=1794920529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iyt5FrNViiDTxs8hANwrQy+GhySDoTf5XEItkyhr++U=;
  b=QztuZrCB9T3o06M+/Gd9jm7Ek2sIIq2+OQLMzft9DjGzwfP3Qk7EX8Y6
   KU0nEIckAUwzTI3KqA0NWlnpnGfhqmI1CRTBquUFM8uCfSJHUmRY+PCjn
   xhxfIiTgghdKebldLGml3GZH4d0xF4uyvOk5ojHT6tEtaQusSBHhPznft
   PKwTZOcSDqp0uZVo6YuevDOYAj0S7xpYV7Bhor26qRFKD+FUOFVU+P9dG
   SS8Ey1fvcdXcDJU1IrNgLXm9ngqevNLV3sepoIMHSlxYqpFjFZwgrCd3F
   VAMgUfLib8mtCpPJXqrEGpBYxAUVVuwcUTXtxgiR4gzahsmxC0TXh46wS
   Q==;
X-CSE-ConnectionGUID: 7lVwW72ASwODMHoO4OS9jA==
X-CSE-MsgGUID: HGJKc3lcQp+KwA73g7oDJA==
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="48599210"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 06:02:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Mon, 17 Nov 2025 06:01:45 -0700
Received: from DEN-DL-M31836.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 17 Nov 2025 06:01:43 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <wsa+renesas@sang-engineering.com>,
	<romain.sioen@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH 1/2] dt-bindings: arm: at91: add lan966 pcb8385 board
Date: Mon, 17 Nov 2025 13:57:08 +0100
Message-ID: <20251117125709.102013-2-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117125709.102013-1-horatiu.vultur@microchip.com>
References: <20251117125709.102013-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_050209_985768_963C24D6 
X-CRM114-Status: UNSURE (   8.36  )
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

Add documentation for Microchip LAN9668 PCB8385

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 3a34b7a2e8d4e..68d306d17c2a1 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -235,9 +235,11 @@ properties:
           - const: microchip,lan9662
           - const: microchip,lan966
 
-      - description: Microchip LAN9668 PCB8290 Evaluation Board.
+      - description: Microchip LAN9668 Evaluation Board.
         items:
-          - const: microchip,lan9668-pcb8290
+          - enum:
+              - microchip,lan9668-pcb8290
+              - microchip,lan9668-pcb8385
           - const: microchip,lan9668
           - const: microchip,lan966
 
-- 
2.34.1


